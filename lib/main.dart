import 'package:flutter/material.dart';
import 'package:flutter_todoapp/db_helper/database_helper.dart';
import 'package:flutter_todoapp/pages/shared/theme.dart';
import 'package:flutter_todoapp/pages/ui/home_page.dart';
import 'package:flutter_todoapp/services/theme_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
