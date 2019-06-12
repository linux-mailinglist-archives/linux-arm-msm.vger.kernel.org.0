Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB9141D61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 09:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407713AbfFLHQc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 03:16:32 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45932 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408354AbfFLHQX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 03:16:23 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 46A9660E3F; Wed, 12 Jun 2019 07:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560323781;
        bh=APUZKQMxuCP659BLXKIfQYp8vw7FUPYUW6I8vlsYHKw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WWVUXPnaXnHiulNfWvtH5nOZVLrIh9sMMLqGDIqFgyWrsltehuCCzqfH7I7WKzbeZ
         3GOuyxcWz4yEDdBGNjMu8nFYiDkussE/HKii63G2QzR/Sir+bzYKq8haCh5mnJX7AV
         YqOEQAfax+zUTXDBmd2eESdTrikVW42m7J3B4aDw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-41.ap.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0460A60C5F;
        Wed, 12 Jun 2019 07:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560323780;
        bh=APUZKQMxuCP659BLXKIfQYp8vw7FUPYUW6I8vlsYHKw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pLoy65s9zcPXgJwk2N1Ihcrgoe/s1SQosjj4Wx3VF5Fvg8PL+T4ucJjI+okIXqpPi
         jX8uwElLvruClZwI7ypKsneIgozLty/I81GHv5SodkkFZGg/W3LWqgI3JoU5nzLUvH
         h0Xi3d/4dsICjWPnwUmtWO4Q/N4rEryR3RctCR7U=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0460A60C5F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, will.deacon@arm.com,
        robin.murphy@arm.com, joro@8bytes.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, david.brown@linaro.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH v3 3/4] iommu/arm-smmu: Add support to handle Qcom's wait-for-safe logic
Date:   Wed, 12 Jun 2019 12:45:53 +0530
Message-Id: <20190612071554.13573-4-vivek.gautam@codeaurora.org>
X-Mailer: git-send-email 2.16.1.72.g5be1f00a9a70
In-Reply-To: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

On MTP sdm845 devices, with wait-for-safe logic enabled at the boot time
by the bootloaders we see degraded performance of USB and UFS when kernel
enables the smmu stage-1 translations for these clients.
Turn off this wait-for-safe logic from the kernel gets us back the perf
of USB and UFS devices until we re-visit this when we start seeing perf
issues on display/camera on upstream supported SDM845 platforms.

Now, different bootloaders with their access control policies allow this
register access differently through secure monitor calls -
1) With one we can issue io-read/write secure monitor call (qcom-scm)
   to update the register, while,
2) With other, such as one on MTP sdm845 we should use the specific
   qcom-scm command to send request to do the complete register
   configuration.
Adding a separate device tree flag for arm-smmu to identify which
firmware configuration of the two mentioned above we use.
Not adding code change to allow type-(1) bootloaders to toggle the
safe using io-read/write qcom-scm call.

This change is inspired by the downstream change from Patrick Daly
to address performance issues with display and camera by handling
this wait-for-safe within separte io-pagetable ops to do TLB
maintenance. So a big thanks to him for the change.

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
---
 drivers/iommu/arm-smmu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 0ad086da399c..3c3ad43eda97 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -39,6 +39,7 @@
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/qcom_scm.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
@@ -177,6 +178,7 @@ struct arm_smmu_device {
 	u32				features;
 
 #define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
+#define ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA (1 << 1)
 	u32				options;
 	enum arm_smmu_arch_version	version;
 	enum arm_smmu_implementation	model;
@@ -262,6 +264,7 @@ static bool using_legacy_binding, using_generic_binding;
 
 static struct arm_smmu_option_prop arm_smmu_options[] = {
 	{ ARM_SMMU_OPT_SECURE_CFG_ACCESS, "calxeda,smmu-secure-config-access" },
+	{ ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA, "qcom,smmu-500-fw-impl-safe-errata" },
 	{ 0, NULL},
 };
 
@@ -2292,6 +2295,19 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	arm_smmu_device_reset(smmu);
 	arm_smmu_test_smr_masks(smmu);
 
+	/*
+	 * To address performance degradation in non-real time clients,
+	 * such as USB and UFS, turn off wait-for-safe on sdm845 platforms,
+	 * such as MTP, whose firmwares implement corresponding secure monitor
+	 * call handlers.
+	 */
+	if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-smmu-500") &&
+	    smmu->options & ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA) {
+		err = qcom_scm_qsmmu500_wait_safe_toggle(0);
+		if (err)
+			dev_warn(dev, "Failed to turn off SAFE logic\n");
+	}
+
 	/*
 	 * We want to avoid touching dev->power.lock in fastpaths unless
 	 * it's really going to do something useful - pm_runtime_enabled()
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

