<!-- markdownlint-disable -->

<a href="../../../src/concrete/ml/sklearn/qnn.py#L0"><img align="right" style="float:right;" src="https://img.shields.io/badge/-source-cccccc?style=flat-square"></a>

# <kbd>module</kbd> `concrete.ml.sklearn.qnn`

Scikit-learn interface for fully-connected quantized neural networks.

## **Global Variables**

- **QNN_AUTO_KWARGS**

______________________________________________________________________

<a href="../../../src/concrete/ml/sklearn/qnn.py#L58"><img align="right" style="float:right;" src="https://img.shields.io/badge/-source-cccccc?style=flat-square"></a>

## <kbd>class</kbd> `NeuralNetRegressor`

A Fully-Connected Neural Network regressor with FHE.

This class wraps a quantized neural network implemented using Torch tools as a scikit-learn estimator. The skorch package allows to handle training and scikit-learn compatibility, and adds quantization as well as compilation functionalities. The neural network implemented by this class is a multi layer fully connected network trained with Quantization Aware Training (QAT).

Inputs and targets that are float64 will be casted to float32 before training as Torch does not handle float64 types properly. Thus should not have a significant impact on the model's performances. An error is raised if these values are not floating points.

<a href="../../../src/concrete/ml/sklearn/qnn.py#L76"><img align="right" style="float:right;" src="https://img.shields.io/badge/-source-cccccc?style=flat-square"></a>

### <kbd>method</kbd> `__init__`

```python
__init__(
    criterion=<class 'torch.nn.modules.loss.MSELoss'>,
    optimizer=<class 'torch.optim.adam.Adam'>,
    lr=0.01,
    max_epochs=10,
    batch_size=128,
    iterator_train=<class 'torch.utils.data.dataloader.DataLoader'>,
    iterator_valid=<class 'torch.utils.data.dataloader.DataLoader'>,
    dataset=<class 'skorch.dataset.Dataset'>,
    train_split=None,
    callbacks=None,
    predict_nonlinearity='auto',
    warm_start=False,
    verbose=1,
    device='cpu',
    **kwargs
)
```

______________________________________________________________________

#### <kbd>property</kbd> base_module

Get the Torch module.

**Returns:**

- <b>`SparseQuantNeuralNetwork`</b>:  The fitted underlying module.

______________________________________________________________________

#### <kbd>property</kbd> fhe_circuit

______________________________________________________________________

#### <kbd>property</kbd> history

______________________________________________________________________

#### <kbd>property</kbd> input_quantizers

Get the input quantizers.

**Returns:**

- <b>`List[UniformQuantizer]`</b>:  The input quantizers.

______________________________________________________________________

#### <kbd>property</kbd> is_compiled

Indicate if the model is compiled.

**Returns:**

- <b>`bool`</b>:  If the model is compiled.

______________________________________________________________________

#### <kbd>property</kbd> is_fitted

Indicate if the model is fitted.

**Returns:**

- <b>`bool`</b>:  If the model is fitted.

______________________________________________________________________

#### <kbd>property</kbd> onnx_model

Get the ONNX model.

Is None if the model is not fitted.

**Returns:**

- <b>`onnx.ModelProto`</b>:  The ONNX model.

______________________________________________________________________

#### <kbd>property</kbd> output_quantizers

Get the output quantizers.

**Returns:**

- <b>`List[UniformQuantizer]`</b>:  The output quantizers.

______________________________________________________________________

<a href="../../../src/concrete/ml/sklearn/qnn.py#L125"><img align="right" style="float:right;" src="https://img.shields.io/badge/-source-cccccc?style=flat-square"></a>

### <kbd>method</kbd> `fit`

```python
fit(
    X: Union[ndarray, Tensor, ForwardRef('DataFrame'), List],
    y: Union[ndarray, Tensor, ForwardRef('DataFrame'), ForwardRef('Series'), List],
    *args,
    **kwargs
)
```

______________________________________________________________________

<a href="../../../src/concrete/ml/sklearn/qnn.py#L143"><img align="right" style="float:right;" src="https://img.shields.io/badge/-source-cccccc?style=flat-square"></a>

### <kbd>method</kbd> `fit_benchmark`

```python
fit_benchmark(
    X: Union[ndarray, Tensor, ForwardRef('DataFrame'), List],
    y: Union[ndarray, Tensor, ForwardRef('DataFrame'), ForwardRef('Series'), List],
    *args,
    **kwargs
)
```

______________________________________________________________________

<a href="../../../src/concrete/ml/sklearn/qnn.py#L166"><img align="right" style="float:right;" src="https://img.shields.io/badge/-source-cccccc?style=flat-square"></a>

### <kbd>method</kbd> `predict`

```python
predict(
    X: Union[ndarray, Tensor, ForwardRef('DataFrame'), List],
    fhe: Union[FheMode, str] = <FheMode.DISABLE: 'disable'>
) → ndarray
```

______________________________________________________________________

<a href="../../../src/concrete/ml/sklearn/qnn.py#L160"><img align="right" style="float:right;" src="https://img.shields.io/badge/-source-cccccc?style=flat-square"></a>

### <kbd>method</kbd> `predict_proba`

