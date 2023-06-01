Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1A471F314
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 21:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbjFATiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 15:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbjFATh7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 15:37:59 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D343A184;
        Thu,  1 Jun 2023 12:37:57 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8F4A1063;
        Thu,  1 Jun 2023 12:38:42 -0700 (PDT)
Received: from [10.57.84.85] (unknown [10.57.84.85])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 549F63F7BD;
        Thu,  1 Jun 2023 12:37:50 -0700 (PDT)
Message-ID: <84aa0f5e-f13d-40f5-abe6-e8ac231e2d95@arm.com>
Date:   Thu, 1 Jun 2023 20:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 09/25] iommu/fsl_pamu: Implement an IDENTITY domain
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
References: <9-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <9-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
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
> Robin was able to check the documentation and what fsl_pamu has
> historically called detach_dev() is really putting the IOMMU into an
> IDENTITY mode.

Unfortunately it was the other way around - it's the call to 
fsl_setup_liodns() from fsl_pamu_probe() which leaves everything in 
bypass by default (the PAACE_ATM_NO_XLATE part, IIRC), whereas the 
detach_device() call here ends up disabling the given device's LIODN 
altogether. There doesn't appear to have ever been any code anywhere for 
putting things *back* into bypass after using a VFIO domain, so as-is 
these default domains would probably break all DMA :(

Thanks,
Robin.

> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain. This is a ppc driver without any dma_ops, so ensure
> the identity translation is the default domain.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/fsl_pamu_domain.c | 32 +++++++++++++++++++++++++++++---
>   1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
> index bce37229709965..ca4f5ebf028783 100644
> --- a/drivers/iommu/fsl_pamu_domain.c
> +++ b/drivers/iommu/fsl_pamu_domain.c
> @@ -283,15 +283,21 @@ static int fsl_pamu_attach_device(struct iommu_domain *domain,
>   	return ret;
>   }
>   
> -static void fsl_pamu_set_platform_dma(struct device *dev)
> +static int fsl_pamu_identity_attach(struct iommu_domain *platform_domain,
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
> @@ -312,8 +318,18 @@ static void fsl_pamu_set_platform_dma(struct device *dev)
>   		detach_device(dev, dma_domain);
>   	else
>   		pr_debug("missing fsl,liodn property at %pOF\n", dev->of_node);
> +	return 0;
>   }
>   
> +static struct iommu_domain_ops fsl_pamu_identity_ops = {
> +	.attach_dev = fsl_pamu_identity_attach,
> +};
> +
> +static struct iommu_domain fsl_pamu_identity_domain = {
> +	.type = IOMMU_DOMAIN_IDENTITY,
> +	.ops = &fsl_pamu_identity_ops,
> +};
> +
>   /* Set the domain stash attribute */
>   int fsl_pamu_configure_l1_stash(struct iommu_domain *domain, u32 cpu)
>   {
> @@ -447,12 +463,22 @@ static struct iommu_device *fsl_pamu_probe_device(struct device *dev)
>   	return &pamu_iommu;
>   }
>   
> +static int fsl_pamu_def_domain_type(struct device *dev)
> +{
> +	/*
> +	 * This platform does not use dma_ops at all so the normally the iommu
> +	 * must be in identity mode
> +	 */
> +	return IOMMU_DOMAIN_IDENTITY;
> +}
> +
>   static const struct iommu_ops fsl_pamu_ops = {
> +	.identity_domain = &fsl_pamu_identity_domain,
> +	.def_domain_type = &fsl_pamu_def_domain_type,
>   	.capable	= fsl_pamu_capable,
>   	.domain_alloc	= fsl_pamu_domain_alloc,
>   	.probe_device	= fsl_pamu_probe_device,
>   	.device_group   = fsl_pamu_device_group,
> -	.set_platform_dma_ops = fsl_pamu_set_platform_dma,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
>   		.attach_dev	= fsl_pamu_attach_device,
>   		.iova_to_phys	= fsl_pamu_iova_to_phys,
