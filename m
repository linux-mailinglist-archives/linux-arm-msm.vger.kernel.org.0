Return-Path: <linux-arm-msm+bounces-86146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F987CD514A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75700300995B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD84B3314B4;
	Mon, 22 Dec 2025 08:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZMmdrLh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE543314A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392099; cv=none; b=HP7428AqM8M5khkboucWgOzPr+cyR+t9mGL35fycHgKHrjZtymE1NYEcdXUISpQ5BgImrIwysaMjlkYcgcG0ClfST4ioCXamPb437F5wXglG/A2YsphIDeZ/eTGFyDG8elp2qiOTO6xjxceSrtLjKeq62NXVc9EOcJUcw7ae/f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392099; c=relaxed/simple;
	bh=v7EQfK3CYeK6tip0DHETnwNdDCpTZ1+hTqxgdsKnjQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNdx+FF9TY2HcqmorEAO7DUtMSH7KcxViLdnJfugmdz7gWZJWd1tMJyC6dLyUuktEX6yOaEerSZ8XDkOKLNySr/yBuqEvzx8OKIDGuV4bE3EeB6pFVTXmVp8NvAHWPOHZupgNP768SfXF5XUidjkPNEejp6cTS3n4PxZ1aMTl7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZMmdrLh; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so4236163b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766392098; x=1766996898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8P0CFiKDyHYpNA2hwruS1Ng/YcTesu5+S1IYSukvEWU=;
        b=VZMmdrLh49LS9xhxzwHyTOiSgMcERcGZLyp5m3OigRk0TTqboX8vZjBJJaE9tsOZLo
         JIRB7IxCZKKIi47jW5kr5ZBBo01kUaf2yrFxeT8c29FzKGUQurIeYUuyXJp1TuMlYpOR
         2+YvXp/MhwiHn9YAmJNh4IsYi3gzmrJQnBv9LTi6VCIAJfnAYJV08P/197025SO33Rix
         n1dzQI1pyXk/TMWpMS9g2DaAbUnKukqRf5vpFIrvO9pyDoBDyxOLXS88jSEkiKfavk0m
         vrlIgGggaW4eFeFaI7wP8fqe9VE2u1C9NGcefgaxW4UQ+1Gwy13C6gsafyyu2s6ubmJd
         ZnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392098; x=1766996898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8P0CFiKDyHYpNA2hwruS1Ng/YcTesu5+S1IYSukvEWU=;
        b=FSUWHD0QxIrztIKE7uFIebNWpxgLFbEcxJ8CiN1GBHhiTk2zh9Mtv7DpjSGXMugjgg
         /u9fYu+1G2PSTOmqeDrJ0MxD7M37yvl2FBnFcaXdUvzxoNZ2CYb/MhGgGse4x5wS4Mh1
         TSaSUkz7pEaMs9IF1FFNkf5gUFotYmHka95fMaZeQzN/STvIMX35X88tWboZp8roAx3u
         I1NOSiSwIIlq5svL/9WY1S8jU9QMoP0QGnAFSG8Fo/OLds1aAHVcYYQqDfF9kYSo4xXz
         zDOzO0ICy1JeTE5DbHBzHb8NJouq9Yaam/wLMQSBqUGXu5LLGmpm7vG030MgIiDTtEkK
         rK2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRaHJ32iflRywvc0UA05wxqH8jZ5Ltgg2RiqSS6VNigMu1WDsXTq9psnMwS0FOLlGONzpP2uqo0gbAyLZK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Haz9OTxzOeby7rt11AoppYfom0PVZ3/coPOIK56IWEa84sdH
	BAK4achcz6WqAKzHYn4vhm+Jk4ddaaz4XPrfL+Ia/TNyPytS02JrcOPI
X-Gm-Gg: AY/fxX5L5pl18yShsWZ0Zqm95rLDCOSSPwWZKM+5mkUbw8xmvMjRKhlqXDicXEM2ryQ
	WbVIfYDUS+I0jGGwyiwKlNkn6PLgSr9P3qdI+HXy7E+WlBJ+JiEcvWnDY9VkDIFIZ+S1y5M5+lV
	Mt9qclA2F6Z8+jT9ORUADSj4bnTV+3D45st6vLg5pntnW1V/EHRaf7HEi3dfPr2bUZYjYavBF2m
	ksLq9lc9xPDinNNfvzRAUfWiRGopI/vbg6L7eIch2qub+Q9aluZpObJDHlEPG6IS3nfIQH33y44
	VtGPHbrQevyiSjQfCaWMtrA2C6cGJYnpEFOoBd4QFQxYNIEj4GQahz0bP4+VtENrG/E7Aa0eoU6
	kafexHra2wAOl+LACtIABRsVw4QoLNyCD2qOlkZ8jWpJ3j1+x+IE5OS4u3H5L86YiFUQVbh6K/N
	5XyNKgBTC4
X-Google-Smtp-Source: AGHT+IEq8X6Bf+OWPyqj+l6muxtsExzlcI9be65S5oPokexgEe5xk3Q6PIlmP0iqLo1vmkdJvgYYyA==
X-Received: by 2002:a05:6a00:a386:b0:7aa:17f0:f63c with SMTP id d2e1a72fcca58-7ff64eca463mr9195347b3a.29.1766392097555;
        Mon, 22 Dec 2025 00:28:17 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:28:17 -0800 (PST)
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
Subject: [PATCH v7 30/31] dyndbg: add DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name, offset)
Date: Mon, 22 Dec 2025 21:20:47 +1300
Message-ID: <20251222082049.1782440-31-jim.cromie@gmail.com>
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

