Return-Path: <linux-arm-msm+bounces-40195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5944D9E3748
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27D4F165AF4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E89E1ADFF7;
	Wed,  4 Dec 2024 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R9O7aGTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902E51A724C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 10:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733307152; cv=none; b=AwbE/7eqMO6+4y2rSDLoQcQuBS9nb1+Uc3vjoSitNwXp8naZj51g+AAuqxMPQPtXq+AQVG8q3x/LKnl3jVukYRb+NPvoGrd7MVni96S3AY+ebv4FpsGPvI0JpE2BcCztvA83+E1fQsJZ7zNQq0zChmpCkEmDNDSCxWbgGC463Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733307152; c=relaxed/simple;
	bh=+CVqRn85L5p9rsCZcm5sKLRDW42VUw0gAJKUmesM+q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TiUUBHw7xm6xsIqv1nM9PzltcwbQ8MtY6j7hOKOdoWv3By6fi/tfbhN89ylCFjLEjbwXlHEAxQ/TtndogoSP8O6j0fYGb7FAONH8vmBiIa8hzMdVyNl9BnnVYD37TlVFhEq9Q6hL4ZJD8IdCwP94tvCQ20Ocui3cpgcDIKQjpA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R9O7aGTa; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4349338add3so37975e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 02:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733307149; x=1733911949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qLs+MAjnlkioXfCJEobmWlFJttU5DMSqco9NCjVHPyc=;
        b=R9O7aGTaU0hFc85VFc7KSAcwXZjceIZuC1kv7zXfBdHocoz7sSTHi744LIcFYp2CyP
         kXLtumzsEKOdAyoBTNGFSOPs7O6aZhKVszaVB2v9jEfj6/QqnO6Uo+eEqPHFziDRWRtN
         DAfwAbLGYHpEqDsfOjWkf5E0mnopUws4vltdULYJ4VAoH3pjhxQ9+4PNbsOLBrTg0LBU
         t9BLRnN+2MJZuxBwCL95dipmQlRZxzXilZ+3M3FJTOmsgb4XGgEVCIZ1773JMVT0lT6W
         vw0cMS3foBFTRlfQ+fiv/XI5VI6gn/nKxb19m24ZSepo4CKDQ3Bjy2Ch4HbPPiNl8iIF
         nVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733307149; x=1733911949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLs+MAjnlkioXfCJEobmWlFJttU5DMSqco9NCjVHPyc=;
        b=Gkoe2Tu28KGvGpm2R4NEmD16KSalNbLU0Evc2IzXK7AYgNeDg2LvZ8fP+mvdH/kEnl
         sluGwoQVuIOGd42Kghzx6ttaN3kx86898RWsvTi9tpPINewpknVEgGf0lmDyewIxMr+X
         SGHrF9ztxptV6LZFXp42N1H7PPKnq7i1rhjgdZYTa0MRtrUXSsWWPJlxcJ4X3sXk1ALP
         7EZgeOSrQGGqQEXUOz5i4JgDkVkwu1s7n0mXCM2UQYir2MTWmvVwmKkglPz/+BZ+L7aS
         zjZnscSkYxjmrDL2nllKBvsPKhdNlkIv77x2KwEuYg1SkY/dyj3/ZExRLcJLfbkK/oKR
         AbPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb+vc7je0rTmUXuUX0JFGL1jBXCiwcyp4UR6eEErvJypVAeP2JuZKFglPGPHFL1e4wKPs+/PyCdrOFBXo9@vger.kernel.org
X-Gm-Message-State: AOJu0YwcFCTyA2AiZ4bFLmCXNFOlmQnesG9QoqulxB06bWHDdg3ddzO9
	QSbxp8uRNNbkJ5UNTVDskthusz8fR4Gz8h8EFCWHnVDV2LElqOBNt/khV6cGyBs4XjR7TYL7ecA
	4KA==
X-Gm-Gg: ASbGnctxIx5zRw2txKyO1l98oavIeWKMFGjs5ixo0OyTOticyIkDjZDzljRCnPQHXtx
	5KZyBGvx/E3Adlmy9HHmQwBT696aRHcvfgA7vmQB5yevLCsG+yAOLAwBsoQi5n+rB+v3PuxDiG1
	s0/KL0a+kAXXGEXAt7RXZuQo+erDM2NhoVUnZOFex1VUTgd1x8L6/pEQWVLSFUsPuYTjlsvypUP
	bedtEhmeBzBieonY+hARks9/aO7uMG4zPzBNr1lYAkqn4ZtUHC3As1biSm0ulfp5D55LOdemJ1G
	YXT0oS7EMVTn
