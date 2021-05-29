//
//  HeaderView.swift
//  TableViewCollection
//
//  Created by Арген on 22.05.2021.
//

import UIKit

class HeaderView: UIView {
    static func instantiate() -> HeaderView {
        let view: HeaderView = initFromNib()
        return view
    }
}

//Razshiraem UIView sozdaem metod Generic
extension UIView {
    class func initFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)? [0] as! T
    }
    
}
