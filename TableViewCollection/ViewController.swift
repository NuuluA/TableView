//
//  ViewController.swift
//  TableViewCollection
//
//  Created by Арген on 19.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let nameArray = ["Argen", "Gena", "Beka", "Dasi", "Rus", "Eska", "Ulik"]
    var nameTitle = [String]()
    var nameDict = [String: [String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        ffilterName()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return nameTitle.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let nameKey = nameTitle[section]
        if let nameValue = nameDict[nameKey] {
            return nameValue.count
        }
        return nameTitle.count
//        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let nameKey = nameTitle[indexPath.section]
        if let nameValue = nameDict[nameKey] {
            cell.textLabel?.text = nameValue[indexPath.row]
        }
//        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return HeaderView.instantiate()
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 60
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nameTitle[section]
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return UIView()
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return nameTitle
    }
    
    func ffilterName() {
        for name in nameArray {
            let firstLetter = name.index(name.startIndex, offsetBy: 1)
            let nameKey = String(name[..<firstLetter])
            
            if var nameValue = nameDict[nameKey] {
                nameValue.append(nameKey)
                nameDict[nameKey] = nameValue
            } else {
                nameDict[nameKey] = [name]
            }
        }
        nameTitle = [String](nameDict.keys)
        nameTitle = nameTitle.sorted(by: {$0 < $1})
    }
}


