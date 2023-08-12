Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13EB6779C8E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Aug 2023 04:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233386AbjHLCQB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 22:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbjHLCQB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 22:16:01 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DBBC5;
        Fri, 11 Aug 2023 19:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691806560; x=1723342560;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sbxhrY1MVdB36V2CNTZkugKnmcToq8EzXXuZlM20LSI=;
  b=JC5/S3394d8HmGN7J3CRWbr3yxOshSr3+J44qxhzb62nTC+M+Ax5zbnw
   YRiM7vqw27YP1rCKAzQC14NTeKSSExxQ0SRbKv4mMt4DYrBfPWlXRpZSj
   BeIhRetZYA+QdguQvulBw9soMfHYHNxK0Ueu982PcNp/b2eWEFcrR/8Hw
   iDEl8o9fZGW36COhlD+fmMYLA3gIIATVpmWflWChD08mUSGpDksIZpMt4
   MM/3juQHpgQQn2ej7PC/gCYASQcLj35DWbs0hYqbyF3zevQMeTcGHaV3D
   BCgCiSP4dYDel4i6hdjWEsWP2QtWEExlbGu7ZUwvzYHjGFZic+pfK24J4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="375507184"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="375507184"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 19:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="979386282"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="979386282"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.79]) ([10.254.215.79])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 19:15:45 -0700
