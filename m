Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D571C6F5954
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 15:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjECNuR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 09:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjECNuO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 09:50:14 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9383CCE;
        Wed,  3 May 2023 06:50:11 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77F552F4;
        Wed,  3 May 2023 06:50:55 -0700 (PDT)
Received: from [10.57.82.232] (unknown [10.57.82.232])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85DD63F5A1;
        Wed,  3 May 2023 06:50:05 -0700 (PDT)
Message-ID: <54c28f6d-23e3-f1de-3e0d-fb0fae3040cd@arm.com>
Date:   Wed, 3 May 2023 14:50:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 05/20] iommu: Allow an IDENTITY domain as the
 default_domain in ARM32
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
References: <5-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <5-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
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

On 2023-05-01 19:02, Jason Gunthorpe wrote:
> Even though dma-iommu.c and CONFIG_ARM_DMA_USE_IOMMU do approximately the
> same stuff, the way they relate to the IOMMU core is quiet different.
> 
> dma-iommu.c expects the core code to setup an UNMANAGED domain (of type
> IOMMU_DOMAIN_DMA) and then configures itself to use that domain. This
> becomes the default_domain for the group.
> 
> ARM_DMA_USE_IOMMU does not use the default_domain, instead it directly
> allocates an UNMANAGED domain and operates it just like an external
> driver. In this case group->default_domain is NULL.
> 
> Allow iommu drivers to specify a global static identity_domain and, if
> present, automatically use this domain as the default_domain when in
> ARM_DMA_USE_IOMMU mode.
> 
> This allows drivers that implemented default_domain == NULL as an IDENTITY
> translation to trivially get a properly labeled non-NULL default_domain on
> ARM32 configs.
> 
> With this arrangment when ARM_DMA_USE_IOMMU wants to disconnect from the
> device the normal detach_domain flow will restore the IDENTITY domain as
> the default domain. Overall this makes attach_dev() of the IDENTITY domain
> called in the same places as detach_dev().
> 
> This effectively migrates these drivers to default_domain mode. For
> drivers that support ARM64 they will gain support for the IDENTITY
> translation mode for the dma_api and behave in a uniform way.
> 
> Drivers use this by setting ops->identity_domain to a static singleton
> iommu_domain that implements the identity attach. If the core detects
> ARM_DMA_USE_IOMMU mode then it automatically attaches the IDENTITY domain
> during probe.
> 
> If the driver does not want to support dma_api with translation then it
> always sets default_domain to the identity domain and even if IOMMU_DMA is
> turned on it will not allow it to be used.

Could we not retain the use of .def_domain_type for this? I think if we 
can avoid the IOMMU_DOMAIN_PLATFORM thing altogether than that's the 
more appealing option.

> This allows removing the set_platform_dma_ops() from every remaining
> driver.
> 
> Add the core support and convert rockchip to use it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c          | 13 +++++++++++++
>   drivers/iommu/rockchip-iommu.c | 19 +------------------
>   include/linux/iommu.h          |  3 +++
>   3 files changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index ba7f38630665b5..8b9af774de68f1 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1654,6 +1654,16 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
>   	if (req_type)
>   		return __iommu_group_alloc_default_domain(bus, group, req_type);
>   
> +	/*
> +	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
> +	 * identity_domain and it becomes their default domain. Later on
> +	 * ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
> +	 */
> +	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&

For the sake of reasoning, I think just use CONFIG_ARM for this. 
Otherwise we may still end up with potential corner cases of 
default_domain == NULL that we'd rather not have to accommodate.

> +	    bus->iommu_ops->identity_domain)
> +		return __iommu_group_alloc_default_domain(
> +			bus, group, IOMMU_DOMAIN_IDENTITY);

Why not simply return the identity_domain that we now know exists?

It would seem even more logical, however, to put this ARM workaround in 
iommu_get_default_domain_type() and keep the actual allocation path 
clean. Do we strictly need to check for identity_domain up front? (Note 
that as it stands this narrowly misses out on un-breaking arm-smmu for 
32-bit)

Thanks,
Robin.

> +
>   	/* The driver gave no guidance on what type to use, try the default */
>   	dom = __iommu_group_alloc_default_domain(bus, group, iommu_def_domain_type);
>   	if (dom)
> @@ -1923,6 +1933,9 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
>   	if (bus == NULL || bus->iommu_ops == NULL)
>   		return NULL;
>   
> +	if (type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
> +		return bus->iommu_ops->identity_domain;
> +
>   	domain = bus->iommu_ops->domain_alloc(type);
>   	if (!domain)
>   		return NULL;
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index ea5a3088bb7e8a..9e1296a856ac4c 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -1017,13 +1017,8 @@ static int rk_iommu_identity_attach(struct iommu_domain *identity_domain,
>   	return 0;
>   }
>   
> -static void rk_iommu_identity_free(struct iommu_domain *domain)
> -{
> -}
> -
>   static struct iommu_domain_ops rk_identity_ops = {
>   	.attach_dev = rk_iommu_identity_attach,
> -	.free = rk_iommu_identity_free,
>   };
>   
>   static struct iommu_domain rk_identity_domain = {
> @@ -1031,13 +1026,6 @@ static struct iommu_domain rk_identity_domain = {
>   	.ops = &rk_identity_ops,
>   };
>   
> -#ifdef CONFIG_ARM
> -static void rk_iommu_set_platform_dma(struct device *dev)
> -{
> -	WARN_ON(rk_iommu_identity_attach(&rk_identity_domain, dev));
> -}
> -#endif
> -
>   static int rk_iommu_attach_device(struct iommu_domain *domain,
>   		struct device *dev)
>   {
> @@ -1087,9 +1075,6 @@ static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
>   {
>   	struct rk_iommu_domain *rk_domain;
>   
> -	if (type == IOMMU_DOMAIN_IDENTITY)
> -		return &rk_identity_domain;
> -
>   	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
>   		return NULL;
>   
> @@ -1214,13 +1199,11 @@ static int rk_iommu_of_xlate(struct device *dev,
>   }
>   
>   static const struct iommu_ops rk_iommu_ops = {
> +	.identity_domain = &rk_identity_domain,
>   	.domain_alloc = rk_iommu_domain_alloc,
>   	.probe_device = rk_iommu_probe_device,
>   	.release_device = rk_iommu_release_device,
>   	.device_group = rk_iommu_device_group,
> -#ifdef CONFIG_ARM
> -	.set_platform_dma_ops = rk_iommu_set_platform_dma,
> -#endif
>   	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
>   	.of_xlate = rk_iommu_of_xlate,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index ddcad3597c177b..427490b5736d40 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -253,6 +253,8 @@ struct iommu_iotlb_gather {
>    * @pgsize_bitmap: bitmap of all possible supported page sizes
>    * @owner: Driver module providing these ops
>    * @default_domain: If not NULL this will always be set as the default domain.
> + * @identity_domain: An always available, always attachable identity
> + *                   translation.
>    */
>   struct iommu_ops {
>   	bool (*capable)(struct device *dev, enum iommu_cap);
> @@ -287,6 +289,7 @@ struct iommu_ops {
>   	unsigned long pgsize_bitmap;
>   	struct module *owner;
>   	struct iommu_domain *default_domain;
> +	struct iommu_domain *identity_domain;
>   };
>   
>   /**
