//
//  MenuBarItem.swift
//  iGlance
//
//  Created by Dominik on 23.01.20.
//  Copyright © 2020 D0miH. All rights reserved.
//

import Cocoa

protocol MenuBarItemProtocol {
    /**
     * Updates the icon of the menu bar item. This function is called during every update interval.
     */
    func updateMenuBarIcon()
}

class MenuBarItemClass {
    let statusItem: NSStatusItem

    /// holds all the menu items for the menu. The menu is rebuild everytime an item is added or removed.
    var menuItems: [NSMenuItem] = [] {
        didSet {
            // rebuild the menu if a new item was added
            buildMenu()
        }
    }

    init() {
        // create the status item
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        // build the menu once
        buildMenu()
    }

    /**
     * Updates the menu bar item. This function is called during every update interval.
     */
    func update() {
        updateMenuBarIcon()
        updateMenuBarMenu()
    }

    /**
    * Updates the icon of the menu bar item. This function is called during every update interval.
    */
    func updateMenuBarIcon() {
    }

    /**
    * Updates the menu of the menu bar item. This function is called during every update interval.
    */
    func updateMenuBarMenu() {
    }

    /**
     * Displays the menu bar item in the menu bar.
     */
    func show() {
        statusItem.isVisible = true
    }

    /**
     * Hides the menu bar item in the menu bar.
     */
    func hide() {
        statusItem.isVisible = false
    }

    // MARK: -
    // MARK: Private Functions

    /**
     * Creates the menu
     */
    private func buildMenu() {
        let menu = NSMenu()

        // add all custom menu items
        for item in menuItems {
            menu.addItem(item)
        }

        // add the settings button to the menu
        menu.addItem(NSMenuItem(title: "Settings", action: #selector(AppDelegate.showMainWindow), keyEquivalent: ","))

        // add the quit button to the menu
        menu.addItem(NSMenuItem(title: "Quit iGlance", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))

        // set the menu for the status item
        self.statusItem.menu = menu
    }
}

typealias MenuBarItem = MenuBarItemClass & MenuBarItemProtocol
