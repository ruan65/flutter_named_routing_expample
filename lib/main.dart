import 'package:flutter/material.dart';
import 'package:reso_routing/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routing demo',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class FirstPage extends StatelessWidget {
  final String data;

  FirstPage({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'First Page',
              style: TextStyle(fontSize: 50),
            ),
            Text(data),
            RaisedButton(
              child: Text('Go to the second page'),
              onPressed: () {
                Navigator.of(context).pushNamed('/second',
                    arguments: 'Hello from first page incapsulated');
              },
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String data;

  SecondPage({Key key, @required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Second Page',
              style: TextStyle(fontSize: 50),
            ),
            Text(data),
            RaisedButton(
              child: Text('Go to the first page'),
              onPressed: () {
                Navigator.of(context).pushNamed('/first',
                    arguments: 'Hello from second page incapsulated');
              },
            )
          ],
        ),
      ),
    );
  }
}
