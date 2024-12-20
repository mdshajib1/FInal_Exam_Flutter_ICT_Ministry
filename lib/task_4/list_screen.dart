import 'package:flutter/material.dart';
import '../task_5/database_helper.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  void _refreshItems() async {
    final data = await DatabaseHelper.instance.getStudents();
    setState(() {
      _items = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Screen'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items[index]['name']),
            subtitle: Text(_items[index]['studentId']),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await DatabaseHelper.instance.deleteStudent(_items[index]['id']);
                _refreshItems();
              },
            ),
          );
        },
      ),
    );
  }
}