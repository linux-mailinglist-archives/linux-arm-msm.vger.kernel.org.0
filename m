Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFEEA120FBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 17:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfLPQiI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 11:38:08 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:43435 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726470AbfLPQiH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 11:38:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576514286; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=QmJULzMurJQncjBTq2ifW5g5GxeBV/UAkCu4tXumItA=; b=IrfJf0ps8i/OGqUuhEbmFb1hoNAU5EDQ80TeZaf8qGXpyTNc2ZnzzVSntm1tMO+8FQlczNZD
 EfaYtWlg1QzA6fl3PuQzULVML1RgR9O0hqu2b2iaTxKI/43aBjzrLp7ukaZ/hPdg+MNXuv/h
 TXt7QxX6DJ+zpLhOBvK8L+coOwM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df7b2eb.7f9d85de00d8-smtp-out-n03;
 Mon, 16 Dec 2019 16:38:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DAD7CC447BA; Mon, 16 Dec 2019 16:38:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 76C5DC447A2;
        Mon, 16 Dec 2019 16:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 76C5DC447A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     iommu@lists.linux-foundation.org
Cc:     robin.murphy@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v3 2/5] iommu/arm-smmu: Add support for split pagetables
Date:   Mon, 16 Dec 2019 09:37:48 -0700
Message-Id: <1576514271-15687-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576514271-15687-1-git-send-email-jcrouse@codeaurora.org>
References: <1576514271-15687-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to enable split pagetables (TTBR1) if the supporting driver
requests it via the DOMAIN_ATTR_SPLIT_TABLES flag. When enabled, the driver
will set up the TTBR0 and TTBR1 regions and program the default domain
pagetable on TTBR1.

After attaching the device, the value of he domain attribute can
be queried to see if the split pagetables were successfully programmed.
Furthermore the domain geometry will be updated so that the caller can
determine the active region for the pagetable that was programmed.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu.c | 40 +++++++++++++++++++++++++++++++++++-----
 drivers/iommu/arm-smmu.h | 45 +++++++++++++++++++++++++++++++++++++++------
 2 files changed, 74 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index c106406..7b59116 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -538,9 +538,17 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
 			cb->ttbr[0] = pgtbl_cfg->arm_v7s_cfg.ttbr;
 			cb->ttbr[1] = 0;
 		} else {
-			cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
-			cb->ttbr[0] |= FIELD_PREP(TTBRn_ASID, cfg->asid);
-			cb->ttbr[1] = FIELD_PREP(TTBRn_ASID, cfg->asid);
+			if (pgtbl_cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
+				cb->ttbr[0] = FIELD_PREP(TTBRn_ASID, cfg->asid);
+				cb->ttbr[1] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
+				cb->ttbr[1] |=
+					FIELD_PREP(TTBRn_ASID, cfg->asid);
+			} else {
+				cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
+				cb->ttbr[0] |=
+					FIELD_PREP(TTBRn_ASID, cfg->asid);
+				cb->ttbr[1] = FIELD_PREP(TTBRn_ASID, cfg->asid);
+			}
 		}
 	} else {
 		cb->ttbr[0] = pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
@@ -651,6 +659,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	enum io_pgtable_fmt fmt;
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	u32 quirks = 0;
 
 	mutex_lock(&smmu_domain->init_mutex);
 	if (smmu_domain->smmu)
@@ -719,6 +728,8 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		oas = smmu->ipa_size;
 		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64) {
 			fmt = ARM_64_LPAE_S1;
+			if (smmu_domain->split_pagetables)
+				quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
 		} else if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
 			fmt = ARM_32_LPAE_S1;
 			ias = min(ias, 32UL);
@@ -788,6 +799,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENT_WALK,
 		.tlb		= smmu_domain->flush_ops,
 		.iommu_dev	= smmu->dev,
+		.quirks		= quirks,
 	};
 
 	if (smmu_domain->non_strict)
@@ -801,8 +813,15 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 
 	/* Update the domain's page sizes to reflect the page table format */
 	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
-	domain->geometry.aperture_end = (1UL << ias) - 1;
-	domain->geometry.force_aperture = true;
+
+	if (pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
+		domain->geometry.aperture_start = ~((1ULL << ias) - 1);
+		domain->geometry.aperture_end = ~0UL;
+	} else {
+		domain->geometry.aperture_end = (1UL << ias) - 1;
+		domain->geometry.force_aperture = true;
+		smmu_domain->split_pagetables = false;
+	}
 
 	/* Initialise the context bank with our page table cfg */
 	arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
@@ -1484,6 +1503,9 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
 		case DOMAIN_ATTR_NESTING:
 			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
 			return 0;
+		case DOMAIN_ATTR_SPLIT_TABLES:
+			*(int *)data = smmu_domain->split_pagetables;
+			return 0;
 		default:
 			return -ENODEV;
 		}
@@ -1524,6 +1546,14 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
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
index afab9de..68526cc 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -177,6 +177,16 @@ enum arm_smmu_cbar_type {
 #define TCR_IRGN0			GENMASK(9, 8)
 #define TCR_T0SZ			GENMASK(5, 0)
 
+#define TCR_TG1				GENMASK(31, 30)
+
+#define TG0_4K				0
+#define TG0_64K				1
+#define TG0_16K				2
+
+#define TG1_16K				1
+#define TG1_4K				2
+#define TG1_64K				3
+
 #define ARM_SMMU_CB_CONTEXTIDR		0x34
 #define ARM_SMMU_CB_S1_MAIR0		0x38
 #define ARM_SMMU_CB_S1_MAIR1		0x3c
@@ -329,16 +339,39 @@ struct arm_smmu_domain {
 	struct mutex			init_mutex; /* Protects smmu pointer */
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
 	struct iommu_domain		domain;
+	bool				split_pagetables;
 };
 
+static inline u32 arm_smmu_lpae_tcr_tg(struct io_pgtable_cfg *cfg)
+{
+	u32 val;
+
+	if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1))
+		return FIELD_PREP(TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg);
+
+	val = FIELD_PREP(TCR_TG1, cfg->arm_lpae_s1_cfg.tcr.tg);
+
+	if (cfg->arm_lpae_s1_cfg.tcr.tg == TG1_4K)
+		val |= FIELD_PREP(TCR_TG0, TG0_4K);
+	else if (cfg->arm_lpae_s1_cfg.tcr.tg == TG1_16K)
+		val |= FIELD_PREP(TCR_TG0, TG0_16K);
+	else
+		val |= FIELD_PREP(TCR_TG0, TG0_64K);
+
+	return val;
+}
+
 static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
 {
-	return TCR_EPD1 |
-	       FIELD_PREP(TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
-	       FIELD_PREP(TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
-	       FIELD_PREP(TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
-	       FIELD_PREP(TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
-	       FIELD_PREP(TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
+	u32 tcr = FIELD_PREP(TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
+		FIELD_PREP(TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
+		FIELD_PREP(TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
+		FIELD_PREP(TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
+
+	if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1))
+		return tcr | TCR_EPD1 | arm_smmu_lpae_tcr_tg(cfg);
+
+	return tcr | (tcr << 16) | arm_smmu_lpae_tcr_tg(cfg);
 }
 
 static inline u32 arm_smmu_lpae_tcr2(struct io_pgtable_cfg *cfg)
-- 
2.7.4
