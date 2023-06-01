Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC09071F2CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 21:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbjFATSM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 15:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbjFATSL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 15:18:11 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DDB9013E;
        Thu,  1 Jun 2023 12:18:09 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA9851063;
        Thu,  1 Jun 2023 12:18:54 -0700 (PDT)
Received: from [10.57.84.85] (unknown [10.57.84.85])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DDC93F7BD;
        Thu,  1 Jun 2023 12:18:00 -0700 (PDT)
Message-ID: <13fb6807-d8b9-9808-c528-6df6ae9ca78a@arm.com>
Date:   Thu, 1 Jun 2023 20:17:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 23/25] iommu: Add ops->domain_alloc_paging()
Content-Language: en-GB
To:     Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Kevin Tian <kevin.tian@intel.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linuxppc-dev@lists.ozlabs.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
References: <23-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <23-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-16 01:00, Jason Gunthorpe wrote:
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

As mentioned before, we already know we're going to need additional 
flags (and possibly data) to cover the existing set_pgtable_quirks 
use-case plus new stuff like the proposed dirty-tracking enable, so I'd 
be inclined to either add an extensible structure argument now to avoid 
future churn, or just not bother adding the device argument either until 
drivers can actually use it.

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 18 +++++++++++++++---
>   include/linux/iommu.h |  3 +++
>   2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index c4cac1dcf80610..15aa51c356bd74 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1995,14 +1995,25 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
>   EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
>   
>   static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
> +						 struct device *dev,
>   						 unsigned int type)
>   {
>   	struct iommu_domain *domain;
>   
>   	if (type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
>   		return ops->identity_domain;
> +	else if ((type == IOMMU_DOMAIN_UNMANAGED || type == IOMMU_DOMAIN_DMA) &&
> +		 ops->domain_alloc_paging) {
> +		/*
> +		 * For now exclude DMA_FQ since it is still a driver policy
> +		 * decision through domain_alloc() if we can use FQ mode.
> +		 */

That's sorted now, so the type test can neatly collapse down to "type & 
__IOMMU_DOMAIN_PAGING".

Thanks,
Robin.

> +		domain = ops->domain_alloc_paging(dev);
> +	} else if (ops->domain_alloc)
> +		domain = ops->domain_alloc(type);
> +	else
> +		return NULL;
>   
> -	domain = ops->domain_alloc(type);
>   	if (!domain)
>   		return NULL;
>   
> @@ -2033,14 +2044,15 @@ __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
>   
>   	lockdep_assert_held(&group->mutex);
>   
> -	return __iommu_domain_alloc(dev_iommu_ops(dev), type);
> +	return __iommu_domain_alloc(dev_iommu_ops(dev), dev, type);
>   }
>   
>   struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
>   {
>   	if (bus == NULL || bus->iommu_ops == NULL)
>   		return NULL;
> -	return __iommu_domain_alloc(bus->iommu_ops, IOMMU_DOMAIN_UNMANAGED);
> +	return __iommu_domain_alloc(bus->iommu_ops, NULL,
> +				    IOMMU_DOMAIN_UNMANAGED);
>   }
>   EXPORT_SYMBOL_GPL(iommu_domain_alloc);
>   
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 387746f8273c99..18b0df42cc80d1 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -227,6 +227,8 @@ struct iommu_iotlb_gather {
>    * struct iommu_ops - iommu ops and capabilities
>    * @capable: check capability
>    * @domain_alloc: allocate iommu domain
> + * @domain_alloc_paging: Allocate an iommu_domain that can be used for
> + *                       UNMANAGED, DMA, and DMA_FQ domain types.
>    * @probe_device: Add device to iommu driver handling
>    * @release_device: Remove device from iommu driver handling
>    * @probe_finalize: Do final setup work after the device is added to an IOMMU
> @@ -258,6 +260,7 @@ struct iommu_ops {
>   
>   	/* Domain allocation and freeing by the iommu driver */
>   	struct iommu_domain *(*domain_alloc)(unsigned iommu_domain_type);
> +	struct iommu_domain *(*domain_alloc_paging)(struct device *dev);
>   
>   	struct iommu_device *(*probe_device)(struct device *dev);
>   	void (*release_device)(struct device *dev);
