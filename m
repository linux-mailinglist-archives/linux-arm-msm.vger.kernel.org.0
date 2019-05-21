Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38D4E25535
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 18:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729056AbfEUQOk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 12:14:40 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59678 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728987AbfEUQOj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 12:14:39 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3B635614DC; Tue, 21 May 2019 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455278;
        bh=zK9RPyifG7tYABiCXCNew7jEdoS+xD1s/QJqmXUeVFQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hlIkThLtLK17Myw+43hI2grOE/e2WCSvuuqFGxTDYh/NhH89kLgixi14Qo3DKEwym
         NXWK8Ai99Z0YS/+c+VrkyPKkEP8cfljN+CLqvKYm6IVCuKRyAS8RNcaz1CZ535Oelk
         AeUVFTFv2L8DcgGX3S9VoZp+4jDzTQgYibrBPSSA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72CBE611FD;
        Tue, 21 May 2019 16:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455254;
        bh=zK9RPyifG7tYABiCXCNew7jEdoS+xD1s/QJqmXUeVFQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mXMnu7s7OS2yYC7kXkaX4OfK91tM8UiixaXldIlpG2jWomtp9uFSzql42VFarFd2V
         gta1zUYRoOFrjISUnygdOxpoSdgGVNLxTd86kNPXO5yZXQIzPcVICk175T+hUZM1tt
         PNN8fEhHYtuYfU5TlW+MJXxUAIV7YysLb7ZFr6ts=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 72CBE611FD
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 03/15] iommu/arm-smmu: Add split pagetable support for arm-smmu-v2
Date:   Tue, 21 May 2019 10:13:51 -0600
Message-Id: <1558455243-32746-4-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
References: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for a split pagetable (TTBR0/TTBR1) scheme for arm-smmu-v2.
If split pagetables are enabled, create a pagetable for TTBR1 and set
up the sign extension bit so that all IOVAs with that bit set are mapped
and translated from the TTBR1 pagetable.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu-regs.h  |  19 +++++
 drivers/iommu/arm-smmu.c       | 179 ++++++++++++++++++++++++++++++++++++++---
 drivers/iommu/io-pgtable-arm.c |   3 +-
 3 files changed, 186 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm-smmu-regs.h b/drivers/iommu/arm-smmu-regs.h
