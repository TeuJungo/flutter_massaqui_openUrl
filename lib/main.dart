import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Massaqui System'),
        ),
        body: const Center(
          child: LaunchButton(),
        ),
      ),
    );
  }
}

class LaunchButton extends StatelessWidget {
  const LaunchButton({super.key});

  Future<void> _openUrl(String path) async {
    Uri url = Uri.parse(path);
    if (!await launchUrl(url)) {
      throw Exception('Não foi possível abrir o site: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        onPressed: () async {
          await _openUrl("tel://+244937787841");
        },
        child: const Text('Call +244937787841'),
      ),
      ElevatedButton(
        onPressed: () async {
          await _openUrl("https://massaquisystem.ao");
        },
        child: const Text('Open site'),
      )
    ]);
  }
}
