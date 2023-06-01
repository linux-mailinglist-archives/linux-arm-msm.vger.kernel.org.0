Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDC371F1EA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 20:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbjFASZu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 14:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjFASZs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 14:25:48 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7B12D97;
        Thu,  1 Jun 2023 11:25:46 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B9511063;
        Thu,  1 Jun 2023 11:26:31 -0700 (PDT)
Received: from [10.57.84.85] (unknown [10.57.84.85])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B053E3F663;
        Thu,  1 Jun 2023 11:25:38 -0700 (PDT)
Message-ID: <914124dd-c319-15c5-cc03-c5db0e4002f4@arm.com>
Date:   Thu, 1 Jun 2023 19:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 04/25] iommu: Add IOMMU_DOMAIN_PLATFORM for S390
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
References: <4-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <4-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
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
> The PLATFORM domain will be set as the default domain and attached as
> normal during probe. The driver will ignore the initial attach from a NULL
> domain to the PLATFORM domain.
> 
> After this, the PLATFORM domain's attach_dev will be called whenever we
> detach from an UNMANAGED domain (eg for VFIO). This is the same time the
> original design would have called op->detach_dev().
> 
> This is temporary until the S390 dma-iommu.c conversion is merged.

If we do need a stopgap here, can we please just call the current 
situation an identity domain? It's true enough in the sense that the 
IOMMU API is not offering any translation or guarantee of isolation, so 
the semantics of an identity domain - from the point of view of anything 
inside the IOMMU API that would be looking - are no weaker or less 
useful than a "platform" domain whose semantics are intentionally unknown.

Then similarly for patch #3 - since we already know s390 is temporary, 
it seems an anathema to introduce a whole domain type with its own weird 
ops->default_domain mechanism solely for POWER to not actually use 
domains with.

In terms of reasoning, I don't see that IOMMU_DOMAIN_PLATFORM is any 
more useful than a NULL default domain, it just renames the problem, and 
gives us more code to maintain for the privilege. As I say, though, we 
don't actually need to juggle the semantic of a "we don't know what's 
happening here" domain around any further, since it works out that a 
"we're not influencing anything here" domain actually suffices for what 
we want to reason about, and those are already well-defined. Sure, the 
platform DMA ops *might* be doing more, but that's beyond the scope of 
the IOMMU API either way. At that point, lo and behold, s390 and POWER 
now look just like ARM and the core code only needs a single special 
case for arch-specific default identity domains, lovely!

Thanks,
Robin.

> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/s390-iommu.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
> index fbf59a8db29b11..f0c867c57a5b9b 100644
> --- a/drivers/iommu/s390-iommu.c
> +++ b/drivers/iommu/s390-iommu.c
> @@ -142,14 +142,31 @@ static int s390_iommu_attach_device(struct iommu_domain *domain,
>   	return 0;
>   }
>   
> -static void s390_iommu_set_platform_dma(struct device *dev)
> +/*
> + * Switch control over the IOMMU to S390's internal dma_api ops
> + */
> +static int s390_iommu_platform_attach(struct iommu_domain *platform_domain,
> +				      struct device *dev)
>   {
>   	struct zpci_dev *zdev = to_zpci_dev(dev);
>   
> +	if (!zdev->s390_domain)
> +		return 0;
> +
>   	__s390_iommu_detach_device(zdev);
>   	zpci_dma_init_device(zdev);
> +	return 0;
>   }
>   
> +static struct iommu_domain_ops s390_iommu_platform_ops = {
> +	.attach_dev = s390_iommu_platform_attach,
> +};
> +
> +static struct iommu_domain s390_iommu_platform_domain = {
> +	.type = IOMMU_DOMAIN_PLATFORM,
> +	.ops = &s390_iommu_platform_ops,
> +};
> +
>   static void s390_iommu_get_resv_regions(struct device *dev,
>   					struct list_head *list)
>   {
> @@ -428,12 +445,12 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
>   }
>   
>   static const struct iommu_ops s390_iommu_ops = {
> +	.default_domain = &s390_iommu_platform_domain,
>   	.capable = s390_iommu_capable,
>   	.domain_alloc = s390_domain_alloc,
>   	.probe_device = s390_iommu_probe_device,
>   	.release_device = s390_iommu_release_device,
>   	.device_group = generic_device_group,
> -	.set_platform_dma_ops = s390_iommu_set_platform_dma,
>   	.pgsize_bitmap = SZ_4K,
>   	.get_resv_regions = s390_iommu_get_resv_regions,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
