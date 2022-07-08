Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7BD356B5E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 11:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbiGHJnX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 05:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbiGHJnW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 05:43:22 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9047392C;
        Fri,  8 Jul 2022 02:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657273401; x=1688809401;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yBK5GWCsgiIXvB+3BzYGcbqkwPShj6xaSSqcgTVRmws=;
  b=QN1gEL87sN5EYNiTYFNWgumHxIL1A+uWxNanVVTwgaRyFCToShM2CpiY
   NpkM1qDCkBmFPy11bxpG97o56mWWfsBLs5oihyjDPYt4q4KVAkRCHFgR0
   gXDb64o1FUsqWErE3shhRyfRF78mJG9IZLUWu+EqO7BJYnwx+rDC26SH8
   E=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 08 Jul 2022 02:43:21 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 02:42:50 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 8 Jul 2022 02:42:50 -0700
Received: from blr-ubuntu-253.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 8 Jul 2022 02:42:46 -0700
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel" <joro@8bytes.org>
CC:     <iommu@lists.linux-foundation.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Subject: [PATCHv3] iommu/arm-smmu-qcom: Add debug support for TLB sync timeouts
Date:   Fri, 8 Jul 2022 15:12:30 +0530
Message-ID: <20220708094230.4349-1-quic_saipraka@quicinc.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

TLB sync timeouts can be due to various reasons such as TBU power down
or pending TCU/TBU invalidation/sync and so on. Debugging these often
require dumping of some implementation defined registers to know the
status of TBU/TCU operations and some of these registers are not
accessible in non-secure world such as from kernel and requires SMC
calls to read them in the secure world. So, add this debug support
to dump implementation defined registers for TLB sync timeout issues.

Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
---

Changes in v3:
 * Move this debug feature to arm-smmu-qcom-debug.c (Will Deacon).
 * Keep single ratelimit state and remove local variable (Robin).

Changes in v2:
 * Use scm call consistently so that it works on older chipsets where
   some of these regs are secure registers.
 * Add device specific data to get the implementation defined register
   offsets.

---
 drivers/iommu/Kconfig                         |  10 ++
 drivers/iommu/arm/arm-smmu/Makefile           |   1 +
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 142 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    |  32 +++-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    |  28 ++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |   6 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.h         |   1 +
 7 files changed, 211 insertions(+), 9 deletions(-)
 create mode 100644 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
 create mode 100644 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index c79a0df090c0..5c5cb5bee8b6 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -363,6 +363,16 @@ config ARM_SMMU_QCOM
 	  When running on a Qualcomm platform that has the custom variant
 	  of the ARM SMMU, this needs to be built into the SMMU driver.
 
+config ARM_SMMU_QCOM_DEBUG
+	bool "ARM SMMU QCOM implementation defined debug support"
+	depends on ARM_SMMU_QCOM
+	help
+	  Support for implementation specific debug features in ARM SMMU
+	  hardware found in QTI platforms.
+
+	  Say Y here to enable debug for issues such as TLB sync timeouts
+	  which requires implementation defined register dumps.
+
 config ARM_SMMU_V3
 	tristate "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
 	depends on ARM64
diff --git a/drivers/iommu/arm/arm-smmu/Makefile b/drivers/iommu/arm/arm-smmu/Makefile
index b0cc01aa20c9..2a5a95e8e3f9 100644
--- a/drivers/iommu/arm/arm-smmu/Makefile
+++ b/drivers/iommu/arm/arm-smmu/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_QCOM_IOMMU) += qcom_iommu.o
 obj-$(CONFIG_ARM_SMMU) += arm_smmu.o
 arm_smmu-objs += arm-smmu.o arm-smmu-impl.o arm-smmu-nvidia.o
 arm_smmu-$(CONFIG_ARM_SMMU_QCOM) += arm-smmu-qcom.o
