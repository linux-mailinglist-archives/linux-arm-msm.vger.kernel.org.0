Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3D0A2E6BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 22:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfE2Uzp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 16:55:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58108 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbfE2Uzn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 16:55:43 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1993861795; Wed, 29 May 2019 20:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163341;
        bh=YSKIV6DFCr7JB08CB8IZHjgCrJtdnzcRYTSNMf5lgv8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fbvQjTnihQExgjwE53rY+mjWvZ9cz464+UmqWCjHukvj8PfK7b3608wy3zx2bpOLY
         +3OJAiw1ncx1qDztVtZoG+W60lekuPzYd55vy0fQXocSbitfx3Ode3oucvZTnD3Jwi
         mjQF+KVyWCHCqRAiHD5erFZEV1t/0+cE1r1+6fIo=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3633861795;
        Wed, 29 May 2019 20:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163337;
        bh=YSKIV6DFCr7JB08CB8IZHjgCrJtdnzcRYTSNMf5lgv8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mMU42Z0DjK6EOxT6wrMdqw+wv2PtWTVYWimS1JK4Y3L3YyDahGZi613pFXaDzYkjh
         BsCNhDXg1+HB1v+OX1QcEzQNm+hUH8XopPOfmfzTxyoZgsU2j65UVZz7q/dXZrhV7H
         CTXlx8x0xohDeYKssgM42RHb2zE7vYBHuUncYlzY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3633861795
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        Sean Paul <sean@poorly.run>, Kees Cook <keescook@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Jonathan Marek <jonathan@marek.ca>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 10/16] drm/msm/gpu: Move address space setup to the GPU targets
Date:   Wed, 29 May 2019 14:54:46 -0600
Message-Id: <1559163292-4792-11-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
References: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the address space steup code out of the generic msm GPU code to
to the individual GPU targets. This allows us to do target specific
setup such as gpummu for a2xx or split pagetables and per-instance
pagetables for newer a5xx and a6xx targets. All this is at the
expense of duplicated code in some of the target files but I think
it pays for itself in improved code flow and flexibility.

v3: change NULl return to ERR_PTR in address space create functions
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c   | 37 ++++++++++++++++------
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   | 50 ++++++++++++++++++++++--------
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   | 51 +++++++++++++++++++++++--------
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 37 +++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 37 +++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  7 -----
 drivers/gpu/drm/msm/msm_gem.h           |  1 +
 drivers/gpu/drm/msm/msm_gpu.c           | 54 ++-------------------------------
 drivers/gpu/drm/msm/msm_gpu.h           |  2 ++
 9 files changed, 173 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 1f83bc1..49241d0 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -401,6 +401,30 @@ static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu)
 	return state;
 }
 
+static struct msm_gem_address_space *
+a2xx_create_address_space(struct msm_gpu *gpu)
+{
+	struct msm_gem_address_space *aspace;
+	int ret;
+
+	aspace = msm_gem_address_space_create_a2xx(&gpu->pdev->dev, gpu,
+		"gpu", SZ_16M, SZ_16M + 0xff * SZ_64K);
+	if (IS_ERR(aspace)) {
+		DRM_DEV_ERROR(gpu->dev->dev,
+			"No memory protection without MMU\n");
+		return ERR_PTR(-ENXIO);
+	}
+
+	ret = aspace->mmu->funcs->attach(aspace->mmu, NULL, 0);
+	if (ret) {
+		msm_gem_address_space_put(aspace);
+		return ERR_PTR(ret);
+	}
+
+	return aspace;
+}
+
+
 /* Register offset defines for A2XX - copy of A3XX */
 static const unsigned int a2xx_register_offsets[REG_ADRENO_REGISTER_MAX] = {
 	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_BASE, REG_AXXX_CP_RB_BASE),
@@ -429,6 +453,7 @@ static const struct adreno_gpu_funcs funcs = {
 #endif
 		.gpu_state_get = a2xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
+		.create_address_space = a2xx_create_address_space,
 	},
 };
 
