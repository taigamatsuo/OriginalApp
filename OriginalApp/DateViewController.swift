//
//  DateViewController.swift
//  OriginalApp
//
//  Created by 松尾大雅 on 2019/10/11.
//  Copyright © 2019 litech. All rights reserved.
//

import UIKit

class DateViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let DateArray: NSMutableArray = [
    "1","2","3"]
    
    
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var addButton: UIBarButtonItem!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Cellの登録.
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        // DataSourceの設定.
        myTableView.dataSource = self

        // Delegateを設定.
        myTableView.delegate = self

        // 罫線を青色に設定.
        myTableView.separatorColor = UIColor.blue

        // 編集中のセル選択を許可.
        myTableView.allowsSelectionDuringEditing = true

        // TableViewをViewに追加する.
       // self.view.addSubview(myTableView)
       }
    
    
    
    /*
     addButtonが押された際呼び出される
     */
    @IBAction func addCell(sender: AnyObject) {
        print("追加")

        // textArryに追加.
       DateArray.add("新しいセル")

        // TableViewを再読み込み.
        myTableView.reloadData()
    }
    
   
    
        //セクション数を指定
       func numberOfSections(in tableView: UITableView) -> Int {
           print("セクション数：1")
           return 1
       }
       //セクションタイトルを指定
       func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return "\(section)組"
       }
    
    //セル数を指定
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return DateArray.count
          }
       //セル数を指定
//       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//           print("セル数：3")
//           return 3
//       }
       //セルを生成
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           print("セルの値を入れていく")
           let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
                                      reuseIdentifier: "aaa\(indexPath.section)-\(indexPath.row)")
          cell.textLabel?.text = " 日にち"
           cell.detailTextLabel?.text = "\(indexPath.row + 1)番"
           //cell.detailTextLabel?.numberOfLines = 0
           //cell.detailTextLabel?.text = textArry[indexPath.row]
           cell.imageView?.image = UIImage(named: "calender_himekuri.png")
           return cell
       }

    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print ("押されました")
            switch indexPath.row {
            case 0:
                // 数学Iのセルタップ時処理
                // 以下はセグエで数学Iの画面遷移する場合の例
                self.performSegue(withIdentifier: "toDate", sender: nil)
            case 1:
                // 数学Aのセルタップ時
                 self.performSegue(withIdentifier: "toInfo", sender: nil)
            case 2:
                // 数学IIのセルタップ時
                 self.performSegue(withIdentifier: "toDiary", sender: nil)
            case 3:
                // 数学Bのセルタップ時
                 self.performSegue(withIdentifier: "toDate", sender: nil)
            case 4:
                // 数学IIIのセルタップ時
                self.performSegue(withIdentifier: "toDate", sender: nil)
            case 5:
                // 数学Cのセルタップ時
                self.performSegue(withIdentifier: "toDate", sender: nil)
    
            default:
                self.performSegue(withIdentifier: "toDate", sender: nil)
            }
        }
    
    
    
    /*
     Cellを挿入または削除しようとした際に呼び出される
     */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        // 削除のとき.
        if editingStyle == UITableViewCell.EditingStyle.delete {
            print("削除")

            // 指定されたセルのオブジェクトをtextArryから削除する.
            DateArray.removeObject(at: indexPath.row)

            // TableViewを再読み込み.
            myTableView.reloadData()
        }
    }


    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
