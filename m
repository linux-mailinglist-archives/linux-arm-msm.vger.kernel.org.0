Return-Path: <linux-arm-msm+bounces-22908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DF790B4DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 17:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE2171C22E38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 15:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DA615533C;
	Mon, 17 Jun 2024 15:13:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B88418C3B;
	Mon, 17 Jun 2024 15:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718637227; cv=none; b=Ix2Pt36d+Nmtm0UFyK465HSfuadjx7ZJEC0Hzg7D8Fy638dlKugpdO1KI9lwgTZhYOhZdKvm6XVWrq719HoKeT28ac5wtqZwRy4fYzVBZXamXyDOQVO7I6ytzxsaR/5MIC9zQ7I8lruD73t2zKx7b69h0SSbo21BVnW3UBGvLlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718637227; c=relaxed/simple;
	bh=UL43jVAhdU+OtHdX5bK5r64Vwn48uow1EiUNHTwDAzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DiUTWUPcxhIYTu2V/ECrQyAfwUBjSoA2i+R1c5YPEN0ZFEHNKKxFmT0Hg0HdmLP49blynUH3wSh9S2LI6a9G0yZr10dKc6IhG7oKPWilcEnHKJ61pLkBlBWdzid8tqRHExxcXHHlAy+EMD5uIBZ5yABiradNCieK5cXoMAVZjCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D46EDA7;
	Mon, 17 Jun 2024 08:14:09 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D132E3F6A8;
	Mon, 17 Jun 2024 08:13:42 -0700 (PDT)
Message-ID: <85f5250f-0d50-4aa3-93c9-2008c6ccb8fb@arm.com>
Date: Mon, 17 Jun 2024 16:13:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] iommu/io-pgtable-arm: Add way to debug pgtable
 walk
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Kevin Tian <kevin.tian@intel.com>, Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
References: <20240523175227.117984-1-robdclark@gmail.com>
 <20240523175227.117984-2-robdclark@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240523175227.117984-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2024 6:52 pm, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add an io-pgtable method to walk the pgtable returning the raw PTEs that
> would be traversed for a given iova access.

Have to say I'm a little torn here - with my iommu-dma hat on I'm not 
super enthusiastic about adding any more overhead to iova_to_phys, but 
in terms of maintaining io-pgtable I do like the overall shape of the 
implementation...

Will, how much would you hate a compromise of inlining iova_to_phys as 
the default walk behaviour if cb is NULL? :)

That said, looking at the unmap figures for dma_map_benchmark on a 
Neoverse N1, any difference I think I see is still well within the 
noise, so maybe a handful of extra indirect calls isn't really enough to 
worry about?

Cheers,
Robin.

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/iommu/io-pgtable-arm.c | 51 ++++++++++++++++++++++++++++------
>   include/linux/io-pgtable.h     |  4 +++
>   2 files changed, 46 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index f7828a7aad41..f47a0e64bb35 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -693,17 +693,19 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
>   				data->start_level, ptep);
>   }
>   
> -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> -					 unsigned long iova)
> +static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
> +			int (*cb)(void *cb_data, void *pte, int level),
> +			void *cb_data)
>   {
>   	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
>   	arm_lpae_iopte pte, *ptep = data->pgd;
>   	int lvl = data->start_level;
> +	int ret;
>   
>   	do {
>   		/* Valid IOPTE pointer? */
>   		if (!ptep)
> -			return 0;
> +			return -EFAULT;
>   
>   		/* Grab the IOPTE we're interested in */
>   		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
> @@ -711,22 +713,52 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
>   
>   		/* Valid entry? */
>   		if (!pte)
> -			return 0;
> +			return -EFAULT;
> +
> +		ret = cb(cb_data, &pte, lvl);
> +		if (ret)
> +			return ret;
>   
> -		/* Leaf entry? */
> +		/* Leaf entry?  If so, we've found the translation */
>   		if (iopte_leaf(pte, lvl, data->iop.fmt))
> -			goto found_translation;
> +			return 0;
>   
>   		/* Take it to the next level */
>   		ptep = iopte_deref(pte, data);
>   	} while (++lvl < ARM_LPAE_MAX_LEVELS);
>   
>   	/* Ran out of page tables to walk */
> +	return -EFAULT;
> +}
> +
> +struct iova_to_phys_walk_data {
> +	arm_lpae_iopte pte;
> +	int level;
> +};
> +
> +static int iova_to_phys_walk_cb(void *cb_data, void *pte, int level)
> +{
> +	struct iova_to_phys_walk_data *d = cb_data;
> +
> +	d->pte = *(arm_lpae_iopte *)pte;
> +	d->level = level;
> +
>   	return 0;
> +}
> +
> +static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> +					 unsigned long iova)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	struct iova_to_phys_walk_data d;
> +	int ret;
> +
> +	ret = arm_lpae_pgtable_walk(ops, iova, iova_to_phys_walk_cb, &d);
> +	if (ret)
> +		return 0;
>   
> -found_translation:
> -	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
> -	return iopte_to_paddr(pte, data) | iova;
> +	iova &= (ARM_LPAE_BLOCK_SIZE(d.level, data) - 1);
> +	return iopte_to_paddr(d.pte, data) | iova;
>   }
>   
>   static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
> @@ -807,6 +839,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
>   		.map_pages	= arm_lpae_map_pages,
>   		.unmap_pages	= arm_lpae_unmap_pages,
>   		.iova_to_phys	= arm_lpae_iova_to_phys,
> +		.pgtable_walk	= arm_lpae_pgtable_walk,
>   	};
>   
>   	return data;
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 86cf1f7ae389..261b48af068a 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -177,6 +177,7 @@ struct io_pgtable_cfg {
>    * @map_pages:    Map a physically contiguous range of pages of the same size.
>    * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
>    * @iova_to_phys: Translate iova to physical address.
> + * @pgtable_walk: (optional) Perform a page table walk for a given iova.
>    *
>    * These functions map directly onto the iommu_ops member functions with
>    * the same names.
> @@ -190,6 +191,9 @@ struct io_pgtable_ops {
>   			      struct iommu_iotlb_gather *gather);
>   	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
>   				    unsigned long iova);
> +	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova,
> +			    int (*cb)(void *cb_data, void *pte, int level),
> +			    void *cb_data);
>   	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
>   				    unsigned long iova, size_t size,
>   				    unsigned long flags,

