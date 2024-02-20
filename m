Return-Path: <linux-arm-msm+bounces-11946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B8285CB40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F406C1F22C14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 22:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464771552E3;
	Tue, 20 Feb 2024 22:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KNeC55mJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260EC153BF6
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 22:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708469864; cv=none; b=Xg+UZrlz0VFFT3lVZKDutohpmeKi062Qfjlph+w8MOfbCZmSs6UPXUxGB+Z+nYCKueIcmkJfMkEWJcF82b6Wl1U+IAuCZdyv7nw9E2dnY2x878l9SpVdYeQW9x4HMn48H3iAjvwMn08h4lsolWt1h9yLUZamYf3SBhiqW2pYjW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708469864; c=relaxed/simple;
	bh=znYqH4KKX5PqF5T6XnwgCw2bHRlbEzXsyiPDt8vHcKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b7fJ17/MQPBNpvL4r2bLGVZFCLpCkHXOGGt3ZgV9spH8KtiJiAE3CDcOr3sd2oEUDZEKgG0GBsh1pvEisGtWVsrnvBDvFmzq2pCjKG2OtnhcJO5UMrOxoOMaAOYMMJj+lsbAtsAMtyG3qIe9jlMGH9aBOGrgJVcIQ2hKVQJrOzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KNeC55mJ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d2505352e6so10176371fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 14:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708469860; x=1709074660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AycSOZZElt80+nGkUPVSHZn5jQIyWVlzHRqHfSaFet8=;
        b=KNeC55mJiZhTnbUdQV9vjuVILTxQEQCOYmbMZI6nQZyyrA4+nfeyWeccDpTJcUgu7/
         hzn53DCh5AWu1ZUG8tsfkZ8FZ4FZrbr3d2vyG/DNC3G6en+eo63YgvZYf0ogjPrqdy0o
         3NRDL6+sThRKMPOg7KGiqeTRpc9zclax9W9bMvaCT8iHw9HOMEBGr/z3txIr5qg3lMDs
         kx2o8WdPXSDhpTaLpL6oI3Vchg4fLids6vVcBXAoW7uXP+pzsFcP/xt0MjYCW9egEbdq
         p+/sJ7GqZl9oHBvkUatANgjBU0jagvFpoTOaBoCBLJ2aw/9BohHdWNje+1Xw9hJaX+NT
         D5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708469860; x=1709074660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AycSOZZElt80+nGkUPVSHZn5jQIyWVlzHRqHfSaFet8=;
        b=CF14hEsBpBFND9NpOqmx6/Lmx+4QlYWEWaHdhyxTdhBd17Fm1x9+D6lke5CtzPFf9k
         3WuU+G5VDtnnlB2HS36rlW1rwBptgeKaqD0FM/Lehb8OLFl0XDIUBPjWhJ/FN5Ddd31y
         XYsAHVsJaf6c2d+c07qJnpUTvEkoli65Tr/WpGIr04GWpTJEb6PuGXW1FQUW+xAnlJxj
         GhJHY+gvJAUIfJJuF2CviF8XpCj5oqkptBFWubM66gxLOffLe5McDiBifM8adyRADCwT
         coG5p7iQ/sukGjX/E+ONlP6VT/hKoNljymRMcLDx+8tmaNsAUfouEzyZBZv6iSP7GWnj
         3XPg==
X-Forwarded-Encrypted: i=1; AJvYcCXoFhsyCjI7D6tuoxl0IeBnoiY2jT3KZO/N9xEzGbQD6T3FHGY58lnV3DW9caIdl1zDYHwZcoM8B4yMfcrCMpSAjtz0JKYqV5Y7Nsofaw==
X-Gm-Message-State: AOJu0Yxd+I+hayuAdc2sGTu9ekptqV3QgbtsaTY8bJmlXjypyEupau+K
	LhDjNFfweqErFd5lbvEmkby/tKFfRjb9M8Nhqf37P7MsECXAI3ODExCj5swE0gJFyMHbLdTIiWW
	j
X-Google-Smtp-Source: AGHT+IHBCq0/5GF/mwezuBx5TnS+uOE9hdW//tO0VhHT/8WFv5KmFg6mip6f4whXUgDOaqB6Q/Y5hw==
X-Received: by 2002:a2e:8782:0:b0:2d2:4637:63f with SMTP id n2-20020a2e8782000000b002d24637063fmr2090357lji.45.1708469860050;
        Tue, 20 Feb 2024 14:57:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q8-20020a2e9688000000b002d24de76dffsm277990lji.100.2024.02.20.14.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 14:57:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 00:57:37 +0200
Subject: [PATCH RESEND 2/2] ARM: implement cacheinfo support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-armv7-cacheinfo-v1-2-69dbd7f20d04@linaro.org>
References: <20240221-armv7-cacheinfo-v1-0-69dbd7f20d04@linaro.org>
In-Reply-To: <20240221-armv7-cacheinfo-v1-0-69dbd7f20d04@linaro.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6946;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=znYqH4KKX5PqF5T6XnwgCw2bHRlbEzXsyiPDt8vHcKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl1S5hwYCth0hBera7/JSOcwFboMaVGKIed56og
 /AfC53i4xCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdUuYQAKCRCLPIo+Aiko
 1W96CACrFLlalqgyVcuIrd9YS9M0OUZch03Ifg7KgjMsW/CbExCdMNhz9hKoTBf+heLUA3/5A8Y
 5T6ovlcsLrH1KQ7T+LBahjkFV6Wjsg8qdcFAFtkJeEB084XXnDiZ3/6newjl9QfG4IU9jypKFrC
 /1Ln4wKwqg5RFqKO5l/B7Zu0ggOLKyoHk1MdoLCPVwWkwL6PeAg53rehdv8XQHxfspBZ/tszDic
 kT8Xk1OeOoARYyMuLRAYT5F4oZ7yKlTWZuRbI3MXb6JWYnTHjBPxccNFm9yeD4p5UYihNHjkn3m
 LIRA7DHzOfwTvsbRe5TWGrzuiD/SQ8S3++WcMHDGIVEA/30V
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


