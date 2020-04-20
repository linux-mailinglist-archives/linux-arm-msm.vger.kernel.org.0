Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F3A1B166B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 21:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgDTT7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 15:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726183AbgDTT7g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 15:59:36 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17048C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 12:59:36 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id x66so12105764qkd.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 12:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wDbOdnPkTFiz/IFCjyzw9rN9Jlw3Sm8s2+B+3TdHooU=;
        b=i51gQKiaZnJpsenlRNe1Sgox7u8qCm1LzUxGxp23jk6CvAm+nbRLP40dXwLdPffD0+
         zjz7EYRzxKmkP65WwXchoFB4LZd2M2gLkbImWk1Wj4p93b19tPbj2Iv8crle5SZwiY+v
         A45Y99wQd9DAF4dc5n+fbeZWNjcO3HsOnsN6BwY8RT/LXoBCabca3xHITqavvd15Pkka
         QspJ0UOQ3NTK98qcdvRz92JbJEL2JHxiJW6NNKY0roEk3KHdsRAKFQ+LGnXAn/u8iMg/
         J7YhssCH+lsGIahBVdurk2euotpigQJHzq8+z6rgqhkYLfIwwUk5RU4gKCbBH1dPYQhX
         5fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wDbOdnPkTFiz/IFCjyzw9rN9Jlw3Sm8s2+B+3TdHooU=;
        b=CZy3Ov16I2rozYobe/uU/pTQV5dHzBGZfiEl3UartlBXCe9nRopygnGNJgJoaHcTdO
         5egSTgkD1l1DQbubRi3SqxX0Z4YQQzdpHXqmjjSvjpJS4rWbxiNOPiMxt1lU9fnwfuy5
         evujML6z7ovWbxkBXWQ3TVNWvTxDPCmRtJob87jpH1EPGa/X68T4kY0B6EMrF2+26d/B
         tyuFKC8JjU6vGUonfeXP9tG9OHs9zd9jjL346oDMeD27WfQ/ywD3yd9ilBzQV5NYANsX
         YOeqS5iA0cFvbGVfL9XE8LT2VnRqSCB6Aa2sn7PQK7o70p3yWgdVjz+9/vVN45coxLYU
         hrJQ==
X-Gm-Message-State: AGi0PuZ0oPgR1f+IIPDg1ezbOdPyIiknb0TlJjv8kUT1ea1dCAZS9a/1
        RmV4FHSVrFgQX931ZY+cbUBWyw==
X-Google-Smtp-Source: APiQypJQw+nd7r2y1WCXpbPbbW0vXMy3SNxHYtZN51ZoK9P8P4hbVQ0+oeqITaaAyWV4/Q7/NmoEoA==
X-Received: by 2002:a05:620a:13eb:: with SMTP id h11mr16572342qkl.404.1587412775202;
        Mon, 20 Apr 2020 12:59:35 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id x43sm224332qtj.65.2020.04.20.12.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 12:59:34 -0700 (PDT)
Subject: Re: [PATCH 2/9] Revert "drm/msm/a6xx: Use the DMA API for GMU memory
 objects"
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200420140313.7263-1-jonathan@marek.ca>
 <20200420140313.7263-3-jonathan@marek.ca>
 <20200420195130.GQ576963@builder.lan>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <46fe8a96-c54e-2362-9a60-c27f7042089b@marek.ca>
Date:   Mon, 20 Apr 2020 15:59:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200420195130.GQ576963@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/20/20 3:51 PM, Bjorn Andersson wrote:
> On Mon 20 Apr 07:03 PDT 2020, Jonathan Marek wrote:
> 
>> This reverts commit a5fb8b918920c6f7706a8b5b8ea535a7f077a7f6.
> 
> Why?
> 

It removes something I need for the next patches in the series, however 
I'm open to suggestions on a better solution (Jordan said he would check 
it out)

