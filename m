Return-Path: <linux-arm-msm+bounces-67531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E52B1924B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E1FF189936C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865A92836B5;
	Sun,  3 Aug 2025 03:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7/QxlLj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E76C283153;
	Sun,  3 Aug 2025 03:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193538; cv=none; b=Sl81BwjagZ14+p4GdoTfeqXpeLmXsdgDENJ9tBzOnV1cObd+8NtGrOEKu/n0q5/Gmh+0UzPirGY2lfIU4c3isvTq3Etq37X9DlZr2Chv+k8xP/WFg272vVcKy+qimANYhdQa39CWUEvYIW/o1rSmegW96Y8IywZCYxWkwrS6l14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193538; c=relaxed/simple;
	bh=HAnQGB2FRLy/1o4YSHzPTUbjSSAYCy3iPIynrWm0WGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHegh2+LH17qiIdBuZ/BNZim3sLNLOcS4C/sF6OI5MWW+NnA6Xz4uDwbRMB+3zHL89qyXy4h16Ugj/Jj4N/NG91vxbLzI2GZooqcDDY5ZsbUSquqE1KQyJRk57c+UDdxefEVStc4yYR5H0aIsK/BWJemcf709pCgAk9ejRRhC64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7/QxlLj; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3e3cd27178fso12834175ab.3;
        Sat, 02 Aug 2025 20:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193535; x=1754798335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORK9k3QUZJtuVsIu7FqLBNLHVp4N+O4ijcv5dzF1jJc=;
        b=a7/QxlLj8mJVix3R1mBcJHSd7F4Uy3huoQccZHXL1tcQ0/duVmgIaQg04gSbCF7AWH
         ug8dmQHjaNNt7TnWuJqpmaLufnrWv0EG2nXtw8FdCgu8p23RodmlR4IhIV1wBiu8GjPu
         +jkUNArWf8ZnzNaVSMINSoqAjBPGSteMhzxrmPiYGjkJYjGOJc1GXtMxgWxdbwhscUSM
         BBoxRlJzpGats4rY/RPADqJ4aKeavf+nNKQobGNZH2O8mRTnBaEO8qw/ZP3HiYrqvF87
         z92dDDkOF8s9qifOBpdGyyhCJYCTe6LTEiwhSSoOWZEsqgRmJK4R5sWbDxpVD2poTxtU
         crzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193535; x=1754798335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORK9k3QUZJtuVsIu7FqLBNLHVp4N+O4ijcv5dzF1jJc=;
        b=xSrFFMyev8hdVByBgj2D0azOjFkZ/I7olxcTQbaXKbwo5TeIAK+J9NAKhg+WsKOpFf
         NXH8IUr1d17HPGpHOT9VO4xWQhN/yVQA1y/X9rz+FGX8Ey9BeoHhKYB0vmBitkEpgpFV
         isPG2V3PsFj2phtzPMdhIq9FWGQtQqLRdWWhRK/mDViIfRniG1aJWkxBH9XV4kAKD8sq
         FHOjaYjxaE0QNpYV04ELvPgF+H5J3Gf4rJwd45klUdppTn4Zfekse5z9bNDFXVqSuTwv
         ct3W2fHAD/DHTjhbrxDhncHA0qguOnybdABvrV05fu9TeK7W3WGVMp8+3lmyqnRuZDu4
         CgYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRF1w8FsXSGY0ZXY3/vR5/SyM+ouDZpddz9fSumB4ilrzQVy1NlvYTRypZ31Db+Bx0lxGwZAlwLLXFObF4@vger.kernel.org
X-Gm-Message-State: AOJu0YxJYGMIjGXCziD5R+i89sx/XRWzaWm2UVpRqCekb0Z5ZHNiHk9B
	sLpQo4FOv4SbFjaKMfBDfq0GBuOQnjQYARkf+wu8kNHaI0cQNREqEy2yjxu9K/UZW+w=
X-Gm-Gg: ASbGnctmgUSibtZxsquCs+P/trt632k9jr2mDcAlIBTNz7f6nJ8vYUmb0N1Yjdb761r
	bZA1d2lt2d/fkf1D2HSeOhrqKwH9j/u5lF/xON7lQsIawy75zWJUE9gndnoaotPdtNuaXZFwZ67
	F6cGYPMn7HdcA4rJqtU6Kdg6uDQeCjQdcuM5f1GRO7jbMr5Wb0l/9Ng1NVbrZ8Usn1Plr0KIexY
	selMWcbZGyr7TYRQ9rumFUbnf9OfH95xyWLcFavcGCN5tzVTuoFC0c7M4xv68H/T2FThyJPIrd5
	/u2wojnBrKDSfC8A9bqoB5Q4vjDPz0j6fmIS1n71esWic6vFy7JJKPTT2k91+NX8v1peQdSJ56f
	Lc68Bl1UXScVt/o0AfZw85glrb/9NDqZ5jv9f2EH6mioXNDr/c0KXg+fCiFdLDuPK3Bb31Vsy3T
	j9KQ==
