// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:angular/angular.dart';
import 'package:dartmeetup1/main_controller.dart';
import 'package:angular/application_factory.dart';
import 'package:di/annotations.dart';
import 'package:redstone_mapper/mapper_factory.dart';

void main()
{
    bootstrapMapper();
    
    applicationFactory()
          .rootContextType (MainController)
          .run();
    
    
}
