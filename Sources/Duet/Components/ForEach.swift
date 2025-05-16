
import SwiftUI

public typealias RandomAccessCollectionCodable = RandomAccessCollection & Codable

public extension Models {
    struct ForEach: Identifiable, Model, Codable {
        public let id: UUID
        let componentsPerElement: [[Component]]

        public init<Data>(
            id: UUID = UUID(),
            _ data: Data,
            @ModelBuilder content: @escaping (Data.Element) -> [Model]
        ) where Data: RandomAccessCollectionCodable, Data.Element: Identifiable, ID: Hashable {
            self.id = id
            self.componentsPerElement = data.map { element in
                content(element).map { $0.render() }
            }
        }

        public func render() -> Component { .forEach(self) }
    }
}

extension Models.ForEach {
    struct ComponentView: View {
        init(
            _ model: Models.ForEach,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.ForEach
        private let dispatch: DispatchFunction

        var body: some View {
            ForEach(model.componentsPerElement.indices, id: \.self) { idx in
                ForEach(model.componentsPerElement[idx], id: \.id) { component in
                    component.view(with: dispatch)
                }
            }
        }
    }
}
