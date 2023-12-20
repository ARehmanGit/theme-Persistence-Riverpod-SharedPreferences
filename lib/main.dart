import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutternotifiertheme/apptheme.dart';
import 'package:flutternotifiertheme/notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(overrides: [
    boolProvider.overrideWithValue(prefs.getBool("isDark") ?? false)
  ], child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isDark = ref.watch(themeProvider);
    return MaterialApp(
      theme: isDark ? AppTheme.dark : AppTheme.light,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              ref.read(themeProvider.notifier).toggle();
            },
            child: const Text("Change")),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
