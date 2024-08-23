Return-Path: <linux-arm-msm+bounces-29374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C9E95D280
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 18:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A9BF1F22381
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 16:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEF418BBB1;
	Fri, 23 Aug 2024 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udKDD1EC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD5118BBA5;
	Fri, 23 Aug 2024 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429375; cv=none; b=awPghef2lK9FFrqzBRJvNXdfU0u62Pppa+oADnL9D7V1MLNEmqFjphqBWSdx/0G/bpp61N9P3cj05lV5S4mdFqqOfI1WeFbK5we4gBIeooS8gfuja3uovlcejw1ox15t7fiB+gCLSAdSBWNk7mCdM0zJ/0UZCVzXexb8/fLiEAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429375; c=relaxed/simple;
	bh=JOl3VeJVb7+4udev9KoJnFszscQS+ytPrFBBCJNeJzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KS4KY9z/dgrSaBrpP5I339oCxSYnq9OOY98FCNYeTZhyDr4Cutd6uEzc5qyUnVlkuxVTcb3LujWeqtrfXR2vz2Yx5fjQImEiNZR3V/fyIRTXA2loJ+JzMmGIgz/ZAx1Ju69P5wGhql4nK4MH3XFapsN1t7HkNawXOFDbwELxzVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udKDD1EC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A73C4AF15;
	Fri, 23 Aug 2024 16:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724429375;
	bh=JOl3VeJVb7+4udev9KoJnFszscQS+ytPrFBBCJNeJzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udKDD1ECZh77xirvKCpBf+xQldK6fi+u8b+vBdV0dRAxqbsQVNS4N5S4G1ibDmfF7
	 uXGJPszwxa2h2NsLKcdezQGYbpShpWZy4gaGOuzKW9PygQBoFtXWaKIrL0Q4gPJslC
	 fdqwMo1j0Qf/1ma8s805kDizssQnBmZ4Nm5dqnckknINhYiSduz5VpfEMMuruDARJS
	 feDdrxQ61rXvstD/vNKiaTdOI4yNXDgncY0QjGwex6jtqANxZpPMcxCwCs2sdvCGAP
	 SqLavNv3xLTl1s/+WEVJ3Rv47SSh4rjxHqZawU+sNxgnXnvGTuR32b4zjkChqs8Zqx
	 N9Txwsd/NdTZA==
Date: Fri, 23 Aug 2024 17:09:29 +0100
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Mostafa Saleh <smostafa@google.com>,
	Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/4] iommu/io-pgtable-arm: Make pgtable walker more
 generic
Message-ID: <20240823160929.GA851@willie-the-truck>
References: <20240820171652.145673-1-robdclark@gmail.com>
 <20240820171652.145673-2-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820171652.145673-2-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Aug 20, 2024 at 10:16:44AM -0700, Rob Clark wrote:
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index f5d9fd1f45bf..b4bc358740e0 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -747,33 +747,31 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
>  }
>  
>  struct io_pgtable_walk_data {
> -	struct iommu_dirty_bitmap	*dirty;
> +	void				*data;
> +	int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
> +		     arm_lpae_iopte pte, size_t size);
>  	unsigned long			flags;
>  	u64				addr;
>  	const u64			end;
>  };
>  
> -static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
> -				       struct io_pgtable_walk_data *walk_data,
> -				       arm_lpae_iopte *ptep,
> -				       int lvl);
> +static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
> +				 struct io_pgtable_walk_data *walk_data,
> +				 arm_lpae_iopte *ptep,
> +				 int lvl);
>  
> -static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
> -				  struct io_pgtable_walk_data *walk_data,
> -				  arm_lpae_iopte *ptep, int lvl)
> +static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
> +			    struct io_pgtable_walk_data *walk_data,
> +			    arm_lpae_iopte *ptep, int lvl)
>  {
>  	struct io_pgtable *iop = &data->iop;
>  	arm_lpae_iopte pte = READ_ONCE(*ptep);
>  
>  	if (iopte_leaf(pte, lvl, iop->fmt)) {
>  		size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
> -
> -		if (iopte_writeable_dirty(pte)) {
> -			iommu_dirty_bitmap_record(walk_data->dirty,
> -						  walk_data->addr, size);
> -			if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
> -				iopte_set_writeable_clean(ptep);
> -		}
> +		int ret = walk_data->visit(walk_data, lvl, pte, size);
> +		if (ret)
> +			return ret;
>  		walk_data->addr += size;
>  		return 0;
>  	}
> @@ -782,13 +780,13 @@ static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
>  		return -EINVAL;
>  
>  	ptep = iopte_deref(pte, data);
> -	return __arm_lpae_iopte_walk_dirty(data, walk_data, ptep, lvl + 1);
> +	return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
>  }
>  
> -static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
> -				       struct io_pgtable_walk_data *walk_data,
> -				       arm_lpae_iopte *ptep,
> -				       int lvl)
> +static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
> +				 struct io_pgtable_walk_data *walk_data,
> +				 arm_lpae_iopte *ptep,
> +				 int lvl)
>  {
>  	u32 idx;
>  	int max_entries, ret;
> @@ -803,7 +801,7 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
>  
>  	for (idx = ARM_LPAE_LVL_IDX(walk_data->addr, lvl, data);
>  	     (idx < max_entries) && (walk_data->addr < walk_data->end); ++idx) {
> -		ret = io_pgtable_visit_dirty(data, walk_data, ptep + idx, lvl);
> +		ret = io_pgtable_visit(data, walk_data, ptep + idx, lvl);
>  		if (ret)
>  			return ret;
>  	}
> @@ -811,6 +809,20 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
>  	return 0;
>  }
>  
> +static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl,
> +		       arm_lpae_iopte pte, size_t size)
> +{
> +	struct iommu_dirty_bitmap *dirty = walk_data->data;
> +
> +	if (iopte_writeable_dirty(pte)) {
> +		iommu_dirty_bitmap_record(dirty, walk_data->addr, size);
> +		if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
> +			iopte_set_writeable_clean(&pte);

Are you sure that's correct? I suspect we really want to update the actual
page-table in this case, so we probably want to pass the pointer in instead
of the pte value.

Will

