Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 733B4B2FEE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Sep 2019 14:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728707AbfIOMft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Sep 2019 08:35:49 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47586 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728050AbfIOMft (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Sep 2019 08:35:49 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EEAB860A60; Sun, 15 Sep 2019 12:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568550947;
        bh=IsBSEjjIANA8MtWsNeTTbCEPgfYaHQqk7OkfGUFVEBk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Keg7S5znp1h/7yRyBCMTUskaNyiU0aYQGMmLH9MfcBByQzwx0EouW2OqQKIZ+Bbkj
         VO0ThwHXncTA/8HAb5hD/uGLbivoswizM6oX+2CCjwS0Rg/6A4Oa7f1D4pXHvYIgwT
         b8e8svpSH0USRGKWv/XhBrGZmR+4p4jN9A7OMUEU=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 05F0160863;
        Sun, 15 Sep 2019 12:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568550945;
        bh=IsBSEjjIANA8MtWsNeTTbCEPgfYaHQqk7OkfGUFVEBk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TmOF/AfYRAzWqN054FOJjjfh/Nz88xDCYMU1XRpdIQLm1srdNPEuU0T5hRBJoN7ac
         0DwMgut1ouQ8NYMuXvYUFyu8xuIB7zYSMq1piJjPlEEjsvmde4SJlsH7hZQZ29zQHx
         qANG2lHkBGMPJSAJ3krX5xdsOpAyEIx5DUtZh2ls=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 05F0160863
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv5 3/3] iommu: arm-smmu-impl: Add sdm845 implementation hook
Date:   Sun, 15 Sep 2019 18:05:03 +0530
Message-Id: <4ccbaf1f81c2bb2e7846da591fd542ab33f45586.1568549746.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1568549745.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1568549745.git.saiprakash.ranjan@codeaurora.org>
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
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/iommu/Makefile        |  2 +-
 drivers/iommu/arm-smmu-impl.c |  7 +++++--
 drivers/iommu/arm-smmu-qcom.c | 32 ++++++++++++++++++++++++++++++++
 drivers/iommu/arm-smmu-qcom.h | 11 +++++++++++
 drivers/iommu/arm-smmu.h      |  2 ++
 5 files changed, 51 insertions(+), 3 deletions(-)
 create mode 100644 drivers/iommu/arm-smmu-qcom.c
 create mode 100644 drivers/iommu/arm-smmu-qcom.h

diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 7caad48b4bc2..7d66e00a6924 100644
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
index 5c87a38620c4..ad835018f0e2 100644
--- a/drivers/iommu/arm-smmu-impl.c
+++ b/drivers/iommu/arm-smmu-impl.c
@@ -8,7 +8,7 @@
 #include <linux/of.h>
 
 #include "arm-smmu.h"
-
+#include "arm-smmu-qcom.h"
 
 static int arm_smmu_gr0_ns(int offset)
 {
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
+		smmu->impl = &qcom_sdm845_smmu500_impl;
+
 	return smmu;
 }
diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
new file mode 100644
index 000000000000..10e9a5bbae06
--- /dev/null
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/qcom_scm.h>
+
+#include "arm-smmu.h"
+#include "arm-smmu-qcom.h"
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
+const struct arm_smmu_impl qcom_sdm845_smmu500_impl = {
+	.reset = qcom_sdm845_smmu500_reset,
+};
diff --git a/drivers/iommu/arm-smmu-qcom.h b/drivers/iommu/arm-smmu-qcom.h
new file mode 100644
index 000000000000..915f8ea2b616
--- /dev/null
+++ b/drivers/iommu/arm-smmu-qcom.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _ARM_SMMU_QCOM_H
+#define _ARM_SMMU_QCOM_H
+
+extern const struct arm_smmu_impl qcom_sdm845_smmu500_impl;
+
+#endif /* _ARM_SMMU_QCOM_H */
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index b19b6cae9b5e..f74fa3bb149d 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -399,4 +399,6 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
 
 struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
 
+int arm_mmu500_reset(struct arm_smmu_device *smmu);
+
 #endif /* _ARM_SMMU_H */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