Allow a module to use 2 classmaps together that would otherwise have a
class_id range conflict.

Suppose drm-driver does:

  DYNAMIC_DEBUG_CLASSMAP_USE(drm_debug_classes);
  DYNAMIC_DEBUG_CLASSMAP_USE(drm_accel_xfer_debug);

And (for some reason) drm-accel will not define their constants to
avoid DRM's 0..10 reservations (seems a long stretch).

So I dont think this potential conflict would become an issue until we
have at least a 3-X-3 of classmap-defns X classmap-users

So drop this if its too speculative, knowing theres at least a
notional solution should the situation arise.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 30 +++++++++++++++++++++++-------
 lib/dynamic_debug.c           | 19 ++++++++++++-------
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b22da40e2583..5307be8da5c1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -87,7 +87,7 @@ struct _ddebug_class_map {
 struct _ddebug_class_user {
 	char *mod_name;
 	struct _ddebug_class_map *map;
-	const int base;		/* user offset to re-number the used map */
+	const int offset;	/* offset from map->base */
 };
 
 /*
@@ -235,21 +235,37 @@ struct _ddebug_class_param {
 /**
  * DYNAMIC_DEBUG_CLASSMAP_USE - refer to a classmap, DEFINEd elsewhere.
  * @_var: name of the exported classmap var
- * @_not_yet: _base-like, but applies only to this USEr. (if needed)
  *
  * This tells dyndbg that the module has prdbgs with classids defined
  * in the named classmap.  This qualifies "class NAME" >controls on
- * the user module, and ignores unknown names.
+ * the user module, and ignores unknown names. This is a wrapper for
+ * DYNAMIC_DEBUG_CLASSMAP_USE_() with a base offset of 0.
  */
-#define DYNAMIC_DEBUG_CLASSMAP_USE(_var)				\
-	DYNAMIC_DEBUG_CLASSMAP_USE_(_var, 0, __UNIQUE_ID(_ddebug_class_user))
-#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _base, _uname)		\
+#define DYNAMIC_DEBUG_CLASSMAP_USE(_var) \
+	DYNAMIC_DEBUG_CLASSMAP_USE_(_var, 0)
+
+/**
+ * DYNAMIC_DEBUG_CLASSMAP_USE_ - refer to a classmap with a manual offset.
+ * @_var:   name of the exported classmap var to use.
+ * @_offset:  an integer offset to add to the class IDs of the used map.
+ *
+ * This is an extended version of DYNAMIC_DEBUG_CLASSMAP_USE(). It should
+ * only be used to resolve class ID conflicts when a module uses multiple
+ * classmaps that have overlapping ID ranges.
+ *
+ * The final class IDs for the used map will be calculated as:
+ * original_map_base + class_index + @_base.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _offset)			\
+	__DYNAMIC_DEBUG_CLASSMAP_USE(_var, _offset, __UNIQUE_ID(_ddebug_class_user))
+
+#define __DYNAMIC_DEBUG_CLASSMAP_USE(_var, _offset, _uname)		\
 	extern struct _ddebug_class_map _var;				\
 	static struct _ddebug_class_user __aligned(8) __used		\
 	__section("__dyndbg_class_users") _uname = {			\
 		.mod_name = KBUILD_MODNAME,				\
 		.map = &(_var),						\
-		.base = _base						\
+		.offset = _offset						\
 	}
 
 /**
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index f60a723a441b..b0da3dd4ac44 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -198,7 +198,7 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 		if (idx >= 0) {
 			vpr_di_info(di, "class-ref: %s -> %s.%s ",
 				    cli->mod_name, cli->map->mod_name, query_class);
-			*class_id = idx + cli->map->base;
+			*class_id = idx + cli->map->base - cli->offset;
 			return cli->map;
 		}
 	}
@@ -206,12 +206,17 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 	return NULL;
 }
 
-static bool ddebug_class_in_range(const int class_id, const struct _ddebug_class_map *map)
+static bool ddebug_class_map_in_range(const int class_id, const struct _ddebug_class_map *map)
 {
 	return (class_id >= map->base &&
 		class_id < map->base + map->length);
 }
 
+static bool ddebug_class_user_in_range(const int class_id, const struct _ddebug_class_user *user)
+{
+	return ddebug_class_map_in_range(class_id - user->offset, user->map);
+}
+
 static struct _ddebug_class_map *
 ddebug_find_map_by_class_id(struct _ddebug_info *di, int class_id)
 {
@@ -220,11 +225,11 @@ ddebug_find_map_by_class_id(struct _ddebug_info *di, int class_id)
 	int i;
 
 	for_subvec(i, map, di, maps)
-		if (ddebug_class_in_range(class_id, map))
+		if (ddebug_class_map_in_range(class_id, map))
 			return map;
 
 	for_subvec(i, cli, di, users)
-		if (ddebug_class_in_range(class_id, cli->map))
+		if (ddebug_class_user_in_range(class_id, cli))
 			return cli->map;
 
 	return NULL;
@@ -1177,12 +1182,12 @@ static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp
 	int i;
 
 	for_subvec(i, map, di, maps)
-		if (ddebug_class_in_range(dp->class_id, map))
+		if (ddebug_class_map_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
 	for_subvec(i, cli, di, users)
-		if (ddebug_class_in_range(dp->class_id, cli->map))
-			return cli->map->class_names[dp->class_id - cli->map->base];
+		if (ddebug_class_user_in_range(dp->class_id, cli))
+			return cli->map->class_names[dp->class_id - cli->map->base - cli->offset];
 
 	return NULL;
 }
-- 
2.52.0


