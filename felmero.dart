import 'dart:io';

// 1. feladat: fájl létrehozása
void createFile(String fileName) {
  try {
    File file = File(fileName);
    if (!file.existsSync()) {
      file.createSync();
      print('$fileName létrehozva.');
    } else {
      print('$fileName már létezik.');
    }
  } catch (e) {
    print('Hiba a fájl létrehozásakor: $e');
  }
}

// 2. feladat: fájl törlése
void deleteFile(String fileName) {
  try {
    File file = File(fileName);
    if (file.existsSync()) {
      file.deleteSync();
      print('$fileName sikeresen törölve.');
    } else {
      print('$fileName nem létezik.');
    }
  } catch (e) {
    print('Hiba a fájl törlésekorr: $e');
  }
}

// 3. feladat: fájl tartalmának beolvasása
List<String> readFile(String fileName) {
  try {
    File file = File(fileName);
    if (file.existsSync()) {
      return file.readAsLinesSync();
    } else {
      print('$fileName nem található.');
      return [];
    }
  } catch (e) {
    print('Hiba a fájl olvasasakor: $e');
    return [];
  }
}

// 3. feladat: tartalom kiírása
void printContent(List<String> content) {
  List<String> women = [];
  List<String> men = [];

  for (var line in content) {
    if (line.toLowerCase().contains('nő')) {
      women.add(line);
    } else if (line.toLowerCase().contains('férfi')) {
      men.add(line);
    }
  }

  print('--- Nők ---');
  for (var line in women) {
    print(line);
  }

  print('--- Férfiak ---');
  for (var line in men) {
    print(line);
  }
}

// 4. feladat: számok hozzáadása fájlhoz
void addNumbers(String fileName, List<int> numbers) {
  try {
    File file = File(fileName);
    var sink = file.openWrite(mode: FileMode.append);
    for (var num in numbers) {
      sink.writeln(num);
    }
    sink.close();
    print('Számok hozzáadva a $fileName fájlhoz.');
  } catch (e) {
    print('Hiba számok hozzáadásakor: $e');
  }
}

// 4. feladat: számok kiírása növekvő sorrendben
void printNumbers(List<String> content) {
  List<int> numbers = content.map((e) => int.tryParse(e) ?? 0).toList();
  numbers.sort();
  print('--- Számok növekvő sorrendben ---');
  for (var num in numbers) {
    print(num);
  }
}

void main() {
  // 1. feladat
  createFile('players.txt');
  createFile('cars.txt');

  // 2. feladat
  deleteFile('players.txt');

  // 3. feladat
  var employeesContent = readFile('employees.txt');
  printContent(employeesContent);

  // 4. feladat
  List<int> newNumbers = [8, 0, 5, 1, 3, 2, 11, 19, 1];
  addNumbers('numbers.txt', newNumbers);

  var numbersContent = readFile('numbers.txt');
  printNumbers(numbersContent);
}
