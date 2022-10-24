Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89CDD60B403
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 19:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbiJXRY7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 13:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235389AbiJXRN7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 13:13:59 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA7A920350
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:49:44 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g7so17415809lfv.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9XDdH/TiHUQTYq4HIR69yDTOsBlc/3zxpHcznnQkZ4=;
        b=Xjd8gPrpeZnfKEd5iW0v6YbOPkrRGfFn0Nno9ZCXm3y34AwkZ/Nyfh2+Ju3t63C2hE
         3KpYkOMjkYZOZWZZsZjW3zuDr7qeTYHjCE6UAQUV39Wi7aasaOYMcwiTswpTteyn86Qo
         z4Wyma6CcvX1tuh5J3W5DS/C2YZ12kSLUzkYQ21EMmxNiH24WZ3Db6SUa2RJJjsXS41l
         CVHlEJovKB/ilaqHoWD6XW+kDhIfXgJ0DIxTQzTCUEEAXvlgNSP3oeIpYuPchqgV3CLM
         BHjMuhEfxMJlGBsLqKSfJggfNndvEGWQgrW3sXytY/c15JwHlV67xGIW5xRB2ZVEJ4E4
         wnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9XDdH/TiHUQTYq4HIR69yDTOsBlc/3zxpHcznnQkZ4=;
        b=leDhBWzzTgcCweeyRomSN53PjAlEuVzdcbRnMlWmyUcXoTzyC4c4BKxmH4Ir0Z1xB9
         nKrd4uPG/VzKGJ9VuWuLzMXqggYaXwO77PDPqjvbiacEwNECVK40Aol4MJgzhslEedtl
         FTvY/EgWFjsfAa1bIojFbf2w3ByEwLLJEChGKE1uphsH1UEOz21MIxLWIzyzHL4RsgDh
         KvT7MkerHBLRrxEDk5amyA7BBoSbdTC4oEnHKqZkdWHENHymkuH2hZ3DAK6Ry/qhVc37
         v0QZcybfvCh8p0+M04Z213aQ9HpFyyQQFB5Ia7tX4gJzNufFVxzFUEspHrJrX82KQi+u
         MKmg==
X-Gm-Message-State: ACrzQf3Uh6zQPqRH4JrF3JN8jak+kWcaR6+9WQngtExGeNM6lbqhP4lv
        3cpTEiDLMcPx13KkhyMnWJOnsy1uPFnL5bQ3
X-Google-Smtp-Source: AMsMyM5uIdTE2BO2SUlcboZZqfPveTPJQb2pWE96s6Sx4R8yOtolL5ufyd3Ae9bWVo15IJOpavRMzA==
X-Received: by 2002:a2e:a371:0:b0:26f:b9cf:be26 with SMTP id i17-20020a2ea371000000b0026fb9cfbe26mr12876660ljn.364.1666624486623;
        Mon, 24 Oct 2022 08:14:46 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h7-20020a2ea487000000b002771057e0e5sm265943lji.76.2022.10.24.08.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:14:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Subject: [PATCH v2 2/2] drm/msm: move domain allocation into msm_iommu_new()
Date:   Mon, 24 Oct 2022 18:14:44 +0300
Message-Id: <20221024151444.3208225-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024151444.3208225-1-dmitry.baryshkov@linaro.org>
References: <20221024151444.3208225-1-dmitry.baryshkov@linaro.org>
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
Changes since v1:
 - Fixed the uninitialized variable usage in a6xx_gmu_memory_probe()
   (reported by lkp)
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    | 12 +++++-------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 20 +++++++++-----------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 19 ++++++++++---------
 drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++++----------
 drivers/gpu/drm/msm/msm_iommu.c          | 18 +++++++++++++++---
 drivers/gpu/drm/msm/msm_mmu.h            |  3 ++-
 6 files changed, 49 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e033d6a67a20..ff5444f596d0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1213,19 +1213,17 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
 
 static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
 {
-	struct iommu_domain *domain;
 	struct msm_mmu *mmu;
 
-	domain = iommu_domain_alloc(&platform_bus_type);
-	if (!domain)
+	mmu = msm_iommu_new(gmu->dev);
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
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index ed26b8dfc789..511ade96045e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -200,28 +200,26 @@ struct msm_gem_address_space *
 adreno_iommu_create_address_space(struct msm_gpu *gpu,
 		struct platform_device *pdev)
 {
-	struct iommu_domain *iommu;
 	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
+	struct iommu_domain_geometry *geometry;
 	u64 start, size;
 
-	iommu = iommu_domain_alloc(&platform_bus_type);
-	if (!iommu)
-		return NULL;
-
-	mmu = msm_iommu_new(&pdev->dev, iommu);
-	if (IS_ERR(mmu)) {
-		iommu_domain_free(iommu);
+	mmu = msm_iommu_new(&pdev->dev);
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
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 964573d26d26..5f7488a539f5 100644
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
+	mmu = msm_iommu_new(&pdev->dev);
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
index 28034c21f6bc..9d7275304785 100644
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
+	mmu = msm_iommu_new(iommu_dev);
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
index 768ab71cc43e..b2e0be4cc985 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -193,6 +193,13 @@ int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk)
 	return iommu_set_pgtable_quirks(iommu->domain, quirk);
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
@@ -374,17 +381,21 @@ static const struct msm_mmu_funcs funcs = {
 		.resume_translation = msm_iommu_resume_translation,
 };
 
-struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
+struct msm_mmu *msm_iommu_new(struct device *dev)
 {
+	struct iommu_domain *domain;
 	struct msm_iommu *iommu;
 	int ret;
 
+	domain = iommu_domain_alloc(dev->bus);
 	if (!domain)
-		return ERR_PTR(-ENODEV);
+		return NULL;
 
 	iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
-	if (!iommu)
+	if (!iommu) {
+		iommu_domain_free(domain);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	iommu->domain = domain;
 	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
@@ -393,6 +404,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
 
 	ret = iommu_attach_device(iommu->domain, dev);
 	if (ret) {
+		iommu_domain_free(domain);
 		kfree(iommu);
 		return ERR_PTR(ret);
 	}
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index d968d9f8e19c..02df00ddd463 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -40,7 +40,7 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
 	mmu->type = type;
 }
 
-struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
+struct msm_mmu *msm_iommu_new(struct device *dev);
 struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
 
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
@@ -59,5 +59,6 @@ void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 		int *asid);
 int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk);
+struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu);
 
 #endif /* __MSM_MMU_H__ */
-- 
2.35.1

