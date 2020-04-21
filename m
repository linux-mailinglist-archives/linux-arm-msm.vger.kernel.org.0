Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4157A1B3112
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 22:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgDUUUe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 16:20:34 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:34256 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726168AbgDUUUe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 16:20:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587500433; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=8Z/altQqTKdjp/pVqayBVEKEPSRCz4KgGRuB1EudGTI=; b=KiH9ar0IVNTlkKca/URMwyPoJ6FltpMDn5miDfvxwVkU/iba5hod3CV+e6efjDKx9631wzFv
 ckZRbBeUZqFrDZmHxpU49IeXpQK1DcpGmvyUZ1VODJIN3gd+wNW0gkUQ0RTgK1j9qqbyvks9
 vYxp7HCum2eVLISrrGMY6Nx5dGc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9f5582.7f4593a22500-smtp-out-n02;
 Tue, 21 Apr 2020 20:20:18 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 69107C44791; Tue, 21 Apr 2020 20:20:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 609F3C432C2;
        Tue, 21 Apr 2020 20:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 609F3C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] iomm/arm-smmu: Add stall implementation hook
Date:   Wed, 22 Apr 2020 01:50:04 +0530
Message-Id: <20200421202004.11686-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add stall implementation hook to enable stalling
faults on QCOM platforms which supports it without
causing any kind of hardware mishaps. Without this
on QCOM platforms, GPU faults can cause unrelated
GPU memory accesses to return zeroes. This has the
unfortunate result of command-stream reads from CP
getting invalid data, causing a cascade of fail.

Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
This has been attempted previously by Rob Clark in 2017, 2018.
Hopefully we can get something concluded in 2020.
 * https://patchwork.kernel.org/patch/9953803/
 * https://patchwork.kernel.org/patch/10618713/
---
 drivers/iommu/arm-smmu-qcom.c | 1 +
 drivers/iommu/arm-smmu.c      | 7 +++++++
 drivers/iommu/arm-smmu.h      | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
index 24c071c1d8b0..a13b229389d4 100644
--- a/drivers/iommu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -32,6 +32,7 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 
 static const struct arm_smmu_impl qcom_smmu_impl = {
 	.reset = qcom_sdm845_smmu500_reset,
+	.stall = true,
 };
 
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index e622f4e33379..16b03fca9966 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -488,6 +488,11 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 			    fsr, iova, fsynr, cbfrsynra, idx);
 
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
+
+	if (smmu->impl && smmu->impl->stall && (fsr & ARM_SMMU_FSR_SS))
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
+				  ARM_SMMU_RESUME_TERMINATE);
+
 	return IRQ_HANDLED;
 }
 
@@ -659,6 +664,8 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 		reg |= ARM_SMMU_SCTLR_S1_ASIDPNE;
 	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
 		reg |= ARM_SMMU_SCTLR_E;
+	if (smmu->impl && smmu->impl->stall)
+		reg |= ARM_SMMU_SCTLR_CFCFG;
 
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
 }
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index 8d1cd54d82a6..d5134e0d5cce 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -386,6 +386,7 @@ struct arm_smmu_impl {
 	int (*init_context)(struct arm_smmu_domain *smmu_domain);
 	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
 			 int status);
+	bool stall;
 };
 
 static inline void __iomem *arm_smmu_page(struct arm_smmu_device *smmu, int n)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
