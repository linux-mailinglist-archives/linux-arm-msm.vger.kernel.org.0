Return-Path: <linux-arm-msm+bounces-67524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA8BB19237
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 05:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5B4B1779C0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 03:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA1D28000D;
	Sun,  3 Aug 2025 03:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0XO7CtT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16D527FD4A;
	Sun,  3 Aug 2025 03:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193527; cv=none; b=KRHz3Yzy+aounLvYeOOmJHAmUUSZ4GWYCpKt6Y3BOQhoSMcmRB5ua+XecmMC2WmKAVQwe/g4IlkbqSnRprk6Kd4F7MiPKCYBoYEyKqoTKXWHsAoww++bXUqKsScQ/6Spk022tlRrRwNuZR6hmEV4iUDT/CuA7WpmNQ7I3FWkwIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193527; c=relaxed/simple;
	bh=GrU2Nwi/8rfpPNVMPMtCaqjljNF1MwD9H/5YTmIIFhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UdjC5s5G3SDDKRsR3MxlB/pxrYZD3RQPIc+xcG6/xxcxm64VmlAnsRzsRZA82tXa9T/FHm+PVGDp9W5lLjVsRlNtUX3EddhuMCuHigc7Qt75vztK4L14pCgEhL0oCO/wY3EdWhGQ4KBwYXx9pynseZBCHGZD1T3PEjBX78+rkUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0XO7CtT; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3e3f0f29d09so9436865ab.2;
        Sat, 02 Aug 2025 20:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193524; x=1754798324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w11iTWBqUyUmFQ/xlqpJdlubct7P9lvcZ8FTN2uj0dc=;
        b=f0XO7CtTDJ2MB4o0ilnbBHxxB9/wy2eWn1eaGaEzIgmLniQstWF7XOzaFm2Uz8B6Bd
         k8fTey9Eji4tJj2ogPvN2XASPfrlSEpouqm5XKj2psgu8BQtR6T9GrRNqgqUscnjXkc1
         PnTn7vdQIj7piFhgWaRsulFpQHC1/MSx/gpROforS+WpzaAHG9WZC0Q9z34DsomfPe3/
         MQ4KUf1z+VhnJ5Grjpc0xz31roUs7Mtj+j6ywf82nXwQdkpRe9aD8m+B3UvrCVKIMTwl
         HmEObPHordjs3whI6nOwtA9zumCSbUhzcHCrGNK+5rON0TYTNe7EWgyL9+qRUadvxMc0
         XcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193524; x=1754798324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w11iTWBqUyUmFQ/xlqpJdlubct7P9lvcZ8FTN2uj0dc=;
        b=dN6mWIV3g4eXggjutckR0xyhx3JUGIGjVxkgssNAi1VP4DPwYmBLiLa2psCQfyFwr2
         36XQoP6jBVt4sW4euQ6V9VqcBIIa7D2JOtlJA+wrlQfUAPxnPYii1Hox8IhlxYZtZs6y
         tWVHOypEQfLaq+jvV1blvB74OwHGtjepsNf1Uoa/ENEH70leEUbAW38kfbp7XvTHFVPV
         vfCygvYvPUsc+LWA4+zcx07988V0pGmjUOwXn4D/hHylEOXk+zFegjViocCJOwhsS7Fi
         krjSHY24DXsnLTYGgVYubtatvRWGR2JAGeCJND2esjfUYBmOZsatavN7SFEr9vmLkOvv
         zajw==
X-Forwarded-Encrypted: i=1; AJvYcCVfXAFI1TVzU9vR1//oDfrysPNbdKv471bSXVxcvQ6iiXDaWXX5mXJHZudAItXzBKIHu34DELwo9d3B6ZL0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ZwYhdExk0/GuiCDGvgGhAngKUENvhktqjQlx3xYLZOh/0Ees
	RO6nfxl11YHIiDmW3z47hkTkVD3yBcBaDOB3kXsbVpqe2KMZQS/5nVH0Ogc0eUCDSLY=
