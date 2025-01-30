import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Class to use firebase
class FirebaseServices {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> registerUser(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("User registered successfully!");
    } catch (e) {
      print("Error faced while resgistering $e");
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print("User registered successfully!");
    } catch (e) {
      print("Error faced while resgistering $e");
    }
  }

  Future<void> addNotes(String title, String content, int createdAt) async {
    try {
      final user = auth.currentUser;
    } catch (e) {
      print("Error occured! $e");
    }
  }
}
