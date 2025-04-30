import 'package:flutter/material.dart';

void main() => runApp(MusicPortalApp());

class MusicPortalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => MainScreen(),
        '/auth': (_) => AuthScreen(),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pantalla Principal")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/auth'),
          child: Text("Ir a Login"),
        ),
      ),
    );
  }
}

class AuthScreen extends StatelessWidget {
  InputDecoration roundedInput(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black),
      filled: true,
      fillColor: Colors.grey[200],
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.black, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }

  TextStyle blackText = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Portal',
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black)),
        backgroundColor: Color(0xff8a4497),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                right: 12.0), // Mover el icono un poco a la izquierda
            child: Icon(Icons.account_circle,
                color: Colors.black, size: 34), // Agrandado
          ),
        ],
      ),
      body: Stack(
        children: [
          CustomPaint(
            size: Size.infinite,
            painter: PurpleSectionsPainter(),
          ),
          SingleChildScrollView(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('¿Olvidaste tu contraseña?'),
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Login',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: TextField(
                          decoration: roundedInput('User'),
                          style: blackText,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: TextField(
                          decoration: roundedInput('Pass'),
                          style: blackText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text('Volver'),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black)),
                      const Text('|', style: TextStyle(color: Colors.black)),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Iniciar Sesión'),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black)),
                    ],
                  ),
                  const Divider(height: 40, thickness: 2, color: Colors.black),
                  const Text('Register',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: TextField(
                          decoration: roundedInput('User'),
                          style: blackText,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: TextField(
                          decoration: roundedInput('Email'),
                          style: blackText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: TextField(
                          decoration: roundedInput('Pass'),
                          style: blackText,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: TextField(
                          decoration: roundedInput('Born'),
                          style: blackText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: TextField(
                          decoration: roundedInput('Tel'),
                          style: blackText,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: DropdownButtonFormField<String>(
                          value: 'Ubc',
                          items: ['Ubc', 'Uni1', 'Uni2']
                              .map((uni) => DropdownMenuItem(
                                    value: uni,
                                    child: Text(uni, style: blackText),
                                  ))
                              .toList(),
                          onChanged: (value) {},
                          decoration: roundedInput('Ubc'),
                          style: blackText,
                          dropdownColor: Colors.grey[100],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text('Volver'),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black)),
                      const Text('|', style: TextStyle(color: Colors.black)),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Crear cuenta'),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PurpleSectionsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Color(0xff7227b0);

    final topPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.2)
      ..lineTo(0, size.height * 0.3)
      ..close();
    canvas.drawPath(topPath, paint);

    final bottomPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height * 0.75)
      ..lineTo(0, size.height * 0.65)
      ..close();
    canvas.drawPath(bottomPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
