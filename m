Return-Path: <linux-arm-msm+bounces-86139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF9FCD50CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E9C230517D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B581B32D7F7;
	Mon, 22 Dec 2025 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/X1NoSZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3420532D448
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391919; cv=none; b=U6EumdWNUkytKN1xSNfScfEAyJ6nsRZFWVDPN+GsQMM8X2NjQ0mYlhgCBux0jTCRx2MZYWCGIhIzNpaEbIrLOYPogMd5h4+K6wthxPe4bL/PgWX+eD/08p5H/XLUIotCjvkCddd/V8OnoruMpDQGICHHGCy5NK7WRs/fw3RSGNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391919; c=relaxed/simple;
	bh=1sM428IcCo3LF0ivOmThhJmgO0lyRvaBC5WHALmVNys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j2RAfs6h6XbG4fATZvHy2C8sCThbIt6wKuMDkW1OHneHSzEG0eiRCRzK27IbZZ/BJ+JmpWatgU4+2XaxeYBKS7lEen3cN/EKOnyHKJOeap4U/LUJ9tYJ1Im72vlBFKkTTz52YxDK03x9VyTjsyA66mXAE9OIeCbM2r6J7eU8dSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/X1NoSZ; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so3970696b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391917; x=1766996717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6OB9Pa9Gle2V+EOSWrg2iFtsBZdBFQQ3jPBPibwDk8=;
        b=Q/X1NoSZZqLgXLl4c2+ZdTgIkxei9yk/7uglZZifQWnXwF2GIuHTBVcoZ+9LRsUibh
         ExrjguyP3nOZUO01p9vyEEN25wQHTrVDRaadd9xqiLBYEkgCHm4Bvdv7AKVk+WuDi4KV
         stF1fCjDX7O9hSyMlRoXILJ0fs8hKZQg1QEFBYJln1FlF1mO7FaiQduvzQEeM9PZOD74
         dJaTF5XZO/M+EM3BpvPFYu4kn+ObrXgvQdpqBiDkGlDW4als7+SiD8RWl/5e1HxHMsNG
         GFWfsijqsxD2dxkcX/11/CrHe8IuWApJ0cEQxLYc7edMaU7JPwzir0BtncLLeDpWS0oG
         zDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391917; x=1766996717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m6OB9Pa9Gle2V+EOSWrg2iFtsBZdBFQQ3jPBPibwDk8=;
        b=Jy7fiaB39MMdwU0ZhdizIpehu0N/qzpKwoEcszY+uPU7YozG52BymTsPJpbdoCZjHC
         yVckzR0pZPU75tJgcWESUH/FJf7/qVbRBdAcDszFURBE78+oNtaHucllJgDN5IPasCdC
         QZNUZ0A/X7ykohNHmgWFf/Kay+QF6N6TvlmgO24lf/mKjIHmCHItM4okDepSPOW5GplP
         pQWpTtJ1a+aHt0xCnCgPCLOm2cbqvQvJ48h3haEqY/pc/SbG4NmrjZ7ZIPkr7ND56pwD
         9DvDcYs9EkOACtizSIOOpMueKMXtVsAxZbWnDKCqBt8YrhNj+UGfM43s+ZghOI+K7x9T
         jzMw==
X-Forwarded-Encrypted: i=1; AJvYcCXx9rmKmITN/XI+GlmFO9Zb6A0GyNoYqOxsbksJQozAiqMf0a5O3jZWoHGSU478EDCTg+wkUPobxT0yn4fQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzqqM017+jx2MZdmnqTEUfiZw5Rkps8Nd5GUG57gQKcUMkLBFM/
	/SNQEns2K8TKC19QYqqx6dvqUSXdXjXN7eULSJQ/cVnuagD8kD6NAxBa
X-Gm-Gg: AY/fxX4N5Shts+aM99YdoqQCwJM5V8SlyA5z6t2MoKHX4okGBmdU8fEdy2yamIZVtV6
	+TBv5wjZHhfcX7iZ3UlIEqL/Rfzy08NqqhP2qxlf43Rzbj0Np9U/k/A9wFO8CsxJtXkmVCLJdmw
	VE0nqsKl6iX1K4JAYIVNWElx6N3vA0taCCbGehQYB7Cdvrm9uO9TorWo3ClJFKNVEmcAZz1Wdgt
	kcQlVkwoD+0c/e/CTOfhjFvmtkNgJPIulPi2HDNAn70kEWQyYLs62BZ2ylPF9iKYdEh4OXxV2PG
	xZXJxMJEf/gcFDrpcnfhydFN8ihm7hG620+v/o2IgGW3BMgbZCGs5htqgN4y+8hO78eP540uKIH
	Ci6mznaLT5s8OecM0+F9yEZP+JV6cWNO/8QoaPg6zmyNSmJHD4t+HIuZ/dNR0f9ETYyVx5QgSJc
	r+ClNw949d
X-Google-Smtp-Source: AGHT+IHMhCJxcqdCZRWx/qONCBKUX17SaWR7PpHRxbERjSaUq38+8Dckg7eE7Aqa1nDG0nfGy3nZYg==
X-Received: by 2002:a05:6a00:2c85:b0:7ac:3529:afbb with SMTP id d2e1a72fcca58-7ff648e9b90mr8900885b3a.20.1766391917524;
        Mon, 22 Dec 2025 00:25:17 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:25:17 -0800 (PST)
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
Subject: [PATCH v7 22/31] dyndbg: detect class_id reservation conflicts
Date: Mon, 22 Dec 2025 21:20:39 +1300
Message-ID: <20251222082049.1782440-23-jim.cromie@gmail.com>
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

If a module _DEFINEs 2 or more classmaps, it must devise them to share
the per-module 0..62 class-id space; ie their respective base,+length
reservations cannot overlap.

To detect conflicts at modprobe, add ddebug_class_range_overlap(),
call it from ddebug_add_module(), and WARN and return -EINVAL when
they're detected.

This insures that class_id -> classname lookup has just 1 answer, so
the 1st-found search in find-class-name works properly.

test_dynamic_debug.c:

If built with -DFORCE_CLASSID_CONFLICT, the test-modules invoke 2
conflicting DYNAMIC_DEBUG_CLASSMAP_DEFINE() declarations, into parent
and the _submod.  These conflict with one of the good ones in the
parent (D2_CORE..etc), causing the modprobe(s) to warn

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c      | 10 ++++++++++
 lib/test_dynamic_debug.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c60c2142f8ac..e5a18a7d3780 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1317,6 +1317,7 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
 	struct _ddebug_class_user *cli;
+	u64 reserved_ids = 0;
 	int i;
 
 	if (!di->descs.len)
@@ -1341,6 +1342,11 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	dd_mark_vector_subrange(i, cli, &dt->info, users, dt);
 	/* now di is stale */
 
+	/* insure 2+ classmaps share the per-module 0..62 class_id space */
+	for_subvec(i, cm, &dt->info, maps)
+		if (ddebug_class_range_overlap(cm, &reserved_ids))
+			goto cleanup;
+
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
@@ -1353,6 +1359,10 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	vpr_info("%3u debug prints in module %s\n",
 		 dt->info.descs.len, dt->info.mod_name);
 	return 0;
+cleanup:
+	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", di->mod_name);
+	kfree(dt);
+	return -EINVAL;
 }
 
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 6c4548f63512..1ba4be9a403a 100644
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
2.52.0


