Return-Path: <linux-arm-msm+bounces-67540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 083F4B1925E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 068E93BD0C9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FCDF285C9A;
	Sun,  3 Aug 2025 03:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duCAgV0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D5127EFFA;
	Sun,  3 Aug 2025 03:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193554; cv=none; b=Q1QGYhc0pH61RqlX53XH+bMjoh8vzJN0bMtggvEVJtoIT4+ZfIUtDZjK3Sa3AI1xo7K5lLMuQEfhYOhXpcj+ARMUABUm6yWRNtArtvlfEPYa4mU4K5cuB91bS2ptsRzfgFTPFlsYVg6v3cCNnwOqwozwIkqxmQzU+4pGKf/kRrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193554; c=relaxed/simple;
	bh=jCChffBvv0YOPbk2zUSOBbOkNITbVXURkad9Ur9lJEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PaASLg8uOypXYVho2dXot4eX2Ng2IbMh2+7OcV3d2bgfMOwcPxogd25GANhhx87x4weFhbY0jQ1aA18sifNXqpLSrD3U6zXylu2kebKFIIV6zHH/3pS5Us09Hx5Q+fl+Zl8Rd27zZTZsDNeJgyANZjw7F+3iF68XFjkXqQnTCPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duCAgV0X; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-879c734f0e2so60018039f.0;
        Sat, 02 Aug 2025 20:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193551; x=1754798351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIsLV3TB8k5ucu5pn8ENFVJkOV1b1Zc619vHbx6KE3Y=;
        b=duCAgV0XZK+syI4p8Xpl6y30MlM3dqvU49MqkLQPSv/N3gzSLQJtiaQUHzxA9807GH
         u7KbXPuqtqJNkm+I/l8hRE/MhNH4pIxZ8Yv5E2UTePH4thZRYg3rlJqFqXVDov7cOZPs
         6mEhtFy8ctgCrJN/Rc9s+IHjmWYwHTegTUKxzqiVvs7xfefh/PdprYxgD97EOLQxIIwy
         uvRcEWHWZBG+bS05mZU57D6rWiC90ulTcluF6UStS4Tyb3SCr2cZ000yGQPl/TMFeGAi
         T0S6Ma02TKs/ledTI5HPVad5JgasUBb6T6K7rvcHnHzpLxkGVEkfeoxQVYPokFVVIUmS
         Oxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193551; x=1754798351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIsLV3TB8k5ucu5pn8ENFVJkOV1b1Zc619vHbx6KE3Y=;
        b=k3ELZeeGTytcnex4hVYvttk38AWD17mE2lHBn0CzVDe1RNQ8vd/DNJAkV/ejsmCsb2
         mznXnnJUual1c89Cu9fjn+HhnA4uQ42A48y8yGOsqVuA00D6yAQCFBIhf5E+SsL+cECC
         2fDrzu93yZsyR1+xTEpcLg8rZJXnhPpgL8g//k0uO7wBct0lFKAKbPHhNwPIfAj+kE06
         VkWt6gOIyupgHW7vFL3YCIoplnPVyWB8+Gf4bnZhPZDnnpG+p9XFM7pJrMfU8On/4Eg0
         SOuIoK7+rOoo95iLoQxlTo9DdQLqsSaJ1896/S2z9JMoNXck4rHH5vW1cYHHMLN3dqMs
         gU3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxA5Ei8ORY6pb8n1FHgqR4/EApGZa9XyIfUb3A2Sy/ihAJdlVKLjM25szyvEHg8nFTNlYcdYERMoYDBzI+@vger.kernel.org
X-Gm-Message-State: AOJu0YxMlyjoMc7YDIpTleuozcAFj+WiJF+YE+7r2JXG8D+uns2Dt55b
	bCdmOEBiAh3TJrbWDypCzcaowt0/1U3k9vNzytzC+6/7J8i2/bNZ+gFlg8A1k7sJpZ8=
X-Gm-Gg: ASbGncsycgM+mYw2w+TCh9e9PqR8aaXXvfdakK6WR7HLX+ITw+MMxtCRJtogseIyd26
	yOIXKImbcw68kLBljX+Ctzr9/kilXG2m5vLe0LfaCxQjDuwtVD9fmdlIt3tpK4qnYzPITe2Iv9h
	w7Ii0yr5W7+TFlrtjpfwOl2c8K2mmDrnz80ofwGEeRkWldRLo23TC6wOlDcUkPfBRPYr3hZLshn
	6ysWYHxtmvHnpQTXhg1WvKy6ZNm9bJtV55eMnaN/QrpbEdTb5Xjs+uNEcw3tNhWqSPSI5BmR2ai
	iiBu9ucuTF+w3krQ/nEiUt/7br/hQjw+cgJi96XNRJXEZ1z3cNfmEGBbjo8QJldR74W8u5amaW5
	W2FAtfJOzN5T5e1UrQtmxaxbMaczumgrZfykbkuy6EuGbiSGlJU1RBSOE9skwgyrPxTpRSJg3fV
	DfBsul97kenZhj
