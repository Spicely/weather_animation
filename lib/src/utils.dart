part of '../weather_animation.dart';

class WeatherUtils {
  /// 存储图片
  static _WeatherImage? _weatherImage;

  /// 通过assets路径，获取资源图片
  static Future<ui.Image> load(String asset) async {
    ByteData data = await rootBundle.load('packages/weather_animation/$asset');
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  static bool isSnowRain(WeatherType weatherType) {
    return isRainy(weatherType) || isSnow(weatherType);
  }

  /// 判断是否下雨，小中大包括雷暴，都是属于雨的类型
  static bool isRainy(WeatherType weatherType) {
    return weatherType == WeatherType.lightRainy || weatherType == WeatherType.middleRainy || weatherType == WeatherType.heavyRainy || weatherType == WeatherType.thunder;
  }

  /// 判断是否下雪
  static bool isSnow(WeatherType weatherType) {
    return weatherType == WeatherType.lightSnow || weatherType == WeatherType.middleSnow || weatherType == WeatherType.heavySnow;
  }

  // 根据天气类型获取背景的颜色值
  static List<Color> getColor(WeatherType weatherType) {
    switch (weatherType) {
      case WeatherType.sunny:
        return const [Color(0xFF0071D1), Color(0xFF6DA6E4)];
      case WeatherType.sunnyNight:
        return const [Color(0xFF061E74), Color(0xFF275E9A)];
      case WeatherType.cloudy:
        return const [Color(0xFF5C82C1), Color(0xFF95B1DB)];
      case WeatherType.cloudyNight:
        return const [Color(0xFF2C3A60), Color(0xFF4B6685)];
      case WeatherType.overcast:
        return const [Color(0xFF8FA3C0), Color(0xFF8C9FB1)];
      case WeatherType.lightRainy:
        return const [Color(0xFF556782), Color(0xFF7c8b99)];
      case WeatherType.middleRainy:
        return const [Color(0xFF3A4B65), Color(0xFF495764)];
      case WeatherType.heavyRainy:
      case WeatherType.thunder:
        return const [Color(0xFF3B434E), Color(0xFF565D66)];
      case WeatherType.hazy:
        return const [Color(0xFF989898), Color(0xFF4B4B4B)];
      case WeatherType.foggy:
        return const [Color(0xFFA6B3C2), Color(0xFF737F88)];
      case WeatherType.lightSnow:
        return const [Color(0xFF6989BA), Color(0xFF9DB0CE)];
      case WeatherType.middleSnow:
        return const [Color(0xFF8595AD), Color(0xFF95A4BF)];
      case WeatherType.heavySnow:
        return const [Color(0xFF98A2BC), Color(0xFFA7ADBF)];
      case WeatherType.dusty:
        return const [Color(0xFFB99D79), Color(0xFF6C5635)];
      default:
        return const [Color(0xFF0071D1), Color(0xFF6DA6E4)];
    }
  }

  // 根据天气类型获取天气的描述信息
  static String getWeatherDesc(WeatherType weatherType) {
    switch (weatherType) {
      case WeatherType.sunny:
      case WeatherType.sunnyNight:
        return "晴";
      case WeatherType.cloudy:
      case WeatherType.cloudyNight:
        return "多云";
      case WeatherType.overcast:
        return "阴";
      case WeatherType.lightRainy:
        return "小雨";
      case WeatherType.middleRainy:
        return "中雨";
      case WeatherType.heavyRainy:
        return "大雨";
      case WeatherType.thunder:
        return "雷阵雨";
      case WeatherType.hazy:
        return "雾";
      case WeatherType.foggy:
        return "霾";
      case WeatherType.lightSnow:
        return "小雪";
      case WeatherType.middleSnow:
        return "中雪";
      case WeatherType.heavySnow:
        return "大雪";
      case WeatherType.dusty:
        return "浮尘";
      default:
        return "晴";
    }
  }
}
