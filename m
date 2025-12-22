Return-Path: <linux-arm-msm+bounces-86131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40085CD5054
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1D683007956
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6AE32BF42;
	Mon, 22 Dec 2025 08:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hbe/w0+P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208E32BF44
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391827; cv=none; b=dkg5zYFSe4YhiKwWvaVG4V5Prb4HVqUxqmqqlSs+TPC5cdadpayAMiMbT552HynwFvUdnKVwZvtvIIZICkiruS1LW2laEcQssqGuzTdXvLsLWlEOq1vLdhBCSiqw2rQeyItqgA01Yf7Y3M9ItYy7PIP47s5hl5HQAlVyWgM/HN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391827; c=relaxed/simple;
	bh=MVevVZ31CxJkfQFZ+3wAubfOLMLENMAt3zvnrw7vgvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qIzU7gOi4Ogdz2f5oMyXxPXpX9w6Yu+KCkiNaVL4u2KKRFN7emXZYwxFF0QxSKy5YlfKxeyvcgYDYNK7XEZ1qm4c4XLzjILfZzEE1oMc1idRUgOLtAvkH9VBvesKg6ZlZiptesTJQJc//5oFXLyT5lzolFzQzsc7j1ZVo9B7gzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hbe/w0+P; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7b75e366866so1657328b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391825; x=1766996625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivVObFpEMeRPBcsYoBwesJyCBQlJUgWhfwCq+iuBLo8=;
        b=Hbe/w0+PlmC6A/Z57ZaWmE+etCRZUfcITjDMgrypJ/Q76/zAVuRaIqn5w7hL9aHHaZ
         HDT1PXN1iPOkUsGLkWE2kyNe/yTbMQjgRoHZptDEzNBvIHUCrWFWLKGPCZiMEYa3U1Xk
         Era7ttNHpsAbSeJSM5ar6IPejoUbNxJ8bX4Bnwubx+ftTgb7ILStcCmb2k/lF+exPsgE
         EZ/OYSQWUAGdevIyyWYpryPF79RjG6egOtdoq8RzJjwf1L7iTf8n/+tqBB22LMtB/Fhk
         MbS2Z3oVORmnP60HTEAQIxXjXX7Jz/5uKuVvt9KjcsFeAWmkpd2rTSngjQPK2Pw5Pf3o
         zfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391825; x=1766996625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ivVObFpEMeRPBcsYoBwesJyCBQlJUgWhfwCq+iuBLo8=;
        b=RKIGv5q+VVWyR9JL2B7XCdMs7jgW4Ulzu9X3Ji04K9oz2WWR0yIdvAQ96ugmWEsUsp
         HFHNbb12mVem3jrpQ9G9sGX5TJhn5YTtuQ3kBU5v+6XH7R7M1w2UvnBVEWi8lD6iSKcj
         A4oAdqihlt8DVcjwV1YgqIogsyKHrErcHbt8EgAmvT/YciOA0WwME53v9oDefuwuqxMb
         524sF/T2oPSl5fVyF5BB1IXKCXc9BmaCl+ty8kEkP5VGxVlUsA7imKFC0p2BijEJ41Xh
         igldfgf333cwLFj8TA5+Iz3PQGbIjvGIyL9uNOuaMXXKE2gqEQVRh3yKtRW8khwjvSOr
         SV1g==
X-Forwarded-Encrypted: i=1; AJvYcCWdKNQ485ZQ+T4rXvRa7VRF5gEUejlbHDUYqaJA1mBM8UdYG7tBlCTSHk3fSjhWvsegNQPxYmsQ7dmm8VGD@vger.kernel.org
X-Gm-Message-State: AOJu0YxXIqae1Oux+cSz0yzwauR6NuDQSA3dDQW5r7DOc8dP3b+p2rde
	AKWVIrjMtMH3kPQ0mgE1JVzBWEnJVO5m9fAZpruezZ7n+E1PbtFOUtlC
X-Gm-Gg: AY/fxX63I0F305C3Y5b1opm3lUGWqnItDUxvHrYEXf0/ZNBu9lpjOwdtiMjNdAcLwg7
	ui4TBq7mofddgue2z0fjj0zPAgO0pVaLmybEMB+2pueK3f4ez7185gTYPugesBQoGIb9M498qOf
	Dva/PIm5KPg5amWRIXaLsguTnRze3CDO0sf4+BIqqTfWfpY8fc8kBYAVGdkWVDQBvnpXtrJY8OS
	2joxFD2tXnaQ0VJ9kwTU74Ov8g2E52ko3qu1uOkvWaqe16KOT4nxEKJY0rHXAKTve/vSSX3juGX
	AM7561crRF31cukDHeb7n79JLtCwOt4qlmZpM9G5GwvpcYd1O2IKyyb/mXe40LqlgD+l19iuFc0
	+5yjf4ocR/njhfDF6NN4gBYFda2cxXEvBMDt77I2CKrzHP9sbTRO/xAZZojxUz5VkN7Ox0nwEaZ
	/xnWmxW8ZP
X-Google-Smtp-Source: AGHT+IErZyV3AXFVhyKoyCbBtMfXSf07isejz/aGGQIZRu0pVdlKjcUPzr8HfnBOtnGWXU36ZXLjnQ==
X-Received: by 2002:a05:6a00:2e23:b0:7ff:e3ae:58e7 with SMTP id d2e1a72fcca58-7ffe3ae595amr8361296b3a.9.1766391824782;
        Mon, 22 Dec 2025 00:23:44 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:23:44 -0800 (PST)
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
Subject: [PATCH v7 13/31] dyndbg: replace classmap list with a vector
Date: Mon, 22 Dec 2025 21:20:30 +1300
Message-ID: <20251222082049.1782440-14-jim.cromie@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  1 -
 lib/dynamic_debug.c           | 62 ++++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index c4ae79f934d9..51ed26e42032 100644
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
index db0559763e60..e882e951d585 100644
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
@@ -226,7 +227,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
 	struct ddebug_class_map *map = NULL;
-	int __outvar valid_class;
+	int valid_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -1133,9 +1134,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map;
+	struct ddebug_class_map *map = iter->table->classes;
+	int i, nc = iter->table->num_classes;
 
-	list_for_each_entry(map, &iter->table->maps, link)
+	for (i = 0; i < nc; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1219,30 +1221,31 @@ static const struct proc_ops proc_fops = {
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
@@ -1274,10 +1277,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
-	INIT_LIST_HEAD(&dt->maps);
 
 	if (di->classes && di->num_classes)
-		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
+		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1390,8 +1392,8 @@ static void ddebug_remove_all_tables(void)
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
2.52.0


