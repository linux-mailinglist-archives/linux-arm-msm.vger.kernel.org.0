Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C56725529
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 18:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbfEUQO2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 12:14:28 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58596 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728987AbfEUQO2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 12:14:28 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 32311619EE; Tue, 21 May 2019 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455267;
        bh=mPpWMT8VclLlXkDHcZku25yiK9JcrH0W+cJHnR3vCe4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CjjKy3EUXQf8EHebChqIK26qn02VqW/j3K7YlC9MhB73Ot327Yy/d7H98j+BPY43N
         Y1OhuMKsTAgdJRB3F0zI+vPnhi9uGRp+iMQA5mRKFe56Kz8bKbTUf8JQjtmwwa20MY
         ZTfICLYbkoDKD2T+LV2B6j+pHdhp8SK3NFFdmooI=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 13D2A613A6;
        Tue, 21 May 2019 16:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455257;
        bh=mPpWMT8VclLlXkDHcZku25yiK9JcrH0W+cJHnR3vCe4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l0xwihPxMPObUCtHycTCB/OsfBwh3dlYMRoOSmVs9gyX3VnSaC8KueOMcgT5s8pST
         HDcr+x0GKU4uh99n51sZLlMDtUt+0GE/qQx1pzMRMnEMAbpkCqTl44lUjFhOi2Uiu+
         0bCFxnLI6vtwAzTC2oNXKHPcneKYNdQIOMz8beaA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 13D2A613A6
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
Subject: [PATCH v2 05/15] iommu/arm-smmu: Add auxiliary domain support for arm-smmuv2
Date:   Tue, 21 May 2019 10:13:53 -0600
Message-Id: <1558455243-32746-6-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
References: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support auxiliary domains for arm-smmu-v2 to initialize and support
multiple pagetables for a single SMMU context bank. Since the smmu-v2
hardware doesn't have any built in support for switching the pagetable
it is left as an exercise to the caller to actually use the pagetable;
aux domains in the IOMMU driver are only preoccupied with creating and
managing the pagetable memory.

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
unmap iova addresses in the pagetable. The driver/hardware is used
to switch the pagetable according to its own specific implementation.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu.c | 133 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 117 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index e09c0e6..27ff554 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -263,6 +263,8 @@ struct arm_smmu_domain {
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
 	u32 attributes;
 	struct iommu_domain		domain;
+	bool				is_aux;
+	u64				ttbr0;
 };
 
 struct arm_smmu_option_prop {
@@ -892,6 +894,12 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
 		smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
 
+	/* Aux domains can only be created for stage-1 tables */
+	if (smmu_domain->is_aux && smmu_domain->stage != ARM_SMMU_DOMAIN_S1) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
 	/*
 	 * Choosing a suitable context format is even more fiddly. Until we
 	 * grow some way for the caller to express a preference, and/or move
@@ -942,6 +950,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 			ias = min(ias, 32UL);
 			oas = min(oas, 32UL);
 		}
+
 		smmu_domain->tlb_ops = &arm_smmu_s1_tlb_ops;
 		break;
 	case ARM_SMMU_DOMAIN_NESTED:
@@ -961,6 +970,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 			ias = min(ias, 40UL);
 			oas = min(oas, 40UL);
 		}
+
 		if (smmu->version == ARM_SMMU_V2)
 			smmu_domain->tlb_ops = &arm_smmu_s2_tlb_ops_v2;
 		else
@@ -970,23 +980,30 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		ret = -EINVAL;
 		goto out_unlock;
 	}
-	ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
-				      smmu->num_context_banks);
-	if (ret < 0)
-		goto out_unlock;
 
-	cfg->cbndx = ret;
-	if (smmu->version < ARM_SMMU_V2) {
-		cfg->irptndx = atomic_inc_return(&smmu->irptndx);
-		cfg->irptndx %= smmu->num_context_irqs;
-	} else {
-		cfg->irptndx = cfg->cbndx;
-	}
+	/*
+	 * Aux domains will use the same context bank assigned to the master
+	 * domain for the device
+	 */
+	if (!smmu_domain->is_aux) {
+		ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
+					      smmu->num_context_banks);
+		if (ret < 0)
+			goto out_unlock;
 
-	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S2)
-		cfg->vmid = cfg->cbndx + 1 + smmu->cavium_id_base;
-	else
-		cfg->asid = cfg->cbndx + smmu->cavium_id_base;
+		cfg->cbndx = ret;
+		if (smmu->version < ARM_SMMU_V2) {
+			cfg->irptndx = atomic_inc_return(&smmu->irptndx);
+			cfg->irptndx %= smmu->num_context_irqs;
+		} else {
+			cfg->irptndx = cfg->cbndx;
+		}
+
+		if (smmu_domain->stage == ARM_SMMU_DOMAIN_S2)
+			cfg->vmid = cfg->cbndx + 1 + smmu->cavium_id_base;
+		else
+			cfg->asid = cfg->cbndx + smmu->cavium_id_base;
+	}
 
 	pgtbl_cfg = (struct io_pgtable_cfg) {
 		.pgsize_bitmap	= smmu->pgsize_bitmap,
@@ -1009,11 +1026,21 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		goto out_clear_smmu;
 	}
 
