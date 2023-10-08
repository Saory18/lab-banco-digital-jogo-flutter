import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);
}

void main() {
  try {
    stdout.write("Digite o nome da pessoa: ");
    final nome = stdin.readLineSync() ?? '';
    stdout.write("Digite o peso (em kg): ");
    final peso = double.parse(stdin.readLineSync() ?? '');
    stdout.write("Digite a altura (em metros): ");
    final altura = double.parse(stdin.readLineSync() ?? '');

    final pessoa = Pessoa(nome, peso, altura);

    final imc = calcularIMC(pessoa);

    printResultado(pessoa, imc);
  } catch (e) {
    print("Erro: $e");
  }
}

double calcularIMC(Pessoa pessoa) {
  if (pessoa.altura <= 0) {
    throw Exception("A altura deve ser maior que zero.");
  }

  return pessoa.peso / (pessoa.altura * pessoa.altura);
}

void printResultado(Pessoa pessoa, double imc) {
  print("\nResultado do IMC para ${pessoa.nome}:");
  print("Peso: ${pessoa.peso} kg");
  print("Altura: ${pessoa.altura} metros");
  print("IMC: $imc");

  if (imc < 18.5) {
    print("Abaixo do peso.");
  } else if (imc < 24.9) {
    print("Peso normal.");
  } else if (imc < 29.9) {
    print("Sobrepeso.");
  } else if (imc < 34.9) {
    print("Obesidade grau I.");
  } else if (imc < 39.9) {
    print("Obesidade grau II.");
  } else {
    print("Obesidade grau III.");
  }
}
