import 'dart:math';
import 'dart:io';

void main() {
  var random = Random();
  var numerosSorteados = <int>[];
  var numerosEscolhidos = <int>[];

  // Ordena os números sorteados
  numerosSorteados.sort();

  print('Mega-Sena!');

  // Solicita ao usuário que escolha 6 números (de 1 a 60)
  for (var i = 0; i < 6; i++) {
    var numeroEscolhido = _solicitarNumero(i + 1);
    numerosEscolhidos.add(numeroEscolhido);
  }

  // Ordena os números escolhidos pelo usuário
  numerosEscolhidos.sort();

  print('\nNúmeros escolhidos pelo usuário: ${numerosEscolhidos.join(', ')}');

  // Realiza o sorteio de 6 números aleatórios para a Mega-Sena
  while (numerosSorteados.length < 6) {
    var numeroSorteado = random.nextInt(60) + 1;
    if (!numerosSorteados.contains(numeroSorteado)) {
      numerosSorteados.add(numeroSorteado);
    }
  }

  print('Números sorteados: ${numerosSorteados.join(', ')}');

  // Compara os números sorteados com os números escolhidos pelo usuário
  var acertos = _encontrarAcertos(numerosEscolhidos, numerosSorteados);

  if (acertos.isEmpty) {
    print('Você não acertou nenhum número. Boa sorte na próxima vez!');
  } else {
    print('Você acertou os números: ${acertos.join(', ')}');
    print('Total de acertos: ${acertos.length}');
  }
}

int _solicitarNumero(int numero) {
  while (true) {
    try {
      stdout.write('Digite o $numeroº número (de 1 a 60): ');
      var entrada = stdin.readLineSync();
      var numeroEscolhido = int.parse(entrada!);
      if (numeroEscolhido >= 1 && numeroEscolhido <= 60) {
        return numeroEscolhido;
      } else {
        print('Número fora do intervalo válido (1 a 60). Tente novamente.');
      }
    } catch (e) {
      print('Entrada inválida. Digite um número de 1 a 60.');
    }
  }
}

List<int> _encontrarAcertos(
    List<int> numerosEscolhidos, List<int> numerosSorteados) {
  var acertos = <int>[];
  for (var numero in numerosEscolhidos) {
    if (numerosSorteados.contains(numero)) {
      acertos.add(numero);
    }
  }
  return acertos;
}
