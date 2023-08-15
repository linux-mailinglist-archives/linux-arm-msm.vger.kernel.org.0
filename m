Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8297E77C4F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Aug 2023 03:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233798AbjHOBT0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 21:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233817AbjHOBTN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 21:19:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC50EB2;
        Mon, 14 Aug 2023 18:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692062352; x=1723598352;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QvD+OczAXQfY3EnI/faV3RaAbFUkc5kfqnTaF1n9e4M=;
  b=KfE+LdogsKCuQU3lSwOttxtxK/1FgbUC0TiTqWxL3UF2k1oAbJyp8DX/
   N386jiPwbd17Ed7aO7t7UNO63wNa96/6u7cH/+kisuBHaiDyUgkxzktZS
   J1mdRuHwaCZYXU39pLpABoU7G8yI80eg0aYTKt2cBB6Ra4jZMb4Uiqwzd
   b11lOsEOrROT859dAWnLKeKFEJRenQclPdbtcetIEQ89+fy7i1eFsQYqn
   t9UkFnWrzc8BwNyXywNEAgqqg0I7Udgm2vU6Y8MUFd1Yg4itE2bFNKN/U
   +iXhFYEIxvYacxXgbAl2Vek7GMLXBSU3Hdm+CRAXYc3lwBAXcTlDIETE0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="438516171"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="438516171"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 18:19:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="823667919"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="823667919"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.149]) ([10.254.215.149])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 18:19:01 -0700
Message-ID: <c24e7eff-b28c-8152-6022-325ca89c8074@linux.intel.com>
Date:   Tue, 15 Aug 2023 09:18:59 +0800
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
Subject: Re: [PATCH v6 08/25] iommu: Reorganize
 iommu_get_default_domain_type() to respect def_domain_type()
Content-Language: en-US
To:     Jason Gunthorpe <jgg@nvidia.com>
References: <8-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <b50a464a-fa28-e359-1bc5-4f2b105326ad@linux.intel.com>
 <ZNpjmiBLneBC9oWe@nvidia.com>
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <ZNpjmiBLneBC9oWe@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023/8/15 1:25, Jason Gunthorpe wrote:
> Ah, I went over all this again and decided to try again, it is too
> complicated. This patch can do what the commit message says and the
> following patches are even simpler:

Yes. This method is more concise. Some nits below.

> 
> /*
>   * Combine the driver's choosen def_domain_type across all the devices in a
>   * group. Drivers must give a consistent result.
>   */
> static int iommu_get_def_domain_type(struct iommu_group *group,
> 				     struct device *dev, int cur_type)
> {
> 	const struct iommu_ops *ops = group_iommu_ops(group);
> 	int type;
> 
> 	if (!ops->def_domain_type)
> 		return cur_type;
> 
> 	type = ops->def_domain_type(dev);
> 	if (!type || cur_type == type)
> 		return cur_type;
> 	if (!cur_type)
> 		return type;
> 
> 	dev_err_ratelimited(
> 		dev,
> 		"IOMMU driver error, requesting conflicting def_domain_type, %s and %s, for devices in group %u.\n",
> 		iommu_domain_type_str(cur_type), iommu_domain_type_str(type),
> 		group->id);
> 
> 	/*
> 	 * Try to recover, drivers are allowed to force IDENITY or DMA, IDENTITY
> 	 * takes precedence.
> 	 */
> 	if (cur_type || type == IOMMU_DOMAIN_IDENTITY)
> 		return IOMMU_DOMAIN_IDENTITY;

No need to check cur_type. It already returned if cur_type is 0.

> 	return cur_type;
> }
> 
> /*
>   * A target_type of 0 will select the best domain type. 0 can be returned in
>   * this case meaning the global default should be used.
>   */
> static int iommu_get_default_domain_type(struct iommu_group *group,
> 					 int target_type)
> {
> 	struct device *untrusted = NULL;
> 	struct group_device *gdev;
> 	int driver_type = 0;
> 
> 	lockdep_assert_held(&group->mutex);
> 
> 	/*
> 	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
> 	 * identity_domain and it will automatically become their default
> 	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
> 	 * Override the selection to IDENTITY.
> 	 */
> 	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
> 		static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
> 				IS_ENABLED(CONFIG_IOMMU_DMA)));

IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) is duplicate with the condition in 
the if statement. So only
		static_assert(!IS_ENABLED(CONFIG_IOMMU_DMA));
?

> 		driver_type = IOMMU_DOMAIN_IDENTITY;
> 	}
> 
> 	for_each_group_device(group, gdev) {
> 		driver_type = iommu_get_def_domain_type(group, gdev->dev,
> 							driver_type);

No need to call this in the loop body?

> 
> 		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
> 			/*
> 			 * No ARM32 using systems will set untrusted, it cannot
> 			 * work.
> 			 */
> 			if (WARN_ON(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)))
> 				return -1;
> 			untrusted = gdev->dev;
> 		}
> 	}
> 
> 	if (untrusted) {
> 		if (driver_type && driver_type != IOMMU_DOMAIN_DMA) {
> 			dev_err_ratelimited(
> 				untrusted,
> 				"Device is not trusted, but driver is overriding group %u to %s, refusing to probe.\n",
> 				group->id, iommu_domain_type_str(driver_type));
> 			return -1;
> 		}
> 		driver_type = IOMMU_DOMAIN_DMA;
> 	}
> 
> 	if (target_type) {
> 		if (driver_type && target_type != driver_type)
> 			return -1;
> 		return target_type;
> 	}
> 	return driver_type;
> }

Best regards,
baolu
