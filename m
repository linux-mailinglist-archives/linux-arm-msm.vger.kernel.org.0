Return-Path: <linux-arm-msm+bounces-67535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6468B19252
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C238718995F4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F052284B3B;
	Sun,  3 Aug 2025 03:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cp6kIzMq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87393283FF0;
	Sun,  3 Aug 2025 03:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193546; cv=none; b=XjblILbfqFzqag3icDx7dOFn6lRKEqjNhGB8T6//3MpXI6XUFNnQeLslya2ASC8yXr1vzPO2URM4gWE7IaP0t+dTI8m7fzbUju22l/4Xy7tX/iGak1xyHZRQDxNTKHH6GPPIWKtKKQSIrJwnRIld9K1VO+rvSygzZXe/3jfSHbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193546; c=relaxed/simple;
	bh=kJEs7iRnBPV+ssYFDY1mJw2zjtdUyEbxS11ES1cB40w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjfFSw4HfOCyU4LfIsB+PzO3RajtC/oUADQHqkYQwdS/XIm1tR0npX2l7yDFKh0KJ9aahPQqHkRxYOhoIQsxvQ3iKk2cjoCOHCF1a84r+7W+SaUjVIcnzpUjAUmV1j4Mns50kMtokPF2XoZeLApt0ounSFtVaToYoWHW+S6iDQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cp6kIzMq; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3e3e4a5715dso8643005ab.3;
        Sat, 02 Aug 2025 20:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193543; x=1754798343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mklWiZZXeNw0IAiROdlhKulcLq5JIjmrYvDuK+b6IIw=;
        b=Cp6kIzMqcbxmKVIwnFQJzxo8yYTUVqI9IusF7XLh4/adypWRwmIN25RkMfoYr/vUmC
         pJGVHeD1Gqd67EbKD6e3706vNtCmyjFYmhJ7ALG1XI6e4EYpfOZ2x9M+m/y1j1fuhvWW
         T0vULLpMkVf/WXlfYnILFNbvhFuWtYpSmC+DVx08S9ZjCkAUcAVhdpVH+AgddIrcRnZc
         KA2hrpgZ1AlKc2RGne+ZE95dSmr0ySzJFEPStO0TkOay7Xh/2FvcMPWne32s58unpXtR
         WfP6bLigCXDfkjxYz1y3mS3j6m+4gMLUkWZxc7F/PCrDRU6UXiCaiAkoMB+YiNckn+eq
         aIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193543; x=1754798343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mklWiZZXeNw0IAiROdlhKulcLq5JIjmrYvDuK+b6IIw=;
        b=EAtGXB69f5a21m+j9JTPKRZK2Nh323/Y7syHiLtPR43gx6cbFZUhxisvAt0PRJjhSu
         cvqH7knRc+Grmj6lqCki6zkZ4RDaXRLSPkKsx8ymZwhFI4lGfLNXV/iEvrFdrQ/xkV13
         5RidsCDlZ9HUvFrGP8prMAYJuaFbxPX02ztmc+Rw/p0QfGUSw6iEK4S3JEmySptQOmMr
         2kQy3/SeVSyhhB5G2SbWLsHqLDWIo1Id+vh9Vn2GJij4LnecnqWSX8FmvWO349TUlqwL
         kJeP5TLxyR0Nntsn0z2kKFhb9Um+Lm7353F/KbtkzL200IR9IgK6YT5DOkk6qaHJkl2v
         4k1g==
X-Forwarded-Encrypted: i=1; AJvYcCWBrlbrsGis7dgMArCBkPdeaBIlnvfbtEcgm3IJ+WE0M783LBz077ThEBgMpeluEMC3Fl1akEBRcmUJ9YGn@vger.kernel.org
X-Gm-Message-State: AOJu0YxCa2m+Zr+o4BdZCDzdd/jGKFS/TO1K8X61gIbfT3UJJmS/C3IO
	qSfA9+xC4lv9XEpjT7WbUI9BnfNULtC3ATNonKQvANG4aeTP0gHkcsnJOWoDmATnQP8=
