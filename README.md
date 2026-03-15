# Swift 函数基础 Demo

## 简介

本示例演示 Swift 函数的基础用法，包括：无参函数、有参函数、多参数函数、有返回值的函数、使用元组返回多个值、以及返回可选类型。

## 基本原理

函数是组织代码的基本单元，用于封装可重复使用的逻辑。Swift 的函数具有以下特点：

1. **强类型系统**：每个参数和返回值都有明确的类型
2. **多种参数形式**：支持外部参数名、内部参数名、默认值、可变参数
3. **灵活的返回值**：可以返回单个值、元组，甚至可选类型
4. **函数类型**：函数本身是一等公民，可以作为参数或返回值

Swift 函数的语法简洁优雅，使用 `func` 关键字定义。

## 启动和使用

### 环境要求

- macOS 系统（自带 Swift）
- 或从 https://swift.org/download/ 安装 Swift

### 安装和运行

```bash
cd swift-function-basics-demo
swift run
```

### 预期输出

```
你好!
你好, 小明!
5 + 3 = 8
10 + 20 = 30
最小值: 1, 最大值: 9
第一个偶数: 6
```

## 教程

### 什么是函数？

函数是一段有名称的代码块，可以接收输入（参数）并产生输出（返回值）。使用函数可以让代码：

- **重用**：一次定义，多次调用
- **组织**：将复杂逻辑分解为可管理的小块
- **可读**：函数名本身就是最好的注释

### 定义函数

Swift 使用 `func` 关键字定义函数：

```swift
func functionName(parameter: Type) -> ReturnType {
    // 函数体
    return value
}
```

### 无参函数

最简单的函数，不接收任何参数：

```swift
func sayHello() {
    print("你好!")
}
sayHello()  // 输出: 你好!
```

注意：无参函数调用时也需要括号 `()`。

### 有参函数

函数可以接收一个或多个参数：

```swift
func greet(name: String) {
    print("你好, \(name)!")
}
greet(name: "小明")  // 输出: 你好, 小明!
```

**Swift 参数命名规则**：
- 第一个参数名通常作为内部名称
- 后续参数可以同时用作外部名称

### 多参数函数

多个参数用逗号分隔：

```swift
func add(a: Int, b: Int) {
    print("\(a) + \(b) = \(a + b)")
}
add(a: 5, b: 3)  // 输出: 5 + 3 = 8
```

### 有返回值的函数

使用 `->` 指定返回类型：

```swift
func sum(a: Int, b: Int) -> Int {
    return a + b
}
let result = sum(a: 10, b: 20)
print(result)  // 输出: 30
```

### 使用元组返回多个值

当需要返回多个值时，元组是很好的选择：

```swift
func minMax(numbers: [Int]) -> (min: Int, max: Int) {
    var min = numbers[0]
    var max = numbers[0]
    for num in numbers {
        if num < min { min = num }
        if num > max { max = num }
    }
    return (min, max)
}

let range = minMax(numbers: [3, 1, 4, 1, 5, 9, 2, 6])
print("最小值: \(range.min), 最大值: \(range.max)")
// 输出: 最小值: 1, 最大值: 9
```

元组允许在一个返回值中包含多个相关的数据，而且可以给元组的元素命名。

### 返回可选类型

当函数可能无法返回有效值时，可以使用可选类型：

```swift
func findFirst(even numbers: [Int]) -> Int? {
    for num in numbers {
        if num % 2 == 0 {
            return num
        }
    }
    return nil
}

if let first = findFirst(even: [1, 3, 5, 6, 7]) {
    print("第一个偶数: \(first)")
} else {
    print("没有偶数")
}
// 输出: 第一个偶数: 6
```

可选返回类型 `-> Int?` 表示：
- 可能返回 Int 值
- 也可能返回 nil

使用 `if let` 或 `guard let` 来安全地处理可选值。

### 常见问题和注意事项

1. **参数默认是常量**：函数参数默认是常量，不能在函数内修改
2. **参数标签**：调用时必须使用参数标签，如 `greet(name:)`
3. **返回类型**：无返回值函数可以省略 `->`，或写 `-> Void`
4. **空元组**：`Void` 等同于 `()`
5. **避免副作用**：尽量编写纯函数，减少副作用

## 关键代码详解

### main.swift 完整代码

```swift
// swift-function-basics-demo.swift

// ============ 无参函数 ============
func sayHello() {
    print("你好!")
}
sayHello()

// ============ 有参函数 ============
func greet(name: String) {
    print("你好, \(name)!")
}
greet(name: "小明")

// ============ 多参数 ============
func add(a: Int, b: Int) {
    print("\(a) + \(b) = \(a + b)")
}
add(a: 5, b: 3)

// ============ 有返回值 ============
func sum(a: Int, b: Int) -> Int {
    return a + b
}
let result = sum(a: 10, b: 20)
print("10 + 20 = \(result)")

// ============ 多返回值（使用元组）===========
func minMax(numbers: [Int]) -> (min: Int, max: Int) {
    var min = numbers[0]
    var max = numbers[0]
    for num in numbers {
        if num < min { min = num }
        if num > max { max = num }
    }
    return (min, max)
}
let range = minMax(numbers: [3, 1, 4, 1, 5, 9, 2, 6])
print("最小值: \(range.min), 最大值: \(range.max)")

// ============ 返回可选类型 ============
func findFirst(even numbers: [Int]) -> Int? {
    for num in numbers {
        if num % 2 == 0 {
            return num
        }
    }
    return nil
}
if let first = findFirst(even: [1, 3, 5, 6, 7]) {
    print("第一个偶数: \(first)")
} else {
    print("没有偶数")
}
```

### 核心代码解析

1. **无参函数**：`func sayHello() { ... }`
   - 没有参数，不需要写参数类型
   - 没有返回值，隐式返回 Void

2. **有参函数**：`func greet(name: String) { ... }`
   - `name` 是参数名（内部使用）
   - 调用时需要 `greet(name: "小明")`

3. **有返回值**：`func sum(a: Int, b: Int) -> Int { return a + b }`
   - `-> Int` 表示返回 Int 类型
   - `return` 语句返回值

4. **元组返回**：`-> (min: Int, max: Int)`
   - 命名元组类型
   - 返回时用 `return (min, max)` 或 `return (min: min, max: max)`

5. **可选返回**：`-> Int?`
   - 问号表示可能是 Int，也可能是 nil
   - 用 `if let` 解包，确保安全使用
