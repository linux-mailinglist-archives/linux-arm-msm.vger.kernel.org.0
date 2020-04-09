Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD881A3CEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 01:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgDIXeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 19:34:07 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:51733 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727191AbgDIXeE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 19:34:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586475244; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=yfIFoUQ6pZl0fB0gErH9G1MMPuUMffgJfH4RVf+UhCg=; b=TN5fJ8NKGBVNjE6fhunWOL0tzlszhglodVI9WztCjdeeblM86hbGE88QBB4Fs6695wq9GnvK
 kR+AYyxSkZfcpqHbs4gwCZQ3CxhgnlpSaF76klPVOpiMS2O1UUMv35mfp2HdWqvs4MW2Poer
 sqGKamox3LoACp82nVlOcSXuUhk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8fb0ec.7f5ab5fab500-smtp-out-n03;
 Thu, 09 Apr 2020 23:34:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 169E8C447A1; Thu,  9 Apr 2020 23:34:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from localhost.localdomain (c-71-237-101-98.hsd1.co.comcast.net [71.237.101.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 53A0DC44BFA;
        Thu,  9 Apr 2020 23:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 53A0DC44BFA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     iommu@lists.linux-foundation.org
Cc:     linux-arm-msm@vger.kernel.org, robin.murphy@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Drew Davenport <ddavenport@chromium.org>,
        Enrico Weigelt <info@metux.net>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Joerg Roedel <jroedel@suse.de>,
        Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, tongtiangen <tongtiangen@huawei.com>
Subject: [PATCH v6 3/5] drm/msm: Attach the IOMMU device during initialization
Date:   Thu,  9 Apr 2020 17:33:48 -0600
Message-Id: <20200409233350.6343-4-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200409233350.6343-1-jcrouse@codeaurora.org>
References: <20200409233350.6343-1-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Everywhere an IOMMU object is created by msm_gpu_create_address_space
the IOMMU device is attached immediately after. Instead of carrying around
the infrastructure to do the attach from the device specific code do it
directly in the msm_iommu_init() function. This gets it out of the way for
more aggressive cleanups that follow.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  8 --------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  4 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  7 -------
 drivers/gpu/drm/msm/msm_gem_vma.c        | 23 +++++++++++++++++++----
 drivers/gpu/drm/msm/msm_gpu.c            | 11 +----------
 drivers/gpu/drm/msm/msm_gpummu.c         |  6 ------
 drivers/gpu/drm/msm/msm_iommu.c          | 15 +++++++--------
 drivers/gpu/drm/msm/msm_mmu.h            |  1 -
 8 files changed, 27 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ce19f1d39367..6629a142574e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -772,7 +772,6 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 {
 	struct iommu_domain *domain;
 	struct msm_gem_address_space *aspace;
-	int ret;
 
 	domain = iommu_domain_alloc(&platform_bus_type);
 	if (!domain)
@@ -788,13 +787,6 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 		return PTR_ERR(aspace);
 	}
 
-	ret = aspace->mmu->funcs->attach(aspace->mmu);
-	if (ret) {
-		DPU_ERROR("failed to attach iommu %d\n", ret);
-		msm_gem_address_space_put(aspace);
-		return ret;
-	}
-
 	dpu_kms->base.aspace = aspace;
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index dda05436f716..9dba37c6344f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -518,10 +518,6 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 		}
 
 		kms->aspace = aspace;
-
-		ret = aspace->mmu->funcs->attach(aspace->mmu);
-		if (ret)
-			goto fail;
 	} else {
 		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
 				"contig buffers for scanout\n");
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 47b989834af1..1e9ba99fd9eb 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -644,13 +644,6 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 		}
 
 		kms->aspace = aspace;
