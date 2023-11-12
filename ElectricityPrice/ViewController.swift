//
//  ViewController.swift
//  ElectricityPrice
//
//  Created by Hung Vu on 12/11/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leveLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    var price1 = 1.678
    var price2 = 1.734
    var price3 = 2.014
    var price4 = 2.536
    var price5 = 2.834
    var price6 = 2.927
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI() {
        calculateButton.layer.cornerRadius = 8
        
    }
    
    func calculatePrice() {
        var priceTotal: Double = 0
        if let inputNumber = numberTextField.text, let number = Double(inputNumber) {
            switch number {
            case let x where x < 0:
                leveLabel.text = "Error"
            case 0...50:
                leveLabel.text = "1"
                priceTotal = number * price1
            case 51...100:
                leveLabel.text = "2"
                priceTotal = 50 * price1 + (number - 50) * price2
            case 101...200:
                leveLabel.text = "3"
                priceTotal = 50 * price1 + 100 * price2 + (number - 100) * price3
            case 201...300:
                leveLabel.text = "4"
                priceTotal = 50 * price1 + 100 * price2 + 200 * price3 + (number - 200) * price4
            case 301...400:
                leveLabel.text = "5"
                priceTotal = 50 * price1 + 100 * price2 + 200 * price3 + 300 * price4 + (number - 300) * price5
            default:
                leveLabel.text = "6"
                priceTotal = 50 * price1 + 100 * price2 + 200 * price3 + 300 * price4 + 300 * price5 + (number - 400) * price6
            }
        }
        priceLabel.text = String(format: "%.2f", priceTotal)
    }
    @IBAction func tapToCalculatePrice(_ sender: Any) {
        calculatePrice()
    }
}

