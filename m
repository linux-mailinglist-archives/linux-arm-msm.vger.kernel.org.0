Return-Path: <linux-arm-msm+bounces-27247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED8893F461
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 13:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCD7C280F12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 11:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BB0817;
	Mon, 29 Jul 2024 11:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tKLQ6PrR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9709143723
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 11:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722253538; cv=none; b=o5caokM8cBt2hZiNx6IIQ9zhYb6O3kFVun7G6WZEaepzVEWFZQjYsEI3BL2k4hbicGGCkUd6byLg6HJvRqyv8/kuFaNvwUPbFuovN19MOmQzJVcKHlnRIJpK9G80tlSyjmcv2lR8PuA+pfJzUikqH2ESFM64wVgx3kTIoZuu57w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722253538; c=relaxed/simple;
	bh=A10ZdrRPrnXJf2K8fH9tF/ys9uEanUwC8oG0ctp3CtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtkrweW2JK0j1Ul3BUpyn7u9tk0B1y37iYI3HXbuwG3z3tExsQAIhy54lxS6nbpqYtawpmmckE2556YTf7MSKAV6rz9WNVRAhQKH3TiVddkeFP6puCM6WmUBvJSiAcitI+NTr/FbxhpKhfaUAbGdSoEoEbTZELXMq9o2a2ZW1rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tKLQ6PrR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42807cb6afdso54225e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 04:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722253535; x=1722858335; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Po1n89LJvram5HEqYwMALsMwnThZhO0DVQ6rc50fxBE=;
        b=tKLQ6PrRlf/dIVsdVuQ21zrwzBYNW0XSmRRRIeIpdrTzKtALgbC18YU25lzXFqPofl
         atYhns1LqLWzzbeqp5yZVuXrps0Iy9sLdZ/3Uy+gkgTGbJZOUHNPYrPubZm20gsBeS84
         s9sjPoFJzmDs/hNUJnicRd/XGS4cR7k/+2BdVG6GrflxRvbJrgvJYx+/CGuoCVC+GpUm
         +zrlFYqR8fTrYedyhIwJxnPonhGpO3KxxJ+aiTMGH0zq28FAcVa1TwMbGEp5uI8nqaP2
         k1V1GJCqxGy2noRtw6h84sSi3kFSYU9JpOoOjqSxHiDlW0KlMf5Z4sGXOAALxR6vYldu
         K0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722253535; x=1722858335;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Po1n89LJvram5HEqYwMALsMwnThZhO0DVQ6rc50fxBE=;
        b=OLV7kiul4kK6UDgFSHYOwDw85uoz5xabZzEUiw1Encz8VzzQr5zb7Aa61TmHXCRtZD
         mWCcjpzsX5mpQgRWUP37EK3bvplCifTREZx+G9l3qu+493d16QwQQ+anqeb5WTy1LPuH
         e109iuXpeOC8TTsSHjvJ5ruZrlgZw/gx6RDHRYccOqpUQa/L65Vw1AOpbNiyug9xnpYb
         G1C0lO2cQUzzqol8BQLgrDXQnGLO8+TR3/YVsMUVllDZJaCYejKRujB1LL7NKSueXyNp
         +aUwb8/yP0cnME9wvcLlVqGr5PxLQiJkxU89qDZaSVjOjF0svPZGs/ZZYDKFVXLlU46T
         tD8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwSPRuKcSnoWnWVzn4juc1jzRx0vZZV6HDCzl/sOtHfubjor4EoowmZyujFzw5sVhmmohrYPekQx79ASYApxnMY+ESX1muc4Z9YH1jXg==
X-Gm-Message-State: AOJu0YxybV4QdDjGFV3Gd6m8IEna40450ocII53YdGaYCjg7GqwV0nxA
	+uAyXxklyLPRqDYGNg6b12dw5OJaxzeeUUOOgRHUsdR55sHJ3RUs0AUVlfSFfQ==
X-Google-Smtp-Source: AGHT+IF9lmrrr4mU6SQTATPg4BGae20+2RN2oYvd82uqtDRGSOWYN9hk+RN/G33dubnGu66mSB8E8A==
X-Received: by 2002:a05:600c:3c96:b0:426:8ee5:3e9c with SMTP id 5b1f17b1804b1-4280b142f23mr4818455e9.6.1722253534535;
        Mon, 29 Jul 2024 04:45:34 -0700 (PDT)
