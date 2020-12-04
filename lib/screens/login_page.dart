import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 15, right: 15),
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.jpg'),
          colorFilter: new ColorFilter.mode(
            Colors.white.withOpacity(0.25),
            BlendMode.dstATop
          ),
          fit: BoxFit.cover
          )
        ),
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/logo.png')),
            SizedBox(height: 25),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo',
                      icon: Icon(Icons.email)
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      icon: Icon(Icons.vpn_key)
                    ),
                  ),
                  SizedBox(height: 10),
                  FlatButton(
                    child: Text('Ingresar'),
                    color: Colors.green[500],
                    textColor: Colors.white,
                    onPressed: () {
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text
                      ).then((_) {
                        Navigator.of(context).pushNamed('/home');
                      }).catchError((e) {
                        print(e);
                      });
                    }
                  )
                ]
              )
            ),
          ]
        )
      )
    );
  }
}

