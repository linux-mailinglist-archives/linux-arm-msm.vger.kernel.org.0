Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1613B8C58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 10:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405089AbfITIFF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 04:05:05 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38034 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404981AbfITIFF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 04:05:05 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C3CBD61790; Fri, 20 Sep 2019 08:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568966703;
        bh=4CzGeif8t/cjtVZRJ3lfesll5hUpgFGEnRYtXtVm/gs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QHFNHR5PMYY9LqWX6CTrDeMsWuDbvypvdUUkOL7oOUA2eYh5rnfC2V2YXDlx5V8yu
         H/m1R9lPfp813h4//oUYudleBO36Csrhmn5C3CAw8aFRYJpG0Ic6dIGHvLPGZyECLO
         15CnBClHzppQFrubgj0wli4HetHU8WY0YkCxssV0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DC3176170E;
        Fri, 20 Sep 2019 08:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568966701;
        bh=4CzGeif8t/cjtVZRJ3lfesll5hUpgFGEnRYtXtVm/gs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ScrLv+aRcQsjQXH2nZ7q/OC1X9Rl5/IX/ZSrjmOdod8pbEUY38tTUZ0+WvehWU/dP
         yYfzf3XxS/iKPFuOBKaZDPFfybIvfbb3ePVVzqY85vcrnKhALujWlldAY3q3p/M5M9
         iAjrIKS7QpimMW0L7FKny8urcenS18YdfLaib+MM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DC3176170E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        Stephen Boyd <swboyd@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv7 3/3] iommu: arm-smmu-impl: Add sdm845 implementation hook
Date:   Fri, 20 Sep 2019 13:34:29 +0530
Message-Id: <3ed0de38b57fda1995d0f231cbcec38c16387a2a.1568966170.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568966170.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1568966170.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vivek Gautam <vivek.gautam@codeaurora.org>

Add reset hook for sdm845 based platforms to turn off
the wait-for-safe sequence.

Understanding how wait-for-safe logic affects USB and UFS performance
on MTP845 and DB845 boards:

Qcom's implementation of arm,mmu-500 adds a WAIT-FOR-SAFE logic
to address under-performance issues in real-time clients, such as
Display, and Camera.
On receiving an invalidation requests, the SMMU forwards SAFE request
to these clients and waits for SAFE ack signal from real-time clients.
The SAFE signal from such clients is used to qualify the start of
invalidation.
This logic is controlled by chicken bits, one for each - MDP (display),
IFE0, and IFE1 (camera), that can be accessed only from secure software
on sdm845.

This configuration, however, degrades the performance of non-real time
clients, such as USB, and UFS etc. This happens because, with wait-for-safe
logic enabled the hardware tries to throttle non-real time clients while
waiting for SAFE ack signals from real-time clients.

On mtp845 and db845 devices, with wait-for-safe logic enabled by the
bootloaders we see degraded performance of USB and UFS when kernel
enables the smmu stage-1 translations for these clients.
Turn off this wait-for-safe logic from the kernel gets us back the perf
of USB and UFS devices until we re-visit this when we start seeing perf
issues on display/camera on upstream supported SDM845 platforms.
The bootloaders on these boards implement secure monitor callbacks to
handle a specific command - QCOM_SCM_SVC_SMMU_PROGRAM with which the
logic can be toggled.

There are other boards such as cheza whose bootloaders don't enable this
logic. Such boards don't implement callbacks to handle the specific SCM
call so disabling this logic for such boards will be a no-op.

This change is inspired by the downstream change from Patrick Daly
to address performance issues with display and camera by handling
this wait-for-safe within separte io-pagetable ops to do TLB
maintenance. So a big thanks to him for the change and for all the
offline discussions.

Without this change the UFS reads are pretty slow:
$ time dd if=/dev/sda of=/dev/zero bs=1048576 count=10 conv=sync
10+0 records in
10+0 records out
10485760 bytes (10.0MB) copied, 22.394903 seconds, 457.2KB/s
real    0m 22.39s
user    0m 0.00s
sys     0m 0.01s

