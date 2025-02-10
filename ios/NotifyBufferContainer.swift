import Foundation

class NotifyBufferContainer {
    public var items: Data
    public let capacity: Int

    public var count: Int {
        items.count
    }

    public var remaining: Int {
        capacity - items.count
    }

    public var isBufferFull: Bool {
        items.count >= capacity
    }

    init(size: Int) {
        self.capacity = size
        self.items = Data(capacity: size)
    }

    init(size: NSNumber) {
        self.capacity = size.intValue
        self.items = Data(capacity: size.intValue)
    }

    public func resetBuffer() {
        items.removeAll(keepingCapacity: true)
    }

    public func put(_ value: Data) {
        let remainingCapacity = self.remaining
        let restLength = value.count - remainingCapacity
        let toInsert = restLength > 0 ? value.prefix(remainingCapacity) : value
        items.append(toInsert)
    }
}
