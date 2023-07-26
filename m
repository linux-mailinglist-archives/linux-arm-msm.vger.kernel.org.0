Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE9E77632A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 11:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbjGZJnP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 05:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233857AbjGZJnF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 05:43:05 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2699FA;
        Wed, 26 Jul 2023 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690364585; x=1721900585;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=c0BcRVLtfxhSDi5n/gkET17KUrY9Ggxrw5qlALdi7QY=;
  b=OtAAcGpCeJ3qrzhVJ9jiL7kIc643jXnrOiAXi71peAcjMTTuhE3Mf98s
   dm6Xl3IgIGO68KyqmRtfMgPK7ciNXf0ZJL4QfB4YdzaZT2w8+MWz/xKx7
   qWYJGnh4ac52LK95MDCyn8kJRpoT/YMRMnFsNpWJ9emsxsIUp7VfsELU6
   XlzCxSnZ/Uhsnxyc/yJw5gl8VJ549vm+sgOZaIYBCUY8c9MlRp5CX/dY0
   hhUihZvnW/lnygD9W3Hfv4M6zBDZyiznWwEpFZox400iddeqcw0urF+UY
   bpWfYvKz1H9Q4xe3cfe5UZkIGE9lK0mn6Qjc0SYDn4KpBZwlrcKpgKYJl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="431770835"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="431770835"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 02:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="973055404"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="973055404"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.208.129]) ([10.254.208.129])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 02:42:48 -0700
Message-ID: <ab5174e0-73b3-fcb1-bbc5-53cd82d52268@linux.intel.com>
Date:   Wed, 26 Jul 2023 17:42:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc:     baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v5 16/25] iommu: Remove ops->set_platform_dma_ops()
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
References: <16-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <16-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023/7/25 1:22, Jason Gunthorpe wrote:
> All drivers are now using IDENTITY or PLATFORM domains for what this did,
> we can remove it now. It is no longer possible to attach to a NULL domain.
> 
> Tested-by: Heiko Stuebner<heiko@sntech.de>
> Tested-by: Niklas Schnelle<schnelle@linux.ibm.com>
> Tested-by: Steven Price<steven.price@arm.com>
> Tested-by: Marek Szyprowski<m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen<nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 30 +++++-------------------------
>   include/linux/iommu.h |  4 ----
>   2 files changed, 5 insertions(+), 29 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
