Return-Path: <linux-arm-msm+bounces-86145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A12CD5345
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98052307DF15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F26330667;
	Mon, 22 Dec 2025 08:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI6KrKOn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7DE330656
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392075; cv=none; b=TrPOhyMwmYceK+8gs6XIAn6NB0wQdeJO4qf8RJDgonNpo4J2wyrBDxSCbo6qrdzquZTTMalR8V/VgKbqp2NDEwPUNrFh4C27iSEhn4HT6laUnGkzL+eTLqaerQz1VKKtnwjed4ChZrVddnJUppksCrHzxfpeO1WNrIwYKLh/KI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392075; c=relaxed/simple;
	bh=Y6op64SH3HVRwLLGtoxME3mldm3/W0c1FqQmgPaP16k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5xOaXiZ9UqR/k8WxEva9CZXmYabDvFv9AZzHFBitFqN4abh1czK9i0r5xzObZVJRFaCpr3uyXcjkz9BOOb1RIY2G2GxJ42wZVCSmUoMEqP+eP3xOSOSONtRdnU2tUNB6dFlsquKfwcxTiKI1kcAgZ3fnsCEtKF0lKDS3NTalZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OI6KrKOn; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so4488868b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766392073; x=1766996873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3hNaVpAB+vi7bZ5p4r2BEr0xFTlYHYJVlfyEjZdNd0=;
        b=OI6KrKOnJOEvSH5QvIZp03Ngxuccv0PbbRFff2JWEvZQlwLPoSZKKYRVjnljdCpEn0
         BfeH1Cj9MwH2YOD7UagUC5ef02FSkYHhZ/WzYF9Q1KpGvvkR24EJRRa9hJ29GAUBTYP9
         y5LQWuAedHHCuMwMoh+q68+jVEz5feft3iKKydmpBBKELEz/VOBQK/G/USXpZ4vW1cAF
         UHxbHB1k0ZYUX7uimMLby/BmB8hyQAljEfAk56au6Y158oJrHidbH9ZSCDM1OHetuN3g
         8edJkmh9oH/McsNguM4VK4ltHoUBX2Yn4w20GV0jgeA48+Q9LGc9WDBgunVI/pZzobq5
         cF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392073; x=1766996873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M3hNaVpAB+vi7bZ5p4r2BEr0xFTlYHYJVlfyEjZdNd0=;
        b=PkQ1fM3FiA4qvz2zsiG/0gGS1TkbruFYhA2qMKy5pxWV0Bh27ru+17wvn+28KwYWbz
         xqC7CBPbaR9QpEWmMbet5BjSF56/nFLaa4lPeKRb2a2LLH4HVLIbPzE+ZVltGu/4FYdl
         1cSaIddUHGVlp0OXXwfPK+m38YxUxoqZOKngENzGOrjge2JBryNFrm6EzQC5XOPJ+ojT
         Gd++7zX3TYX7gid6GMBh94DQLPS/QsDnKmS+GwPqp7pb0LtMxGbWZaamZpbz4HlTL70r
         39ZcNb9lU6umSm8JSsdHHlGWQCEP+J9+azUdtFSZS0mgBg0x8QrPcLtYJ7Q3XFZrG4fR
         Ga8w==
X-Forwarded-Encrypted: i=1; AJvYcCUsf+ewn335bK+eAUhmN6VNJYL8Awn8vFZ6bJOOGMGdp2S4QTxadEyA0TL2PHy8LMm6VfAnluj77T4oRJE6@vger.kernel.org
X-Gm-Message-State: AOJu0YxRI/d8eguoWRZjCSk4F2rUsDeMgaRdqoFh5QJMCStY8DcOTtgi
	R+BPlMDt7U8RQLteekPjWxD6vuwSJV120xRdLAowI4Xnm6VqIuXIpMcn