@@ -473,16 +498,8 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->reg_offsets = a2xx_register_offsets;
 
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
-	if (ret)
-		goto fail;
-
-	if (!gpu->aspace) {
-		dev_err(dev->dev, "No memory protection without MMU\n");
-		ret = -ENXIO;
-		goto fail;
-	}
-
-	return gpu;
+	if (!ret)
+		return gpu;
 
 fail:
 	if (a2xx_gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index c3b4bc6..33ab5e8 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -21,6 +21,7 @@
 #  include <mach/ocmem.h>
 #endif
 
+#include "msm_gem.h"
 #include "a3xx_gpu.h"
 
 #define A3XX_INT0_MASK \
@@ -433,6 +434,41 @@ static struct msm_gpu_state *a3xx_gpu_state_get(struct msm_gpu *gpu)
 	return state;
 }
 
+static struct msm_gem_address_space *
+a3xx_create_address_space(struct msm_gpu *gpu)
+{
+	struct msm_gem_address_space *aspace;
+	struct iommu_domain *iommu;
+	int ret;
+
+	iommu = iommu_domain_alloc(&platform_bus_type);
+	if (!iommu) {
+		DRM_DEV_ERROR(gpu->dev->dev,
+			"No memory protection without IOMMU\n");
+		return ERR_PTR(-ENXIO);
+	}
+
+	iommu->geometry.aperture_start = SZ_16M;
+	iommu->geometry.aperture_end = 0xffffffff;
+
+	aspace = msm_gem_address_space_create(&gpu->pdev->dev, iommu, "gpu");
+	if (IS_ERR(aspace)) {
+		iommu_domain_free(iommu);
+		DRM_DEV_ERROR(gpu->dev->dev, "failed to init mmu: %ld\n",
+			PTR_ERR(aspace));
+		return aspace;
+	}
+
+	ret = aspace->mmu->funcs->attach(aspace->mmu, NULL, 0);
+	if (ret) {
+		msm_gem_address_space_put(aspace);
+		return ERR_PTR(ret);
+	}
+
+	return aspace;
+}
+
+
 /* Register offset defines for A3XX */
 static const unsigned int a3xx_register_offsets[REG_ADRENO_REGISTER_MAX] = {
 	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_BASE, REG_AXXX_CP_RB_BASE),
@@ -461,6 +497,7 @@ static const struct adreno_gpu_funcs funcs = {
 #endif
 		.gpu_state_get = a3xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
+		.create_address_space = a3xx_create_address_space,
 	},
 };
 
@@ -520,19 +557,6 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 #endif
 	}
 
-	if (!gpu->aspace) {
-		/* TODO we think it is possible to configure the GPU to
-		 * restrict access to VRAM carveout.  But the required
-		 * registers are unknown.  For now just bail out and
-		 * limp along with just modesetting.  If it turns out
-		 * to not be possible to restrict access, then we must
-		 * implement a cmdstream validator.
-		 */
-		DRM_DEV_ERROR(dev->dev, "No memory protection without IOMMU\n");
-		ret = -ENXIO;
-		goto fail;
-	}
-
 	return gpu;
 
 fail:
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 18f9a8e..08a5729 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -15,6 +15,8 @@
 #  include <soc/qcom/ocmem.h>
 #endif
 
+#include "msm_gem.h"
+
 #define A4XX_INT0_MASK \
 	(A4XX_INT0_RBBM_AHB_ERROR |        \
 	 A4XX_INT0_RBBM_ATB_BUS_OVERFLOW | \
@@ -530,6 +532,41 @@ static int a4xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	return 0;
 }
 
+static struct msm_gem_address_space *
+a4xx_create_address_space(struct msm_gpu *gpu)
+{
+	struct msm_gem_address_space *aspace;
+	struct iommu_domain *iommu;
+	int ret;
+
+	iommu = iommu_domain_alloc(&platform_bus_type);
+	if (!iommu) {
+		DRM_DEV_ERROR(gpu->dev->dev,
+			"No memory protection without IOMMU\n");
+		return ERR_PTR(-ENXIO);
+	}
+
+	iommu->geometry.aperture_start = SZ_16M;
+	iommu->geometry.aperture_end = 0xffffffff;
+
+	aspace = msm_gem_address_space_create(&gpu->pdev->dev, iommu, "gpu");
+	if (IS_ERR(aspace)) {
+		iommu_domain_free(iommu);
+		DRM_DEV_ERROR(gpu->dev->dev, "failed to init mmu: %ld\n",
+			PTR_ERR(aspace));
+		return aspace;
+	}
+
+	ret = aspace->mmu->funcs->attach(aspace->mmu, NULL, 0);
+	if (ret) {
+		msm_gem_address_space_put(aspace);
+		return ERR_PTR(ret);
+	}
+
+	return aspace;
+}
+
+
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -547,6 +584,7 @@ static const struct adreno_gpu_funcs funcs = {
 #endif
 		.gpu_state_get = a4xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
+		.create_address_space = a4xx_create_address_space,
 	},
 	.get_timestamp = a4xx_get_timestamp,
 };
