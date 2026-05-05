// 1. Кружка и Человек
class Cup {
  int volume;

  Cup(this.volume);

  void drink(int amount) {
    if (amount <= volume) {
      volume -= amount;
      print("Осталось: $volume");
    } else {
      print("Недостаточно воды");
    }
  }
}

class Human {
  String name;

  Human(this.name);

  void drink(Cup cup, int amount) {
    cup.drink(amount);
  }
}

// 2. Шкаф
class Storage {
  List<String> items = [];

  void add(String item) {
    items.add(item);
  }

  void remove(String item) {
    items.remove(item);
  }
}

class Wardrobe {
  List<Storage> storages = [];

  Wardrobe(int count) {
    for (int i = 0; i < count; i++) {
      storages.add(Storage());
    }
  }

  void putItem(int index, String item) {
    storages[index].add(item);
  }

  void takeItem(int index, String item) {
    storages[index].remove(item);
  }
}

// 3. Гриф и блин
class Plate {
  double weight;

  Plate(this.weight);
}

class Bar {
  double maxWeight;
  List<Plate> left = [];
  List<Plate> right = [];

  Bar(this.maxWeight);

  double getCurrentWeight() {
    double sum = 0;
    for (var p in left) {
      sum += p.weight;
    }
    for (var p in right) {
      sum += p.weight;
    }
    return sum;
  }

  void addLeft(Plate plate) {
    if (getCurrentWeight() + plate.weight <= maxWeight) {
      left.add(plate);
    }
  }

  void addRight(Plate plate) {
    if (getCurrentWeight() + plate.weight <= maxWeight) {
      right.add(plate);
    }
  }
}

// 4. Конвертер валют
class Converter {
  double convert(double amount, double rate) {
    return amount * rate;
  }
}

// 5. Гараж (дженерик)
class Garage<T> {
  List<T> items = [];

  void add(T item) {
    items.add(item);
  }

  void remove(T item) {
    items.remove(item);
  }
}

// 6. Арифметические операции
class MyNumber {
  int value;

  MyNumber(this.value);

  MyNumber operator +(MyNumber other) {
    return MyNumber(value + other.value);
  }

  MyNumber operator -(MyNumber other) {
    return MyNumber(value - other.value);
  }

  MyNumber operator *(MyNumber other) {
    return MyNumber(value * other.value);
  }

  MyNumber operator /(MyNumber other) {
    return MyNumber(value ~/ other.value);
  }
}

// 7. Автомобиль
enum CarState { stop, move, turn }

class Car {
  CarState state;

  Car(this.state);

  void setState(CarState newState) {
    state = newState;
  }
}

// 8. Геометрические фигуры
abstract class Shape {
  double area();
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.14 * radius * radius;
  }
}

class Triangle extends Shape {
  double base;
  double height;

  Triangle(this.base, this.height);

  @override
  double area() {
    return 0.5 * base * height;
  }
}

// 9. Системы счисления
class NumberConverter {
  String toBinary(int number) {
    return number.toRadixString(2);
  }

  String toHex(int number) {
    return number.toRadixString(16);
  }

  int fromHex(String hex) {
    return int.parse(hex, radix: 16);
  }
}

// 10. Максимальная площадь
class ShapeManager {
  List<Shape> shapes = [];

  void addShape(Shape shape) {
    shapes.add(shape);
  }

  Shape findMax() {
    Shape max = shapes[0];

    for (var s in shapes) {
      if (s.area() > max.area()) {
        max = s;
      }
    }

    return max;
  }
}

// 11. Стол
abstract class TableItem {}

class Spoon extends TableItem {}
class Fork extends TableItem {}

class Table {
  List<TableItem> items = [];

  void addItem(TableItem item) {
    items.add(item);
  }

  void removeItem(TableItem item) {
    items.remove(item);
  }
}

// main для проверки
void main() {
  var cup = Cup(200);
  var human = Human("Иван");
  human.drink(cup, 50);

  var car = Car(CarState.stop);
  car.setState(CarState.move);

  var a = MyNumber(10);
  var b = MyNumber(5);
  print((a + b).value);

  var manager = ShapeManager();
  manager.addShape(Rectangle(2, 3));
  manager.addShape(Circle(2));
  print(manager.findMax().area());
}