Return-Path: <linux-arm-msm+bounces-86143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D2DCD50F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57DF93002FDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF79132E72D;
	Mon, 22 Dec 2025 08:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8qXZ0oN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6001432E732
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391980; cv=none; b=JtScs/M+7/UTshWhKlKYFmfC64A31aEHWa81Ol9rmHLfr7VCDLXNBej8SqeKQvf4cfdDHRH3vB7sklrdu44mFdkgJi/MKLxZcYH6ZNxXAspw0j+qWndqfsivvsq/pYLzcEKlHcxlfG8TGfTQUcWrRSybcggqr805BHvwYDn0h+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391980; c=relaxed/simple;
	bh=9ih6W8Y/5V2V98AP03k684uMSvrAzs/VQOAmnnbAdf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YlSbouUIoUPIOyrpPYn6bM7J4yaNT22ngHpi7qSq2abMscIQgK0RQQxwu7uRrgs+CL99vqWuq/dQAFAUo/iJGsZpNYOgdAUHuMMVvXc0YlFyysahVy6k98le3hMy32gp+tlXShpU7urq+mzof2Ly//CtqnsM6qsxxUVpB3CR7dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8qXZ0oN; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so4234444b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391978; x=1766996778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDCSt59K+10ZOKnakaeCilFtSVyquWS+P/cFe/a6uAg=;
        b=F8qXZ0oNbr1oI+ag6Ko6gCWpdoNsmwqXxXmSXgUndkPGhqqFmN/F1oyKhYwYKBi/gm
         i4EFviQiEoWsz5MMkKNvVSdkNsz+CLIxN/diRzs9N0fpamRIxWJjc67eFMNfEBg3NAQQ
         ieg4FckxhZ7o0cLanXQnDk4PMI8pCdJEl1OCrH+J0UHuUHp4DGWLMrd7o/R2Nd9CsaiZ
         KI9ztc2BshL32r0yatR5ZveeeJymajcC84esxEzDlm2hYhMft1Y1Rh5ogfiLw0KBvv1V
         i/ug/Z98AAdVJsVOSRKQjcWF7xzLbBycC1Usdm86Z7cNvJA3dog5utzsKx+NTxIxWAcA
         wSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391978; x=1766996778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WDCSt59K+10ZOKnakaeCilFtSVyquWS+P/cFe/a6uAg=;
        b=TxJdq3oraI5/Pq6Eg7qP5jLnvi9PqZo/nGX175PoQa+8lgcAYttXFkT5gEjzSCadfc
         hZM5g+z+1gL1wUPzOmT5XDpgsJVU3xQYH+CRUolkc7TAnJHCWA+DEhbShi/rR2ivTkjZ
         pS+qr2mLIebll/KY8sr9o8NJCgsFtIscMShbfHRGT7oSg0FLmf5N21HB7Rd1hTJTSAP9
         GcfN8TZbiYRVcbALs2Thva9l0RIvQ2N1H7bajbSX2ooZE4DaxHVoU5JFHtQnt6O72voH
         c4vQGmxedurIGbcexQqWvQyGFAnhb9x+NgnqGWjdomlJwHsIl3IVpLdQsrwW7Tp9eVsx
         vDEA==
X-Forwarded-Encrypted: i=1; AJvYcCXd8HVL7+ea8kowpxk3DO1SChIxTciZWTgVmcW4O13OSqi6nLswvoLhPL/o/4oyPy812Qmv2RfE6WRJv9BV@vger.kernel.org
X-Gm-Message-State: AOJu0YxqhRnxFBsz+A0gvpAKAELOqnmEX0Emeo7S81KqjxxXdayfjmDd
	8SxmplbZbVgKbx/XQaeP+PA8nP3YXTJdy2WuU8kcSLB+54PAAUM5BPgU
X-Gm-Gg: AY/fxX60fQtqmcB4wuv6DHnUy4vqas9TuAFgKue4nMLoS0XnFdFGHmv7wDSAcqI8QBO
	6cKiSINjahfidNOPj2BOv6hsyn/vMvjzGNvgaZvfHXYtFmOkWg4qF1zzBuMf2z3IOAdnUbbaBFT
	ahoh7nReJN1nAsB//9N67lVWvyAwaLaEdEC6aYpoat1djo3DWMpwUHWcBcERLpT1Rjc/nTxA830
	MIGER5LIFpdSwHv0yTZrQyF2l5SZSc44A42FstTNzCune4exOvxGGInT2yQP330HMBJQB27cwMW
	jv48MEBIniEqJcoAw8yOG+CfUh89uzvsNqpQRF9t5Hkszu0VaUzNJ/HCNjHyZm2KFOlOYNvKm/J
	YQIu9wRQUqhNMe0w0VUZ8Gq4S3qaZSnQdeb5sGKZ2Mvujb4Nr4jiSfAXQ3aMT1T7uqcYa1jA5hP
	e6i9QZxaSh
