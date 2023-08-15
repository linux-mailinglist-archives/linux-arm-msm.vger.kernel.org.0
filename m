Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A32877C522
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Aug 2023 03:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233555AbjHOBfB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 21:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233873AbjHOBeo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 21:34:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E995D172A;
        Mon, 14 Aug 2023 18:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692063284; x=1723599284;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jkr/6uy80FBJ1zVM9rO0oVAo4kuNs+82saVQaD5txn0=;
  b=O91pmpZhWOUplfzsbpbaCjTCf7t4R+uB2LvPPMUqGuCJBQ0n6GjD2iuN
   MPSURO3h6uidav/BdE0r2nDvWTEV3WQtG2i0gdFWiySiuVDqJ8CZRFXDf
   yHrBKnl+lVWdz6oY8DsoBCA6jvE4zGP9bLXrZzbxRLfKGCzFf4w6ERDBB
   WLkqqAevRC/u2IU8E3up9qbeNa32b/UfltBmy2PbSPrYwa8lEN/QsFIRx
   eeRpN06XnDqD4QveUCnQxjuU0fu8zSHtAfICoZ3OH+G4KZvFRMIBOkOw0
   duXZNZOiCEsNamJLolm+OH90M9WLK1tP1x5nxfAZpW63eBJq8FR58FNa5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="436073284"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="436073284"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 18:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="768654964"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="768654964"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.149]) ([10.254.215.149])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 18:34:30 -0700
Message-ID: <7fdbf6a5-87a2-65c1-7c1e-d7b936dd3a67@linux.intel.com>
Date:   Tue, 15 Aug 2023 09:34:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc:     baolu.lu@linux.intel.com, Andy Gross <agross@kernel.org>,
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
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 00/25] iommu: Make default_domain's mandatory
Content-Language: en-US
To:     Jason Gunthorpe <jgg@nvidia.com>
References: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <50feed07-f89a-dfc2-d8a8-16f9bf0fe937@linux.intel.com>
 <ZNpksUtIY+3N1Hn3@nvidia.com>
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <ZNpksUtIY+3N1Hn3@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023/8/15 1:30, Jason Gunthorpe wrote:
> On Mon, Aug 14, 2023 at 04:43:23PM +0800, Baolu Lu wrote:
> 
>>> This is on github:https://github.com/jgunthorpe/linux/commits/iommu_all_defdom
>> It seems that after this series, all ARM iommu drivers are able to
>> support the IDENTITY default domain, hence perhaps we can remove below
>> code?
> Yes, but this code is still used
> 
>> If I remember it correctly, the background of this part of code is
>> that some arm drivers didn't support IDENTITY domain, so fall back to
>> DMA domain if IDENTITY domain allocation fails.
> Not quite..
> 
> 	if (req_type)
> 		return __iommu_group_alloc_default_domain(group, req_type);
> 
> req_type == 0 can still happen because it depends on what
> def_domain_type returns, which is still 0 in alot of cases
> 
> 	/* The driver gave no guidance on what type to use, try the default */
> 	dom = __iommu_group_alloc_default_domain(group, iommu_def_domain_type);
> 	if (dom)
> 		return dom;
> 
> So we try the default which might be IDENTITY/DMA/DMA_FQ - still have
> to do this.
> 
> 	/* Otherwise IDENTITY and DMA_FQ defaults will try DMA */
> 	if (iommu_def_domain_type == IOMMU_DOMAIN_DMA)
> 		return NULL;
> 	dom = __iommu_group_alloc_default_domain(group, IOMMU_DOMAIN_DMA);
> 	if (!dom)
> 		return NULL;
> 
> 	pr_warn("Failed to allocate default IOMMU domain of type %u for group %s - Falling back to IOMMU_DOMAIN_DMA",
> 		iommu_def_domain_type, group->name);
> 
> And this hunk is primarily a fallback in case the DMA_FQ didn't
> work. Then we try normal DMA.
> 
> That it also protected against not implementing IDENTITY is a side
> effect, so I think we have to keep all of this still.

Okay, fair enough. Thanks for the explanation.

Best regards,
baolu
