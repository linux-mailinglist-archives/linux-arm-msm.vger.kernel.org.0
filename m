Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384EB6F5B32
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 17:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbjECPbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 11:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbjECPbv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 11:31:51 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A6A1A5592;
        Wed,  3 May 2023 08:31:49 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 287FE2F4;
        Wed,  3 May 2023 08:32:33 -0700 (PDT)
Received: from [10.57.82.232] (unknown [10.57.82.232])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E3243F5A1;
        Wed,  3 May 2023 08:31:43 -0700 (PDT)
Message-ID: <aaddd64b-6935-f84a-5fda-28011c717051@arm.com>
Date:   Wed, 3 May 2023 16:31:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 06/20] iommu/exynos: Implement an IDENTITY domain
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
References: <6-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <6-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
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
> What exynos calls exynos_iommu_detach_device is actually putting the iommu
> into identity mode.
> 
> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/exynos-iommu.c | 64 ++++++++++++++++++------------------
>   1 file changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index c275fe71c4db32..6ff7901103948a 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -24,6 +24,7 @@
>   
>   typedef u32 sysmmu_iova_t;
>   typedef u32 sysmmu_pte_t;
> +static struct iommu_domain exynos_identity_domain;
>   
>   /* We do not consider super section mapping (16MB) */
>   #define SECT_ORDER 20
> @@ -829,7 +830,7 @@ static int __maybe_unused exynos_sysmmu_suspend(struct device *dev)
>   		struct exynos_iommu_owner *owner = dev_iommu_priv_get(master);
>   
>   		mutex_lock(&owner->rpm_lock);
> -		if (data->domain) {
> +		if (&data->domain->domain != &exynos_identity_domain) {
>   			dev_dbg(data->sysmmu, "saving state\n");
>   			__sysmmu_disable(data);
>   		}
> @@ -847,7 +848,7 @@ static int __maybe_unused exynos_sysmmu_resume(struct device *dev)
>   		struct exynos_iommu_owner *owner = dev_iommu_priv_get(master);
>   
>   		mutex_lock(&owner->rpm_lock);
> -		if (data->domain) {
> +		if (&data->domain->domain != &exynos_identity_domain) {
>   			dev_dbg(data->sysmmu, "restoring state\n");
>   			__sysmmu_enable(data);
>   		}
> @@ -980,17 +981,22 @@ static void exynos_iommu_domain_free(struct iommu_domain *iommu_domain)
>   	kfree(domain);
>   }
>   
> -static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
> -				    struct device *dev)
> +static int exynos_iommu_identity_attach(struct iommu_domain *identity_domain,
> +					struct device *dev)
>   {
> -	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
>   	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
> -	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
> +	struct exynos_iommu_domain *domain;
> +	phys_addr_t pagetable;
>   	struct sysmmu_drvdata *data, *next;
>   	unsigned long flags;
>   
> -	if (!has_sysmmu(dev) || owner->domain != iommu_domain)
> -		return;
> +	if (!owner)
> +		return -ENODEV;

That can't be true - devices can't be attached without having already 
dereferenced their group, which means they've been through probe_device 
successfully.

> +	if (owner->domain == identity_domain)
> +		return 0;
> +
> +	domain = to_exynos_domain(owner->domain);
> +	pagetable = virt_to_phys(domain->pgtable);

Identity domains by definition shouldn't have a pagetable? I don't think 
virt_to_phys(NULL) can be assumed to be valid or safe in general.

>   
>   	mutex_lock(&owner->rpm_lock);
>   
> @@ -1009,15 +1015,25 @@ static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
>   		list_del_init(&data->domain_node);
>   		spin_unlock(&data->lock);
>   	}

This iterates the whole domain->clients list, which may include other 
devices from other groups belonging to other IOMMU instances. I think 
that's technically an issue already given that we support cross-instance 
domain attach here, which the DRM drivers rely on. I can't quite work 
out off-hand if this is liable to make it any worse or not :/

> -	owner->domain = NULL;
> +	owner->domain = identity_domain;
>   	spin_unlock_irqrestore(&domain->lock, flags);
>   
>   	mutex_unlock(&owner->rpm_lock);
>   
>   	dev_dbg(dev, "%s: Detached IOMMU with pgtable %pa\n", __func__,

This no longer makes much sense.

>   		&pagetable);
> +	return 0;
>   }
>   
> +static struct iommu_domain_ops exynos_identity_ops = {
> +	.attach_dev = exynos_iommu_identity_attach,
> +};
> +
> +static struct iommu_domain exynos_identity_domain = {
> +	.type = IOMMU_DOMAIN_IDENTITY,
> +	.ops = &exynos_identity_ops,
> +};
> +
>   static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
>   				   struct device *dev)
>   {
> @@ -1026,12 +1042,11 @@ static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
>   	struct sysmmu_drvdata *data;
>   	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
>   	unsigned long flags;
> +	int err;
>   
> -	if (!has_sysmmu(dev))
> -		return -ENODEV;
> -
> -	if (owner->domain)
> -		exynos_iommu_detach_device(owner->domain, dev);
> +	err = exynos_iommu_identity_attach(&exynos_identity_domain, dev);
> +	if (err)
> +		return err;
>   
>   	mutex_lock(&owner->rpm_lock);
>   
> @@ -1407,26 +1422,12 @@ static struct iommu_device *exynos_iommu_probe_device(struct device *dev)
>   	return &data->iommu;
>   }
>   
> -static void exynos_iommu_set_platform_dma(struct device *dev)
> -{
> -	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
> -
> -	if (owner->domain) {
> -		struct iommu_group *group = iommu_group_get(dev);
> -
> -		if (group) {
> -			exynos_iommu_detach_device(owner->domain, dev);
> -			iommu_group_put(group);
> -		}
> -	}
> -}
> -
>   static void exynos_iommu_release_device(struct device *dev)
>   {
>   	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
>   	struct sysmmu_drvdata *data;
>   
> -	exynos_iommu_set_platform_dma(dev);
> +	WARN_ON(exynos_iommu_identity_attach(&exynos_identity_domain, dev));
>   
>   	list_for_each_entry(data, &owner->controllers, owner_node)
>   		device_link_del(data->link);
> @@ -1457,6 +1458,7 @@ static int exynos_iommu_of_xlate(struct device *dev,
>   
>   		INIT_LIST_HEAD(&owner->controllers);
>   		mutex_init(&owner->rpm_lock);
> +		owner->domain = &exynos_identity_domain;

I think strictly this would be more of a probe_device thing than an 
of_xlate thing, but it's not super-important.

Thanks,
Robin.

>   		dev_iommu_priv_set(dev, owner);
>   	}
>   
> @@ -1471,11 +1473,9 @@ static int exynos_iommu_of_xlate(struct device *dev,
>   }
>   
>   static const struct iommu_ops exynos_iommu_ops = {
> +	.identity_domain = &exynos_identity_domain,
>   	.domain_alloc = exynos_iommu_domain_alloc,
>   	.device_group = generic_device_group,
> -#ifdef CONFIG_ARM
> -	.set_platform_dma_ops = exynos_iommu_set_platform_dma,
> -#endif
>   	.probe_device = exynos_iommu_probe_device,
>   	.release_device = exynos_iommu_release_device,
>   	.pgsize_bitmap = SECT_SIZE | LPAGE_SIZE | SPAGE_SIZE,
