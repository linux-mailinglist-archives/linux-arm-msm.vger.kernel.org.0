Return-Path: <linux-arm-msm+bounces-67527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C175FB19242
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E19C5177C88
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F74D281370;
	Sun,  3 Aug 2025 03:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IacL8ANA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43260280CC8;
	Sun,  3 Aug 2025 03:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193532; cv=none; b=GAaxwhddujzxHGrK6hhZapb7E/9NZF0I3oztM4z5rpren+0BbXX/aCPVZ5thHj2yA7GRrTVT5PL2s7tTn8WqTpqmQepbi2sEJNzeqVjpN07paKDn7Fn5ipvv5Fz8tsXN/iqZemKB7/uSLqmqqkzeip1XMgfr70MJzMPkiU0ifVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193532; c=relaxed/simple;
	bh=WTb1c1aO86V04FFdGKr8wh3r9rPdQzoyUUxDa7EEch8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ioPSwdyHSOTivtuy9v4j4GJrbIhlFNN/iKBtYvWD1fYC/8uZuB617gxs0XW0Y4E/RdsBRlfaz4C33IRv+eAptX1hVod2i6//q7qbQq/VPaW5AN5ULGpW7INZ92BWFiRg95TbY0sqbhS28r2+MiTzl1BuqAH9hj2YDLy968adYm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IacL8ANA; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3e3d7b135c2so40558895ab.1;
        Sat, 02 Aug 2025 20:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193529; x=1754798329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+IM0NsWJ5A9C8Bm0HIX5NiHGnXi4xS02uXX3BN3rSA=;
        b=IacL8ANA3g27d38adu5nxzlIaG0LFO/jp1toVpG+9RpmvpWf9DL5yirk9im9d3uZLD
         X3L6C1zHJQUua1vCCYw3jzvQnZ2d17L7Q8Hx7tqhN0rBGL9xZutthlhIA95SuivsEtLX
         V2sfUfPJ6aUe/KZMbxExETkhNzecdUjf05BrRbza+0BdFuWqyRavT4hosVIkRzsJpL+b
         N/qxpYJsXe7nU3SSy0PkR1wDnad+ZY4dQYnR8zr+MULPYO8ZfcwsiZmbWJ8nPJqURYYp
         hFvwLhMXWJbXk3czH3Jsex6wG7eRvwt0ZjfUAdCatCKBEwD6TekJ5MsbbBJDsElArn1m
         kyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193529; x=1754798329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+IM0NsWJ5A9C8Bm0HIX5NiHGnXi4xS02uXX3BN3rSA=;
        b=p5MYnKqvl9eXChBbUgbI8RtYt471HF8iSMmmXkuYLElkrLafgb0PBEmaTnXAkMctI1
         4ixyJHTRkP8+E6LLM2U6f2AzgjqtOpbdstD1s80TOzCO1ltDWGq7HFrwnqjRPfeKNr/g
         dXZ01I/IB8w/CCGv7lq1tnl0W5edlNpIR9kjUOQH2+Y9kXWl7996d8ekfFGQwZLW5yny
         do9x4zCxM7vAzViqPh+chnM5hsGdPwfUPu2rMZu0475exvYUu+cu8fWa/hAj+jcJyz+9
         fojgfI3o9kvYM5YqxabvqgZNKCMfWvbblzFaMOtKmTeKvqFXtB7LFECnZ0gWxBNvnfgd
         ABpA==
X-Forwarded-Encrypted: i=1; AJvYcCUgcDn9AZJmFVJJOlWEiRff+eRhsmvbiFSs3WkbotpMSGLuUWXkKG+6CtDC45tm5Nul3wiAztWCUC9EVeop@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg0JzCbrByCnOgDfG4FCHgpACDCyjvfNAOs54msm8Ba7PFrjSW
	5OqXKEfi9+Ucu9f36FeMaeQ5fDCSp0ImeETDmK/RaRTLbYI6IV0aH27u13nwDr2mf9s=
X-Gm-Gg: ASbGnct+kKGns+R0Fh092rliClDnKMgu+3uXGQ/rhLmXI/0XUyh5CycvJY6+Zoa7/EX
	dwbsLlfkPokYKd7aevr1lpf9tRet9GFK4JbGkQh/Bb2cgsN2U9aukLBlHG+j4AuhDEi+G1oEwkk
	eSQZnNJyBSItPnQWxCJZ4QYMor6pK+fK3iv+X5ypyaCZbihNcsW0x/WCYfSGiuMfD0547HxF4uW
	dXnlHxf0P436T7F5kEs5+I691lJoxGV+cRnzYNYqo/b8vTauElRoYlMigXnrcXbBWWdxN4DvU5a
	mLkDk6Xd4wPgvpRCEAG82IkN+5DPgUUpfSr6Ch4klp1FYsjC70AiXmhW2/39NmmOLu19Wuv8HAr
	/sqQ6Lf3VgWIUO9CxWfCxVEZcipw++ZstvbmJ1RdaDAaAYi+8ZLBM/IhRME/5TucvD7LjXP9x6Y
	FzMQs2xq4uXXhN