+arm_smmu-$(CONFIG_ARM_SMMU_QCOM_DEBUG) += arm-smmu-qcom-debug.o
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
new file mode 100644
index 000000000000..6eed8e67a0ca
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/of_device.h>
+#include <linux/qcom_scm.h>
+#include <linux/ratelimit.h>
+
+#include "arm-smmu.h"
+#include "arm-smmu-qcom.h"
+
+enum qcom_smmu_impl_reg_offset {
+	QCOM_SMMU_TBU_PWR_STATUS,
+	QCOM_SMMU_STATS_SYNC_INV_TBU_ACK,
+	QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR,
+};
+
+struct qcom_smmu_config {
+	const u32 *reg_offset;
+};
+
+void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu)
+{
+	int ret;
+	u32 tbu_pwr_status, sync_inv_ack, sync_inv_progress;
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	const struct qcom_smmu_config *cfg;
+	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
+				      DEFAULT_RATELIMIT_BURST);
+
+	if (__ratelimit(&rs)) {
+		dev_err(smmu->dev, "TLB sync timed out -- SMMU may be deadlocked\n");
+
+		cfg = qsmmu->cfg;
+		if (!cfg)
+			return;
+
+		ret = qcom_scm_io_readl(smmu->ioaddr + cfg->reg_offset[QCOM_SMMU_TBU_PWR_STATUS],
+					&tbu_pwr_status);
+		if (ret)
+			dev_err(smmu->dev,
+				"Failed to read TBU power status: %d\n", ret);
+
+		ret = qcom_scm_io_readl(smmu->ioaddr + cfg->reg_offset[QCOM_SMMU_STATS_SYNC_INV_TBU_ACK],
+					&sync_inv_ack);
+		if (ret)
+			dev_err(smmu->dev,
+				"Failed to read TBU sync/inv ack status: %d\n", ret);
+
+		ret = qcom_scm_io_readl(smmu->ioaddr + cfg->reg_offset[QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR],
+					&sync_inv_progress);
+		if (ret)
+			dev_err(smmu->dev,
+				"Failed to read TCU syn/inv progress: %d\n", ret);
+
+		dev_err(smmu->dev,
+			"TBU: power_status %#x sync_inv_ack %#x sync_inv_progress %#x\n",
+			tbu_pwr_status, sync_inv_ack, sync_inv_progress);
+	}
+}
+
+/* Implementation Defined Register Space 0 register offsets */
+static const u32 qcom_smmu_impl0_reg_offset[] = {
+	[QCOM_SMMU_TBU_PWR_STATUS]		= 0x2204,
+	[QCOM_SMMU_STATS_SYNC_INV_TBU_ACK]	= 0x25dc,
+	[QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR]	= 0x2670,
+};
+
+static const struct qcom_smmu_config qcm2290_smmu_cfg = {
+	.reg_offset = qcom_smmu_impl0_reg_offset,
+};
+
+static const struct qcom_smmu_config sc7180_smmu_cfg = {
+	.reg_offset = qcom_smmu_impl0_reg_offset,
+};
+
+static const struct qcom_smmu_config sc7280_smmu_cfg = {
+	.reg_offset = qcom_smmu_impl0_reg_offset,
+};
+
+static const struct qcom_smmu_config sc8180x_smmu_cfg = {
+	.reg_offset = qcom_smmu_impl0_reg_offset,
+};
+
+static const struct qcom_smmu_config sc8280xp_smmu_cfg = {
+	.reg_offset = qcom_smmu_impl0_reg_offset,
+};
+
+static const struct qcom_smmu_config sm6125_smmu_cfg = {
+	.reg_offset = qcom_smmu_impl0_reg_offset,
+};
+
+static const struct qcom_smmu_config sm6350_smmu_cfg = {
+	.reg_offset = qcom_smmu_impl0_reg_offset,
+};
+
+static const struct qcom_smmu_config sm8150_smmu_cfg = {
+	.reg_offset = qcom_smmu_impl0_reg_offset,
+};
+
+static const struct qcom_smmu_config sm8250_smmu_cfg = {
+	.reg_offset = qcom_smmu_impl0_reg_offset,
+};
+
+static const struct qcom_smmu_config sm8350_smmu_cfg = {
+	.reg_offset = qcom_smmu_impl0_reg_offset,
+};
+
+static const struct qcom_smmu_config sm8450_smmu_cfg = {
+	.reg_offset = qcom_smmu_impl0_reg_offset,
+};
+
+static const struct of_device_id __maybe_unused qcom_smmu_impl_debug_match[] = {
+	{ .compatible = "qcom,msm8998-smmu-v2" },
+	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcm2290_smmu_cfg },
+	{ .compatible = "qcom,sc7180-smmu-500", .data = &sc7180_smmu_cfg },
+	{ .compatible = "qcom,sc7280-smmu-500", .data = &sc7280_smmu_cfg},
+	{ .compatible = "qcom,sc8180x-smmu-500", .data = &sc8180x_smmu_cfg },
+	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &sc8280xp_smmu_cfg },
+	{ .compatible = "qcom,sdm630-smmu-v2" },
+	{ .compatible = "qcom,sdm845-smmu-500" },
+	{ .compatible = "qcom,sm6125-smmu-500", .data = &sm6125_smmu_cfg},
+	{ .compatible = "qcom,sm6350-smmu-500", .data = &sm6350_smmu_cfg},
+	{ .compatible = "qcom,sm8150-smmu-500", .data = &sm8150_smmu_cfg },
+	{ .compatible = "qcom,sm8250-smmu-500", .data = &sm8250_smmu_cfg },
+	{ .compatible = "qcom,sm8350-smmu-500", .data = &sm8350_smmu_cfg },
+	{ .compatible = "qcom,sm8450-smmu-500", .data = &sm8450_smmu_cfg },
+	{ }
+};
+
+const void *qcom_smmu_impl_data(struct arm_smmu_device *smmu)
+{
+	const struct of_device_id *match;
+	const struct device_node *np = smmu->dev->of_node;
+
+	match = of_match_node(qcom_smmu_impl_debug_match, np);
+	if (!match)
+		return NULL;
+
+	return match->data;
+}
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 2d470d867887..de25071e33ab 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -5,23 +5,40 @@
 
 #include <linux/acpi.h>
 #include <linux/adreno-smmu-priv.h>
