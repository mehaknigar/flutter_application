import 'package:flutter/foundation.dart';

class QuestionData {
  final String title, subtitle;

  QuestionData({
    required this.title,
    required this.subtitle,
  });
}

class DataModel with ChangeNotifier {
  List<QuestionData> textData = [
    QuestionData(
        title: 'Los geht’s mit deinen ersten Neuroübungen 1',
        subtitle:
            'Mit einem Assessment testest du jetzt deine Übungen auf Effektivität.'),
    QuestionData(
        title: 'Technologie ist am besten, wenn sie Menschen zusammenbringt 2',
        subtitle:
            'Wir wissen nicht, wer wir sind, bis wir sehen, was wir tun können.'),
    QuestionData(
        title: 'Dinge sind nur unmöglich, bis sie es nicht sind.3',
        subtitle:
            'Die Zeit kriecht an dir heran wie die Windschutzscheibe eines Käfers.'),
  ];
  int index = 0;

  void showNext() {
    if (index < textData.length - 1) index++;

    notifyListeners();
  }

  void showPrevious() {
    if (index > 0) index--;

    notifyListeners();
  }
}
