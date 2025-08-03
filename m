Return-Path: <linux-arm-msm+bounces-67548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA208B1926E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 056A017A387
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEFB2877E2;
	Sun,  3 Aug 2025 03:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbYP2hE1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92E82874F8;
	Sun,  3 Aug 2025 03:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193564; cv=none; b=aQ6OxbFmm03M3svL6f2O/zgSuSuCq4jLcGsHVigcep5/JApZRebUu6Aabeux7lAEwu2KBbIrylvXOxnMjpMnNman5ULcXgD9XqWSg7ggggRhgOFrGAAuGZgV3x8eh2luy71vUduV+xf/MFsGbqklPKBVoVVlfFPxpz4Cmc9ZVzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193564; c=relaxed/simple;
	bh=sL1lkdjAUCQyqokA7st7/Z+BY2dzq6VNkgUjkZK49wE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PUyEw/NKuJWHD2AV3E5cfA1La0FWtsRx+ywnFOouv2ZeOJMPoulyg7wbF7a1TMMBO9mi2eDmayExenB6m1e/OayQZVxHEIdR/3xhNCcbkLi+ggGSbVLDA/ydJ2nfw4+wwiXKMOPpa3ISetum5YhwXtIvFobiRX2Pn27kmszPvCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbYP2hE1; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3e3c34a9b4cso38296645ab.3;
        Sat, 02 Aug 2025 20:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193562; x=1754798362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA9BT3YNmpiLht3dKaMvYWse8nMOfTq2XV6jwNxcq68=;
        b=TbYP2hE1Q54uNqU0pGoXjoLmgOtula1dnC7xEejCUxKHK3Z0fCHYATtY1rlLd0d50v
         dLN6xPDUkwG5E96sfQ6asnSsYta5Yvo019uaNn0gm+17WCpIXy4sO2GJyQcCk+n5Otcy
         HhFwGGX+ftS0Sb49Kl5O81cX2dvaCxFQ/USrjXEdYi+GoI1fKw1Qq5Qn26ZryK2Ck6pN
         j9kl2sDzY8thZDOEB2UxeumwX/uPpDGOdCP3ygp8ywk0ZRnBO8wO+WN+cXSXBCHM5P2Y
         NUlKSGWJWmwbWAYtecyfxapy1Re62Nnu3+ROF8ft1jR5ah4nGIx1c2DmyDtdtWf2SAR8
         uE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193562; x=1754798362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WA9BT3YNmpiLht3dKaMvYWse8nMOfTq2XV6jwNxcq68=;
        b=U2vg7fU1xUm56q4rZAZDB5oz/wb3Zi5AbjFhhgYnYqds2Rz3vSgwxnnRrYMDpItyi5
         6SLhqcyZ0jIc383vFEB35xPUkszD5i95iw/CdtpVTLERJ2sAK3gTmS0XI9/BknfyOVJz
         G/1Vab3+3gSaiDus4RzuM/5yJrAVJ0QbcD6BJefurYZM6s2bhzmzzwVD1J082ezKguL2
         MzcAFKNuadgmOwXZ07ObUwBMAcd2sLNA6hQ5oYAbnOvdkt8T5hGb6V26D5hycjIfAQn1
         UBpIkV6fpkSqI/znduwyMR/q881veim32Lt53g5uBDk9OzCJgvWNbRUg3tv0cDDYSiv7
         qjMg==
X-Forwarded-Encrypted: i=1; AJvYcCWITwcqjfp9XJ0D6tFu3qCYnj7s7j4O3AMHV4HIHpEOQnKuFvbgrXu85WzIfbeoP1s1u+7qAjx/IzG5IEUk@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ5lvUyYZGdmEPJXCs5IXdHGi6PuDHoFq44c7gko1EcPBOn0Ie
	62srUm26NmngpsJgC1LXpl9y1IidYlzdImsW/sk4XdNTWKHtUjrO5O26YgG3OJlWBP4=
