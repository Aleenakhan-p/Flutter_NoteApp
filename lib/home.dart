import 'package:flutter/material.dart';
import 'firebase_services.dart';
import 'notes_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _HomeState();
}

class _HomeState extends State<MyHomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseServices firebaseServices = FirebaseServices();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 124, 67, 214),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ListTile(
                title: Text("Note: Sign in Firstly"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Sign-In Form"),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Please Enter your email",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "Please Enter your password",
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await firebaseServices.registerUser(
                                emailController.text.trim(),
                                passwordController.text);
                            print(
                                "Registered with email: ${emailController.text}");
                          },
                          child: const Text("Create Account"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Log-In Form"),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Please Enter your email",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "Please Enter your password",
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await firebaseServices.loginUser(
                                emailController.text.trim(),
                                passwordController.text);
                            print(
                                "Logged in with email: ${emailController.text}");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyNotesPage()), //Directing to all my notes after logging
                            );
                          },
                          child: const Text("Login"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
