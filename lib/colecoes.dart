import "dart:math";

List<int> _parseUserInput(String input) {
  var numbers = input.split(' ');
  var userNumbers = <int>[];
  for (var number in numbers) {
    var parsedNumber = int.tryParse(number);
    if (parsedNumber != null && parsedNumber >= 1 && parsedNumber <= 60) {
      if (!userNumbers.contains(parsedNumber)) {
        userNumbers.add(parsedNumber);
      } else {
        print('Número repetido: $parsedNumber. Será ignorado.');
      }
    }
  }
  return userNumbers;
}

List<int> _generateRandomNumbers(Random random) {
  var generatedNumbers = <int>[];
  while (generatedNumbers.length < 6) {
    var number = random.nextInt(60) + 1;
    if (!generatedNumbers.contains(number)) {
      generatedNumbers.add(number);
    }
  }
  return generatedNumbers;
}

List<int> _encontrarAcertos(List<int> userNumbers, List<int> generatedNumbers) {
  var acertos = <int>[];
  for (var number in userNumbers) {
    if (generatedNumbers.contains(number)) {
      acertos.add(number);
    }
  }
  return acertos;
}
