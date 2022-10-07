import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  List _dados = await getJson();
  String _body = "";
  _body = _dados[2]['title'];

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Json')),
        ),
        body: ListView.builder(
          itemCount: _dados.length,
          padding: const EdgeInsets.all(13),
          itemBuilder: (BuildContext context, int position) {
            return Column(
              children: [
                const Divider(height: 6),
                ListTile(
                  title: Text('${_dados[position]['title']}'),
                  subtitle: Text('${_dados[position]['body']}'),
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}

Future<List> getJson() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('erro');
  }
}
