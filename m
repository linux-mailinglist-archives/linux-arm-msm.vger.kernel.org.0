Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD92176462
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2020 20:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgCBT4K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Mar 2020 14:56:10 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:64053 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725446AbgCBT4K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Mar 2020 14:56:10 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583178969; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=NUfA90GuzwauDPJrKxpYpKEIwor4u7+H63aUR820S1o=; b=B7lgPPrXl0t9rSf+lCLwtU+G18pajYl4KP9UgbxgHlIYh8P9pzmhrxspyqkxh0HZx4ZtfCqf
 yNK2i9xPKCM0qXMDdnxB9rc3zn0rOSUKpHNi2q47+SzFAQGDX6VA0ZCi88FXn5dWWRvFxEUx
 ZOw7N9FGG7FgdnHGJF25u+Ebikk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5d64d8.7f1eeba07ce0-smtp-out-n03;
 Mon, 02 Mar 2020 19:56:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 75459C4479F; Mon,  2 Mar 2020 19:56:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61D7FC43383;
        Mon,  2 Mar 2020 19:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61D7FC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 2 Mar 2020 12:56:04 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "smasetty@codeaurora.org" <smasetty@codeaurora.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v3 2/2] drm/msm/a6xx: Use the DMA API for GMU memory
 objects
Message-ID: <20200302195604.GA10133@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "smasetty@codeaurora.org" <smasetty@codeaurora.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <sean@poorly.run>
References: <1583173424-21832-1-git-send-email-jcrouse@codeaurora.org>
 <1583173424-21832-3-git-send-email-jcrouse@codeaurora.org>
 <14063C7AD467DE4B82DEDB5C278E8663F4FDDC3B@FMSMSX108.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663F4FDDC3B@FMSMSX108.amr.corp.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 02, 2020 at 06:56:47PM +0000, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> >Jordan Crouse
