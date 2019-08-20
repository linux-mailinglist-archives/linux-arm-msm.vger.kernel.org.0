Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81520968FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 21:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730739AbfHTTGy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 15:06:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46430 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730731AbfHTTGx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 15:06:53 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1DB39613A7; Tue, 20 Aug 2019 19:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566328012;
        bh=gpp/EGoRwhbdqjjcbCs1y2zrh/0RF0f4+kowfzln/4k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MXojKpq1HSAZgVaq0ldQBXSB0nwYtcIoVwv14ymBVZMUWYdsBho/cja22eQgj1VKc
         bAQLYNb9sShHozudnBu/yifj1R3GstpXx+bS36gyqyvd1Ecgqfu0vLxeyBN7n/9h17
         c5uY/Rl5KMxMapt6Tr9P8vnQk9YnOS1VtFzAZ59c=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A1DA611FD;
        Tue, 20 Aug 2019 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566328008;
        bh=gpp/EGoRwhbdqjjcbCs1y2zrh/0RF0f4+kowfzln/4k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=me4plxyT/w3phpb+180hkMp5Xb51ylNPkvGgBKfh8VII/wNrSCdJalHPRE6T1W6Yk
         SoDDPD0az0xDQWEKXVlwQplbRO1qiQBoYzXXoPuO1jWizSas2osxwuTrS4pJe91T7X
         huivYqWMf7KOM4NpBDS1alVkOyXaPxQumkVGrlrY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9A1DA611FD
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Wen Yang <wen.yang99@zte.com.cn>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Allison Randal <allison@lohutok.net>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 7/7] drm/msm: Use per-target functions to set up address spaces
Date:   Tue, 20 Aug 2019 13:06:32 -0600
Message-Id: <1566327992-362-8-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use a per-target function to set up the default address space for
each GPU. This allows a6xx targets to set up the correct address
range if split pagetables are enabled by the IOMMU device. This
also gets rid of a misplaced bit of a2xx code in msm_gpu
and returns it to where it belongs.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c   | 28 +++++++++++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   |  1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 56 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 43 +++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 +++
 drivers/gpu/drm/msm/msm_gpu.c           | 56 ++-------------------------------
 drivers/gpu/drm/msm/msm_gpu.h           |  4 +--
 9 files changed, 134 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 1f83bc1..c9c032e 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -401,6 +401,33 @@ static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu)
 	return state;
 }
 
+static struct msm_gem_address_space *
+a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
+{
+	struct msm_gem_address_space *aspace;
+	struct msm_mmu *mmu = msm_gpummu_new(&pdev->dev, gpu);
+	int ret;
+
+	if (IS_ERR(mmu))
+		return ERR_CAST(mmu);
+
+	ret = mmu->funcs->attach(mmu, NULL, 0);
+	if (ret) {
+		mmu->funcs->destroy(mmu);
+		return ERR_PTR(ret);
+	}
+
+	aspace = msm_gem_address_space_create(mmu, "gpu",
+		SZ_16M, SZ_16M + 0xfff * SZ_64K);
+
+	if (IS_ERR(aspace)) {
+		mmu->funcs->detach(mmu, NULL, 0);
+		mmu->funcs->destroy(mmu);
+	}
+
+	return aspace;
+}
+
 /* Register offset defines for A2XX - copy of A3XX */
 static const unsigned int a2xx_register_offsets[REG_ADRENO_REGISTER_MAX] = {
 	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_BASE, REG_AXXX_CP_RB_BASE),
