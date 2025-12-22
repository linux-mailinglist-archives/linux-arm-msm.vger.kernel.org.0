Return-Path: <linux-arm-msm+bounces-86153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9CFCD5342
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A953D3079AAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAE733D510;
	Mon, 22 Dec 2025 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJsSJp+r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2264F33D4FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392171; cv=none; b=Uk93BjPymH9PD29w5VVwGOCUxO7H3fCzmHilB1NDWh5DZzD0TprpIcXYWoyZTSG6H+1ujz5ZMVFICVV63JTcsGL/4rZONyU3df/hnpgy+lTtZIIVxo+PIuFtvbyH/mrGGtIrJiC01GObY3yhy8FbjvoeGZ1x/VhFwcfCC5RqP0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392171; c=relaxed/simple;
	bh=J1eDk9ZVPw8FZKq7NBfxm7axQ7Jd97Z9A2H46UDDwHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQABTeE831jIaCYIBrjWpBSufhl+7RrchHtE76YtgvGDHM3EU8+LLcTChrmWe4EdioAm5HYND4fa4/0DN44YY8Nr6pr42vo0R97rvFtaYO33d0BupyCc/jmLKmOls8G279XpMYl65KFQl15Pk7ejQX3IuSIE2SMnh2uztaTTeuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJsSJp+r; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so4490502b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766392169; x=1766996969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JUGCGjJm2Xj6X5n/nhoMCGHMBetXjpQki6LB/h6PNI=;
        b=HJsSJp+r8+9Z1QHYX1ZgEMhzmgWCKSNbF3rbSZ0BxDl5c7ngxh/yI2I7UOLh7NTA23
         gtRankyoxvfODPYeN0r+FaofjRkcXplRVNDKSj/aW5DpCpXHTb0T/I59kBjUvIIGEZXM
         IDHmPiaR4c6c4zFuXBiX+j8zfDdTi6tfRfSPtuX/9KOTa59a15W91yX5jcqDjfynxXH2
         0k3/CeYiQwEcgqG7iMYPH14ip1epdUEVxczA+9aTcnQJ8Uk6Xui+nef7M62rCpO1SHgr
         ASQCdBtZ6pfs4lEptywG7JbQAAIgJ9JDh4xyLzEdWNvcsAxzhhYgejUafHhldOD1iIid
         qnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392169; x=1766996969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6JUGCGjJm2Xj6X5n/nhoMCGHMBetXjpQki6LB/h6PNI=;
        b=HcsIfLiqK4f9v9S01ZNQD/Cnis1VZcc0ed3eX+TsmtdjYSHErGkcWRHzTNUFC7veLn
         mqpt926MaYIqn3VrorKS9RSI2L8pKyzAeQXT3duKGtTrZFTq0X1EtGN054F4QHJVUCjO
         fBjJYISuB2SlE8qvpJA1IgWAfkVSg5XZGi0a62X2MYXx60zDStWTD1G/GM63wGAeffk8
         gbY55efeegxdbNmU33ekt3BKn7cHAvcCCYSBsCEYgsqGAwKbqsl3s36Y67iRMPJfFcmG
         D1Sz6OaHvWzRh2XmFJ5pGOCWfCHTOQ2KWZHlXomqwz4Hk+A3TcDdeDP1rjdp7zIe7ABa
         vXpg==
X-Forwarded-Encrypted: i=1; AJvYcCWdwsEALCC02yhz4bmw3Q68MzLFB04TyjDFfcmO8edMSvPtFmLitR0owxmhfqdDDYAB14DGbzSkeJB6zyNl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4+hBIGKm0aNGIVWSTrjAwDV0r2rPoVeNp12gH7TTZEODC/9ii
	0jHBElhXiZG8UPpuMqEJBSud9/TyJCJiFhicYaiXJFiNHPDNkr6ljoOc
X-Gm-Gg: AY/fxX6qfIouMaa4JX6pRV5aUAJtcY2qnVTzSHRMiZHhhB45dgCtg/2EQUacHidmbnR
	9K8sVnJ2WR3arbDNQwt6nb7ttm411dy1/HlN0O9CHK3AKPmwXHqN9uMRz/YUZe3NvhCU2QvyuA0
	C84lESzgQZHc+YLkGYEt4qiZt+ow6pt59iW4xy+C0JDJsd3r7pbEWF9l0d1jQ9nVyCzpef3bBHx
	uoiQa67K05ncYuO8FRC1WfenPBcCBJ5MyF156ig4M4D7KtxYfFKCmURXvTAEzyxFTM7DurSoufb
	E3wnvq46ZHsKiAIRAHH92kmXEIi5ufMYhW1Uj3MftPLo6v9D01+mz6p0gi5N33e3KfYEUbj9XFO
	dlYirOd3T1zKZfu+tAAvm1ZtVICyNpYBf0iN63lktqOGoNQb4SFqfFb21g81PwI7Uw+yBjzlrlo
	/vRnS5Slk1
