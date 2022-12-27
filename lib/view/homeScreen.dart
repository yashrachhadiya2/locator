import 'package:flutter/material.dart';
import 'package:locator/provider/homeProvider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeProviderState();
}

class _HomeProviderState extends State<HomeScreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {
    homeProviderTrue =  Provider.of<HomeProvider>(context, listen: true);
    homeProviderFalse=  Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: ()async{
              if(await Permission.location.isDenied)
                {
                  Permission.location.request();
                }
            }, icon: Icon(Icons.location_on),),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  homeProviderFalse!.getPosition();
                },
                child: Text("Location"),
              ),
              SizedBox(height: 50,),
              Text("${homeProviderTrue!.lon}/${homeProviderTrue!.lat}"),
              SizedBox(height: 30,),
              Text("${homeProviderTrue!.pl}"),

            ],
          ),
        ),
      ),
    );
  }
}
