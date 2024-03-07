import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late String newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                setState(() {
                  newTaskTitle = newText;
                });
              },
            ),
            SizedBox(height: 20.0),
            TextButton(
              child: Text(
                'Add',
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                textStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (newTaskTitle != null && newTaskTitle.isNotEmpty) {
                  Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                  Navigator.pop(context);
                } else {
                  print('Lütfen bir görev adı girin.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
