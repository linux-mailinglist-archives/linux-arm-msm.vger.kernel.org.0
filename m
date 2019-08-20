Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75228968FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 21:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730720AbfHTTGv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 15:06:51 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46074 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730719AbfHTTGu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 15:06:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4FD016133A; Tue, 20 Aug 2019 19:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566328009;
        bh=BTULzgBXdASQzomLewVPCgr+sGXMAc1VTRtKvsQjMRk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lWOCEi3Ku/T7r6qxzHRparumMRY1PjPssmAQXhczgC47Xp9poNYqTxyHJdzWhq+uc
         9pvIFDKr9CZrbgIe74fVkPjt8SezlJptWGIKSpg5EB/o/ktB+QVIiUonS4bKTIcnwX
         rBiIVaHBZVbyo4tombZY+pRrWUrRC8XdWqsbeqjE=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AA1B66118D;
        Tue, 20 Aug 2019 19:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566328006;
        bh=BTULzgBXdASQzomLewVPCgr+sGXMAc1VTRtKvsQjMRk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Tx9htx/6jkI2jUdpnALCcdZUkdOQ+vSM1iwN1HAv5z58BNpxxzMzKLuBXj6u7TQUf
         FQHJuEq3nXpQ6Q9zEiRaijjgMjMfAhWVlWbvId7cmIq0Y2goBfcDJfuAJLV9+Rw2m0
         WXpAmq8Vmm/ueOiGX+9adpWi36bP4WgYb/5Y4f8I=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AA1B66118D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Fritz Koenig <frkoenig@google.com>,
        David Airlie <airlied@linux.ie>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Clark <robdclark@gmail.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>, linux-kernel@vger.kernel.org,
        Boris Brezillon <bbrezillon@kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 6/7] drm/msm: Create the msm_mmu object independently from the address space
