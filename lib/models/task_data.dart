import 'package:flutter/foundation.dart';
import 'package:tareas/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Comprar Merca'),
    Task(name: 'Comprar Xamfrà'),
    Task(name: 'Comprar Noé'),
  ];

// import 'dart:collection';
// Aumentar la seguridad de nuestro código
// No permite modificar una tarea a pelo.
// Solo lo podremos hacer desde la función addTask()
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

// Añadir tarea
  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

// El tachado de la tarea
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  // Eliminar tarea al hacer un longPress
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
