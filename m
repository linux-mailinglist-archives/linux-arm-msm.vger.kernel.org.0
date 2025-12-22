Return-Path: <linux-arm-msm+bounces-86120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F00A6CD53A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D59B30072AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36B9314D18;
	Mon, 22 Dec 2025 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmy8vgNx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1301314A8D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391683; cv=none; b=jKc+PToBclxBVBB5p/m7pOLhU/8fvUns/vdvhtli/FUNgZ+0ymTUp/hnLz2W2HRSkhP4LJ84UvzMg092+vX/I6YczKY2Me+MoksbR5wp2lw7hkQzWSECqEvALYEFNmtxuwRATM9+gX7YGGD2xqq+Vq+X+BCIShZoQtvTKg/g/lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391683; c=relaxed/simple;
	bh=qcJ9WTVfS0uIhrALRso7IA2CF/K5hLrMPEervT/QQok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WSJQ3oBHy58haqtA6V+c7k8GsGKD+vdGsHSzGXE1UPFhDLcoICBP7Z/1ZFSbleJMzVxjXxXm0ua5mzRPf5ovoLHj2CbJyyZOXnKgsekc1LzvctkmVRwTmrPA5zUr3Jghu8zJyathLQ3BXwQJFf0MwLHJcViBdS7RSuWataY2Naw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmy8vgNx; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso4175398b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391680; x=1766996480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8i2B8ufAHD9sSahBAZkEx2yO1Ly/YjHLa83EmimubvQ=;
        b=mmy8vgNxjCXFEynKfnWUe1zwea1mFuG1sgLEh0MD6bA82OdJrZ7FnCLrrghcoE0rIn
         paLk5Hf0yrZxBSKw0gezTNMND0sHWK4AZC0B/cH1Y59U/JbafG8jqVRWqwaBSY+QepEf
         DLkuGlhUakkMUFyorNRDm8PkeNah8UO3RNCk5BHXu+wiYWVgJLkWP+kcTRebOfZktwIN
         11cMmcXTOhdyvW5tZRX9mzRdes/zmLTDJJP/kGxno2UOUrdkakG+g5YZ8BRJSEJYZ7Ip
         /vZmwlpo28/mJKjkJaUM4kpYaDfgkKW6xz/HAxUHEDk4d/M6tnHi9nD4825Hu7w/8LN7
         IsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391680; x=1766996480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8i2B8ufAHD9sSahBAZkEx2yO1Ly/YjHLa83EmimubvQ=;
        b=nLASL92zO0t2Mbd2q9fiNjRt+7H8ln3pYXIoT2DbjXd5Z9sNPJlu7V5kPpSCagyifc
         d+3O6hlU4DTX+N/EXhXB83Tw01BMLedZCMvQFoLmvIqmvS6gx75icNK9dLTVrSTKkV43
         3ByMTMcW4k+0pG3na5Exyam1DWa4qMTo1+OYXAL/uDyxWDTWcB0TnyzTs2xJa/9HIppa
         RWfBUTzbU7wXUoLA3XpeoayMo37cu9cBTdpIhlCoVJ6aba75UrG0HAi8C1veUBpzNjsg
         U+5xfku69lAJTy+5RRvoXxy3qjhkR9wmSxfq7gFFy0wE+CVpA/MZ9ol/Xy+83BaWaGjD
         3tAg==
X-Forwarded-Encrypted: i=1; AJvYcCW0eMLwecYk3BxNR6fDOROZkmFkURkGClH3Ngk6JbQdQd8Pwx+WfPjzurz5jqCsH4HshcgSS29n892dOLdh@vger.kernel.org
X-Gm-Message-State: AOJu0YxeKwyvfbKQ0VggJOsHj6eNZIB1VXQHN4m8kFCtM7qvHWjuSnf8
	8OmenxaugiWLv4/3YnGKrZwqlNv/WwBa1xe2Xxp6qSUE34QA/Uq6AnRf
