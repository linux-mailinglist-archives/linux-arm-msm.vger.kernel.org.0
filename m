Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35EFA616B44
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 18:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbiKBRy5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 13:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbiKBRyy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 13:54:54 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF622EF15
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 10:54:52 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id k19so25715725lji.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 10:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRgsZ5U1sujaXdTjEGKpxsJ4wUdmpOhTx9kZ41Pn41g=;
        b=yxKg+IB9ebkxct4CCGsbHzpKsadYoUBQLFbb/KuzI8o05CMS8E9mE2nqA7v4BFTWD1
         oCf/HYzJ34e86bluDlgVFcuOY/b+WK1P/aRUZEUIC3gcUIwndi2Y22f7QOsmf9C/zuQq
         DQF505JRd5dCizl2ALA54kaVWty/0rGo0NA/BDQxN+BdC1lMXmMjA78ZW3NcKC6WKAQd
         rI8TMz/jIRqTjqolZC/qaudbt6mHOADOAnFFfK+00MfrAyyx0eKhr1zR8Hk7iJWqijLC
         NkiMekTKh8Ms69YavZORyW2cAarfynGHV3t4LlCBn4+QW+FP/SLCosgFaFcdyo7Qq8cC
         B3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRgsZ5U1sujaXdTjEGKpxsJ4wUdmpOhTx9kZ41Pn41g=;
        b=zCdkKAFPzQUhU7h0ygDuK4cnwx2TpXeme7aARywzFx7+DN9Z+d+zpgD5UGrEmh5t0D
         zi72+namhW5hKuEoIVF4vYHXNUKivPY488u8B39Ymcl8tdHDFzklaC46bBiY8b75ZraV
         TpfV/gMUkBzYHvKdCcc74Vgp67AEAI9OXw/X6ZwxUjIzOJh5AWItI6I01pl3Btgcd55F
         U5eT2uVmRdKLtJn1j3BeEujZqiGuTpjOztl6+Tnfs57XUU07TEoodh2aQawjuaTPaISa
         70h/Cx7CxoAKgYk0htP8EWswOHPO184z8ZHZ+wpsEt73X7PqthZ0IrluiRmFJolUBoIq
         gDmA==
X-Gm-Message-State: ACrzQf3L3HSmfFqU43okTGp3UhkUA0RwuRWRyLKI4ivDVpqEgmcqN/Lg
        57nLmChBoLuwExCzjAf+9SDXRg==
X-Google-Smtp-Source: AMsMyM7NLgjIvQJ+NUYomaVeh9O4uZXJIYeZq1TWOqD2+t0GPqP8Cq0CMoeDPdagYJ/5O11xhCXodg==
X-Received: by 2002:a2e:94c7:0:b0:277:3e89:e9f8 with SMTP id r7-20020a2e94c7000000b002773e89e9f8mr10053032ljh.110.1667411690931;
        Wed, 02 Nov 2022 10:54:50 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d3-20020a056512368300b00492c663bba2sm2087625lfs.124.2022.11.02.10.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 10:54:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Subject: [PATCH v4 1/2] drm/msm: move domain allocation into msm_iommu_new()
Date:   Wed,  2 Nov 2022 20:54:48 +0300
Message-Id: <20221102175449.452283-2-dmitry.baryshkov@linaro.org>
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