@@ -429,6 +456,7 @@ static const struct adreno_gpu_funcs funcs = {
 #endif
 		.gpu_state_get = a2xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
+		.create_address_space = a2xx_create_address_space,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 5f7e980..f24dc21 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -448,6 +448,7 @@ static const struct adreno_gpu_funcs funcs = {
 #endif
 		.gpu_state_get = a3xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
+		.create_address_space = adreno_gpu_create_address_space,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index ab2b752..08f4292 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -538,6 +538,7 @@ static const struct adreno_gpu_funcs funcs = {
 #endif
 		.gpu_state_get = a4xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
+		.create_address_space = adreno_gpu_create_address_space,
 	},
 	.get_timestamp = a4xx_get_timestamp,
 };
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 1671db4..e29fea5 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1385,6 +1385,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_busy = a5xx_gpu_busy,
 		.gpu_state_get = a5xx_gpu_state_get,
 		.gpu_state_put = a5xx_gpu_state_put,
+		.create_address_space = adreno_gpu_create_address_space,
 	},
 	.get_timestamp = a5xx_get_timestamp,
 };
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index be39cf0..3092426 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -810,6 +810,61 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }
 
+static struct msm_gem_address_space *
+a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
+{
+	struct msm_gem_address_space *aspace;
+	struct iommu_domain *iommu;
+	struct msm_mmu *mmu;
+	int ret, val = 0;
+	u64 start, end;
+
+	iommu = iommu_domain_alloc(&platform_bus_type);
+	if (!iommu)
+		return NULL;
+
+	mmu = msm_iommu_new(&pdev->dev, iommu);
+	if (IS_ERR(mmu)) {
+		iommu_domain_free(iommu);
+		return ERR_CAST(mmu);
+	}
+
+	ret = mmu->funcs->attach(mmu, NULL, 0);
+	if (ret) {
+		mmu->funcs->destroy(mmu);
+		return ERR_PTR(ret);
+	}
+
+	iommu_domain_get_attr(iommu, DOMAIN_ATTR_SPLIT_TABLES, &val);
+
+	/*
+	 * If split pagetables are enabled our virtual address range will start
+	 * at 0xfff0000000000000 and we don't need to worry about a hole for the
+	 * GMEM.
+	 */
+	if (val)
+		start = iommu->geometry.aperture_start;
+	else
+		start = SZ_16M;
+
+	/*
+	 * Regardless of the start, always take advantage of the entire
+	 * available space
+	 */
+	end = iommu->geometry.aperture_end;
+
+	DRM_DEV_INFO(gpu->dev->dev, "%s: using IOMMU\n", gpu->name);
+
+	aspace = msm_gem_address_space_create(mmu, "gpu", start, end);
+	if (IS_ERR(aspace)) {
+		mmu->funcs->detach(mmu, NULL, 0);
+		mmu->funcs->destroy(mmu);
+	}
+
+	return aspace;
+}
+
+
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -832,6 +887,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_state_get = a6xx_gpu_state_get,
 		.gpu_state_put = a6xx_gpu_state_put,
 #endif
+		.create_address_space = a6xx_create_address_space,
 	},
 	.get_timestamp = a6xx_get_timestamp,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 9acbbc0..6edcd2c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -18,6 +18,43 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+/* Helper function for GPU targets that use arm-smmu but not split pagetables */
+struct msm_gem_address_space *
+adreno_gpu_create_address_space(struct msm_gpu *gpu,
+		struct platform_device *pdev)
+{
+	struct msm_gem_address_space *aspace;
+	struct iommu_domain *iommu;
+	struct msm_mmu *mmu;
+	int ret;
+
+	iommu = iommu_domain_alloc(&platform_bus_type);
+	if (!iommu)
+		return NULL;
+
+	mmu = msm_iommu_new(&pdev->dev, iommu);
+	if (IS_ERR(mmu)) {
+		iommu_domain_free(iommu);
+		return ERR_CAST(mmu);
+	}
+
+	ret = mmu->funcs->attach(mmu, NULL, 0);
+	if (ret) {
+		mmu->funcs->destroy(mmu);
+		return ERR_PTR(ret);
+	}
+
+	DRM_DEV_INFO(gpu->dev->dev, "%s: using IOMMU\n", gpu->name);
+
+	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M, 0xffffffff);
+	if (IS_ERR(aspace)) {
+		mmu->funcs->detach(mmu, NULL, 0);
+		mmu->funcs->destroy(mmu);
+	}
+
+	return aspace;
+}
+
 static bool zap_available = true;
 
 static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
