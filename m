Return-Path: <linux-arm-msm+bounces-18857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5433C8B6758
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 03:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F61C283D77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 01:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2364F205E31;
	Tue, 30 Apr 2024 01:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oT33oaj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9541113
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 01:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714440016; cv=none; b=bfOw3wi6+ZukjX6mg5KBskIUH4GlLpSyCxEa+X0Ja1kuLfZsZSP4NvhP46wh3jYQu9oCAuj/FtXd/tzFALp9MTD3XzRe3DwcTM1+FlOlgbT3Il7ui3C9IfVE+3uaYMAS7XLg+ubcT5Qm4bl4/oyCInCZ9nlM+7Vfh2tSqvSwSEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714440016; c=relaxed/simple;
	bh=znYqH4KKX5PqF5T6XnwgCw2bHRlbEzXsyiPDt8vHcKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cq+/pzltk54q7WlgGYF2R0XHh6isnnl38aGahuzd76Rah30f0BjrCYoydfPs2xDjrhproWg51EPbOZ4ldgluBKO1Zqhm822/UW4Yjrl7RJ4NC75Hngip630IQMOH16bo/mMcudLKcJ/Nyx7L2xlN9c1Tc3dAEgUy5fqluVuruaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oT33oaj5; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51b526f0fc4so6421045e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 18:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714440012; x=1715044812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AycSOZZElt80+nGkUPVSHZn5jQIyWVlzHRqHfSaFet8=;
        b=oT33oaj5VjJResJb83phXJG4zQ6Irm7KiSrrmtdWUEMOGgXGHLbE/Ta2agvaAO9q6n
         sdt5baR1jzoo9NVHgS7UAf4Sl3o/XVOzs2SfSoe4an+ZOCR8QMTCwmuUY1eQ8Enk8lww
         wFkTn6Ub4bpPClf2W/UFBZno3H/pTtqBW3SaC2AjXsBjn3gisRY8/uWIukUhbnfw4HeL
         5COtM4oYib7HivikLN8NRpnVkEEaJ6I/hOSwbGmhaxrkOIvRD70E86xKCZXh2TQ4qVTI
         G4S+SHQS7ZJr0OQdHSD5qhJGAQzn3Bismfnj7O8XLXnzg1X9kGD+IafdIja6MISjmFkx
         XufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714440012; x=1715044812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AycSOZZElt80+nGkUPVSHZn5jQIyWVlzHRqHfSaFet8=;
        b=oLKiGuvCmiLVG1K6nF9Ikfptp0ZlOLKaYpz8tBN8I2kiHgWmQCDQIOtXA6TSCZzDH6
         /rWQXcbwv1ytppeQlHmfsC5hrNqg9Or0EynzArrkjSZxvfC6fSQjUULg+5hucOQ+NsuB
         ZbEDFWEdVt+A/8zqUrfKJsXkkRjQRZSnE2Zk62BzUXD9xkpI2hfQusIQ1DHKnJv2bBca
         GPnz/kxJlg8K3Bdk+QcK5AoYK32h3gAM1hNfJc0b0+LP54ZHZO/J9o6sYVF2tkwlG1SM
         8b197bMe8sw3dekHK4OkOLSQqDS0UsBR8HoxFoNJzJ6LF29BRyg/HyaJfypBCpLCw4/A
         evbg==
X-Forwarded-Encrypted: i=1; AJvYcCVSTdVslSImk8bedA8vsPI5nioIB3jHvlea0vCPrHOWwnVUe9FGpomu/k/b5Lg1I2o9MbpuP8+ZEPRQj4MnclVD3YvIhd20rN4Zc9uDfw==
X-Gm-Message-State: AOJu0YzBHcLsNgjmewnxztBP7r1MiT/DUBXecN7vVLYaRYwre42QB1Lb
	/SsOHo60fgZs9Anr4J6epmtR8ZdHqpdHKw4yIVeXXtDeK/FIIiuj6ikAooZ/1no=
X-Google-Smtp-Source: AGHT+IH9bw0AMe3tVZIP6KbsbA10hOX2fQYYdQMg4pnIA2cGEpgy22EyGZUR34+wH/R4MrrPQYpPTQ==
X-Received: by 2002:a19:f012:0:b0:51b:812:3c87 with SMTP id p18-20020a19f012000000b0051b08123c87mr739495lfc.39.1714440012223;
        Mon, 29 Apr 2024 18:20:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 17-20020ac24851000000b00518a01fdf2asm4322096lfy.144.2024.04.29.18.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 18:20:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Apr 2024 04:20:09 +0300
