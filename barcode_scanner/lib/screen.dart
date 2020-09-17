import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String barcode = " ";
  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        this.barcode = barcode;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'Camera permission not granted';
        });
      } else {
        setState(() {
          this.barcode = "Unknown Error";
        });
      }
    } on FormatException {
      setState(() {
        this.barcode = null;
      });
    } catch (e) {
      setState(() {
        this.barcode = "Unknown Error";
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          title: Text('Barcode Scanner'),
          backgroundColor: Colors.redAccent,
          
          centerTitle: true,
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.scanner),
                  splashColor: Colors.purple,
                  color: Colors.redAccent,
                  iconSize: 50,
                  onPressed: scan),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  barcode,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                ),
              )
            ],
          ),
        ));
  }
}