X-Gm-Gg: ASbGncuIyp9IRGLoSbbGSZiE8lR0cQN7YzodhZaQMCfOhVKqSFDi5gXx3j2HZmaQzs4
	G9jIOTz3j10yNYyi3F3vQM2vHn2iwAOBxfWRu3pT9S1zEfG99mHJ9aevkkHdg+GThXUmfl75Kq2
	NoXakn3dAGxRH7Dy4O3lgOwYdKW0+PYNmoVq7rkcGll+3YMAZ1FdJ0CDXIUisb9vkHSa8BPSSYR
	boYBoKNlGuDq+qLejEJsR06JajJRhYKd3sQvvKJyioWbeOxUzMBOMg3X1NZ/Pb+6RUlXExR5tgD
	Fl3iYULUybzBmaPFOWlSs50osmSqVWEkRCVzssJJGhiWCuYEM0yz2ebab6jnZSty1VtNvRCwYFM
	Y9p02fRj1gmSq+IH0IkKNowjoAxC/ugCamb0UmlMllscB6RoLzM7ejmYp1AnxRUt1LM5u4KFHpj
	RZIQ==
X-Google-Smtp-Source: AGHT+IHkYA6Ve5qjyBOl298LajPA2dLsLYiKeEEffa0px/i/mFWvep0iac35UJUfFk5w3QjlIsT70Q==
X-Received: by 2002:a05:6e02:2382:b0:3e2:a7a1:8cd8 with SMTP id e9e14a558f8ab-3e41611a075mr96109765ab.5.1754193561731;
        Sat, 02 Aug 2025 20:59:21 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:21 -0700 (PDT)
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
Subject: [PATCH v4 32/58] dyndbg: refactor *dynamic_emit_prefix to split lookups
Date: Sat,  2 Aug 2025 21:57:50 -0600
Message-ID: <20250803035816.603405-33-jim.cromie@gmail.com>
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

Split dynamic_emit_prefix():

1. keep dynamic_emit_prefix() static inline
   check ANY flags before calling 2

2. __dynamic_emit_prefix()
   prints [TID] or <intr> if +t flag
   check LOOKUP flags before calling 3

3. __dynamic_emit_lookup()
   prints 1+ of: module, function, src-file, line

Notes:

With 3 only called when needed, print the trailing whitespace
unconditionally, and drop the pos_after_tid var.

By doing TID in 2, 3's output is cacheable in principle.

A prefix cache would allow de-duplicating the redundant data in the
_ddebug tables, and replacing them with space-efficient storage which
is not fast enough for every-time pr_debugs, but would work to fill
the cache the 1st time its enabled and invoked.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c3e27637d9357..26261b5f99f05 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -824,19 +824,8 @@ static int remaining(int wrote)
 	return 0;
 }
 
-static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
+static int __dynamic_emit_lookup(const struct _ddebug *desc, char *buf, int pos)
 {
-	int pos_after_tid;
-	int pos = 0;
-
-	if (desc->flags & _DPRINTK_FLAGS_INCL_TID) {
-		if (in_interrupt())
-			pos += snprintf(buf + pos, remaining(pos), "<intr> ");
-		else
-			pos += snprintf(buf + pos, remaining(pos), "[%d] ",
-					task_pid_vnr(current));
-	}
-	pos_after_tid = pos;
 	if (desc->flags & _DPRINTK_FLAGS_INCL_MODNAME)
 		pos += snprintf(buf + pos, remaining(pos), "%s:",
 				desc->modname);
@@ -849,8 +838,29 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 	if (desc->flags & _DPRINTK_FLAGS_INCL_LINENO)
 		pos += snprintf(buf + pos, remaining(pos), "%d:",
 				desc->lineno);
-	if (pos - pos_after_tid)
-		pos += snprintf(buf + pos, remaining(pos), " ");
+
+	/* we have a non-empty prefix, add trailing space */
+	if (remaining(pos))
+		buf[pos++] = ' ';
+
+	return pos;
+}
+
+static char *__dynamic_emit_prefix(struct _ddebug *desc, char *buf)
+{
+	int pos = 0;
+
+	if (desc->flags & _DPRINTK_FLAGS_INCL_TID) {
+		if (in_interrupt())
+			pos += snprintf(buf + pos, remaining(pos), "<intr> ");
+		else
+			pos += snprintf(buf + pos, remaining(pos), "[%d] ",
+					task_pid_vnr(current));
+	}
+
+	if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_LOOKUP))
+		pos += __dynamic_emit_lookup(desc, buf, pos);
+
 	if (pos >= PREFIX_SIZE)
 		buf[PREFIX_SIZE - 1] = '\0';
 
@@ -859,7 +869,7 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 
 static inline char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
 {
-	if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_ANY))
+	if (desc->flags & _DPRINTK_FLAGS_INCL_ANY)
 		return __dynamic_emit_prefix(desc, buf);
 	return buf;
 }
-- 
2.50.1


