import 'package:flutter/material.dart';
import 'package:autostart/autostart.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('auto start manage test'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () => checkAutoStartManager(context),
            child: Text('to auto start manager'),
          ),
        ),
      ),
    );
  }

  void checkAutoStartManager(BuildContext context) async {
    bool isAutoStartPermissionAvailable =
        await Autostart.isAutoStartPermissionAvailable;
    if (isAutoStartPermissionAvailable != null &&
        isAutoStartPermissionAvailable) {
      print('test available ok');
      Autostart.getAutoStartPermission();
    } else {
      print('test available fail');
    }
  }
}
