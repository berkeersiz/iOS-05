//
//  ViewController.swift
//  6-LandmarkBook
//
//  Created by Berke Ersiz on 19.08.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [String]()
    var landmakImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonhenge")
        landmarkNames.append("Taj Mahal")
        
        
        landmakImages.append(UIImage(named: "colosseum")!)
        landmakImages.append(UIImage(named: "greatwall")!)
        landmakImages.append(UIImage(named: "kremlin")!)
        landmakImages.append(UIImage(named: "stonehenge")!)
        landmakImages.append(UIImage(named: "tacmahal")!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = "test" --Old--

        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row] // Hangi sıradaysa o gözükmesi için.
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmakImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    //Delete -ilerleyen derslerde veritabanından da komple silme olucak.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            self.landmarkNames.remove(at: indexPath.row)
            self.landmakImages.remove(at: indexPath.row)
            //Fonksiyonun içine ifin içine girdikçe self kullanmak hani veriyi belirttiğimizi net ifade eder.
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


}