index e9132a9..23f27c2 100644
--- a/drivers/iommu/arm-smmu-regs.h
+++ b/drivers/iommu/arm-smmu-regs.h
@@ -195,7 +195,26 @@ enum arm_smmu_s2cr_privcfg {
 #define RESUME_RETRY			(0 << 0)
 #define RESUME_TERMINATE		(1 << 0)
 
+#define TTBCR_EPD1			(1 << 23)
+#define TTBCR_T0SZ_SHIFT		0
+#define TTBCR_T1SZ_SHIFT		16
+#define TTBCR_IRGN1_SHIFT		24
+#define TTBCR_ORGN1_SHIFT		26
+#define TTBCR_RGN_WBWA			1
+#define TTBCR_SH1_SHIFT			28
+#define TTBCR_SH_IS			3
+
+#define TTBCR_TG1_16K			(1 << 30)
+#define TTBCR_TG1_4K			(2 << 30)
+#define TTBCR_TG1_64K			(3 << 30)
+
 #define TTBCR2_SEP_SHIFT		15
+#define TTBCR2_SEP_31			(0x0 << TTBCR2_SEP_SHIFT)
+#define TTBCR2_SEP_35			(0x1 << TTBCR2_SEP_SHIFT)
+#define TTBCR2_SEP_39			(0x2 << TTBCR2_SEP_SHIFT)
+#define TTBCR2_SEP_41			(0x3 << TTBCR2_SEP_SHIFT)
+#define TTBCR2_SEP_43			(0x4 << TTBCR2_SEP_SHIFT)
+#define TTBCR2_SEP_47			(0x5 << TTBCR2_SEP_SHIFT)
 #define TTBCR2_SEP_UPSTREAM		(0x7 << TTBCR2_SEP_SHIFT)
 #define TTBCR2_AS			(1 << 4)
 
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index a795ada..e09c0e6 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -152,6 +152,7 @@ struct arm_smmu_cb {
 	u32				tcr[2];
 	u32				mair[2];
 	struct arm_smmu_cfg		*cfg;
+	unsigned long			split_table_mask;
 };
 
 struct arm_smmu_master_cfg {
@@ -253,13 +254,14 @@ enum arm_smmu_domain_stage {
 
 struct arm_smmu_domain {
 	struct arm_smmu_device		*smmu;
-	struct io_pgtable_ops		*pgtbl_ops;
+	struct io_pgtable_ops		*pgtbl_ops[2];
 	const struct iommu_gather_ops	*tlb_ops;
 	struct arm_smmu_cfg		cfg;
 	enum arm_smmu_domain_stage	stage;
 	bool				non_strict;
 	struct mutex			init_mutex; /* Protects smmu pointer */
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
+	u32 attributes;
 	struct iommu_domain		domain;
 };
 
@@ -621,6 +623,85 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+/* Adjust the context bank settings to support TTBR1 */
+static void arm_smmu_init_ttbr1(struct arm_smmu_domain *smmu_domain,
+		struct io_pgtable_cfg *pgtbl_cfg)
+{
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
+	int pgsize = 1 << __ffs(pgtbl_cfg->pgsize_bitmap);
+
+	/* Enable speculative walks through the TTBR1 */
+	cb->tcr[0] &= ~TTBCR_EPD1;
+
+	cb->tcr[0] |= TTBCR_SH_IS << TTBCR_SH1_SHIFT;
+	cb->tcr[0] |= TTBCR_RGN_WBWA << TTBCR_IRGN1_SHIFT;
+	cb->tcr[0] |= TTBCR_RGN_WBWA << TTBCR_ORGN1_SHIFT;
+
+	switch (pgsize) {
+	case SZ_4K:
+		cb->tcr[0] |= TTBCR_TG1_4K;
+		break;
+	case SZ_16K:
+		cb->tcr[0] |= TTBCR_TG1_16K;
+		break;
+	case SZ_64K:
+		cb->tcr[0] |= TTBCR_TG1_64K;
+		break;
+	}
+
+	/*
+	 * Outside of the special 49 bit UBS case that has a dedicated sign
+	 * extension bit, setting the SEP for any other va_size will force us to
+	 * shrink the size of the T0/T1 regions by one bit to accommodate the
+	 * SEP
+	 */
+	if (smmu->va_size != 48) {
+		/* Replace the T0 size */
+		cb->tcr[0] &= ~(0x3f << TTBCR_T0SZ_SHIFT);
+		cb->tcr[0] |= (64ULL - smmu->va_size - 1) << TTBCR_T0SZ_SHIFT;
+		/* Set the T1 size */
+		cb->tcr[0] |= (64ULL - smmu->va_size - 1) << TTBCR_T1SZ_SHIFT;
+	} else {
+		/* Set the T1 size to the full available UBS */
+		cb->tcr[0] |= (64ULL - smmu->va_size) << TTBCR_T1SZ_SHIFT;
+	}
+
+	/* Clear the existing SEP configuration */
+	cb->tcr[1] &= ~TTBCR2_SEP_UPSTREAM;
+
+	/* Set up the sign extend bit */
+	switch (smmu->va_size) {
+	case 32:
+		cb->tcr[1] |= TTBCR2_SEP_31;
+		cb->split_table_mask = (1UL << 31);
+		break;
+	case 36:
+		cb->tcr[1] |= TTBCR2_SEP_35;
+		cb->split_table_mask = (1UL << 35);
+		break;
+	case 40:
+		cb->tcr[1] |= TTBCR2_SEP_39;
+		cb->split_table_mask = (1UL << 39);
+		break;
+	case 42:
+		cb->tcr[1] |= TTBCR2_SEP_41;
+		cb->split_table_mask = (1UL << 41);
+		break;
+	case 44:
+		cb->tcr[1] |= TTBCR2_SEP_43;
+		cb->split_table_mask = (1UL << 43);
+		break;
+	case 48:
+		cb->tcr[1] |= TTBCR2_SEP_UPSTREAM;
+		cb->split_table_mask = (1UL << 48);
+	}
+
+	cb->ttbr[1] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr[0];
+	cb->ttbr[1] |= (u64)cfg->asid << TTBRn_ASID_SHIFT;
+}
+
 static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
 				       struct io_pgtable_cfg *pgtbl_cfg)
 {
@@ -763,11 +844,13 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 {
 	int irq, start, ret = 0;
 	unsigned long ias, oas;
-	struct io_pgtable_ops *pgtbl_ops;
+	struct io_pgtable_ops *pgtbl_ops[2] = { NULL, NULL };
 	struct io_pgtable_cfg pgtbl_cfg;
 	enum io_pgtable_fmt fmt;
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	bool split_tables =
+		(smmu_domain->attributes & (1 << DOMAIN_ATTR_SPLIT_TABLES));
 
 	mutex_lock(&smmu_domain->init_mutex);
 	if (smmu_domain->smmu)
@@ -797,8 +880,15 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	 *
 	 * Note that you can't actually request stage-2 mappings.
 	 */
-	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1))
+	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1)) {
 		smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
+
+		/* Only allow split pagetables on stage 1 tables */
+		if (split_tables) {
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+	}
 	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
 		smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
 
@@ -817,6 +907,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	    (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S) &&
 	    (smmu_domain->stage == ARM_SMMU_DOMAIN_S1))
 		cfg->fmt = ARM_SMMU_CTX_FMT_AARCH32_S;
