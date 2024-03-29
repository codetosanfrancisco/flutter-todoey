import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';


class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  String taskName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0)
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Add Task', textAlign: TextAlign.center,style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                taskName = value;
              },
            ),
            FlatButton(
              child: Text('Add', style: TextStyle(color: Colors.white),),
              color: Colors.lightBlueAccent,
              onPressed: () {
//                widget.addTask(Task(name: taskName));
//                Navigator.pop(context);
                  Provider.of<TaskData>(context).addTask(taskName);
                  Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}