```python
predict_proba(
    X: Union[ndarray, Tensor, ForwardRef('DataFrame'), List],
    fhe: Union[FheMode, str] = <FheMode.DISABLE: 'disable'>
) → ndarray
```

______________________________________________________________________

<a href="../../../src/concrete/ml/sklearn/qnn.py#L180"><img align="right" style="float:right;" src="https://img.shields.io/badge/-source-cccccc?style=flat-square"></a>

## <kbd>class</kbd> `NeuralNetClassifier`

A Fully-Connected Neural Network classifier with FHE.

This class wraps a quantized neural network implemented using Torch tools as a scikit-learn estimator. The skorch package allows to handle training and scikit-learn compatibility, and adds quantization as well as compilation functionalities. The neural network implemented by this class is a multi layer fully connected network trained with Quantization Aware Training (QAT).

Inputs that are float64 will be casted to float32 before training as Torch does not handle float64 types properly. Thus should not have a significant impact on the model's performances. If the targets are integers of lower bit-width, they will be safely casted to int64. Else, an error is raised.

<a href="../../../src/concrete/ml/sklearn/qnn.py#L199"><img align="right" style="float:right;" src="https://img.shields.io/badge/-source-cccccc?style=flat-square"></a>

### <kbd>method</kbd> `__init__`

```python
__init__(
    criterion=<class 'torch.nn.modules.loss.CrossEntropyLoss'>,
    optimizer=<class 'torch.optim.adam.Adam'>,
    classes=None,
    lr=0.01,
    max_epochs=10,
    batch_size=128,
    iterator_train=<class 'torch.utils.data.dataloader.DataLoader'>,
    iterator_valid=<class 'torch.utils.data.dataloader.DataLoader'>,
    dataset=<class 'skorch.dataset.Dataset'>,
    train_split=None,
    callbacks=None,
    predict_nonlinearity='auto',
    warm_start=False,
    verbose=1,
    device='cpu',
    **kwargs
)
```

______________________________________________________________________

#### <kbd>property</kbd> base_module

Get the Torch module.

**Returns:**

- <b>`SparseQuantNeuralNetwork`</b>:  The fitted underlying module.

______________________________________________________________________

#### <kbd>property</kbd> classes\_

______________________________________________________________________

#### <kbd>property</kbd> fhe_circuit

______________________________________________________________________

#### <kbd>property</kbd> history

______________________________________________________________________

#### <kbd>property</kbd> input_quantizers

Get the input quantizers.

**Returns:**

- <b>`List[UniformQuantizer]`</b>:  The input quantizers.

______________________________________________________________________

#### <kbd>property</kbd> is_compiled

Indicate if the model is compiled.

**Returns:**

- <b>`bool`</b>:  If the model is compiled.

______________________________________________________________________

#### <kbd>property</kbd> is_fitted

Indicate if the model is fitted.

**Returns:**

- <b>`bool`</b>:  If the model is fitted.

______________________________________________________________________

#### <kbd>property</kbd> onnx_model

Get the ONNX model.

Is None if the model is not fitted.

**Returns:**

- <b>`onnx.ModelProto`</b>:  The ONNX model.

______________________________________________________________________

#### <kbd>property</kbd> output_quantizers

Get the output quantizers.

**Returns:**

- <b>`List[UniformQuantizer]`</b>:  The output quantizers.

______________________________________________________________________

<a href="../../../src/concrete/ml/sklearn/qnn.py#L250"><img align="right" style="float:right;" src="https://img.shields.io/badge/-source-cccccc?style=flat-square"></a>

### <kbd>method</kbd> `fit`

```python
fit(
    X: Union[ndarray, Tensor, ForwardRef('DataFrame'), List],
    y: Union[ndarray, Tensor, ForwardRef('DataFrame'), ForwardRef('Series'), List],
    *args,
    **kwargs
)
```

______________________________________________________________________

<a href="../../../src/concrete/ml/sklearn/qnn.py#L276"><img align="right" style="float:right;" src="https://img.shields.io/badge/-source-cccccc?style=flat-square"></a>

### <kbd>method</kbd> `fit_benchmark`

```python
fit_benchmark(
    X: Union[ndarray, Tensor, ForwardRef('DataFrame'), List],
    y: Union[ndarray, Tensor, ForwardRef('DataFrame'), ForwardRef('Series'), List],
    *args,
    **kwargs
)
```

______________________________________________________________________

<a href="../../../src/concrete/ml/sklearn/qnn.py#L297"><img align="right" style="float:right;" src="https://img.shields.io/badge/-source-cccccc?style=flat-square"></a>

### <kbd>method</kbd> `predict`

```python
predict(
    X: Union[ndarray, Tensor, ForwardRef('DataFrame'), List],
    fhe: Union[FheMode, str] = <FheMode.DISABLE: 'disable'>
) → ndarray
```

______________________________________________________________________

<a href="../../../src/concrete/ml/sklearn/qnn.py#L287"><img align="right" style="float:right;" src="https://img.shields.io/badge/-source-cccccc?style=flat-square"></a>

### <kbd>method</kbd> `predict_proba`

```python
predict_proba(
    X: Union[ndarray, Tensor, ForwardRef('DataFrame'), List],
    fhe: Union[FheMode, str] = <FheMode.DISABLE: 'disable'>
) → ndarray
```
