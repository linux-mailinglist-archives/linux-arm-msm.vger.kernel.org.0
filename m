Return-Path: <linux-arm-msm+bounces-86128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A056CD50F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65EA23014B65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A84132ABF9;
	Mon, 22 Dec 2025 08:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+YIhg/v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904CE32AADA
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391794; cv=none; b=iM98weL3DZn0yNfBYxPQP+jsgUt4yhClj0Cnp7kpzeP7s5yyNtLwT5cgZlVi9HQ4Eyml6y+EcNZSL7MIbObyyUR8PnevvVEa0qucycujxeQ7afAwtGX0Hs3/2B3xY19hLadEnb8RGsOiRKVKhKo/NMF/nX60bW2LRXo7r/mRFIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391794; c=relaxed/simple;
	bh=a7QzjZykrf+nhpVu0FMe0jqhJkw6SImZcec8zbEQ0hM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gbwkwd0wyd9IklSXkiA34mV8SrZxezm5XniB0LASAESOwaUFRa3sqhjPriu9ZF+kNeGvD3HkyHipx2oCAAq5N4UX1hmFw/jhVoHe+mDIX0IODGvfK+kQzdA9nihNO/YB0xICV1ccooM/ByYhRwIBrPasQs6qJRhjYvss1mOm5lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+YIhg/v; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso5830533b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391791; x=1766996591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kB9XGvfi6ObodyigSZBf40IoYnb1xkrL/FFwh/sfSnM=;
        b=N+YIhg/vBEsmj7U7fd1H5hELJPKzU2LT2VhHA8yiIa8Frr2BSkmKvI42DgHECpSGUK
         ck1oB3PsSB6SdViwiK1vuds3wGXDyl/+7v7KE0injlf1OeBu6pRu2xDPa8d4rDzGLVGo
         xt3xAubh8aqMyjOYVkYR+H+YOuij/ZKF+qSPDqcY/Mx9ipEetMKrru5zZre9xXpgJkFP
         Inau4okQSdbfGFti70CCrjSbcJIpJ7sg1DjMbVSFSO0svpxx1GS6QqlSiBgHDtZAEpv8
         UPci0LbgFVHXESP66rqUrfAmOBVJYuOCdZRNcdmQi+A4hDVnsj7SVmubSCIm7C2dzFIR
         MIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391791; x=1766996591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kB9XGvfi6ObodyigSZBf40IoYnb1xkrL/FFwh/sfSnM=;
        b=BfAWDZFB+uBSTbUL9gj/4mU/UA3fDB54ZQ0nKRM1DT4njz8l6wHWsmWpVfk2vAp3V/
         0OW881qcHZ4uDmHWZlJ7nI+0y1EbsQeXg+REokEryf82vjo/tMCeJ/E5ogO/VUebuUd5
         gVqvSIlR8dlcVWzmKPjH2nqltgR0g1BmFdXtyH8fP+I0cruaSxQUuynQkEtP1GfapfeT
         2Fhfbs798996vggRlGUdTfnUBYNloNP7heJSnI2gLKs+Cie7ruWdUC2I8uRuv43I02VA
         +zUerQtVHjWVyCKhFMXt1texwfijrBKmwhb+SdQ9nUc7AJOWycZ0Kntw1FXSieM+6JQv
         Sgvg==
X-Forwarded-Encrypted: i=1; AJvYcCXwGszk0y0SZRNfbzjQwu3kd+N5pX30vYf/dci3VmMEk+QZTcSQpUvLd8WqEgIRQAHgBr1Q/9gtsY9OxenM@vger.kernel.org
X-Gm-Message-State: AOJu0YwOKZ98BoPSjNrKwSj3cM28+Jad3/JIDP+WK+cDCD4+cMcuN/fA
	OvcVdCI4J9t54d8Iy1nkkiZv0/OxKBKhp9IiFWS/gAsqkFBx5KaYguXe
X-Gm-Gg: AY/fxX5qmd7szU1oMQ60D96/27EmpCj7xdGdZQzLQADUrkFw5EuL6IKF+yIIpwyBfK4
	DMHZO9cuqGQ+Zapaq5VUQsFcwqEmpEPthvSCZwxOtqp21kATXeci8q20CQx8oTQqKo7WSTvWtNC
	aDEvHqIWmn060MfdNCkB6KRaGFwKlHz3vZSM2TtPHqjK8zI01+f8wNIB+P1dDi6HTLyA3vMnpag
	/JpNSswo4l7Kbrhz5ynDbOdDopK1yqIwGCSOIiwG7mjyUjCiLIwxgj6Rv4SW0Ga8o/frL7mFsof
	sAuDdXNRgtG1uy1qWboY9+O3nxUcio/F8rTksJTRsJvltqxxvvVXaB2agdZdjSl12Cb6NbbnaLi
	aoMzi5zf/j1qj3O9xzRDlejYd42o8nvLIzKTp4K22uy/4Ape/oAt6GcmKlBHCAbKFvGPjskwl92
	AEj+BpwJR/
X-Google-Smtp-Source: AGHT+IGznpKTz6ixXv+s26nHooFtLIG4Ke1AWMjy0/WKJaDBXTq6iXxKo6TPfotRdJtMkjnB8IbN1A==
X-Received: by 2002:a05:6a20:b905:b0:366:14b0:1a3b with SMTP id adf61e73a8af0-376ab2e4dd1mr7445280637.73.1766391790723;
        Mon, 22 Dec 2025 00:23:10 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:23:10 -0800 (PST)
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
Subject: [PATCH v7 10/31] dyndbg: reduce verbose/debug clutter
Date: Mon, 22 Dec 2025 21:20:27 +1300
Message-ID: <20251222082049.1782440-11-jim.cromie@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 21c1db7e8705..1db2f627237a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -275,9 +275,6 @@ static int ddebug_change(const struct ddebug_query *query,
 	}
 	mutex_unlock(&ddebug_lock);
 
-	if (!nfound && verbose)
-		pr_info("no matches for query\n");
-
 	return nfound;
 }
 
@@ -510,7 +507,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -524,7 +520,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -540,7 +535,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -550,7 +545,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -568,10 +563,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
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
@@ -1245,11 +1237,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
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
2.52.0


