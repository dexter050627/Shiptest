/obj/item/wallframe/airalarm
	icon = 'mod_celadon/_storage_icons/icons/resprite/monitors.dmi'

/obj/machinery/airalarm
	icon = 'mod_celadon/_storage_icons/icons/resprite/monitors.dmi'

/obj/machinery/airalarm/update_overlays()
	. = ..()
	if((machine_stat & (NOPOWER|BROKEN)) || shorted)
		return
	var/area/A = get_area(src)
	var/perc_danger_level = max(danger_level, A.atmosalm)
	if(!panel_open)
		var/emissive_state
		switch(perc_danger_level)
			if(0)
				emissive_state = "alarm0"
			if(1)
				emissive_state = "alarm1"
			if(2)
				emissive_state = "alarm2"

		. += mutable_appearance(icon, emissive_state)
		. += mutable_appearance(icon, "light_emissive", layer, EMISSIVE_PLANE)

	if(perc_danger_level) //When there's any danger level, light up the "AIR" sign too
		. += mutable_appearance(icon, "alarm_sign")
		. += mutable_appearance(icon, "alarm_sign", layer, EMISSIVE_PLANE)

/obj/item/wallframe/firealarm
	icon = 'mod_celadon/_storage_icons/icons/resprite/monitors.dmi'

/obj/machinery/firealarm
	icon = 'mod_celadon/_storage_icons/icons/resprite/monitors.dmi'

/obj/machinery/firealarm/update_overlays()
	. = ..()
	if(machine_stat & NOPOWER)
		return


	. += "fire_[SEC_LEVEL_GREEN]"
	SSvis_overlays.add_vis_overlay(src, icon, "fire_[SEC_LEVEL_GREEN]", layer, plane, dir)
	SSvis_overlays.add_vis_overlay(src, icon, "fire_[SEC_LEVEL_GREEN]", layer, EMISSIVE_PLANE, dir)