@@ -600,19 +638,6 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 #endif
 	}
 
-	if (!gpu->aspace) {
-		/* TODO we think it is possible to configure the GPU to
-		 * restrict access to VRAM carveout.  But the required
-		 * registers are unknown.  For now just bail out and
-		 * limp along with just modesetting.  If it turns out
-		 * to not be possible to restrict access, then we must
-		 * implement a cmdstream validator.
-		 */
-		DRM_DEV_ERROR(dev->dev, "No memory protection without IOMMU\n");
-		ret = -ENXIO;
-		goto fail;
-	}
-
 	return gpu;
 
 fail:
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 43a2b4a..2f87c3e 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1349,6 +1349,38 @@ static unsigned long a5xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }
 
+static struct msm_gem_address_space *
+a5xx_create_address_space(struct msm_gpu *gpu)
+{
+	struct msm_gem_address_space *aspace;
+	struct iommu_domain *iommu;
+	int ret;
+
+	iommu = iommu_domain_alloc(&platform_bus_type);
+	if (!iommu)
+		return ERR_PTR(-ENXIO);
+
+	iommu->geometry.aperture_start = 0x100000000ULL;
+	iommu->geometry.aperture_end = 0x1ffffffffULL;
+
+	aspace = msm_gem_address_space_create(&gpu->pdev->dev, iommu, "gpu");
+	if (IS_ERR(aspace)) {
+		iommu_domain_free(iommu);
+		DRM_DEV_ERROR(gpu->dev->dev, "failed to init mmu: %ld\n",
+			PTR_ERR(aspace));
+		return aspace;
+	}
+
+	ret = aspace->mmu->funcs->attach(aspace->mmu, NULL, 0);
+	if (ret) {
+		msm_gem_address_space_put(aspace);
+		return ERR_PTR(ret);
+	}
+
+	msm_mmu_set_fault_handler(aspace->mmu, gpu, a5xx_fault_handler);
+	return aspace;
+}
+
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -1370,6 +1402,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_busy = a5xx_gpu_busy,
 		.gpu_state_get = a5xx_gpu_state_get,
 		.gpu_state_put = a5xx_gpu_state_put,
+		.create_address_space = a5xx_create_address_space,
 	},
 	.get_timestamp = a5xx_get_timestamp,
 };
@@ -1416,7 +1449,6 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 
 	adreno_gpu->registers = a5xx_registers;
 	adreno_gpu->reg_offsets = a5xx_register_offsets;
-
 	a5xx_gpu->lm_leakage = 0x4E001A;
 
 	check_speed_bin(&pdev->dev);
@@ -1427,9 +1459,6 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	if (gpu->aspace)
-		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu, a5xx_fault_handler);
-
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
 	a5xx_preempt_init(gpu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index be39cf0..3d70588 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -810,6 +810,38 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }
 
+static struct msm_gem_address_space *
+a6xx_create_address_space(struct msm_gpu *gpu)
+{
+	struct msm_gem_address_space *aspace;
+	struct iommu_domain *iommu;
+	int ret;
+
+	iommu = iommu_domain_alloc(&platform_bus_type);
+	if (!iommu)
+		return ERR_PTR(-ENXIO);
+
+	iommu->geometry.aperture_start = 0x100000000ULL;
+	iommu->geometry.aperture_end = 0x1ffffffffULL;
+
+	aspace = msm_gem_address_space_create(&gpu->pdev->dev, iommu, "gpu");
+	if (IS_ERR(aspace)) {
+		iommu_domain_free(iommu);
+		DRM_DEV_ERROR(gpu->dev->dev, "failed to init mmu: %ld\n",
+			PTR_ERR(aspace));
+		return aspace;
+	}
+
+	ret = aspace->mmu->funcs->attach(aspace->mmu, NULL, 0);
+	if (ret) {
+		msm_gem_address_space_put(aspace);
+		return ERR_PTR(ret);
+	}
+
+	msm_mmu_set_fault_handler(aspace->mmu, gpu, a6xx_fault_handler);
+	return aspace;
+}
+
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -832,6 +864,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_state_get = a6xx_gpu_state_get,
 		.gpu_state_put = a6xx_gpu_state_put,
 #endif
