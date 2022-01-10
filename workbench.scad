tbx = 72;
tby = 36;
tbz = 3;
legx = 6;
legy = 4;
legz = 36;
tablesaw_x = 4;
tablesaw_Y = 4;
tablesaw_z = 4;

module tabletop() {
    cube([72,36,3.5],center=true);
}
module leg(x=6,y=4,z=36) {
    cube([x,y,z-tbz+.001],center=true);
}
module tablesaw(x=tablesaw_x, tablesaw_y, tbz) {
    difference()
    cube([x,y,z], center=true);
}

translate([0,0,36])
    tabletop();
translate([0,0,6])
    tabletop();

translate([tbx/2-legx/2,tby/2-legy/2,legz/2])
    leg();
translate([tbx/2-legx/2,-tby/2+legy/2,legz/2])
    leg();
translate([-tbx/2+legx/2,tby/2-legy/2,legz/2])
    leg();
translate([-tbx/2+legx/2,-tby/2+legy/2,legz/2])
    leg();
