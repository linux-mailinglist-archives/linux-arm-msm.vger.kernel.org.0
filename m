Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1D5360D522
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 22:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232619AbiJYUEE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 16:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbiJYUED (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 16:04:03 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E0D511A975
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 13:04:02 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id g12so13751995lfh.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 13:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6sgvA89XRuT9/+Lwc8dFz7W8A20XzGs3i9BHbbAe+k=;
        b=wdyUg2+rxP2jmAEjxdVJHKd9sO3VBCtUT58uvo51Dvclr6q3B3uhtZxuJMzGuVGEqQ
         /1vE3N+1kFMi70sxXUGQwjgAN8IISn8YZQynehhMzB+hRRo+AgysbppVLpmqwmrN2rX8
         xbrpdI5z9mk7sYLgbWinjrdgJk0jnEX/xAVoOAgOoaLASzFWcLBOXuQ5J1FyitJOh3zt
         +LGbWlOcLw9rPkgBcrrkTj6mSKFBX1hFqq+D0JC1Q28w+MjavNzJLXTEvuUThILoJrNV
         Pjb3+FG9IRTrrKma91qi3HD4fY3F+fUAcMSlyT5ZzPvy04INRp2LgrtvthUFt+oAB1hl
         C8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6sgvA89XRuT9/+Lwc8dFz7W8A20XzGs3i9BHbbAe+k=;
        b=KE3JZx0l1Qs7HhVPbxeil6tQe8HcQHYDo7C6S6la7srrJ9BvDQ58/vKaEv8lMxSZLp
         Sw4b+dSHk2/rv48CpKgyfard1Ka6H1yOGP43lf5KFw3yr6uDUGZ2tio1vhqNPEqm1bmr
         TbDxSyMYqj3d7xMliSzZcILJ0uQqkhfEjfCX19rpsM8N8BGZ75d2xTWhtVkJ16ZWvbRo
         aSGvYfnVJdE7RBxJsXFZiY3/i2RCxrsPkAX9x5wFdcKQBXgHXSo/WVZ2bKGtUTipYZ6l
         iej+teOH6mjSSZtWVVwoxbKq1mQqmzRHZlGu75L4CXBsw8gl52VoR2t5KPD7AJJJ4sXo
         a5Dg==
X-Gm-Message-State: ACrzQf17l/qEa44F9BzGbpESXe0loeqp899upuxfYDISTTKqx+ZKHbif
        vl8eSvon/zAz+wv/hBZoWCZGAA==
X-Google-Smtp-Source: AMsMyM7wvE2afhzHDfYk2EvbvB1DX7/77jyvcb8NS+hFxWvkUzbnB//HM67U0CBlPBxzpRRhw+puGA==
X-Received: by 2002:ac2:4bc7:0:b0:4a4:6eb6:8da4 with SMTP id o7-20020ac24bc7000000b004a46eb68da4mr15097412lfq.84.1666728240768;
        Tue, 25 Oct 2022 13:04:00 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id e6-20020a195006000000b00494a1e875a9sm550644lfb.191.2022.10.25.13.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 13:04:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/msm: remove duplicated code from a6xx_create_address_space
Date:   Tue, 25 Oct 2022 23:03:57 +0300
Message-Id: <20221025200357.3637161-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221025200357.3637161-1-dmitry.baryshkov@linaro.org>
References: <20221025200357.3637161-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The function a6xx_create_address_space() is mostly a copy of
adreno_iommu_create_address_space() with added quirk setting. Rework
these two functions to be a thin wrappers around a common helper.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 29 +------------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 12 ++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  7 +++++-
 6 files changed, 20 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 2c8b9899625b..948785ed07bb 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -500,7 +500,7 @@ static const struct adreno_gpu_funcs funcs = {
 #endif
 		.gpu_state_get = a3xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
-		.create_address_space = adreno_iommu_create_address_space,
+		.create_address_space = adreno_create_address_space,
 		.get_rptr = a3xx_get_rptr,
 	},
 };
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 7cb8d9849c07..2fb32d5552c4 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -635,7 +635,7 @@ static const struct adreno_gpu_funcs funcs = {
 #endif
 		.gpu_state_get = a4xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
-		.create_address_space = adreno_iommu_create_address_space,
+		.create_address_space = adreno_create_address_space,
 		.get_rptr = a4xx_get_rptr,
 	},
 	.get_timestamp = a4xx_get_timestamp,
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 3dcec7acb384..3c537c0016fa 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1705,7 +1705,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_busy = a5xx_gpu_busy,
 		.gpu_state_get = a5xx_gpu_state_get,
 		.gpu_state_put = a5xx_gpu_state_put,