X-Gm-Gg: ASbGncu7dK+kfNqWg/4GFLt3ZUNZ6YPlaqC4nPbiqbFKIm+xW4vPP3RAMytjWPmvtNx
	8UUCAQpi9joYAeHJ6mKDPtPuyfjHMvIU/pzuVSu7hhKb9GlAUI47VxZSiyuuc+OB3pSRtZ3LHqQ
	DGFTiDvMfFzS2cPae5Wqo85BFhkdznMh1v4LGEkymQaXVxPX0l2A+0gcqNxYfeWWSlYRh3FoYYv
	72vgJUttZWu+8b5CX42Pb4C87s7SHpd8nvZzcJ7JvUaWJip8mKKH4WL+CMZ12ToZS3Ln8tSbZvw
	Kj63mtVLqhfmanjUbr7QkuQ1WGFl51q4wOjaKAGbKcVHHKKvJWB8PX7Bld+KYNt8DIZ23X6cZcE
	DF8WdGkaE0q4XhKLUlPgQYk/3mDnEwjNWv2sDyn0D4XlbRKQeXp6LOKZPJVJews2VdjMGrhie1Z
	dpfg==
X-Google-Smtp-Source: AGHT+IFogGu9+LdtIzbyfZnfCUHN86E9vT1zZI6TQuyF240cWd9LVlFw1Za2fBbgX19XjcZHFKFMwQ==
X-Received: by 2002:a05:6e02:3e8b:b0:3e2:a472:2122 with SMTP id e9e14a558f8ab-3e416191f81mr84787815ab.14.1754193543320;
        Sat, 02 Aug 2025 20:59:03 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:02 -0700 (PDT)
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
Subject: [PATCH v4 20/58] dyndbg: detect class_id reservation conflicts
Date: Sat,  2 Aug 2025 21:57:38 -0600
Message-ID: <20250803035816.603405-21-jim.cromie@gmail.com>
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

If a module _DEFINEs + _USEs 2 or more classmaps, it must devise them
to share the per-module 0..62 class-id space; ie their respective
base,+length reservations cannot overlap.

To detect conflicts at modprobe, add ddebug_class_range_overlap(),
call it from ddebug_add_module(), and WARN and return -EINVAL when
they're detected.

test_dynamic_debug.c:

If built with -DFORCE_CLASSID_CONFLICT, the test-modules get 2 bad
DYNDBG_CLASS_DEFINE declarations, into parent and the _submod.  These
conflict with one of the good ones in the parent (D2_CORE..etc),
causing the modprobe(s) to warn

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 lib/dynamic_debug.c      | 29 +++++++++++++++++++++++++++++
 lib/test_dynamic_debug.c |  8 ++++++++
 2 files changed, 37 insertions(+)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index fa8d1ee214066..d6687623c5a96 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1267,6 +1267,22 @@ static void ddebug_apply_class_users(const struct _ddebug_info *di)
 	(_dst)->info._vec.len = nc;					\
 })
 
+static int __maybe_unused
+ddebug_class_range_overlap(struct _ddebug_class_map *cm,
+			   u64 *reserved_ids)
+{
+	u64 range = (((1ULL << cm->length) - 1) << cm->base);
+
+	if (range & *reserved_ids) {
+		pr_err("[%d..%d] on %s conflicts with %llx\n", cm->base,
+		       cm->base + cm->length - 1, cm->class_names[0],
+		       *reserved_ids);
+		return -EINVAL;
+	}
+	*reserved_ids |= range;
+	return 0;
+}
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1276,6 +1292,7 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
 	struct _ddebug_class_user *cli;
+	u64 reserved_ids = 0;
 	int i;
 
 	if (!di->descs.len)
@@ -1301,6 +1318,13 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	dd_mark_vector_subrange(i, dt, cm, di, maps);
 	dd_mark_vector_subrange(i, dt, cli, di, users);
 
+	for_subvec(i, cm, &dt->info, maps)
+		if (ddebug_class_range_overlap(cm, &reserved_ids))
+			goto cleanup;
+	for_subvec(i, cli, &dt->info, users)
+		if (ddebug_class_range_overlap(cli->map, &reserved_ids))
+			goto cleanup;
+
 	if (dt->info.maps.len)
 		ddebug_apply_class_maps(&dt->info);
 
@@ -1313,6 +1337,11 @@ static int ddebug_add_module(struct _ddebug_info *di)
 
 	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
+cleanup:
+	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", di->mod_name);
+	kfree(dt);
+	return -EINVAL;
+
 }
 
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 6c4548f635128..1ba4be9a403ae 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -128,6 +128,14 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 DYNAMIC_DEBUG_CLASSMAP_PARAM(disjoint_bits, p);
 DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
 
+#ifdef FORCE_CLASSID_CONFLICT
+/*
+ * Enable with -Dflag on compile to test overlapping class-id range
+ * detection.  This should warn on modprobes.
+ */
+DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
+#endif
+
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
 
 /*
-- 
2.50.1


