import 'package:flutter/material.dart';

ThemeData lightmode=ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.white,
    secondary: Colors.white,
  )
);
ThemeData darkmode=ThemeData(
  brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade600,
      secondary: Colors.grey.shade700,
    )
);