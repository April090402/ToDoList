import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Create',
        iconPath: 'assets/icon/cccc.svg',
        boxColor: Color(0xff92A3FD)
      )
    );
    categories.add(
      CategoryModel(
        name: 'Open',
        iconPath: 'assets/icon/oo.svg',
        boxColor: Color(0xff92A3FD)
      )
    );
    categories.add(
      CategoryModel(
        name: 'Category',
        iconPath: 'assets/icon/ccc.svg',
        boxColor: Color(0xff92A3FD)
      )
    );
    return categories;
  }
}