Subject: [PATCH RESEND 2/2] ARM: implement cacheinfo support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-armv7-cacheinfo-v1-2-e3d1caa40dc5@linaro.org>
References: <20240430-armv7-cacheinfo-v1-0-e3d1caa40dc5@linaro.org>
In-Reply-To: <20240430-armv7-cacheinfo-v1-0-e3d1caa40dc5@linaro.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6946;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=znYqH4KKX5PqF5T6XnwgCw2bHRlbEzXsyiPDt8vHcKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmMEdJPa805beDVCb+SR4kkUFPhY4N7PufjDHcl
 gi8C/JiOauJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjBHSQAKCRCLPIo+Aiko
 1aJ/CACL6dYBYXdPvWD+XfE439szkIN7PDF/VmnfHkkxYAZKavrxW+CnLiXReqpzfJVSP8GYmXa
 jzDjkaX4aeOWjV5ue++RdidHfok/Tof4cIg29mgQVeJ7NwgoO5+6951oGirSzihPkIxb+iMmX69
 RlxxBsYm7oBXXsIk8lYOzyUpDp94mAjyBn7RRbg6fFaJJ3jdhrPG9trSyyUTRnKJtIyZ/gHiddU
 Yn8v59kDFOiMKtDP3xXlJi7jg++sYvtdvlIf3Kq7s5+I2F5GLlPiZyYpW97uz0xi3XlvFyz83ra
 9Xtvmh9Ix5NYTrGscyUO5kF4at2BvaeNLtsqmOYpE3KGih5c
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On ARMv7 / v7m machines read CTR and CLIDR registers to provide
information regarding the cache topology. Earlier machines should
describe full cache topology in the device tree.

Note, this follows the ARM64 cacheinfo support and provides only minimal
support required to bootstrap cache info. All useful properties should
be decribed in Device Tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/Kconfig             |   1 +
 arch/arm/include/asm/cache.h |   6 ++
 arch/arm/kernel/Makefile     |   1 +
 arch/arm/kernel/cacheinfo.c  | 164 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/cacheinfo.h    |   2 +-
 5 files changed, 173 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 8f47d6762ea4..cb293ddae6bb 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -5,6 +5,7 @@ config ARM
 	select ARCH_32BIT_OFF_T
 	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE if HAVE_KRETPROBES && FRAME_POINTER && !ARM_UNWIND
 	select ARCH_HAS_BINFMT_FLAT
+	select ARCH_HAS_CACHE_LINE_SIZE if OF
 	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
diff --git a/arch/arm/include/asm/cache.h b/arch/arm/include/asm/cache.h
index e3ea34558ada..ecbc100d22a5 100644
--- a/arch/arm/include/asm/cache.h
+++ b/arch/arm/include/asm/cache.h
@@ -26,4 +26,10 @@
 
 #define __read_mostly __section(".data..read_mostly")
 
+#ifndef __ASSEMBLY__
+#ifdef CONFIG_ARCH_HAS_CACHE_LINE_SIZE
+int cache_line_size(void);
+#endif
+#endif
+
 #endif
diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
index 771264d4726a..b39c38ee9fdb 100644
--- a/arch/arm/kernel/Makefile
+++ b/arch/arm/kernel/Makefile
@@ -40,6 +40,7 @@ obj-y		+= entry-armv.o
 endif
 
 obj-$(CONFIG_MMU)		+= bugs.o
+obj-$(CONFIG_OF)		+= cacheinfo.o
 obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
 obj-$(CONFIG_ISA_DMA_API)	+= dma.o
 obj-$(CONFIG_FIQ)		+= fiq.o fiqasm.o
