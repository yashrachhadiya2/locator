import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomeProvider extends ChangeNotifier{


  double? lon=0,lat=0;
  List pl =[];

  void getPosition()async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lon = position.longitude;
    lat = position.latitude;

    List placemark = await placemarkFromCoordinates(lat!, lon!);
    pl = placemark;
    notifyListeners();
  }
}