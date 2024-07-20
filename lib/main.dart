import 'package:flutter/material.dart';
import 'package:myapp/home_page.dart';
import 'package:myapp/register_page.dart';
import 'package:myapp/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Builder(
          builder: (context) {
            // Obtener el ancho y alto de la pantalla actual

            return const LoginPage(); // Puedes usar los valores de screenWidth y screenHeight según sea necesario
          },
        ),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
