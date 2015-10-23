//: Playground - noun: a place where people can play

import Cocoa

/**
 Vehicles can have different properties and functionality.
 
 All Vehicles:
 - Have a speed at which they move
 - Calculate the duration it will take them to travel a certain distance
 
 All Vehicles except a Motorcycle and a Container Ship:
 - Have an amount of Windows
 
 Only Ground Vehicles:
 - Have an amount of wheels
 
 Only Buses:
 - Have a seating capacity
 
 Only Vessels:
 - Have a length
 
 Create the following Vehicles types: Car, Bus, ContainerShip, Boat, Motorcycle
 
 ----
 
 The solution below does not use protocols, it relies solely on subclassing. Can you use protocols to improve the solution?
 **/

typealias KilometersPerHour = Double
typealias Kilometers = Double
typealias Hours = Double

protocol VehicleType
{
    var speed: KilometersPerHour { get }
    func travelDuration(distance: Kilometers?) -> Double
}
protocol GroundVehicleType { var wheels: Int { get } }
protocol BusType           { var seats:  Int { get } }
protocol VesselType        { var length: Int { get } }

enum Vehicles
{
    case Car          (wheels:  Int, windows: Int)
    case Motocycle    (wheels:  Int, windows: Int)
    case Bus          (wheels:  Int, windows: Int, seats: Int)
    case Vessel       (length:  Int, windows: Int)
    case ContainerShip(length:  Int)
}

extension VehicleType
{
    func travelDuration(distance: Kilometers = 100) -> Double
    {
        return ( distance / speed )
    }
}

struct Car: GroundVehicleType, VehicleType
{
    var windows = 4
    var wheels  = 4
    var speed   = 70
}

struct MotorCycle: GroundVehicleType, VehicleType
{
    var wheels = 2
    var speed  = 90
}

struct Bus: GroundVehicleType, BusType, VehicleType
{
    var wheels  = 4
    var seats   = 80
    var windows = 20
}

struct Boat: VehicleType, VesselType
{
    var windows = 0
    var speed   = 45
}

struct ContainerShip: VehicleType, VesselType
{
    var length = 5
    var speed  = 45
}
