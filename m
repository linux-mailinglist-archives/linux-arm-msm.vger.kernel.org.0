Return-Path: <linux-arm-msm+bounces-86135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4022CD50B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2292E3043914
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CDE32BF38;
	Mon, 22 Dec 2025 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOwP1ddm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2321B32C31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391868; cv=none; b=IvTGDvhsJMqmT4E5tBFyQCamMcopNIxo9Z4ECWaut8cx9JPPGe9MC6LKxRCEyGLPa3Xm5VcRS9klizpF+nU7DhQOrPFs0xGTEdpTxm0w4OyNUAGJFymtSAOmqjzuqS2C2yZ4jLiW+y+I1Jpc7W4vpssQDc+ueq/5dqxl53kOBNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391868; c=relaxed/simple;
	bh=Sur1FbLe/TV5gZgSr7rckEnVtPl6CsAJr9HA1IILbJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZDA9eSeYmVrQgYJ09+chMcSL09cgL3Sb3UK0T5X7/RAHdJIpK98tTKWOM71LHZ5HAMaWeUMjeokuHzI+7OAvS/UJLNkSAWySnJrXokFoAPYthE4XkGHIhptWGb/TqVHy2L/vj6yDpEv/5s+Csy5627FEokzie6cHXsPxsDSATjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOwP1ddm; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so4485178b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391866; x=1766996666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgioQELFSWboGT8e1NJA/uyXbHTLXVSWlCnIL2Rpr+0=;
        b=KOwP1ddmr92W98LygNl0q83rw9foUXRUkXfafnxaKgxN8GhSaGs4YhfGtPMfY67Hro
         CJFg4vnhqCJGJVOUQNns24sXixvv/KJzw+7X2TFSAq9yj/e71tElee43hYPeproWCYHx
         vn2zIqH2PImoSYKbCCn4ej/qG4KCrZ41etGYL3rr6wO9zjZ7omAUYGwS3RRyiuRSUpSx
         d9xILFZaZbD50QUVbRyrnqMbHX+ugcAWqjixiN4bJOwAScpmt71VDBxQXJBp9h7Ba4wj
         IVe8fC79qPOtgK/MmbrINnpldhMj+yWwX+5cmSZrG7lgqgzf9/pLmUqldv383bRB3Zp/
         Xe0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391866; x=1766996666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IgioQELFSWboGT8e1NJA/uyXbHTLXVSWlCnIL2Rpr+0=;
        b=bNeg+hctXSRVyzZpT6aby59dMbUe02YVeCbDdts3aAE1eLr1Pl7rDz1ftS6RVDvBKD
         YCU4XqpcHvhBXImdMryIQDsbEmYZZjZzI6ZpXmM7x0K/8+naPveuzw3e1eXGF19b/VXq
         AMg3sazCq1WQ8GAxvHJP/DSPwDZEJhJoLQzmrh4Z0ZBhT9q++PJJuOe7wiZnr/Qn7umr
         yPB6EBaZFDN9bF8IgY8ymalPF4FfclXWq9BDQuTt6YgtNPI+vyxkyY0EjFa26FLaRTH3
         qzbVGLuQP02FmDBLZeB5egN5OOyZWu0m9nU9CWrm7g6yZWsFljD///O6FAJ/U6KeYMJi
         nc2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpqLRPJk8bx4o/NOtN+a6Dh5vf7SvQUr42t7XultRzhE8bWngfMTMdAbpEyoEVxoSzJb2Y18kzCrGMSDuN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6A22AgpnwBEUZ5+7/hJsOwv/Z4KaqNGdxMY7/sDnTPeeSHHnE
	8yJhFP1VbUdCxRkrxgEyz86INBtwqX3Q+cwbE1964cxJbhogoxxuzJC2