+
 	if ((IS_ENABLED(CONFIG_64BIT) || cfg->fmt == ARM_SMMU_CTX_FMT_NONE) &&
 	    (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
 			       ARM_SMMU_FEAT_FMT_AARCH64_16K |
@@ -828,6 +919,12 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		goto out_unlock;
 	}
 
+	/* For now, only allow split tables for AARCH64 formats */
+	if (split_tables && cfg->fmt != ARM_SMMU_CTX_FMT_AARCH64) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
 	switch (smmu_domain->stage) {
 	case ARM_SMMU_DOMAIN_S1:
 		cfg->cbar = CBAR_TYPE_S1_TRANS_S2_BYPASS;
@@ -906,8 +1003,8 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
 
 	smmu_domain->smmu = smmu;
-	pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
-	if (!pgtbl_ops) {
+	pgtbl_ops[0] = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
+	if (!pgtbl_ops[0]) {
 		ret = -ENOMEM;
 		goto out_clear_smmu;
 	}
@@ -919,6 +1016,20 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 
 	/* Initialise the context bank with our page table cfg */
 	arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
+
+	if (split_tables) {
+		/* It is safe to reuse pgtbl_cfg here */
+		pgtbl_ops[1] = alloc_io_pgtable_ops(fmt, &pgtbl_cfg,
+			smmu_domain);
+		if (!pgtbl_ops[1]) {
+			free_io_pgtable_ops(pgtbl_ops[0]);
+			ret = -ENOMEM;
+			goto out_clear_smmu;
+		}
+
+		arm_smmu_init_ttbr1(smmu_domain, &pgtbl_cfg);
+	}
+
 	arm_smmu_write_context_bank(smmu, cfg->cbndx);
 
 	/*
@@ -937,7 +1048,9 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	mutex_unlock(&smmu_domain->init_mutex);
 
 	/* Publish page table ops for map/unmap */
-	smmu_domain->pgtbl_ops = pgtbl_ops;
+	smmu_domain->pgtbl_ops[0] = pgtbl_ops[0];
+	smmu_domain->pgtbl_ops[1] = pgtbl_ops[1];
+
 	return 0;
 
 out_clear_smmu:
@@ -973,7 +1086,9 @@ static void arm_smmu_destroy_domain_context(struct iommu_domain *domain)
 		devm_free_irq(smmu->dev, irq, domain);
 	}
 
-	free_io_pgtable_ops(smmu_domain->pgtbl_ops);
+	free_io_pgtable_ops(smmu_domain->pgtbl_ops[0]);
+	free_io_pgtable_ops(smmu_domain->pgtbl_ops[1]);
+
 	__arm_smmu_free_bitmap(smmu->context_map, cfg->cbndx);
 
 	arm_smmu_rpm_put(smmu);
@@ -1317,10 +1432,37 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	return ret;
 }
 
+static struct io_pgtable_ops *
+arm_smmu_get_pgtbl_ops(struct iommu_domain *domain, unsigned long iova)
+{
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
+
+	if (iova & cb->split_table_mask)
+		return smmu_domain->pgtbl_ops[1];
+
+	return smmu_domain->pgtbl_ops[0];
+}
+
+/*
+ * If split pagetables are enabled adjust the iova so that it
+ * matches the T0SZ/T1SZ that has been programmed
+ */
+unsigned long arm_smmu_adjust_iova(struct iommu_domain *domain,
+		unsigned long iova)
+{
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
+
+	return cb->split_table_mask ? iova & (cb->split_table_mask - 1) : iova;
+}
+
 static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
 			phys_addr_t paddr, size_t size, int prot)
 {
-	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
+	struct io_pgtable_ops *ops = arm_smmu_get_pgtbl_ops(domain, iova);
 	struct arm_smmu_device *smmu = to_smmu_domain(domain)->smmu;
 	int ret;
 
@@ -1328,7 +1470,8 @@ static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
 		return -ENODEV;
 
 	arm_smmu_rpm_get(smmu);
-	ret = ops->map(ops, iova, paddr, size, prot);
+	ret = ops->map(ops, arm_smmu_adjust_iova(domain, iova),
+		paddr, size, prot);
 	arm_smmu_rpm_put(smmu);
 
 	return ret;
@@ -1337,7 +1480,7 @@ static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
 static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
 			     size_t size)
 {
-	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
+	struct io_pgtable_ops *ops = arm_smmu_get_pgtbl_ops(domain, iova);
 	struct arm_smmu_device *smmu = to_smmu_domain(domain)->smmu;
 	size_t ret;
 
@@ -1345,7 +1488,7 @@ static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
 		return 0;
 
 	arm_smmu_rpm_get(smmu);
-	ret = ops->unmap(ops, iova, size);
+	ret = ops->unmap(ops, arm_smmu_adjust_iova(domain, iova), size);
 	arm_smmu_rpm_put(smmu);
 
 	return ret;
@@ -1381,7 +1524,7 @@ static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct io_pgtable_ops *ops= smmu_domain->pgtbl_ops;
+	struct io_pgtable_ops *ops = arm_smmu_get_pgtbl_ops(domain, iova);
 	struct device *dev = smmu->dev;
 	void __iomem *cb_base;
 	u32 tmp;
@@ -1429,7 +1572,7 @@ static phys_addr_t arm_smmu_iova_to_phys(struct iommu_domain *domain,
 					dma_addr_t iova)
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
-	struct io_pgtable_ops *ops = smmu_domain->pgtbl_ops;
+	struct io_pgtable_ops *ops = arm_smmu_get_pgtbl_ops(domain, iova);
 
 	if (domain->type == IOMMU_DOMAIN_IDENTITY)
 		return iova;
@@ -1629,6 +1772,11 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
 		case DOMAIN_ATTR_NESTING:
 			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
 			return 0;
+		case DOMAIN_ATTR_SPLIT_TABLES:
+			*((int *)data) =
+				!!(smmu_domain->attributes &
+				   (1 << DOMAIN_ATTR_SPLIT_TABLES));
+			return 0;
 		default:
 			return -ENODEV;
 		}
@@ -1669,6 +1817,11 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
 			else
 				smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
 			break;
+		case DOMAIN_ATTR_SPLIT_TABLES:
+			if (*((int *)data))
+				smmu_domain->attributes |=
+					(1 << DOMAIN_ATTR_SPLIT_TABLES);
+			break;
 		default:
 			ret = -ENODEV;
 		}
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 4e21efb..71ecb08 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -490,8 +490,7 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
 	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
 		return 0;
 
-	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias) ||
-		    paddr >= (1ULL << data->iop.cfg.oas)))
+	if (WARN_ON(paddr >= (1ULL << data->iop.cfg.oas)))
 		return -ERANGE;
 
 	prot = arm_lpae_prot_to_pte(data, iommu_prot);
-- 
2.7.4

