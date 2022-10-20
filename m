Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54EF96068E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 21:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiJTTcD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Oct 2022 15:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiJTTcC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Oct 2022 15:32:02 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7676C203549
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 12:32:01 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id a6so785834ljq.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 12:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJv+X0S/6N6bxxwUtuujGHYZyU4A0wJ/cgiADbsHpFI=;
        b=J303MmB7/8NQZpQeNvTeTEPm98HoP+rzcZMM36tZb2tlV/8IBo87DU6KZ5Ox5XABGx
         +vbK1AQFdaCH/dh0KQ5mfYLuAe8IeH5RP740jwMRwxugCcOKrfV77cgbHMBmxNqeinfZ
         cgUZvGOmwQY0RLGv5c/Frq1sZmSOmRo33oRIvyvmVR5c5Y5aiD4R1GVMo1tE5eJH1xJC
         4e2LpVx6f1CPLkbRwf43gocQeNTUuJok4FPaElnTYZG2SXlNse9ySTubiEv4z5tlrKyz
         ADiZ65/cChBV1woDoAVNCG+EzpufN9jkUzDOk0+90QW9JR/vut/yVQtx6fpfsZb0n5Xo
         asmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJv+X0S/6N6bxxwUtuujGHYZyU4A0wJ/cgiADbsHpFI=;
        b=YrYK17W0cd7IaSIW9goYWjaRgzYNPfuuSVBHUQpmWst6GOqz/+z5jD7/pW/JzSg2P2
         PaFL0J+9xjsmPwSeGtxcBqR6afyuCR7hj6kXWkCf82pLHYyZmAEhQEyq7zmY9e6BjTbm
         GyzeMgPySv4RfGpLCYUottPpjUmomNAS6NB+3dmTNi2xreRO2Z/xA4qBPR11+KEJ5Tlr
         ZOsxlIL8P7VBe4bd8li/Ab+l+PAU0JlfUb0MTkP7gGVBbKzebUU9/YvgkkVj7EBJ++09
         7GnmYGytnNcKfcc/2iJPdrgdeGmIr2PbHRs4EJkin68RZEsN6I9hXOxaP8ULn/TKSJ6V
         nf1w==
X-Gm-Message-State: ACrzQf2c6QSWCVFq1XJImFkr/m1Ek9RxqdWUrRvkIROAIwWGAXTBUNNR
        Of/SgXHm1UgyQnFlST82AizsMQ==
X-Google-Smtp-Source: AMsMyM7rq9N9PVsC9Yhb95ideK9VV50FEm6ujVmQ/EWESMTvr8OP2iMYRJ+TdAbtYE2UCf0awtisgw==
X-Received: by 2002:a2e:2c14:0:b0:26f:ad18:55bf with SMTP id s20-20020a2e2c14000000b0026fad1855bfmr5513560ljs.42.1666294319682;
        Thu, 20 Oct 2022 12:31:59 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d7-20020ac25ec7000000b004a2c3fd32edsm2830652lfq.144.2022.10.20.12.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 12:31:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm: move domain allocation into msm_iommu_new()
Date:   Thu, 20 Oct 2022 22:31:57 +0300
Message-Id: <20221020193157.2147112-3-dmitry.baryshkov@linaro.org>
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

After the msm_iommu instance is created, the IOMMU domain is completely
handled inside the msm_iommu code. Move the iommu_domain_alloc() call
into the msm_iommu_new() to simplify callers code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    |  7 ++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 20 +++++++++-----------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 19 ++++++++++---------
 drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++++----------
 drivers/gpu/drm/msm/msm_iommu.c          | 18 +++++++++++++++---
 drivers/gpu/drm/msm/msm_mmu.h            |  3 ++-
 6 files changed, 48 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e033d6a67a20..f9a529a98879 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1216,11 +1216,12 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
 	struct iommu_domain *domain;
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
 	if (IS_ERR(gmu->aspace)) {
 		iommu_domain_free(domain);
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

