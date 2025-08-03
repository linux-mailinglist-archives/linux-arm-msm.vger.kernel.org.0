Return-Path: <linux-arm-msm+bounces-67543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CA8B19264
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ACAC189974A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846AA286883;
	Sun,  3 Aug 2025 03:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mixe8w8A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDC4285CBB;
	Sun,  3 Aug 2025 03:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193557; cv=none; b=iIgwN/+YxwCED9D+GSWuQd7TQ2r18AjWYFvWEjEZ0JzN281mdSgnNvgc5VxUHrs5k52bqd500m0YX84aJVkh6nK+kWQSPmrQRKtiqhtqnoDSFbntq4OOs48y65LEBsWVtJnEN5JYHsOaNMr9ZQEhn0EVccABsuVq0xhbzkLTIVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193557; c=relaxed/simple;
	bh=UmPjnvOFHtKRbBydls84D8Tx+iu+38ZTcfuwy6MUclQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPJ4FSv+YzbfB6NGLRS7i1FwVeam1S+T/YH1MWbEsCZbUeEX1NmrZ0bIHyPZtQ0dbzxEPihmy3FK6Havm6o0jll0E88OYb4rK7ri05iyzD8y0DaNkcFGsHpvygVPnf1D7PqfXJ5I4syZjXOb//cEL0AKoXxtVFM8ZJdPImZEM50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mixe8w8A; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-88120243d9cso156615939f.2;
        Sat, 02 Aug 2025 20:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193554; x=1754798354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JChZIjAU7+USVRGiGiVr4WOFlmx1AN0tqDn5UCQfXA=;
        b=mixe8w8A4p36X3uYrvZPrlMW8sl9TorXneSgvEP2qjDRTq7FjZH5mTUpjy7OokEox4
         CH9jrXsss9e4N7UMkn4EZcpHyONv4bTAvAFvjtpXufglhraw2VXSxPvkts4+z30c7msH
         bF5buC+bTRgSDhslOlcfOreWFD4PKrw1QSkRFuGlmej+WlT1l0YECcTKQkB+CYwCywN0
         tS//IPE23RqKz9eDYlCZ65nxtn5AeZDVVuv2qXFDxPKe0tgIH5OIpjk0eAdXI9qgy3nQ
         xdGqGMm8Gbc2Nl8Tbjj/0+x2tZ2pturtW/SAeglYhOCUcbsKekr1sXqPZ8IcJ1TuyBIQ
         gtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193554; x=1754798354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JChZIjAU7+USVRGiGiVr4WOFlmx1AN0tqDn5UCQfXA=;
        b=l3tuGXhmfbsz35DUsY6eGCidIdNiq0MJIzOadSclbpu/NMUlaZYnnlbcHJPCzIn3HP
         buAuhJAUPBmv+XkTzJw6LXny+V6L/xQ31RqOIto0ankhtbYO6cLhjyZPen179FgjkFPC
         mU/L841rUV8xW4axkGmBp/wBYlcd3yQtOpOQZgmoxPd0jNGpJRt6z+nKVnd07bMrAndp
         2I8QLV7UXwm1euc8NLxn3BpkavKARH7Q70Bzch0vXSUiRXnVehpEDVblk2amOlh/ZNvV
         So/SW/MorhyxaNBqlNWG7Ac9MufnNsC4q8WwY8yngqBHB+NOJCqVSlJLH+hml/S2l6K5
         iJog==
X-Forwarded-Encrypted: i=1; AJvYcCU1YVPSBSDf7G+PAjP/58ENwQ5QacUSgJisYpBZOK9GTz8ptLTq5FBa2ciQR5jg7KqPo5rZmj0F2xw/rKRo@vger.kernel.org
X-Gm-Message-State: AOJu0YyfUExTQiCRz2GKsBP88DfgOBGEEhFW89n+4QXMpGAv7aT+t+Dk
	gZqEs8Y8dbGGfhFuUtAOU6UyMDMn2HO1nmJYoNVuYrbLaNEwzQYz2+HvnAkBsKSzBpc=
X-Gm-Gg: ASbGncumm8bX1TTiiiIcDSvkQMC7M9zT0LtRx9N+VNzK2a2Zhaq4lUDSQPLGrn+MMsJ
	D9qQgCvOnmiA2YOnQSTevs60QBMOgrQDMT6ykLi9tudhp5bXkVBWaR3bX2D8cRncx97tlD/aVrP
	s22FmIKy4N6w2fnJEMyCylc6eQnz8sB5uzYbTe37Ni/JHhTDTnjDGTnzgGl0taFoWqC+DMFLVwX
	hT2LSdjNVn11h0EKZVfhFPjfgQDpLaxOM2+n/njaeHKx9/v4LH4cXuKmF/WXWBT6W3naTpw4TCQ
	kzHnNDsTkHD4nQIe7RFTHxRWMVaW12CAP1vVT5c50PnCI7CnmHYBNZ8CRubVHiGU4T1eO9YTk67
	zlNBdJmz4qkRnw51TSuqM3fSKfCjAVhjQbaq9LgXNKZVLXIPxOeL7FkAqbQ3cXZQ4pt5drMZyVs
	kOtw==
