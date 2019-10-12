//
//  DiaryViewController.swift
//  OriginalApp
//
//  Created by 松尾大雅 on 2019/10/11.
//  Copyright © 2019 litech. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController , UITextViewDelegate , UIScrollViewDelegate   {

   
//UITextfieldに紐づいてる
    @IBOutlet  var dateField: UITextField!
    var argString = ""
    //UIDatePickerを定義するための変数
    var datePicker: UIDatePicker = UIDatePicker()


    override func viewDidLoad() {
        super.viewDidLoad()

        // ピッカー設定
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        dateField.inputView = datePicker

        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)

        // インプットビュー設定(紐づいているUITextfieldへ代入)
        dateField.inputView = datePicker
        dateField.inputAccessoryView = toolbar
    }

    // UIDatePickerのDoneを押したら発火
    @objc func done() {
        dateField.endEditing(true)

        // 日付のフォーマット
        let formatter = DateFormatter()

        //"yyyy年MM月dd日"を"yyyy/MM/dd"したりして出力の仕方を好きに変更できるよ
        formatter.dateFormat = "yyyy年MM月dd日"

        //(from: datePicker.date))を指定してあげることで
        //datePickerで指定した日付が表示される
        dateField.text = "\(formatter.string(from: datePicker.date))"
    }

    // ①セグエ実行前処理
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
           // ②Segueの識別子確認
           if segue.identifier == "toDate" {
    
               // ③遷移先ViewCntrollerの取得
               let nextView = segue.destination as! DateViewController
    
               // ④値の設定
               nextView.argString = dateField.text!
           }
       }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
