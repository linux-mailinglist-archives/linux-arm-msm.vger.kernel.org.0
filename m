Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3F81F7057
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 00:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgFKWhG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 18:37:06 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60372 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726159AbgFKWhG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 18:37:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591915025; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=6xUaMfKJXxXcIBGJIgKiTLhHa7NBz100vUpvyY8Yq5A=; b=Bd6SrStS5oA6q/W0udywvUSn7/afWm6Ex7esWdyqz26g3OhapwkBoq3ZfLbpJvZhVUcdjp3S
 OffUJG0EFxualenCj51AatA9sqDbdgS1YuUtLOukytgbOuW4YXmZdOA4NjQlvZjIPL1popqc
 h2qOzUVQaouDLmhRl/kfOs5sq6g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5ee2b2108fe116ddd99d1178 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Jun 2020 22:37:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 76D68C43391; Thu, 11 Jun 2020 22:37:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B01C4C433C8;
        Thu, 11 Jun 2020 22:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B01C4C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/arm-smmu: Add a init_context_bank implementation hook
Date:   Thu, 11 Jun 2020 16:36:56 -0600
Message-Id: <20200611223656.4724-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new implementation hook to allow the implementation specific code
to tweek the context bank configuration just before it gets written.
The first user will be the Adreno GPU implementation to turn on
SCTLR.HUPCF to ensure that a page fault doesn't terminating pending
transactions. Doing so could hang the GPU if one of the terminated
transactions is a CP read.

This depends on the arm-smmu adreno SMMU implementation [1].

[1] https://patchwork.kernel.org/patch/11600943/

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu-qcom.c | 13 +++++++++++++
 drivers/iommu/arm-smmu.c      | 28 +++++++++++++---------------
 drivers/iommu/arm-smmu.h      | 11 +++++++++++
 3 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
index 6d0ab4865fc7..e5c6345da6fc 100644
--- a/drivers/iommu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -17,6 +17,18 @@ static bool qcom_adreno_smmu_is_gpu_device(struct arm_smmu_domain *smmu_domain)
 	return of_device_is_compatible(smmu_domain->dev.of_node, "qcom,adreno");
 }
 
+static void qcom_adreno_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
+		struct arm_smmu_cb *cb)
+{
+	/*
+	 * On the GPU device we want to process subsequent transactions after a
+	 * fault to keep the GPU from hanging
+	 */
+
+	if (qcom_adreno_smmu_is_gpu_device(smmu_domain))
+		cb->sctlr |= ARM_SMMU_SCTLR_HUPCF;
+}
+
 static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 		struct io_pgtable_cfg *pgtbl_cfg)
 {
@@ -92,6 +104,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
 	.init_context = qcom_adreno_smmu_init_context,
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.reset = qcom_smmu500_reset,
+	.init_context_bank = qcom_adreno_smmu_init_context_bank,
 };
 
 
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index a06cbcaec247..f0f201ece3a0 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -86,13 +86,6 @@ struct arm_smmu_smr {
 	bool				valid;
 };
 
-struct arm_smmu_cb {
-	u64				ttbr[2];
-	u32				tcr[2];
-	u32				mair[2];
-	struct arm_smmu_cfg		*cfg;
-};
-
 struct arm_smmu_master_cfg {
 	struct arm_smmu_device		*smmu;
 	s16				smendx[];
@@ -579,6 +572,18 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
 			cb->mair[1] = pgtbl_cfg->arm_lpae_s1_cfg.mair >> 32;
 		}
 	}
+
+	cb->sctlr = ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE | ARM_SMMU_SCTLR_AFE |
+		ARM_SMMU_SCTLR_TRE | ARM_SMMU_SCTLR_M;
+
+	if (stage1)
+		cb->sctlr |= ARM_SMMU_SCTLR_S1_ASIDPNE;
+	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
+		cb->sctlr |= ARM_SMMU_SCTLR_E;
+
+	/* Give the implementation a chance to adjust the configuration */
+	if (smmu_domain->smmu->impl && smmu_domain->smmu->impl->init_context_bank)
+		smmu_domain->smmu->impl->init_context_bank(smmu_domain, cb);
 }
 
 static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
@@ -657,14 +662,7 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	}
 
 	/* SCTLR */
-	reg = ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE | ARM_SMMU_SCTLR_AFE |
-	      ARM_SMMU_SCTLR_TRE | ARM_SMMU_SCTLR_M;
-	if (stage1)
-		reg |= ARM_SMMU_SCTLR_S1_ASIDPNE;
-	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
-		reg |= ARM_SMMU_SCTLR_E;
-
-	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
+	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, cb->sctlr);
 }
 
 /*
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index 79d441024043..9b539820997b 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -142,6 +142,7 @@ enum arm_smmu_cbar_type {
 
 #define ARM_SMMU_CB_SCTLR		0x0
 #define ARM_SMMU_SCTLR_S1_ASIDPNE	BIT(12)
+#define ARM_SMMU_SCTLR_HUPCF		BIT(8)
 #define ARM_SMMU_SCTLR_CFCFG		BIT(7)
 #define ARM_SMMU_SCTLR_CFIE		BIT(6)
 #define ARM_SMMU_SCTLR_CFRE		BIT(5)
@@ -349,6 +350,14 @@ struct arm_smmu_domain {
 	bool				aux;
 };
 
+struct arm_smmu_cb {
+	u64			ttbr[2];
+	u32			tcr[2];
+	u32			mair[2];
+	u32			sctlr;
+	struct arm_smmu_cfg	*cfg;
+};
+
 static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
 {
 	u32 tcr = FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
@@ -403,6 +412,8 @@ struct arm_smmu_impl {
 	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
 			 int status);
 	int (*def_domain_type)(struct device *dev);
+	void (*init_context_bank)(struct arm_smmu_domain *smmu_domain,
+			struct arm_smmu_cb *cb);
 };
 
 static inline void __iomem *arm_smmu_page(struct arm_smmu_device *smmu, int n)
-- 
2.17.1

