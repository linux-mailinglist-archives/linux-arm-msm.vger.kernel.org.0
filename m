Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081941F701E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 00:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgFKW3l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 18:29:41 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:59709 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726379AbgFKW3k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 18:29:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591914579; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=nJEe/WRncOuDoMlOFEJyIee88M4i321pcVZbt5SiKKU=; b=cWoUAElcM3xp/o+qaNsi42qz3Oeh68atp7QDNz7iKoNVwFr5k3S7QKMhD3ZCDxQSoG5wBPIn
 lt+jnKMsjjy2FD/LjEtuV8zN35EGOPWDoZSuux0FjNil0EIac+YHiOdp8q8RNCtrd5NPjmrV
 WVBtWK+TZ9vMJPGFOmD3J7t6Mjg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ee2b04a356bcc26ab68f232 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Jun 2020 22:29:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A2645C433A0; Thu, 11 Jun 2020 22:29:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4DFBBC433C8;
        Thu, 11 Jun 2020 22:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4DFBBC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     freedreno@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] iommu/arm-smmu: Add auxiliary domain support for arm-smmuv2
Date:   Thu, 11 Jun 2020 16:29:16 -0600
Message-Id: <20200611222921.464-2-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611222921.464-1-jcrouse@codeaurora.org>
References: <20200611222921.464-1-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support auxiliary domains for arm-smmu-v2 to initialize and support
multiple pagetables for a single SMMU context bank. Since the smmu-v2
hardware doesn't have any built in support for switching the pagetable
base it is left as an exercise to the caller to actually use the pagetable.

Aux domains are supported if split pagetable (TTBR1) support has been
enabled on the master domain.  Each auxiliary domain will reuse the
configuration of the master domain. By default the a domain with TTBR1
support will have the TTBR0 region disabled so the first attached aux
domain will enable the TTBR0 region in the hardware and conversely the
last domain to be detached will disable TTBR0 translations.  All subsequent
auxiliary domains create a pagetable but not touch the hardware.

The leaf driver will be able to query the physical address of the
pagetable with the DOMAIN_ATTR_PTBASE attribute so that it can use the
address with whatever means it has to switch the pagetable base.

