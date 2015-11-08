//
//  ViewController.swift
//  VoteMvp
//
//  Created by takayama minoru on 2015/11/08.
//  Copyright © 2015年 minoru takayama. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var voteMonthUILabel: UILabel!
    @IBOutlet weak var myNameUIPicker: UIPickerView!
    @IBOutlet weak var mvpNameUIPicker: UIPickerView!
    @IBOutlet weak var pointUIPicker: UIPickerView!
    @IBOutlet weak var commentUIText: UITextField!
    @IBOutlet weak var pointUISlider: UISlider!
    
    private let myNameValues: [String] = ["その一","その二","その三","その四"]
    private let mvpNameValues: [String] = ["その五","その六","その七","その八","その九","その十"]
    private let pointValues: [Int] = [1, 2, 3, 4, 5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        voteMonthUILabel.text = getVoteMonth()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /*
    pickerに表示する列数を返すデータソースメソッド.
    (実装必須)
    */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /*
    pickerに表示する行数を返すデータソースメソッド.
    (実装必須)
    */
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var count: Int
        if (pickerView == myNameUIPicker) {
            count = myNameValues.count
        } else if (pickerView == mvpNameUIPicker) {
            count = mvpNameValues.count
        } else {
            count = pointValues.count
        }
        return count
    }
    
    /*
    pickerに表示する値を返すデリゲートメソッド.
    */
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var value: String
        if (pickerView == myNameUIPicker) {
            value = myNameValues[row]
        } else if (pickerView == mvpNameUIPicker) {
            value = mvpNameValues[row]
        } else {
            value = pointValues[row].description
        }
        return value
    }
    
    @IBAction func onClickVoteButton(sender: UIButton) {

        let alertController = UIAlertController(title: "投票しますか？", message: "あなたの名前：\(myNameValues[myNameUIPicker.selectedRowInComponent(0)])\nMVP：\(mvpNameValues[mvpNameUIPicker.selectedRowInComponent(0)])\nポイント数：\(pointValues[pointUIPicker.selectedRowInComponent(0)])", preferredStyle: .Alert)
        let otherAction = UIAlertAction(title: "OK", style: .Default) {
            action in print("pushed OK!")
        }
        let cancelAction = UIAlertAction(title: "CANCEL", style: .Cancel) {
            action in print("Pushed CANCEL!")
        }
        
        alertController.addAction(otherAction)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    private func getVoteMonth() -> String {
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        let yearUnit:NSCalendarUnit = .Year
        let monthUnit:NSCalendarUnit = .Month
        let voteCalendar = calendar.dateByAddingUnit(monthUnit, value: -1, toDate: NSDate(), options: [])
        let year = calendar.component(yearUnit, fromDate: voteCalendar!)
        let month = calendar.component(monthUnit, fromDate: voteCalendar!)
        return "\(year)年\(month)月分"
    }
}

