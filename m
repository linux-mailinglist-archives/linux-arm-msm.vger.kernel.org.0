Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3F33AECBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 17:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhFUPsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 11:48:13 -0400
Received: from foss.arm.com ([217.140.110.172]:36386 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229837AbhFUPsM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 11:48:12 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4C051042;
        Mon, 21 Jun 2021 08:45:57 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44A4D3F694;
        Mon, 21 Jun 2021 08:45:56 -0700 (PDT)
Subject: Re: [PATCHv2 1/3] iommu/io-pgtable: Add a quirk to use
 tlb_flush_all() for partial walk flush
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Thierry Reding <treding@nvidia.com>, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1623981933.git.saiprakash.ranjan@codeaurora.org>
 <b099af10926b34249f4a30262db37f50491bebe7.1623981933.git.saiprakash.ranjan@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <904f283c-f8b1-ba84-d010-eacc87bb53c5@arm.com>
Date:   Mon, 21 Jun 2021 16:45:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b099af10926b34249f4a30262db37f50491bebe7.1623981933.git.saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-18 03:51, Sai Prakash Ranjan wrote:
> Add a quirk IO_PGTABLE_QUIRK_TLB_INV_ALL to invalidate entire context
> with tlb_flush_all() callback in partial walk flush to improve unmap
> performance on select few platforms where the cost of over-invalidation
> is less than the unmap latency.

I still think this doesn't belong anywhere near io-pgtable at all. It's 
a driver-internal decision how exactly it implements a non-leaf 
invalidation, and that may be more complex than a predetermined boolean 
decision. For example, I've just realised for SMMUv3 we can't invalidate 
multiple levels of table at once with a range command, since if we 
assume the whole thing is mapped at worst-case page granularity we may 
fail to invalidate any parts which are mapped as intermediate-level 
blocks. If invalidating a 1GB region (with 4KB granule) means having to 
fall back to 256K non-range commands, we may not want to invalidate by 
VA then, even though doing so for a 2MB region is still optimal.

It's also quite feasible that drivers might want to do this for leaf 
invalidations too - if you don't like issuing 512 commands to invalidate 
2MB, do you like issuing 511 commands to invalidate 2044KB? - and at 
that point the logic really has to be in the driver anyway.

Robin.

> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/iommu/io-pgtable-arm.c | 3 ++-
>   include/linux/io-pgtable.h     | 5 +++++
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 87def58e79b5..5d362f2214bd 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -768,7 +768,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>   	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
>   			    IO_PGTABLE_QUIRK_NON_STRICT |
>   			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
> -			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA))
> +			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
> +			    IO_PGTABLE_QUIRK_TLB_INV_ALL))
>   		return NULL;
>   
>   	data = arm_lpae_alloc_pgtable(cfg);
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 4d40dfa75b55..45441592a0e6 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -82,6 +82,10 @@ struct io_pgtable_cfg {
>   	 *
>   	 * IO_PGTABLE_QUIRK_ARM_OUTER_WBWA: Override the outer-cacheability
>   	 *	attributes set in the TCR for a non-coherent page-table walker.
> +	 *
> +	 * IO_PGTABLE_QUIRK_TLB_INV_ALL: Use TLBIALL/TLBIASID to invalidate
> +	 *	entire context for partial walk flush to increase unmap
> +	 *	performance on select few platforms.
>   	 */
>   	#define IO_PGTABLE_QUIRK_ARM_NS		BIT(0)
>   	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
> @@ -89,6 +93,7 @@ struct io_pgtable_cfg {
>   	#define IO_PGTABLE_QUIRK_NON_STRICT	BIT(4)
>   	#define IO_PGTABLE_QUIRK_ARM_TTBR1	BIT(5)
>   	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA	BIT(6)
> +	#define IO_PGTABLE_QUIRK_TLB_INV_ALL	BIT(7)
>   	unsigned long			quirks;
>   	unsigned long			pgsize_bitmap;
>   	unsigned int			ias;
> 
