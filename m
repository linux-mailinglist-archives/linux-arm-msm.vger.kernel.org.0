Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C981BECC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 01:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgD2X6Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 19:58:25 -0400
Received: from mga12.intel.com ([192.55.52.136]:35004 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgD2X6Z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 19:58:25 -0400
IronPort-SDR: AsD6ZoeBBQmL0IOMPrRNKGtTnT1bXi3tfIuxtgBJdKtce4eyR2zhrT83V+eTg/Y7C1EHuMVeUX
 KqKKVC+MWVeA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 16:58:25 -0700
IronPort-SDR: jB3X6OfrFEd5jL85tzJQ7Kivv2gZUnM+5dHl+h4S2HlmkJN7B4gQQLNvquQI6pSZuDssxpDugH
 dzAsxaFwPNPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,333,1583222400"; 
   d="scan'208";a="293374327"
Received: from chenw5-mobl1.ccr.corp.intel.com (HELO [10.254.209.112]) ([10.254.209.112])
  by fmsmga002.fm.intel.com with ESMTP; 29 Apr 2020 16:58:19 -0700
Cc:     baolu.lu@linux.intel.com, Daniel Drake <drake@endlessm.com>,
        jonathan.derrick@intel.com, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v3 04/34] iommu/vt-d: Wire up iommu_ops->def_domain_type
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20200429133712.31431-1-joro@8bytes.org>
 <20200429133712.31431-5-joro@8bytes.org>
From:   Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <b091a9e0-4bbb-2cd9-861e-e958bc691f73@linux.intel.com>
Date:   Thu, 30 Apr 2020 07:58:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429133712.31431-5-joro@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020/4/29 21:36, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The Intel VT-d driver already has a matching function to determine the
> default domain type for a device. Wire it up in intel_iommu_ops.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> ---
>   drivers/iommu/intel-iommu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index ef0a5246700e..b9f905a55dda 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -6209,6 +6209,7 @@ const struct iommu_ops intel_iommu_ops = {
>   	.dev_enable_feat	= intel_iommu_dev_enable_feat,
>   	.dev_disable_feat	= intel_iommu_dev_disable_feat,
>   	.is_attach_deferred	= intel_iommu_is_attach_deferred,
> +	.def_domain_type	= device_def_domain_type,
>   	.pgsize_bitmap		= INTEL_IOMMU_PGSIZES,
>   };
>   
> 
