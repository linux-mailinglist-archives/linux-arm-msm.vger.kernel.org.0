Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D37F51A82B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 17:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440396AbgDNP2B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 11:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729746AbgDNP14 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 11:27:56 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3409CC061A0C;
        Tue, 14 Apr 2020 08:27:56 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 3493E2A4; Tue, 14 Apr 2020 17:27:54 +0200 (CEST)
Date:   Tue, 14 Apr 2020 17:27:52 +0200
From:   "joro@8bytes.org" <joro@8bytes.org>
To:     "Derrick, Jonathan" <jonathan.derrick@intel.com>
Cc:     "heiko@sntech.de" <heiko@sntech.de>,
        "kgene@kernel.org" <kgene@kernel.org>,
        "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "dwmw2@infradead.org" <dwmw2@infradead.org>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "will@kernel.org" <will@kernel.org>,
        "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "robdclark@gmail.com" <robdclark@gmail.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "gerald.schaefer@de.ibm.com" <gerald.schaefer@de.ibm.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "jroedel@suse.de" <jroedel@suse.de>
Subject: Re: [RFC PATCH 11/34] iommu: Split off default domain allocation
 from group assignment
Message-ID: <20200414152752.GC14731@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
 <20200407183742.4344-12-joro@8bytes.org>
 <6a801ff9e6471bda7c6f510dfa2ba7e7c35cb559.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a801ff9e6471bda7c6f510dfa2ba7e7c35cb559.camel@intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jonathan,

On Mon, Apr 13, 2020 at 10:10:50PM +0000, Derrick, Jonathan wrote:
> I had to add the following for initial VMD support. The new PCIe domain
> added on VMD endpoint probe didn't have the dev_iommu member set on the
> VMD subdevices, which I'm guessing is due to probe_iommu_group already
> having been run on the VMD endpoint's group prior to those subdevices
> being added.
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 8a5e1ac328dd..ac1e4fb9bf48 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1577,6 +1577,9 @@ static int iommu_bus_notifier(struct notifier_block *nb,
>         if (action == BUS_NOTIFY_ADD_DEVICE) {
>                 int ret;
>  
> +               if (!dev_iommu_get(dev))
> +                       return -ENOMEM;
> +
>                 ret = iommu_probe_device(dev);
>                 return (ret) ? NOTIFY_DONE : NOTIFY_OK;
>         } else if (action == BUS_NOTIFY_REMOVED_DEVICE) {

Right, thanks for catching this. The hotplug path does not allocate the
dev->iommu structure yet. I'll have to figure out if the above patch
adds it at the right place, but I'll fix it in the next version.

Thanks again,

	Joerg
