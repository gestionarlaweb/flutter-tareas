import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  // cambia de true a false
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Aquí las tareas',
        style: TextStyle(
            // Si el isChecked es True, subralla el texto
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: new TaskCheckbox(
        checkboxState: isChecked,
        commutarCheckboxState: (bool checkboxState) {
          setState(() {
            isChecked = checkboxState;
          });
        },
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  // Al ser Sin estado todas las variables deben der final
  final bool checkboxState;
  final Function commutarCheckboxState;
  // Si necesitamos actualizar el (bool checkboxState) dentro de un Widget
  // sin estado como este,
  // lo que hcemos es inicializar la nueva versión de clase TaskCheckbox
  // de esta manera y descartamos la última

  TaskCheckbox({this.checkboxState, this.commutarCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: commutarCheckboxState,
    );
  }
}
