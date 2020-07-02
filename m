Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9DB8212433
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 15:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbgGBNLY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 09:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729062AbgGBNLY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 09:11:24 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E639BC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2020 06:11:23 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k6so28291111wrn.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2020 06:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BukZnM0ZlNw8+pOHsuRc0zPpDuJsnTlOCXDjH0l4tuo=;
        b=pa/wII3u46eMnyolKrno7THgJp8eZvjpLdc7+ZgNRWqPLbqCZ3nNuTwKARbFNBsp6k
         l7em0jaVPzV/fYy/PzrOQ33evzkKpmLRMxY7Zk2HmrBEa8f01f+KVAGEdr9iRtjWI1l5
         e7f3Ya0TDNt9+3dDeoj/jECzkm5zDedPvw61eSigb9kE5ts/h2Jqbc+TezElmoBrIJDI
         BvmzAZRfsmnyCq9xvarfyNuG83cOlFDbZ0ViI9ZDFiwFLwMRcPrcjEu4ilbFva3mxHZm
         yItbLcCFqSipe0K/6vPfoLsIVq2PGQVjfiJsgTAqOswhjJPOO0lPLewspeZ3Y7biyLzb
         lMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BukZnM0ZlNw8+pOHsuRc0zPpDuJsnTlOCXDjH0l4tuo=;
        b=lRoNcwaqBG6a0lloJTBzXz7RDYHzSmewQJ16cYNUmCcui/FwV3Ro1TceKmyFvqreqa
         NV7AfTCz4tS3P+2y48W2oqq/H6W3BUNQ2BEo+HapzjnwEh70D67aT8ql+AwicNznOF+W
         PwfVGmWq3AKACKvV0epwk0gCkZK+f7Sf9NOXF2zgEQUQpSHph9wQLkpQMnbSwOysRPkP
         eWuOUP4K0l+q7zcQxtOkoIKoUEgtjvAoWreiC7mpsqeRcZjO8vohEy8toZU+V1SWa2+8
         zl+K//smmw2ok8YIijGbznAFGw6wLNdAtAHgdPo1377FiWVaOQh+uEFL0Sdz1RYRHHtC
         /aQA==
X-Gm-Message-State: AOAM53365nufzt6EEc8MHyllXd6sEP+3NVjoLr10d/POa7AzDu9+99lV
        aLw9hU14nWQsIzV2F/fLBtotvA==
X-Google-Smtp-Source: ABdhPJyd39ubBHZFpMcuavkizSvJ4tD85woH6OlblGpdUXu31VWNlwfK94GAZAMm7UQPf43IsEIycA==
X-Received: by 2002:a5d:6a90:: with SMTP id s16mr30703907wru.8.1593695482577;
        Thu, 02 Jul 2020 06:11:22 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id 140sm5977248wmb.15.2020.07.02.06.11.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 06:11:22 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, amit.kucheria@linaro.org,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4 1/4] soc: qcom: Separate kryo l2 accessors from PMU driver
Date:   Thu,  2 Jul 2020 15:15:58 +0200
Message-Id: <1593695762-19823-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593695762-19823-1-git-send-email-loic.poulain@linaro.org>
References: <1593695762-19823-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ilia Lin <ilialin@codeaurora.org>

The driver provides kernel level API for other drivers
to access the MSM8996 L2 cache registers.
Separating the L2 access code from the PMU driver and
making it public to allow other drivers use it.
The accesses must be separated with a single spinlock,
maintained in this driver.

Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/perf/Kconfig                 |  1 +
 drivers/perf/qcom_l2_pmu.c           | 90 ++++++++++--------------------------
 drivers/soc/qcom/Kconfig             |  3 ++
 drivers/soc/qcom/Makefile            |  1 +
 drivers/soc/qcom/kryo-l2-accessors.c | 57 +++++++++++++++++++++++
 include/soc/qcom/kryo-l2-accessors.h | 12 +++++
 6 files changed, 98 insertions(+), 66 deletions(-)
 create mode 100644 drivers/soc/qcom/kryo-l2-accessors.c
 create mode 100644 include/soc/qcom/kryo-l2-accessors.h

diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index a9261cf..7305d57 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -82,6 +82,7 @@ config FSL_IMX8_DDR_PMU
 config QCOM_L2_PMU
 	bool "Qualcomm Technologies L2-cache PMU"
 	depends on ARCH_QCOM && ARM64 && ACPI
