import 'package:flutter/material.dart';
import 'screen.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Barcode Scanner',
    home: ScanScreen(),
  ));
}
