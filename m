Return-Path: <linux-arm-msm+bounces-24000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 635129151C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 17:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFF29B277FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E90519B3F9;
	Mon, 24 Jun 2024 15:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2Y8qh2k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0857619B3DA;
	Mon, 24 Jun 2024 15:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719242048; cv=none; b=lZDTiaQOBuvErrH6Hg+LlLqVM4FbxtY+lRh30VU8iqT1yeMsVKeFe1adA5I6SStZ+Foc3XgpFbtw7qohV3sVt8/3+Z9aFyv5yC4hJNoKTozdSPR++7xBI94ZVnDUYnPS1qH8lbABJY6h4x5rnte5ntEyoxlu9nE03mjOjPW2+I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719242048; c=relaxed/simple;
	bh=JrUnbyM+q1c3z7DUj0a7qxZEmOleJaUA+Pprv4ibD0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBhCiR2NzSK2tdx4MBCigs3C9GZr9njla3FrOLrD/4AA6ZcWi8lwfvuccFBdluL71SBop6QH88Y1LmP1bcN8cHHWErgqDSBfvzk1nunGHcm8VPKCx1zhJOIQt6DF/HXh5oNCnFnOE+o0XSsANVe2P75zfdw8LQgN/CIeYsUt0P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2Y8qh2k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B460C32789;
	Mon, 24 Jun 2024 15:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719242047;
	bh=JrUnbyM+q1c3z7DUj0a7qxZEmOleJaUA+Pprv4ibD0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2Y8qh2kUAE14ni+F6sttsOgX0qSTbQdpBDBuXgf074tDaOKsndopIqOqZ9uWCa0B
	 BrXaucEOqeIZUwC9oaSjhq7jUU/zpYS9Z+PsSzOFyck7oEasH1mUU2xPxx+YzjM68O
	 K3QNVUQkn25yMDLQe3dGSWk+XO+1w65xWgKZmNKAVV+s1Gcxy8tjGgw1gHHHF9NE/j
	 P6vYP6bLXUyyYfjB/7uru8JWVbAHFu7UGqu6URItSy/b3+QpNoRTcdgx+CiH/KYT2W
	 qYJfklHIpEjOU4XstNt9Xt7YAJberUNKrX+2rj/liCs5hFrUh8qTUlDRt7ofGmjfR9
	 uJWjt0rj4JBLA==
Date: Mon, 24 Jun 2024 16:14:01 +0100
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] iommu/io-pgtable-arm: Add way to debug pgtable
 walk
Message-ID: <20240624151401.GB8706@willie-the-truck>
References: <20240523175227.117984-1-robdclark@gmail.com>
 <20240523175227.117984-2-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523175227.117984-2-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, May 23, 2024 at 10:52:21AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add an io-pgtable method to walk the pgtable returning the raw PTEs that
> would be traversed for a given iova access.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 51 ++++++++++++++++++++++++++++------
>  include/linux/io-pgtable.h     |  4 +++
>  2 files changed, 46 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index f7828a7aad41..f47a0e64bb35 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -693,17 +693,19 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
>  				data->start_level, ptep);
>  }
>  
> -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> -					 unsigned long iova)
> +static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
> +			int (*cb)(void *cb_data, void *pte, int level),
> +			void *cb_data)
>  {
>  	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
>  	arm_lpae_iopte pte, *ptep = data->pgd;
>  	int lvl = data->start_level;
> +	int ret;
>  
>  	do {
>  		/* Valid IOPTE pointer? */
>  		if (!ptep)
> -			return 0;
> +			return -EFAULT;

nit: -ENOENT might be a little better, as we're only checking against a
NULL entry rather than strictly any faulting entry.

>  		/* Grab the IOPTE we're interested in */
>  		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
> @@ -711,22 +713,52 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
>  
>  		/* Valid entry? */
>  		if (!pte)
> -			return 0;
> +			return -EFAULT;

Same here (and at the end of the function).

> +
> +		ret = cb(cb_data, &pte, lvl);

Since pte is on the stack, rather than pointing into the actual pgtable,
I think it would be clearer to pass it by value to the callback.

> +		if (ret)
> +			return ret;
>  
> -		/* Leaf entry? */
> +		/* Leaf entry?  If so, we've found the translation */
>  		if (iopte_leaf(pte, lvl, data->iop.fmt))
> -			goto found_translation;
> +			return 0;
>  
>  		/* Take it to the next level */
>  		ptep = iopte_deref(pte, data);
>  	} while (++lvl < ARM_LPAE_MAX_LEVELS);
>  
>  	/* Ran out of page tables to walk */
> +	return -EFAULT;
> +}
> +
> +struct iova_to_phys_walk_data {
> +	arm_lpae_iopte pte;
> +	int level;
> +};

Expanding a little on Robin's suggestion, why don't we drop this structure
in favour of something more generic:

	struct arm_lpae_walk_data {
		arm_lpae_iopte ptes[ARM_LPAE_MAX_LEVELS];
	};

and then do something in the walker like:

	if (cb && !cb(pte, lvl))
		walk_data->ptes[lvl] = pte;

which could return the physical address at the end, if it reaches a leaf
entry. That way arm_lpae_iova_to_phys() is just passing a NULL callback
to the walker and your debug callback just needs to return 0 (i.e. the
callback is basically just saying whether or not to continue the walk).

Will