X-Gm-Gg: AY/fxX4AvmoqDVnZ9jPavQOiOPK5mSh37Sk/xbsH+LbD+iysDc48/o3HEDL6QOBpEUK
	ygA+yTFVWKmPEpMRBhU0w0jwYXyOFnH/68dgQ9Tfdq2ytHsB3P5MBfypJ2i1ZHteSi22+wHck+6
	QdqfpBWPNQ2OEC9yZDtUtb4sAJ+Au1Lb6c+uxZ+HSb4+hDQ+p/JwVFqZIEf73wkf1gqfCmvew9p
	E3hCoBFFBFIv55xSxCgeR/csw0LNLCLuLLK5bLuuEEVGjK8XvHZ4PuD5H7++fDQvbxi64ikRSi0
	Lu/PrPaEov34MNC1AA7Vko9DdHMesvXRUaZ7m2b7kiCe/TiQAuA9+P4c26GWPcfFvjUi8EzsuIF
	irQkytqdCaYBFXEYwGGHg7r+qIooPYWn5Usc58BKJnaQzzCdFZTUOemsfLpstiz73VonvPtVQ8A
	DA553WzJWE
X-Google-Smtp-Source: AGHT+IHrWaoINwKINIS2uQVVYNVnFRipbIxAPkhOusVnBjYyr1lqJHYW+COkqDtcwbbrVKaUvl+ojg==
X-Received: by 2002:a05:6a00:aa82:b0:7a9:c21a:55b4 with SMTP id d2e1a72fcca58-7ff657a6a53mr9191153b3a.28.1766392073152;
        Mon, 22 Dec 2025 00:27:53 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:27:52 -0800 (PST)
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
Subject: [PATCH v7 28/31] selftests-dyndbg: add test_mod_submod
Date: Mon, 22 Dec 2025 21:20:45 +1300
Message-ID: <20251222082049.1782440-29-jim.cromie@gmail.com>
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

This new test-fn runs 3 module/submodule modprobe scenarios, variously
using both the generic dyndbg=<queries> modprobe arg, and the
test-module's classmap-params to manipulate the test-mod*'s pr_debugs.
In all cases, the current flag-settings are counted and tested vs
expectations.

The 3rd scenario recapitulates the DRM_USE_DYNAMIC_DEBUG=y failure.

1. 2 modprobes (super then sub), with separate dyndbg=class-settings
   check module specific flag settings

2. modprobe submod, supermod is auto-loaded
   set supermod class-params
   check expected enablements in super & submod

3. modprobe super, with param=setting (like drm.debug=0x1ef)
   modprobe submod
   validate submod's class'd pr_debugs get properly enabled

The test uses multi-queries, with both commas and percents (to avoid
spaces and quoting).  This is the main reason the test wasn't earlier
in the patchset, closer to the classmap patches its validating.

With some tedium, the tests could be refactored to split out early
tests which avoid multi-cmds, and test only the class-params.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../dynamic_debug/dyndbg_selftest.sh          | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 513f6cb1db1d..09937dca3056 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -279,10 +279,83 @@ function test_percent_splitting {
     ifrmmod test_dynamic_debug
 }
 
+function test_mod_submod {
+    echo -e "${GREEN}# TEST_MOD_SUBMOD ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP - test requires test-dynamic-debug.ko"
+	return
+    fi
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+
+    # modprobe with class enablements
+    modprobe test_dynamic_debug \
+	dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    modprobe test_dynamic_debug_submod
+    check_match_ct test_dynamic_debug_submod 23 -r
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct test_dynamic_debug 46 -r
+
+    # no enablements propagate here
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    # change classes again, this time submod too
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml "# add some prefixes"
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    #  submod changed too
+    check_match_ct =mf 1
+    check_match_ct =lt 1
+    check_match_ct =ml 1
+
+    # now work the classmap-params
+    # fresh start, to clear all above flags (test-fn limits)
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    modprobe test_dynamic_debug_submod # get supermod too
+
+    echo 1 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 4 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( V1-3 + D2_CORE )
+    check_match_ct =p 8
+    echo 3 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_CORE, D2_DRIVER )
+    check_match_ct =p 4
+    echo 0x16 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_DRIVER, D2_KMS, D2_ATOMIC )
+    check_match_ct =p 6
+
+    # recap DRM_USE_DYNAMIC_DEBUG regression
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    # set super-mod params
+    modprobe test_dynamic_debug p_disjoint_bits=0x16 p_level_num=5
+    check_match_ct =p 7
+    modprobe test_dynamic_debug_submod
+    # see them picked up by submod
+    check_match_ct =p 14
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
+    # these require test_dynamic_debug*.ko
     comma_terminator_tests
     test_percent_splitting
+    test_mod_submod
 )
 
 # Run tests
-- 
2.52.0


