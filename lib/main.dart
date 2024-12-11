import 'package:flutter/material.dart';

class UserData {
  final String name;
  final int age;

  UserData({required this.name, required this.age});
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RecordPage(),
  ));
}

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  _RecordPage createState() => _RecordPage();
}

class _RecordPage extends State<RecordPage> {
  late UserData userData;

  final textEditingStringController = TextEditingController();
  final textEditingIntegerController = TextEditingController();

  @override
  void initState() {
    userData = UserData(name: 'Original Value', age: 58);
    textEditingStringController.text = userData.name;
    textEditingIntegerController.text = userData.age.toString();
    super.initState();
  }

  @override
  void dispose() {
    textEditingStringController.dispose();
    textEditingIntegerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Passing'),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'textEditingStringController',
                  hintText: 'String',
                  helperText: 'Text Editing String Controller',
                ),
                controller: textEditingStringController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'textEditingIntegerController',
                  hintText: 'Integer',
                  helperText: 'Text Editing Integer Controller',
                ),
                controller: textEditingIntegerController,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Name: ${userData.name}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Age: ${userData.age}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userData = UserData(name: 'Updated Value', age: 65);
                    textEditingStringController.text = userData.name;
                    textEditingIntegerController.text = userData.age.toString();
                  });
                },
                child: const Text('Update Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
