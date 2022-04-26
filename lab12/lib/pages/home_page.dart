import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Estudiante> _estudiantes = [
    Estudiante(
        "Francisco Martinez Alejandre",
        "18760460",
        "Ing. Sistemas Computacionales",
        "8vo",
        "6461597883",
        "al18760460@ite.edu.mx"),
    Estudiante(
        "Francisco Martinez Alejandre",
        "18760460",
        "Ing. Sistemas Computacionales",
        "8vo",
        "6461597883",
        "al18760460@ite.edu.mx"),
    Estudiante(
        "Francisco Martinez Alejandre",
        "18760460",
        "Ing. Sistemas Computacionales",
        "8vo",
        "6461597883",
        "al18760460@ite.edu.mx"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(204, 156, 25, 156),
          centerTitle: true,
          title: const Text(
            'Mi Perfil',
            style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
          ),
        ),
        body: ListView.builder(
          itemCount: _estudiantes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_estudiantes[index].nombrecompleto),
              subtitle: Text(_estudiantes[index].matricula),
            );
          },
        ));
  }
}

class Estudiante {
  String nombrecompleto;
  String matricula;
  String carrera;
  String semestre;
  String telefono;
  String correo;

  Estudiante(this.nombrecompleto, this.matricula, this.carrera, this.semestre,
      this.telefono, this.correo);
}
