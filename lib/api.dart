import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Model/Model.dart';

Future<List<Model>> getData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as List;
    List<Model> mydata = data.map((item) {
      return Model.fromJson(item as Map<String, dynamic>);
    }).toList();
    return mydata;
  } else {
    throw Exception('Unable to fetch data');
  }
}