X-Google-Smtp-Source: AGHT+IEimmJ/Dttom6F34YWsdHH3XKVu5FJm4MVosU3HZTEdHiOovrYFxoO5oyh48i40FCdqR5InOQ==
X-Received: by 2002:a05:6a00:aa82:b0:7a9:c21a:55b4 with SMTP id d2e1a72fcca58-7ff657a6a53mr9194464b3a.28.1766392169447;
        Mon, 22 Dec 2025 00:29:29 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7af29dcfsm9640064b3a.17.2025.12.22.00.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:29:29 -0800 (PST)
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
Subject: [PATCH v7 01/31] dyndbg: factor ddebug_match_desc out from ddebug_change
Date: Mon, 22 Dec 2025 21:28:13 +1300
Message-ID: <20251222082843.1816701-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082843.1816701-1-jim.cromie@gmail.com>
References: <20251222082843.1816701-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ddebug_change() is a big (~100 lines) function with a nested for loop.

The outer loop walks the per-module ddebug_tables list, and does
module stuff: it filters on a query's "module FOO*" and "class BAR",
failures here skip the entire inner loop.

The inner loop (60 lines) scans a module's descriptors.  It starts
with a long block of filters on function, line, format, and the
validated "BAR" class (or the legacy/_DPRINTK_CLASS_DFLT).

These filters "continue" past pr_debugs that don't match the query
criteria, before it falls through the code below that counts matches,
then adjusts the flags and static-keys.  This is unnecessarily hard to
think about.

So move the per-descriptor filter-block into a boolean function:
ddebug_match_desc(desc), and change each "continue" to "return false".
This puts a clear interface in place, so any future changes are either
inside, outside, or across this interface.

also fix checkpatch complaints about spaces and braces.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 83 +++++++++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5a007952f7f2..eb5146bcfaca 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -171,6 +171,52 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
  * callsites, normally the same as number of changes.  If verbose,
  * logs the changes.  Takes ddebug_lock.
  */
+static bool ddebug_match_desc(const struct ddebug_query *query,
+			      struct _ddebug *dp,
+			      int valid_class)
+{
+	/* match site against query-class */
+	if (dp->class_id != valid_class)
+		return false;
+
+	/* match against the source filename */
+	if (query->filename &&
+	    !match_wildcard(query->filename, dp->filename) &&
+	    !match_wildcard(query->filename,
+			    kbasename(dp->filename)) &&
+	    !match_wildcard(query->filename,
+			    trim_prefix(dp->filename)))
+		return false;
+
+	/* match against the function */
+	if (query->function &&
+	    !match_wildcard(query->function, dp->function))
+		return false;
+
+	/* match against the format */
+	if (query->format) {
+		if (*query->format == '^') {
+			char *p;
+			/* anchored search. match must be at beginning */
+			p = strstr(dp->format, query->format + 1);
+			if (p != dp->format)
+				return false;
+		} else if (!strstr(dp->format, query->format)) {
+			return false;
+		}
+	}
+
+	/* match against the line number range */
+	if (query->first_lineno &&
+	    dp->lineno < query->first_lineno)
+		return false;
+	if (query->last_lineno &&
+	    dp->lineno > query->last_lineno)
+		return false;
+
+	return true;
+}
+
 static int ddebug_change(const struct ddebug_query *query,
 			 struct flag_settings *modifiers)
 {
@@ -203,42 +249,7 @@ static int ddebug_change(const struct ddebug_query *query,
 		for (i = 0; i < dt->num_ddebugs; i++) {
 			struct _ddebug *dp = &dt->ddebugs[i];
 
-			/* match site against query-class */
-			if (dp->class_id != valid_class)
-				continue;
-
-			/* match against the source filename */
-			if (query->filename &&
-			    !match_wildcard(query->filename, dp->filename) &&
-			    !match_wildcard(query->filename,
-					   kbasename(dp->filename)) &&
-			    !match_wildcard(query->filename,
-					   trim_prefix(dp->filename)))
-				continue;
-
-			/* match against the function */
-			if (query->function &&
-			    !match_wildcard(query->function, dp->function))
-				continue;
-
-			/* match against the format */
-			if (query->format) {
-				if (*query->format == '^') {
-					char *p;
-					/* anchored search. match must be at beginning */
-					p = strstr(dp->format, query->format+1);
-					if (p != dp->format)
-						continue;
-				} else if (!strstr(dp->format, query->format))
-					continue;
-			}
-
-			/* match against the line number range */
-			if (query->first_lineno &&
-			    dp->lineno < query->first_lineno)
-				continue;
-			if (query->last_lineno &&
-			    dp->lineno > query->last_lineno)
+			if (!ddebug_match_desc(query, dp, valid_class))
 				continue;
 
 			nfound++;
-- 
2.52.0


