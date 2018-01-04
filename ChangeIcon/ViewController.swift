//
//  ViewController.swift
//  ChangeIcon
//
//  Created by zhanggui on 2017/4/5.
//  Copyright © 2017年 shortshot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func changeToPurpleAction(_ sender: UIButton) {
        changeToIcon("purpleicon")
    }
    @IBAction func changeDefaultAction(_ sender: UIButton) {
        changeToIcon(nil)
    }

    @IBAction func changeiconAction(_ sender: UIButton) {
        changeToIcon("newicon")
    }
    //MARK: check system version
    func checkSupportChangeIcon() -> Bool {
        if #available(iOS 10.3, *) {  //判断系统版本是否是10.3+
            if UIApplication.shared.supportsAlternateIcons {
                return true;
            }else {
                aler(str: "不支持备用icon")
                return false;
            }
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