Following is a pseudo code example of how a domain can be created

 /* Check to see if aux domains are supported */
 if (iommu_dev_has_feature(dev, IOMMU_DEV_FEAT_AUX)) {
	 iommu = iommu_domain_alloc(...);

	 if (iommu_aux_attach_device(domain, dev))
		 return FAIL;

	/* Save the base address of the pagetable for use by the driver
	iommu_domain_get_attr(domain, DOMAIN_ATTR_PTBASE, &ptbase);
 }

Then 'domain' can be used like any other iommu domain to map and
unmap iova addresses in the pagetable.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu.c | 216 ++++++++++++++++++++++++++++++++++++---
 drivers/iommu/arm-smmu.h |   1 +
 2 files changed, 201 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 743d75b9ff3f..46a96c578592 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -667,6 +667,84 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
 }
 
+/*
+ * Update the context context bank to enable TTBR0. Assumes AARCH64 S1
+ * configuration.
+ */
+static void arm_smmu_context_set_ttbr0(struct arm_smmu_cb *cb,
+		struct io_pgtable_cfg *pgtbl_cfg)
+{
+	u32 tcr = cb->tcr[0];
+
+	/* Add the TCR configuration from the new pagetable config */
+	tcr |= arm_smmu_lpae_tcr(pgtbl_cfg);
+
+	/* Make sure that both TTBR0 and TTBR1 are enabled */
+	tcr &= ~(ARM_SMMU_TCR_EPD0 | ARM_SMMU_TCR_EPD1);
+
+	/* Udate the TCR register */
+	cb->tcr[0] = tcr;
+
+	/* Program the new TTBR0 */
+	cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
+	cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
+}
+
+/*
+ * Thus function assumes that the current model only allows aux domains for
+ * AARCH64 S1 configurations
+ */
+static int arm_smmu_aux_init_domain_context(struct iommu_domain *domain,
+		struct arm_smmu_device *smmu, struct arm_smmu_cfg *master)
+{
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	struct io_pgtable_ops *pgtbl_ops;
+	struct io_pgtable_cfg pgtbl_cfg;
+
+	mutex_lock(&smmu_domain->init_mutex);
+
+	/* Copy the configuration from the master */
+	memcpy(&smmu_domain->cfg, master, sizeof(smmu_domain->cfg));
+
+	smmu_domain->flush_ops = &arm_smmu_s1_tlb_ops;
+	smmu_domain->smmu = smmu;
+
+	pgtbl_cfg = (struct io_pgtable_cfg) {
+		.pgsize_bitmap = smmu->pgsize_bitmap,
+		.ias = smmu->va_size,
+		.oas = smmu->ipa_size,
+		.coherent_walk = smmu->features & ARM_SMMU_FEAT_COHERENT_WALK,
+		.tlb = smmu_domain->flush_ops,
+		.iommu_dev = smmu->dev,
+		.quirks = 0,
+	};
+
+	if (smmu_domain->non_strict)
+		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
+
+	pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1, &pgtbl_cfg,
+		smmu_domain);
+	if (!pgtbl_ops) {
+		mutex_unlock(&smmu_domain->init_mutex);
+		return -ENOMEM;
+	}
+
+	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
+
+	domain->geometry.aperture_end = (1UL << smmu->va_size) - 1;
+	domain->geometry.force_aperture = true;
+
+	/* enable TTBR0 when the the first aux domain is attached */
+	if (atomic_inc_return(&smmu->cbs[master->cbndx].aux) == 1) {
+		arm_smmu_context_set_ttbr0(&smmu->cbs[master->cbndx],
+			&pgtbl_cfg);
+		arm_smmu_write_context_bank(smmu, master->cbndx);
+	}
+
+	smmu_domain->pgtbl_ops = pgtbl_ops;
+	return 0;
+}
+
 static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 					struct arm_smmu_device *smmu)
 {
@@ -870,36 +948,70 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	return ret;
 }
 
+static void
+arm_smmu_destroy_aux_domain_context(struct arm_smmu_domain *smmu_domain)
+{
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	int ret;
+
+	/*
+	 * If this is the last aux domain to be freed, disable TTBR0 by turning
+	 * off translations and clearing TTBR0
+	 */
+	if (atomic_dec_return(&smmu->cbs[cfg->cbndx].aux) == 0) {
+		/* Clear out the T0 region */
+		smmu->cbs[cfg->cbndx].tcr[0] &= ~GENMASK(15, 0);
+		/* Disable TTBR0 translations */
+		smmu->cbs[cfg->cbndx].tcr[0] |= ARM_SMMU_TCR_EPD0;
+		/* Clear the TTBR0 pagetable address */
+		smmu->cbs[cfg->cbndx].ttbr[0] =
+			FIELD_PREP(ARM_SMMU_TTBRn_ASID, cfg->asid);
+
+		ret = arm_smmu_rpm_get(smmu);
+		if (!ret) {
+			arm_smmu_write_context_bank(smmu, cfg->cbndx);
+			arm_smmu_rpm_put(smmu);
+		}
+	}
+
+}
+
 static void arm_smmu_destroy_domain_context(struct iommu_domain *domain)
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	int ret, irq;
 
 	if (!smmu || domain->type == IOMMU_DOMAIN_IDENTITY)
 		return;
 
-	ret = arm_smmu_rpm_get(smmu);
-	if (ret < 0)
-		return;
+	if (smmu_domain->aux)
+		arm_smmu_destroy_aux_domain_context(smmu_domain);
 