X-Google-Smtp-Source: AGHT+IEXs1RKwGF33rL3y1Nq7WtmCCzyqjf3/JqP1fnRxFHeHfpiw5ELqGV5x4Tl+RUFiy+AkiHSIg==
X-Received: by 2002:a05:6602:6206:b0:881:7474:1b78 with SMTP id ca18e2360f4ac-88174741e8dmr448868439f.8.1754193554242;
        Sat, 02 Aug 2025 20:59:14 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:13 -0700 (PDT)
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
Subject: [PATCH v4 27/58] dyndbg: drop "protection" of class'd pr_debugs from legacy queries
Date: Sat,  2 Aug 2025 21:57:45 -0600
Message-ID: <20250803035816.603405-28-jim.cromie@gmail.com>
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

Current classmap code protects class'd pr_debugs from unintended
changes by "legacy" unclassed queries:

  # this doesn't disable all of DRM_UT_* categories
  echo "-p" > /proc/dynamic_debug/control

  # name the class to change it - protective but tedious
  echo "class DRM_UT_CORE +p" > /proc/dynamic_debug/control

  # or do it the (old school) subsystem way
  echo 1 > /sys/module/drm/parameters/debug

This "name the class to change it" behavior gave a modicum of
protection to classmap users (ie DRM) so their debug settings aren't
trivially and unintentionally altered underneath them.

And by "symmetry", if they're not picked by "class FOO", then they're
excluded from adjustment.  This allowed all previously conceived
queries to work the way they always had; ie select the same set of
pr_debugs, despite the inclusion of whole new classes of pr_debugs.

That had 2 downsides:

1. "name the class to change it" means that every class must be
individually modified, quickly becoming long-winded and tedious to
adjust all the classes in a map via >control.

2. It made the class keyword special in some sense; the other keywords
skip only on explicit mismatch, otherwise the code falls thru to
adjust the pr-debug site.

So this patch reverts to the traditional view, it drops protection of
classes from default/legacy queries.

But it also refactors the skip/continue choice to allow the module
defining the classmap to protect its classes from unintended
alterations by legacy/class-less queries.

Next:

Author choice: use of DYNAMIC_DEBUG_CLASSMAP_PARAM() means they want
the drm.debug style control point.  We should presume they want it to
reflect whats set underneath, with only "class FOO" qualified queries
changing the callsites beneath.

CC: jbaron@akamai.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
--
v3- s/slctd_/selected_/
    pitch the PARAM control of protection.
---
 lib/dynamic_debug.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 73076709d169e..548a82a178d49 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -197,6 +197,17 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 	return NULL;
 }
 
+/*
+ * classmaps-v1 protected classes from changes by legacy commands
+ * (those selecting _DPRINTK_CLASS_DFLT by omission), v2 undoes that
+ * special treatment.  State so explicitly.  Later we could give
+ * modules the choice to protect their classes or to keep v2 behavior.
+ */
+static inline bool ddebug_client_module_protects_classes(const struct ddebug_table *dt)
+{
+	return false;
+}
+
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -211,7 +222,7 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
 	struct _ddebug_class_map *map = NULL;
-	int valid_class;
+	int selected_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -224,21 +235,25 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 
 		if (query->class_string) {
 			map = ddebug_find_valid_class(&dt->info, query->class_string,
-						      &valid_class);
+						      &selected_class);
 			if (!map)
 				continue;
 		} else {
-			/* constrain query, do not touch class'd callsites */
-			valid_class = _DPRINTK_CLASS_DFLT;
+			selected_class = _DPRINTK_CLASS_DFLT;
 		}
 
 		for (i = 0; i < dt->info.descs.len; i++) {
 			struct _ddebug *dp = &dt->info.descs.start[i];
 
-			/* match site against query-class */
-			if (dp->class_id != valid_class)
-				continue;
-
+			if (dp->class_id != selected_class) {
+				if (query->class_string)
+					/* site.class != given class */
+					continue;
+				/* legacy query, class'd site */
+				else if (ddebug_client_module_protects_classes(dt))
+					continue;
+				/* allow change on class'd pr_debug */
+			}
 			/* match against the source filename */
 			if (query->filename &&
 			    !match_wildcard(query->filename, dp->filename) &&
-- 
2.50.1