X-Gm-Gg: AY/fxX7U18GWLNf2d/WzzZ9IOfxc9+IqFOCwKK/0J+VN0UuT/uqjLrnymAYCMcWxxjo
	QRVi4M9yYf38UFhzdrL1rAg5w34pLIKnYPo9ygDkmvD8DvMpcFHpWP1CAkg/Y3fuweVqImRcfzS
	oll/UoFSt6BRD1LPdCsNxEAhlS3DbVNELB0jw/V4smEKSoi497IXbCyCcJXcLbjFrgCzLBTeEgP
	ExoIz4P89naoRgP+4UXTi+N3pWG5CCHn4VdQedkQX3X3L7W/x4+Z1KX6CI3uLWE57U7QEI0mu2o
	pbyMbZtwmzRlq9c61BDXMmFwSzeWArQGWZN8oCRxCYFBt6kPnBdgYEwzg8NzestLIhNSWmRbBnu
	0yHcJ5byDI27LBS77qeR76ooF962UBJHwXW8TLOJQcas3xvj7hzvZPkDt8kYjlcoS9GE9bnUZou
	YG0afxU0Y3zBEXWWR1wQU=
X-Google-Smtp-Source: AGHT+IG7yTX9GcAzuJxjdZol8GNeVjpWx8TpHrMGtTszznm0lKmDxk6yQdOE7nvJLCN2Ii7oDSHoog==
X-Received: by 2002:a05:6a00:4295:b0:781:17fb:d3ca with SMTP id d2e1a72fcca58-7ff648e71c8mr8607801b3a.15.1766391679935;
        Mon, 22 Dec 2025 00:21:19 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:21:19 -0800 (PST)
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
Subject: [PATCH v7 02/31] dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
Date: Mon, 22 Dec 2025 21:20:19 +1300
Message-ID: <20251222082049.1782440-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the stub macro for !DYNAMIC_DEBUG builds, after moving the
original macro-defn down under the big ifdef.  Do it now so future
changes have a cleaner starting point.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 43 ++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ff44ec346162..98a36e2f94b6 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -92,27 +92,6 @@ struct ddebug_class_map {
 	enum class_map_type map_type;
 };
 
-/**
- * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
- * @_var:   a struct ddebug_class_map, passed to module_param_cb
- * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
- * @_base:  offset of 1st class-name. splits .class_id space
- * @classes: class-names used to control class'd prdbgs
- */
-#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
-	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
-	static struct ddebug_class_map __aligned(8) __used		\
-		__section("__dyndbg_classes") _var = {			\
-		.mod = THIS_MODULE,					\
-		.mod_name = KBUILD_MODNAME,				\
-		.base = _base,						\
-		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
-		.class_names = _var##_classnames,			\
-	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
-
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
 	struct _ddebug *descs;
@@ -137,6 +116,27 @@ struct ddebug_class_param {
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
 	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
 
+/**
+ * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
+ * @_var:   a struct ddebug_class_map, passed to module_param_cb
+ * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
+ * @_base:  offset of 1st class-name. splits .class_id space
+ * @classes: class-names used to control class'd prdbgs
+ */
+#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
+	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	static struct ddebug_class_map __aligned(8) __used		\
+		__section("__dyndbg_classes") _var = {			\
+		.mod = THIS_MODULE,					\
+		.mod_name = KBUILD_MODNAME,				\
+		.base = _base,						\
+		.map_type = _maptype,					\
+		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.class_names = _var##_classnames,			\
+	}
+#define NUM_TYPE_ARGS(eltype, ...)				\
+	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
+
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
 
@@ -303,6 +303,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
 #define DYNAMIC_DEBUG_BRANCH(descriptor) false
+#define DECLARE_DYNDBG_CLASSMAP(...)
 
 #define dynamic_pr_debug(fmt, ...)					\
 	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
-- 
2.52.0


