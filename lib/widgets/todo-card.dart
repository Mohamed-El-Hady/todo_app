// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Todecard extends StatelessWidget {
  final String vartitle;
  final bool doneORnot;
  final Function changeStatus;
  final int index;
  final Function delete;

  const Todecard(
      {Key? key,
      required this.vartitle,
      required this.delete,
      required this.changeStatus,
      required this.index,
      required this.doneORnot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: doneORnot
                      ? Color.fromARGB(255, 27, 26, 26)
                      : Colors.white,
                  decoration: doneORnot
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              // SizedBox(
              //   width: 100,
              //),
              Icon(
                doneORnot ? Icons.check : Icons.close,
                size: 27,
                color: doneORnot ? Colors.green[400] : Colors.red,
              ),
              IconButton(
                  onPressed: () {
                    delete(index);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 250, 151, 144),
                  ))
            ],
          ),
          decoration: BoxDecoration(
              color: Color.fromRGBO(4, 0, 48, 0.2),
              borderRadius: BorderRadius.circular(11)),
        ),
      ),
    );
  }
}
