Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA3F6F5CE3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 19:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjECRSZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 13:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjECRSY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 13:18:24 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7A0F94C07;
        Wed,  3 May 2023 10:18:08 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D88D2F4;
        Wed,  3 May 2023 10:18:52 -0700 (PDT)
Received: from [10.57.82.232] (unknown [10.57.82.232])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4EBB3F64C;
        Wed,  3 May 2023 10:18:02 -0700 (PDT)
Message-ID: <fa8c5e95-b8c8-f4c0-63a0-d3176718d304@arm.com>
Date:   Wed, 3 May 2023 18:17:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 18/20] iommu: Add ops->domain_alloc_paging()
Content-Language: en-GB
To:     Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Steven Price <steven.price@arm.com>
References: <18-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <18-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-01 19:03, Jason Gunthorpe wrote:
> This callback requests the driver to create only a __IOMMU_DOMAIN_PAGING
> domain, so it saves a few lines in a lot of drivers needlessly checking
> the type.
> 
> More critically, this allows us to sweep out all the
> IOMMU_DOMAIN_UNMANAGED and IOMMU_DOMAIN_DMA checks from a lot of the
> drivers, simplifying what is going on in the code and ultimately removing
> the now-unused special cases in drivers where they did not support
> IOMMU_DOMAIN_DMA.
> 
> domain_alloc_paging() should return a struct iommu_domain that is
> functionally compatible with ARM_DMA_USE_IOMMU, dma-iommu.c and iommufd.
> 
> Be forwards looking and pass in a 'struct device *' argument. We can
> provide this when allocating the default_domain. No drivers will look at
> this.

As discussed previously, we're going to want a way for callers to pass 
through various options as well, initially to replace 
iommu_set_pgtable_quirks() at the very least. Maybe passing an 
easily-extensible structure around is the even better option? (Wherein 
we could even strictly enforce "no drivers will look at this" for the 
moment by leaving it empty)

