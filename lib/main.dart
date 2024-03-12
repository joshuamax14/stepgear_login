import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'password_boolean.dart' as passbool;
//import 'settings_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StepGear',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 98, 11, 250)),
        useMaterial3: true,
      ),
      home: const Login(title: 'StepGear'),
    );
  }
}

class Login extends StatefulWidget{
  const Login({Key? key, required this.title}) : super(key: key);
  final String title;
  
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(      // Email
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(      // Password 
                padding: 
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  
                  controller: passwordController,
                  obscureText: passbool.isObscuredText,
                  decoration:  InputDecoration(
                      border: const OutlineInputBorder(), labelText: "Password", 
                      suffixIcon: GestureDetector(
                        onTap: _toggle,
                        child: Icon(
                        passbool.isObscuredText ? Icons.visibility : Icons.visibility_off, // Add this line
                  ),),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (emailController.text == "rafaelvillavicencio14@gmail.com" && passwordController.text == "Gunterboy2016") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                email: emailController.text,
                            )),
                          );
                      } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Invalid Credentials')),
                            );
}                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill input')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _toggle(){setState((){passbool.isObscuredText = !passbool.isObscuredText;});} //toggle eye if password is visible or not

}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Column(
          children: [
            Text(email),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Go back!"),
              ),
            ),
          ],
        ));
  }
}