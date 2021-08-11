Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A4F3E958D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 18:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhHKQII (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 12:08:08 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32264 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229679AbhHKQIH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 12:08:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628698063; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=/dodn4TWlFOqj0OEqhjbQUxQZm3eNQVMRimqQrGkcog=; b=k5Egn6/5rzHHEgfAsMYfBMJGQ1APwUPseo519wB+bdYPg6mR1a/Z5jjriuq0EUVLRjwq/3AN
 C8lN6dnhD6Jam8pz/h2B1Oz/+yxWG9ap1iOrUSj8ihfXdV8dPp0jVQCkazfCcooQ6TwpSfWI
 3Hnyx21BP3aHnc1redwVw/Wn2cM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6113f51a7ee6040977ce5a98 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Aug 2021 16:04:42
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3E667C433F1; Wed, 11 Aug 2021 16:04:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D8D9C433F1;
        Wed, 11 Aug 2021 16:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3D8D9C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv5] iommu/arm-smmu: Optimize ->tlb_flush_walk() for qcom implementation
Date:   Wed, 11 Aug 2021 21:34:26 +0530
Message-Id: <20210811160426.10312-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently for iommu_unmap() of large scatter-gather list with page size
elements, the majority of time is spent in flushing of partial walks in
__arm_lpae_unmap() which is a VA based TLB invalidation invalidating
page-by-page on iommus like arm-smmu-v2 (TLBIVA).

For example: to unmap a 32MB scatter-gather list with page size elements
(8192 entries), there are 16->2MB buffer unmaps based on the pgsize (2MB
for 4K granule) and each of 2MB will further result in 512 TLBIVAs (2MB/4K)
resulting in a total of 8192 TLBIVAs (512*16) for 16->2MB causing a huge
overhead.

On qcom implementation, there are several performance improvements for
TLB cache invalidations in HW like wait-for-safe (for realtime clients
such as camera and display) and few others to allow for cache
lookups/updates when TLBI is in progress for the same context bank.
So the cost of over-invalidation is less compared to the unmap latency
on several usecases like camera which deals with large buffers. So,
ASID based TLB invalidations (TLBIASID) can be used to invalidate the
entire context for partial walk flush thereby improving the unmap
latency.

For this example of 32MB scatter-gather list unmap, this change results
in just 16 ASID based TLB invalidations (TLBIASIDs) as opposed to 8192
TLBIVAs thereby increasing the performance of unmaps drastically.

Test on QTI SM8150 SoC for 10 iterations of iommu_{map_sg}/unmap:
(average over 10 iterations)

Before this optimization:

    size        iommu_map_sg      iommu_unmap
      4K            2.067 us         1.854 us
     64K            9.598 us         8.802 us
      1M          148.890 us       130.718 us
      2M          305.864 us        67.291 us
     12M         1793.604 us       390.838 us
     16M         2386.848 us       518.187 us
     24M         3563.296 us       775.989 us
     32M         4747.171 us      1033.364 us

After this optimization:

    size        iommu_map_sg      iommu_unmap
      4K            1.723 us         1.765 us
     64K            9.880 us         8.869 us
      1M          155.364 us       135.223 us
      2M          303.906 us         5.385 us
     12M         1786.557 us        21.250 us
     16M         2391.890 us        27.437 us
     24M         3570.895 us        39.937 us
     32M         4755.234 us        51.797 us

Real world data also shows big difference in unmap performance as below:

There were reports of camera frame drops because of high overhead in
iommu unmap without this optimization because of frequent unmaps issued
by camera of about 100MB/s taking more than 100ms thereby causing frame
drops.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---

Changes in v5:
 * Drop non-strict mode change as it will conflict with Robin's series

Changes in v4:
 * Use a flag in struct arm_smmu_cfg to prefer TLBIASID (Will)

Changes in v3:
 * Move the logic to arm-smmu driver from io-pgtable (Robin)
 * Use a new set of iommu_flush_ops->arm_smmu_s1_tlb_impl_ops and use it for qcom impl

Changes in v2:
 * Add a quirk to choose tlb_flush_all in partial walk flush
 * Set the quirk for QTI SoC implementation

---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 11 +++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 13 ++++++++++---
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 +
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 9b9d13ec5a88..55690af1b25d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -193,6 +193,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 {
 	struct adreno_smmu_priv *priv;
 
+	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
+
 	/* Only enable split pagetables for the GPU device (SID 0) */
 	if (!qcom_adreno_smmu_is_gpu_device(dev))
 		return 0;
@@ -235,6 +237,14 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ }
 };
 
+static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
+		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
+{
+	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
+
+	return 0;
+}
+
 static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 {
 	unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
@@ -358,6 +368,7 @@ static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
 }
 
 static const struct arm_smmu_impl qcom_smmu_impl = {
+	.init_context = qcom_smmu_init_context,
 	.cfg_probe = qcom_smmu_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.reset = qcom_smmu500_reset,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index f7da8953afbe..67b660b0551d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -327,9 +327,16 @@ static void arm_smmu_tlb_inv_range_s2(unsigned long iova, size_t size,
 static void arm_smmu_tlb_inv_walk_s1(unsigned long iova, size_t size,
 				     size_t granule, void *cookie)
 {
-	arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
-				  ARM_SMMU_CB_S1_TLBIVA);
-	arm_smmu_tlb_sync_context(cookie);
+	struct arm_smmu_domain *smmu_domain = cookie;
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+
+	if (cfg->flush_walk_prefer_tlbiasid) {
+		arm_smmu_tlb_inv_context_s1(cookie);
+	} else {
+		arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
+					  ARM_SMMU_CB_S1_TLBIVA);
+		arm_smmu_tlb_sync_context(cookie);
+	}
 }
 
 static void arm_smmu_tlb_add_page_s1(struct iommu_iotlb_gather *gather,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index a50271595960..432de2f742c3 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -346,6 +346,7 @@ struct arm_smmu_cfg {
 	};
 	enum arm_smmu_cbar_type		cbar;
 	enum arm_smmu_context_fmt	fmt;
+	bool				flush_walk_prefer_tlbiasid;
 };
 #define ARM_SMMU_INVALID_IRPTNDX	0xff
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

