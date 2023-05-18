import 'package:age/db/models/age_model.dart';
import 'package:flutter/material.dart';

final Size size =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
double sWidth = size.width;
double sHeight = size.height;
const String dbTask = "task_db";
AgeModel ageModelToUpdate = AgeModel(name: "name", age: 'age');