Date:   Tue, 20 Aug 2019 13:06:31 -0600
Message-Id: <1566327992-362-7-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of creating the msm_mmu object along with the address space
initialize it separately and pass it into the address space create
function. This gives us the flexibility of attaching the IOMMU device
and querying it before creating the address space which will come
in handy in the next patch that takes advantage of split pagetables
if available.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 16 ++++++++++------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 16 ++++++++++------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c |  4 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 13 +++++++++++--
 drivers/gpu/drm/msm/msm_drv.h            |  8 ++------
 drivers/gpu/drm/msm/msm_gem_vma.c        | 30 +++---------------------------
 drivers/gpu/drm/msm/msm_gpu.c            | 19 ++++++++++++-------
 7 files changed, 48 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index bb9d44e..8bf2639 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -722,23 +722,27 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 {
 	struct iommu_domain *domain;
 	struct msm_gem_address_space *aspace;
+	struct msm_mmu *mmu;
 	int ret;
 
 	domain = iommu_domain_alloc(&platform_bus_type);
 	if (!domain)
 		return 0;
 
-	domain->geometry.aperture_start = 0x1000;
-	domain->geometry.aperture_end = 0xffffffff;
+	mmu = msm_iommu_new(dpu_kms->dev->dev, domain);
+	if (IS_ERR(mmu)) {
+		iommu_domain_free(domain);
+		return PTR_ERR(mmu);
+	}
 
-	aspace = msm_gem_address_space_create(dpu_kms->dev->dev,
-			domain, "dpu1");
+	aspace = msm_gem_address_space_create(mmu, "dpu1",
+		0x1000, 0xffffffff);
 	if (IS_ERR(aspace)) {
-		iommu_domain_free(domain);
+		mmu->funcs->destroy(mmu);
 		return PTR_ERR(aspace);
 	}
 
-	ret = aspace->mmu->funcs->attach(aspace->mmu, iommu_ports,
+	ret = mmu->funcs->attach(mmu, iommu_ports,
 			ARRAY_SIZE(iommu_ports));
 	if (ret) {
 		DPU_ERROR("failed to attach iommu %d\n", ret);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 7a9ab55..af5a7a4 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -498,9 +498,17 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 	mdelay(16);
 
 	if (config->iommu) {
-		aspace = msm_gem_address_space_create(&pdev->dev,
-				config->iommu, "mdp4");
+		struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, config->iommu);
+
+		if (IS_ERR(mmu)) {
+			ret = PTR_ERR(mmu);
+			goto fail;
+		}
+
+		aspace = msm_gem_address_space_create(mmu, "mdp4",
+			0x1000, 0xfffffffff);
 		if (IS_ERR(aspace)) {
+			mmu->funcs->destroy(mmu);
 			ret = PTR_ERR(aspace);
 			goto fail;
 		}
@@ -558,10 +566,6 @@ static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	config.max_clk = 266667000;
 	config.iommu = iommu_domain_alloc(&platform_bus_type);
-	if (config.iommu) {
-		config.iommu->geometry.aperture_start = 0x1000;
-		config.iommu->geometry.aperture_end = 0xffffffff;
-	}
 
 	return &config;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index dd1daf0..23265f7 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -721,10 +721,6 @@ static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev)
 	static struct mdp5_cfg_platform config = {};
 
 	config.iommu = iommu_domain_alloc(&platform_bus_type);
-	if (config.iommu) {
-		config.iommu->geometry.aperture_start = 0x1000;
-		config.iommu->geometry.aperture_end = 0xffffffff;
-	}
 
 	return &config;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 4a60f5f..36115fd 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -702,9 +702,18 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	mdelay(16);
 
 	if (config->platform.iommu) {
-		aspace = msm_gem_address_space_create(&pdev->dev,
-				config->platform.iommu, "mdp5");
+		struct msm_mmu *mmu = msm_iommu_new(&pdev->dev,
+			config->platform.iommu);
+
+		if (IS_ERR(mmu)) {
+			ret = PTR_ERR(mmu);
+			goto fail;
+		}
+
+		aspace = msm_gem_address_space_create(mmu, "mdp5",
+			0x1000, 0xffffffff);
 		if (IS_ERR(aspace)) {
+			mmu->funcs->destroy(mmu);
 			ret = PTR_ERR(aspace);
 			goto fail;
 		}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ee7b512..c2502b2 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -244,12 +244,8 @@ void msm_gem_close_vma(struct msm_gem_address_space *aspace,
 void msm_gem_address_space_put(struct msm_gem_address_space *aspace);
 
 struct msm_gem_address_space *
-msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
-		const char *name);
-
-struct msm_gem_address_space *
-msm_gem_address_space_create_a2xx(struct device *dev, struct msm_gpu *gpu,
-		const char *name, uint64_t va_start, uint64_t va_end);
+msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
+		u64 va_start, u64 va_end);
 
 int msm_register_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 1af5354..45d4a63 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -127,32 +127,8 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
 
 
 struct msm_gem_address_space *
-msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
-		const char *name)
-{
-	struct msm_gem_address_space *aspace;
-	u64 size = domain->geometry.aperture_end -
-		domain->geometry.aperture_start;
-
-	aspace = kzalloc(sizeof(*aspace), GFP_KERNEL);
-	if (!aspace)
-		return ERR_PTR(-ENOMEM);
-
-	spin_lock_init(&aspace->lock);
-	aspace->name = name;
-	aspace->mmu = msm_iommu_new(dev, domain);
-
-	drm_mm_init(&aspace->mm, (domain->geometry.aperture_start >> PAGE_SHIFT),
-		size >> PAGE_SHIFT);
-
-	kref_init(&aspace->kref);
-
-	return aspace;
-}
-
-struct msm_gem_address_space *
-msm_gem_address_space_create_a2xx(struct device *dev, struct msm_gpu *gpu,
-		const char *name, uint64_t va_start, uint64_t va_end)
+msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
+		u64 va_start, u64 va_end)
 {
 	struct msm_gem_address_space *aspace;
 	u64 size = va_end - va_start;
@@ -163,7 +139,7 @@ msm_gem_address_space_create_a2xx(struct device *dev, struct msm_gpu *gpu,
 
 	spin_lock_init(&aspace->lock);
 	aspace->name = name;
-	aspace->mmu = msm_gpummu_new(dev, gpu);
+	aspace->mmu = mmu;
 
 	drm_mm_init(&aspace->mm, (va_start >> PAGE_SHIFT),
 		size >> PAGE_SHIFT);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 4edb874..9271f39 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -806,6 +806,7 @@ msm_gpu_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev,
 		uint64_t va_start, uint64_t va_end)
 {
 	struct msm_gem_address_space *aspace;
+	struct msm_mmu *mmu;
 	int ret;
 
 	/*
@@ -818,20 +819,24 @@ msm_gpu_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev,
 		if (!iommu)
 			return NULL;
 
-		iommu->geometry.aperture_start = va_start;
-		iommu->geometry.aperture_end = va_end;
+		mmu = msm_iommu_new(&pdev->dev, iommu);
+		if (IS_ERR(mmu)) {
+			iommu_domain_free(iommu);
+			return ERR_CAST(mmu);
+		}
 
 		DRM_DEV_INFO(gpu->dev->dev, "%s: using IOMMU\n", gpu->name);
 
-		aspace = msm_gem_address_space_create(&pdev->dev, iommu, "gpu");
-		if (IS_ERR(aspace))
-			iommu_domain_free(iommu);
 	} else {
-		aspace = msm_gem_address_space_create_a2xx(&pdev->dev, gpu, "gpu",
-			va_start, va_end);
+		mmu = msm_gpummu_new(&pdev->dev, gpu);
+		if (IS_ERR(mmu))
+			return ERR_CAST(mmu);
 	}
 
+	aspace = msm_gem_address_space_create(mmu, "gpu", va_start, va_end);
 	if (IS_ERR(aspace)) {
+		mmu->funcs->destroy(mmu);
+
 		DRM_DEV_ERROR(gpu->dev->dev, "failed to init mmu: %ld\n",
 			PTR_ERR(aspace));
 		return ERR_CAST(aspace);
-- 
2.7.4