X-Google-Smtp-Source: AGHT+IHMTb14erlWcx3uPanj+74lbfKJy77PmyqgbUaexrywFum5PC+8tMgu/EFNKc+XsZAX1tA4QQ==
X-Received: by 2002:a6b:5a06:0:b0:876:a7cc:6eb7 with SMTP id ca18e2360f4ac-881683b27eemr751673739f.9.1754193551518;
        Sat, 02 Aug 2025 20:59:11 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:11 -0700 (PDT)
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
Subject: [PATCH v4 25/58] dyndbg: split multi-query strings with %
Date: Sat,  2 Aug 2025 21:57:43 -0600
Message-ID: <20250803035816.603405-26-jim.cromie@gmail.com>
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

Since commit
85f7f6c0edb8 ("dynamic_debug: process multiple debug-queries on a line")

Multi-query commands have been allowed:

  modprobe drm dyndbg="class DRM_UT_CORE +p; class DRM_UT_KMS +p"
  modprobe drm dyndbg=<<EOX
     class DRM_UT_CORE +p
     class DRM_UT_KMS +p
  EOX

More recently, the need for quoting was avoided by treating a comma
like a space/token-terminator:

  modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

That works, but it needs the escaped semicolon, which is a shell
special-char (one of the bash control operators), so it is brittle
when passed in/down/around scripts.  In particular, it fails when
passed to vng (virtme-ng).

So this patch adds '%' to the existing ';' and '\n' multi-command
separators, which is more shell-friendly, so you can more fully avoid
quoting and escaping hassles.

NOTE: it does break format matching on '%' patterns:

bash-5.2# ddcmd 'format "find-me: %foo" +p'
[  203.900581] dyndbg: read 26 bytes from userspace
[  203.900883] dyndbg: query 0: "format "find-me: " mod:*
[  203.901118] dyndbg: unclosed quote: find-me:
[  203.901355] dyndbg: tokenize failed
[  203.901529] dyndbg: query 1: "foo" +p" mod:*
[  203.901957] dyndbg: split into words: "foo"" "+p"
[  203.902243] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[  203.902458] dyndbg: expecting pairs of match-spec <value>
[  203.902703] dyndbg: query parse failed
[  203.902871] dyndbg: processed 2 queries, with 0 matches, 2 errs
bash: echo: write error: Invalid argument

The '%' splits the input into 2 queries, and both fail.  Given the
limited utility of matching against the working parts of a format
string "foo: %d bar %s", nothing is actually lost here.

selftests-dyndbg: test_percent_splitting

This does basic testing of classmaps using '%' separated
multi-queries.  It modprobes test_dynamic_debug with several classes
enabled, and counts to verify that the expected sites show the
enablement in the control file.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
-v3 squash feature, test, doc together
    gate new test, which needs test-dynamic-debug.ko

test-percent-escape
---
 .../admin-guide/dynamic-debug-howto.rst       |  8 ++++---
 lib/dynamic_debug.c                           |  2 +-
 .../dynamic_debug/dyndbg_selftest.sh          | 24 +++++++++++++++++++
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index e2dbb5d9b3144..1ceadf4f28f9f 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -85,10 +85,12 @@ by spaces, tabs, or commas.  So these are all equivalent::
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
   :#> ddcmd file,svcsock.c,line,1603,+p
 
-Command submissions are bounded by a write() system call.
-Multiple commands can be written together, separated by ``;`` or ``\n``::
+Command submissions are bounded by a write() system call.  Multiple
+commands can be written together, separated by ``%``, ``;`` or ``\n``::
 
-  :#> ddcmd "func pnpacpi_get_resources +p; func pnp_assign_mem +p"
+  :#> ddcmd func foo +p % func bar +p
+  :#> ddcmd func foo +p \; func bar +p
+  :#> ddcmd "func foo +p ; func bar +p"
   :#> ddcmd <<"EOC"
   func pnpacpi_get_resources +p
   func pnp_assign_mem +p
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 17651a8267567..73076709d169e 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -605,7 +605,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	int i, errs = 0, exitcode = 0, rc, nfound = 0;
 
 	for (i = 0; query; query = split) {
-		split = strpbrk(query, ";\n");
+		split = strpbrk(query, "%;\n");
 		if (split)
 			*split++ = '\0';
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index c7bf521f36ee3..513f6cb1db1d8 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -256,9 +256,33 @@ function comma_terminator_tests {
     ddcmd =_
 }
 
+function test_percent_splitting {
+    echo -e "${GREEN}# TEST_PERCENT_SPLITTING - multi-command splitting on % ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP - test requires test-dynamic-debug.ko"
+	return
+    fi
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+    modprobe test_dynamic_debug dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+    check_match_ct test_dynamic_debug 23 -r
+    # add flags to those callsites
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    check_match_ct test_dynamic_debug 23 -r
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
     comma_terminator_tests
+    test_percent_splitting
 )
 
 # Run tests
-- 
2.50.1


