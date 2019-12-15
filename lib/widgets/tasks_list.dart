import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(itemBuilder: (context, int index) {
          final task = taskData.tasks[index];
          return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkBoxCallback: (bool checkBoxState) {
                //Provider.of<TaskData>(context).tasks[index].toggleDone();
                taskData.updateTask(task);
              },
            longPressCallback: () {
                taskData.deleteTask(task);
            },
          );
        }, itemCount: taskData.taskCount,);
      }
    );
  }
}