With this change they are back to rock!
$ time dd if=/dev/sda of=/dev/zero bs=1048576 count=300 conv=sync
300+0 records in
300+0 records out
314572800 bytes (300.0MB) copied, 1.030541 seconds, 291.1MB/s
real    0m 1.03s
user    0m 0.00s
sys     0m 0.54s

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/iommu/Makefile        |  2 +-
 drivers/iommu/arm-smmu-impl.c |  5 +++-
 drivers/iommu/arm-smmu-qcom.c | 51 +++++++++++++++++++++++++++++++++++
 drivers/iommu/arm-smmu.h      |  3 +++
 4 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 drivers/iommu/arm-smmu-qcom.c

diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 4f405f926e73..86dadd13b2e6 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -13,7 +13,7 @@ obj-$(CONFIG_MSM_IOMMU) += msm_iommu.o
 obj-$(CONFIG_AMD_IOMMU) += amd_iommu.o amd_iommu_init.o amd_iommu_quirks.o
 obj-$(CONFIG_AMD_IOMMU_DEBUGFS) += amd_iommu_debugfs.o
 obj-$(CONFIG_AMD_IOMMU_V2) += amd_iommu_v2.o
-obj-$(CONFIG_ARM_SMMU) += arm-smmu.o arm-smmu-impl.o
+obj-$(CONFIG_ARM_SMMU) += arm-smmu.o arm-smmu-impl.o arm-smmu-qcom.o
 obj-$(CONFIG_ARM_SMMU_V3) += arm-smmu-v3.o
 obj-$(CONFIG_DMAR_TABLE) += dmar.o
 obj-$(CONFIG_INTEL_IOMMU) += intel-iommu.o intel-pasid.o
diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
index 5c87a38620c4..b2fe72a8f019 100644
--- a/drivers/iommu/arm-smmu-impl.c
+++ b/drivers/iommu/arm-smmu-impl.c
@@ -109,7 +109,7 @@ static struct arm_smmu_device *cavium_smmu_impl_init(struct arm_smmu_device *smm
 #define ARM_MMU500_ACR_S2CRB_TLBEN	(1 << 10)
 #define ARM_MMU500_ACR_SMTNMB_TLBEN	(1 << 8)
 
-static int arm_mmu500_reset(struct arm_smmu_device *smmu)
+int arm_mmu500_reset(struct arm_smmu_device *smmu)
 {
 	u32 reg, major;
 	int i;
@@ -170,5 +170,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 				  "calxeda,smmu-secure-config-access"))
 		smmu->impl = &calxeda_impl;
 
+	if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-smmu-500"))
+		return qcom_smmu_impl_init(smmu);
+
 	return smmu;
 }
diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
new file mode 100644
index 000000000000..24c071c1d8b0
--- /dev/null
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/qcom_scm.h>
+
+#include "arm-smmu.h"
+
+struct qcom_smmu {
+	struct arm_smmu_device smmu;
+};
+
+static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
+{
+	int ret;
+
+	arm_mmu500_reset(smmu);
+
+	/*
+	 * To address performance degradation in non-real time clients,
+	 * such as USB and UFS, turn off wait-for-safe on sdm845 based boards,
+	 * such as MTP and db845, whose firmwares implement secure monitor
+	 * call handlers to turn on/off the wait-for-safe logic.
+	 */
+	ret = qcom_scm_qsmmu500_wait_safe_toggle(0);
+	if (ret)
+		dev_warn(smmu->dev, "Failed to turn off SAFE logic\n");
+
+	return ret;
+}
+
+static const struct arm_smmu_impl qcom_smmu_impl = {
+	.reset = qcom_sdm845_smmu500_reset,
+};
+
+struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu;
+
+	qsmmu = devm_kzalloc(smmu->dev, sizeof(*qsmmu), GFP_KERNEL);
+	if (!qsmmu)
+		return ERR_PTR(-ENOMEM);
+
+	qsmmu->smmu = *smmu;
+
+	qsmmu->smmu.impl = &qcom_smmu_impl;
+	devm_kfree(smmu->dev, smmu);
+
+	return &qsmmu->smmu;
+}
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index b19b6cae9b5e..de99a85e140a 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -398,5 +398,8 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
 	arm_smmu_writeq((s), ARM_SMMU_CB((s), (n)), (o), (v))
 
 struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
+struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
+
+int arm_mmu500_reset(struct arm_smmu_device *smmu);
 
 #endif /* _ARM_SMMU_H */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

