Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 233ED77AFDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 05:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbjHNDGj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Aug 2023 23:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjHNDG1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Aug 2023 23:06:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD4C124;
        Sun, 13 Aug 2023 20:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691982386; x=1723518386;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gy0wdGHdwqfhCuqKLzj0CQNWQFqYcsM4kuaHT4waVN4=;
  b=i6K1N6/dLptkKPPXtK/+bkb2qtYn8C9Ffo97A04i7ppQhGfg5/8YYL1y
   YanwtYGO38LNe0WVMTUu4rcN+56neYrLT3Frg9kmtsKdg8fsgasXDyJT6
   9QyColzNEHzXAUwar7gz/tcbVmnxpUvGtgnms0vSm2TYx3p3x8udexMnM
   L7PxwQTFbGgRNGDUkE4eHgXuOpRyCvKCIJ3ObOgzfX8k892sFeb3+gdl0
   DZ6r7AKNFtbB8c97OBamyni4Qh7e9ZkF4FM19wCynX/euph1mX7H5MgC4
   P2Kv/Y/c4srHLqaevdpmn2lrnX9HPPLoQGvsTF84TsJl+f4SUdbApzHUR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="369422534"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="369422534"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 20:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="856923909"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="856923909"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.255.29.49]) ([10.255.29.49])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 20:06:14 -0700
Message-ID: <7b6b8118-813a-f4cd-1067-d209d2b40025@linux.intel.com>
Date:   Mon, 14 Aug 2023 11:06:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc:     baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 07/25] iommu/mtk_iommu_v1: Implement an IDENTITY domain
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
References: <7-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <7-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023/8/3 8:07, Jason Gunthorpe wrote:
> What mtk does during mtk_iommu_v1_set_platform_dma() is actually putting
> the iommu into identity mode. Make this available as a proper IDENTITY
> domain.
> 
> The mtk_iommu_v1_def_domain_type() from
> commit 8bbe13f52cb7 ("iommu/mediatek-v1: Add def_domain_type") explains
> this was needed to allow probe_finalize() to be called, but now the
> IDENTITY domain will do the same job so change the returned
> def_domain_type.
> 
> mkt_v1 is the only driver that returns IOMMU_DOMAIN_UNMANAGED from
> def_domain_type().  This allows the next patch to enforce an IDENTITY
> domain policy for this driver.

This code seems to be not working properly.

  * @def_domain_type: device default domain type, return value:
  *              - IOMMU_DOMAIN_IDENTITY: must use an identity domain
  *              - IOMMU_DOMAIN_DMA: must use a dma domain
  *              - 0: use the default setting

The core code is not ready to accept any other return value.

> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/mtk_iommu_v1.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index 8a0a5e5d049f4a..cc3e7d53d33ad9 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -319,11 +319,27 @@ static int mtk_iommu_v1_attach_device(struct iommu_domain *domain, struct device
>   	return 0;
>   }
>   
> -static void mtk_iommu_v1_set_platform_dma(struct device *dev)
> +static int mtk_iommu_v1_identity_attach(struct iommu_domain *identity_domain,
> +					struct device *dev)
>   {
>   	struct mtk_iommu_v1_data *data = dev_iommu_priv_get(dev);
>   
>   	mtk_iommu_v1_config(data, dev, false);
> +	return 0;
> +}
> +
> +static struct iommu_domain_ops mtk_iommu_v1_identity_ops = {
> +	.attach_dev = mtk_iommu_v1_identity_attach,
> +};
> +
> +static struct iommu_domain mtk_iommu_v1_identity_domain = {
> +	.type = IOMMU_DOMAIN_IDENTITY,
> +	.ops = &mtk_iommu_v1_identity_ops,
> +};
> +
> +static void mtk_iommu_v1_set_platform_dma(struct device *dev)
> +{
> +	mtk_iommu_v1_identity_attach(&mtk_iommu_v1_identity_domain, dev);

This callback seems to be a dead code now.

>   }
>   
>   static int mtk_iommu_v1_map(struct iommu_domain *domain, unsigned long iova,
> @@ -443,7 +459,7 @@ static int mtk_iommu_v1_create_mapping(struct device *dev, struct of_phandle_arg
>   
>   static int mtk_iommu_v1_def_domain_type(struct device *dev)
>   {
> -	return IOMMU_DOMAIN_UNMANAGED;
> +	return IOMMU_DOMAIN_IDENTITY;

def_domain_type can't be used for this purpose. But this seems to be a
temporary code, as it will be removed in patch 09/25.

>   }
>   
>   static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
> @@ -578,6 +594,7 @@ static int mtk_iommu_v1_hw_init(const struct mtk_iommu_v1_data *data)
>   }
>   
>   static const struct iommu_ops mtk_iommu_v1_ops = {
> +	.identity_domain = &mtk_iommu_v1_identity_domain,
>   	.domain_alloc	= mtk_iommu_v1_domain_alloc,
>   	.probe_device	= mtk_iommu_v1_probe_device,
>   	.probe_finalize = mtk_iommu_v1_probe_finalize,

Best regards,
baolu