+	select QCOM_KRYO_L2_ACCESSORS
 	  help
 	  Provides support for the L2 cache performance monitor unit (PMU)
 	  in Qualcomm Technologies processors.
diff --git a/drivers/perf/qcom_l2_pmu.c b/drivers/perf/qcom_l2_pmu.c
index 21d6991..02ca1fa 100644
--- a/drivers/perf/qcom_l2_pmu.c
+++ b/drivers/perf/qcom_l2_pmu.c
@@ -23,6 +23,7 @@
 #include <asm/barrier.h>
 #include <asm/local64.h>
 #include <asm/sysreg.h>
+#include <soc/qcom/kryo-l2-accessors.h>
 
 #define MAX_L2_CTRS             9
 
@@ -79,8 +80,6 @@
 #define L2_COUNTER_RELOAD       BIT_ULL(31)
 #define L2_CYCLE_COUNTER_RELOAD BIT_ULL(63)
 
-#define L2CPUSRSELR_EL1         sys_reg(3, 3, 15, 0, 6)
-#define L2CPUSRDR_EL1           sys_reg(3, 3, 15, 0, 7)
 
 #define reg_idx(reg, i)         (((i) * IA_L2_REG_OFFSET) + reg##_BASE)
 
@@ -99,48 +98,7 @@
 #define L2_EVENT_STREX                     0x421
 #define L2_EVENT_CLREX                     0x422
 
-static DEFINE_RAW_SPINLOCK(l2_access_lock);
 
-/**
- * set_l2_indirect_reg: write value to an L2 register
- * @reg: Address of L2 register.
- * @value: Value to be written to register.
- *
- * Use architecturally required barriers for ordering between system register
- * accesses
- */
-static void set_l2_indirect_reg(u64 reg, u64 val)
-{
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&l2_access_lock, flags);
-	write_sysreg_s(reg, L2CPUSRSELR_EL1);
-	isb();
-	write_sysreg_s(val, L2CPUSRDR_EL1);
-	isb();
-	raw_spin_unlock_irqrestore(&l2_access_lock, flags);
-}
-
-/**
- * get_l2_indirect_reg: read an L2 register value
- * @reg: Address of L2 register.
- *
- * Use architecturally required barriers for ordering between system register
- * accesses
- */
-static u64 get_l2_indirect_reg(u64 reg)
-{
-	u64 val;
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&l2_access_lock, flags);
-	write_sysreg_s(reg, L2CPUSRSELR_EL1);
-	isb();
-	val = read_sysreg_s(L2CPUSRDR_EL1);
-	raw_spin_unlock_irqrestore(&l2_access_lock, flags);
-
-	return val;
-}
 
 struct cluster_pmu;
 
