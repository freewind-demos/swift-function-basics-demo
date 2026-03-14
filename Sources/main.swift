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