I'm hoping I'll get another version of my bus ops removal out this 
cycle; there's obviously a lot of overlap here to figure out.

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 40 ++++++++++++++++++++++++----------------
>   include/linux/iommu.h |  2 ++
>   2 files changed, 26 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index f20a031e2910b2..fee417df8f195d 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -93,6 +93,7 @@ static int iommu_bus_notifier(struct notifier_block *nb,
>   			      unsigned long action, void *data);
>   static void iommu_release_device(struct device *dev);
>   static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
> +						 struct device *dev,
>   						 unsigned type);
>   static int __iommu_attach_device(struct iommu_domain *domain,
>   				 struct device *dev);
> @@ -1618,12 +1619,12 @@ static int iommu_get_def_domain_type(struct device *dev)
>   }
>   
>   static struct iommu_domain *
> -__iommu_group_alloc_default_domain(struct bus_type *bus,
> +__iommu_group_alloc_default_domain(struct group_device *gdev,
>   				   struct iommu_group *group, int req_type)
>   {
>   	if (group->default_domain && group->default_domain->type == req_type)
>   		return group->default_domain;
> -	return __iommu_domain_alloc(bus, req_type);
> +	return __iommu_domain_alloc(gdev->dev->bus, gdev->dev, req_type);
>   }
>   
>   /*
> @@ -1633,9 +1634,9 @@ __iommu_group_alloc_default_domain(struct bus_type *bus,
>   static struct iommu_domain *
>   iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
>   {
> -	struct bus_type *bus =
> -		list_first_entry(&group->devices, struct group_device, list)
> -			->dev->bus;
> +	struct group_device *gdev =
> +		list_first_entry(&group->devices, struct group_device, list);

Eww, why pass around a group_device that nobody wants? Keeping the 
single dereference of ->dev here, rather than the three above and below, 
would be cleaner. And it makes my iommu_group_first_device() helper look 
even more appealing, if I dare say so myself :)

> +	const struct iommu_ops *ops = dev_iommu_ops(gdev->dev);
>   	struct iommu_domain *dom;
>   
>   	lockdep_assert_held(&group->mutex);
> @@ -1645,14 +1646,15 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
>   	 * domain. This should always be either an IDENTITY or PLATFORM domain.
>   	 * Do not use in new drivers.
>   	 */
> -	if (bus->iommu_ops->default_domain) {
> +	if (ops->default_domain) {
>   		if (req_type)
>   			return ERR_PTR(-EINVAL);
> -		return bus->iommu_ops->default_domain;
> +		return ops->default_domain;
>   	}
>   
>   	if (req_type)
> -		return __iommu_group_alloc_default_domain(bus, group, req_type);
> +		return __iommu_group_alloc_default_domain(gdev, group,
> +							  req_type);
>   
>   	/*
>   	 * If ARM32 CONFIG_ARM_DMA_USE_IOMMU is enabled and the driver doesn't
> @@ -1665,18 +1667,19 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
>   				IS_ENABLED(CONFIG_IOMMU_DMA)));
>   
>   		return __iommu_group_alloc_default_domain(
> -			bus, group, IOMMU_DOMAIN_IDENTITY);
> +			gdev, group, IOMMU_DOMAIN_IDENTITY);
>   	}
>   
>   	/* The driver gave no guidance on what type to use, try the default */
> -	dom = __iommu_group_alloc_default_domain(bus, group, iommu_def_domain_type);
> +	dom = __iommu_group_alloc_default_domain(gdev, group,
> +						 iommu_def_domain_type);
>   	if (dom)
>   		return dom;
>   
>   	/* Otherwise IDENTITY and DMA_FQ defaults will try DMA */
>   	if (iommu_def_domain_type == IOMMU_DOMAIN_DMA)
>   		return NULL;
> -	dom = __iommu_group_alloc_default_domain(bus, group, IOMMU_DOMAIN_DMA);
> +	dom = __iommu_group_alloc_default_domain(gdev, group, IOMMU_DOMAIN_DMA);
>   	if (!dom)
>   		return NULL;
>   
> @@ -1930,6 +1933,7 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
>   EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
>   
>   static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
> +						 struct device *dev,
>   						 unsigned type)
>   {
>   	struct iommu_domain *domain;
> @@ -1940,7 +1944,11 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
>   	if (type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
>   		return bus->iommu_ops->identity_domain;
>   
> -	domain = bus->iommu_ops->domain_alloc(type);
> +	if ((type == IOMMU_DOMAIN_UNMANAGED || type == IOMMU_DOMAIN_DMA) &&

Logically, "type & __IOMMU_DOMAIN_PAGING", otherwise we're already 
missing IOMMU_DOMAIN_DMA_FQ. Except maybe that's deliberate? Not sure 
how much I like the idea of a introducing new interface design that we 
clearly can't even convert all the current drivers to as it stands :/

> +	    bus->iommu_ops->domain_alloc_paging)
> +		domain = bus->iommu_ops->domain_alloc_paging(dev);
> +	else
> +		domain = bus->iommu_ops->domain_alloc(type);
>   	if (!domain)
>   		return NULL;
>   
> @@ -1964,7 +1972,7 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
>   
>   struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
>   {
> -	return __iommu_domain_alloc(bus, IOMMU_DOMAIN_UNMANAGED);
> +	return __iommu_domain_alloc(bus, NULL, IOMMU_DOMAIN_UNMANAGED);
>   }
>   EXPORT_SYMBOL_GPL(iommu_domain_alloc);
>   
> @@ -3079,15 +3087,15 @@ static int __iommu_group_alloc_blocking_domain(struct iommu_group *group)
>   	if (group->blocking_domain)
>   		return 0;
>   
> -	group->blocking_domain =
> -		__iommu_domain_alloc(dev->dev->bus, IOMMU_DOMAIN_BLOCKED);
> +	group->blocking_domain = __iommu_domain_alloc(dev->dev->bus, dev->dev,
> +						      IOMMU_DOMAIN_BLOCKED);
>   	if (!group->blocking_domain) {
>   		/*
>   		 * For drivers that do not yet understand IOMMU_DOMAIN_BLOCKED
>   		 * create an empty domain instead.
>   		 */
>   		group->blocking_domain = __iommu_domain_alloc(
> -			dev->dev->bus, IOMMU_DOMAIN_UNMANAGED);
> +			dev->dev->bus, dev->dev, IOMMU_DOMAIN_UNMANAGED);
>   		if (!group->blocking_domain)
>   			return -EINVAL;
>   	}
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index f6a28ab78e607e..cc9aff2d213eec 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -227,6 +227,7 @@ struct iommu_iotlb_gather {
>    * struct iommu_ops - iommu ops and capabilities
>    * @capable: check capability
>    * @domain_alloc: allocate iommu domain
> + * @domain_alloc_paging: Allocate an IOMMU_DOMAIN_UNMANAGED

...except for the other types of paging-capable domain which also exist 
and it also allocates :/

There remains good reason to keep track of the distinct subtypes of 
paging domain within the IOMMU core (i.e. between iommu.c and 
dma-iommu.c) even if drivers do finally get absolved of all the details. 
Sure we could come up with any number of different ways to encode those 
distinctions, but they wouldn't be objectively better than the domain 
flags and types we already have, they'd just be different.

Thanks,
Robin.

>    * @probe_device: Add device to iommu driver handling
>    * @release_device: Remove device from iommu driver handling
>    * @probe_finalize: Do final setup work after the device is added to an IOMMU
> @@ -258,6 +259,7 @@ struct iommu_ops {
>   
>   	/* Domain allocation and freeing by the iommu driver */
>   	struct iommu_domain *(*domain_alloc)(unsigned iommu_domain_type);
> +	struct iommu_domain *(*domain_alloc_paging)(struct device *dev);
>   
>   	struct iommu_device *(*probe_device)(struct device *dev);
>   	void (*release_device)(struct device *dev);