@@ -211,28 +169,28 @@ static inline struct cluster_pmu *get_cluster_pmu(
 static void cluster_pmu_reset(void)
 {
 	/* Reset all counters */
-	set_l2_indirect_reg(L2PMCR, L2PMCR_RESET_ALL);
-	set_l2_indirect_reg(L2PMCNTENCLR, l2_counter_present_mask);
-	set_l2_indirect_reg(L2PMINTENCLR, l2_counter_present_mask);
-	set_l2_indirect_reg(L2PMOVSCLR, l2_counter_present_mask);
+	kryo_l2_set_indirect_reg(L2PMCR, L2PMCR_RESET_ALL);
+	kryo_l2_set_indirect_reg(L2PMCNTENCLR, l2_counter_present_mask);
+	kryo_l2_set_indirect_reg(L2PMINTENCLR, l2_counter_present_mask);
+	kryo_l2_set_indirect_reg(L2PMOVSCLR, l2_counter_present_mask);
 }
 
 static inline void cluster_pmu_enable(void)
 {
-	set_l2_indirect_reg(L2PMCR, L2PMCR_COUNTERS_ENABLE);
+	kryo_l2_set_indirect_reg(L2PMCR, L2PMCR_COUNTERS_ENABLE);
 }
 
 static inline void cluster_pmu_disable(void)
 {
-	set_l2_indirect_reg(L2PMCR, L2PMCR_COUNTERS_DISABLE);
+	kryo_l2_set_indirect_reg(L2PMCR, L2PMCR_COUNTERS_DISABLE);
 }
 
 static inline void cluster_pmu_counter_set_value(u32 idx, u64 value)
 {
 	if (idx == l2_cycle_ctr_idx)
-		set_l2_indirect_reg(L2PMCCNTR, value);
+		kryo_l2_set_indirect_reg(L2PMCCNTR, value);
 	else
-		set_l2_indirect_reg(reg_idx(IA_L2PMXEVCNTR, idx), value);
+		kryo_l2_set_indirect_reg(reg_idx(IA_L2PMXEVCNTR, idx), value);
 }
 
 static inline u64 cluster_pmu_counter_get_value(u32 idx)
@@ -240,46 +198,46 @@ static inline u64 cluster_pmu_counter_get_value(u32 idx)
 	u64 value;
 
 	if (idx == l2_cycle_ctr_idx)
-		value = get_l2_indirect_reg(L2PMCCNTR);
+		value = kryo_l2_get_indirect_reg(L2PMCCNTR);
 	else
-		value = get_l2_indirect_reg(reg_idx(IA_L2PMXEVCNTR, idx));
+		value = kryo_l2_get_indirect_reg(reg_idx(IA_L2PMXEVCNTR, idx));
 
 	return value;
 }
 
 static inline void cluster_pmu_counter_enable(u32 idx)
 {
-	set_l2_indirect_reg(L2PMCNTENSET, idx_to_reg_bit(idx));
+	kryo_l2_set_indirect_reg(L2PMCNTENSET, idx_to_reg_bit(idx));
 }
 
 static inline void cluster_pmu_counter_disable(u32 idx)
 {
-	set_l2_indirect_reg(L2PMCNTENCLR, idx_to_reg_bit(idx));
+	kryo_l2_set_indirect_reg(L2PMCNTENCLR, idx_to_reg_bit(idx));
 }
 
 static inline void cluster_pmu_counter_enable_interrupt(u32 idx)
 {
-	set_l2_indirect_reg(L2PMINTENSET, idx_to_reg_bit(idx));
+	kryo_l2_set_indirect_reg(L2PMINTENSET, idx_to_reg_bit(idx));
 }
 
 static inline void cluster_pmu_counter_disable_interrupt(u32 idx)
 {
-	set_l2_indirect_reg(L2PMINTENCLR, idx_to_reg_bit(idx));
+	kryo_l2_set_indirect_reg(L2PMINTENCLR, idx_to_reg_bit(idx));
 }
 
 static inline void cluster_pmu_set_evccntcr(u32 val)
 {
-	set_l2_indirect_reg(L2PMCCNTCR, val);
+	kryo_l2_set_indirect_reg(L2PMCCNTCR, val);
 }
 
 static inline void cluster_pmu_set_evcntcr(u32 ctr, u32 val)
 {
-	set_l2_indirect_reg(reg_idx(IA_L2PMXEVCNTCR, ctr), val);
+	kryo_l2_set_indirect_reg(reg_idx(IA_L2PMXEVCNTCR, ctr), val);
 }
 
 static inline void cluster_pmu_set_evtyper(u32 ctr, u32 val)
 {
-	set_l2_indirect_reg(reg_idx(IA_L2PMXEVTYPER, ctr), val);
+	kryo_l2_set_indirect_reg(reg_idx(IA_L2PMXEVTYPER, ctr), val);
 }
 
 static void cluster_pmu_set_resr(struct cluster_pmu *cluster,
@@ -295,11 +253,11 @@ static void cluster_pmu_set_resr(struct cluster_pmu *cluster,
 
 	spin_lock_irqsave(&cluster->pmu_lock, flags);
 
-	resr_val = get_l2_indirect_reg(L2PMRESR);
+	resr_val = kryo_l2_get_indirect_reg(L2PMRESR);
 	resr_val &= ~(L2PMRESR_GROUP_MASK << shift);
 	resr_val |= field;
 	resr_val |= L2PMRESR_EN;
-	set_l2_indirect_reg(L2PMRESR, resr_val);
+	kryo_l2_set_indirect_reg(L2PMRESR, resr_val);
 
 	spin_unlock_irqrestore(&cluster->pmu_lock, flags);
 }
@@ -315,14 +273,14 @@ static inline void cluster_pmu_set_evfilter_sys_mode(u32 ctr)
 		   L2PMXEVFILTER_ORGFILTER_IDINDEP |
 		   L2PMXEVFILTER_ORGFILTER_ALL;
 
-	set_l2_indirect_reg(reg_idx(IA_L2PMXEVFILTER, ctr), val);
+	kryo_l2_set_indirect_reg(reg_idx(IA_L2PMXEVFILTER, ctr), val);
 }
 
 static inline u32 cluster_pmu_getreset_ovsr(void)
 {
-	u32 result = get_l2_indirect_reg(L2PMOVSSET);
+	u32 result = kryo_l2_get_indirect_reg(L2PMOVSSET);
 
-	set_l2_indirect_reg(L2PMOVSCLR, result);
+	kryo_l2_set_indirect_reg(L2PMOVSCLR, result);
 	return result;
 }
 
