Return-Path: <linux-arm-msm+bounces-34343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD7199CC03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 15:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B96451F2398E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 13:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C6A1AB52E;
	Mon, 14 Oct 2024 13:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xq10JHev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE9A1AAE33
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728914132; cv=none; b=fN0vA7Q8RX3dGTBo0Gp9/tjCvbmkoYTKE6Qox7hgggTzq6ZsJofQ6RkOWDoH0Pc1nw9jUCCHLd2vpn/YDLurFIHf/CZ+SJakihbX0DiGhFXuoB4HwKsV85G76PAX/3Z+IjayJ4d2XdxGRoAxNH3/BtHdBrR8ysnHeY20EDSh0po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728914132; c=relaxed/simple;
	bh=HycFsKS2HqCUNgySmxRekC/7rRVA9x2c5Czo/mq9rYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGlv2HzSId2d0pkP4aldsQlBwQO6YtajYXnpvJXwtulvzMJ1MhD6bprZ50+saNYl/l+oQhF7tVNnR78lLo6KwzylQnNoYJ8YfwSE4yNLNuqdSWIydqEpGnz0+IPQBJWQsskQM2L72JQ6kjclIXVP7NLzPhA4ddghHsU2YLlu+MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xq10JHev; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb51f39394so8507291fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 06:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728914129; x=1729518929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=910VNT/3al90WIHFmuvF3u7AO/uPrBTduU56Fw5sYjM=;
        b=Xq10JHev0rxkMj7FPUev0BMF4vgMdM8Ej+kFUKVvOK6CMPL5p/qvtoj9gFC+C7pF9n
         u7XZ3nl5h8rrRv/2IZHxsjh0rfo4G10TCA8hTDpudakuc/3iwWyK9nqykHz/h1mTZJGi
         Tg4yWlu3M2T2KnKGZmiqRgY76ScI0mgMpKgLy07Ug0NOmBNvolE4W4AHsMcYJcvGSrV5
         XUE+IBXvHoYc6H2qDNeLtyTMCHGh9yKI4CkYGGeoS1Rc3wAejyoLKTyOz7wWXQhO7i2g
         2u6GhMXE4yfxM4ifBebAmSs1U02OR086cMJqlLLUZ7KepTJfJ2GM5GWSu8/NVtEzLvZb
         M6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728914129; x=1729518929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=910VNT/3al90WIHFmuvF3u7AO/uPrBTduU56Fw5sYjM=;
        b=ixU0Yy5F83EYXdBknp9HMjtXz4SFhvLA4rW21r++kzk75fhBPOD7ZtlldJa2eWd0st
         dGuko+4Tinl5rBQTuJE6N8wJ1OmKacBOvAvSz7JIxToLOX53klX/czbSyR9y7uPZ/S8M
         pIwiDo5H7TIn3HoRux7akQzkIRamZooxGunT19L7eEQC+1yESzPdlO2xBLYE7ikme05C
         10fXkRv+6n64SfJJVoeOBMU3qk0L5QSpqpTtAn3spWf0uEV8SBgLX0PnWMr/W5X1pNGw
         1UevV46eqn29Q8TVS/EWbIgItfSYiJIQ2HZXF2UPRyEeJ9QjDsgOlIOEvDLG2t3y3RGL
         eudA==
X-Forwarded-Encrypted: i=1; AJvYcCUTVK6mn3oIlWQvomM3iPU55rv4uODoDk4duU8LGg/BNvgG8k6Mz6z9/aY70B1eOmKGRUnjRg3jcZKxdtUl@vger.kernel.org
X-Gm-Message-State: AOJu0YxUKW8ssuuxjY6cVjzp0ZH54NjnBRhLj02rhUp/NMtywPYwDUIA
	dblYbhyIlZqkT8hBgBXwlQrvMdz5Wneer+sPD83hikD5utGEYmPq610NexzufVo=
