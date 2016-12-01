//
//  TableViewController.swift
//  DictionaryForDatasource
//
//  Created by Andrew Belozerov on 01.12.16.
//  Copyright © 2016 Andrew Belozerov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var bDays = [
        "Март": ["Андрей", "Сергей", "Юлия"],
        "Июнь": ["Дмитрий", "Роман"],
        "Август": ["Мария", "Павел"]]
    
    
    struct Objects {  //Вспомогательная структура
        var sectionName : String!
        var sectionObjects : [String]!
    }
    
    var objectArray = [Objects]() // Источник данных
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for (key, value) in bDays {
            objectArray.append(Objects(sectionName: key, sectionObjects: value))
        }
    }


    // MARK: - Table view data source

    
    // Получим количество секций в таблице
    override func numberOfSections(in tableView: UITableView) -> Int {
        return objectArray.count
    }
    
    
    // Получим количество строк для конкретной секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray[section].sectionObjects.count
    }
    
    
    // Получим заголовок для секции
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectArray[section].sectionName
    }
    
    
    // Получим данные для использования в ячейке
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = objectArray[indexPath.section].sectionObjects[indexPath.row]
        return cell
    }

}
