import 'package:flutter/material.dart';
import 'package:new_api_cric/api.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (snapshot.hasData) {
                  final data = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final su = data[index];
                          return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Text('ID:${su.id}'),
                                    title: Text('Name:${su.name}'),
                                    subtitle: Text('username:${su.username}'),
                                    trailing: Text(
                                        'address:City:${su.address!.city}' +
                                            'Street:${su.address!.street}' +
                                            'Suit:${su.address!.zipcode}'),
                                  )
                                ],
                              ));
                        }),
                  );
                } else {
                  return Text('Unable to fetch data from api');
                }
              })
        ],
      ),
    );
  }
}
