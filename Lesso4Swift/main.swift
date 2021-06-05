//
//  main.swift
//  Lesso4Swift
//
//  Created by Olga Chumakova on 05.06.2021.
//

import Foundation


//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

    class Car{
    let carBrand: String
    let yearOfProduction: Int
  
    var engineState: EngineState
    var doorsState: DoorsState
    var windowsState: WindowsState
    var gastankState: GastankState
    
//Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
        
        enum EngineState: String {
            case started, stopped
        }
        enum DoorsState {
            case opened, closed
        }
        enum WindowsState{
            case opened, closed
        }
        enum GastankState{
            case filled,  emptied
        }
        enum Roof {
            case installed, removed
        }
        enum Trunk {
            case loaded, emptied
        }
        
        init(carBrand: String, yearOfProduction: Int, engineState: EngineState, doorsState: DoorsState, windowsState: WindowsState,gastankState: GastankState) {
            
        self.carBrand = carBrand
        self.yearOfProduction = yearOfProduction
       
        self.engineState = engineState
        self.doorsState = doorsState
        self.windowsState = windowsState
        self.gastankState = gastankState
    }
    func actionsEngine(to: EngineState) {}
    func actionsWindows(to: WindowsState) {}
    func actionsDoors(to: DoorsState) {}
    func actionsGastank(to: GastankState){}
      
        
        func info() {
               print("Brand - \(self.carBrand)")
               print("Year - \(self.yearOfProduction)")
        }
    }
    
    //2. Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
    
        class SportCar: Car {
            
            var roof: Roof
            
            init(carBrand: String,
                 yearOfProduction: Int,
                 engineState: EngineState,
                 doorsState: DoorsState,
                 windowsState: WindowsState,
                 gastankState: GastankState,
                 roof: Roof){
                
                self.roof = roof
                
                super.init(carBrand: carBrand,
                           yearOfProduction: yearOfProduction,
                           engineState: engineState,
                           doorsState: doorsState,
                           windowsState: windowsState,
                           gastankState: gastankState)
            }
            func changeRoofState(){
                print("Now roof is \(self.roof)")
            }
            
          
//В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
           
            
            override func actionsEngine(to: Car.EngineState) {
                engineState = to
                print("Now engine  is \(self.engineState)")
            }
            override func actionsWindows(to: Car.WindowsState) {
                print("Now windows are  \(self.windowsState)")
            }
           
            override func info() {
                super.info()
            }
        }
    
        
        class TrunkCar: Car {
            
            var trunk: Trunk
            
            init(carBrand: String,
                 yearOfProduction: Int,
                 engineState: EngineState,
                 doorsState: DoorsState,
                 windowsState: WindowsState,
                 gastankState: GastankState,
                 trunk: Trunk) {
                
                self.trunk = trunk
                
                super.init(carBrand: carBrand,
                           yearOfProduction: yearOfProduction,
                           engineState: engineState,
                           doorsState: doorsState,
                           windowsState: windowsState,
                           gastankState: gastankState)
            }
            func changeTrunkState(){
                print("Now trunk is loaded")
            }
            
            
            func changeTrunkState(to: Car.Trunk) {
            trunk = to
                print("Now trunk is \(self.trunk)")
            }
//В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
            
            override func actionsDoors(to: Car.DoorsState) {
                print("Now windows are \(self.doorsState)")
            }
            override func actionsGastank(to: Car.GastankState) {
                gastankState = to
                print("Now gastank is  \(self.gastankState) ")
            }
            override func info() {
                super.info()
            }
        }
  
//Создать несколько объектов каждого класса. Применить к ним различные действия.
//Вывести значения свойств экземпляров в консоль.


var sportcar1 = SportCar(carBrand: "Mercedes", yearOfProduction: 2020, engineState: .started, doorsState: .closed, windowsState: .closed, gastankState: .filled, roof: .installed)

sportcar1.info()
print("Engine \(sportcar1.engineState)")
print("Doors \(sportcar1.doorsState)")
print("Windows \(sportcar1.windowsState)")
print("Gastank \(sportcar1.gastankState)")
print("Roof \(sportcar1.roof)")
sportcar1.changeRoofState()
sportcar1.actionsEngine(to: .started)
sportcar1.actionsWindows(to: .closed)
print("---------------------------")

var sportcar2 = SportCar(carBrand: "Ford", yearOfProduction: 2010, engineState: .stopped, doorsState: .opened, windowsState: .opened, gastankState: .emptied, roof: .removed)

sportcar2.info()
print("Engine \(sportcar2.engineState)")
print("Doors \(sportcar2.doorsState)")
print("Windows \(sportcar2.windowsState)")
print("Gastank \(sportcar2.gastankState)")
print("Roof \(sportcar2.roof)")
sportcar2.changeRoofState()
sportcar2.actionsEngine(to: .stopped)
sportcar2.actionsWindows(to: .opened)
print("---------------------------")

var trunk1 = TrunkCar(carBrand: "Volvo", yearOfProduction: 2018, engineState: .started, doorsState: .closed, windowsState: .closed, gastankState: .filled, trunk: .loaded)

trunk1.info()
print("Engine \(trunk1.engineState)")
print("Doors \(trunk1.doorsState)")
print("Windows \(trunk1.windowsState)")
print("Gastank \(trunk1.gastankState)")
print("Trunk \(trunk1.trunk)")
trunk1.changeTrunkState()
trunk1.actionsDoors(to: .closed)
trunk1.actionsGastank(to: .filled)
print("---------------------------")

var trunk2 = TrunkCar(carBrand: "ZIL", yearOfProduction: 2015, engineState: .stopped, doorsState: .opened, windowsState: .opened, gastankState: .emptied, trunk: .emptied)

trunk2.info()
print("Engine \(trunk2.engineState)")
print("Doors \(trunk2.doorsState)")
print("Windows \(trunk2.windowsState)")
print("Gastank \(trunk2.gastankState)")
print("Trunk \(trunk2.trunk)")
trunk2.changeTrunkState()
trunk2.actionsDoors(to: .opened)
trunk2.actionsGastank(to: .emptied)


