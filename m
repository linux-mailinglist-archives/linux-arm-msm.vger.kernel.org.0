Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4426977B0A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 07:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233239AbjHNFI6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 01:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233335AbjHNFIy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 01:08:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37052E5B;
        Sun, 13 Aug 2023 22:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691989733; x=1723525733;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fbQxPjZnY0DuGHhK25w0Zhh0FieYTmdMp1vAFT8U97s=;
  b=PJKQ/u1OodAVVgWEMlcV6TFibn92FwNEYGzexI5HJ1GyrQzy19YKTnOF
   kW55hlde0quLqSZHoWvbqFORtNE/WN9Zt4JOcvvA0YG1qBmtIluR3F2oN
   9SQ2oHrRomH2+BowtGZ8nR1ZASeOYfKRO/nNodHC17Lyee+iuSevn1Wyv
   cfrOGOfIQ0flguF9W/eHBKcBmf+WTSoM69mZIb8IhjQavZjSphb4h1wdn
   kgdTh3N1VMCs7dTc9j27DDT+rGQ3L5fKz04CIUV1DpjfWqpUo6mEfurv6
   +OEfDtviNpwiNQ1d+skgoLHoPKIUyYGteYt5QmNEBMPxowbc15TVCBXGC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="402946760"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="402946760"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 22:08:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="856945336"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="856945336"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.255.29.49]) ([10.255.29.49])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 22:08:41 -0700
Message-ID: <6675bf11-ed80-15b9-b8bc-dee65b595ba5@linux.intel.com>
Date:   Mon, 14 Aug 2023 13:08:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc:     baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 12/25] iommu/tegra-smmu: Support DMA domains in tegra
Content-Language: en-US
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
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
References: <12-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <12-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023/8/3 8:07, Jason Gunthorpe wrote:
> All ARM64 iommu drivers should support IOMMU_DOMAIN_DMA to enable
> dma-iommu.c.
> 
> tegra is blocking dma-iommu usage, and also default_domain's, because it
> wants an identity translation. This is needed for some device quirk. The
> correct way to do this is to support IDENTITY domains and use
> ops->def_domain_type() to return IOMMU_DOMAIN_IDENTITY for only the quirky
> devices.
> 
> Add support for IOMMU_DOMAIN_DMA and force IOMMU_DOMAIN_IDENTITY mode for
> everything so no behavior changes.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/tegra-smmu.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index f63f1d4f0bd10f..6cba034905edbf 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -276,7 +276,7 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
>   {
>   	struct tegra_smmu_as *as;
>   
> -	if (type != IOMMU_DOMAIN_UNMANAGED)
> +	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
>   		return NULL;
>   
>   	as = kzalloc(sizeof(*as), GFP_KERNEL);
> @@ -989,6 +989,12 @@ static int tegra_smmu_def_domain_type(struct device *dev)
>   }
>   
>   static const struct iommu_ops tegra_smmu_ops = {
> +	/*
> +	 * FIXME: For now we want to run all translation in IDENTITY mode,
> +	 * better would be to have a def_domain_type op do this for just the
> +	 * quirky device.
> +	 */
> +	.default_domain = &tegra_smmu_identity_domain,

tegra_smmu_def_domain_type() has already forced the core to use
ops->identity_domain, why do we still need ops->default_domain?

>   	.identity_domain = &tegra_smmu_identity_domain,
>   	.def_domain_type = &tegra_smmu_def_domain_type,
>   	.domain_alloc = tegra_smmu_domain_alloc,

Best regards,
baolu
