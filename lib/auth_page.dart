import 'package:flutapp/LoginScreen.dart';
import 'package:flutapp/SignUpScreen.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  Widget build(BuildContext context) => isLogin
      ? LoginScreen(onClickedSignUp: toggle)
      : SignUpScreen(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
