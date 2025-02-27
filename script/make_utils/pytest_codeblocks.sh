#!/usr/bin/env bash

set -e

TEST_DIR="/tmp/cml_codeblocks"
rm -rf "${TEST_DIR}"
mkdir -p "${TEST_DIR}"

# grep -v "^\./\." is to avoid files in .hidden_directories
# grep -v "api/concrete\.ml" is to avoid autogen API doc since lazydocs produces bad python blocks
MD_FILES=$(find . -type f -name "*.md" | grep -v "^\./\." | grep -v "api/concrete\.ml")

# Force NCPU to 1, since using parallel checks makes issues on linux or CI
NCPU=1

while [ -n "$1" ]
do
   case "$1" in
        "--file" )
            shift
            MD_FILES="$1"
            NCPU=1
            ;;

        *)
            echo "Unknown param : $1"
            exit 1
            ;;
   esac
   shift
done

DEST_MDS=()

for MD_FILE in $MD_FILES
do
    DEST_MD="${TEST_DIR}/${MD_FILE}"
    NEW_DIR=$(dirname "${DEST_MD}")
    mkdir -p "$NEW_DIR"
    cp "${MD_FILE}" "${DEST_MD}"
    DEST_MDS+=("${DEST_MD}")
done

poetry run python ./script/make_utils/deactivate_docs_admonitions_for_tests.py \
    --files "${DEST_MDS[@]}"

set -x

if [ $NCPU -ne 1 ]
then
    poetry run pytest --codeblocks -svv \
        --capture=tee-sys \
        -n "${NCPU}" \
        --randomly-dont-reorganize \
        --randomly-dont-reset-seed "${TEST_DIR}" \
        --durations=10
else
    poetry run pytest --codeblocks -svv \
        --capture=tee-sys \
        --randomly-dont-reorganize \
        --randomly-dont-reset-seed "${TEST_DIR}" \
        --durations=10
fi

set +x

rm -rf "${TEST_DIR}"

# Remove onnx files created while running the codeblocks
rm -f "tmp.model.onnx"
rm -f "tmp.onnx"
