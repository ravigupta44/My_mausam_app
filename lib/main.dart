

import 'package:flutter/material.dart';
import 'package:mausam_app/Activity/home.dart';
import 'package:mausam_app/Activity/loading.dart';
import 'package:mausam_app/Activity/location.dart';

void main() {
  
  runApp(
    
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (BuildContext context) => Loading(),
        "/home" : (BuildContext context) => Home(),
        "/loading":(BuildContext context)=>Loading(),
      },
    ));
    
}