X-Google-Smtp-Source: AGHT+IEbSdNNbc1zVnKCCJZUuETqTQtoaGj2TcDdJPLDVMJba4Vzk2kJH+A6WzY4odoJMJfDdZ0nxg==
X-Received: by 2002:a92:ca4b:0:b0:3df:4159:8fe5 with SMTP id e9e14a558f8ab-3e4162bc725mr89515755ab.4.1754193535436;
        Sat, 02 Aug 2025 20:58:55 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:55 -0700 (PDT)
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
Subject: [PATCH v4 15/58] dyndbg: ddebug_table.mod_name down to _ddebug_info
Date: Sat,  2 Aug 2025 21:57:33 -0600
Message-ID: <20250803035816.603405-16-jim.cromie@gmail.com>
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

struct _ddebug_info already has most of dyndbg's info for a module;
push debug_table.mod_name down into it, finishing the encapsulation.

This allows refactoring several callchains, passing &_ddebug_info
instead of &ddebug_table, and hoisting the "&dt->info" deref up.

ddebug_table contains a _ddebug_info member, so its users keep access
to mod_name, just now with "->info." added in.

In static ddebug_add_module(&di), reinforce the cursor-model by
dropping the modname arg, and setting di->mod_name at each caller.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
-v3 more s/dt/di/ internal interface changes
---
 include/linux/dynamic_debug.h |  1 +
 lib/dynamic_debug.c           | 45 ++++++++++++++++++-----------------
 2 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 9d282e2444e18..f4d1d08cd5a7c 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -126,6 +126,7 @@ struct _ddebug_class_maps {
 } __packed;
 
 struct _ddebug_info {
+	const char *mod_name;
 	struct _ddebug_descs descs;
 	struct _ddebug_class_maps maps;
 } __packed;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index bbbdb8aba0716..09f19155d7f02 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -46,7 +46,6 @@ extern struct _ddebug_class_map __stop___dyndbg_class_maps[];
 
 struct ddebug_table {
 	struct list_head link;
-	const char *mod_name;
 	struct _ddebug_info info;
 };
 
@@ -201,7 +200,7 @@ static int ddebug_change(const struct ddebug_query *query,
 
 		/* match against the module name */
 		if (query->module &&
-		    !match_wildcard(query->module, dt->mod_name))
+		    !match_wildcard(query->module, dt->info.mod_name))
 			continue;
 
 		if (query->class_string) {
@@ -269,7 +268,7 @@ static int ddebug_change(const struct ddebug_query *query,
 #endif
 			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
 				  trim_prefix(dp->filename), dp->lineno,
-				  dt->mod_name, dp->function,
+				  dt->info.mod_name, dp->function,
 				  ddebug_describe_flags(dp->flags, &fbuf),
 				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
@@ -1133,12 +1132,12 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 #define class_in_range(class_id, map)					\
 	(class_id >= map->base && class_id < map->base + map->length)
 
-static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
+static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp)
 {
 	struct _ddebug_class_map *map;
 	int i;
 
-	for_subvec(i, map, &dt->info, maps)
+	for_subvec(i, map, di, maps)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1166,13 +1165,13 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 
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
@@ -1224,7 +1223,7 @@ static const struct proc_ops proc_fops = {
 
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
-	vpr_info("module:%s attached %d classes\n", dt->mod_name, dt->info.maps.len);
+	vpr_info("module:%s attached %d classes\n", dt->info.mod_name, dt->info.maps.len);
 }
 
 /*
@@ -1241,7 +1240,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 #define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({		\
 	int nc = 0;							\
 	for_subvec(_i, _sp, _box, _vec) {				\
-		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+		if (!strcmp((_sp)->mod_name, (_dst)->info.mod_name)) {	\
 			if (!nc++)					\
 				(_dst)->info._vec.start = (_sp);	\
 		} else {						\
@@ -1256,7 +1255,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
  */
-static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
+static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
@@ -1265,20 +1264,19 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
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
@@ -1292,7 +1290,7 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
+	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
 }
 
@@ -1355,7 +1353,7 @@ static int ddebug_remove_module(const char *mod_name)
 
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry_safe(dt, nextdt, &ddebug_tables, link) {
-		if (dt->mod_name == mod_name) {
+		if (dt->info.mod_name == mod_name) {
 			ddebug_table_free(dt);
 			ret = 0;
 			break;
@@ -1375,7 +1373,8 @@ static int ddebug_module_notify(struct notifier_block *self, unsigned long val,
 
 	switch (val) {
 	case MODULE_STATE_COMING:
-		ret = ddebug_add_module(&mod->dyndbg_info, mod->name);
+		mod->dyndbg_info.mod_name = mod->name;
+		ret = ddebug_add_module(&mod->dyndbg_info);
 		if (ret)
 			WARN(1, "Failed to allocate memory: dyndbg may not work properly.\n");
 		break;
@@ -1473,7 +1472,8 @@ static int __init dynamic_debug_init(void)
 			mod_ct++;
 			di.descs.len = mod_sites;
 			di.descs.start = iter_mod_start;
-			ret = ddebug_add_module(&di, modname);
+			di.mod_name = modname;
+			ret = ddebug_add_module(&di);
 			if (ret)
 				goto out_err;
 
@@ -1484,7 +1484,8 @@ static int __init dynamic_debug_init(void)
 	}
 	di.descs.len = mod_sites;
 	di.descs.start = iter_mod_start;
-	ret = ddebug_add_module(&di, modname);
+	di.mod_name = modname;
+	ret = ddebug_add_module(&di);
 	if (ret)
 		goto out_err;
 
-- 
2.50.1