X-Gm-Gg: AY/fxX7vFz9moQTgaDh671IrCwx2aMaSoTB2AIzxy4Pl1uj7tsPVKZIyl6YG+ErcguN
	kzc8FBqJjghC7GQdc+ai6hCWs8LYdWbm8LnbPFU/BESrzW47bMFacQWAg2uqITP46mvpXlFv4k1
	X4SjShoebrJyLumtAHXwHDOCB/+uqbJblEBv7SvKTqllri7q2XujOUYqILKncnz4VHHOfZaNoso
	5JkhQkeR2gfpr3p4GEWej13FsiY8UntUKYMB/co65mAgu04tE3+y3qx+HRUWZvHIPqcoACGZoht
	OCnV9/RG5s8VHswrw0Xd2m8eEbQmT7I3xIamdP18wMx2ZN3qkzsm3dVN5auZX2Gbt0XnR/V+gCe
	zPGza+PIN87YJEE6bczIAueLIWBAC83i1fEe36az/2O0weIJTAAnS9JdXqDyt8lfsp4HsA+VGvE
	HFWFSEGwV0
X-Google-Smtp-Source: AGHT+IF+KaYFdeN4pnc8jVOwLwBdDe1Ay4y8vjxtIpuGDaNQD1P00mPetARGOEojrEyFvSnKgXRWEw==
X-Received: by 2002:a05:6a00:1d19:b0:7e8:43f5:bd29 with SMTP id d2e1a72fcca58-7ff6795ad53mr9717563b3a.62.1766391866317;
        Mon, 22 Dec 2025 00:24:26 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:24:25 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v7 17/31] dyndbg: move mod_name down from struct ddebug_table to _ddebug_info
Date: Mon, 22 Dec 2025 21:20:34 +1300
Message-ID: <20251222082049.1782440-18-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct _ddebug_info already has most of dyndbg's info for a module;
push debug_table.mod_name down into it, finishing the encapsulation.

This allows refactoring several callchains, passing &_ddebug_info
instead of &ddebug_table, and hoisting the "&dt->info" deref up
instead of repeating it thru the callchans

ddebug_table contains a _ddebug_info member, so its users keep access
to mod_name, just now with "->info." added in.

In static ddebug_add_module(&di), reinforce the cursor-model by
dropping the modname arg, and setting di->mod_name at each caller.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  1 +
 lib/dynamic_debug.c           | 50 ++++++++++++++++++-----------------
 2 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4775f66e96dd..10f1a2a1bee4 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -107,6 +107,7 @@ struct _ddebug_class_maps {
 };
 
 struct _ddebug_info {
+	const char *mod_name;
 	struct _ddebug_descs descs;
 	struct _ddebug_class_maps maps;
 };
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d668140794ac..77972da271ee 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -46,7 +46,6 @@ extern struct _ddebug_class_map __stop___dyndbg_class_maps[];
 
 struct ddebug_table {
 	struct list_head link;
-	const char *mod_name;
 	struct _ddebug_info info;
 };
 
