Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEAD4779D2E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Aug 2023 07:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233189AbjHLFBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Aug 2023 01:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbjHLFBj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Aug 2023 01:01:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91881736;
        Fri, 11 Aug 2023 22:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691816498; x=1723352498;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8ESbiLHr+YCgav0uKLzgJWB6fuptDUr8xuFAEutcc9g=;
  b=eIia5ItIbWR7COp6ipg1ZQK3kKUaSAtgQVwByV6TodkErLoK9i2Zsu0g
   +w1MyPO8lc7EoPA1FiowUtDJNtte6F0JNuMqxWH3NJkNw3LcEj16zuk0L
   ahq48G7XRZuPo9cPAyXURGBLC0ON1ZvJ0JBUZ7V6bYcu+RLcUeawojK+i
   uy5RT1taXg+4yDuB4tT2pSd5g9QYfuj+a46/IYgOyeuhANSwkh8cJtKcK
   +vMwvHXVkQ7Wtxwrkanxw9TEAW8ueR8nLB4oZrUjhtTe+6d6kgQav3iGy
   TZolSmW8RXCs+AXptWYxThvEXUJ5AAzxesu45bcPmiTG0VlkkSTYf8Vg/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="375513664"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="375513664"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 22:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="767872740"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="767872740"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.214.60]) ([10.254.214.60])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 22:01:26 -0700
Message-ID: <d4451419-627b-36de-0b0f-3a7e8bc59a35@linux.intel.com>
Date:   Sat, 12 Aug 2023 13:01:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc:     baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 15/25] iommufd/selftest: Make the mock iommu driver
 into a real driver
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
References: <15-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <15-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023/8/3 8:08, Jason Gunthorpe wrote:
> +/*
> + * Register an iommu driver against a single bus. This is only used by iommufd
> + * selftest to create a mock iommu driver. The caller must provide
> + * some memory to hold a notifier_block.
> + */
> +int iommu_device_register_bus(struct iommu_device *iommu,
> +			      const struct iommu_ops *ops, struct bus_type *bus,
> +			      struct notifier_block *nb)
> +{
> +	int err;
> +
> +	iommu->ops = ops;
> +	nb->notifier_call = iommu_bus_notifier;
> +	err = bus_register_notifier(bus, nb);
> +	if (err)
> +		return err;
> +
> +	spin_lock(&iommu_device_lock);
> +	list_add_tail(&iommu->list, &iommu_device_list);
> +	spin_unlock(&iommu_device_lock);
> +
> +	bus->iommu_ops = ops;
> +	err = bus_iommu_probe(bus);

By the way, bus_iommu_probe() has been changed in iommu-next, so it
needs to be rebased here.

Best regards,
baolu
