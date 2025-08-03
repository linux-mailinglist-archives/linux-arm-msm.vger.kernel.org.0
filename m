Return-Path: <linux-arm-msm+bounces-67537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B24BB19257
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 869A41888E31
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FCC5285058;
	Sun,  3 Aug 2025 03:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irepHcCf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCE4284B36;
	Sun,  3 Aug 2025 03:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193547; cv=none; b=T4vjxC5MEDOD6IpZ+CjSlY6qL06d+AO9K59TYdNc4U+2fEpavXF6aY5zMmd2e2AJg2re6+YAWOEmb6kAvu6zL6wzS+gUT5om02r7/Z9aB0Y1yJn1fMqDfsUBg7HFqOexpVU7tvujR6xBY1nFIX46hs/BGR5YpZxewb0awMN4Vps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193547; c=relaxed/simple;
	bh=vkSC7vPauoDuBmeLWkmXvMWHe3k2JYQ8L3Vcdnp1IpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RffrJ7XO3TA9lgQeojyZBB/UwsrrPysAAXPf4wr+wfKC4NxV6vxHcyq7UId0QEsFA9AvlsHg8L4GJXyTH/dznwHpeuehmwkFnEu1tTdkhfnjg7RoL4T1ZFfgHn1itReAPxGmUJIO1GXurrh0U8AGwaFNQI+AVUptNHngHtrsIx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irepHcCf; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3e3d0cba6a7so12045805ab.0;
        Sat, 02 Aug 2025 20:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193545; x=1754798345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARFL6N/7u0yBvj65+SeUK5cuQkDEObUSqpQweZqDyQ8=;
        b=irepHcCfB/qjyyY3axQNOo4FV4AWeNDPWEWGBaMkdYbkH/OxNEyBnwnflsni2e7EOQ
         BCOmG8FhQx4F9jMwdpUuBrnm3IlmcanKFEW4qS+cynwkER7L0nLlmIDjvcaM9Qz4EFK6
         r5Ja1m+B5Lm4ct+ip6nzHuHujiLkJhco2l5q0qr6UqDfr/q1OZqAbh6PHizQsT5+WQLp
         AmBqUN1aIpghqFgh0yNUJukObXmAfVzgdtUlGyrffSJbhtvC4NzQ8N9av5R0J8T4RaTD
         uVT1D7CF4+GkzMfQ+Pyp6SObMKYQNN4M9wujwfoKKchdxi1N7kzp5y11T1vn70HGbPIP
         PWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193545; x=1754798345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARFL6N/7u0yBvj65+SeUK5cuQkDEObUSqpQweZqDyQ8=;
        b=aMKPO2cuXIkrFyikxce+1ANzwLvBq79q9lD/59QtvlELAbm2Qr6QHZVcPAYLOQxtaT
         oMCF1MdTCAukNf7+CV65apYfMYlGO4XDaiOxnSC5SMUqAqvxNnBMs5FC1kCUWndM7ee5
         4LYLAV31je2BRd4YQ7HB9UKKYYtyEbrFW9vL6MZiouJ1Dt5X46jjTKd/3sK3ciNheCoW
         rPkyPeEBGiWjHwhyKrPvnz8vE/TIZgTGJ62ChgiRSq0sfJNfvJLjhsNSMAwaa3RkoVgy
         CNTZAR17OrJCGCiWUtGnhojeXt9yyjRA91hvdYHSDuZ5VskrQT5+laTrOTVVNRzLp9ZT
         SX0g==
X-Forwarded-Encrypted: i=1; AJvYcCVj9FIQWglovaEq2jk5NziWgbfVXC1AfDLLUk7mpJqk2oFM2YFoN8emDuPEVE0r8FWL58kx10G6mPMS0jAV@vger.kernel.org
X-Gm-Message-State: AOJu0YxfCaSxIr+NtoyQUHjncLoU27AW6+0lYNKODrFFFOZ3nmb7D+xu
	8txc7DNM5hGEpqiQuSYe6DcCDIQM0n7wTHQaXYSCMDHPF28kg4S6PviPgTrON/iq+k4=
