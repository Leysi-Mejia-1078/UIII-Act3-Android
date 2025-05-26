import 'package:flutter/material.dart';
import 'package:myapp/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _sucursalIdController = TextEditingController();
  final _sucursalController = TextEditingController();
  final _sucursalDesController = TextEditingController();
  final _sucursalTelController = TextEditingController();
  final _sucursalCorreoController = TextEditingController();
  final _sucursalHoraController = TextEditingController();
  final _sucursalEmpController = TextEditingController();

  @override
  void dispose() {
    _sucursalController.dispose();
    _sucursalDesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepPurple.shade300,
            title: const Text("Form Tabla Sucursal"),
            centerTitle: true),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              MyTextField(
                  myController: _sucursalIdController,
                  fieldName: "Id Sucursal",
                  myIcon: Icons.numbers,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _sucursalController,
                  fieldName: "Nombre sucursal",
                  myIcon: Icons.account_balance,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 10.0),
              //Use to add space between Textfields
              MyTextField(
                  myController: _sucursalDesController,
                  fieldName: "Direccion ",
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _sucursalTelController,
                  fieldName: "Teléfono ",
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _sucursalCorreoController,
                  fieldName: "Correo ",
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _sucursalHoraController,
                  fieldName: "Horario de atención ",
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _sucursalEmpController,
                  fieldName: "Id_empleado",
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 20.0),
              myBtn(context),
            ],
          ),
        ));
  }

  //Function that returns OutlinedButton Widget also it pass data to Details Screen
  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Details(
              sucursalId: _sucursalIdController.text,
              sucursalName: _sucursalController.text,
              sucursalDescription: _sucursalDesController.text,
              sucursalTel: _sucursalTelController.text,
              sucursalCorreo: _sucursalCorreoController.text,
              sucursalHora: _sucursalHoraController.text,
              sucursalEmp: _sucursalEmpController.text,
              
            );
          }),
        );
      },
      child: Text(
        "Submit Form".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.deepPurple),
      ),
    );
  }
}

//Custom STateless WIdget Class that helps re-usability
// You can learn it in Tutorial (2.13) Custom Widget in Flutter
class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });

  final TextEditingController myController;
  String fieldName;
  final IconData myIcon;
  Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
          labelText: fieldName,
          prefixIcon: Icon(myIcon, color: prefixIconColor),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple.shade300),
          ),
          labelStyle: const TextStyle(color: Colors.deepPurple)),
    );
  }
}
