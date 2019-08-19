Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC5994D25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 20:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbfHSSj3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 14:39:29 -0400
Received: from foss.arm.com ([217.140.110.172]:58776 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727957AbfHSSj3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 14:39:29 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1408360;
        Mon, 19 Aug 2019 11:39:27 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 963663F246;
        Mon, 19 Aug 2019 11:39:24 -0700 (PDT)
Subject: Re: [PATCH V5 4/5] iommu/dma-iommu: Use the dev->coherent_dma_mask
To:     Tom Murphy <murphyt7@tcd.ie>, iommu@lists.linux-foundation.org
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
References: <20190815110944.3579-1-murphyt7@tcd.ie>
 <20190815110944.3579-5-murphyt7@tcd.ie>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <d3c8d4ce-8ffb-bf69-a8f3-d64108f5987a@arm.com>
Date:   Mon, 19 Aug 2019 19:39:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190815110944.3579-5-murphyt7@tcd.ie>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/08/2019 12:09, Tom Murphy wrote:
> Use the dev->coherent_dma_mask when allocating in the dma-iommu ops api.

Oops... I suppose technically that's my latent bug, but since we've all 
missed it so far, I doubt arm64 systems ever see any devices which 
actually have different masks.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
> ---
>   drivers/iommu/dma-iommu.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 906b7fa14d3c..b9a3ab02434b 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -471,7 +471,7 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
>   }
>   
>   static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
> -		size_t size, int prot)
> +		size_t size, int prot, dma_addr_t dma_mask)
>   {
>   	struct iommu_domain *domain = iommu_get_dma_domain(dev);
>   	struct iommu_dma_cookie *cookie = domain->iova_cookie;
> @@ -484,7 +484,7 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
>   
>   	size = iova_align(iovad, size + iova_off);
>   
> -	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
> +	iova = iommu_dma_alloc_iova(domain, size, dma_mask, dev);
>   	if (!iova)
>   		return DMA_MAPPING_ERROR;
>   
> @@ -735,7 +735,7 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
>   	int prot = dma_info_to_prot(dir, coherent, attrs);
>   	dma_addr_t dma_handle;
>   
> -	dma_handle = __iommu_dma_map(dev, phys, size, prot);
> +	dma_handle = __iommu_dma_map(dev, phys, size, prot, dma_get_mask(dev));
>   	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
>   	    dma_handle != DMA_MAPPING_ERROR)
>   		arch_sync_dma_for_device(dev, phys, size, dir);
> @@ -938,7 +938,8 @@ static dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
>   		size_t size, enum dma_data_direction dir, unsigned long attrs)
>   {
>   	return __iommu_dma_map(dev, phys, size,
> -			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO);
> +			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO,
> +			dma_get_mask(dev));
>   }
>   
>   static void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
> @@ -1041,7 +1042,8 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
>   	if (!cpu_addr)
>   		return NULL;
>   
> -	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot);
> +	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot,
> +			dev->coherent_dma_mask);
>   	if (*handle == DMA_MAPPING_ERROR) {
>   		__iommu_dma_free(dev, size, cpu_addr);
>   		return NULL;
> 
