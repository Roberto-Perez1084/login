import 'package:flutter/material.dart';

void main() => runApp(MusicPortalApp());

class MusicPortalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Portal',
            style: TextStyle(fontStyle: FontStyle.italic)),
        backgroundColor: Colors.purple[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
        ),
        actions: [Icon(Icons.account_circle)],
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
                      child: const Text('¿Olvidaste tu contraseña?',
                          style: TextStyle(color: Color(0xff000000))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Login',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: TextField(decoration: roundedInput('User'))),
                      const SizedBox(width: 10),
                      Flexible(
                          child: TextField(decoration: roundedInput('Pass'))),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('Volver')),
                      const Text('|'),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Iniciar Sesión')),
                    ],
                  ),
                  const Divider(height: 40, thickness: 2),
                  const Text('Register',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: TextField(decoration: roundedInput('User'))),
                      const SizedBox(width: 10),
                      Flexible(
                          child: TextField(decoration: roundedInput('Email'))),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: TextField(decoration: roundedInput('Pass'))),
                      const SizedBox(width: 10),
                      Flexible(
                          child: TextField(decoration: roundedInput('Born'))),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: TextField(decoration: roundedInput('Tel'))),
                      const SizedBox(width: 10),
                      Flexible(
                        child: DropdownButtonFormField<String>(
                          value: 'Ubc',
                          items: ['Ubc', 'Uni1', 'Uni2']
                              .map((uni) => DropdownMenuItem(
                                  value: uni, child: Text(uni)))
                              .toList(),
                          onChanged: (value) {},
                          decoration: roundedInput('Ubc'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('Volver')),
                      const Text('|'),
                      TextButton(
                          onPressed: () {}, child: const Text('Crear cuenta')),
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
    final paint = Paint()..color = Colors.purple;

    // Parte superior inclinada
    final topPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.2)
      ..lineTo(0, size.height * 0.3)
      ..close();
    canvas.drawPath(topPath, paint);

    // Parte inferior inclinada
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
