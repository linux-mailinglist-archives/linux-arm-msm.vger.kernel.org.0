Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8D3877AF6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 04:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbjHNCOB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Aug 2023 22:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbjHNCOA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Aug 2023 22:14:00 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE98A18E;
        Sun, 13 Aug 2023 19:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691979238; x=1723515238;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=D0cMxkzz2W3U1WROUJDub6YFpGLwPPBS6a8Mkd5QN7w=;
  b=LuqQTdrDh2DGwE/LALb1Q1pqR+Z4xes2EbCu1qAjfSS01wEVFEdQhDET
   FGJ+6LrxU9dvs/7qS94wxrWs0cf03DvPfUkSlTNKtXTi1hz6H7ocGWtmF
   75C+BlBtqO1Sti6PckAWNDABWkhUOGPvh+i2T2YHcgnlSdMZmmp3tWSs+
   u8qv1f+cQNXiEJTGCSbZAfRaWYqUSODVJJNfxL2gur8XbUE5ZxmPdNqkd
   JAadOhLd1vss7+h1Jk2QcJIdD1LSYKZobQQyILXhZWj2NxBhq55rG/WiQ
   21PRqsTfqPZebC+rELr2Z5dRrIYPVZKqY/Oxt+qnFxk20anR9mqFPnBF9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="371948299"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="371948299"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 19:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="823277535"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="823277535"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.255.29.49]) ([10.255.29.49])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 19:13:47 -0700
Message-ID: <de9d9270-e510-b888-449c-d936a940d514@linux.intel.com>
Date:   Mon, 14 Aug 2023 10:13:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc:     baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 03/25] powerpc/iommu: Setup a default domain and remove
 set_platform_dma_ops
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
References: <3-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Language: en-US
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <3-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023/8/3 8:07, Jason Gunthorpe wrote:
> POWER is using the set_platform_dma_ops() callback to hook up its private
> dma_ops, but this is buired under some indirection and is weirdly
> happening for a BLOCKED domain as well.
> 
> For better documentation create a PLATFORM domain to manage the dma_ops,
> since that is what it is for, and make the BLOCKED domain an alias for
> it. BLOCKED is required for VFIO.
> 
> Also removes the leaky allocation of the BLOCKED domain by using a global
> static.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   arch/powerpc/kernel/iommu.c | 38 +++++++++++++++++--------------------
>   1 file changed, 17 insertions(+), 21 deletions(-)

Not sure how to fix the fake blocking domain in this driver.

But it's not the purpose of this patch, so

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
