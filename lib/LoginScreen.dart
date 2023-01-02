import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutapp/main.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginScreen({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: StadiumBorder(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ));
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(12),
                child: Center(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 110,
                    ),
                    Image.asset(
                      'assets/new.PNG',
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: 177,
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    SizedBox(
                      height: 50,
                      width: 350,
                      child: TextFormField(
                        controller: emailController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            hintStyle: TextStyle(fontFamily: "WorkSansLight"),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(90.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            hintText: 'Enter your email'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 50,
                      width: 350,
                      child: TextFormField(
                        controller: passwordController,
                        style: TextStyle(color: Colors.black),
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.black,
                            ),
                            hintStyle: TextStyle(fontFamily: "WorkSansLight"),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(90.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            hintText: 'Password'),
                      ),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      style: style,
                      onPressed: signIn,
                      // onPressed: () {
                      //   Navigator.push(
                      //       context,
                      //       new MaterialPageRoute(
                      //           builder: (context) => HomeScreen()));
                      // },
                      child: Text("Login"),
                    ),
                    SizedBox(height: 40),
                    TextButton(
                      style: TextButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      child: Text("Register here.."),
                      onPressed: widget.onClickedSignUp,
                      // onPressed: () {
                      //   print("Register");
                      // },
                    ),
                  ],
                )))));
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage logoAsset = AssetImage('images/new.png');
    Image image = Image(image: logoAsset, width: 400, height: 400);
    return Container(
      child: image,
    );
  }
}
