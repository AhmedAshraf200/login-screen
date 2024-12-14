import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/view/login_screen.dart';
import 'package:login_screen/view_model/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
    apiKey: 'AIzaSyAx_QFozak35bNz9fJKHBQxGsvjK2bRRQo',
    appId: '1:556655787342:android:f5593cdf6b075ea1f6b21f',
    messagingSenderId: '556655787342',
    projectId: 'sign-in-d04f7'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(FirebaseAuth.instance)),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Screen',
        home: LoginScreen(),
      ),
    );
  }
}
