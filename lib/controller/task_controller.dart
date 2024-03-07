import 'package:flutter_todoapp/db_helper/database_helper.dart';
import 'package:get/get.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  final RxList<Task> taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) {
    return DatabaseHelper.insert(task);
  }

  Future<void> getTasks() async {
    final List<Map<String, dynamic>> tasks = await DatabaseHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  void deleteTask(Task task) async {
    await DatabaseHelper.delete(task);
    getTasks();
  }

  void deleteAlltask() async {
    await DatabaseHelper.deleteAll();
    getTasks();
  }

  void markTaskAsCompleted(int id) async {
    await DatabaseHelper.update(id);
    getTasks();
  }
}