Message-ID: <b50a464a-fa28-e359-1bc5-4f2b105326ad@linux.intel.com>
Date:   Sat, 12 Aug 2023 10:15:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc:     baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 08/25] iommu: Reorganize
 iommu_get_default_domain_type() to respect def_domain_type()
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
References: <8-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <8-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023/8/3 8:07, Jason Gunthorpe wrote:
> Except for dart every driver returns 0 or IDENTITY from def_domain_type().
> 
> The drivers that return IDENTITY have some kind of good reason, typically
> that quirky hardware really can't support anything other than IDENTITY.
> 
> Arrange things so that if the driver says it needs IDENTITY then
> iommu_get_default_domain_type() either fails or returns IDENTITY.  It will
> never reject the driver's override to IDENTITY.
> 
> The only real functional difference is that the PCI untrusted flag is now
> ignored for quirky HW instead of overriding the IOMMU driver.
> 
> This makes the next patch cleaner that wants to force IDENTITY always for
> ARM_IOMMU because there is no support for DMA.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 66 +++++++++++++++++++++----------------------
>   1 file changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index c64365169b678d..53174179102d17 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1669,19 +1669,6 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
>   }
>   EXPORT_SYMBOL_GPL(fsl_mc_device_group);
>   
> -static int iommu_get_def_domain_type(struct device *dev)
> -{
> -	const struct iommu_ops *ops = dev_iommu_ops(dev);
> -
> -	if (dev_is_pci(dev) && to_pci_dev(dev)->untrusted)
> -		return IOMMU_DOMAIN_DMA;
> -
> -	if (ops->def_domain_type)
> -		return ops->def_domain_type(dev);
> -
> -	return 0;
> -}
> -
>   static struct iommu_domain *
>   __iommu_group_alloc_default_domain(const struct bus_type *bus,
>   				   struct iommu_group *group, int req_type)
> @@ -1775,36 +1762,49 @@ static int iommu_bus_notifier(struct notifier_block *nb,
>   static int iommu_get_default_domain_type(struct iommu_group *group,
>   					 int target_type)
>   {
> +	const struct iommu_ops *ops = dev_iommu_ops(
> +		list_first_entry(&group->devices, struct group_device, list)
> +			->dev);

How about consolidating above into a single helper?

--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1787,6 +1787,21 @@ __iommu_group_alloc_default_domain(struct 
iommu_group *group, int req_type)
  	return __iommu_group_domain_alloc(group, req_type);
  }

+/*
+ * Returns the iommu_ops for the devices in an iommu group.
+ *
+ * It is assumed that all devices in an iommu group are managed by a single
+ * IOMMU unit. Therefore, this returns the dev_iommu_ops of the first 
device
+ * in the group.
+ */
+static const struct iommu_ops *group_iommu_ops(struct iommu_group *group)
+{
+	struct group_device *device;
+
+	device = list_first_entry(&group->devices, struct group_device, list);
+	return dev_iommu_ops(device->dev);
+}
+
  /*
   * req_type of 0 means "auto" which means to select a domain based on
   * iommu_def_domain_type or what the driver actually supports.
@@ -1794,10 +1809,7 @@ __iommu_group_alloc_default_domain(struct 
iommu_group *group, int req_type)
  static struct iommu_domain *
  iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
  {
-	struct device *dev =
-		list_first_entry(&group->devices, struct group_device, list)
-			->dev;
-	const struct iommu_ops *ops = dev_iommu_ops(dev);
+	const struct iommu_ops *ops = group_iommu_ops(group);
  	struct iommu_domain *dom;

  	lockdep_assert_held(&group->mutex);
@@ -1888,9 +1900,7 @@ static int iommu_bus_notifier(struct 
notifier_block *nb,
  static int iommu_get_default_domain_type(struct iommu_group *group,
  					 int target_type)
  {
-	const struct iommu_ops *ops = dev_iommu_ops(
-		list_first_entry(&group->devices, struct group_device, list)
-			->dev);
+	const struct iommu_ops *ops = group_iommu_ops(group);
  	int best_type = target_type;
  	struct group_device *gdev;
  	struct device *last_dev;
@@ -2124,13 +2134,9 @@ static struct iommu_domain 
*__iommu_domain_alloc(const struct iommu_ops *ops,
  static struct iommu_domain *
  __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
  {
-	struct device *dev =
-		list_first_entry(&group->devices, struct group_device, list)
-			->dev;
-
  	lockdep_assert_held(&group->mutex);

-	return __iommu_domain_alloc(dev_iommu_ops(dev), dev, type);
+	return __iommu_domain_alloc(group_iommu_ops(group), dev, type);
  }

  struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)

>   	int best_type = target_type;
>   	struct group_device *gdev;
>   	struct device *last_dev;
> +	int type;
>   
>   	lockdep_assert_held(&group->mutex);
> -
>   	for_each_group_device(group, gdev) {
> -		unsigned int type = iommu_get_def_domain_type(gdev->dev);
> -
> -		if (best_type && type && best_type != type) {
> -			if (target_type) {
> -				dev_err_ratelimited(
> -					gdev->dev,
> -					"Device cannot be in %s domain\n",
> -					iommu_domain_type_str(target_type));
> -				return -1;
> -			}
> -
> -			dev_warn(
> -				gdev->dev,
> -				"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
> -				iommu_domain_type_str(type), dev_name(last_dev),
> -				iommu_domain_type_str(best_type));
> -			return 0;
> +		type = best_type;
> +		if (ops->def_domain_type) {
> +			type = ops->def_domain_type(gdev->dev);
> +			if (best_type && type && best_type != type)
> +				goto err;
>   		}
> -		if (!best_type)
> -			best_type = type;
> +
> +		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
> +			type = IOMMU_DOMAIN_DMA;
> +			if (best_type && type && best_type != type)
> +				goto err;
> +		}
> +		best_type = type;
>   		last_dev = gdev->dev;
>   	}
>   	return best_type;
> +
> +err:
> +	if (target_type) {
> +		dev_err_ratelimited(
> +			gdev->dev,
> +			"Device cannot be in %s domain - it is forcing %s\n",
> +			iommu_domain_type_str(target_type),
> +			iommu_domain_type_str(type));
> +		return -1;
> +	}
> +
> +	dev_warn(
> +		gdev->dev,
> +		"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
> +		iommu_domain_type_str(type), dev_name(last_dev),
> +		iommu_domain_type_str(best_type));
> +	return 0;

This doesn't match the commit message, where it states:

"Arrange things so that if the driver says it needs IDENTITY then
  iommu_get_default_domain_type() either fails or returns IDENTITY.
"

I saw that this change was made in the sequential patch. It is probably
better to put that here?

>   }
>   
>   static void iommu_group_do_probe_finalize(struct device *dev)

Best regards,
baolu
