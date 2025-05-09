/*
 * Copyright 2023 The TensorFlow Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *             http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:quiver/check.dart';
import '../bindings/delegates/coreml_delegate.dart';
import '../bindings/types.dart';
import '../delegate.dart';

/// CoreMl Delegate
class CoreMlDelegate implements Delegate {
  Pointer<TfLiteDelegate> _delegate;
  bool _deleted = false;

  @override
  Pointer<TfLiteDelegate> get base => _delegate;

  CoreMlDelegate._(this._delegate);

  factory CoreMlDelegate({CoreMlDelegateOptions? options}) {
    if (options == null) {
      return CoreMlDelegate._(
        tfliteCoreMlDelegateCreate(nullptr),
      );
    }
    return CoreMlDelegate._(tfliteCoreMlDelegateCreate(options.base));
  }

  @override
  void delete() {
    checkState(!_deleted, message: 'CoreMlDelegate already deleted.');
    tfliteCoreMlDelegateDelete(_delegate);
    _deleted = true;
  }
}

/// CoreMlDelegate Options
class CoreMlDelegateOptions {
  Pointer<TfLiteCoreMlDelegateOptions> _options;
  bool _deleted = false;

  Pointer<TfLiteCoreMlDelegateOptions> get base => _options;

  CoreMlDelegateOptions._(this._options);

  factory CoreMlDelegateOptions({
    TfLiteCoreMlDelegateEnabledDevices enabledDevices =
        TfLiteCoreMlDelegateEnabledDevices
            .TfLiteCoreMlDelegateDevicesWithNeuralEngine,
    int coremlVersion = 0,
    int maxDelegatedPartitions = 0,
    int minNodesPerPartition = 2,
  }) {
    return CoreMlDelegateOptions._(TfLiteCoreMlDelegateOptions.allocate(
      enabledDevices,
      coremlVersion,
      maxDelegatedPartitions,
      minNodesPerPartition,
    ));
  }

  void delete() {
    checkState(!_deleted, message: 'CoreMlDelegate already deleted.');
    calloc.free(_options);
    _deleted = true;
  }
}