-	/*
-	 * Disable the context bank and free the page tables before freeing
-	 * it.
-	 */
-	smmu->cbs[cfg->cbndx].cfg = NULL;
-	arm_smmu_write_context_bank(smmu, cfg->cbndx);
+	/* Check if the last user is done with the context bank */
+	if (atomic_read(&smmu->cbs[cfg->cbndx].aux) == 0) {
+		int ret = arm_smmu_rpm_get(smmu);
+		int irq;
+
+		if (ret < 0)
+			return;
+
+		/* Disable the context bank */
+		smmu->cbs[cfg->cbndx].cfg = NULL;
+		arm_smmu_write_context_bank(smmu, cfg->cbndx);
+
+		if (cfg->irptndx != ARM_SMMU_INVALID_IRPTNDX) {
+			irq = smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
+			devm_free_irq(smmu->dev, irq, domain);
+		}
 
-	if (cfg->irptndx != ARM_SMMU_INVALID_IRPTNDX) {
-		irq = smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
-		devm_free_irq(smmu->dev, irq, domain);
+		__arm_smmu_free_bitmap(smmu->context_map, cfg->cbndx);
+		arm_smmu_rpm_put(smmu);
 	}
 
+	/* Destroy the pagetable */
 	free_io_pgtable_ops(smmu_domain->pgtbl_ops);
-	__arm_smmu_free_bitmap(smmu->context_map, cfg->cbndx);
-
-	arm_smmu_rpm_put(smmu);
 }
 
 static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
@@ -1160,6 +1272,74 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 	return 0;
 }
 
+static bool arm_smmu_dev_has_feat(struct device *dev,
+		enum iommu_dev_features feat)
+{
+	if (feat != IOMMU_DEV_FEAT_AUX)
+		return false;
+
+	return true;
+}
+
+static int arm_smmu_dev_enable_feat(struct device *dev,
+		enum iommu_dev_features feat)
+{
+	/* aux domain support is always available */
+	if (feat == IOMMU_DEV_FEAT_AUX)
+		return 0;
+
+	return -ENODEV;
+}
+
+static int arm_smmu_dev_disable_feat(struct device *dev,
+		enum iommu_dev_features feat)
+{
+	return -EBUSY;
+}
+
+static int arm_smmu_aux_attach_dev(struct iommu_domain *domain,
+		struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct arm_smmu_device *smmu = cfg->smmu;
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	struct arm_smmu_cb *cb;
+	int idx, i, ret, cbndx = -1;
+
+	/* Try to find the context bank configured for this device */
+	for_each_cfg_sme(cfg, fwspec, i, idx) {
+		if (idx != INVALID_SMENDX) {
+			cbndx = smmu->s2crs[idx].cbndx;
+			break;
+		}
+	}
+
+	if (cbndx == -1)
+		return -ENODEV;
+
+	cb = &smmu->cbs[cbndx];
+
+	/* Aux domains are only supported for AARCH64 configurations */
+	if (cb->cfg->fmt != ARM_SMMU_CTX_FMT_AARCH64)
+		return -EINVAL;
+
+	/* Make sure that TTBR1 is enabled in the hardware */
+	if ((cb->tcr[0] & ARM_SMMU_TCR_EPD1))
+		return -EINVAL;
+
+	smmu_domain->aux = true;
+
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret < 0)
+		return ret;
+
+	ret = arm_smmu_aux_init_domain_context(domain, smmu, cb->cfg);
+
+	arm_smmu_rpm_put(smmu);
+	return ret;
+}
+
 static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
@@ -1652,6 +1832,10 @@ static struct iommu_ops arm_smmu_ops = {
 	.get_resv_regions	= arm_smmu_get_resv_regions,
 	.put_resv_regions	= generic_iommu_put_resv_regions,
 	.def_domain_type	= arm_smmu_def_domain_type,
+	.dev_has_feat		= arm_smmu_dev_has_feat,
+	.dev_enable_feat	= arm_smmu_dev_enable_feat,
+	.dev_disable_feat	= arm_smmu_dev_disable_feat,
+	.aux_attach_dev		= arm_smmu_aux_attach_dev,
 	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
 };
 
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index c417814f1d98..79d441024043 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -346,6 +346,7 @@ struct arm_smmu_domain {
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
 	struct iommu_domain		domain;
 	struct device			*dev;	/* Device attached to this domain */
+	bool				aux;
 };
 
 static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
-- 
2.17.1

