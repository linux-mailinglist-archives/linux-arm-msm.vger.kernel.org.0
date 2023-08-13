Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB5E77A64F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Aug 2023 14:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbjHMMLn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Aug 2023 08:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjHMMLm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Aug 2023 08:11:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B98F10D0;
        Sun, 13 Aug 2023 05:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691928705; x=1723464705;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EPKMap/YIslWzTcA4tjCBfC0/lQThAIgVXzQUtL7nv8=;
  b=icaOnKDWPE1BMRDDJeFghD0tGekqpGSNrZztug49hOs9VMIGHySckCkw
   Er3cAap5Ga/h3ZyvTvlFm3A3Ot9mB2PsLsK5o/m1Kb2j1POXR0Vs2BNLB
   wC58PABNmQMijCbZRY0I/Y0rJHtzoejMKtHjYyd6XxbHd0qHpFdCvBU4o
   d6g3OLeXhXp5pQPIf5BpeFF/iJh6CwhGqwYIwhg06nQR+UFAZ5YmQ70kU
   K6YwtjciWwAe/Ohe8afuY8m+Y610k/MF535D/cCttYksobCLGMtH2ldtA
   solT0XRcmsKm9UN7Ev4iMbPLUtc9UoKJhf4O+gDS5Yp5VP456Qzs3lTN6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="356852432"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="356852432"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 05:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="906929981"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="906929981"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.249.169.238]) ([10.249.169.238])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 05:11:32 -0700
Message-ID: <a9651d96-dbfb-aece-0811-2b36c4eb0a07@linux.intel.com>
Date:   Sun, 13 Aug 2023 20:11:30 +0800
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
Subject: Re: [PATCH v6 02/25] iommu: Add IOMMU_DOMAIN_PLATFORM
To:     Jason Gunthorpe <jgg@nvidia.com>
References: <2-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <dde32ea5-2b1a-1148-c329-3c52ffcb71a7@linux.intel.com>
 <ZNds4kejneylOYBE@nvidia.com>
Content-Language: en-US
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <ZNds4kejneylOYBE@nvidia.com>
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

On 2023/8/12 19:28, Jason Gunthorpe wrote:
> On Sat, Aug 12, 2023 at 09:36:33AM +0800, Baolu Lu wrote:
>>> @@ -290,6 +295,7 @@ struct iommu_ops {
>>>    	unsigned long pgsize_bitmap;
>>>    	struct module *owner;
>>>    	struct iommu_domain *identity_domain;
>>> +	struct iommu_domain *default_domain;
>>
>> I am imaging whether we can merge above two pointers into a single one.
>> It is either an IDENTITY or PLATFORM domain and the core will choose it
>> as the default domain of a group if iommu_group_alloc_default_domain()
>> fails to allocate one through the iommu dev_ops.
> 
> I think that would be the wrong direction..
> 
> identity_domain is a pointer that is always, ALWAYS an identity
> domain. It is the shortcut for drivers (and all drivers should do
> this) that implement a global static identity domain.

I see. I originally thought this was special for arm32.

> 
> default_domain is a shortcut to avoid implementing the entire flow
> around def_domain_type/domain_alloc for special cases. For this patch
> the specialc ase is the IOMMU_DOMAIN_PLATFORM.

I think this is special for drivers like s390. You don't want it to be
used beyond those special drivers, right?

If so, the naming of default_domain seems to be a bit generic. I can't
think of a better one, hence I am fine if you keep as it-is. After all,
the comment for this field has already explained it very clearly.

> We'll probably also get a blocking_domain pointer here too.

Yes.

> 
> All of this is removing the type multiplexor in alloc_domain so we can
> so  alloc_domain_paging()

Agreed with you. The dummy domains like identity and blocking could be
avoided from calling ops->domain_alloc.

>> Probably we could give it a more meaningful name? For example,
>> supplemental_domain or rescue_domain?
> 
> But that isn't what it is for, default_domain is the operational
> domain for attached drivers..

Best regards,
baolu
