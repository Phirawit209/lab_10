import 'package:flutter/material.dart';
import 'package:lab_10/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State <Login> createState() => _LoginPageState();
}

class _LoginPageState import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //--------------------firebase instace-------------------
  FirebaseAuth _auth = FirebaseAuth.instance;

  //--------------------firebase instace-------------------

  static Future<void> registerProcess (String _email,String _password) async {
    try {
      final Credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _email,
    password: _password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The Password provided is too weak.');
    } else if (e.code == 'email-alredy-in-use') {
      print('The account already exist for that email.');
    }
      } catch (e) {
        print (e);
      }
  }
}ate extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _paswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(padding:
       EdgeInsets.all(10),
       child: ListView(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextFormField(
            controller: _paswordController,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Login")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const register()));
          }, child: const Text("Register"))
        ],
       ),
       ),
    );
  }
}