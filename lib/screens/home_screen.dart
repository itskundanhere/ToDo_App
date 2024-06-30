import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/widgets/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<TodoModel> todos =[];
  TextEditingController Title= TextEditingController();
  TextEditingController Desc= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("*TODO LIST*"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SizedBox(
            
                       child: ListView.builder(
              shrinkWrap: true,
              itemCount:  todos.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    todos[index].check = !todos[index].check;
                    setState(() {
                      
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: ToDo(
                          Title: todos[index].Title, 
                          Desc: todos[index].Desc, 
                          done: todos[index].check, 
                          ),
                      ),
                        IconButton(onPressed: (){
                          todos.removeAt(index);
                          setState(() {
                            
                          });
                        }, icon: const Icon (Icons.delete))
                    ],
                  ),
                );
              }),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(decoration: BoxDecoration(border: Border.all(),
              borderRadius: BorderRadius.circular(15)),
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField( controller: Title, 
                decoration:   const InputDecoration(labelText: 'Title')),
                
              ),
              ),
      
              const SizedBox(
                height: 10,
              ),
              Container(decoration: BoxDecoration(border: Border.all(),
              borderRadius: BorderRadius.circular(15)),
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: Desc,
                  decoration: const InputDecoration(labelText: 'Desc'),
                ),
              ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton( onPressed: () {
               if(Title.text.isNotEmpty && Desc.text.isNotEmpty) {
                todos.add(TodoModel(Title.text, Desc.text, false));
                setState(() {
                  
                });
               }
               
              }, child:  const Text('Add ToDo'))
            ],
          ),
        ),
      
      
      
      ],
      ),
    );
  }
}