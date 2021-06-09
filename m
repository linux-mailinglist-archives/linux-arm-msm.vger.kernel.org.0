Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03BE93A1CFC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 20:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbhFISq0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 14:46:26 -0400
Received: from foss.arm.com ([217.140.110.172]:40034 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229941AbhFISq0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 14:46:26 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF378D6E;
        Wed,  9 Jun 2021 11:44:30 -0700 (PDT)
Received: from [10.57.6.115] (unknown [10.57.6.115])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D466C3F719;
        Wed,  9 Jun 2021 11:44:29 -0700 (PDT)
Subject: Re: [PATCH] iommu/io-pgtable-arm: Optimize partial walk flush for
 large scatter-gather list
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210609145315.25750-1-saiprakash.ranjan@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <dbcd394a-4d85-316c-5dd0-033546a66132@arm.com>
Date:   Wed, 9 Jun 2021 19:44:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609145315.25750-1-saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-09 15:53, Sai Prakash Ranjan wrote:
> Currently for iommu_unmap() of large scatter-gather list with page size
> elements, the majority of time is spent in flushing of partial walks in
> __arm_lpae_unmap() which is a VA based TLB invalidation (TLBIVA for
> arm-smmu).
> 
> For example: to unmap a 32MB scatter-gather list with page size elements
> (8192 entries), there are 16->2MB buffer unmaps based on the pgsize (2MB
> for 4K granule) and each of 2MB will further result in 512 TLBIVAs (2MB/4K)
> resulting in a total of 8192 TLBIVAs (512*16) for 16->2MB causing a huge
> overhead.
> 
> So instead use io_pgtable_tlb_flush_all() to invalidate the entire context
> if size (pgsize) is greater than the granule size (4K, 16K, 64K). For this
> example of 32MB scatter-gather list unmap, this results in just 16 ASID
> based TLB invalidations or tlb_flush_all() callback (TLBIASID in case of
> arm-smmu) as opposed to 8192 TLBIVAs thereby increasing the performance of
> unmaps drastically.
> 
> Condition (size > granule size) is chosen for io_pgtable_tlb_flush_all()
> because for any granule with supported pgsizes, we will have at least 512
> TLB invalidations for which tlb_flush_all() is already recommended. For
> example, take 4K granule with 2MB pgsize, this will result in 512 TLBIVA
> in partial walk flush.
> 
> Test on QTI SM8150 SoC for 10 iterations of iommu_{map_sg}/unmap:
> (average over 10 iterations)
> 
> Before this optimization:
> 
>      size        iommu_map_sg      iommu_unmap
>        4K            2.067 us         1.854 us
>       64K            9.598 us         8.802 us
>        1M          148.890 us       130.718 us
>        2M          305.864 us        67.291 us
>       12M         1793.604 us       390.838 us
>       16M         2386.848 us       518.187 us
>       24M         3563.296 us       775.989 us
>       32M         4747.171 us      1033.364 us
> 
> After this optimization:
> 
>      size        iommu_map_sg      iommu_unmap
>        4K            1.723 us         1.765 us
>       64K            9.880 us         8.869 us
>        1M          155.364 us       135.223 us
>        2M          303.906 us         5.385 us
>       12M         1786.557 us        21.250 us
>       16M         2391.890 us        27.437 us
>       24M         3570.895 us        39.937 us
>       32M         4755.234 us        51.797 us
> 
> This is further reduced once the map/unmap_pages() support gets in which
> will result in just 1 tlb_flush_all() as opposed to 16 tlb_flush_all().
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/iommu/io-pgtable-arm.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 87def58e79b5..c3cb9add3179 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -589,8 +589,11 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   
>   		if (!iopte_leaf(pte, lvl, iop->fmt)) {
>   			/* Also flush any partial walks */
> -			io_pgtable_tlb_flush_walk(iop, iova, size,
> -						  ARM_LPAE_GRANULE(data));
> +			if (size > ARM_LPAE_GRANULE(data))
> +				io_pgtable_tlb_flush_all(iop);
> +			else

Erm, when will the above condition ever not be true? ;)

Taking a step back, though, what about the impact to drivers other than 
SMMUv2? In particular I'm thinking of SMMUv3.2 where the whole range can 
be invalidated by VA in a single command anyway, so the additional 
penalties of TLBIALL are undesirable.

Robin.

> +				io_pgtable_tlb_flush_walk(iop, iova, size,
> +							  ARM_LPAE_GRANULE(data));
>   			ptep = iopte_deref(pte, data);
>   			__arm_lpae_free_pgtable(data, lvl + 1, ptep);
>   		} else if (iop->cfg.quirks & IO_PGTABLE_QUIRK_NON_STRICT) {
> 
