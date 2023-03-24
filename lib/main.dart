// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app_lesson10_1/widgets/counter.dart';
import 'package:todo_app_lesson10_1/widgets/todo-card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  String title;
  bool status;
  Task({
    required this.title,
    required this.status,
  });
}

class _TodoAppState extends State<TodoApp> {
  List allTasks = [
    
  ];

  changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    });
  }

  addnewtask() {
    setState(() {
      allTasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }

  final myController = TextEditingController();

  int calculateCompletedTasks() {
    int completedTasks = 0;

    allTasks.forEach((item) {
      if (item.status) {
        completedTasks++;
      }
    });

    return completedTasks;
  }
delete(int clickedTask) {
    setState(() {
      allTasks.remove(allTasks[clickedTask]);
    });
  }

  deleteAll() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)),
                child: Container(
                  padding: EdgeInsets.all(22),
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                          controller: myController,
                          maxLength: 15,
                          decoration:
                              InputDecoration(hintText: "Add new Task")),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                          onPressed: () {
                            addnewtask();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 22),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor:  Color.fromARGB(255, 23, 29, 88),
      ),
      backgroundColor: Colors.grey,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "My Tasks",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 23, 29, 88)),
                )),
            SizedBox(
                width: 250,
                child: Expanded(
                    child: Divider(
                  thickness: 2,
                  color: Color.fromARGB(255, 10, 16, 67),
                ))),
            SizedBox(
              height: 5,
            ),
            Counter(
                allTodos: allTasks.length,
                allCompleted: calculateCompletedTasks()),
            IconButton(
                onPressed: () {deleteAll();},
                icon: Icon(Icons.delete_forever_outlined,
                    size: 50, color: Color.fromARGB(255, 247, 157, 151)),padding: EdgeInsets.only(left: 280)),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 550,
              color: Colors.grey,
              child: ListView.builder(
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Todecard(
                        vartitle: allTasks[index].title,
                        doneORnot: allTasks[index].status,
                        changeStatus: changeStatus,
                        index: index,
                        delete: delete,);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
