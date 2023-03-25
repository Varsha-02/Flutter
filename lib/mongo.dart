import 'dart:developer';

import 'package:flutter_demo/config.dart';
import 'package:mongo_dart/mongo_dart.dart';
class Note {
  String? id;
  String? Name;
  String? Phno;
  String? Email;


  // ignore: non_constant_identifier_names
  Note({ this.id, this.Name, this.Phno, this.Email,  });

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map["id"],
      Name: map["Name"],
      Phno: map["Phno"],
      Email: map["Email"],
    );
  }

  get content => null;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "Name": Name,
      "Phno": Phno,
      "Email": Email,
    };
  }

  static connect() {}
}
class MongoDatabase {
  static connect() async{
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    // ignore: unused_local_variable
    var status = db.serverStatus();
    print(status);
    var collection =  db.collection(COLLECTION_NAME);
    print(await collection.find().toList());
    
  }
}