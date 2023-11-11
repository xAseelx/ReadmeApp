import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAbaARZBQ9n5vbg8R064UYKXT1OF7Witmo",
            authDomain: "test2-3ac8c.firebaseapp.com",
            projectId: "test2-3ac8c",
            storageBucket: "test2-3ac8c.appspot.com",
            messagingSenderId: "123759107246",
            appId: "1:123759107246:web:795f3c0e1f6a643f0de13f"));
  } else {
    await Firebase.initializeApp();
  }
}