-		.create_address_space = adreno_iommu_create_address_space,
+		.create_address_space = adreno_create_address_space,
 		.get_rptr = a5xx_get_rptr,
 	},
 	.get_timestamp = a5xx_get_timestamp,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7a1b4397b842..2daba2029db1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1784,38 +1784,11 @@ static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 static struct msm_gem_address_space *
 a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 {
-	struct msm_mmu *mmu;
-	struct msm_gem_address_space *aspace;
-	struct iommu_domain_geometry *geometry;
-	u64 start, size;
-
 	/*
 	 * This allows GPU to set the bus attributes required to use system
 	 * cache on behalf of the iommu page table walker.
 	 */
-	mmu = msm_iommu_new(&pdev->dev, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
-	if (IS_ERR_OR_NULL(mmu))
-		return ERR_CAST(mmu);
-
-	geometry = msm_iommu_get_geometry(mmu);
-	if (IS_ERR(geometry))
-		return ERR_CAST(geometry);
-
-	/*
-	 * Use the aperture start or SZ_16M, whichever is greater. This will
-	 * ensure that we align with the allocated pagetable range while still
-	 * allowing room in the lower 32 bits for GMEM and whatnot
-	 */
-	start = max_t(u64, SZ_16M, geometry->aperture_start);
-	size = geometry->aperture_end - start + 1;
-
-	aspace = msm_gem_address_space_create(mmu, "gpu",
-		start & GENMASK_ULL(48, 0), size);
-
-	if (IS_ERR(aspace) && !IS_ERR(mmu))
-		mmu->funcs->destroy(mmu);
-
-	return aspace;
+	return adreno_iommu_create_address_space(gpu, pdev, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
 }
 
 static struct msm_gem_address_space *
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5808911899c7..822a60c5b6b1 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -191,16 +191,24 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
 }
 
+struct msm_gem_address_space *
+adreno_create_address_space(struct msm_gpu *gpu,
+			    struct platform_device *pdev)
+{
+	return adreno_iommu_create_address_space(gpu, pdev, 0);
+}
+
 struct msm_gem_address_space *
 adreno_iommu_create_address_space(struct msm_gpu *gpu,
-		struct platform_device *pdev)
+				  struct platform_device *pdev,
+				  unsigned long quirks)
 {
 	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
 	struct iommu_domain_geometry *geometry;
 	u64 start, size;
 
-	mmu = msm_iommu_new(&pdev->dev, 0);
+	mmu = msm_iommu_new(&pdev->dev, quirks);
 	if (IS_ERR_OR_NULL(mmu))
 		return ERR_CAST(mmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 707273339969..5d4b1c95033f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -335,8 +335,13 @@ void adreno_show_object(struct drm_printer *p, void **ptr, int len,
  * attached targets
  */
 struct msm_gem_address_space *
+adreno_create_address_space(struct msm_gpu *gpu,
+			    struct platform_device *pdev);
+
+struct msm_gem_address_space *
 adreno_iommu_create_address_space(struct msm_gpu *gpu,
-		struct platform_device *pdev);
+				  struct platform_device *pdev,
+				  unsigned long quirks);
 
 int adreno_read_speedbin(struct device *dev, u32 *speedbin);
 
-- 
2.35.1

