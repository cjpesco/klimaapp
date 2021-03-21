import 'package:klimaapp/services/location.dart';
import 'package:klimaapp/services/networking.dart';

const apiKey = 'put your openweathermap api api key here';
const openWeatherMapUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$openWeatherMapUrl?q=$cityName&appid=${apiKey}&units=metric';
    print(url);

    NetworkHelper networkHelper = new NetworkHelper(url);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location userLocation = new Location();
    await userLocation.getCurrentLocation();
    print(
        'Latitude: ${userLocation.latitude} \nLongitude: ${userLocation.longitude}');

    String url =
        '$openWeatherMapUrl?lat=${userLocation.latitude}&lon=${userLocation.longitude}&appid=${apiKey}&units=metric';
    print(url);

    NetworkHelper networkHelper = new NetworkHelper(url);
    var weatherData = await networkHelper.getData();

    return weatherData;
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