Received: from google.com (180.232.140.34.bc.googleusercontent.com. [34.140.232.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280574003bsm171998655e9.17.2024.07.29.04.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 04:45:34 -0700 (PDT)
Date: Mon, 29 Jul 2024 11:45:30 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, iommu@lists.linux.dev,
	Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>,
	Joerg Roedel <jroedel@suse.de>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] iommu/io-pgtable-arm: Add way to debug pgtable
 walk
Message-ID: <ZqeA2tq5Nw4zvqwD@google.com>
References: <20240717163627.43423-1-robdclark@gmail.com>
 <20240717163627.43423-2-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240717163627.43423-2-robdclark@gmail.com>

Hi Rob,

On Wed, Jul 17, 2024 at 09:36:21AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add an io-pgtable method to walk the pgtable returning the raw PTEs that
> would be traversed for a given iova access.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Acked-by: Joerg Roedel <jroedel@suse.de>
> 
> ---
>  drivers/iommu/io-pgtable-arm.c | 36 +++++++++++++++++++++++++---------
>  include/linux/io-pgtable.h     | 17 ++++++++++++++++
>  2 files changed, 44 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 3d23b924cec1..e70803940b46 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -690,9 +690,11 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
>  				data->start_level, ptep);
>  }
>  
> -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> -					 unsigned long iova)
> +static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops,
> +				 unsigned long iova,
> +				 void *_wd)
>  {
> +	struct arm_lpae_io_pgtable_walk_data *wd = _wd;
>  	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
>  	arm_lpae_iopte pte, *ptep = data->pgd;
>  	int lvl = data->start_level;
> @@ -700,7 +702,7 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
>  	do {
>  		/* Valid IOPTE pointer? */
>  		if (!ptep)
> -			return 0;
> +			return -ENOENT;
>  
>  		/* Grab the IOPTE we're interested in */
>  		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
> @@ -708,22 +710,37 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
>  
>  		/* Valid entry? */
>  		if (!pte)
> -			return 0;
> +			return -ENOENT;
>  
> -		/* Leaf entry? */
> +		wd->ptes[wd->level++] = pte;
> +
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
> -	return 0;
> +	return -ENOENT;
> +}
> +
> +static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> +					 unsigned long iova)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	struct arm_lpae_io_pgtable_walk_data wd = {};
> +	int ret, lvl;
> +
> +	ret = arm_lpae_pgtable_walk(ops, iova, &wd);
> +	if (ret)
> +		return 0;
> +
> +	lvl = wd.level + data->start_level;
>  
> -found_translation:
>  	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
> -	return iopte_to_paddr(pte, data) | iova;
> +	return iopte_to_paddr(wd.ptes[wd.level - 1], data) | iova;
>  }
>  
>  static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
> @@ -804,6 +821,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
>  		.map_pages	= arm_lpae_map_pages,
>  		.unmap_pages	= arm_lpae_unmap_pages,
>  		.iova_to_phys	= arm_lpae_iova_to_phys,
> +		.pgtable_walk	= arm_lpae_pgtable_walk,
>  	};
>  
>  	return data;
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 86cf1f7ae389..df6f6e58310c 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -171,12 +171,28 @@ struct io_pgtable_cfg {
>  	};
>  };
>  
> +/**
> + * struct arm_lpae_io_pgtable_walk_data - information from a pgtable walk
> + *
> + * @ptes:     The recorded PTE values from the walk
> + * @level:    The level of the last PTE
> + *
> + * @level also specifies the last valid index in @ptes
> + */
> +struct arm_lpae_io_pgtable_walk_data {
> +	u64 ptes[4];

I don’t see a reason to save the whole walk for iova_to_phys,
I see that the DRM driver uses those next, but I am worried that
won’t scale, a callback mechanism sounds better.

Also, there is a page table walker recently added to io-pagtable-arm,
for dirty bit tracking:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/iommu/io-pgtable-arm.c?id=4fe88fd8b4aecb7f9680bf898811db76b94095a9

I’d suggest consolidating those into one walker where each caller
has its own logic in a callback.

Thanks,
Mostafa

> +	int level;
> +};
> +
>  /**
>   * struct io_pgtable_ops - Page table manipulation API for IOMMU drivers.
>   *
>   * @map_pages:    Map a physically contiguous range of pages of the same size.
>   * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
>   * @iova_to_phys: Translate iova to physical address.
> + * @pgtable_walk: (optional) Perform a page table walk for a given iova.  The
> + *                type for the wd parameter is specific to pgtable type, as
> + *                the PTE size and number of levels differs per pgtable type.
>   *
>   * These functions map directly onto the iommu_ops member functions with
>   * the same names.
> @@ -190,6 +206,7 @@ struct io_pgtable_ops {
>  			      struct iommu_iotlb_gather *gather);
>  	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
>  				    unsigned long iova);
> +	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova, void *wd);
>  	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
>  				    unsigned long iova, size_t size,
>  				    unsigned long flags,
> -- 
> 2.45.2
> 

