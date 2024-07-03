Return-Path: <linux-arm-msm+bounces-25175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7978926432
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 17:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87E24284107
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 15:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D403417C213;
	Wed,  3 Jul 2024 15:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXirydPx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8ED17BB0D;
	Wed,  3 Jul 2024 15:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720018931; cv=none; b=djKpQ0KTEJ9o4gy8aFRm0ysLdGIebNjd7oeJ+52l7i3i065yqprRLYFpwC7CyUUaajvNAbb2+SQ6x/zG9NHo85CYy8Qx5GELB1EKMGN0GWLBHiAlbh7z1oGnlmR6UUbRJfnU1+Lxab2VPXY8CTd0tt0ms6kMBkFxQ0mWA90vDrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720018931; c=relaxed/simple;
	bh=inCHldH9Dlwyh/zOAE2VhEgtnXtFJn3LffZ8Wuw5rfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qu+aC9AcqQ/szkehQbeSjFk3y9k0JsHIf5KOTEOFqIPx1v/x4wikk4YjAfcyONtVMVjVDHN36IA8VpzaLXve5b6WcEQyIs8F1NLFu9ysaornmhzKOTJ9z+AkBZxR1DjDuj8oeg9545FgH3NxU1YnNGSdtN40SxYnfFSGRxTkL7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXirydPx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74F2C2BD10;
	Wed,  3 Jul 2024 15:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720018931;
	bh=inCHldH9Dlwyh/zOAE2VhEgtnXtFJn3LffZ8Wuw5rfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QXirydPx98ylk807Kr0IvThvOzX0uaRdHHI6xbrttp3bygpYOPwXc1hZU6ia+TEJJ
	 KQuaKUUaxceVGHX8OfX76bd6iypQ1XY0evyThCu0zX17+1fmHVCZlsJFsNjgOmh80/
	 MVbhdHGV4w4euNcb6ajsptpzqLtUInOOD9NzqCPmmlP5m+QIgdc4sS8Ro3flchxDYc
	 gbgJXFRYXPOoLswr3CKFa587/dtgqf8/86GaWh4ucbd47R+sHfu5u7lqBBfc3JRM8Y
	 bZgo+kiy+laS14WpS0F94WlX0uSeB0UzRFCRPOhc3TNI3zK4SY+q6p+fLDSFBV6qER
	 SPdA9H0CHAdkg==
Date: Wed, 3 Jul 2024 16:02:05 +0100
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Steven Price <steven.price@arm.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/2] iommu/io-pgtable-arm: Add way to debug pgtable
 walk
Message-ID: <20240703150205.GA6012@willie-the-truck>
References: <20240626204033.255813-1-robdclark@gmail.com>
 <20240626204033.255813-2-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626204033.255813-2-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Rob,

On Wed, Jun 26, 2024 at 01:40:26PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add an io-pgtable method to walk the pgtable returning the raw PTEs that
> would be traversed for a given iova access.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 34 +++++++++++++++++++++++++---------
>  include/linux/io-pgtable.h     | 16 ++++++++++++++++
>  2 files changed, 41 insertions(+), 9 deletions(-)

Non-technical question, but with patch 2/2 being drm-specific, how do
you plan to get this merged this once it's finalised? I can take this
part via the IOMMU tree?

> +static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> +					 unsigned long iova)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	struct io_pgtable_walk_data wd = {};
> +	int ret, lvl;
> +
> +	ret = arm_lpae_pgtable_walk(ops, iova, &wd);
> +	if (ret)
> +		return 0;
> +
> +	lvl = wd.level + data->start_level;

nit, but the level is architectural so I think we should initialise
wd.level to data->start_level instead.

>  
> -found_translation:
>  	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
> -	return iopte_to_paddr(pte, data) | iova;
> +	return iopte_to_paddr(wd.ptes[wd.level - 1], data) | iova;
>  }
>  
>  static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
> @@ -804,6 +819,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
>  		.map_pages	= arm_lpae_map_pages,
>  		.unmap_pages	= arm_lpae_unmap_pages,
>  		.iova_to_phys	= arm_lpae_iova_to_phys,
> +		.pgtable_walk	= arm_lpae_pgtable_walk,
>  	};
>  
>  	return data;
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 86cf1f7ae389..4d696724c7da 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -171,12 +171,26 @@ struct io_pgtable_cfg {
>  	};
>  };
>  
> +/**
> + * struct io_pgtable_walk_data - information from a pgtable walk
> + *
> + * @ptes:     The recorded PTE values from the walk
> + * @level:    The level of the last PTE
> + *
> + * @level also specifies the last valid index in @ptes
> + */
> +struct io_pgtable_walk_data {
> +	u64 ptes[4];
> +	int level;
> +};

I wonder if we can do better than hardcoding the '4' here? I wouldn't be
surprised if this doesn't work, but could we do something along the
lines of:

struct io_pgtable_walk_data {
	int level;
	int num_levels;
	u64 ptes[] __counted_by(num_levels);
};

and then have the Arm (LPAE)-specific code wrap that in a private
structure:

struct arm_lpae_io_pgtable_walk_data {
	struct io_pgtable_walk_data data;
	u64 ptes[ARM_LPAE_MAX_LEVELS];
};

which is used by the walker?

Will