X-Gm-Gg: ASbGnctIKbkBuQDcCZrT354JnbgnuZ6RVz5OeRVgJ7jo0apoQd3KrVxb4XKR3hDzPXq
	a+C60gG3VjI8vBv+cWdwDlkOtd8w83C3y/UUrrweJJyFfoGcP+CtZ3IrGnYhj7SIioynFEQUmlG
	/YABGZwLrUNDYjLPR3P2+QSkhtby+fSXZrGIGISGBhK14rMYPkXlXURNxWeGDBkDSvrt/5xBo8w
	Px/C1XzQkLMu7TQrXGwGNrVCYTQ4QRQ8Hxfn6h5G7ZynygtYiMMRwWj95cnZOcR2erI4DNbVPtg
	sYsH6vMGQmRbst24Cw78u02WkfnisAG/wVVl1osAXDMezfgHwc61+heUrHZjbtK45CdH327UGVq
	fvvPhw7UczAklrFerp8Z1vZWFk4C+pH2r7utodzM0jmZ4tnGoqps6gaAOz4OviLI3BEd1mQoCS1
	eqFcEAIab1CbIq
X-Google-Smtp-Source: AGHT+IGMOals5COhIioa7WIuP+hDvHPdqL2k/g/lRnDo5cgFfZ32l9pYAvRqMJUqo71V4g8mlLwHfg==
X-Received: by 2002:a05:6e02:370d:b0:3e4:17c1:3fdb with SMTP id e9e14a558f8ab-3e417c142cfmr83851035ab.0.1754193524519;
        Sat, 02 Aug 2025 20:58:44 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:44 -0700 (PDT)
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
Subject: [PATCH v4 08/58] dyndbg: reduce verbose/debug clutter
Date: Sat,  2 Aug 2025 21:57:26 -0600
Message-ID: <20250803035816.603405-9-jim.cromie@gmail.com>
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

currently, for verbose=3, these are logged (blank lines for clarity):

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"

 dyndbg: op='+'
 dyndbg: flags=0x1
 dyndbg: *flagsp=0x1 *maskp=0xffffffff

 dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: no matches for query
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: processed 1 queries, with 0 matches, 0 errs

That is excessive, so this patch:
 - shrinks 3 lines of 2nd stanza to single line
 - drops 1st 2 lines of 3rd stanza
   3rd line is like 1st, with result, not procedure.
   2nd line is just status, retold in 4th, with more info.

New output:

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"
 dyndbg: op='+' flags=0x1 *flagsp=0x1 *maskp=0xffffffff
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: processed 1 queries, with 0 matches, 0 errs

Also reduce verbose=3 messages in ddebug_add_module

When modprobing a module, dyndbg currently logs/says "add-module", and
then "skipping" if the module has no prdbgs.  Instead just check 1st
and return quietly.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
-v2 squash several verbose cleanups together
---
 lib/dynamic_debug.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 2751056a5240d..d9268d051a106 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -264,9 +264,6 @@ static int ddebug_change(const struct ddebug_query *query,
 	}
 	mutex_unlock(&ddebug_lock);
 
-	if (!nfound && verbose)
-		pr_info("no matches for query\n");
-
 	return nfound;
 }
 
@@ -499,7 +496,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -513,7 +509,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -529,7 +524,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -539,7 +534,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -557,10 +552,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 		return -EINVAL;
 	}
 	/* actually go and implement the change */
-	nfound = ddebug_change(&query, &modifiers);
-	vpr_info_dq(&query, nfound ? "applied" : "no-match");
-
-	return nfound;
+	return ddebug_change(&query, &modifiers);
 }
 
 /* handle multiple queries in query string, continue on error, return
@@ -1234,11 +1226,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
-	if (!di->num_descs) {
-		v3pr_info(" skip %s\n", modname);
+	if (!di->num_descs)
 		return 0;
-	}
+
+	v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-- 
2.50.1