+	/* Cache the TTBR0 for the aux domain */
+	smmu_domain->ttbr0 = pgtbl_cfg.arm_lpae_s1_cfg.ttbr[0];
+
 	/* Update the domain's page sizes to reflect the page table format */
 	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
 	domain->geometry.aperture_end = (1UL << ias) - 1;
 	domain->geometry.force_aperture = true;
 
+	/*
+	 * aux domains don't use split tables or program the hardware so we're
+	 * done setting it up
+	 */
+	if (smmu_domain->is_aux)
+		goto out;
+
 	/* Initialise the context bank with our page table cfg */
 	arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
 
@@ -1045,6 +1072,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		cfg->irptndx = INVALID_IRPTNDX;
 	}
 
+out:
 	mutex_unlock(&smmu_domain->init_mutex);
 
 	/* Publish page table ops for map/unmap */
@@ -1070,6 +1098,12 @@ static void arm_smmu_destroy_domain_context(struct iommu_domain *domain)
 	if (!smmu || domain->type == IOMMU_DOMAIN_IDENTITY)
 		return;
 
+	/* All we need to do for aux devices is destroy the pagetable */
+	if (smmu_domain->is_aux) {
+		free_io_pgtable_ops(smmu_domain->pgtbl_ops[0]);
+		return;
+	}
+
 	ret = arm_smmu_rpm_get(smmu);
 	if (ret < 0)
 		return;
@@ -1352,14 +1386,17 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 
 struct arm_smmu_client_match_data {
 	bool use_identity_domain;
+	bool allow_aux_domain;
 };
 
 static const struct arm_smmu_client_match_data qcom_adreno = {
 	.use_identity_domain = true,
+	.allow_aux_domain = true,
 };
 
 static const struct arm_smmu_client_match_data qcom_mdss = {
 	.use_identity_domain = true,
+	.allow_aux_domain = false,
 };
 
 static const struct of_device_id arm_smmu_client_of_match[] = {
@@ -1379,6 +1416,55 @@ arm_smmu_client_data(struct device *dev)
 	return match ? match->data : NULL;
 }
 
+static bool arm_smmu_supports_aux(struct device *dev)
+{
+	const struct arm_smmu_client_match_data *data =
+		arm_smmu_client_data(dev);
+
+	return (data && data->allow_aux_domain);
+}
+
+static bool arm_smmu_dev_has_feat(struct device *dev,
+		enum iommu_dev_features feat)
+{
+	if (feat != IOMMU_DEV_FEAT_AUX)
+		return false;
+
+	return arm_smmu_supports_aux(dev);
+}
+
+static int arm_smmu_dev_enable_feat(struct device *dev,
+		enum iommu_dev_features feat)
+{
+	/* If supported aux domain support is always "on" */
+	if (feat == IOMMU_DEV_FEAT_AUX && arm_smmu_supports_aux(dev))
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
+/* Set up a new aux domain and create a new pagetable with the same
+ * characteristics as the master
+ */
+static int arm_smmu_aux_attach_dev(struct iommu_domain *domain,
+		struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+
+	smmu_domain->is_aux = true;
+
+	/* No power is needed because aux domain doesn't touch the hardware */
+	return arm_smmu_init_domain_context(domain, smmu);
+}
+
 static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 {
 	int ret;
@@ -1437,7 +1523,13 @@ arm_smmu_get_pgtbl_ops(struct iommu_domain *domain, unsigned long iova)
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
+	struct arm_smmu_cb *cb;
+
+	/* quick escape for domains that don't have split pagetables enabled */
+	if (!smmu_domain->pgtbl_ops[1])
+		return smmu_domain->pgtbl_ops[0];
+
+	cb = &smmu_domain->smmu->cbs[cfg->cbndx];
 
 	if (iova & cb->split_table_mask)
 		return smmu_domain->pgtbl_ops[1];
@@ -1777,6 +1869,11 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
 				!!(smmu_domain->attributes &
 				   (1 << DOMAIN_ATTR_SPLIT_TABLES));
 			return 0;
+		case DOMAIN_ATTR_PTBASE:
+			if (!smmu_domain->is_aux)
+				return -ENODEV;
+			*((u64 *)data) = smmu_domain->ttbr0;
+			return 0;
 		default:
 			return -ENODEV;
 		}
@@ -1887,7 +1984,11 @@ static struct iommu_ops arm_smmu_ops = {
 	.capable		= arm_smmu_capable,
 	.domain_alloc		= arm_smmu_domain_alloc,
 	.domain_free		= arm_smmu_domain_free,
+	.dev_has_feat		= arm_smmu_dev_has_feat,
+	.dev_enable_feat	= arm_smmu_dev_enable_feat,
+	.dev_disable_feat	= arm_smmu_dev_disable_feat,
 	.attach_dev		= arm_smmu_attach_dev,
+	.aux_attach_dev		= arm_smmu_aux_attach_dev,
 	.map			= arm_smmu_map,
 	.unmap			= arm_smmu_unmap,
 	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
-- 
2.7.4

