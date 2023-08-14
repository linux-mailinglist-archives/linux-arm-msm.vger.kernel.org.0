Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5266F77B09A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 07:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbjHNFCW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 01:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233208AbjHNFCK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 01:02:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D9AFE63;
        Sun, 13 Aug 2023 22:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691989329; x=1723525329;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qwK+HZvZ0fxHQu3F1Z1BO2CvSFGyEyEeAyWPyrYe3b0=;
  b=CVUZaliPmMYJAOYXBKneuBYR8VfcELtj8Y8LSb2/i60cI7k/c9r0T728
   j+lkLDwEZAF8fvCvU8Z8GlZUZDheB3EeZgLAyP3Vb/uIF+UNvXk2LVLwH
   7dU8qg954xzLZy9F0QgYx33Lv7jaCJCu4P19zAIUcBdQNe7zQQoXPekXs
   ElI1zU4BRAe87sP67iDxtl8lINkdz99GflKBcN7w+8gUbif+EcfnfNNcE
   p8PLb4FM6/wdSBQImplIVW+hoJ8+fuBcEXp2VZzu0ZL8uE8UEn1wTUex7
   zje+R3SzeJe1HiiCaXPRxWpHNdRsg0kCw36v4mtFoc3ibz+X37Bm0ZrNk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="402945778"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="402945778"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 22:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="1063930020"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="1063930020"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.255.29.49]) ([10.255.29.49])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 22:01:57 -0700
Message-ID: <682666dc-3b43-5866-1025-0d0170eb4d86@linux.intel.com>
Date:   Mon, 14 Aug 2023 13:01:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc:     baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 11/25] iommu/tegra-smmu: Implement an IDENTITY domain
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
References: <11-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <11-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
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
> What tegra-smmu does during tegra_smmu_set_platform_dma() is actually
> putting the iommu into identity mode.
> 
> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/tegra-smmu.c | 37 ++++++++++++++++++++++++++++++++-----
>   1 file changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 1cbf063ccf147a..f63f1d4f0bd10f 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -511,23 +511,39 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
>   	return err;
>   }
>   
> -static void tegra_smmu_set_platform_dma(struct device *dev)
> +static int tegra_smmu_identity_attach(struct iommu_domain *identity_domain,
> +				      struct device *dev)
>   {
>   	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> -	struct tegra_smmu_as *as = to_smmu_as(domain);
> -	struct tegra_smmu *smmu = as->smmu;
> +	struct tegra_smmu_as *as;
> +	struct tegra_smmu *smmu;
>   	unsigned int index;
>   
>   	if (!fwspec)
> -		return;
> +		return -ENODEV;
>   
> +	if (domain == identity_domain || !domain)
> +		return 0;
> +
> +	as = to_smmu_as(domain);
> +	smmu = as->smmu;
>   	for (index = 0; index < fwspec->num_ids; index++) {
>   		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
>   		tegra_smmu_as_unprepare(smmu, as);
>   	}
> +	return 0;
>   }
>   
> +static struct iommu_domain_ops tegra_smmu_identity_ops = {
> +	.attach_dev = tegra_smmu_identity_attach,
> +};
> +
> +static struct iommu_domain tegra_smmu_identity_domain = {
> +	.type = IOMMU_DOMAIN_IDENTITY,
> +	.ops = &tegra_smmu_identity_ops,
> +};
> +
>   static void tegra_smmu_set_pde(struct tegra_smmu_as *as, unsigned long iova,
>   			       u32 value)
>   {
> @@ -962,11 +978,22 @@ static int tegra_smmu_of_xlate(struct device *dev,
>   	return iommu_fwspec_add_ids(dev, &id, 1);
>   }
>   
> +static int tegra_smmu_def_domain_type(struct device *dev)
> +{
> +	/*
> +	 * FIXME: For now we want to run all translation in IDENTITY mode, due
> +	 * to some device quirks. Better would be to just quirk the troubled
> +	 * devices.
> +	 */
> +	return IOMMU_DOMAIN_IDENTITY;
> +}

Hope somebody can fix this later on.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
