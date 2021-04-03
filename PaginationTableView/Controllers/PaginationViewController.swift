//
//  PaginationViewController.swift
//  PaginationTableView
//
//  Created by Angelos Staboulis on 3/4/21.
//

import UIKit

class PaginationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var numbers=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,19,20]
    var sum:Int!=0
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if indexPath.row < numbers.count {
            cell?.backgroundColor = .link
            cell?.textLabel?.textColor = .white
            cell?.textLabel?.text = String(numbers[indexPath.row])
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row ==  numbers.count - 1 {
            loadData()
        }
    }
    func loadData(){
        for _ in 0..<20{
            sum = numbers[numbers.count-1] + 1
            numbers.append(sum)
        }
        mainTableView.reloadData()
    }
    @IBOutlet var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PaginationViewController{
    func setupView(){
        mainTableView.delegate = self
        mainTableView.dataSource = self
        self.title = "Pagination TableView"
    }
}
