Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E512AC40A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 19:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgKISrp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 13:47:45 -0500
Received: from z5.mailgun.us ([104.130.96.5]:42814 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729150AbgKISrp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 13:47:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604947664; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=V29NTo7kJIBCYZztU1K8EyLNxF9TfvQF5kp/cG/Cvjo=; b=ZjuZ9omQN0fubJC8pudfLgpcKN69H3WMqO0ABklsem7MUQ+iwjhuwKr/OV1OHIwe32rmGq2J
 05A1uyhp1RTN+1ZEvWHW3fG3hid5z+zOK3O+5b4SVbI7iCdHthz5sLtiQBjmyVYqvv2BD8am
 h3u8U8DjuOsTp5SEoiivtJT3r8M=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fa98ecdc1b74298b78e1d18 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Nov 2020 18:47:41
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0ADEDC433FE; Mon,  9 Nov 2020 18:47:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 23091C433C6;
        Mon,  9 Nov 2020 18:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 23091C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Clark <robdclark@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v19 2/4] iommu/arm-smmu: Add a way for implementations to influence SCTLR
Date:   Mon,  9 Nov 2020 11:47:26 -0700
Message-Id: <20201109184728.2463097-3-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109184728.2463097-1-jcrouse@codeaurora.org>
References: <20201109184728.2463097-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

For the Adreno GPU's SMMU, we want SCTLR.HUPCF set to ensure that
pending translations are not terminated on iova fault.  Otherwise
a terminated CP read could hang the GPU by returning invalid
command-stream data. Add a hook to for the implementation to modify
the sctlr value if it wishes.

Co-developed-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 13 +++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      |  5 ++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index b5384c4d92c8..d0636c803a36 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -20,6 +20,18 @@ static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
 	return container_of(smmu, struct qcom_smmu, smmu);
 }
 
+static void qcom_adreno_smmu_write_sctlr(struct arm_smmu_device *smmu, int idx,
+		u32 reg)
+{
+	/*
+	 * On the GPU device we want to process subsequent transactions after a
+	 * fault to keep the GPU from hanging
+	 */
+	reg |= ARM_SMMU_SCTLR_HUPCF;
+
+	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
+}
+
 #define QCOM_ADRENO_SMMU_GPU_SID 0
 
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
@@ -289,6 +301,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.reset = qcom_smmu500_reset,
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
+	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 };
 
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index bcbacf22331d..0f28a8614da3 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -617,7 +617,10 @@ void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
 		reg |= ARM_SMMU_SCTLR_E;
 
-	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
+	if (smmu->impl && smmu->impl->write_sctlr)
+		smmu->impl->write_sctlr(smmu, idx, reg);
+	else
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
 }
 
 static int arm_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 9a5eb6782918..04288b6fc619 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -144,6 +144,7 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_CB_SCTLR		0x0
 #define ARM_SMMU_SCTLR_S1_ASIDPNE	BIT(12)
 #define ARM_SMMU_SCTLR_CFCFG		BIT(7)
+#define ARM_SMMU_SCTLR_HUPCF		BIT(8)
 #define ARM_SMMU_SCTLR_CFIE		BIT(6)
 #define ARM_SMMU_SCTLR_CFRE		BIT(5)
 #define ARM_SMMU_SCTLR_E		BIT(4)
@@ -437,6 +438,7 @@ struct arm_smmu_impl {
 				  struct arm_smmu_device *smmu,
 				  struct device *dev, int start);
 	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
+	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
 };
 
 #define INVALID_SMENDX			-1
-- 
2.25.1