@@ -767,7 +725,7 @@ static int get_num_counters(void)
 {
 	int val;
 
-	val = get_l2_indirect_reg(L2PMCR);
+	val = kryo_l2_get_indirect_reg(L2PMCR);
 
 	/*
 	 * Read number of counters from L2PMCR and add 1
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 07bb261..d0f1edf 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -53,6 +53,9 @@ config QCOM_LLCC
 	  SDM845. This provides interfaces to clients that use the LLCC.
 	  Say yes here to enable LLCC slice driver.
 
+config QCOM_KRYO_L2_ACCESSORS
+       bool
+
 config QCOM_MDT_LOADER
 	tristate
 	select QCOM_SCM
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 7d7e2ec..93392d9 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -24,3 +24,4 @@ obj-$(CONFIG_QCOM_APR) += apr.o
 obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
 obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
 obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
+obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
diff --git a/drivers/soc/qcom/kryo-l2-accessors.c b/drivers/soc/qcom/kryo-l2-accessors.c
new file mode 100644
index 0000000..c20cb92
--- /dev/null
+++ b/drivers/soc/qcom/kryo-l2-accessors.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/spinlock.h>
+#include <asm/barrier.h>
+#include <asm/sysreg.h>
+#include <soc/qcom/kryo-l2-accessors.h>
+
+#define L2CPUSRSELR_EL1         sys_reg(3, 3, 15, 0, 6)
+#define L2CPUSRDR_EL1           sys_reg(3, 3, 15, 0, 7)
+
+static DEFINE_RAW_SPINLOCK(l2_access_lock);
+
+/**
+ * kryo_l2_set_indirect_reg() - write value to an L2 register
+ * @reg: Address of L2 register.
+ * @value: Value to be written to register.
+ *
+ * Use architecturally required barriers for ordering between system register
+ * accesses, and system registers with respect to device memory
+ */
+void kryo_l2_set_indirect_reg(u64 reg, u64 val)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&l2_access_lock, flags);
+	write_sysreg_s(reg, L2CPUSRSELR_EL1);
+	isb();
+	write_sysreg_s(val, L2CPUSRDR_EL1);
+	isb();
+	raw_spin_unlock_irqrestore(&l2_access_lock, flags);
+}
+EXPORT_SYMBOL(kryo_l2_set_indirect_reg);
+
+/**
+ * kryo_l2_get_indirect_reg() - read an L2 register value
+ * @reg: Address of L2 register.
+ *
+ * Use architecturally required barriers for ordering between system register
+ * accesses, and system registers with respect to device memory
+ */
+u64 kryo_l2_get_indirect_reg(u64 reg)
+{
+	u64 val;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&l2_access_lock, flags);
+	write_sysreg_s(reg, L2CPUSRSELR_EL1);
+	isb();
+	val = read_sysreg_s(L2CPUSRDR_EL1);
+	raw_spin_unlock_irqrestore(&l2_access_lock, flags);
+
+	return val;
+}
+EXPORT_SYMBOL(kryo_l2_get_indirect_reg);
diff --git a/include/soc/qcom/kryo-l2-accessors.h b/include/soc/qcom/kryo-l2-accessors.h
new file mode 100644
index 0000000..673c534
--- /dev/null
+++ b/include/soc/qcom/kryo-l2-accessors.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __SOC_ARCH_QCOM_KRYO_L2_ACCESSORS_H
+#define __SOC_ARCH_QCOM_KRYO_L2_ACCESSORS_H
+
+void kryo_l2_set_indirect_reg(u64 reg, u64 val);
+u64 kryo_l2_get_indirect_reg(u64 reg);
+
+#endif
-- 
2.7.4

