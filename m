Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADE7D6F5B8D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 17:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjECPym (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 11:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjECPyl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 11:54:41 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 27E8E1992;
        Wed,  3 May 2023 08:54:40 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0212E2F4;
        Wed,  3 May 2023 08:55:24 -0700 (PDT)
Received: from [10.57.82.232] (unknown [10.57.82.232])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7AC53F67D;
        Wed,  3 May 2023 08:54:33 -0700 (PDT)
Message-ID: <e73c6192-8fd5-042d-ce03-095b336270ee@arm.com>
Date:   Wed, 3 May 2023 16:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 16/20] iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
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
References: <16-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <16-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
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
> This brings back the ops->detach_dev() code that commit
> 1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
> into an IDENTITY domain.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/sun50i-iommu.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> index 74c5cb93e90027..15fd62d360778f 100644
> --- a/drivers/iommu/sun50i-iommu.c
> +++ b/drivers/iommu/sun50i-iommu.c
> @@ -772,6 +772,26 @@ static void sun50i_iommu_detach_device(struct iommu_domain *domain,
>   		sun50i_iommu_detach_domain(iommu, sun50i_domain);
>   }
>   
> +static int sun50i_iommu_identity_attach(struct iommu_domain *identity_domain,
> +					struct device *dev)
> +{
> +	struct sun50i_iommu *iommu = dev_iommu_priv_get(dev);
> +
> +	if (iommu->domain == identity_domain || !iommu->domain)

I don't think that first condition could ever be true.

Thanks,
Robin.

> +		return 0;
> +	sun50i_iommu_detach_device(iommu->domain, dev);
> +	return 0;
> +}
> +
> +static struct iommu_domain_ops sun50i_iommu_identity_ops = {
> +	.attach_dev = sun50i_iommu_identity_attach,
> +};
> +
> +static struct iommu_domain sun50i_iommu_identity_domain = {
> +	.type = IOMMU_DOMAIN_IDENTITY,
> +	.ops = &sun50i_iommu_identity_ops,
> +};
> +
>   static int sun50i_iommu_attach_device(struct iommu_domain *domain,
>   				      struct device *dev)
>   {
> @@ -827,6 +847,7 @@ static int sun50i_iommu_of_xlate(struct device *dev,
>   }
>   
>   static const struct iommu_ops sun50i_iommu_ops = {
> +	.identity_domain = &sun50i_iommu_identity_domain,
>   	.pgsize_bitmap	= SZ_4K,
>   	.device_group	= sun50i_iommu_device_group,
>   	.domain_alloc	= sun50i_iommu_domain_alloc,
