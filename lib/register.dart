import 'package:flutter/material.dart';
import 'package:lab_10/login.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(padding:
       EdgeInsets.all(10),
       child: ListView(
        children: [
          TextFormField(
            controller: _email,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextFormField(
            controller: _password,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          ElevatedButton(onPressed: () {
            AuthService.registerProcess(_email.text, _password.text).then((value){
              Navigator.pop(context);
          });

            
          }, child: const Text("Login")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const register()));
          }, child: const Text("Register"))
        ],
       ),
       ),
    );
  }
}