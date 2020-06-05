import 'package:geolocator/geolocator.dart';

class Location {
  double longtiude;
  double latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longtiude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
