import 'package:asisten_tpm_4/models/movie_list.dart';
import 'package:asisten_tpm_4/pages/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello, $username")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) => _movieStore(context, index),
          itemCount: movieList.length,
        ),
      ),
    );
  }

  Widget _movieStore(context, index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailPage(index: index)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(border: Border.all(width: 2)),
        child: Column(
          children: [
            Image.network(movieList[index].imgUrl),
            Text(movieList[index].title),
          ],
        ),
      ),
    );
  }
}
