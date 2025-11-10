// Output View

import SwiftUI

struct OutputView: View {
    var subscriptions: [Subscription]
    var totalCost: Double
    var totalBudget: String
    var displayText: String
    var displayColor: Color
    
    func getColor(for type: String) -> Color {
        switch type {
        case "Streaming":
            return Color.red.opacity(0.2)
        case "Music":
            return Color.green.opacity(0.2)
        case "Gaming":
            return Color.blue.opacity(0.2)
        case "Software":
            return Color.yellow.opacity(0.2)
        case "News":
            return Color.purple.opacity(0.2)
        case "Fitness":
            return Color.orange.opacity(0.2)
        default:
            return Color.gray.opacity(0.2)
        }
    }

    var body: some View {
        VStack(spacing: 10) {
            if !subscriptions.isEmpty {
                Text("Total Cost: $\(totalCost, specifier: "%.2f")")
                    .font(.headline)
                Text("Budget: $\(totalBudget)")
                    .font(.headline)
                    .padding()
                Text(displayText)
                    .foregroundColor(displayColor)
                    .font(.subheadline)
            }
            List(subscriptions) { subscription in
                VStack(alignment: .leading) {
                    Text(subscription.name)
                        .font(.headline)
                    Text("Cost: $\(subscription.monthlyCost, specifier: "%.2f")")
                    Text("Type: \(subscription.type)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(getColor(for: subscription.type))
                .cornerRadius(8)
                .listRowInsets(EdgeInsets())
            }
        } .navigationTitle("Results!")
    }
}
