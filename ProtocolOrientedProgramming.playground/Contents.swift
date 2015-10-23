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
    func travelDuration(distance: Kilometers?) -> KilometersPerHour
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
    func travelDuration(distance: Kilometers = 100) -> KilometersPerHour
    {
        return ( distance / speed )
    }
}

struct Car: GroundVehicleType, VehicleType
{
    var speed: KilometersPerHour = 70
    var windows: Int = 4
    var wheels: Int  = 4
}

struct MotorCycle: GroundVehicleType, VehicleType
{
    var speed: KilometersPerHour  = 90
    var wheels = 2
}

struct Bus: GroundVehicleType, BusType, VehicleType
{
    var speed: KilometersPerHour = 55
    var windows = 20
    var wheels  = 4
    var seats   = 80

}

struct Boat: VehicleType, VesselType
{
    var speed: KilometersPerHour = 30
    var windows = 90
    var length = 40
}

struct ContainerShip: VehicleType, VesselType
{
    var speed: KilometersPerHour  = 25
    var length = 55
}
