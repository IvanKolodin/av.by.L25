//
//  ViewController.swift
//  av.by.L25
//
//  Created by Наталья Белоусова on 14.12.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let advertisementVC = AdvertisementViewController()
        let advertisementNavController = UINavigationController(rootViewController: advertisementVC)
        
        let searchVC = UIViewController()
        searchVC.view.backgroundColor = .white
        searchVC.title = "Поиск"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let subscriptionsVC = UIViewController()
        subscriptionsVC.view.backgroundColor = .white
        subscriptionsVC.title = "Подписки"
        subscriptionsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let addVC = UIViewController()
        addVC.view.backgroundColor = .white
        addVC.title = "Добавить"
        addVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        let messagesVC = UIViewController()
        messagesVC.view.backgroundColor = .white
        messagesVC.title = "Сообщения"
        messagesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 3)
        
        let menuVC = UIViewController()
        menuVC.view.backgroundColor = .white
        menuVC.title = "Меню"
        menuVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 4)
        
        viewControllers = [advertisementNavController, searchVC, subscriptionsVC, addVC, messagesVC, menuVC]
    }
}

