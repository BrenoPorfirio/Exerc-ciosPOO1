class Produto {
  double preco;
  String descricao;
  DateTime validade;

  Produto(this.preco, this.descricao, this.validade);

  static final Produto refrigerante = Produto(8.0, "Coca-Cola", DateTime(13, 02, 2024));
  static final Produto bolo = Produto(25.0, "Bolo de Cenoura", DateTime(29, 02, 2023));
  static final Produto pastel = Produto(4.0, "Pastel de forma ", DateTime(30, 10, 2023));

}

class Item {
  int quantidade;
  double total = 0.0;
  Produto produto;

  Item(this.quantidade, this.produto) {
    this.total = this.quantidade * this.produto.preco;
  }
}

class Venda {
  DateTime data;
  List<Item> itens = [];
  double total = 0.0;

  Venda(this.data, this.itens) {
    total = itens.map((item) => item.total).reduce((a, b) => a + b);
  }
  double get totalProdutos =>
    itens.map((item) => item.produto.preco).reduce((a, b) => a + b);
}

void main(){
  //Criação de exemplos de produtos.
  var refrigerante = Produto(8.0, "Coca-Cola", DateTime(13, 02, 2024));
  var bolo = Produto(25.0, "Bolo de Cenoura", DateTime(29, 02, 2023));
  var pastel = Produto(2.0, "Pastel de Forma ", DateTime(30, 10, 2023));

  //Criacão de exemplos de quantidades associadas a cada produto.
  var item1 = Item(1, refrigerante);
  var item2 = Item(2, bolo);
  var item3 = Item(50, pastel);

  var itens = [item1, item2, item3];

  var venda = Venda(DateTime.now(), itens);

  //Exibição dos produtos e suas informações.
  print("--- LISTA DE PRODUTOS ---");
  print(" -> ${refrigerante.descricao}, R\$ ${refrigerante.preco}");
  print(" -> ${bolo.descricao}, R\$ ${bolo.preco}");
  print(" -> ${pastel.descricao}, R\$ ${pastel.preco}");
  print(" -> Total PREÇO UNITÁRIO: R\$ ${venda.totalProdutos.toStringAsFixed(2)}");

  print("\n--- LISTA DE ITENS ESCOLHIDOS ---");
  itens.forEach((item) => print(
    " -> ${item.quantidade}x ${item.produto.descricao}, R\$ ${item.produto.preco} unidade, total = R\$ ${item.total}"));

  print("\n--- VENDA ---");
  print(" -> Data: ${venda.data}");
  print(" -> Total de produtos diferentes: ${venda.itens.length}");
  print(" -> Total da venda: R\$ ${venda.total.toStringAsFixed(2)}");
}