Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 973A92E6C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 22:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfE2Uz0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 16:55:26 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57100 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbfE2Uz0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 16:55:26 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CFC6A60A00; Wed, 29 May 2019 20:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163324;
        bh=6chReSEkevyOEDtSRSepdc5qrnqGOGKdxjwcEABL24Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FvcMAh/1Firmuvzj0ZCSwVjKCTArjYqcV0qHQj6XFLbMsDJlledodozqOrTqMi4HK
         HOxuZgpZV49FlCoulRdEUKEIuqrSIGy1DWjTnNwgKjNlEDA6CWt+btIxyQ+qbX5xIb
         lccFF7e0eBPpznfqvN+mAresPQiZqrzLpMhm6JWc=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 947D961515;
        Wed, 29 May 2019 20:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163322;
        bh=6chReSEkevyOEDtSRSepdc5qrnqGOGKdxjwcEABL24Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d5USjgZhLsCu/CcIgjmqin6bnpyeIQFXMMljimY56jQ7H7qj2YZRAIw/Lnv85+jJY
         2WoD4QHTW2j80L9WeDMgPLIlYYbh5DI/IIUcOA+AHS7G8yw/ybq0ppdQY19XEFXM2S
         LUk0LmwpVHVqHBqYR++VLy3rFH5sljYo37kFdnas=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 947D961515
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
Subject: [PATCH v3 06/16] iommu/arm-smmu: Add auxiliary domain support for arm-smmuv2
Date:   Wed, 29 May 2019 14:54:42 -0600
Message-Id: <1559163292-4792-7-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
References: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support auxiliary domains for arm-smmu-v2 to initialize and support multiple
pagetables for a single SMMU context bank. Since the smmu-v2 hardware
doesn't have any built in support for switching the pagetable base it is
left as an exercise to the caller to actually use the pagetable; aux
domains in the IOMMU driver are only preoccupied with creating and managing
the pagetable memory.

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

v3: Trivial update to reflect new pgtable ops situation

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu.c | 125 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 110 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 33e6928..589da47 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -262,6 +262,8 @@ struct arm_smmu_domain {
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
 	u32 attributes;
 	struct iommu_domain		domain;
+	bool				is_aux;
+	u64				ttbr0;
 };
 
 struct arm_smmu_option_prop {
@@ -803,6 +805,12 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
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
@@ -850,6 +858,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 			ias = min(ias, 32UL);
 			oas = min(oas, 32UL);
 		}
+
 		smmu_domain->tlb_ops = &arm_smmu_s1_tlb_ops;
 		break;
 	case ARM_SMMU_DOMAIN_NESTED:
@@ -869,6 +878,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 			ias = min(ias, 40UL);
 			oas = min(oas, 40UL);
 		}
+
 		if (smmu->version == ARM_SMMU_V2)
 			smmu_domain->tlb_ops = &arm_smmu_s2_tlb_ops_v2;
 		else
@@ -878,23 +888,30 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
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
@@ -917,11 +934,21 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
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
 	arm_smmu_write_context_bank(smmu, cfg->cbndx);
@@ -939,6 +966,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		cfg->irptndx = INVALID_IRPTNDX;
 	}
 
+out:
 	mutex_unlock(&smmu_domain->init_mutex);
 
 	/* Publish page table ops for map/unmap */
@@ -962,6 +990,12 @@ static void arm_smmu_destroy_domain_context(struct iommu_domain *domain)
 	if (!smmu || domain->type == IOMMU_DOMAIN_IDENTITY)
 		return;
 
+	/* All we need to do for aux devices is destroy the pagetable */
+	if (smmu_domain->is_aux) {
+		free_io_pgtable_ops(smmu_domain->pgtbl_ops);
+		return;
+	}
+
 	ret = arm_smmu_rpm_get(smmu);
 	if (ret < 0)
 		return;
@@ -1242,14 +1276,17 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 
 struct arm_smmu_client_match_data {
 	bool direct_mapping;
+	bool allow_aux_domain;
 };
 
 static const struct arm_smmu_client_match_data qcom_adreno = {
 	.direct_mapping = true,
+	.allow_aux_domain = true,
 };
 
 static const struct arm_smmu_client_match_data qcom_mdss = {
 	.direct_mapping = true,
+	.allow_aux_domain = false,
 };
 
 static const struct of_device_id arm_smmu_client_of_match[] = {
@@ -1269,6 +1306,55 @@ arm_smmu_client_data(struct device *dev)
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
@@ -1631,6 +1717,11 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
 			*(int *)data = !!(smmu_domain->attributes &
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
@@ -1741,7 +1832,11 @@ static struct iommu_ops arm_smmu_ops = {
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

