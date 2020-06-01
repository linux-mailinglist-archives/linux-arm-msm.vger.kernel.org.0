Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E2C1EB21E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 01:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbgFAXUQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jun 2020 19:20:16 -0400
Received: from mga05.intel.com ([192.55.52.43]:20602 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbgFAXUQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 19:20:16 -0400
IronPort-SDR: il7mEYymC2psy/qNQk8u/dtN1WPUyQspWQ94PnXbc0teJQNPydOqThwKSnRHvLdCeL0Z3KWsdu
 4TdWrYZO11Pg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2020 16:20:15 -0700
IronPort-SDR: hQbV32JOyjOGeuv1Q2ujjMc5qE5l9DREIL4uxk9IfntVO/uJuHc/R3pmYZg2c3JGkkmIfxg4ig
 Vk416qdU8nMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,462,1583222400"; 
   d="scan'208";a="293360328"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139]) ([10.239.159.139])
  by fmsmga004.fm.intel.com with ESMTP; 01 Jun 2020 16:20:10 -0700
Cc:     baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
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
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-rockchip@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200529221623.qc6twmpzryh7nkvb@cantor>
 <20200601104240.7f5xhz7gooqhaq4n@cantor>
From:   Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <47711845-98ee-95b8-aa95-423a36ed9741@linux.intel.com>
Date:   Tue, 2 Jun 2020 07:16:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601104240.7f5xhz7gooqhaq4n@cantor>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jerry,

On 6/1/20 6:42 PM, Jerry Snitselaar wrote:
>>
>> Hi Joerg,
>>
>> With this patchset, I have an epyc system where if I boot with
>> iommu=nopt and force a dump I will see some io page faults for a nic
>> on the system. The vmcore is harvested and the system reboots. I
>> haven't reproduced it on other systems yet, but without the patchset I
>> don't see the io page faults during the kdump.
>>
>> Regards,
>> Jerry
> 
> I just hit an issue on a separate intel based system (kdump iommu=nopt),
> where it panics in during intel_iommu_attach_device, in is_aux_domain,
> due to device_domain_info being DEFER_DEVICE_DOMAIN_INFO. That doesn't
> get set to a valid address until the domain_add_dev_info call.
> 
> Is it as simple as the following?

I guess you won't hit this issue if you use iommu/next branch of Joerg's
tree. We've changed to use a generic helper to retrieve the valid per
device iommu data or NULL (if there's no).

Best regards,
baolu

> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 29d3940847d3..f1bbeed46a4c 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -5053,8 +5053,8 @@ is_aux_domain(struct device *dev, struct 
> iommu_domain *domain)
>   {
>          struct device_domain_info *info = dev->archdata.iommu;
> 
> -       return info && info->auxd_enabled &&
> -                       domain->type == IOMMU_DOMAIN_UNMANAGED;
> +       return info && info != DEFER_DEVICE_DOMAIN_INFO &&
> +               info->auxd_enabled && domain->type == 
> IOMMU_DOMAIN_UNMANAGED;
>   }
> 
>   static void auxiliary_link_device(struct dmar_domain *domain,
> 
> 
> Regards,
> Jerry