X-Google-Smtp-Source: AGHT+IEnxC4Uc6qG1GhsLQY8bUBklQuVIxgJUvUZgodJgeel9W3Lcu6LQ8WPbMv9KY6uPfNfevwmBg==
X-Received: by 2002:a05:651c:548:b0:2fa:d345:18b9 with SMTP id 38308e7fff4ca-2fb329b2a01mr53500281fa.38.1728914128643;
        Mon, 14 Oct 2024 06:55:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb438c06f7sm8039641fa.55.2024.10.14.06.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 06:55:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 14 Oct 2024 16:55:21 +0300
Subject: [PATCH v2 2/2] ARM: implement cacheinfo support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-armv7-cacheinfo-v2-2-38ab76d2b7fa@linaro.org>
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
In-Reply-To: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7266;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HycFsKS2HqCUNgySmxRekC/7rRVA9x2c5Czo/mq9rYY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnDSLK4kchsZSCE/y4fGAlwP0OjdcGOvDRJOlBU
 W7ERhDdWgKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZw0iygAKCRCLPIo+Aiko
 1cG9CACIc2ogCdqpBl2gPZOk1bO+V3BvHiJZ7lSdu/hqpl/rvKZxHJgttKgVRf7wsSSiwlA89vt
 DX+xoh/67Ghx0ydqQhg7rDijvg01PcPD2/zacJg1oGIDED72T2FjIxQS/Lf2oC7dm13XWXBE0Yg
 Y5mhG3fGdTjP9FTNnyflLSEi7NjBstDYBBmxW7J/s2KPmHOljagK4iusbEijSOXelU7s+W3rTCi
 1/dgQVIa492pyLJ+nzho4G3DoLRz4mR6XsZ9rPdEGGu4XmtW5SuU+xo8ry4HdwCF2rkaSvfcTMN
 ZbPQWEcaQRK17xfHjXywIZMiGX4IMhyMTDYyXG+6Xczck+EK
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
 arch/arm/kernel/cacheinfo.c  | 173 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/cacheinfo.h    |   2 +-
 5 files changed, 182 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 749179a1d162..e790543c3eaf 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -5,6 +5,7 @@ config ARM
 	select ARCH_32BIT_OFF_T
 	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE if HAVE_KRETPROBES && FRAME_POINTER && !ARM_UNWIND
 	select ARCH_HAS_BINFMT_FLAT
+	select ARCH_HAS_CACHE_LINE_SIZE if OF
 	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
 	select ARCH_HAS_CURRENT_STACK_POINTER
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
index aaae31b8c4a5..b3333d070390 100644
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
index 000000000000..a8eabcaa18d8
--- /dev/null
+++ b/arch/arm/kernel/cacheinfo.c
@@ -0,0 +1,173 @@
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
+#define CTR_FORMAT_ARMV6 0
+#define CTR_FORMAT_ARMV7 4
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
+	if (format == CTR_FORMAT_ARMV7) {
+		u32 cwg = FIELD_GET(CTR_CWG_MASK, ctr);
+
+		return cwg ? 4 << cwg : ARCH_DMA_MINALIGN;
+	} else if (WARN_ON_ONCE(format != CTR_FORMAT_ARMV6)) {
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
+	u32 ctr, format;
+
+	/* CLIDR is not present before ARMv7/v7m */
+	if (cpu_architecture() < CPU_ARCH_ARMv7)
+		return -EOPNOTSUPP;
+
+	/* Don't try reading CLIDR if CTR declares old format */
+	ctr = read_cpuid_cachetype();
+	format = FIELD_GET(CTR_FORMAT_MASK, ctr);
+	if (format != CTR_FORMAT_ARMV7)
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
index 108060612bb8..1e7061549fc7 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -147,7 +147,7 @@ static inline int get_cpu_cacheinfo_id(int cpu, int level)
 	return ci ? ci->id : -1;
 }
 
-#ifdef CONFIG_ARM64
+#if defined(CONFIG_ARM64) || defined(CONFIG_ARM)
 #define use_arch_cache_info()	(true)
 #else
 #define use_arch_cache_info()	(false)

-- 
2.39.5


