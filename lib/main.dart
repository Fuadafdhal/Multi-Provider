import 'package:flutter/material.dart';
import 'package:multi_provider/height_provider.dart';
import 'package:multi_provider/home_page.dart';
import 'package:multi_provider/weight_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<WeightProvider>(
          create: (context) => WeightProvider()),
      ChangeNotifierProvider<HeightProvider>(
          create: (context) => HeightProvider())
    ], child: MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
  }
  //MaterialApp(debugShowCheckedModeBanner: false, home: HomePage())
}
