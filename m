Return-Path: <linux-arm-msm+bounces-30919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C20396DA35
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 15:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F4E11C24153
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 13:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1AD19AA56;
	Thu,  5 Sep 2024 13:24:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AAC19AA73;
	Thu,  5 Sep 2024 13:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725542660; cv=none; b=idjN3VAGLDpxsSZz0yO/knH1CKz1XP5AWRBBxeRyQ/5dtvgPDvj6AZkU5zwJOw8rOf1G7sWSok8B/V4xL4p4MirPZTbkqjM4XSamuaF128Nj2P8yX8c4VSFc3sCOnuNw51/Dtj5sQGcIAOJawNpB/dMpXQ10TIfLhEP7FfsRjDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725542660; c=relaxed/simple;
	bh=rM/wBWPr26fVgdZjczjk5Z21mwxZ3d1vEzmRuZNZLnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUTeObzEjiRo+/8sj5BR2hI+UdLDOFcN4gsI1iF2WiOdKNWzxt8wgdQppzTswosIPnPlaCqRlLW8qWodCpcH6wLavKTckM3iAFm85ZX6kb/CI1DsqdlAdoNOMJqm7143AVb22pLTGpq7mWth3bw56WyXycFHCMv30ytWMK+h9TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C1A5FEC;
	Thu,  5 Sep 2024 06:24:44 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6ED823F73F;
	Thu,  5 Sep 2024 06:24:16 -0700 (PDT)
Message-ID: <fb54ef8d-f769-47d5-8a9d-aa93f96d5c41@arm.com>
Date: Thu, 5 Sep 2024 14:24:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent
 unmap"
To: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Ashish Mhetre <amhetre@nvidia.com>, Rob Clark <robdclark@chromium.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240905124956.84932-1-robdclark@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240905124956.84932-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2024 1:49 pm, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
> 
> It was causing gpu smmu faults on x1e80100.
> 
> I _think_ what is causing this is the change in ordering of
> __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
> memory) and io_pgtable_tlb_flush_walk().

As I just commented, how do you believe the order of operations between:

	__arm_lpae_clear_pte();
  	if (!iopte_leaf()) {
  		io_pgtable_tlb_flush_walk();

and:
  	
  	if (!iopte_leaf()) {
		__arm_lpae_clear_pte();
  		io_pgtable_tlb_flush_walk();

fundamentally differs?

I'm not saying there couldn't be some subtle bug in the implementation 
which we've all missed, but I still can't see an issue with the intended 
logic.

>  I'm not entirely sure how
> this patch is supposed to work correctly in the face of other
> concurrent translations (to buffers unrelated to the one being
> unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
> stale data read back into the tlb.

Read back from where? The ex-table PTE which was already set to zero 
before tlb_flush_walk was called?

And isn't the hilariously overcomplicated TBU driver supposed to be 
telling you exactly what happened here? Otherwise I'm going to continue 
to seriously question the purpose of shoehorning that upstream at all...

Thanks,
Robin.

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++-----------------
>   1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 16e51528772d..85261baa3a04 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -274,13 +274,13 @@ static void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
>   				   sizeof(*ptep) * num_entries, DMA_TO_DEVICE);
>   }
>   
> -static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtable_cfg *cfg, int num_entries)
> +static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtable_cfg *cfg)
>   {
> -	for (int i = 0; i < num_entries; i++)
> -		ptep[i] = 0;
>   
> -	if (!cfg->coherent_walk && num_entries)
> -		__arm_lpae_sync_pte(ptep, num_entries, cfg);
> +	*ptep = 0;
> +
> +	if (!cfg->coherent_walk)
> +		__arm_lpae_sync_pte(ptep, 1, cfg);
>   }
>   
>   static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
> @@ -653,28 +653,25 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   		max_entries = ARM_LPAE_PTES_PER_TABLE(data) - unmap_idx_start;
>   		num_entries = min_t(int, pgcount, max_entries);
>   
> -		/* Find and handle non-leaf entries */
> -		for (i = 0; i < num_entries; i++) {
> -			pte = READ_ONCE(ptep[i]);
> +		while (i < num_entries) {
> +			pte = READ_ONCE(*ptep);
>   			if (WARN_ON(!pte))
>   				break;
>   
> -			if (!iopte_leaf(pte, lvl, iop->fmt)) {
> -				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
> +			__arm_lpae_clear_pte(ptep, &iop->cfg);
>   
> +			if (!iopte_leaf(pte, lvl, iop->fmt)) {
>   				/* Also flush any partial walks */
>   				io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
>   							  ARM_LPAE_GRANULE(data));
>   				__arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
> +			} else if (!iommu_iotlb_gather_queued(gather)) {
> +				io_pgtable_tlb_add_page(iop, gather, iova + i * size, size);
>   			}
> -		}
>   
> -		/* Clear the remaining entries */
> -		__arm_lpae_clear_pte(ptep, &iop->cfg, i);
> -
> -		if (gather && !iommu_iotlb_gather_queued(gather))
> -			for (int j = 0; j < i; j++)
> -				io_pgtable_tlb_add_page(iop, gather, iova + j * size, size);
> +			ptep++;
> +			i++;
> +		}
>   
>   		return i * size;
>   	} else if (iopte_leaf(pte, lvl, iop->fmt)) {

