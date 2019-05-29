Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE0C2E6CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 22:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfE2U4k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 16:56:40 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:32936 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbfE2U4k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 16:56:40 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BAF2D6119F; Wed, 29 May 2019 20:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163398;
        bh=cUIPIGctA4wgg/uQMmcfCltYmcPMsZcXek/F57krbj8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hVA2FqlD5sSPHBF7dMppKb+Y6YGkkng9CJwtfwOrLvdIUDRhFC4VUVkSZZGFYCR4R
         2RKjKkoq9ZwNgxbu1026tEESSvat34NI2etZ3CpqUt+mVezDubaloYby7Si8FYcPC1
         S4eeRrI5yzZl0Xmlxs4hV6H5xPpBrtbJDG5i/IR0=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A5C661A64;
        Wed, 29 May 2019 20:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163359;
        bh=cUIPIGctA4wgg/uQMmcfCltYmcPMsZcXek/F57krbj8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P83qkCzwhSOwkMKxEoS1lLkD3rpGdJPj2h0iGI1atM/hUMjDunUuJfaue+901h6sp
         CxAh4OMZv2QDcIn/f0tsXhCWPMSNd1vXSXjAkuegx4bhcHTnjFDhLAJOKHgojYGf4V
         CTzYjxQ/tBj3uZe6ERCtsuL2IGVhuOzYhdSFjQww=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7A5C661A64
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        Sean Paul <sean@poorly.run>, Wen Yang <wen.yang99@zte.com.cn>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 16/16] drm/msm/a5xx: Support per-instance pagetables
Date:   Wed, 29 May 2019 14:54:52 -0600
Message-Id: <1559163292-4792-17-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
References: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for per-instance pagetables for 5XX targets. Create a support
buffer for preemption to hold the SMMU pagetable information for a
preempted ring, enable TTBR1 to support split pagetables and add the
necessary PM4 commands to trigger a pagetable switch at the beginning
of a user command.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 120 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     |  19 +++++
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  70 +++++++++++++----
 3 files changed, 192 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 2f87c3e..fedd470 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -111,6 +111,59 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 	msm_gpu_retire(gpu);
 }
 
+static void a5xx_set_pagetable(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
+	struct msm_file_private *ctx)
+{
+	u64 ttbr;
+	u32 asid;
+
+	if (!msm_iommu_get_ptinfo(ctx->aspace->mmu, &ttbr, &asid))
+		return;
+
+	ttbr = ttbr | ((u64) asid) << 48;
+
+	/* Turn off protected mode */
+	OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
+	OUT_RING(ring, 0);
+
+	/* Turn on APIV mode to access critical regions */
+	OUT_PKT4(ring, REG_A5XX_CP_CNTL, 1);
+	OUT_RING(ring, 1);
+
+	/* Make sure the ME is synchronized before staring the update */
+	OUT_PKT7(ring, CP_WAIT_FOR_ME, 0);
+
+	/* Execute the table update */
+	OUT_PKT7(ring, CP_SMMU_TABLE_UPDATE, 3);
+	OUT_RING(ring, lower_32_bits(ttbr));
+	OUT_RING(ring, upper_32_bits(ttbr));
+	OUT_RING(ring, 0);
+
+	/*
+	 * Write the new TTBR0 to the preemption records - this will be used to
+	 * reload the pagetable if the current ring gets preempted out.
+	 */
+	OUT_PKT7(ring, CP_MEM_WRITE, 4);
+	OUT_RING(ring, lower_32_bits(rbmemptr(ring, ttbr0)));
+	OUT_RING(ring, upper_32_bits(rbmemptr(ring, ttbr0)));
+	OUT_RING(ring, lower_32_bits(ttbr));
+	OUT_RING(ring, upper_32_bits(ttbr));
+
+	/* Invalidate the draw state so we start off fresh */
+	OUT_PKT7(ring, CP_SET_DRAW_STATE, 3);
+	OUT_RING(ring, 0x40000);
+	OUT_RING(ring, 1);
+	OUT_RING(ring, 0);
+
+	/* Turn off APRIV */
+	OUT_PKT4(ring, REG_A5XX_CP_CNTL, 1);
+	OUT_RING(ring, 0);
+
+	/* Turn off protected mode */
+	OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
+	OUT_RING(ring, 1);
+}
+
 static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 	struct msm_file_private *ctx)
 {
@@ -126,6 +179,8 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 		return;
 	}
 