-
-		ret = aspace->mmu->funcs->attach(aspace->mmu);
-		if (ret) {
-			DRM_DEV_ERROR(&pdev->dev, "failed to attach iommu: %d\n",
-				ret);
-			goto fail;
-		}
 	} else {
 		DRM_DEV_INFO(&pdev->dev,
 			 "no iommu, fallback to phys contig buffers for scanout\n");
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 1af5354bcd46..91d993a16850 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -131,8 +131,8 @@ msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
 		const char *name)
 {
 	struct msm_gem_address_space *aspace;
-	u64 size = domain->geometry.aperture_end -
-		domain->geometry.aperture_start;
+	u64 start = domain->geometry.aperture_start;
+	u64 size = domain->geometry.aperture_end - start;
 
 	aspace = kzalloc(sizeof(*aspace), GFP_KERNEL);
 	if (!aspace)
@@ -141,9 +141,18 @@ msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
 	spin_lock_init(&aspace->lock);
 	aspace->name = name;
 	aspace->mmu = msm_iommu_new(dev, domain);
+	if (IS_ERR(aspace->mmu)) {
+		int ret = PTR_ERR(aspace->mmu);
 
-	drm_mm_init(&aspace->mm, (domain->geometry.aperture_start >> PAGE_SHIFT),
-		size >> PAGE_SHIFT);
+		kfree(aspace);
+		return ERR_PTR(ret);
+	}
+
+	/*
+	 * Attaching the IOMMU device changes the aperture values so use the
+	 * cached values instead
+	 */
+	drm_mm_init(&aspace->mm, start >> PAGE_SHIFT, size >> PAGE_SHIFT);
 
 	kref_init(&aspace->kref);
 
@@ -164,6 +173,12 @@ msm_gem_address_space_create_a2xx(struct device *dev, struct msm_gpu *gpu,
 	spin_lock_init(&aspace->lock);
 	aspace->name = name;
 	aspace->mmu = msm_gpummu_new(dev, gpu);
+	if (IS_ERR(aspace->mmu)) {
+		int ret = PTR_ERR(aspace->mmu);
+
+		kfree(aspace);
+		return ERR_PTR(ret);
+	}
 
 	drm_mm_init(&aspace->mm, (va_start >> PAGE_SHIFT),
 		size >> PAGE_SHIFT);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 615c5cda5389..b6f0d7204da9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -826,7 +826,6 @@ msm_gpu_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev,
 		uint64_t va_start, uint64_t va_end)
 {
 	struct msm_gem_address_space *aspace;
-	int ret;
 
 	/*
 	 * Setup IOMMU.. eventually we will (I think) do this once per context
@@ -851,17 +850,9 @@ msm_gpu_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev,
 			va_start, va_end);
 	}
 
-	if (IS_ERR(aspace)) {
+	if (IS_ERR(aspace))
 		DRM_DEV_ERROR(gpu->dev->dev, "failed to init mmu: %ld\n",
 			PTR_ERR(aspace));
-		return ERR_CAST(aspace);
-	}
-
-	ret = aspace->mmu->funcs->attach(aspace->mmu);
-	if (ret) {
-		msm_gem_address_space_put(aspace);
-		return ERR_PTR(ret);
-	}
 
 	return aspace;
 }
diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
index 34980d8eb7ad..0ad0f848560a 100644
--- a/drivers/gpu/drm/msm/msm_gpummu.c
+++ b/drivers/gpu/drm/msm/msm_gpummu.c
@@ -21,11 +21,6 @@ struct msm_gpummu {
 #define GPUMMU_PAGE_SIZE SZ_4K
 #define TABLE_SIZE (sizeof(uint32_t) * GPUMMU_VA_RANGE / GPUMMU_PAGE_SIZE)
 
-static int msm_gpummu_attach(struct msm_mmu *mmu)
-{
-	return 0;
-}
-
 static void msm_gpummu_detach(struct msm_mmu *mmu)
 {
 }
@@ -85,7 +80,6 @@ static void msm_gpummu_destroy(struct msm_mmu *mmu)
 }
 
 static const struct msm_mmu_funcs funcs = {
-		.attach = msm_gpummu_attach,
 		.detach = msm_gpummu_detach,
 		.map = msm_gpummu_map,
 		.unmap = msm_gpummu_unmap,
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index ad58cfe5998e..544c51955717 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -23,13 +23,6 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 	return 0;
 }
 
-static int msm_iommu_attach(struct msm_mmu *mmu)
-{
-	struct msm_iommu *iommu = to_msm_iommu(mmu);
-
-	return iommu_attach_device(iommu->domain, mmu->dev);
-}
-
 static void msm_iommu_detach(struct msm_mmu *mmu)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
@@ -66,7 +59,6 @@ static void msm_iommu_destroy(struct msm_mmu *mmu)
 }
 
 static const struct msm_mmu_funcs funcs = {
-		.attach = msm_iommu_attach,
 		.detach = msm_iommu_detach,
 		.map = msm_iommu_map,
 		.unmap = msm_iommu_unmap,
@@ -76,6 +68,7 @@ static const struct msm_mmu_funcs funcs = {
 struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
 {
 	struct msm_iommu *iommu;
+	int ret;
 
 	iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
 	if (!iommu)
@@ -85,5 +78,11 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
 	msm_mmu_init(&iommu->base, dev, &funcs);
 	iommu_set_fault_handler(domain, msm_fault_handler, iommu);
 
+	ret = iommu_attach_device(iommu->domain, dev);
+	if (ret) {
+		kfree(iommu);
+		return ERR_PTR(ret);
+	}
+
 	return &iommu->base;
 }
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 67a623f14319..bae9e8e67ec1 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -10,7 +10,6 @@
 #include <linux/iommu.h>
 
 struct msm_mmu_funcs {
-	int (*attach)(struct msm_mmu *mmu);
 	void (*detach)(struct msm_mmu *mmu);
 	int (*map)(struct msm_mmu *mmu, uint64_t iova, struct sg_table *sgt,
 			unsigned len, int prot);
-- 
2.17.1