@@ -908,12 +945,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
 
-	adreno_gpu_config.va_start = SZ_16M;
-	adreno_gpu_config.va_end = 0xffffffff;
-	/* maximum range of a2xx mmu */
-	if (adreno_is_a2xx(adreno_gpu))
-		adreno_gpu_config.va_end = SZ_16M + 0xfff * SZ_64K;
-
 	adreno_gpu_config.nr_rings = nr_rings;
 
 	adreno_get_pwrlevels(&pdev->dev, gpu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c7441fb..141ff3a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -247,6 +247,11 @@ void adreno_gpu_state_destroy(struct msm_gpu_state *state);
 int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state);
 int adreno_gpu_state_put(struct msm_gpu_state *state);
 
+
+struct msm_gem_address_space *
+adreno_gpu_create_address_space(struct msm_gpu *gpu,
+		struct platform_device *pdev);
+
 /*
  * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
  * out of secure mode
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 9271f39..5a36c3d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -9,7 +9,6 @@
 #include "msm_mmu.h"
 #include "msm_fence.h"
 #include "msm_gpu_trace.h"
-#include "adreno/adreno_gpu.h"
 
 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>
@@ -801,56 +800,6 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 	return 0;
 }
 
-static struct msm_gem_address_space *
-msm_gpu_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev,
-		uint64_t va_start, uint64_t va_end)
-{
-	struct msm_gem_address_space *aspace;
-	struct msm_mmu *mmu;
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
-		mmu = msm_iommu_new(&pdev->dev, iommu);
-		if (IS_ERR(mmu)) {
-			iommu_domain_free(iommu);
-			return ERR_CAST(mmu);
-		}
-
-		DRM_DEV_INFO(gpu->dev->dev, "%s: using IOMMU\n", gpu->name);
-
-	} else {
-		mmu = msm_gpummu_new(&pdev->dev, gpu);
-		if (IS_ERR(mmu))
-			return ERR_CAST(mmu);
-	}
-
-	aspace = msm_gem_address_space_create(mmu, "gpu", va_start, va_end);
-	if (IS_ERR(aspace)) {
-		mmu->funcs->destroy(mmu);
-
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
@@ -923,12 +872,13 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	msm_devfreq_init(gpu);
 
-	gpu->aspace = msm_gpu_create_address_space(gpu, pdev,
-		config->va_start, config->va_end);
+	gpu->aspace = funcs->create_address_space(gpu, pdev);
 
 	if (gpu->aspace == NULL)
 		DRM_DEV_INFO(drm->dev, "%s: no IOMMU, fallback to VRAM carveout!\n", name);
 	else if (IS_ERR(gpu->aspace)) {
+		DRM_DEV_ERROR(gpu->dev->dev, "failed to init mmu: %ld\n",
+			PTR_ERR(gpu->aspace));
 		ret = PTR_ERR(gpu->aspace);
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ab8f0f9c..41d86c2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -21,8 +21,6 @@ struct msm_gpu_state;
 
 struct msm_gpu_config {
 	const char *ioname;
-	uint64_t va_start;
-	uint64_t va_end;
 	unsigned int nr_rings;
 };
 
@@ -64,6 +62,8 @@ struct msm_gpu_funcs {
 	int (*gpu_state_put)(struct msm_gpu_state *state);
 	unsigned long (*gpu_get_freq)(struct msm_gpu *gpu);
 	void (*gpu_set_freq)(struct msm_gpu *gpu, unsigned long freq);
+	struct msm_gem_address_space *(*create_address_space)
+		(struct msm_gpu *gpu, struct platform_device *pdev);
 };
 
 struct msm_gpu {
-- 
2.7.4

