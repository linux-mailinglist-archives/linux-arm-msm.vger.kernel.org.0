Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5891F17E349
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 16:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgCIPR7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 11:17:59 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:13959 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726918AbgCIPR7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 11:17:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583767078; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=FG36tlScvIlW2p6aNKvKZLPCIVnMfuX6zVT3CFSEtyc=; b=RwNNnBwEcWz/hZtQamkRxVR4fxRVAp+EK/ATECC3vJJnUzrat3NkcVuE0VBEZBOpOC6kwm9g
 ygrjuxjUBDa5xu+BniJLmxKNEjOEJlKd+Ys0Gz2bfPxB08nm/aCv5heednvKEcjNo3+Y9VFH
 DjhkYaK5kbPXqRptFbVTT/tFfhY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e665e24.7f2cf0bbea78-smtp-out-n02;
 Mon, 09 Mar 2020 15:17:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7579DC44795; Mon,  9 Mar 2020 15:17:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5C5C9C44792;
        Mon,  9 Mar 2020 15:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5C5C9C44792
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     smasetty@codeaurora.org, John Stultz <john.stultz@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 2/2] drm/msm/a6xx: Use the DMA API for GMU memory objects
Date:   Mon,  9 Mar 2020 09:17:46 -0600
Message-Id: <1583767066-1555-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583767066-1555-1-git-send-email-jcrouse@codeaurora.org>
References: <1583767066-1555-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GMU has very few memory allocations and uses a flat memory space so
there is no good reason to go out of our way to bypass the DMA APIs which
were basically designed for this exact scenario.

v4: Use dma_alloc_wc()
v3: Set the dma mask correctly and use dma_addr_t for the iova type
v2: Pass force_dma false to of_dma_configure to require that the DMA
region be set up and return error from of_dma_configure to fail probe.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 113 ++++------------------------------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |   6 +-
 2 files changed, 12 insertions(+), 107 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 748cd37..dd51dd0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2,6 +2,7 @@
 /* Copyright (c) 2017-2019 The Linux Foundation. All rights reserved. */
 
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
 #include <linux/interconnect.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
@@ -920,21 +921,10 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 
 static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo)
 {
-	int count, i;
-	u64 iova;
-
 	if (IS_ERR_OR_NULL(bo))
 		return;
 
-	count = bo->size >> PAGE_SHIFT;
-	iova = bo->iova;
-
-	for (i = 0; i < count; i++, iova += PAGE_SIZE) {
-		iommu_unmap(gmu->domain, iova, PAGE_SIZE);
-		__free_pages(bo->pages[i], 0);
-	}
-
-	kfree(bo->pages);
+	dma_free_wc(gmu->dev, bo->size, bo->virt, bo->iova);
 	kfree(bo);
 }
 
@@ -942,7 +932,6 @@ static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
 		size_t size)
 {
 	struct a6xx_gmu_bo *bo;
-	int ret, count, i;
 
 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
 	if (!bo)
@@ -950,86 +939,14 @@ static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
 
 	bo->size = PAGE_ALIGN(size);
 
-	count = bo->size >> PAGE_SHIFT;
+	bo->virt = dma_alloc_wc(gmu->dev, bo->size, &bo->iova, GFP_KERNEL);
 
-	bo->pages = kcalloc(count, sizeof(struct page *), GFP_KERNEL);
-	if (!bo->pages) {
+	if (!bo->virt) {
 		kfree(bo);
 		return ERR_PTR(-ENOMEM);
 	}
 
-	for (i = 0; i < count; i++) {
-		bo->pages[i] = alloc_page(GFP_KERNEL);
-		if (!bo->pages[i])
-			goto err;
-	}
-
-	bo->iova = gmu->uncached_iova_base;
-
-	for (i = 0; i < count; i++) {
-		ret = iommu_map(gmu->domain,
-			bo->iova + (PAGE_SIZE * i),
-			page_to_phys(bo->pages[i]), PAGE_SIZE,
-			IOMMU_READ | IOMMU_WRITE);
-
-		if (ret) {
-			DRM_DEV_ERROR(gmu->dev, "Unable to map GMU buffer object\n");
-
-			for (i = i - 1 ; i >= 0; i--)
-				iommu_unmap(gmu->domain,
-					bo->iova + (PAGE_SIZE * i),
-					PAGE_SIZE);
-
-			goto err;
-		}
-	}
-
-	bo->virt = vmap(bo->pages, count, VM_IOREMAP,
-		pgprot_writecombine(PAGE_KERNEL));
-	if (!bo->virt)
-		goto err;
-
-	/* Align future IOVA addresses on 1MB boundaries */
-	gmu->uncached_iova_base += ALIGN(size, SZ_1M);
-
 	return bo;
-
-err:
-	for (i = 0; i < count; i++) {
-		if (bo->pages[i])
-			__free_pages(bo->pages[i], 0);
-	}
-
-	kfree(bo->pages);
-	kfree(bo);
-
-	return ERR_PTR(-ENOMEM);
-}
-
-static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
-{
-	int ret;
-
-	/*
-	 * The GMU address space is hardcoded to treat the range
-	 * 0x60000000 - 0x80000000 as un-cached memory. All buffers shared
-	 * between the GMU and the CPU will live in this space
-	 */
-	gmu->uncached_iova_base = 0x60000000;
-
-
-	gmu->domain = iommu_domain_alloc(&platform_bus_type);
-	if (!gmu->domain)
-		return -ENODEV;
-
-	ret = iommu_attach_device(gmu->domain, gmu->dev);
-
-	if (ret) {
-		iommu_domain_free(gmu->domain);
-		gmu->domain = NULL;
-	}
-
-	return ret;
 }
 
 /* Return the 'arc-level' for the given frequency */
@@ -1289,10 +1206,6 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 
 	a6xx_gmu_memory_free(gmu, gmu->hfi);
 
-	iommu_detach_device(gmu->domain, gmu->dev);
-
-	iommu_domain_free(gmu->domain);
-
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 
@@ -1313,7 +1226,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 	gmu->dev = &pdev->dev;
 
-	of_dma_configure(gmu->dev, node, true);
+	/* Pass force_dma false to require the DT to set the dma region */
+	ret = of_dma_configure(gmu->dev, node, false);
+	if (ret)
+		return ret;
+
+	/* Set the mask after the of_dma_configure() */
+	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(31));
 
 	/* Fow now, don't do anything fancy until we get our feet under us */
 	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
@@ -1325,11 +1244,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_put_device;
 
-	/* Set up the IOMMU context bank */
-	ret = a6xx_gmu_memory_probe(gmu);
-	if (ret)
-		goto err_put_device;
-
 	/* Allocate memory for for the HFI queues */
 	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K);
 	if (IS_ERR(gmu->hfi))
@@ -1375,11 +1289,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 err_memory:
 	a6xx_gmu_memory_free(gmu, gmu->hfi);
 
-	if (gmu->domain) {
-		iommu_detach_device(gmu->domain, gmu->dev);
-
-		iommu_domain_free(gmu->domain);
-	}
 	ret = -ENODEV;
 
 err_put_device:
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 2af91ed..4af65a3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -12,8 +12,7 @@
 struct a6xx_gmu_bo {
 	void *virt;
 	size_t size;
-	u64 iova;
-	struct page **pages;
+	dma_addr_t iova;
 };
 
 /*
@@ -49,9 +48,6 @@ struct a6xx_gmu {
 	int hfi_irq;
 	int gmu_irq;
 
-	struct iommu_domain *domain;
-	u64 uncached_iova_base;
-
 	struct device *gxpd;
 
 	int idle_level;
-- 
2.7.4