After the msm_iommu instance is created, the IOMMU domain is completely
handled inside the msm_iommu code. Move the iommu_domain_alloc() call
into the msm_iommu_new() to simplify callers code.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    | 12 +++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 23 +++++++++++-----------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 25 +++++++++---------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  2 --
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 19 +++++++++---------
 drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++++---------
 drivers/gpu/drm/msm/msm_iommu.c          | 20 ++++++++++++++++---
 drivers/gpu/drm/msm/msm_mmu.h            |  3 ++-
 8 files changed, 62 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e033d6a67a20..6484b97c5344 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1213,19 +1213,17 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
 
 static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
 {
-	struct iommu_domain *domain;
 	struct msm_mmu *mmu;
 
-	domain = iommu_domain_alloc(&platform_bus_type);
-	if (!domain)
+	mmu = msm_iommu_new(gmu->dev, 0);
+	if (!mmu)
 		return -ENODEV;
+	if (IS_ERR(mmu))
+		return PTR_ERR(mmu);
 
-	mmu = msm_iommu_new(gmu->dev, domain);
 	gmu->aspace = msm_gem_address_space_create(mmu, "gmu", 0x0, 0x80000000);
-	if (IS_ERR(gmu->aspace)) {
-		iommu_domain_free(domain);
+	if (IS_ERR(gmu->aspace))
 		return PTR_ERR(gmu->aspace);
-	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index fdc578016e0b..db4b3a48c708 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1786,35 +1786,34 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	struct iommu_domain *iommu;
+	struct iommu_domain_geometry *geometry;
 	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
 	u64 start, size;
-
-	iommu = iommu_domain_alloc(&platform_bus_type);
-	if (!iommu)
-		return NULL;
+	unsigned long quirks = 0;
 
 	/*
 	 * This allows GPU to set the bus attributes required to use system
 	 * cache on behalf of the iommu page table walker.
 	 */
 	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
-		adreno_set_llc_attributes(iommu);
+		quirks |= IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
 
-	mmu = msm_iommu_new(&pdev->dev, iommu);
-	if (IS_ERR(mmu)) {
-		iommu_domain_free(iommu);
+	mmu = msm_iommu_new(&pdev->dev, quirks);
+	if (IS_ERR_OR_NULL(mmu))
 		return ERR_CAST(mmu);
-	}
+
+	geometry = msm_iommu_get_geometry(mmu);
+	if (IS_ERR(geometry))
+		return ERR_CAST(geometry);
 
 	/*
 	 * Use the aperture start or SZ_16M, whichever is greater. This will
 	 * ensure that we align with the allocated pagetable range while still
 	 * allowing room in the lower 32 bits for GMEM and whatnot
 	 */
-	start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
-	size = iommu->geometry.aperture_end - start + 1;
+	start = max_t(u64, SZ_16M, geometry->aperture_start);
+	size = geometry->aperture_end - start + 1;
 
 	aspace = msm_gem_address_space_create(mmu, "gpu",
 		start & GENMASK_ULL(48, 0), size);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 382fb7f9e497..12d0497f57e1 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -191,37 +191,30 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
 }
 
-void adreno_set_llc_attributes(struct iommu_domain *iommu)
-{
-	iommu_set_pgtable_quirks(iommu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
-}
-
 struct msm_gem_address_space *
 adreno_iommu_create_address_space(struct msm_gpu *gpu,
 		struct platform_device *pdev)
 {
-	struct iommu_domain *iommu;
+	struct iommu_domain_geometry *geometry;
 	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
 	u64 start, size;
 
-	iommu = iommu_domain_alloc(&platform_bus_type);
-	if (!iommu)
-		return NULL;
-
-	mmu = msm_iommu_new(&pdev->dev, iommu);
-	if (IS_ERR(mmu)) {
-		iommu_domain_free(iommu);
+	mmu = msm_iommu_new(&pdev->dev, 0);
+	if (IS_ERR_OR_NULL(mmu))
 		return ERR_CAST(mmu);
-	}
+
+	geometry = msm_iommu_get_geometry(mmu);
+	if (IS_ERR(geometry))
+		return ERR_CAST(geometry);
 
 	/*
 	 * Use the aperture start or SZ_16M, whichever is greater. This will
 	 * ensure that we align with the allocated pagetable range while still
 	 * allowing room in the lower 32 bits for GMEM and whatnot
 	 */
-	start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
-	size = iommu->geometry.aperture_end - start + 1;
+	start = max_t(u64, SZ_16M, geometry->aperture_start);
+	size = geometry->aperture_end - start + 1;
 
 	aspace = msm_gem_address_space_create(mmu, "gpu",
 		start & GENMASK_ULL(48, 0), size);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e7adc5c632d0..707273339969 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -338,8 +338,6 @@ struct msm_gem_address_space *
 adreno_iommu_create_address_space(struct msm_gpu *gpu,
 		struct platform_device *pdev);
 
-void adreno_set_llc_attributes(struct iommu_domain *iommu);
-
 int adreno_read_speedbin(struct device *dev, u32 *speedbin);
 
 /*
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 964573d26d26..9a1a0769575d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -387,7 +387,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp4_kms *mdp4_kms;
 	struct msm_kms *kms = NULL;
-	struct iommu_domain *iommu;
+	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
 	int irq, ret;
 	u32 major, minor;
@@ -499,10 +499,15 @@ static int mdp4_kms_init(struct drm_device *dev)
 	mdp4_disable(mdp4_kms);
 	mdelay(16);
 
-	iommu = iommu_domain_alloc(pdev->dev.bus);
-	if (iommu) {
-		struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
-
+	mmu = msm_iommu_new(&pdev->dev, 0);
+	if (IS_ERR(mmu)) {
+		ret = PTR_ERR(mmu);
+		goto fail;
+	} else if (!mmu) {
+		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
+				"contig buffers for scanout\n");
+		aspace = NULL;
+	} else {
 		aspace  = msm_gem_address_space_create(mmu,
 			"mdp4", 0x1000, 0x100000000 - 0x1000);
 
@@ -514,10 +519,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 		}
 
 		kms->aspace = aspace;
-	} else {
-		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
-				"contig buffers for scanout\n");
-		aspace = NULL;
 	}
 
 	ret = modeset_init(mdp4_kms);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 28034c21f6bc..be32b4460e94 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -276,7 +276,6 @@ static int msm_drm_uninit(struct device *dev)
 
 struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 {
-	struct iommu_domain *domain;
 	struct msm_gem_address_space *aspace;
 	struct msm_mmu *mmu;
 	struct device *mdp_dev = dev->dev;
@@ -292,22 +291,21 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	else
 		iommu_dev = mdss_dev;
 
-	domain = iommu_domain_alloc(iommu_dev->bus);
-	if (!domain) {
+	mmu = msm_iommu_new(iommu_dev, 0);
+	if (IS_ERR(mmu))
+		return ERR_CAST(mmu);
+
+	if (!mmu) {
 		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
 		return NULL;
 	}
 
-	mmu = msm_iommu_new(iommu_dev, domain);
-	if (IS_ERR(mmu)) {
-		iommu_domain_free(domain);
-		return ERR_CAST(mmu);
-	}
-
 	aspace = msm_gem_address_space_create(mmu, "mdp_kms",
 		0x1000, 0x100000000 - 0x1000);
-	if (IS_ERR(aspace))
+	if (IS_ERR(aspace)) {
+		dev_err(mdp_dev, "aspace create, error %pe\n", aspace);
 		mmu->funcs->destroy(mmu);
+	}
 
 	return aspace;
 }
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 5577cea7c009..c2507582ecf3 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -186,6 +186,13 @@ int msm_iommu_pagetable_params(struct msm_mmu *mmu,
 	return 0;
 }
 
+struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu)
+{
+	struct msm_iommu *iommu = to_msm_iommu(mmu);
+
+	return &iommu->domain->geometry;
+}
+
 static const struct msm_mmu_funcs pagetable_funcs = {
 		.map = msm_iommu_pagetable_map,
 		.unmap = msm_iommu_pagetable_unmap,
@@ -367,17 +374,23 @@ static const struct msm_mmu_funcs funcs = {
 		.resume_translation = msm_iommu_resume_translation,
 };
 
-struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
+struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
 {
+	struct iommu_domain *domain;
 	struct msm_iommu *iommu;
 	int ret;
 
+	domain = iommu_domain_alloc(dev->bus);
 	if (!domain)
-		return ERR_PTR(-ENODEV);
+		return NULL;
+
+	iommu_set_pgtable_quirks(domain, quirks);
 
 	iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
-	if (!iommu)
+	if (!iommu) {
+		iommu_domain_free(domain);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	iommu->domain = domain;
 	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
@@ -386,6 +399,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
 
 	ret = iommu_attach_device(iommu->domain, dev);
 	if (ret) {
+		iommu_domain_free(domain);
 		kfree(iommu);
 		return ERR_PTR(ret);
 	}
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index de158e1bf765..74cd81e701ff 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -40,7 +40,7 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
 	mmu->type = type;
 }
 
-struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
+struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
 struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
 
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
@@ -58,5 +58,6 @@ void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 		int *asid);
+struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu);
 
 #endif /* __MSM_MMU_H__ */
-- 
2.35.1

