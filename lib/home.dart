import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  final dynamic user;

  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await GoogleSignIn().signOut();
            // Logout dari Firebase
            FirebaseAuth.instance.signOut();
            // Kembali ke halaman login
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan foto profil
            user.photoURL == null
                ? const Icon(Icons.account_circle, size: 100)
                : CircleAvatar(
                    backgroundImage: NetworkImage(user.photoURL),
                    radius: 50,
                  ),
            const SizedBox(height: 20),
            // Menampilkan nama
            Text(
              user.displayName ?? user.email,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Menampilkan email
            Text(
              user.email ?? 'No Email',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
