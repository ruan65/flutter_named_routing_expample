import 'package:flutter/material.dart';
import 'package:reso_routing/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (ctx) => FirstPage(data: 'initial app started data',));

      case '/second':
        if (args is String) {
          return MaterialPageRoute(
              builder: (ctx) => SecondPage(
                    data: args,
                  ));
        }
        return _errorRoute();

      case '/first':
        if (args is String) {
          return MaterialPageRoute(
              builder: (ctx) => FirstPage(
                    data: args,
                  ));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute _errorRoute() => MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(title: Text('Error')),
      body: Center(child: Text('ERROR: Page not found'),),
    )
  );
}