@@ -253,10 +252,11 @@ static int ddebug_change(const struct ddebug_query *query,
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry(dt, &ddebug_tables, link) {
+		struct _ddebug_info *di = &dt->info;
 
 		/* match against the module name */
 		if (query->module &&
-		    !match_wildcard(query->module, dt->mod_name))
+		    !match_wildcard(query->module, di->mod_name))
 			continue;
 
 		if (query->class_string) {
@@ -268,8 +268,8 @@ static int ddebug_change(const struct ddebug_query *query,
 			valid_class = _DPRINTK_CLASS_DFLT;
 		}
 
-		for (i = 0; i < dt->info.descs.len; i++) {
-			struct _ddebug *dp = &dt->info.descs.start[i];
+		for (i = 0; i < di->descs.len; i++) {
+			struct _ddebug *dp = &di->descs.start[i];
 
 			if (!ddebug_match_desc(query, dp, valid_class))
 				continue;
@@ -289,7 +289,7 @@ static int ddebug_change(const struct ddebug_query *query,
 #endif
 			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
 				  trim_prefix(dp->filename), dp->lineno,
-				  dt->mod_name, dp->function,
+				  di->mod_name, dp->function,
 				  ddebug_describe_flags(dp->flags, &fbuf),
 				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
@@ -1156,12 +1156,12 @@ static bool ddebug_class_in_range(const int class_id, const struct _ddebug_class
 		class_id < map->base + map->length);
 }
 
-static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
+static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp)
 {
 	struct _ddebug_class_map *map;
 	int i;
 
-	for_subvec(i, map, &dt->info, maps)
+	for_subvec(i, map, di, maps)
 		if (ddebug_class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1189,13 +1189,13 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 
 	seq_printf(m, "%s:%u [%s]%s =%s \"",
 		   trim_prefix(dp->filename), dp->lineno,
-		   iter->table->mod_name, dp->function,
+		   iter->table->info.mod_name, dp->function,
 		   ddebug_describe_flags(dp->flags, &flags));
 	seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
 	seq_putc(m, '"');
 
 	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
-		class = ddebug_class_name(iter->table, dp);
+		class = ddebug_class_name(&iter->table->info, dp);
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
@@ -1247,7 +1247,7 @@ static const struct proc_ops proc_fops = {
 
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
-	vpr_info("module:%s attached %d classes\n", dt->mod_name, dt->info.maps.len);
+	vpr_info("module:%s attached %d classes\n", dt->info.mod_name, dt->info.maps.len);
 }
 
 /*
@@ -1265,7 +1265,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	typeof(_dst) __dst = (_dst);					\
 	int __nc = 0;							\
 	for_subvec(_i, _sp, _box, _vec) {				\
-		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+		if (!strcmp((_sp)->mod_name, (__dst)->info.mod_name)) {	\
 			if (!__nc++)					\
 				(__dst)->info._vec.start = (_sp);	\
 		} else {						\
@@ -1280,7 +1280,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
  */
-static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
+static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
@@ -1289,20 +1289,19 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	if (!di->descs.len)
 		return 0;
 
-	v3pr_info("add-module: %s %d sites\n", modname, di->descs.len);
+	v3pr_info("add-module: %s %d sites\n", di->mod_name, di->descs.len);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-		pr_err("error adding module: %s\n", modname);
+		pr_err("error adding module: %s\n", di->mod_name);
 		return -ENOMEM;
 	}
 	/*
-	 * For built-in modules, name lives in .rodata and is
-	 * immortal. For loaded modules, name points at the name[]
-	 * member of struct module, which lives at least as long as
-	 * this struct ddebug_table.
+	 * For built-in modules, name (as supplied in di by its
+	 * callers) lives in .rodata and is immortal. For loaded
+	 * modules, name points at the name[] member of struct module,
+	 * which lives at least as long as this struct ddebug_table.
 	 */
-	dt->mod_name = modname;
 	dt->info = *di;
 
 	INIT_LIST_HEAD(&dt->link);
@@ -1316,7 +1315,7 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
+	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
 }
 
@@ -1379,7 +1378,7 @@ static int ddebug_remove_module(const char *mod_name)
 
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry_safe(dt, nextdt, &ddebug_tables, link) {
-		if (dt->mod_name == mod_name) {
+		if (dt->info.mod_name == mod_name) {
 			ddebug_table_free(dt);
 			ret = 0;
 			break;
@@ -1399,7 +1398,8 @@ static int ddebug_module_notify(struct notifier_block *self, unsigned long val,
 
 	switch (val) {
 	case MODULE_STATE_COMING:
-		ret = ddebug_add_module(&mod->dyndbg_info, mod->name);
+		mod->dyndbg_info.mod_name = mod->name;
+		ret = ddebug_add_module(&mod->dyndbg_info);
 		if (ret)
 			WARN(1, "Failed to allocate memory: dyndbg may not work properly.\n");
 		break;
@@ -1497,7 +1497,8 @@ static int __init dynamic_debug_init(void)
 			mod_ct++;
 			di.descs.len = mod_sites;
 			di.descs.start = iter_mod_start;
-			ret = ddebug_add_module(&di, modname);
+			di.mod_name = modname;
+			ret = ddebug_add_module(&di);
 			if (ret)
 				goto out_err;
 
@@ -1508,7 +1509,8 @@ static int __init dynamic_debug_init(void)
 	}
 	di.descs.len = mod_sites;
 	di.descs.start = iter_mod_start;
-	ret = ddebug_add_module(&di, modname);
+	di.mod_name = modname;
+	ret = ddebug_add_module(&di);
 	if (ret)
 		goto out_err;
 
-- 
2.52.0