+	a5xx_set_pagetable(gpu, ring, ctx);
+
 	OUT_PKT7(ring, CP_PREEMPT_ENABLE_GLOBAL, 1);
 	OUT_RING(ring, 0x02);
 
@@ -1349,21 +1404,77 @@ static unsigned long a5xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }
 
+static struct msm_gem_address_space *a5xx_new_address_space(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
+	struct msm_gem_address_space *aspace;
+	int ret;
+
+	/* Return the default pagetable if per instance tables don't work */
+	if (!a5xx_gpu->per_instance_tables)
+		return gpu->aspace;
+
+	aspace = msm_gem_address_space_create_instance(&gpu->pdev->dev,
+		"gpu", 0x100000000ULL, 0x1ffffffffULL);
+	if (IS_ERR(aspace))
+		return aspace;
+
+	ret = aspace->mmu->funcs->attach(aspace->mmu, NULL, 0);
+	if (ret) {
+		/* -ENODEV means that aux domains aren't supported */
+		if (ret == -ENODEV)
+			return gpu->aspace;
+
+		return ERR_PTR(ret);
+	}
+
+	return aspace;
+}
+
 static struct msm_gem_address_space *
 a5xx_create_address_space(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
+	struct device *dev = &gpu->pdev->dev;
 	struct msm_gem_address_space *aspace;
 	struct iommu_domain *iommu;
-	int ret;
+	int ret, val = 1;
+
+	a5xx_gpu->per_instance_tables = false;
 
 	iommu = iommu_domain_alloc(&platform_bus_type);
 	if (!iommu)
 		return ERR_PTR(-ENXIO);
 
-	iommu->geometry.aperture_start = 0x100000000ULL;
-	iommu->geometry.aperture_end = 0x1ffffffffULL;
+	/* Try to enable split pagetables */
+	if (iommu_domain_set_attr(iommu, DOMAIN_ATTR_SPLIT_TABLES, &val)) {
+		/*
+		 * If split pagetables aren't available we won't be able to do
+		 * per-instance pagetables so set up the global va space at our
+		 * susual location
+		 */
+		iommu->geometry.aperture_start = 0x100000000ULL;
+		iommu->geometry.aperture_end = 0x1ffffffffULL;
+	} else {
+		/*
+		 * If split pagetables are available then we might be able to do
+		 * per-instance pagetables. Put the default va-space in TTBR1 to
+		 * prepare
+		 */
+		iommu->geometry.aperture_start = 0xfffffff100000000ULL;
+		iommu->geometry.aperture_end = 0xfffffff1ffffffffULL;
+
+		/*
+		 * If both split pagetables and aux domains are supported we can
+		 * do per_instance pagetables
+		 */
+		a5xx_gpu->per_instance_tables =
+			iommu_dev_has_feature(dev, IOMMU_DEV_FEAT_AUX);
+	}
 
-	aspace = msm_gem_address_space_create(&gpu->pdev->dev, iommu, "gpu");
+	aspace = msm_gem_address_space_create(dev, iommu, "gpu");
 	if (IS_ERR(aspace)) {
 		iommu_domain_free(iommu);
 		DRM_DEV_ERROR(gpu->dev->dev, "failed to init mmu: %ld\n",
@@ -1403,6 +1514,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_state_get = a5xx_gpu_state_get,
 		.gpu_state_put = a5xx_gpu_state_put,
 		.create_address_space = a5xx_create_address_space,
+		.new_address_space = a5xx_new_address_space,
 	},
 	.get_timestamp = a5xx_get_timestamp,
 };
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index 7d71860..82ceb9b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -45,6 +45,11 @@ struct a5xx_gpu {
 
 	atomic_t preempt_state;
 	struct timer_list preempt_timer;
+	struct a5xx_smmu_info *smmu_info;
+	struct drm_gem_object *smmu_info_bo;
+	uint64_t smmu_info_iova;
+
+	bool per_instance_tables;
 };
 
 #define to_a5xx_gpu(x) container_of(x, struct a5xx_gpu, base)
@@ -132,6 +137,20 @@ struct a5xx_preempt_record {
  */
 #define A5XX_PREEMPT_COUNTER_SIZE (16 * 4)
 
+/*
+ * This is a global structure that the preemption code uses to switch in the
+ * pagetable for the preempted process - the code switches in whatever we
+ * after preempting in a new ring.
+ */
+struct a5xx_smmu_info {
+	uint32_t  magic;
+	uint32_t  _pad4;
+	uint64_t  ttbr0;
+	uint32_t  asid;
+	uint32_t  contextidr;
+};
+
+#define A5XX_SMMU_INFO_MAGIC 0x3618CDA3UL
 
 int a5xx_power_init(struct msm_gpu *gpu);
 void a5xx_gpmu_ucode_init(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 3d62310..1050409 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -12,6 +12,7 @@
  */
 
 #include "msm_gem.h"
+#include "msm_mmu.h"
 #include "a5xx_gpu.h"
 
 /*
@@ -145,6 +146,15 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
 	a5xx_gpu->preempt[ring->id]->wptr = get_wptr(ring);
 	spin_unlock_irqrestore(&ring->lock, flags);
 
+	/* Do read barrier to make sure we have updated pagetable info */
+	rmb();
+
+	/* Set the SMMU info for the preemption */
+	if (a5xx_gpu->smmu_info) {
+		a5xx_gpu->smmu_info->ttbr0 = ring->memptrs->ttbr0;
+		a5xx_gpu->smmu_info->contextidr = 0;
+	}
+
 	/* Set the address of the incoming preemption record */
 	gpu_write64(gpu, REG_A5XX_CP_CONTEXT_SWITCH_RESTORE_ADDR_LO,
 		REG_A5XX_CP_CONTEXT_SWITCH_RESTORE_ADDR_HI,
@@ -221,9 +231,10 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
 		a5xx_gpu->preempt[i]->rbase = gpu->rb[i]->iova;
 	}
 
-	/* Write a 0 to signal that we aren't switching pagetables */
+	/* Tell the CP where to find the smmu_info buffer*/
 	gpu_write64(gpu, REG_A5XX_CP_CONTEXT_SWITCH_SMMU_INFO_LO,
-		REG_A5XX_CP_CONTEXT_SWITCH_SMMU_INFO_HI, 0);
+		REG_A5XX_CP_CONTEXT_SWITCH_SMMU_INFO_HI,
+		a5xx_gpu->smmu_info_iova);
 
 	/* Reset the preemption state */
 	set_preempt_state(a5xx_gpu, PREEMPT_NONE);
@@ -271,6 +282,34 @@ void a5xx_preempt_fini(struct msm_gpu *gpu)
 
 	for (i = 0; i < gpu->nr_rings; i++)
 		msm_gem_kernel_put(a5xx_gpu->preempt_bo[i], gpu->aspace, true);
+
+	msm_gem_kernel_put(a5xx_gpu->smmu_info_bo, gpu->aspace, true);
+}
+
+static int a5xx_smmu_info_init(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
+	struct a5xx_smmu_info *ptr;
+	struct drm_gem_object *bo;
+	u64 iova;
+
+	if (!a5xx_gpu->per_instance_tables)
+		return 0;
+
+	ptr = msm_gem_kernel_new(gpu->dev, sizeof(struct a5xx_smmu_info),
+		MSM_BO_UNCACHED, gpu->aspace, &bo, &iova);
+
+	if (IS_ERR(ptr))
+		return PTR_ERR(ptr);
+
+	ptr->magic = A5XX_SMMU_INFO_MAGIC;
+
+	a5xx_gpu->smmu_info_bo = bo;
+	a5xx_gpu->smmu_info_iova = iova;
+	a5xx_gpu->smmu_info = ptr;
+
+	return 0;
 }
 
 void a5xx_preempt_init(struct msm_gpu *gpu)
@@ -284,17 +323,22 @@ void a5xx_preempt_init(struct msm_gpu *gpu)
 		return;
 
 	for (i = 0; i < gpu->nr_rings; i++) {
-		if (preempt_init_ring(a5xx_gpu, gpu->rb[i])) {
-			/*
-			 * On any failure our adventure is over. Clean up and
-			 * set nr_rings to 1 to force preemption off
-			 */
-			a5xx_preempt_fini(gpu);
-			gpu->nr_rings = 1;
-
-			return;
-		}
+		if (preempt_init_ring(a5xx_gpu, gpu->rb[i]))
+			goto fail;
 	}
 
-	timer_setup(&a5xx_gpu->preempt_timer, a5xx_preempt_timer, 0);
+	if (a5xx_smmu_info_init(gpu))
+		goto fail;
+
+	timer_setup(&a5xx_gpu->preempt_timer, a5xx_preempt_timer,
+		(unsigned long) a5xx_gpu);
+
+	return;
+fail:
+	/*
+	 * On any failure our adventure is over. Clean up and
+	 * set nr_rings to 1 to force preemption off
+	 */
+	a5xx_preempt_fini(gpu);
+	gpu->nr_rings = 1;
 }
-- 
2.7.4