X-Google-Smtp-Source: AGHT+IF9rW/W/KKMO9BVSr/bLw+TLa/dGxJXo2KOIrSL7bT2KMLiMDQYkoQTQpYdu8So3eWOjlcV+w==
X-Received: by 2002:a05:600c:4a93:b0:42c:acd7:b59b with SMTP id 5b1f17b1804b1-434d4aab051mr1048795e9.6.1733307148736;
        Wed, 04 Dec 2024 02:12:28 -0800 (PST)
Received: from google.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385eeb999f4sm9494986f8f.109.2024.12.04.02.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:12:28 -0800 (PST)
Date: Wed, 4 Dec 2024 10:12:24 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 1/4] iommu/io-pgtable-arm: Make pgtable walker more
 generic
Message-ID: <Z1ArCCTGtJY9gxP3@google.com>
References: <20241028213146.238941-1-robdclark@gmail.com>
 <20241028213146.238941-2-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028213146.238941-2-robdclark@gmail.com>

Hi Rob,

On Mon, Oct 28, 2024 at 02:31:37PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We can re-use this basic pgtable walk logic in a few places.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Mostafa Saleh <smostafa@google.com>

> ---
>  drivers/iommu/io-pgtable-arm.c | 67 ++++++++++++++++++++++------------
>  1 file changed, 43 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 0e67f1721a3d..7e9c0f8ae138 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -749,33 +749,33 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
>  }
>  
>  struct io_pgtable_walk_data {
> -	struct iommu_dirty_bitmap	*dirty;
> +	struct io_pgtable		*iop;
> +	void				*data;
> +	int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
> +		     arm_lpae_iopte *ptep, size_t size);
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
> -	if (iopte_leaf(pte, lvl, iop->fmt)) {
> -		size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
> +	size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
> +	int ret = walk_data->visit(walk_data, lvl, ptep, size);
> +	if (ret)
> +		return ret;
>  
> -		if (iopte_writeable_dirty(pte)) {
> -			iommu_dirty_bitmap_record(walk_data->dirty,
> -						  walk_data->addr, size);
> -			if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
> -				iopte_set_writeable_clean(ptep);
> -		}
> +	if (iopte_leaf(pte, lvl, iop->fmt)) {
>  		walk_data->addr += size;
>  		return 0;
>  	}
> @@ -784,13 +784,13 @@ static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
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
> @@ -805,7 +805,7 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
>  
>  	for (idx = ARM_LPAE_LVL_IDX(walk_data->addr, lvl, data);
>  	     (idx < max_entries) && (walk_data->addr < walk_data->end); ++idx) {
> -		ret = io_pgtable_visit_dirty(data, walk_data, ptep + idx, lvl);
> +		ret = io_pgtable_visit(data, walk_data, ptep + idx, lvl);
>  		if (ret)
>  			return ret;
>  	}
> @@ -813,6 +813,23 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
>  	return 0;
>  }
>  
> +static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl,
> +		       arm_lpae_iopte *ptep, size_t size)
> +{
> +	struct iommu_dirty_bitmap *dirty = walk_data->data;
> +
> +	if (!iopte_leaf(*ptep, lvl, walk_data->iop->fmt))
> +		return 0;
> +
> +	if (iopte_writeable_dirty(*ptep)) {
> +		iommu_dirty_bitmap_record(dirty, walk_data->addr, size);
> +		if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
> +			iopte_set_writeable_clean(ptep);
> +	}
> +
> +	return 0;
> +}
> +
>  static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
>  					 unsigned long iova, size_t size,
>  					 unsigned long flags,
> @@ -821,7 +838,9 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
>  	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
>  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
>  	struct io_pgtable_walk_data walk_data = {
> -		.dirty = dirty,
> +		.iop = &data->iop,
> +		.data = dirty,
> +		.visit = visit_dirty,
>  		.flags = flags,
>  		.addr = iova,
>  		.end = iova + size,
> @@ -836,7 +855,7 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
>  	if (data->iop.fmt != ARM_64_LPAE_S1)
>  		return -EINVAL;
>  
> -	return __arm_lpae_iopte_walk_dirty(data, &walk_data, ptep, lvl);
> +	return __arm_lpae_iopte_walk(data, &walk_data, ptep, lvl);
>  }
>  
>  static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
> -- 
> 2.47.0
> 