X-Gm-Gg: ASbGncucC5x6e3qylE6lP2A5LirFkqJXzWMHwkWs62+5rE35tN1vdzP/qSNeoQxqen8
	07psRk3CXFwwIS5rdgKLjsRJnG9Jjv6zSIvn7oMCJo4tcyqCY9RnxswPYL+ve1DHudX8RAdqqUk
	IuHY8lQekQG8Q+bDYLVwWlepk8/TozCzGdDIK8n+kW0TWpQPXTKnJO7T55vCWaZrKqribFmRKTJ
	ElNHB6MnXGNwZdlZhRr6Tz6UonM7804DhqzkcGrAdBu3WCpzBc3BKGTGxlfLRPhXNlG4kyPgNaz
	RxV0bqJX44mky3qjpYj5NpsrGyKVkGSrWju42+IoZyrWGe4cuLQr7TLiF73l0sQ5lYitkuvv/Gw
	1OH+Zyp5e5QF1uTM5RLV5XrwovMCJxxeixSovS7UfuQ0+bXSKlTPPEWzwWwTAIV3d29cIa8lFNA
	WG1A==
X-Google-Smtp-Source: AGHT+IEBzXwTpz+6kufpgt0kt/EVEpquD0XeO5VyPFcOTsTn6fzv2h6s3BTW+bB/H1codZT3P8zPWQ==
X-Received: by 2002:a05:6e02:2208:b0:3e2:9aea:8049 with SMTP id e9e14a558f8ab-3e41615d13emr88848645ab.13.1754193544756;
        Sat, 02 Aug 2025 20:59:04 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:04 -0700 (PDT)
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
Subject: [PATCH v4 21/58] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
Date: Sat,  2 Aug 2025 21:57:39 -0600
Message-ID: <20250803035816.603405-22-jim.cromie@gmail.com>
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

Add __DYNAMIC_DEBUG_CLASSMAP_CHECK to implement the following
arg-checks at compile-time:

	0 <= _base < 63
	class_names is not empty
	class_names[0] is a string
	(class_names.length + _base) < 63

These compile-time checks will prevent several misuses; 4 such
examples are added to test_dynamic_debug_submod.ko, and will fail
compilation if -DDD_MACRO_ARGCHECK is added to cflags.  This wouldn't
be a useful CONFIG_ item, since it breaks the build.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3- $macro_name =~ s/DYNDBG/DYNAMIC_DEBUG/

prev-
- split static-asserts to __DYNDBG_CLASSMAP_CHECK
- move __DYNDBG_CLASSMAP_CHECK above kdoc for DYNDBG_CLASSMAP_DEFINE
  silences kernel-doc warnings
---
 include/linux/dynamic_debug.h |  9 +++++++++
 lib/test_dynamic_debug.c      | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index c45f5b76763cc..9bcada421e88e 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -110,6 +110,14 @@ struct _ddebug_class_map {
 	enum ddebug_class_map_type map_type;
 };
 
+#define __DYNAMIC_DEBUG_CLASSMAP_CHECK(_clnames, _base)			\
+	static_assert(((_base) >= 0 && (_base) < _DPRINTK_CLASS_DFLT),	\
+		      "_base must be in 0..62");			\
+	static_assert(ARRAY_SIZE(_clnames) > 0,				\
+		      "classnames array size must be > 0");		\
+	static_assert((ARRAY_SIZE(_clnames) + (_base)) < _DPRINTK_CLASS_DFLT, \
+		      "_base + classnames.length exceeds range")
+
 /**
  * DYNAMIC_DEBUG_CLASSMAP_DEFINE - define debug classes used by a module.
  * @_var:   name of the classmap, exported for other modules coordinated use.
@@ -123,6 +131,7 @@ struct _ddebug_class_map {
  */
 #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	__DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));	\
 	extern struct _ddebug_class_map _var;				\
 	struct _ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_class_maps") _var = {		\
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 1ba4be9a403ae..e83b34b6d6b95 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -146,8 +146,19 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
 DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
 
+#if defined(DD_MACRO_ARGCHECK)
+/*
+ * Exersize compile-time arg-checks in DYNDBG_CLASSMAP_DEFINE.
+ * These will break compilation.
+ */
+DYNDBG_CLASSMAP_DEFINE(fail_base_neg, 0, -1, "NEGATIVE_BASE_ARG");
+DYNDBG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
+DYNDBG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
+DYNDBG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);
 #endif
 
+#endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
+
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
 
-- 
2.50.1


