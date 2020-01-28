Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB70514C278
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 23:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgA1WAr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 17:00:47 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:64157 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726266AbgA1WAj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 17:00:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580248838; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=rPF4tzcAbLZfGSsXc5G7KlwoPGCscl2Op3tDfOKNtgY=; b=Nu10UYG6m9jEJfKvrBYi3zo5CE+Ru1fIFbEP92FmzoISL8TNJmhXOcZzo+dGT84QnSQlAwvO
 1u3z9RU0uNJnQ7AW/ahxTxgBG3YWs1q86PQrHeZy9j0TtCghS0H7eTlrnSV1r/v3pBAlmD5w
 YI/N2FV4rugEQ85JtPCpEVXzpfs=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e30af05.7f7ee9a0d180-smtp-out-n03;
 Tue, 28 Jan 2020 22:00:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0A161C447A2; Tue, 28 Jan 2020 22:00:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A5EE8C447A4;
        Tue, 28 Jan 2020 22:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A5EE8C447A4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     iommu@lists.linux-foundation.org
Cc:     robin.murphy@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v5 2/5] iommu/arm-smmu: Add support for TTBR1
Date:   Tue, 28 Jan 2020 15:00:16 -0700
Message-Id: <1580248819-12644-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580248819-12644-1-git-send-email-jcrouse@codeaurora.org>
References: <1580248819-12644-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to enable TTBR1 if the domain requests it via the
DOMAIN_ATTR_SPLIT_TABLES attribute. If enabled by the hardware
and pagetable configuration the driver will configure the TTBR1 region
and program the domain pagetable on TTBR1. TTBR0 will be disabled.

After attaching the device the value of he domain attribute can
be queried to see if the split pagetables were successfully programmed.
The domain geometry will be updated as well so that the caller can
determine the active region for the pagetable that was programmed.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu.c | 48 +++++++++++++++++++++++++++++++++++++++++-------
 drivers/iommu/arm-smmu.h | 22 ++++++++++++++++------
 2 files changed, 57 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 16c4b87..23b22fa 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -557,11 +557,17 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
 			cb->ttbr[0] = pgtbl_cfg->arm_v7s_cfg.ttbr;
 			cb->ttbr[1] = 0;
 		} else {
-			cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
-			cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID,
-						  cfg->asid);
-			cb->ttbr[1] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
-						 cfg->asid);
+			if (pgtbl_cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
+				cb->ttbr[0] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
+							 cfg->asid);
+				cb->ttbr[1] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
+			} else {
+				cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
+				cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID,
+							  cfg->asid);
+				cb->ttbr[1] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
+							 cfg->asid);
+			}
 		}
 	} else {
 		cb->ttbr[0] = pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
@@ -675,6 +681,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	enum io_pgtable_fmt fmt;
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	unsigned long quirks = 0;
 
 	mutex_lock(&smmu_domain->init_mutex);
 	if (smmu_domain->smmu)
@@ -743,6 +750,14 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		oas = smmu->ipa_size;
 		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64) {
 			fmt = ARM_64_LPAE_S1;
+
+			/*
+			 * We are assuming that split pagetables will always use
+			 * SEP_UPSTREAM so we don't need to reduce the size of
+			 * the ias to account for the sign extension bit
+			 */
+			if (smmu_domain->split_pagetables)
+				quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
 		} else if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
 			fmt = ARM_32_LPAE_S1;
 			ias = min(ias, 32UL);
@@ -812,6 +827,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENT_WALK,
 		.tlb		= smmu_domain->flush_ops,
 		.iommu_dev	= smmu->dev,
+		.quirks		= quirks,
 	};
 
 	if (smmu_domain->non_strict)
@@ -825,8 +841,15 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 
 	/* Update the domain's page sizes to reflect the page table format */
 	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
-	domain->geometry.aperture_end = (1UL << ias) - 1;
-	domain->geometry.force_aperture = true;
+
+	if (pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
+		domain->geometry.aperture_start = ~0UL << ias;
+		domain->geometry.aperture_end = ~0UL;
+	} else {
+		domain->geometry.aperture_end = (1UL << ias) - 1;
+		domain->geometry.force_aperture = true;
+		smmu_domain->split_pagetables = false;
+	}
 
 	/* Initialise the context bank with our page table cfg */
 	arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
@@ -1523,6 +1546,9 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
 		case DOMAIN_ATTR_NESTING:
 			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
 			return 0;
+		case DOMAIN_ATTR_SPLIT_TABLES:
+			*(int *)data = smmu_domain->split_pagetables;
+			return 0;
 		default:
 			return -ENODEV;
 		}
@@ -1563,6 +1589,14 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
 			else
 				smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
 			break;
+		case DOMAIN_ATTR_SPLIT_TABLES:
+			if (smmu_domain->smmu) {
+				ret = -EPERM;
+				goto out_unlock;
+			}
+			if (*(int *)data)
+				smmu_domain->split_pagetables = true;
+			break;
 		default:
 			ret = -ENODEV;
 		}
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index 8d1cd54..53053fd 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -172,6 +172,7 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_TCR_SH0		GENMASK(13, 12)
 #define ARM_SMMU_TCR_ORGN0		GENMASK(11, 10)
 #define ARM_SMMU_TCR_IRGN0		GENMASK(9, 8)
+#define ARM_SMMU_TCR_EPD0		BIT(7)
 #define ARM_SMMU_TCR_T0SZ		GENMASK(5, 0)
 
 #define ARM_SMMU_VTCR_RES1		BIT(31)
@@ -343,16 +344,25 @@ struct arm_smmu_domain {
 	struct mutex			init_mutex; /* Protects smmu pointer */
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
 	struct iommu_domain		domain;
+	bool				split_pagetables;
 };
 
 static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
 {
-	return ARM_SMMU_TCR_EPD1 |
-	       FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
-	       FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
-	       FIELD_PREP(ARM_SMMU_TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
-	       FIELD_PREP(ARM_SMMU_TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
-	       FIELD_PREP(ARM_SMMU_TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
+	u32 tcr = FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
+		FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
+		FIELD_PREP(ARM_SMMU_TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
+		FIELD_PREP(ARM_SMMU_TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
+		FIELD_PREP(ARM_SMMU_TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
+
+       /*
+	* When TTBR1 is selected shift the TCR fields by 16 bits and disable
+	* translation in TTBR0
+	*/
+	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
+		return (tcr << 16) | ARM_SMMU_TCR_EPD0;
+
+	return tcr | ARM_SMMU_TCR_EPD1;
 }
 
 static inline u32 arm_smmu_lpae_tcr2(struct io_pgtable_cfg *cfg)
-- 
2.7.4
