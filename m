Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 074561B4F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 13:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbfEMLcF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 07:32:05 -0400
Received: from foss.arm.com ([217.140.101.70]:53306 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727598AbfEMLcF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 07:32:05 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7EA215AB;
        Mon, 13 May 2019 04:32:04 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2480C3F703;
        Mon, 13 May 2019 04:32:03 -0700 (PDT)
Subject: Re: [PATCH v4 1/1] iommu/io-pgtable-arm: Add support to use system
 cache
To:     Vivek Gautam <vivek.gautam@codeaurora.org>, will.deacon@arm.com,
        joro@8bytes.org, iommu@lists.linux-foundation.org
Cc:     pdaly@codeaurora.org, linux-arm-msm@vger.kernel.org,
        pratikp@codeaurora.org, linux-kernel@vger.kernel.org,
        jcrouse@codeaurora.org
References: <20190513100403.18981-1-vivek.gautam@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <dc53456d-027e-0ede-1ce9-1efa476937a9@arm.com>
Date:   Mon, 13 May 2019 12:32:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513100403.18981-1-vivek.gautam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/05/2019 11:04, Vivek Gautam wrote:
> Few Qualcomm platforms such as, sdm845 have an additional outer
> cache called as System cache, aka. Last level cache (LLC) that
> allows non-coherent devices to upgrade to using caching.
> This cache sits right before the DDR, and is tightly coupled
> with the memory controller. The clients using this cache request
> their slices from this system cache, make it active, and can then
> start using it.
> 
> There is a fundamental assumption that non-coherent devices can't
> access caches. This change adds an exception where they *can* use
> some level of cache despite still being non-coherent overall.
> The coherent devices that use cacheable memory, and CPU make use of
> this system cache by default.
> 
> Looking at memory types, we have following -
> a) Normal uncached :- MAIR 0x44, inner non-cacheable,
>                        outer non-cacheable;
> b) Normal cached :-   MAIR 0xff, inner read write-back non-transient,
>                        outer read write-back non-transient;
>                        attribute setting for coherenet I/O devices.
> and, for non-coherent i/o devices that can allocate in system cache
> another type gets added -
> c) Normal sys-cached :- MAIR 0xf4, inner non-cacheable,
>                          outer read write-back non-transient
> 
> Coherent I/O devices use system cache by marking the memory as
> normal cached.
> Non-coherent I/O devices should mark the memory as normal
> sys-cached in page tables to use system cache.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> ---
> 
> V3 version of this patch and related series can be found at [1].
> 
> This change is a realisation of following changes from downstream msm-4.9:
> iommu: io-pgtable-arm: Implement IOMMU_USE_UPSTREAM_HINT[2]
> 
> Changes since v3:
>   - Dropping support to cache i/o page tables to system cache. Getting support
>     for data buffers is the first step.
>     Removed io-pgtable quirk and related change to add domain attribute.
> 
> Glmark2 numbers on SDM845 based cheza board:
> 
> S.No.|	with LLC support   |	without LLC support
>       |	for data buffers   |
> ---------------------------------------------------		
> 1    |	4480; 72.3fps      |	4042; 65.2fps
> 2    |	4500; 72.6fps      |	4039; 65.1fps
> 3    |	4523; 72.9fps	   |	4106; 66.2fps
> 4    |	4489; 72.4fps	   |	4104; 66.2fps
> 5    |	4518; 72.9fps	   |	4072; 65.7fps
> 
> [1] https://patchwork.kernel.org/cover/10772629/
> [2] https://source.codeaurora.org/quic/la/kernel/msm-4.9/commit/?h=msm-4.9&id=d4c72c413ea27c43f60825193d4de9cb8ffd9602
> 
>   drivers/iommu/io-pgtable-arm.c | 9 ++++++++-
>   include/linux/iommu.h          | 1 +
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index d3700ec15cbd..2dbafe697531 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -167,10 +167,12 @@
>   #define ARM_LPAE_MAIR_ATTR_MASK		0xff
>   #define ARM_LPAE_MAIR_ATTR_DEVICE	0x04
>   #define ARM_LPAE_MAIR_ATTR_NC		0x44
> +#define ARM_LPAE_MAIR_ATTR_QCOM_SYS_CACHE	0xf4
>   #define ARM_LPAE_MAIR_ATTR_WBRWA	0xff
>   #define ARM_LPAE_MAIR_ATTR_IDX_NC	0
>   #define ARM_LPAE_MAIR_ATTR_IDX_CACHE	1
>   #define ARM_LPAE_MAIR_ATTR_IDX_DEV	2
> +#define ARM_LPAE_MAIR_ATTR_IDX_QCOM_SYS_CACHE	3

Here at the implementation level, I'd rather just call these what they 
are, i.e. s/QCOM_SYS_CACHE/INC_OWBRWA/.

>   
>   /* IOPTE accessors */
>   #define iopte_deref(pte,d) __va(iopte_to_paddr(pte, d))
> @@ -442,6 +444,9 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
>   		else if (prot & IOMMU_CACHE)
>   			pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
>   				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
> +		else if (prot & IOMMU_QCOM_SYS_CACHE)

Where in the call stack is this going to be decided? (I don't recall the 
previous discussions ever really reaching a solid conclusion on how to 
separate responsibilities).

> +			pte |= (ARM_LPAE_MAIR_ATTR_IDX_QCOM_SYS_CACHE
> +				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
>   	} else {
>   		pte = ARM_LPAE_PTE_HAP_FAULT;
>   		if (prot & IOMMU_READ)
> @@ -841,7 +846,9 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>   	      (ARM_LPAE_MAIR_ATTR_WBRWA
>   	       << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_CACHE)) |
>   	      (ARM_LPAE_MAIR_ATTR_DEVICE
> -	       << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_DEV));
> +	       << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_DEV)) |
> +	      (ARM_LPAE_MAIR_ATTR_QCOM_SYS_CACHE
> +	       << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_QCOM_SYS_CACHE));
>   
>   	cfg->arm_lpae_s1_cfg.mair[0] = reg;
>   	cfg->arm_lpae_s1_cfg.mair[1] = 0;
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index a815cf6f6f47..29dd2c624348 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -31,6 +31,7 @@
>   #define IOMMU_CACHE	(1 << 2) /* DMA cache coherency */
>   #define IOMMU_NOEXEC	(1 << 3)
>   #define IOMMU_MMIO	(1 << 4) /* e.g. things like MSI doorbells */
> +#define IOMMU_QCOM_SYS_CACHE	(1 << 6)

Nit: 6 usually comes *after* 5 ;)

Plus although it's fairly self-evident that this value has *something* 
to do with Qcom system caches and isn't as generic as, say, IOMMU_PRIV, 
it probably still warrants some degree of comment.

Robin.

>   /*
>    * Where the bus hardware includes a privilege level as part of its access type
>    * markings, and certain devices are capable of issuing transactions marked as
> 
