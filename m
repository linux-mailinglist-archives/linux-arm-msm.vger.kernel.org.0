Return-Path: <linux-arm-msm+bounces-67542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98954B19262
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 506E73B6E6C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9D0286405;
	Sun,  3 Aug 2025 03:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRoamkkR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E5D2857F1;
	Sun,  3 Aug 2025 03:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193555; cv=none; b=kuWHjJzgrY1Gs7XZQFuNT8jn491xdB78RggPTfz4GEPALmPOy6fNTN7HmC9kRS7aANS6JjXcfp1F/rtISCRCQgyQdA6sU/qy9Ovp6XlfKVgHDn7O7wKCzQ7k2X7KChPZG0aHrmzDMVltCj/qTnZjKVQzhqLiQXEntb3aC0GHE8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193555; c=relaxed/simple;
	bh=gORfCbMZL6Wxvhl95sxzwqPJVD/1w/NNZ0Jd1TmBzXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DIkqbrbxdQ0Eanz+BnA/j096DoSkG3yXNgN/eL8Kf4SjX95LTtfbtm7CRkZfOJkUwZF8gzdJDFL6K5WD8uUlX0VlBpi96RtIhXe0++PInvxGArUFZW4NTh5pfiW1GKSy81DM5KWMqb0iQGA8T8kXwjYw+3Z7BsoRVVJqSt+Xnr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRoamkkR; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3e3dbda56a5so9951075ab.2;
        Sat, 02 Aug 2025 20:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193553; x=1754798353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=107A+iGieriBtcIEvITMI+JSyLEcyFCk4tsRW7oIEjk=;
        b=FRoamkkRVWpcGpK4UHSQnTtwWPXqTHQ2T/z+ObsJelaxXbuPfwZ5929zusDRGSGsrH
         T9gmgBimRMTI3ET8NUQMn3kYpzZ/ePrwGMJ3gsNCw4SI6JUJAepa9N45EqVJFH+cwHIt
         UdTiKdYfd4B7qPOhcfu+za3y92LdDSJPdU4+xke4CxnhqfgczykLl0ra5ihx65WL0pLH
         3BCvms5KNoo28oiFlTK5qhtpSIDRB4wvH6ZR7Ar0+YNmKfSahSSljyehAia+6R/nx0qj
         XI0FSw9e/MSJADoRwdHAVbWmDWtsZQxR36JlrsRBmtnfpH57BYHV66UpAJSbZV3wrNNh
         0G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193553; x=1754798353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=107A+iGieriBtcIEvITMI+JSyLEcyFCk4tsRW7oIEjk=;
        b=A3gtFPCxL3NHyeMBmezVgXtfirkeMrhquZJfPE/cYyQUjVgQrwh7TYDF+JzcSMOUMp
         nRyEhsfpDhGKCzeNrkM93/JAc2gp2nNPf7TxKJ0EpjygINTRrGP8V3i4OhDcYfkbQHYV
         13btKNtxBIsfl2V/RnzQXhAaK5ZA4VL/WXlMdpeF3STwza5exR9kmTmFFuqA2c4IsZNd
         2uCL0AVvw2cX9IKzyMo1zt7jfMR6SZwQmMeJmn9w3kZRhKaH4gDzo9k3qecF0KEm8pqI
         9GVklM4AdCJEWCWZT5rbQh+7+DL3N6aUH9DmFWnTOUrSMvnACxsMt3LZnFWsqBzcME5P
         7FXA==
X-Forwarded-Encrypted: i=1; AJvYcCWTxVFFbye1ZAL0EzgbqxEM5OY6ATCoDfvatJye/65jxs4WDPmsPcjTXEJ6SUUJy06N2kb1eN6O9HvSt9GS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw03YKGeAYEUdAoSwiIVNOobuow40is30mDhGxlvEmu/tN5rUJp
	HS0pdfKb0/D9F4ylrsU1AXNMtmkOMDiP3ZoW3+vu81tFL45vWZi5Vo0ySpb5i1IKFow=
X-Gm-Gg: ASbGncscNbW2qmfeXjKBHGFTEvy0yMUpxCSoyBZpSMS1xupjEC22QvVkOCwMVFay5Zr
	mRVm3eoXROSIOe2okz92JaRUMn5h+bM8Qk+7eP/QW2n1zfQwWGF1KAMffyRRa+Ft/3U45wfafAs
	4TnTI1SUsLYeiHJg8C9RDk+MzGZDk/lQEBMPvYZnyVNUJa2ja1zA1E15XMhI4voGHhmpL766dyb
	MqG+6w02myXPMgv6RYNuTn4e/KMqz+MzxqqNwjM9YEoZEyliel71kCxQDR1aRFBjlheEnYVRdoV
	BizNbsnoBcIjUu7IanlY+lhnQTbvCVoyEuG6pHqoHQ7Q1YDJ2lGSNAWXpCEzVSCHKoP/tJwG8Pe
	iVio2PQkbBauJbtljqWuPs9V6j73wEjGFtXBH7U/Y9h8M745HwG6cnUd/sjIPeNyKsuVUyckhSG
	IT6w==
X-Google-Smtp-Source: AGHT+IFEpYnc1XKOtvTxu6uAAxg044+wAtgG0lAGsg41AxxCrDtrtzNsUPBwA6fhtq1RSc/6sEyECQ==
X-Received: by 2002:a05:6e02:2388:b0:3e3:e42f:279e with SMTP id e9e14a558f8ab-3e4161b6f2cmr101215625ab.15.1754193552837;
        Sat, 02 Aug 2025 20:59:12 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:12 -0700 (PDT)
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
Subject: [PATCH v4 26/58] selftests-dyndbg: add test_mod_submod
Date: Sat,  2 Aug 2025 21:57:44 -0600
Message-ID: <20250803035816.603405-27-jim.cromie@gmail.com>
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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
r3 - skip test if LACK_TMOD

older
  drop -v used in test_mod_submod(). V=1 does it for whole test
  ifrmmod at test end (Lukasz)

test-mod-tmod
---
 .../dynamic_debug/dyndbg_selftest.sh          | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 513f6cb1db1d8..09937dca3056d 100755
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
2.50.1


