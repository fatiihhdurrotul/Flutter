import 'package:flutter/cupertino.dart';
import 'package:main/database_helper.dart';

import 'note.dart';

class DbProvider extends ChangeNotifier {
  List<Note> _notes = [];
  late DatabaseHelper _dbHlper;

  List<Note> get notes => _notes;
  DbProvider() {
    _dbHlper = DatabaseHelper();
    _getAllNotes();
  }
  void _getAllNotes() async {
    _notes = await _dbHlper.getNotes();
    notifyListeners();
  }
  Future<void> addNote(Note note) async {
    await _dbHlper.insertNote(note);
    _getAllNotes();
  }
  Future<Note> getNoteById(int id) async {
    return await _dbHlper.getNoteById(id);
  }
  void updateNote(Note note) async {
    await _dbHlper.updateNote(note);
    _getAllNotes();
  }
  void deleteNote(int id) async {
    await _dbHlper.deleteNote(id);
    _getAllNotes();
  }
}