diff --git a/arch/arm/kernel/cacheinfo.c b/arch/arm/kernel/cacheinfo.c
new file mode 100644
index 000000000000..878ff4d10139
--- /dev/null
+++ b/arch/arm/kernel/cacheinfo.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  ARM cacheinfo support
+ *
+ *  Copyright (C) 2023 Linaro Ltd.
+ *  Copyright (C) 2015 ARM Ltd.
+ *  All Rights Reserved
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cacheinfo.h>
+#include <linux/of.h>
+
+#include <asm/cachetype.h>
+#include <asm/cputype.h>
+#include <asm/system_info.h>
+
+/* Ctypen, bits[3(n - 1) + 2 : 3(n - 1)], for n = 1 to 7 */
+#define CLIDR_CTYPE_SHIFT(level)	(3 * (level - 1))
+#define CLIDR_CTYPE_MASK(level)		(7 << CLIDR_CTYPE_SHIFT(level))
+#define CLIDR_CTYPE(clidr, level)	\
+	(((clidr) & CLIDR_CTYPE_MASK(level)) >> CLIDR_CTYPE_SHIFT(level))
+
+#define MAX_CACHE_LEVEL			7	/* Max 7 level supported */
+
+#define CTR_FORMAT_MASK	GENMASK(27, 24)
+#define CTR_CWG_MASK	GENMASK(27, 24)
+#define CTR_DSIZE_LEN_MASK GENMASK(13, 12)
+#define CTR_ISIZE_LEN_MASK GENMASK(1, 0)
+
+/* Also valid for v7m */
+static inline int cache_line_size_cp15(void)
+{
+	u32 ctr = read_cpuid_cachetype();
+	u32 format = FIELD_GET(CTR_FORMAT_MASK, ctr);
+
+	if (format == 4) {
+		u32 cwg = FIELD_GET(CTR_CWG_MASK, ctr);
+
+		return cwg ? 4 << cwg : ARCH_DMA_MINALIGN;
+	} else if (WARN_ON_ONCE(format != 0)) {
+		return ARCH_DMA_MINALIGN;
+	}
+
+	return 8 << max(FIELD_GET(CTR_ISIZE_LEN_MASK, ctr),
+			FIELD_GET(CTR_DSIZE_LEN_MASK, ctr));
+}
+
+int cache_line_size(void)
+{
+	if (coherency_max_size != 0)
+		return coherency_max_size;
+
+	/* CP15 is optional / implementation defined before ARMv6 */
+	if (cpu_architecture() < CPU_ARCH_ARMv6)
+		return ARCH_DMA_MINALIGN;
+
+	return cache_line_size_cp15();
+}
+EXPORT_SYMBOL_GPL(cache_line_size);
+
+static inline enum cache_type get_cache_type(int level)
+{
+	u32 clidr;
+
+	if (level > MAX_CACHE_LEVEL)
+		return CACHE_TYPE_NOCACHE;
+
+	clidr = read_clidr();
+
+	return CLIDR_CTYPE(clidr, level);
+}
+
+static void ci_leaf_init(struct cacheinfo *this_leaf,
+			 enum cache_type type, unsigned int level)
+{
+	this_leaf->level = level;
+	this_leaf->type = type;
+}
+
+static int detect_cache_level(unsigned int *level_p, unsigned int *leaves_p)
+{
+	unsigned int ctype, level, leaves;
+
+	/* CLIDR is not present before ARMv7/v7m */
+	if (cpu_architecture() < CPU_ARCH_ARMv7)
+		return -EOPNOTSUPP;
+
+	for (level = 1, leaves = 0; level <= MAX_CACHE_LEVEL; level++) {
+		ctype = get_cache_type(level);
+		if (ctype == CACHE_TYPE_NOCACHE) {
+			level--;
+			break;
+		}
+		/* Separate instruction and data caches */
+		leaves += (ctype == CACHE_TYPE_SEPARATE) ? 2 : 1;
+	}
+
+	*level_p = level;
+	*leaves_p = leaves;
+
+	return 0;
+}
+
+int early_cache_level(unsigned int cpu)
+{
+	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
+
+	return detect_cache_level(&this_cpu_ci->num_levels, &this_cpu_ci->num_leaves);
+}
+
+int init_cache_level(unsigned int cpu)
+{
+	unsigned int level, leaves;
+	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
+	int fw_level;
+	int ret;
+
+	ret = detect_cache_level(&level, &leaves);
+	if (ret)
+		return ret;
+
+	fw_level = of_find_last_cache_level(cpu);
+
+	if (level < fw_level) {
+		/*
+		 * some external caches not specified in CLIDR_EL1
+		 * the information may be available in the device tree
+		 * only unified external caches are considered here
+		 */
+		leaves += (fw_level - level);
+		level = fw_level;
+	}
+
+	this_cpu_ci->num_levels = level;
+	this_cpu_ci->num_leaves = leaves;
+	return 0;
+}
+
+int populate_cache_leaves(unsigned int cpu)
+{
+	unsigned int level, idx;
+	enum cache_type type;
+	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
+	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
+	unsigned int arch = cpu_architecture();
+
+	/* CLIDR is not present before ARMv7/v7m */
+	if (arch < CPU_ARCH_ARMv7)
+		return -EOPNOTSUPP;
+
+	for (idx = 0, level = 1; level <= this_cpu_ci->num_levels &&
+	     idx < this_cpu_ci->num_leaves; idx++, level++) {
+		type = get_cache_type(level);
+		if (type == CACHE_TYPE_SEPARATE) {
+			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
+			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
+		} else {
+			ci_leaf_init(this_leaf++, type, level);
+		}
+	}
+
+	return 0;
+}
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index d504eb4b49ab..cb1222b8bbc8 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -132,7 +132,7 @@ static inline int get_cpu_cacheinfo_id(int cpu, int level)
 	return -1;
 }
 
-#ifdef CONFIG_ARM64
+#if defined(CONFIG_ARM64) || defined(CONFIG_ARM)
 #define use_arch_cache_info()	(true)
 #else
 #define use_arch_cache_info()	(false)

-- 
2.39.2