X-Google-Smtp-Source: AGHT+IGM7OSUipX6+Z/C4hvdpT/EoYheE+z0u0a3sHNA7VxTBFGUiEplXS+T9MpT5CIry67A8qS+LA==
X-Received: by 2002:a05:6e02:3191:b0:3dd:e7d6:18bb with SMTP id e9e14a558f8ab-3e4161cca21mr84220835ab.17.1754193529107;
        Sat, 02 Aug 2025 20:58:49 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:48 -0700 (PDT)
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
Subject: [PATCH v4 11/58] dyndbg: replace classmap list with a vector
Date: Sat,  2 Aug 2025 21:57:29 -0600
Message-ID: <20250803035816.603405-12-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Classmaps are stored in an elf section/array, but currently are
individually list-linked onto dyndbg's per-module ddebug_table for
operation. This is unnecessary.

Just like dyndbg's descriptors, classes are packed in compile order;
so even with many builtin modules employing multiple classmaps, each
modules' maps are packed contiguously, and can be treated as a
array-start-address & array-length.

So this drops the whole list building operation done in
ddebug_attach_module_classes(), and removes the list-head members.
The "select-by-modname" condition is reused to find the start,end of
the subrange.

NOTE: This "filter-by-modname" on classmaps should really be done in
ddebug_add_module(1); ie at least one step closer to ddebug_init(2),
which already splits up pr-debug descriptors into subranges by
modname, then calls (1) on each.  (2) knows nothing of classmaps
currently, and doesn't need to.  For now, just add comment.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3- drop __outvar as promising magic it doesnt have
---
 include/linux/dynamic_debug.h |  1 -
 lib/dynamic_debug.c           | 62 ++++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ac199293d2032..e458d4b838ac3 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -83,7 +83,6 @@ enum class_map_type {
 };
 
 struct ddebug_class_map {
-	struct list_head link;
 	struct module *mod;
 	const char *mod_name;	/* needed for builtins */
 	const char **class_names;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 08d095dd19ef4..283926530a43b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -45,10 +45,11 @@ extern struct ddebug_class_map __start___dyndbg_classes[];
 extern struct ddebug_class_map __stop___dyndbg_classes[];
 
 struct ddebug_table {
-	struct list_head link, maps;
+	struct list_head link;
 	const char *mod_name;
-	unsigned int num_ddebugs;
 	struct _ddebug *ddebugs;
+	struct ddebug_class_map *classes;
+	unsigned int num_ddebugs, num_classes;
 };
 
 struct ddebug_query {
@@ -148,12 +149,13 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							  const char *class_string, int *class_id)
+							const char *class_string,
+							int *class_id)
 {
 	struct ddebug_class_map *map;
-	int idx;
+	int i, idx;
 
-	list_for_each_entry(map, &dt->maps, link) {
+	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -164,7 +166,6 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	return NULL;
 }
 
-#define __outvar /* filled by callee */
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -180,7 +181,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
 	struct ddebug_class_map *map = NULL;
-	int __outvar valid_class;
+	int valid_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -1122,9 +1123,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map;
+	struct ddebug_class_map *map = iter->table->classes;
+	int i, nc = iter->table->num_classes;
 
-	list_for_each_entry(map, &iter->table->maps, link)
+	for (i = 0; i < nc; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1208,30 +1210,31 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
-static void ddebug_attach_module_classes(struct ddebug_table *dt,
-					 struct ddebug_class_map *classes,
-					 int num_classes)
+static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
 	struct ddebug_class_map *cm;
-	int i, j, ct = 0;
+	int i, nc = 0;
 
-	for (cm = classes, i = 0; i < num_classes; i++, cm++) {
+	/*
+	 * Find this module's classmaps in a subrange/wholerange of
+	 * the builtin/modular classmap vector/section.  Save the start
+	 * and length of the subrange at its edges.
+	 */
+	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
 
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
-
-			v2pr_info("class[%d]: module:%s base:%d len:%d ty:%d\n", i,
-				  cm->mod_name, cm->base, cm->length, cm->map_type);
-
-			for (j = 0; j < cm->length; j++)
-				v3pr_info(" %d: %d %s\n", j + cm->base, j,
-					  cm->class_names[j]);
-
-			list_add(&cm->link, &dt->maps);
-			ct++;
+			if (!nc) {
+				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
+					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
+				dt->classes = cm;
+			}
+			nc++;
 		}
 	}
-	if (ct)
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, ct);
+	if (nc) {
+		dt->num_classes = nc;
+		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
+	}
 }
 
 /*
@@ -1263,10 +1266,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
-	INIT_LIST_HEAD(&dt->maps);
 
 	if (di->classes && di->num_classes)
-		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
+		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1379,8 +1381,8 @@ static void ddebug_remove_all_tables(void)
 	mutex_lock(&ddebug_lock);
 	while (!list_empty(&ddebug_tables)) {
 		struct ddebug_table *dt = list_entry(ddebug_tables.next,
-						      struct ddebug_table,
-						      link);
+						     struct ddebug_table,
+						     link);
 		ddebug_table_free(dt);
 	}
 	mutex_unlock(&ddebug_lock);
-- 
2.50.1


