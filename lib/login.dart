import 'package:flutter/material.dart';
import 'main.dart';

void main() => runApp(const MyAppLogin());

class MyAppLogin extends StatelessWidget {
  const MyAppLogin({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Log In';
    return MaterialApp(
      title: appTitle,
      home: const LoginScreen(), // Changed to navigate to LoginScreen instead of Scaffold directly
    );
  }
}

// LoginScreen is now a separate StatefulWidget to handle the login form
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() {
    return LoginScreenState(); // Correct state class name
  }
}

// This class holds data related to the form.
class LoginScreenState extends State<LoginScreen> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Added Scaffold to provide a Material widget ancestor
      appBar: AppBar(title: const Text('Log In')), // Added AppBar for a consistent UI
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Added padding for better spacing
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField( // Username field
                decoration: const InputDecoration(hintText: '  Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text'; // Ensures field is not empty
                  }
                  return null;
                },
              ),
              TextFormField( // Password field
                decoration: const InputDecoration(hintText: '  Password'),
                obscureText: true, // Hides password input
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text'; // Ensures field is not empty
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Verifying...')),
                      );
                    }
                  },
                  child: const Text('Log In'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
