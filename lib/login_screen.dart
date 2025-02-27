import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/colors.dart';
import 'package:login/constants.dart';
import 'package:login/home_screen.dart';
//OkczfQKX7LcmgegUQtyozVJDfL53

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  late String _email, _password;

  void signIn(context) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _password)
        .catchError((onError) {
          print(onError);
        })
        .then((authUser) {
          if (authUser.user != null)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          //OkczfQKX7LcmgegUQtyozVJDfL53
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widght = MediaQuery.of(context).size.width;
    print(height);
    print(widght);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        bgImage,
                        height: height * 0.40,
                        width: widght,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: height * 0.42,
                        width: widght,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            stops: [0.3, 0.7],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors
                                  .transparent, // ite means there is no change in colors
                              Colors.white,
                            ],
                          ),
                        ),
                        //color: Colors.orange.withValues(alpha: 0.3),
                      ),
                      Positioned(
                        bottom: 30,
                        left: 0, //we should give left and right
                        right: 0,
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                              text: appName + "\n",
                              children: [
                                TextSpan(
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                  text: slogan,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 20),
                    child: Container(
                      child: Text(
                        " $login ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            primaryColors.withValues(alpha: 0.3),
                            Colors.transparent,
                          ],
                        ),
                        border: Border(
                          left: BorderSide(color: primaryColors, width: 5),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      onSaved: (value) {
                        _email = value.toString();
                      },
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Enter Your Email";
                        else if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        ).hasMatch(value))
                          return "Its not a valid Email";
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email Address",
                        labelStyle: TextStyle(
                          color: primaryColors,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    child: TextFormField(
                      onSaved: (value) {
                        _password = value.toString();
                      },
                      validator: (pass) {
                        if (pass!.isEmpty)
                          return "Enter Enter Password";
                        else if (pass.length < 8 || pass.length > 15)
                          return "Password Lenght is incorect";
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        prefixIcon: Icon(Icons.password),
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: primaryColors,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(forgotPassword),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: height * 0.08,
                      width: widght - 30,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            signIn(context);

                            // if (_email == "pugal@gmail.com" &&
                            //     _password == "pugal500*") {
                            //   //FocusScope.of(context).unfocus();
                            //
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) {
                            //         return HomeScreen();
                            //       },
                            //     ),
                            //   );
                            // } else {
                            //   print("invalid Login Details");
                            // }

                            // print(_email);
                            // print(_password);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.green, // Set button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ), // Set text color
                        ),
                        child: Text(
                          "Login to account",
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont' have an account?"),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Create account",
                          style: TextStyle(color: primaryColors, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
