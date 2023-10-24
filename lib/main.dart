import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _appVersion = '';

  _MyHomePageState() {
    getAppVersion();
  }

  Future<void> getAppVersion() async {
    String appVersion;

    try {
      appVersion = await AppInfo.appVersion ?? 'unknown';
    } on PlatformException {
      appVersion = 'Faield app version';
    }
    setState(() {
      _appVersion = appVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(_appVersion),
      ),
    );
  }
}

class AppInfo {
  static const MethodChannel _channel = MethodChannel('appInfo');

  static Future<String?> get appVersion async {
    final String? version = await _channel.invokeMethod('getAppVersion');
    return version;
  }
}
