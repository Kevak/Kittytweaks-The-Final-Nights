/// The directory in which ALL log files should be stored
GLOBAL_VAR(log_directory)
GLOBAL_PROTECT(log_directory)

#define DECLARE_LOG_NAMED(log_var_name, log_file_name, start)\
GLOBAL_VAR(##log_var_name);\
GLOBAL_PROTECT(##log_var_name);\
/world/_initialize_log_files(temp_log_override = null){\
	..();\
	GLOB.##log_var_name = temp_log_override || "[GLOB.log_directory]/[##log_file_name].log";\
	if(!temp_log_override && ##start){\
		start_log(GLOB.##log_var_name);\
	}\
}

#define DECLARE_LOG(log_name, start) DECLARE_LOG_NAMED(##log_name, "[copytext(#log_name, 1, length(#log_name) - 3)]", start)
#define START_LOG TRUE
#define DONT_START_LOG FALSE

/// Populated by log declaration macros to set log file names and start messages
/world/proc/_initialize_log_files(temp_log_override = null)
	// Needs to be here to avoid compiler warnings
	SHOULD_CALL_PARENT(TRUE)
	return


#if defined(UNIT_TESTS) || defined(SPACEMAN_DMM)
DECLARE_LOG_NAMED(test_log, "tests", START_LOG)
#endif

GLOBAL_VAR(world_game_log)
GLOBAL_PROTECT(world_game_log)
GLOBAL_VAR(world_runtime_log)
GLOBAL_PROTECT(world_runtime_log)
GLOBAL_VAR(world_qdel_log)
GLOBAL_PROTECT(world_qdel_log)
GLOBAL_VAR(world_attack_log)
GLOBAL_PROTECT(world_attack_log)
GLOBAL_VAR(world_econ_log)
GLOBAL_PROTECT(world_econ_log)
GLOBAL_VAR(world_href_log)
GLOBAL_PROTECT(world_href_log)
GLOBAL_VAR(round_id)
GLOBAL_PROTECT(round_id)
GLOBAL_VAR(config_error_log)
GLOBAL_PROTECT(config_error_log)
GLOBAL_VAR(sql_error_log)
GLOBAL_PROTECT(sql_error_log)
GLOBAL_VAR(world_pda_log)
GLOBAL_PROTECT(world_pda_log)
GLOBAL_VAR(world_uplink_log)
GLOBAL_PROTECT(world_uplink_log)
GLOBAL_VAR(world_telecomms_log)
GLOBAL_PROTECT(world_telecomms_log)
GLOBAL_VAR(world_speech_indicators_log)
GLOBAL_PROTECT(world_speech_indicators_log)
GLOBAL_VAR(world_manifest_log)
GLOBAL_PROTECT(world_manifest_log)
GLOBAL_VAR(query_debug_log)
GLOBAL_PROTECT(query_debug_log)
GLOBAL_VAR(world_job_debug_log)
GLOBAL_PROTECT(world_job_debug_log)
GLOBAL_VAR(world_mecha_log)
GLOBAL_PROTECT(world_mecha_log)
GLOBAL_VAR(world_virus_log)
GLOBAL_PROTECT(world_virus_log)
GLOBAL_VAR(world_asset_log)
GLOBAL_PROTECT(world_asset_log)
GLOBAL_VAR(world_cloning_log)
GLOBAL_PROTECT(world_cloning_log)
GLOBAL_VAR(world_map_error_log)
GLOBAL_PROTECT(world_map_error_log)
GLOBAL_VAR(world_paper_log)
GLOBAL_PROTECT(world_paper_log)
GLOBAL_VAR(tgui_log)
GLOBAL_PROTECT(tgui_log)
GLOBAL_VAR(world_shuttle_log)
GLOBAL_PROTECT(world_shuttle_log)

GLOBAL_VAR(perf_log)
GLOBAL_PROTECT(perf_log)

GLOBAL_VAR(demo_log)
GLOBAL_PROTECT(demo_log)

GLOBAL_LIST_EMPTY(bombers)
GLOBAL_PROTECT(bombers)
GLOBAL_LIST_EMPTY(admin_log)
GLOBAL_PROTECT(admin_log)
GLOBAL_LIST_EMPTY(lastsignalers)	//keeps last 100 signals here in format: "[src] used [REF(src)] @ location [src.loc]: [freq]/[code]"
GLOBAL_PROTECT(lastsignalers)
GLOBAL_LIST_EMPTY(lawchanges) //Stores who uploaded laws to which silicon-based lifeform, and what the law was
GLOBAL_PROTECT(lawchanges)

GLOBAL_LIST_EMPTY(combatlog)
GLOBAL_PROTECT(combatlog)
GLOBAL_LIST_EMPTY(IClog)
GLOBAL_PROTECT(IClog)
GLOBAL_LIST_EMPTY(OOClog)
GLOBAL_PROTECT(OOClog)
GLOBAL_LIST_EMPTY(adminlog)
GLOBAL_PROTECT(adminlog)

GLOBAL_LIST_EMPTY(active_turfs_startlist)

/////Picture logging
GLOBAL_VAR(picture_log_directory)
GLOBAL_PROTECT(picture_log_directory)

GLOBAL_VAR_INIT(picture_logging_id, 1)
GLOBAL_PROTECT(picture_logging_id)
GLOBAL_VAR(picture_logging_prefix)
GLOBAL_PROTECT(picture_logging_prefix)
/////

#undef DECLARE_LOG
#undef DECLARE_LOG_NAMED
#undef START_LOG
#undef DONT_START_LOG
