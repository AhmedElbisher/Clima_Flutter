import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String APIKey = "1e7f0842cbd37d8eafd5bdaded741aa0";
const String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper("$baseUrl?q=$cityName&appid=$APIKey&units=metric");
    var weather = await networkHelper.getData();
    return weather;
  }

  Future<dynamic> getLocationWeather() async {
    var location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longtiude);
    NetworkHelper networkHelper = NetworkHelper(
        "$baseUrl?lat=${location.latitude}&lon=${location.longtiude}&appid=$APIKey&units=metric");
    var weather = await networkHelper.getData();
    return weather;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
