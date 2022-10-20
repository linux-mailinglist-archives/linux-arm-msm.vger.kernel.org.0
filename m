Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3DF16068E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 21:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiJTTcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Oct 2022 15:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiJTTcB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Oct 2022 15:32:01 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36CE202722
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 12:32:00 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id i17so800353lja.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 12:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uK2a3CldzNIRRMaqWYrmeMmnGxpuX490eqnTlz/whMk=;
        b=gn7RSbxXvh/wbP+BFkGo2xj6/HErlstNyfxHYnHdwXwb3ctWbWVd6cN/AQVjBOaX8F
         XhRZ+dVfymdr7HXoAIKUYI23MZTsMUaAYWAkM+Y90pte1zrxOZAXuD3UkaS5IAobNyj9
         lPgl2kSde4I8RaT04EimUGzxl5v6NCC3HkAa51g5AkQnZMhkmcxVjoKiebXt90kTbK8E
         La1YeaqqyzWaOOTMDE9j48WMUKVzfjAIV14guQ0GyZJgF6Zrqg0SGb6pteyV/6Ajg+/R
         pxS4VMyDLWjiefQx0x+2yAszOzYihFUv/jgr0138o3eDfx+jrano++L9BjTZk8VD9Yi3
         l4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uK2a3CldzNIRRMaqWYrmeMmnGxpuX490eqnTlz/whMk=;
        b=G3HVc20PQ2+L7h5aJ6MUb9ZFEYBrFPX7GWesR803D0Qna+RYrgfuIqQ1PAYEx6ULEI
         jJn96T9rjAGpKI8aALv5a/bmSuMZaqfWSfWAfQs7cJ6/ZySGLvT3usGFvHCovIPM8m3A
         VEy+LLcVllLqL/x7znhoT3vbXJeggyKPmKPaqG/1G1Qy15YEM7CcXzs+CYTuqAgTOsLH
         LaMRnkcEjfT1GID/rvpjTEnhRFKTElKPda9Nn7AlXsc4qwzqxic+xA/PeFtkwSOOH+VZ
         u+R1sbPyFe1RF/I6vHyCx73Z5NInq4IOY/EVpY2zbXGoJo1N/Z6TdBb6XNCrQdH9AqBG
         UB5Q==
X-Gm-Message-State: ACrzQf2VJqLC0K8W2dqfodr9BolYaGhfbVFHX7zplUBYn0HhAtugU1hq
        NT0giTTKbAGIaUwjw3iLAKn1S1M8232D2w==
X-Google-Smtp-Source: AMsMyM7sXAdNc7uj+dJykItHIyhTQHH0UaIVmwujgz/oFAInCA/irzQ7xBCvnyoTa1H1ldZwQqvb6Q==
X-Received: by 2002:a2e:a807:0:b0:26d:e1b6:14ad with SMTP id l7-20020a2ea807000000b0026de1b614admr5354133ljq.378.1666294319000;
        Thu, 20 Oct 2022 12:31:59 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d7-20020ac25ec7000000b004a2c3fd32edsm2830652lfq.144.2022.10.20.12.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 12:31:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm: remove duplicated code from a6xx_create_address_space
Date:   Thu, 20 Oct 2022 22:31:56 +0300
Message-Id: <20221020193157.2147112-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221020193157.2147112-1-dmitry.baryshkov@linaro.org>
References: <20221020193157.2147112-1-dmitry.baryshkov@linaro.org>
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
adreno_iommu_create_address_space() with added quirk setting. Reuse the
original function to do the work, while introducing the wrapper to set
the quirk.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 31 ++++---------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c         |  7 ++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  1 +
 5 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index fdc578016e0b..7640f5b960d6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1786,41 +1786,18 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	struct iommu_domain *iommu;
-	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
-	u64 start, size;
 
-	iommu = iommu_domain_alloc(&platform_bus_type);
-	if (!iommu)
-		return NULL;
+	aspace = adreno_iommu_create_address_space(gpu, pdev);
+	if (IS_ERR_OR_NULL(aspace))
+		return ERR_CAST(aspace);
 
 	/*
 	 * This allows GPU to set the bus attributes required to use system
 	 * cache on behalf of the iommu page table walker.
 	 */
 	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
-		adreno_set_llc_attributes(iommu);
-
-	mmu = msm_iommu_new(&pdev->dev, iommu);
-	if (IS_ERR(mmu)) {
-		iommu_domain_free(iommu);
-		return ERR_CAST(mmu);
-	}
-
-	/*
-	 * Use the aperture start or SZ_16M, whichever is greater. This will
-	 * ensure that we align with the allocated pagetable range while still
-	 * allowing room in the lower 32 bits for GMEM and whatnot
-	 */
-	start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
-	size = iommu->geometry.aperture_end - start + 1;
-
-	aspace = msm_gem_address_space_create(mmu, "gpu",
-		start & GENMASK_ULL(48, 0), size);
-
-	if (IS_ERR(aspace) && !IS_ERR(mmu))
-		mmu->funcs->destroy(mmu);
+		adreno_set_llc_attributes(aspace->mmu);
 
 	return aspace;
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 382fb7f9e497..ed26b8dfc789 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -191,9 +191,9 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
 }
 
-void adreno_set_llc_attributes(struct iommu_domain *iommu)
+void adreno_set_llc_attributes(struct msm_mmu *mmu)
 {
-	iommu_set_pgtable_quirks(iommu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
+	msm_iommu_set_pgtable_quirks(mmu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
 }
 
 struct msm_gem_address_space *
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e7adc5c632d0..723729e463e8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -338,7 +338,7 @@ struct msm_gem_address_space *
 adreno_iommu_create_address_space(struct msm_gpu *gpu,
 		struct platform_device *pdev);
 
-void adreno_set_llc_attributes(struct iommu_domain *iommu);
+void adreno_set_llc_attributes(struct msm_mmu *mmu);
 
 int adreno_read_speedbin(struct device *dev, u32 *speedbin);
 
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 5577cea7c009..768ab71cc43e 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -186,6 +186,13 @@ int msm_iommu_pagetable_params(struct msm_mmu *mmu,
 	return 0;
 }
 
+int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk)
+{
+	struct msm_iommu *iommu = to_msm_iommu(mmu);
+
+	return iommu_set_pgtable_quirks(iommu->domain, quirk);
+}
+
 static const struct msm_mmu_funcs pagetable_funcs = {
 		.map = msm_iommu_pagetable_map,
 		.unmap = msm_iommu_pagetable_unmap,
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index de158e1bf765..d968d9f8e19c 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -58,5 +58,6 @@ void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 		int *asid);
+int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk);
 
 #endif /* __MSM_MMU_H__ */
-- 
2.35.1

