Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8568A616B45
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 18:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbiKBRy5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 13:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbiKBRyy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 13:54:54 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6742D2EF1F
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 10:54:53 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id f37so29451717lfv.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 10:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGs3xdkj5R322xMg8tXB2/8CS2Bz563Uq9iq+lvKvak=;
        b=cNNTYXRArKL9XTTBhlipyq5PeqREVBhxNAbCpjeW8mRPx8Mw+WZjtyld6abTAOBYsB
         33ekkNqNxnNVINJTq4MwV8zSyulbs5kB4iXwkxkeItXMIVlYz9/KvARze2IJdht2b7y+
         09/q/hn+0UnOwNoAe7g1qcQQQoMb7EeMK0CLRJxZJxmTpK3B2YTGa3hGMjTXzibtLVMS
         Ev9E06w9qm2CarHVOrk/vVAYnd7L2sxK7Y8rmIfNqVJgJ7XM6GA83g5AWimJBpZ3Yv/5
         isk8aZyu+53PCUE5/fijzuRO8Yj7K3wuC/JEaszgnzVDa96p+Cm3p20DaMLBo1TpYI3x
         QCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGs3xdkj5R322xMg8tXB2/8CS2Bz563Uq9iq+lvKvak=;
        b=uk4Ybrwz/R8kN75RH/Wjo1xTGLLaIiq6YcdC2Dq28awF9ePiK6AhJSaIr3IkJJFswA
         iUEe+fGmLi6uolAy6OqDPD2ebBHc30ZXPl7Fovrf7UFJ+4RXSGFdJH3RefsbhUGejX6C
         1LIFL34jMR3+YYb9UdCFs5eSUIzewEAkVdy+TkJm/NOoQkWXqCjKFGxxgf8g3ypF8uMB
         XPGey8D0hjxazTBMM92aFMXUdtiZqODBBHiNLyGLymXd1EplTjbcjQGUYEzc07V4+PO1
         4NqoeugR3/GC8QVZM6js4bucINhBzTXaxCKJdv/zvTxOysi+o2SIMlUYTQZHTw7wYaa/
         cZCg==
X-Gm-Message-State: ACrzQf2w5aMREDtWo4yg6iGcHs4vOEKasaglOhACFjBXNOoI06npKHID
        2O/9E22vwk4LOKJBqjFS//evzg==
X-Google-Smtp-Source: AMsMyM7Frc3ydcKsmOwTCndNBhm/J9S03SvyZqC5rgkbLmvhWMjLazDSV8UzDY8ylW0/0Q4OjR4+bQ==
X-Received: by 2002:ac2:5469:0:b0:4a2:6e4c:35da with SMTP id e9-20020ac25469000000b004a26e4c35damr10595937lfn.191.1667411691704;
        Wed, 02 Nov 2022 10:54:51 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d3-20020a056512368300b00492c663bba2sm2087625lfs.124.2022.11.02.10.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 10:54:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 2/2] drm/msm: remove duplicated code from a6xx_create_address_space
Date:   Wed,  2 Nov 2022 20:54:49 +0300
Message-Id: <20221102175449.452283-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102175449.452283-1-dmitry.baryshkov@linaro.org>
References: <20221102175449.452283-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 28 +------------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 12 +++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  7 ++++++-
 6 files changed, 20 insertions(+), 33 deletions(-)

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
index db4b3a48c708..e87196457b9a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1786,10 +1786,6 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	struct iommu_domain_geometry *geometry;
-	struct msm_mmu *mmu;
-	struct msm_gem_address_space *aspace;
-	u64 start, size;
 	unsigned long quirks = 0;
 
 	/*
@@ -1799,29 +1795,7 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
 		quirks |= IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
 
-	mmu = msm_iommu_new(&pdev->dev, quirks);
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
+	return adreno_iommu_create_address_space(gpu, pdev, quirks);
 }
 
 static struct msm_gem_address_space *
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 12d0497f57e1..12a964dc3b8d 100644
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
 	struct iommu_domain_geometry *geometry;
 	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
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