+#include <linux/delay.h>
 #include <linux/of_device.h>
 #include <linux/qcom_scm.h>
 
 #include "arm-smmu.h"
+#include "arm-smmu-qcom.h"
 
-struct qcom_smmu {
-	struct arm_smmu_device smmu;
-	bool bypass_quirk;
-	u8 bypass_cbndx;
-	u32 stall_enabled;
-};
+#define QCOM_DUMMY_VAL	-1
 
 static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
 {
 	return container_of(smmu, struct qcom_smmu, smmu);
 }
 
+static void qcom_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
+				int sync, int status)
+{
+	unsigned int spin_cnt, delay;
+	u32 reg;
+
+	arm_smmu_writel(smmu, page, sync, QCOM_DUMMY_VAL);
+	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
+		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
+			reg = arm_smmu_readl(smmu, page, status);
+			if (!(reg & ARM_SMMU_sTLBGSTATUS_GSACTIVE))
+				return;
+			cpu_relax();
+		}
+		udelay(delay);
+	}
+
+	qcom_smmu_tlb_sync_debug(smmu);
+}
+
 static void qcom_adreno_smmu_write_sctlr(struct arm_smmu_device *smmu, int idx,
 		u32 reg)
 {
@@ -375,6 +392,7 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.reset = qcom_smmu500_reset,
 	.write_s2cr = qcom_smmu_write_s2cr,
+	.tlb_sync = qcom_smmu_tlb_sync,
 };
 
 static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
@@ -383,6 +401,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
 	.reset = qcom_smmu500_reset,
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
+	.tlb_sync = qcom_smmu_tlb_sync,
 };
 
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
@@ -399,6 +418,7 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 		return ERR_PTR(-ENOMEM);
 
 	qsmmu->smmu.impl = impl;
+	qsmmu->cfg = qcom_smmu_impl_data(smmu);
 
 	return &qsmmu->smmu;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
new file mode 100644
index 000000000000..99ec8f8629a0
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _ARM_SMMU_QCOM_H
+#define _ARM_SMMU_QCOM_H
+
+struct qcom_smmu {
+	struct arm_smmu_device smmu;
+	const struct qcom_smmu_config *cfg;
+	bool bypass_quirk;
+	u8 bypass_cbndx;
+	u32 stall_enabled;
+};
+
+#ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
+void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu);
+const void *qcom_smmu_impl_data(struct arm_smmu_device *smmu);
+#else
+static inline void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu) { }
+static inline const void *qcom_smmu_impl_data(struct arm_smmu_device *smmu)
+{
+	return NULL;
+}
+#endif
+
+#endif /* _ARM_SMMU_QCOM_H */
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 2ed3594f384e..41633e5484f8 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -2074,7 +2074,6 @@ err_reset_platform_ops: __maybe_unused;
 static int arm_smmu_device_probe(struct platform_device *pdev)
 {
 	struct resource *res;
-	resource_size_t ioaddr;
 	struct arm_smmu_device *smmu;
 	struct device *dev = &pdev->dev;
 	int num_irqs, i, err;
@@ -2098,7 +2097,8 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	smmu->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(smmu->base))
 		return PTR_ERR(smmu->base);
-	ioaddr = res->start;
+	smmu->ioaddr = res->start;
+
 	/*
 	 * The resource size should effectively match the value of SMMU_TOP;
 	 * stash that temporarily until we know PAGESIZE to validate it with.
@@ -2178,7 +2178,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	}
 
 	err = iommu_device_sysfs_add(&smmu->iommu, smmu->dev, NULL,
-				     "smmu.%pa", &ioaddr);
+				     "smmu.%pa", &smmu->ioaddr);
 	if (err) {
 		dev_err(dev, "Failed to register iommu in sysfs\n");
 		return err;
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 2b9b42fb6f30..703fd5817ec1 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -278,6 +278,7 @@ struct arm_smmu_device {
 	struct device			*dev;
 
 	void __iomem			*base;
+	phys_addr_t			ioaddr;
 	unsigned int			numpage;
 	unsigned int			pgshift;
 
-- 
2.33.1

