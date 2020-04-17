import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:devmobile_app/eleve.dart';
import 'package:devmobile_app/list.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primaryColor: const Color(0xFF1a73e8),
      primaryColorDark: const Color(0xFF1a73e8),
      accentColor: const Color(0xFF1a73e8),
    ),
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();

}




class MyAppState extends State<MyApp> {

  List data;
  var absent =  new List<Eleve>();

  List<Eleve> parseJson(String response) {
    if(response==null){
      return [];
    }
    final parsed =
    json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Eleve>((json) => new Eleve.fromJson(json)).toList();

  }



  @override
  Widget build(BuildContext context) {





    return new Scaffold(
        appBar: new AppBar(
          title: new Text("EPSI B2 G2",
          style: new TextStyle(color: Colors.white),),
        ),
        body: new Container(
          child: new Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/classe.json'),
                builder: (context, snapshot) {
                  List<Eleve> eleves = parseJson(snapshot.data.toString());
                  return new ListView.builder(

                      itemCount: eleves == null ? 0 : eleves.length,
                      itemBuilder: (BuildContext context, int index) {


                        return

                          new ListTile(

                            trailing: Icon(
                              eleves[index].abs ? Icons.error_outline : Icons.error_outline,
                              color: eleves[index].abs ? Colors.red : null,
                            ),
                            onTap: ()  {
                              setState(() { print(eleves[index].abs);
                                if (eleves[index].abs == false) {
                                  absent.remove(eleves[index]);
                                  eleves[index].abs = true;
                                } else {
                                  absent.add(eleves[index]);
                                  eleves[index].abs = false;
                                }
                              });
                            },

                            title:   new Text(eleves[index].prenom, style: new TextStyle(fontSize: 22.0, color: Colors.black)),


                            subtitle: new Text(eleves[index].nom, style: new TextStyle(fontSize: 22.0, color: Colors.blue)),
                          );




                      });

                }),
          ),
        )


    );



  }






}



