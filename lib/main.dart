import "package:flutter/material.dart";
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: myApp(),
  ));
}

// Manifest 2 file .. add karvni

// <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
// <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permission"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await openAppSettings();
              },
              icon: Icon(Icons.settings)),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Request Permission"),
              onPressed: () async {
                PermissionStatus status = await Permission.location.request();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$status"),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ),
                );

                if (status == PermissionStatus.granted) {
                  print("Grants...");
                } else {
                  print("Denied....");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
