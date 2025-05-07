Return-Path: <linux-arm-msm+bounces-57173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B63FCAAE507
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 17:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BADD4A60EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 15:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CAF28AB09;
	Wed,  7 May 2025 15:39:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC08748D;
	Wed,  7 May 2025 15:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632389; cv=none; b=RtJvGI1uJ7WhuxDQpDhUc5X3L3OfefVU94VQyjyAN64SYF/E3qlS03lcKUhK/3sFeVWf/81M+QdIyfPAMtgpRYQDXclmLt9VHcgi0vUweUxa4rjYDHzypTiWpnUiH86pOBQ8+axQ7mKkvMFkrrQlmDlJEhFaKuDvGnq0vqo+PBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632389; c=relaxed/simple;
	bh=tXA/bSYgzGq0C5DYDH2dfNVPwihtYXwbRIQh3juKr2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d0S/nlhDu8AjQhHqL/lrMx918B5jTYM1AIeXSlrThgzN7fMm54n8aOTwRGNdFyg+xOQRQ8n2EmqbnxIosAJ0v2eIYYrIE5AdS8stoWWkNfO7M9buveMtf35SpBsaFURPi9p4qtUvmSjxoAqMhRwAguRKzMijF9VY8snbfJJCJrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07344339;
	Wed,  7 May 2025 08:39:36 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76EA33F58B;
	Wed,  7 May 2025 08:39:44 -0700 (PDT)
Message-ID: <0c5ce93a-c5ff-4b09-bde4-196da505cda2@arm.com>
Date: Wed, 7 May 2025 16:39:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
To: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250507142953.269300-1-robdclark@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250507142953.269300-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2025 3:29 pm, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In situations where mapping/unmapping sequence can be controlled by
> userspace, attempting to map over a region that has not yet been
> unmapped is an error.  But not something that should spam dmesg.
> 
> Now that there is a quirk, we can also drop the selftest_running
> flag, and use the quirk instead for selftests.

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Sending v2 stand-alone, since I'm not quite ready to send a new
> iteration of the full VM_BIND series.  And with selftest_running
> removed, I think this patch stands on it's own.  (And maybe there
> is still time to sneak this in for v6.16, removing an iommu dep
> for the VM_BIND series in v6.17?)
> 
> v2: Drop selftest_running and use IO_PGTABLE_QUIRK_NO_WARN_ON for
>      the selftests
> 
>   drivers/iommu/io-pgtable-arm.c | 27 ++++++++++++++-------------
>   include/linux/io-pgtable.h     |  8 ++++++++
>   2 files changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index f27965caf6a1..a535d88f8943 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -253,8 +253,6 @@ static inline bool arm_lpae_concat_mandatory(struct io_pgtable_cfg *cfg,
>   	       (data->start_level == 1) && (oas == 40);
>   }
>   
> -static bool selftest_running = false;
> -
>   static dma_addr_t __arm_lpae_dma_addr(void *pages)
>   {
>   	return (dma_addr_t)virt_to_phys(pages);
> @@ -373,7 +371,7 @@ static int arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
>   	for (i = 0; i < num_entries; i++)
>   		if (iopte_leaf(ptep[i], lvl, data->iop.fmt)) {
>   			/* We require an unmap first */
> -			WARN_ON(!selftest_running);
> +			WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
>   			return -EEXIST;
>   		} else if (iopte_type(ptep[i]) == ARM_LPAE_PTE_TYPE_TABLE) {
>   			/*
> @@ -475,7 +473,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>   		cptep = iopte_deref(pte, data);
>   	} else if (pte) {
>   		/* We require an unmap first */
> -		WARN_ON(!selftest_running);
> +		WARN_ON(!(cfg->quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
>   		return -EEXIST;
>   	}
>   
> @@ -649,8 +647,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   	unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
>   	ptep += unmap_idx_start;
>   	pte = READ_ONCE(*ptep);
> -	if (WARN_ON(!pte))
> -		return 0;
> +	if (!pte) {
> +		WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
> +		return -ENOENT;
> +	}
>   
>   	/* If the size matches this level, we're in the right place */
>   	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> @@ -660,8 +660,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   		/* Find and handle non-leaf entries */
>   		for (i = 0; i < num_entries; i++) {
>   			pte = READ_ONCE(ptep[i]);
> -			if (WARN_ON(!pte))
> +			if (!pte) {
> +				WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
>   				break;
> +			}
>   
>   			if (!iopte_leaf(pte, lvl, iop->fmt)) {
>   				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
> @@ -976,7 +978,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>   	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
>   			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
>   			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
> -			    IO_PGTABLE_QUIRK_ARM_HD))
> +			    IO_PGTABLE_QUIRK_ARM_HD |
> +			    IO_PGTABLE_QUIRK_NO_WARN_ON))
>   		return NULL;
>   
>   	data = arm_lpae_alloc_pgtable(cfg);
> @@ -1079,7 +1082,8 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
>   	struct arm_lpae_io_pgtable *data;
>   	typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr = &cfg->arm_lpae_s2_cfg.vtcr;
>   
> -	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB))
> +	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB |
> +			    IO_PGTABLE_QUIRK_NO_WARN_ON))
>   		return NULL;
>   
>   	data = arm_lpae_alloc_pgtable(cfg);
> @@ -1320,7 +1324,6 @@ static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
>   #define __FAIL(ops, i)	({						\
>   		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
>   		arm_lpae_dump_ops(ops);					\
> -		selftest_running = false;				\
>   		-EFAULT;						\
>   })
>   
> @@ -1336,8 +1339,6 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
>   	size_t size, mapped;
>   	struct io_pgtable_ops *ops;
>   
> -	selftest_running = true;
> -
>   	for (i = 0; i < ARRAY_SIZE(fmts); ++i) {
>   		cfg_cookie = cfg;
>   		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
> @@ -1426,7 +1427,6 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
>   		free_io_pgtable_ops(ops);
>   	}
>   
> -	selftest_running = false;
>   	return 0;
>   }
>   
> @@ -1448,6 +1448,7 @@ static int __init arm_lpae_do_selftests(void)
>   		.tlb = &dummy_tlb_ops,
>   		.coherent_walk = true,
>   		.iommu_dev = &dev,
> +		.quirks = IO_PGTABLE_QUIRK_NO_WARN_ON,
>   	};
>   
>   	/* __arm_lpae_alloc_pages() merely needs dev_to_node() to work */
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index bba2a51c87d2..639b8f4fb87d 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -88,6 +88,13 @@ struct io_pgtable_cfg {
>   	 *
>   	 * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
>   	 * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttrs bits
> +	 *
> +	 * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
> +	 *	mappings, but silently return -EEXISTS.  Normally an attempt
> +	 *	to map over an existing mapping would indicate some sort of
> +	 *	kernel bug, which would justify the WARN_ON().  But for GPU
> +	 *	drivers, this could be under control of userspace.  Which
> +	 *	deserves an error return, but not to spam dmesg.
>   	 */
>   	#define IO_PGTABLE_QUIRK_ARM_NS			BIT(0)
>   	#define IO_PGTABLE_QUIRK_NO_PERMS		BIT(1)
> @@ -97,6 +104,7 @@ struct io_pgtable_cfg {
>   	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA		BIT(6)
>   	#define IO_PGTABLE_QUIRK_ARM_HD			BIT(7)
>   	#define IO_PGTABLE_QUIRK_ARM_S2FWB		BIT(8)
> +	#define IO_PGTABLE_QUIRK_NO_WARN_ON		BIT(9)
>   	unsigned long			quirks;
>   	unsigned long			pgsize_bitmap;
>   	unsigned int			ias;

