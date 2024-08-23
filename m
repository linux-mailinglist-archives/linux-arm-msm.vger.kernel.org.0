Return-Path: <linux-arm-msm+bounces-29375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D45195D299
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 18:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFD08B28D72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 16:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB18189BBF;
	Fri, 23 Aug 2024 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6aiM/nb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332C7189538;
	Fri, 23 Aug 2024 16:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429514; cv=none; b=sNWvyVlG0bJRGZ3Dh6b+QGWZJht5fPlE0aj/MXwYzdcwgDnVknPrbEDxfR74NdNXtkjawpL6odvwqApzeNCXFjCZBRTgm3o+5cimIZV666W12S/6oUBjRzaa5Q7ChPVIpMrv2tXN0ttDpYoSsi6lnjVQvDFoOePqud+bqphkhYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429514; c=relaxed/simple;
	bh=GkWrXMYKB3T3rhIJd97AJ1oo1C6XtPEZ9s0XGKFHziA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASAg6eX1egg/u5IKu4N++0vBlJGXpfvM9+D5ggE4r/8ghEO22u5bPexICaJzZqBT1UDOhvFGafcSDy5MQ0yRcVc6oW6htz20RPFue/Ywu/sxo6pAR0GLsZAljUEWxihzyfruhrEgIezse+Jr1+CKb94VjORVuMLFPFlB6TtSF5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6aiM/nb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCEB6C32786;
	Fri, 23 Aug 2024 16:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724429513;
	bh=GkWrXMYKB3T3rhIJd97AJ1oo1C6XtPEZ9s0XGKFHziA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j6aiM/nbOLkq0CShwDeNYoPTwdbzW78DfJnvQpHD23uodFryDRc/M5j0W6R74gc/e
	 nppNavurxH85NQpGBR1zR5VrsnWFebsAcTVjZS0ZQ2JdKAjltl+l+gi4XT3x5k7XV9
	 D945cAn6pUG3BbznbOHshMcJ/2ZcaaU9iHnh2Y06jMW6RQiTDdXivNw5ya1/sM0ZfB
	 XO9pJZ6HcCuVX+rwqJ/1KITSTp3iJpu4Z3RWP9IeNuNxuVIAHqmIoup5ET9IZXqcOT
	 +roeiKtlqZnMMUuwzbCvRoe+lPU99qQ8dfimedoy3nNIJYmlHmzgTeumcFwDPZ2ik2
	 xUEeoQaoyOBYA==
Date: Fri, 23 Aug 2024 17:11:48 +0100
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Mostafa Saleh <smostafa@google.com>,
	Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/4] iommu/io-pgtable-arm: Re-use the pgtable walk for
 iova_to_phys
Message-ID: <20240823161148.GB851@willie-the-truck>
References: <20240820171652.145673-1-robdclark@gmail.com>
 <20240820171652.145673-3-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820171652.145673-3-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Aug 20, 2024 at 10:16:45AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Re-use the generic pgtable walk path.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 73 +++++++++++++++++-----------------
>  1 file changed, 36 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index b4bc358740e0..5fa1274a665a 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -710,42 +710,6 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
>  				data->start_level, ptep);
>  }
>  
> -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> -					 unsigned long iova)
> -{
> -	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> -	arm_lpae_iopte pte, *ptep = data->pgd;
> -	int lvl = data->start_level;
> -
> -	do {
> -		/* Valid IOPTE pointer? */
> -		if (!ptep)
> -			return 0;
> -
> -		/* Grab the IOPTE we're interested in */
> -		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
> -		pte = READ_ONCE(*ptep);
> -
> -		/* Valid entry? */
> -		if (!pte)
> -			return 0;
> -
> -		/* Leaf entry? */
> -		if (iopte_leaf(pte, lvl, data->iop.fmt))
> -			goto found_translation;
> -
> -		/* Take it to the next level */
> -		ptep = iopte_deref(pte, data);
> -	} while (++lvl < ARM_LPAE_MAX_LEVELS);
> -
> -	/* Ran out of page tables to walk */
> -	return 0;
> -
> -found_translation:
> -	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
> -	return iopte_to_paddr(pte, data) | iova;
> -}
> -
>  struct io_pgtable_walk_data {
>  	void				*data;
>  	int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
> @@ -760,6 +724,41 @@ static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
>  				 arm_lpae_iopte *ptep,
>  				 int lvl);
>  
> +struct iova_to_phys_data {
> +	arm_lpae_iopte pte;
> +	int lvl;
> +};
> +
> +static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, int lvl,
> +			      arm_lpae_iopte pte, size_t size)
> +{
> +	struct iova_to_phys_data *data = walk_data->data;
> +	data->pte = pte;
> +	data->lvl = lvl;
> +	return 0;
> +}
> +
> +static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> +					 unsigned long iova)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	struct iova_to_phys_data d;
> +	struct io_pgtable_walk_data walk_data = {
> +		.data = &d,
> +		.visit = visit_iova_to_phys,
> +		.addr = iova,
> +		.end = iova + 1,
> +	};
> +	int ret;
> +
> +	ret = __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
> +	if (ret)
> +		return 0;
> +
> +	iova &= (ARM_LPAE_BLOCK_SIZE(d.lvl, data) - 1);
> +	return iopte_to_paddr(d.pte, data) | iova;
> +}
> +
>  static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
>  			    struct io_pgtable_walk_data *walk_data,
>  			    arm_lpae_iopte *ptep, int lvl)
> @@ -776,7 +775,7 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
>  		return 0;
>  	}
>  
> -	if (WARN_ON(!iopte_table(pte, lvl)))
> +	if (WARN_ON(!iopte_table(pte, lvl) && !selftest_running))

Why do you care about the selftest here?

Will

