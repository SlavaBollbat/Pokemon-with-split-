//
//  PokemonTableViewController.swift
//  Pokemon (with split)
//
//  Created by Слава on 12.08.2018.
//  Copyright © 2018 Слава. All rights reserved.
//

import UIKit

class PokemonTableViewController: UITableViewController {
    
    weak var delegate: PokemonDelegate?

    var arrayOfPokemons = ["bulbasaur", "pikachu", "mewtwo"]
    
    @IBOutlet var pokemonTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return arrayOfPokemons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = pokemonTableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath)
            as? PokemonCell else {return UITableViewCell()}
        
        cell.pokemonImage.image = UIImage(named: arrayOfPokemons[indexPath.row])
        cell.pokemonLabel.text = arrayOfPokemons[indexPath.row]
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let image = UIImage(named: arrayOfPokemons[indexPath.row]) else {return}

        delegate?.pokemonSelected(image)
    }


}
