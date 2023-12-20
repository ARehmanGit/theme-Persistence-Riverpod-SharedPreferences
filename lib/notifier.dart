import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends Notifier<bool> {
  @override
  bool build() {
    var darkMode = ref.watch(boolProvider);
    return darkMode;
  }

  void toggle() async {
    state = !state;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", state);
  }
}

final themeProvider = NotifierProvider<ThemeNotifier, bool>(ThemeNotifier.new);

final boolProvider = Provider<bool>((ref) => throw UnimplementedError());
