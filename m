Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC1DD6F56A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 12:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjECK6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 06:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjECK6L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 06:58:11 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0C4C849DA;
        Wed,  3 May 2023 03:58:10 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E71872F4;
        Wed,  3 May 2023 03:58:53 -0700 (PDT)
Received: from [10.57.82.232] (unknown [10.57.82.232])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 499853F67D;
        Wed,  3 May 2023 03:58:04 -0700 (PDT)
Message-ID: <32aa1228-3eb9-340a-41e7-88fdd7c0a5ac@arm.com>
Date:   Wed, 3 May 2023 11:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 04/20] iommu/fsl_pamu: Replace set_platform_dma_ops() with
 IOMMU_DOMAIN_PLATFORM
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
References: <4-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <4-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
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
> It is not clear what this is actually doing, most likely this is IDENTITY
> behavior, but I think there is a chance it is BLOCKING given how the PAMU
> stuff is oddly used.

Logically it has to be identity, since there are no DMA ops interacting 
with this driver (it's not the TCE IOMMU of 
arch/powerpc/kernel/iommu.c), so any device using a kernel driver rather 
than VFIO must be using dma-direct and thus require an identity mapping.

At this point I finally got sufficiently fed up of this driver always 
being the mystery weirdo and tracked down an old QorIQ reference manual, 
and now I have about half an hours' worth of understanding of how the 
PAMU actually works.

Based on that, what setup_liodns() is doing is indeed setting up 
identity for everything initially. It also becomes apparent that it's 
never supported giving a PCI device back to its regular driver after 
using vfio-pci, since an attach/detach cycle will then leave the PPAACE 
invalid and thus DMA blocked. Oh well, that's been broken for 10 years; 
nobody cares. Call it an identity domain and move on.

Thanks,
Robin.

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/fsl_pamu_domain.c | 29 ++++++++++++++++++++++++++---
>   1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
> index bce37229709965..4c65f1adfe7511 100644
> --- a/drivers/iommu/fsl_pamu_domain.c
> +++ b/drivers/iommu/fsl_pamu_domain.c
> @@ -283,15 +283,28 @@ static int fsl_pamu_attach_device(struct iommu_domain *domain,
>   	return ret;
>   }
>   
> -static void fsl_pamu_set_platform_dma(struct device *dev)
> +/*
> + * FIXME: This seems to turn off the iommu HW but it is not obvious what state
> + * it leaves the HW in. This is probably really a BLOCKING or IDENTITY domain.
> + * For now this ensures that the old detach_dev behavior functions about the
> + * same as it always did, and we turn off the IOMMU whenever the UNMANAGED
> + * domain is detached.
> + */
> +static int fsl_pamu_platform_attach(struct iommu_domain *platform_domain,
> +				    struct device *dev)
>   {
>   	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
> -	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
> +	struct fsl_dma_domain *dma_domain;
>   	const u32 *prop;
>   	int len;
>   	struct pci_dev *pdev = NULL;
>   	struct pci_controller *pci_ctl;
>   
> +	if (domain == platform_domain || !domain)
> +		return 0;
> +
> +	dma_domain = to_fsl_dma_domain(domain);
> +
>   	/*
>   	 * Use LIODN of the PCI controller while detaching a
>   	 * PCI device.
> @@ -312,8 +325,18 @@ static void fsl_pamu_set_platform_dma(struct device *dev)
>   		detach_device(dev, dma_domain);
>   	else
>   		pr_debug("missing fsl,liodn property at %pOF\n", dev->of_node);
> +	return 0;
>   }
>   
> +static struct iommu_domain_ops fsl_pamu_platform_ops = {
> +	.attach_dev = fsl_pamu_platform_attach,
> +};
> +
> +static struct iommu_domain fsl_pamu_platform_domain = {
> +	.type = IOMMU_DOMAIN_PLATFORM,
> +	.ops = &fsl_pamu_platform_ops,
> +};
> +
>   /* Set the domain stash attribute */
>   int fsl_pamu_configure_l1_stash(struct iommu_domain *domain, u32 cpu)
>   {
> @@ -448,11 +471,11 @@ static struct iommu_device *fsl_pamu_probe_device(struct device *dev)
>   }
>   
>   static const struct iommu_ops fsl_pamu_ops = {
> +	.default_domain = &fsl_pamu_platform_domain,
>   	.capable	= fsl_pamu_capable,
>   	.domain_alloc	= fsl_pamu_domain_alloc,
>   	.probe_device	= fsl_pamu_probe_device,
>   	.device_group   = fsl_pamu_device_group,
> -	.set_platform_dma_ops = fsl_pamu_set_platform_dma,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
>   		.attach_dev	= fsl_pamu_attach_device,
>   		.iova_to_phys	= fsl_pamu_iova_to_phys,
