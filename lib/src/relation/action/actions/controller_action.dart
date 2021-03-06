// Copyright (c) 2019-present,  SurfStudio LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/widgets.dart' show ValueNotifier;
import 'package:relation/src/relation/action/action.dart';

/// Wrapper on controller
class ControllerAction<T, C extends ValueNotifier<T>> extends Action<T> {
  /// Some ValueNotifier
  final C controller;

  ControllerAction(this.controller, void Function(C controller, ControllerAction) onChanged)
      : super() {
    controller.addListener(() {
      onChanged(controller, this);
    });
  }

  @override
  Future<void> call([T data]) {
    controller.value = data;
    return null;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
