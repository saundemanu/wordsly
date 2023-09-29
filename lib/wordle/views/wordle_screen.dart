import 'package:flutter/material.dart';
import 'package:wordsly/wordle/widgets/wordle.dart';

enum GameStatus { playing, submitting, lost, won }

class WordleScreen extends StatefulWidget {
  const WordleScreen ({ Key? key}) : super(key: key);

  @override
  _WordleScreenState createState() => _WordleScreenState();
}

class _WordleScreenState extends State<WordleScreen> {
  GameStatus _gameStatus = GameStatus.playing; 

  final List<Word> _board = List.generate(
    6,
     (_) => Word(letters: List.generate(5, (_) => Letter.empty())),
  );

  int _currentWordIndex = 0;

  Word? get _currentWord =>
      _currentWordIndex < _board.length ? _board[_currentWordIndex] : null;

  Word _solution = Word.fromString(
    fiveLetterWords[Random().nextInt(fiveLetterWords.length)].toUpperCase(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'WORDSLY',
          style: TextStyle(
            fontSize: 36, 
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Board(board: _board),
        ]),
    );
  }
}