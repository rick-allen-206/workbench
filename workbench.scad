// Define Variables
tbx = 72;
tby = 36;
tbz = 3;
legx = 6;
legy = 4;
legz = 36-tbz;
on_legs = legz+tbz/2;
tablesaw_x = 12;
tablesaw_y = 12;
tablesaw_z = 10;

// Start Cut list section
echo("### PART LIST ###");

// Define Modules
module tabletop(x=tbx,y=tby,z=tbz) {
    cube([x,y,z],center=true);
}
module leg(x=legx,y=legy,z=legz) {
    cube([x,y,z],center=true);
    echo("Leg",x,y,z);
}
module tablesaw(x=tablesaw_x,y=tablesaw_y,z=tbz) {
    cube([x+.001,y+.001,z+.001], center=true);
}

// Create Tabletop With Cutouts
difference() {
    translate([0,0,on_legs])
    tabletop();
    translate([tbx/2-tablesaw_x/2,0,on_legs])
    tablesaw();
}

// Create Tablesaw Shelf
translate([tbx/2-2,tablesaw_y/2+1,on_legs-tablesaw_z/2])
    leg(x=4,y=2,z=tablesaw_z-tbz);
translate([tbx/2-2,-tablesaw_y/2-1,on_legs-tablesaw_z/2])
    leg(x=4,y=2,z=tablesaw_z-tbz);
translate([tbx/2-tablesaw_x-2,tablesaw_y/2+1,on_legs-tablesaw_z/2])
    leg(x=4,y=2,z=tablesaw_z-tbz);
translate([tbx/2-tablesaw_x-2,-tablesaw_y/2-1,on_legs-tablesaw_z/2])
    leg(x=4,y=2,z=tablesaw_z-tbz);
translate([tbx/2-tablesaw_x/2-2,0,on_legs-tablesaw_z+1])
    cube([tablesaw_x+4,tablesaw_y+4,2], center=true);

// Create Lower Tabletop
translate([0,0,6])
    tabletop();

// Create Legs
translate([tbx/2-legx/2,tby/2-legy/2,legz/2])
    leg();
translate([tbx/2-legx/2,-tby/2+legy/2,legz/2])
    leg();
translate([-tbx/2+legx/2,tby/2-legy/2,legz/2])
    leg();
translate([-tbx/2+legx/2,-tby/2+legy/2,legz/2])
    leg();