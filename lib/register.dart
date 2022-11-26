import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
import 'package:login/user.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  String url = "http://10.0.2.2:8080/register";
  Future save() async {
    var res = await http.post(url,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode(
            {'id': 1234, 'email': user.email, 'password': user.password}));
    print(res.body);
    if (res.body != null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 900,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 0, 0, 1),
                ),
                //boxShadow:[BoxShadow(blurRadius: 10, color:Colors.black, offset: Offset(1,5))],
                //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80),bottomRight: Radius.circular(70) )),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text("Register",
                          style: GoogleFonts.lobster(
                            fontWeight: FontWeight.normal,
                            fontSize: 50,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Email",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                            )),
                      ),
                      TextFormField(
                        controller: TextEditingController(text: user.email),
                        onChanged: (val) {
                          user.email = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is Empty';
                          }
                          return '';
                        },
                        style: TextStyle(fontSize: 30, color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      Container(
                        height: 8,
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Password",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                            )),
                      ),
                      TextFormField(
                        controller: TextEditingController(text: user.password),
                        onChanged: (val) {
                          user.password = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is Empty';
                          }
                          return '';
                        },
                        style: TextStyle(fontSize: 30, color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      Container(
                        height: 8,
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text("Already have Account ?",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        child: FlatButton(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            onPressed: () {
                              //if(_formKey.currentState.validated()){
                              save();
                              //}
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                              size: 30,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}