+		.create_address_space = a6xx_create_address_space,
 	},
 	.get_timestamp = a6xx_get_timestamp,
 };
@@ -874,9 +907,5 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	if (gpu->aspace)
-		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
-				a6xx_fault_handler);
-
 	return gpu;
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 6f7f411..3ba7141 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -912,13 +912,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	adreno_gpu->rev = config->rev;
 
 	adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
-
-	adreno_gpu_config.va_start = SZ_16M;
-	adreno_gpu_config.va_end = 0xffffffff;
-	/* maximum range of a2xx mmu */
-	if (adreno_is_a2xx(adreno_gpu))
-		adreno_gpu_config.va_end = SZ_16M + 0xfff * SZ_64K;
-
 	adreno_gpu_config.nr_rings = nr_rings;
 
 	adreno_get_pwrlevels(&pdev->dev, gpu);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 36aeb58..fd67153 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -21,6 +21,7 @@
 #include <linux/kref.h>
 #include <linux/reservation.h>
 #include "msm_drv.h"
+#include "msm_mmu.h"
 
 /* Additional internal-use only BO flags: */
 #define MSM_BO_STOLEN        0x10000000    /* try to use stolen/splash memory */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0a4c77f..e8a14b0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -20,7 +20,6 @@
 #include "msm_mmu.h"
 #include "msm_fence.h"
 #include "msm_gpu_trace.h"
-#include "adreno/adreno_gpu.h"
 
 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>
@@ -812,51 +811,6 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 	return 0;
 }
 
-static struct msm_gem_address_space *
-msm_gpu_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev,
-		uint64_t va_start, uint64_t va_end)
-{
-	struct msm_gem_address_space *aspace;
-	int ret;
-
-	/*
-	 * Setup IOMMU.. eventually we will (I think) do this once per context
-	 * and have separate page tables per context.  For now, to keep things
-	 * simple and to get something working, just use a single address space:
-	 */
-	if (!adreno_is_a2xx(to_adreno_gpu(gpu))) {
-		struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
-		if (!iommu)
-			return NULL;
-
-		iommu->geometry.aperture_start = va_start;
-		iommu->geometry.aperture_end = va_end;
-
-		DRM_DEV_INFO(gpu->dev->dev, "%s: using IOMMU\n", gpu->name);
-
-		aspace = msm_gem_address_space_create(&pdev->dev, iommu, "gpu");
-		if (IS_ERR(aspace))
-			iommu_domain_free(iommu);
-	} else {
-		aspace = msm_gem_address_space_create_a2xx(&pdev->dev, gpu, "gpu",
-			va_start, va_end);
-	}
-
-	if (IS_ERR(aspace)) {
-		DRM_DEV_ERROR(gpu->dev->dev, "failed to init mmu: %ld\n",
-			PTR_ERR(aspace));
-		return ERR_CAST(aspace);
-	}
-
-	ret = aspace->mmu->funcs->attach(aspace->mmu, NULL, 0);
-	if (ret) {
-		msm_gem_address_space_put(aspace);
-		return ERR_PTR(ret);
-	}
-
-	return aspace;
-}
-
 int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
 		const char *name, struct msm_gpu_config *config)
@@ -929,12 +883,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	msm_devfreq_init(gpu);
 
-	gpu->aspace = msm_gpu_create_address_space(gpu, pdev,
-		config->va_start, config->va_end);
-
-	if (gpu->aspace == NULL)
-		DRM_DEV_INFO(drm->dev, "%s: no IOMMU, fallback to VRAM carveout!\n", name);
-	else if (IS_ERR(gpu->aspace)) {
+	gpu->aspace = gpu->funcs->create_address_space(gpu);
+	if (IS_ERR(gpu->aspace)) {
 		ret = PTR_ERR(gpu->aspace);
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index f2739cd..d4bf051 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -75,6 +75,8 @@ struct msm_gpu_funcs {
 	int (*gpu_state_put)(struct msm_gpu_state *state);
 	unsigned long (*gpu_get_freq)(struct msm_gpu *gpu);
 	void (*gpu_set_freq)(struct msm_gpu *gpu, unsigned long freq);
+	struct msm_gem_address_space *(*create_address_space)
+		(struct msm_gpu *gpu);
 };
 
 struct msm_gpu {
-- 
2.7.4

