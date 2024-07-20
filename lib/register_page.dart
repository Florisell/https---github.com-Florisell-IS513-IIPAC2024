import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void register(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String phone = phoneController.text.trim();
      String password = passwordController.text;
      String confirmPassword = confirmPasswordController.text;

      // Mostrar los datos en consola
      print('Nombre: $name');
      print('Correo: $email');
      print('Teléfono: $phone');
      print('Contraseña: $password');

      // Navegar a la página de inicio y pasar el correo como argumento
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: {'username': email},
      );
    }
  }

  bool _validateEmail(String email) {
    if (email.isEmpty) return false;
    final emailRegex = RegExp(r'^[\w-\.]+@[a-zA-Z]+\.(edu\.hn)$');
    return emailRegex.hasMatch(email);
  }

  bool _validatePhone(String phone) {
    if (phone.isEmpty) return false;
    final phoneRegex = RegExp(r'^(3|9)\d{7}$');
    return phoneRegex.hasMatch(phone);
  }

  bool _validatePassword(String password) {
    if (password.isEmpty) return false;
    final passwordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9a-zA-Z]).{8,}$');
    return passwordRegex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    }
                    if (value.length < 3 || value.length > 10) {
                      return 'Nombre debe tener entre 3 y 10 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Correo',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa tu correo';
                    }
                    if (!_validateEmail(value)) {
                      return 'Correo electrónico no válido. Debe ser de formato nombre@dominio.edu.hn';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Teléfono',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa tu teléfono';
                    }
                    if (!_validatePhone(value)) {
                      return 'Teléfono debe iniciar con 3 o 9 y tener exactamente 8 números';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa tu contraseña';
                    }
                    if (!_validatePassword(value)) {
                      return 'Contraseña debe tener al menos 8 caracteres incluyendo una mayúscula y un carácter especial';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirmar Contraseña',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor confirma tu contraseña';
                    }
                    if (value != passwordController.text) {
                      return 'La contraseña y confirmación de contraseña no coinciden';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () => register(context),
                  child: const Text('Regístrate'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}