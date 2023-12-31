Return-Path: <linux-arm-msm+bounces-6185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E28DC820C35
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 18:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F6BC281E90
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 17:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220698F48;
	Sun, 31 Dec 2023 17:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZPuKPjaI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A26D8F4F
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 17:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e7e55c0f6so5038925e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 09:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704044342; x=1704649142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AycSOZZElt80+nGkUPVSHZn5jQIyWVlzHRqHfSaFet8=;
        b=ZPuKPjaIHivLHTAUcYFfEKoCCxgIM3yqzaNuAqy7DbIHa8tUGNbABKYrj1Y5cXywaO
         9uXYzdRvHPpE3EwYRkMOvsvxXe18f/9abir31naO9f02tM0kEPlSnu8J6fXSj/hMW4d8
         tzzSCEclJuc2h8WYGNIC48IDqVnTNzpZHA23YZ/PvalKC17Te7pIPrplS/0a57Ro0PYA
         vVOqqS0Hjv1b19JzXTe8d2xZCTsK9Df0Of1hc4jDk35SPNXit8el5yC/0upyPM6WBsQn
         nl35m68gpppV7OhPe0HGOwEhy4bOdB+QXxGQjq2wcthjABDv5qZZb3YzUVfFJ05ymqyP
         Gf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704044342; x=1704649142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AycSOZZElt80+nGkUPVSHZn5jQIyWVlzHRqHfSaFet8=;
        b=Gm2rLfhd0MSsFTViLQQDBqY4VNbC0WQP0DNo7p5jn9vF8KZxUwCaU1Tx9mwREvIw6r
         lm+0d66aoMpjt4V3w5GilZSdufgzYh9EUPhhumLSOiTokmz0dxocsKhbloNfrA1LjaDw
         8DHIbAdR1IryzRCYFWMj4qyp1vPOQXrlu2ZZXsSVfZB4Crgeu/uKKiAE5UqyC+/G1IeM
         ocRDKTKlNeL767PX8+91TuRzuuSOL2ESizdKz/JV+G3O6JQw5b9rcJs6RnB8JTEWuLzv
         3bEQ7Moo/0wQX7zLGS6RytAEyamE2oCAiHJ+p4gmOFd9Q3gJLNW3BvpnB8H9tzHZ8aut
         9QCA==
X-Gm-Message-State: AOJu0YxtmUCQpem/ONjHR7J6DOqgGHvlpQWc3xpqm8HoDWGRgJmQ1/ig
	KDMmIiOFNKu40P7v6Se02meySuNHBBIpwg==
X-Google-Smtp-Source: AGHT+IEIWk1Ymhg6hGPa1amZYgO1GBEKyEgNOVjTvtmT2I4amYEwX6JeDEplAOdz+pjDdAnRzzw0oQ==
X-Received: by 2002:a19:f719:0:b0:50e:76f7:3ea9 with SMTP id z25-20020a19f719000000b0050e76f73ea9mr1725034lfe.149.1704044342286;
        Sun, 31 Dec 2023 09:39:02 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t27-20020ac243bb000000b0050e798243a7sm2233233lfl.177.2023.12.31.09.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 09:39:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 19:38:58 +0200
Subject: [PATCH 2/2] ARM: implement cacheinfo support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-armv7-cacheinfo-v1-2-9e8d440b59d9@linaro.org>
References: <20231231-armv7-cacheinfo-v1-0-9e8d440b59d9@linaro.org>
In-Reply-To: <20231231-armv7-cacheinfo-v1-0-9e8d440b59d9@linaro.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6946;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=znYqH4KKX5PqF5T6XnwgCw2bHRlbEzXsyiPDt8vHcKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkaczlx5tG+RUChGY+eqb3IbQ/ffoxhH8znrks
 2MGDI3oci6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZGnMwAKCRCLPIo+Aiko
 1ZYNB/9FxFzCRNF+iDY5k3x/oG6PPTzt/25auzNnsOdSoE1xl6i8/Qnh7Hl75u6errHSlZpxGbB
 oM4eGX6EtgPnmAaSZ9s3LJVVqlbfcAReeROmsCsj+hTKzqPXjGGUcBvI7qNwKofwboEVeio41mq
 b3KosmzwVimHRLLhcOFY8pDfpOEfxFStHsKV0oPwvik6Y5nPyVk/SPLkfb0n+VRq7U0CP10J0vI
 OyrHpIub6YnqAflemjwFcvZlYGFYIKrfcsFtAk31/vBa0ReODDBGfrtql+qET534jORib6LfVBW
 2PwH1rKFRXzSIpDAlplszldE3+/qTAS27MH0mPLS3TZ2/I47
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


