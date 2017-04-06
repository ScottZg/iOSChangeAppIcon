//
//  ViewController.swift
//  ChangeIcon
//
//  Created by zhanggui on 2017/4/5.
//  Copyright © 2017年 shortshot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeToPurpleAction(_ sender: UIButton) {
        if !checkSupportChangeIcon() {
            return
        }
        if !UIApplication.shared.supportsAlternateIcons {
            return
        }
        changeToIcon("purpleicon")
    }
    @IBAction func changeDefaultAction(_ sender: UIButton) {
        
        if !checkSupportChangeIcon() {
            return
        }
        if !UIApplication.shared.supportsAlternateIcons {
            return
        }
        changeToIcon(nil)
    }

    @IBAction func changeiconAction(_ sender: UIButton) {
        if !checkSupportChangeIcon() {
            return
        }
        if !UIApplication.shared.supportsAlternateIcons {
            aler(str: "不支持备用icon")
            return
        }
        changeToIcon("newicon")
    }
    //MARK: check system version
    func checkSupportChangeIcon() -> Bool {
        let deviceVersion = UIDevice.current.systemVersion
        if deviceVersion.contains("10.3") {
            return true
        }
        return false
    }
    //MARK: change to icon message
    func changeToIcon(_ iconName: String?)  {
        
        UIApplication.shared.setAlternateIconName(iconName) { (error) in
            if (error != nil) {
                self.aler(str: (error!.localizedDescription))
            }else {
                self.aler(str: "修改成功")
            }
        }

        
        
    }
    //MARK: alert message
    func aler(str: String) {
        let alert = UIAlertController.init(title: "提示", message: str, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "ok", style: .cancel) { (action: UIAlertAction) in
            print("关闭弹出框")
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

