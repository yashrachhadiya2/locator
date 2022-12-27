
import 'package:flutter/material.dart';
import 'package:locator/provider/homeProvider.dart';
import 'package:locator/view/homeScreen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>HomeScreen(),
        },
      ),
    ),
  );
}