> >Sent: Monday, March 2, 2020 1:24 PM
> >To: linux-arm-msm@vger.kernel.org
> >Cc: David Airlie <airlied@linux.ie>; freedreno@lists.freedesktop.org;
> >smasetty@codeaurora.org; linux-kernel@vger.kernel.org; dri-
> >devel@lists.freedesktop.org; Douglas Anderson <dianders@chromium.org>;
> >Sean Paul <sean@poorly.run>
> >Subject: [PATCH v3 2/2] drm/msm/a6xx: Use the DMA API for GMU memory
> >objects
> >
> >The GMU has very few memory allocations and uses a flat memory space so
> >there is no good reason to go out of our way to bypass the DMA APIs which
> >were basically designed for this exact scenario.
> >
> >v3: Set the dma mask correctly and use dma_addr_t for the iova type
> >
> >v2: Pass force_dma false to of_dma_configure to require that the DMA
> >region be set up and return error from of_dma_configure to fail probe.
> >
> >Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> >---
> >
> > drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 115 ++++---------------------------
> >---
> > drivers/gpu/drm/msm/adreno/a6xx_gmu.h |   7 +--
> > 2 files changed, 15 insertions(+), 107 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >index 748cd37..854ba30 100644
> >--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >@@ -2,6 +2,7 @@
> > /* Copyright (c) 2017-2019 The Linux Foundation. All rights reserved. */
> >
> > #include <linux/clk.h>
> >+#include <linux/dma-mapping.h>
> > #include <linux/interconnect.h>
> > #include <linux/pm_domain.h>
> > #include <linux/pm_opp.h>
> >@@ -920,21 +921,10 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
> >
> > static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu, struct
> >a6xx_gmu_bo *bo)
> > {
> >-	int count, i;
> >-	u64 iova;
> >-
> > 	if (IS_ERR_OR_NULL(bo))
> > 		return;
> >
> >-	count = bo->size >> PAGE_SHIFT;
> >-	iova = bo->iova;
> >-
> >-	for (i = 0; i < count; i++, iova += PAGE_SIZE) {
> >-		iommu_unmap(gmu->domain, iova, PAGE_SIZE);
> >-		__free_pages(bo->pages[i], 0);
> >-	}
> >-
> >-	kfree(bo->pages);
> >+	dma_free_attrs(gmu->dev, bo->size, bo->virt, bo->iova, bo->attrs);
> > 	kfree(bo);
> > }
> >
> >@@ -942,94 +932,23 @@ static struct a6xx_gmu_bo
> >*a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
> > 		size_t size)
> > {
> > 	struct a6xx_gmu_bo *bo;
> >-	int ret, count, i;
> >
> > 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
> > 	if (!bo)
> > 		return ERR_PTR(-ENOMEM);
> >
> > 	bo->size = PAGE_ALIGN(size);
> >+	bo->attrs = DMA_ATTR_WRITE_COMBINE;
> >
> >-	count = bo->size >> PAGE_SHIFT;
> >+	bo->virt = dma_alloc_attrs(gmu->dev, bo->size, &bo->iova,
> >GFP_KERNEL,
> >+		bo->attrs);
> 
> I see that there is a dma_alloc_wc()/dma_free_wc() which appears to do the
> same set up that you are using here.
> 
> Could you use those wrappers, or do you need to keep track of the bo->attrs
> elsewhere?

I didn't know those wrappers existed but now I am very happy to use them.

Jordan

> Mike
> 
> >-	bo->pages = kcalloc(count, sizeof(struct page *), GFP_KERNEL);
> >-	if (!bo->pages) {
> >+	if (!bo->virt) {
> > 		kfree(bo);
> > 		return ERR_PTR(-ENOMEM);
> > 	}
> >
> >-	for (i = 0; i < count; i++) {
> >-		bo->pages[i] = alloc_page(GFP_KERNEL);
> >-		if (!bo->pages[i])
> >-			goto err;
> >-	}
> >-
> >-	bo->iova = gmu->uncached_iova_base;
> >-
> >-	for (i = 0; i < count; i++) {
> >-		ret = iommu_map(gmu->domain,
> >-			bo->iova + (PAGE_SIZE * i),
> >-			page_to_phys(bo->pages[i]), PAGE_SIZE,
> >-			IOMMU_READ | IOMMU_WRITE);
> >-
> >-		if (ret) {
> >-			DRM_DEV_ERROR(gmu->dev, "Unable to map GMU
> >buffer object\n");
> >-
> >-			for (i = i - 1 ; i >= 0; i--)
> >-				iommu_unmap(gmu->domain,
> >-					bo->iova + (PAGE_SIZE * i),
> >-					PAGE_SIZE);
> >-
> >-			goto err;
> >-		}
> >-	}
> >-
> >-	bo->virt = vmap(bo->pages, count, VM_IOREMAP,
> >-		pgprot_writecombine(PAGE_KERNEL));
> >-	if (!bo->virt)
> >-		goto err;
> >-
> >-	/* Align future IOVA addresses on 1MB boundaries */
> >-	gmu->uncached_iova_base += ALIGN(size, SZ_1M);
> >-
> > 	return bo;
> >-
> >-err:
> >-	for (i = 0; i < count; i++) {
> >-		if (bo->pages[i])
> >-			__free_pages(bo->pages[i], 0);
> >-	}
> >-
> >-	kfree(bo->pages);
> >-	kfree(bo);
> >-
> >-	return ERR_PTR(-ENOMEM);
> >-}
> >-
> >-static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
> >-{
> >-	int ret;
> >-
> >-	/*
> >-	 * The GMU address space is hardcoded to treat the range
> >-	 * 0x60000000 - 0x80000000 as un-cached memory. All buffers shared
> >-	 * between the GMU and the CPU will live in this space
> >-	 */
> >-	gmu->uncached_iova_base = 0x60000000;
> >-
> >-
> >-	gmu->domain = iommu_domain_alloc(&platform_bus_type);
> >-	if (!gmu->domain)
> >-		return -ENODEV;
> >-
> >-	ret = iommu_attach_device(gmu->domain, gmu->dev);
> >-
> >-	if (ret) {
> >-		iommu_domain_free(gmu->domain);
> >-		gmu->domain = NULL;
> >-	}
> >-
> >-	return ret;
> > }
> >
> > /* Return the 'arc-level' for the given frequency */
> >@@ -1289,10 +1208,6 @@ void a6xx_gmu_remove(struct a6xx_gpu
> >*a6xx_gpu)
> >
> > 	a6xx_gmu_memory_free(gmu, gmu->hfi);
> >
> >-	iommu_detach_device(gmu->domain, gmu->dev);
> >-
> >-	iommu_domain_free(gmu->domain);
> >-
> > 	free_irq(gmu->gmu_irq, gmu);
> > 	free_irq(gmu->hfi_irq, gmu);
> >
> >@@ -1313,7 +1228,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu,
> >struct device_node *node)
> >
> > 	gmu->dev = &pdev->dev;
> >
> >-	of_dma_configure(gmu->dev, node, true);
> >+	/* Pass force_dma false to require the DT to set the dma region */
> >+	ret = of_dma_configure(gmu->dev, node, false);
> >+	if (ret)
> >+		return ret;
> >+
> >+	/* Set the mask after the of_dma_configure() */
> >+	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(31));
> >
> > 	/* Fow now, don't do anything fancy until we get our feet under us */
> > 	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
> >@@ -1325,11 +1246,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu,
> >struct device_node *node)
> > 	if (ret)
> > 		goto err_put_device;
> >
> >-	/* Set up the IOMMU context bank */
> >-	ret = a6xx_gmu_memory_probe(gmu);
> >-	if (ret)
> >-		goto err_put_device;
> >-
> > 	/* Allocate memory for for the HFI queues */
> > 	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K);
> > 	if (IS_ERR(gmu->hfi))
> >@@ -1375,11 +1291,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu,
> >struct device_node *node)
> > err_memory:
> > 	a6xx_gmu_memory_free(gmu, gmu->hfi);
> >
> >-	if (gmu->domain) {
> >-		iommu_detach_device(gmu->domain, gmu->dev);
> >-
> >-		iommu_domain_free(gmu->domain);
> >-	}
> > 	ret = -ENODEV;
> >
> > err_put_device:
> >diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >index 2af91ed..d10cddd 100644
> >--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >@@ -12,8 +12,8 @@
> > struct a6xx_gmu_bo {
> > 	void *virt;
> > 	size_t size;
> >-	u64 iova;
> >-	struct page **pages;
> >+	dma_addr_t iova;
> >+	unsigned long attrs;
> > };
> >
> > /*
> >@@ -49,9 +49,6 @@ struct a6xx_gmu {
> > 	int hfi_irq;
> > 	int gmu_irq;
> >
> >-	struct iommu_domain *domain;
> >-	u64 uncached_iova_base;
> >-
> > 	struct device *gxpd;
> >
> > 	int idle_level;
> >--
> >2.7.4
> >_______________________________________________
> >dri-devel mailing list
> >dri-devel@lists.freedesktop.org
> >https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
