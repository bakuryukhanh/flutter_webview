//create a login screen have a input field for code and a button to submit

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = '1000770903';
  }

  //call api to get the login url
  //open the url in webview

  requestLogin() async {
    var response = await http.post(
      Uri.https('gateway-sop-dev.fpt.vn',
          '/auth-service/api/auth-service/sign-in/sale-club'),
      body: jsonEncode({
        "AccountId": _controller.text,
        "ValidateKey":
            "6c7c2b352c2aaacbf3db1b7d8daf90498a45a535182bceabe9eb73ceda387f24"
      }),
      headers: {
        'Content-Type': 'application/json',
        "Authorization":
            "QUm0gOythhpH06e+Cm1HSl+VvYfq5SvGIBSqKWEICkk0cpKnZbbCbvX0uH4sCvqYFepKaokc6p3KafFrZiIn6tOhmX8fkYpcbIE836ByHmSvYbFHF1jpnzmTbTCvCI3Y/RX8aCRsdbp14RGlfwtu/b76SSCJMMUSquoinY4A7C+0BQ5vkTAUZHjhNODKua+Hfzw+/nKslLlnhkCjk8bfS5YOjzEeT4Y98PX3ANDpeUt7JBKoegFTjnL9heY/hC6mW3LN1wnJlRzqfyZYTam0KM5ZVAA0t3GA5kiVF+OJptfDW0AiiAiOwTYkxPuyjCj+V+xQsLI/KyTG9kFDw1eQXQ=="
      },
    );
    Navigator.pushNamed(context, '/webview',
        arguments: jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enter your code',
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Code',
              ),
              controller: _controller,
            ),
            ElevatedButton(
              onPressed: () {
                requestLogin();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
