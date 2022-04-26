import 'package:flutter/material.dart';
import 'package:lab12/pages/userinfo.dart';

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
        "Andrea Martinez Martinez",
        "18760600",
        "Ing. Gestión Empresarial",
        "8vo",
        "6464568952",
        "al18760600@ite.edu.mx"),
    Estudiante(
        "Veronica Salazar Gónzalez",
        "18760650",
        "Ing. Sistemas Computacionales",
        "8vo",
        "6464567585",
        "al18760650@ite.edu.mx"),
    Estudiante(
        "Jose Contreras Gónzalez",
        "18760500",
        "Ing. Gestión Empresarial",
        "8vo",
        "6469635362",
        "al18760500@ite.edu.mx"),
    Estudiante("Abraham Martinez Gónzalez", "18760550", "Ing. Industrial",
        "8vo", "6467894652", "al18760550@ite.edu.mx"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(204, 156, 25, 156),
          centerTitle: true,
          title: const Text(
            'Estudiantes',
            style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
          ),
        ),
        body: ListView.builder(
          itemCount: _estudiantes.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Userinfo(
                            nombrecompleto: _estudiantes[index].nombrecompleto,
                            matricula: _estudiantes[index].matricula,
                            carrera: _estudiantes[index].carrera,
                            semestre: _estudiantes[index].semestre,
                            telefono: _estudiantes[index].telefono,
                            correo: _estudiantes[index].correo)));
              },
              onLongPress: () {
                _borrarPersona(context, _estudiantes[index]);
              },
              title: Text(_estudiantes[index].nombrecompleto),
              subtitle: Text(_estudiantes[index].matricula),
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(204, 156, 25, 156),
                child: Text(_estudiantes[index].nombrecompleto.substring(0, 1)),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            );
          },
        ));
  }

  _borrarPersona(context, persona) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Eliminar contacto"),
              content: Text("¿Está seguro de querer eliminar a " +
                  persona.nombrecompleto +
                  " ?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _estudiantes.remove(persona);
                      });
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Borrar",
                    )),
              ],
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
