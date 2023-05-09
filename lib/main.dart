// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
// #docregion platform_imports
// Import for Android features.
import 'package:webview_flutter_example/screens/login.dart';
// Import for iOS features.
import 'package:flutter_webview_pro/webview_flutter.dart';
// #enddocregion platform_imports

void main() => runApp(MaterialApp(
      routes: {
        '/': (context) => LoginScreen(),
        '/webview': (context) => WebViewExample(),
      },
    ));

class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final url = Uri.parse(args['data']['url']);
    final token = url.queryParameters['token'];
    final host = 'https://mobile-dev.sop-fpt.online';
    final urlWithToken = Uri.parse('$host/?token=$token');
    return SafeArea(
      child: Scaffold(
          body: WebView(
        initialUrl: urlWithToken.toString(),
        javascriptMode: JavascriptMode.unrestricted,
        onProgress: (int progress) {
          print("WebView is loading (progress : $progress%)");
        },
        javascriptChannels: <JavascriptChannel>{},
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
        geolocationEnabled: false, //support geolocation or not
      )),
    );
  }
}
