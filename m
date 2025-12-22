Return-Path: <linux-arm-msm+bounces-86144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AF7CD531B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11F7F303B019
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5F330E0EC;
	Mon, 22 Dec 2025 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYLmqJNU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B63230E821
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392025; cv=none; b=jKEY/GJB5CRLJ3TWCaISOuHemu9hDDdN2GqfqvMtgercj1UGI9aCjdvopoO5Fyht9TIl/KgT5qAfu0eLPZLgMOPKHNFvJmn7efUS+aZ6gBLSAI6aYCEcax1XyV1m908WA0qJ2ur5hpCUv6v58sAYreTdNoj8oKVeg0HupvK8hGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392025; c=relaxed/simple;
	bh=NiDfgm9IIZPO7vTOaAaoNFPcWN2xiAR0IE0jA7B36/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZ2JWjoelsFU4313QOH07ejH/UPFs5fV3M1VPRkDqgtV3uiLbKYdvsG80OQarquVzvZJLGtGkb90FgHtuS+8Fclm8w6kWtP4VgwQQayen0BBOAYTL1YwkpyAZXjZ6LVsFoX0OHLbGqTmc8bEEiz1UTtlCANkpPaugNoY8KwaCr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYLmqJNU; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7f216280242so1412600b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766392023; x=1766996823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii1VafhOMs6l+h1e+D2giL8132vNQ2TDoma8/MEoG3Y=;
        b=YYLmqJNUN24kgrJ6POTcdlRy1yY8HaXcrHZPikXcUmgqsc0xoytf9Lu1a9+2nah53d
         5cdrrJ11T07ja0wqfwhD8zpaQb8ShroFGzfFY6XiEDzHUMVEHC2AesjIYxAVQmLlyaPv
         RMS8gMv70ui3v+uWPA2fISUy9Mgzmdeq2QO9ThuiGQHYNsxL9VQHYBL9qTgqG1hMUyjA
         E0MGA48CFUIHmgdEczgCmOZIzzIl9XB9qG40qmrRuC1/3/XzerUnxhCaLYi2T+7epFFY
         FESYptX58FlMaKntfCSAir26L0imlCsDuvQNEW/NfkfdfZvhvOHz8qsIQJeH6LO5Squ2
         XTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392023; x=1766996823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ii1VafhOMs6l+h1e+D2giL8132vNQ2TDoma8/MEoG3Y=;
        b=quHLmTEkVtbQL1l1ITG25DyNm+lCydMCO8mMHAlMRD448MNqwiGkb5jGacWiSjqAhu
         HgoPPYMcVkouqKpaaPs8cVl/qGcNKltgT33tc6UO9pku8ygzeB3rUJg/rxomZuWE5Wr6
         3mEbK1p3TavYxozzJgqjJN37j2hGA0BJ04XtSqfUncXhiqXm8KIab9rn2zz+Zpf++ojG
         HE/Bf70auegc8WJ9a/kRGSnfeKi3BKMKlCdKBQ4KX85bo7FkxLiXSusMdz0KD1M0SV/t
         0Of6DZNI2xyEXgmUzMkpWvyGgrziZL0nh9Nx0Oopk2YJjG+TlHS7wwAHXpSqHIUdtY8f
         sHFg==
X-Forwarded-Encrypted: i=1; AJvYcCVwJlF1MKTmjFzGsSeRVhjLLntvbT2J2YmALrQDdwyOwvBw66ZILrHhRLxBy5icx1Pov8hPWqbA0BvaIC90@vger.kernel.org
X-Gm-Message-State: AOJu0YwdJUrDW0ZLr64ufchCoc+c0INgz6hokJO2om+CwRRHd6NG/cxi
	rVttoRXnPXJqrwDgnERC2GaoqFyaiUC23Etqna0l98yupD1mN4MkMK/Z
X-Gm-Gg: AY/fxX7f5L+/S/vGvfJeQ2foXOMDwde7x+uj3ZW41jYddD/VbUQNkTX1qxCs6iPExEr
	T2EABxfmjk2O2XV/DZjl7J2AuKStXmgqbjxav+mAsMu9o2SQeNTQqEsQXuKKykNU9oCsbBvHMow
	JW+y7Ra/KMX2ai/yyBW1iOx5BNmOZRFZ8+l7zXuR/MR+FhvtK84JXhkf7QFpw3kIviivgPTSseM
	CQaHScN8j7i1athk1Xlf3v3XDJbH394XFaOUdh6xmFSS5YB8U1Bum1QRMk5MNQJknexHOMPpTxD
	A/gFQPEu6HQ2ADju7Uao8LfAKm+MowIv0wlJYKCYgB648VwKHkE6OCgaTh8z0AZGHLA5rFikg2Y
	vd3QJDQQrN40mNdRB54Rtx8ISqYZT3PVZ69z/vBzqsmdpTeIS7rUIsxb5zy2UWi16/Kl74o1tTq
	qRTlt4a6wy
X-Google-Smtp-Source: AGHT+IGofjncFQbha1D4YrfUNbCgds/xOaiZY5usf+asKdAPER694b234cYaH/K4SJMr8+Sv5Hw4Hw==
X-Received: by 2002:a05:6a20:3d0b:b0:366:14b0:4b1b with SMTP id adf61e73a8af0-3769ff1bb74mr10653684637.38.1766392022754;
        Mon, 22 Dec 2025 00:27:02 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:27:02 -0800 (PST)
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
Subject: [PATCH v7 27/31] dyndbg: split multi-query strings with %
Date: Mon, 22 Dec 2025 21:20:44 +1300
Message-ID: <20251222082049.1782440-28-jim.cromie@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |  8 ++++---
 lib/dynamic_debug.c                           |  2 +-
 .../dynamic_debug/dyndbg_selftest.sh          | 24 +++++++++++++++++++
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 350d93834e19..89ee15d7ae58 100644
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
index 5ac7248d51bb..c50836c262b4 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -626,7 +626,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	int i, errs = 0, exitcode = 0, rc, nfound = 0;
 
 	for (i = 0; query; query = split) {
-		split = strpbrk(query, ";\n");
+		split = strpbrk(query, "%;\n");
 		if (split)
 			*split++ = '\0';
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index c7bf521f36ee..513f6cb1db1d 100755
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
2.52.0