>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 115 +++++++++++++++++++++++---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |   6 +-
>>   2 files changed, 107 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index c4e71abbdd53..748cd379065f 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -2,7 +2,6 @@
>>   /* Copyright (c) 2017-2019 The Linux Foundation. All rights reserved. */
>>   
>>   #include <linux/clk.h>
>> -#include <linux/dma-mapping.h>
>>   #include <linux/interconnect.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/pm_opp.h>
>> @@ -921,10 +920,21 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
>>   
>>   static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo)
>>   {
>> +	int count, i;
>> +	u64 iova;
>> +
>>   	if (IS_ERR_OR_NULL(bo))
>>   		return;
>>   
>> -	dma_free_wc(gmu->dev, bo->size, bo->virt, bo->iova);
>> +	count = bo->size >> PAGE_SHIFT;
>> +	iova = bo->iova;
>> +
>> +	for (i = 0; i < count; i++, iova += PAGE_SIZE) {
>> +		iommu_unmap(gmu->domain, iova, PAGE_SIZE);
>> +		__free_pages(bo->pages[i], 0);
>> +	}
>> +
>> +	kfree(bo->pages);
>>   	kfree(bo);
>>   }
>>   
>> @@ -932,6 +942,7 @@ static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
>>   		size_t size)
>>   {
>>   	struct a6xx_gmu_bo *bo;
>> +	int ret, count, i;
>>   
>>   	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
>>   	if (!bo)
>> @@ -939,14 +950,86 @@ static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
>>   
>>   	bo->size = PAGE_ALIGN(size);
>>   
>> -	bo->virt = dma_alloc_wc(gmu->dev, bo->size, &bo->iova, GFP_KERNEL);
>> +	count = bo->size >> PAGE_SHIFT;
>>   
>> -	if (!bo->virt) {
>> +	bo->pages = kcalloc(count, sizeof(struct page *), GFP_KERNEL);
>> +	if (!bo->pages) {
>>   		kfree(bo);
>>   		return ERR_PTR(-ENOMEM);
>>   	}
>>   
>> +	for (i = 0; i < count; i++) {
>> +		bo->pages[i] = alloc_page(GFP_KERNEL);
>> +		if (!bo->pages[i])
>> +			goto err;
>> +	}
>> +
>> +	bo->iova = gmu->uncached_iova_base;
>> +
>> +	for (i = 0; i < count; i++) {
>> +		ret = iommu_map(gmu->domain,
>> +			bo->iova + (PAGE_SIZE * i),
>> +			page_to_phys(bo->pages[i]), PAGE_SIZE,
>> +			IOMMU_READ | IOMMU_WRITE);
>> +
>> +		if (ret) {
>> +			DRM_DEV_ERROR(gmu->dev, "Unable to map GMU buffer object\n");
>> +
>> +			for (i = i - 1 ; i >= 0; i--)
>> +				iommu_unmap(gmu->domain,
>> +					bo->iova + (PAGE_SIZE * i),
>> +					PAGE_SIZE);
>> +
>> +			goto err;
>> +		}
>> +	}
>> +
>> +	bo->virt = vmap(bo->pages, count, VM_IOREMAP,
>> +		pgprot_writecombine(PAGE_KERNEL));
>> +	if (!bo->virt)
>> +		goto err;
>> +
>> +	/* Align future IOVA addresses on 1MB boundaries */
>> +	gmu->uncached_iova_base += ALIGN(size, SZ_1M);
>> +
>>   	return bo;
>> +
>> +err:
>> +	for (i = 0; i < count; i++) {
>> +		if (bo->pages[i])
>> +			__free_pages(bo->pages[i], 0);
>> +	}
>> +
>> +	kfree(bo->pages);
>> +	kfree(bo);
>> +
>> +	return ERR_PTR(-ENOMEM);
>> +}
>> +
>> +static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
>> +{
>> +	int ret;
>> +
>> +	/*
>> +	 * The GMU address space is hardcoded to treat the range
>> +	 * 0x60000000 - 0x80000000 as un-cached memory. All buffers shared
>> +	 * between the GMU and the CPU will live in this space
>> +	 */
>> +	gmu->uncached_iova_base = 0x60000000;
>> +
>> +
>> +	gmu->domain = iommu_domain_alloc(&platform_bus_type);
>> +	if (!gmu->domain)
>> +		return -ENODEV;
>> +
>> +	ret = iommu_attach_device(gmu->domain, gmu->dev);
>> +
>> +	if (ret) {
>> +		iommu_domain_free(gmu->domain);
>> +		gmu->domain = NULL;
>> +	}
>> +
>> +	return ret;
>>   }
>>   
>>   /* Return the 'arc-level' for the given frequency */
>> @@ -1206,6 +1289,10 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>>   
>>   	a6xx_gmu_memory_free(gmu, gmu->hfi);
>>   
>> +	iommu_detach_device(gmu->domain, gmu->dev);
>> +
>> +	iommu_domain_free(gmu->domain);
>> +
>>   	free_irq(gmu->gmu_irq, gmu);
>>   	free_irq(gmu->hfi_irq, gmu);
>>   
>> @@ -1226,15 +1313,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>>   
>>   	gmu->dev = &pdev->dev;
>>   
>> -	/* Pass force_dma false to require the DT to set the dma region */
>> -	ret = of_dma_configure(gmu->dev, node, false);
>> -	if (ret)
>> -		return ret;
>> -
>> -	/* Set the mask after the of_dma_configure() */
>> -	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(31));
>> -	if (ret)
>> -		return ret;
>> +	of_dma_configure(gmu->dev, node, true);
>>   
>>   	/* Fow now, don't do anything fancy until we get our feet under us */
>>   	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
>> @@ -1246,6 +1325,11 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>>   	if (ret)
>>   		goto err_put_device;
>>   
>> +	/* Set up the IOMMU context bank */
>> +	ret = a6xx_gmu_memory_probe(gmu);
>> +	if (ret)
>> +		goto err_put_device;
>> +
>>   	/* Allocate memory for for the HFI queues */
>>   	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K);
>>   	if (IS_ERR(gmu->hfi))
>> @@ -1291,6 +1375,11 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>>   err_memory:
>>   	a6xx_gmu_memory_free(gmu, gmu->hfi);
>>   
>> +	if (gmu->domain) {
>> +		iommu_detach_device(gmu->domain, gmu->dev);
>> +
>> +		iommu_domain_free(gmu->domain);
>> +	}
>>   	ret = -ENODEV;
>>   
>>   err_put_device:
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> index 4af65a36d5ca..2af91ed7ed0c 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> @@ -12,7 +12,8 @@
>>   struct a6xx_gmu_bo {
>>   	void *virt;
>>   	size_t size;
>> -	dma_addr_t iova;
>> +	u64 iova;
>> +	struct page **pages;
>>   };
>>   
>>   /*
>> @@ -48,6 +49,9 @@ struct a6xx_gmu {
>>   	int hfi_irq;
>>   	int gmu_irq;
>>   
>> +	struct iommu_domain *domain;
>> +	u64 uncached_iova_base;
>> +
>>   	struct device *gxpd;
>>   
>>   	int idle_level;
>> -- 
>> 2.26.1
>>
