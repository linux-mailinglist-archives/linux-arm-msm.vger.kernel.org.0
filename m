Return-Path: <linux-arm-msm+bounces-86140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D13CD510B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15ACA301F268
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF3432C31C;
	Mon, 22 Dec 2025 08:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJvQyKJq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B587C32D0C7
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391931; cv=none; b=PDbSvz6y5ROqlvGboBvnNaMY+Fbqv488sYA4rbA6osaR8pOiPU7FRWyNt18Xa4MS+ESnWyE0Sw4vwk9cdzMCwCKZKlkdPsfGC2B5sdAaDBE0V18ocvbbHm90/t66Ec958i86y7weZiv+qPreC+yXp2+UJYAzUQSjGj82+HGWjpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391931; c=relaxed/simple;
	bh=/nJUkWmLcX/SKgU5pPEMr9BXDtU01jXPihG5RIKUDrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttopqoM2fZDkjDYuu7rO+mQZBLHYXZ1WvpTqgfeJpE32hOY9axv3e0D2IGW/E46lst8oOqnZCGfYmO8HmOgnqHeYlF0PYj4RnsQF9zQTfd6C++QBmZS6Dt2T8SligCO4gABT9yD/umsjvwxJ7gGnTTCpS8ovaTAjQpVd48WJU40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJvQyKJq; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo4233800b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391929; x=1766996729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJ6LQIhz3opDVp8qv4sJ5LmxJU4UfSK37U6o6GR2gQA=;
        b=KJvQyKJqG5nj7Y8VktcAJw7T1NEQjVbYgudHO1djMoWF2uLgzwmcQikmE30WGvkHIR
         aVJiZZbp8WZBu9hRPLR3J0znluc0KXeOwMl773GoLUnYe/WkxhC+eMthc+1kiGcD93aJ
         6L15c4El7+LDLjq/IfztELi6DXU4YgfuEEBo9vchb0HeKXVFgdVy1ovu557tUaajKKGg
         80LljJaw2T0jGN3xILePpZ6TTk2DuFwAZNjFFnt61aoV7IxwTGutDnL0pYXMfG/5wt6w
         DQBmqfZHPQzC5LkRdjjo7rlngyOLvYJZL7Y+wOY2uZ5HhFWJd6mpEopOi0tqJ6v/XHBM
         5DYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391929; x=1766996729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wJ6LQIhz3opDVp8qv4sJ5LmxJU4UfSK37U6o6GR2gQA=;
        b=f+XTHd76kc11uqup7RCRXXA9Cjec3JYg+f7kvoV5WC+dYNHL6qTBnOm5xRuRIJPt9d
         NVIFoCsfzD+yD9InTFwvOUJ9gg8ENPKI7XVTPt8DtahCVF1rOWXT3S+fokPugVO0AsdZ
         rkUMwyqyp+dbnFQrYB9IKdAXoGRWowVs9L8dbie8Dq9N5XyDNsZOzeaZlFwzwN1ck3C4
         dxwWH1TrFNTDjKwCD64VCIvcfDU2dblBNc1E5MjWP6d1yfIW7zmOgTs9ziplINUdoP9v
         3wQuKqRlNlVvwk6jNgTfu6qj7e1OoA0HuS3I33c0EsTT3cZ1aKq5Ig0LFJlNuIOl7955
         wodQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5JQ3s30mQ4xG9kdjzqZ4N0VzCUBeK7WEtJJyTPsGR9mednGQ00hB8wJwxgpghsWqjN+KuGAXu6DQn7wy+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ehf9eHBnU0PNn/voHhKZpZRF0U1Yqon1G4YQI1d/8C9j1PiU
	Uvt4lNAYvQ3igBexPaG33zb+r+NFCkoT+ABJ//ft89RuFDOo8gSmkTeF
X-Gm-Gg: AY/fxX4FL6qPA5EH7o0E5/pfaSsVGqE51cy81h1dxE5/pvRnuxamzbtXhpO0P20KbH3
	8uSxqJn4ANjRbAn9NA3dIdmjn36pky46sRXTL+aVqy03ujs9Vj2paYgO8tZnQplAHNtBhwCrMEA
	GTRk+Ij8cMkgttUQ0nOH0PQVUBFUXKuvkpwrjaIGfkzUfvkR8I77Oi5QHehTzyFrvzrgqoF17/v
	35OcgdT3vRPtg3WaZUfkfpEawvOmYvpq3bPgVXzWVmS2Q0BRRCMSd7qyY4GTPLk5oRFTk4WI2EY
	z8dt/bV1R6u08BLfHQN9+/tJY3z2oWk5ovoqvZG9szLnnTvYpJWGlPKyxtcOHllp3kenNAaHNoM
	ssNEWXIcyKzWsP9MVXqyH5Kni9BKlMFS1HWfLXSRSw2LpObHqgF/8SbOr1L1oursiA2K094KIat
	gTl/dhj7GI
X-Google-Smtp-Source: AGHT+IE+QxCurRN0AzDICu9k2MWk1SPp1amxCYIl0Rf045fB7y1IHjsIYvGaV+1OKSxAVQgufeDctw==
X-Received: by 2002:a05:6a00:4190:b0:7e8:4471:ae5d with SMTP id d2e1a72fcca58-7ff67456c6emr7951795b3a.41.1766391929081;
        Mon, 22 Dec 2025 00:25:29 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:25:28 -0800 (PST)
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
Subject: [PATCH v7 23/31] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
Date: Mon, 22 Dec 2025 21:20:40 +1300
Message-ID: <20251222082049.1782440-24-jim.cromie@gmail.com>
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

Add __DYNAMIC_DEBUG_CLASSMAP_CHECK to implement the following
arg-checks at compile-time:

	0 <= _base < 63
	class_names is not empty
	class_names[0] is a string
	(class_names.length + _base) < 63

These compile-time checks will prevent several simple misuses, and
will issue obvious errors if violated.

4 such examples are added to test_dynamic_debug_submod.ko, and will
fail compilation if -DDD_MACRO_ARGCHECK is added to cflags.  This
wouldn't be a useful CONFIG_ item, since it breaks the build.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  9 +++++++++
 lib/test_dynamic_debug.c      | 13 ++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 905db0b49104..b19c9b1d53b6 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -180,6 +180,14 @@ struct _ddebug_class_param {
  * __pr_debug_cls(22, "no such class"); compiles but is not reachable
  */
 
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
@@ -193,6 +201,7 @@ struct _ddebug_class_param {
  */
 #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	__DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));	\
 	extern struct _ddebug_class_map _var;				\
 	struct _ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_class_maps") _var = {		\
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 1ba4be9a403a..b2bdfdfb6ba1 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -133,7 +133,7 @@ DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
  * Enable with -Dflag on compile to test overlapping class-id range
  * detection.  This should warn on modprobes.
  */
-DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 #endif
 
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
@@ -146,8 +146,19 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
 DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
 
+#if defined(DD_MACRO_ARGCHECK)
+/*
+ * Exersize compile-time arg-checks in DYNAMIC_DEBUG_CLASSMAP_DEFINE.
+ * These will break compilation.
+ */
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_neg, 0, -1, "NEGATIVE_BASE_ARG");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);
 #endif
 
+#endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
+
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
 
-- 
2.52.0