X-Google-Smtp-Source: AGHT+IEOgeXzV1hCWIimzrWiIka32wsRRn8gKqyhb6JthROJ0e2B6pTNBqm7iB1jb1DoK/0bL+KWAg==
X-Received: by 2002:a05:6a00:ac85:b0:7e8:450c:61c0 with SMTP id d2e1a72fcca58-7ff66674fb2mr10796719b3a.48.1766391978564;
        Mon, 22 Dec 2025 00:26:18 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:26:18 -0800 (PST)
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
Subject: [PATCH v7 26/31] dyndbg: treat comma as a token separator
Date: Mon, 22 Dec 2025 21:20:43 +1300
Message-ID: <20251222082049.1782440-27-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Treat comma as a token terminator, just like a space.  This allows a
user to avoid quoting hassles when spaces are otherwise needed:

 :#> modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

or as a boot arg:

 drm.dyndbg=class,DRM_UT_CORE,+p  # todo: support multi-query here

Given the many ways a boot-line +args can be assembled and then passed
in/down/around shell based tools, this may allow side-stepping all
sorts of quoting hassles thru those layers.

existing query format:

 modprobe test_dynamic_debug dyndbg="class D2_CORE +p"

new format:

 modprobe test_dynamic_debug dyndbg=class,D2_CORE,+p

ALSO

selftests-dyndbg: add comma_terminator_tests

New fn validates parsing and effect of queries using combinations of
commas and spaces to delimit the tokens.

It manipulates pr-debugs in builtin module/params, so might have deps
I havent foreseen on odd configurations.

Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |  9 +++++---
 lib/dynamic_debug.c                           | 17 +++++++++++----
 .../dynamic_debug/dyndbg_selftest.sh          | 21 ++++++++++++++++++-
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index e76ccd987704..350d93834e19 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -78,11 +78,12 @@ Command Language Reference
 ==========================
 
 At the basic lexical level, a command is a sequence of words separated
-by spaces or tabs.  So these are all equivalent::
+by spaces, tabs, or commas.  So these are all equivalent::
 
   :#> ddcmd file svcsock.c line 1603 +p
   :#> ddcmd "file svcsock.c line 1603 +p"
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
+  :#> ddcmd file,svcsock.c,line,1603,+p
 
 Command submissions are bounded by a write() system call.
 Multiple commands can be written together, separated by ``;`` or ``\n``::
@@ -167,9 +168,11 @@ module
     The given string is compared against the module name
     of each callsite.  The module name is the string as
     seen in ``lsmod``, i.e. without the directory or the ``.ko``
-    suffix and with ``-`` changed to ``_``.  Examples::
+    suffix and with ``-`` changed to ``_``.
 
-	module sunrpc
+    Examples::
+
+	module,sunrpc	# with ',' as token separator
 	module nfsd
 	module drm*	# both drm, drm_kms_helper
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 1da2de7b1769..5ac7248d51bb 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -320,6 +320,14 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 	return nfound;
 }
 
+static char *skip_spaces_and_commas(const char *str)
+{
+	str = skip_spaces(str);
+	while (*str == ',')
+		str = skip_spaces(++str);
+	return (char *)str;
+}
+
 /*
  * Split the buffer `buf' into space-separated words.
  * Handles simple " and ' quoting, i.e. without nested,
@@ -333,8 +341,8 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 	while (*buf) {
 		char *end;
 
-		/* Skip leading whitespace */
-		buf = skip_spaces(buf);
+		/* Skip leading whitespace and comma */
+		buf = skip_spaces_and_commas(buf);
 		if (!*buf)
 			break;	/* oh, it was trailing whitespace */
 		if (*buf == '#')
@@ -350,7 +358,7 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 				return -EINVAL;	/* unclosed quote */
 			}
 		} else {
-			for (end = buf; *end && !isspace(*end); end++)
+			for (end = buf; *end && !isspace(*end) && *end != ','; end++)
 				;
 			if (end == buf) {
 				pr_err("parse err after word:%d=%s\n", nwords,
@@ -622,7 +630,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (split)
 			*split++ = '\0';
 
-		query = skip_spaces(query);
+		query = skip_spaces_and_commas(query);
+
 		if (!query || !*query || *query == '#')
 			continue;
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 465fad3f392c..c7bf521f36ee 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -216,7 +216,7 @@ function check_err_msg() {
 function basic_tests {
     echo -e "${GREEN}# BASIC_TESTS ${NC}"
     if [ $LACK_DD_BUILTIN -eq 1 ]; then
-	echo "SKIP"
+	echo "SKIP - test requires params, which is a builtin module"
 	return
     fi
     ddcmd =_ # zero everything
@@ -238,8 +238,27 @@ EOF
     ddcmd =_
 }
 
+function comma_terminator_tests {
+    echo -e "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
+    if [ $LACK_DD_BUILTIN -eq 1 ]; then
+	echo "SKIP - test requires params, which is a builtin module"
+	return
+    fi
+    # try combos of spaces & commas
+    check_match_ct '\[params\]' 4 -r
+    ddcmd module,params,=_		# commas as spaces
+    ddcmd module,params,+mpf		# turn on module's pr-debugs
+    check_match_ct =pmf 4
+    ddcmd ,module ,, ,  params, -p
+    check_match_ct =mf 4
+    ddcmd " , module ,,, ,  params, -m"	#
+    check_match_ct =f 4
+    ddcmd =_
+}
+
 tests_list=(
     basic_tests
+    comma_terminator_tests
 )
 
 # Run tests
-- 
2.52.0


