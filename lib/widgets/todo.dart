import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToDo extends StatefulWidget {
  final String Title;
  final String Desc; 
  final bool done;
  const ToDo({super.key,required this.Title, required this.Desc, required this.done});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.done? Colors.green: Colors.red,
          borderRadius:  BorderRadius.circular(10) ),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.Title,
               style: 
               const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
               ),
              Text(widget.Desc),
            ],
          ),
        )
      ),
    );
  }
}