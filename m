Return-Path: <linux-arm-msm+bounces-40196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C549E374E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E880D165BF2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC51E1AD3E0;
	Wed,  4 Dec 2024 10:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HUvcwzU+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94361199EA8
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 10:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733307252; cv=none; b=gzw5wOZvGqs2kgyFne8qXar6ippZmX5GY13ayRifsKLS95rywzoVCoH/m/3/1ouMIYGOciZuTTXWJTAoUjG7wEWIBFhMyCWEgSQpiJ2aDHv4250olvD7I/30lHr44mgvsk6GYKg0fPhMMhbV2WvsUYZUdWKpRfI12h+GI0v78+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733307252; c=relaxed/simple;
	bh=Pb5PvvE+iVrNyh93aC+zFTPSNXVqukPP+d4ZZTW9AUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I53dQV8vKj5rIItKFNecfed5rxN1hVcEr0+sPDPVOndyBPC29YLOd0+sLkI9SDVUbQlWbpidKTDZU9xg9qmEmtjdBOJPz0gIzqUjAXA3AZXjOzP0imXOH0oIT6NeaXjhaM2zznGJube9nVwnCg/Nq/xhcl1aZfRvXenQxWEdxMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HUvcwzU+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4349c7b6b0dso35755e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 02:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733307249; x=1733912049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BMGnNPxPYgtjLytE4uW9hhJz+Jg05BhCFp2UIgwDwC0=;
        b=HUvcwzU+W4tL5uguE7WRUAG2CHcVG0D/HDxckCG+ygsQRztMgaNlqKuq7rIx29J0je
         UpnVlI/QX5JF/aO4gUEufwl5n1pi89Dj82wn9M8oSrDFH8g2T8yE9mEMmJoz5L4/Cylh
         LO2Sp+Z2vSvmxThb89ZGkb78n9w8l5PBwZ1A8aO9hxCTYOJgZEUvs22JMMTRPTz0trHk
         V2lFIeZqw/K/FbDcatF60HCotUgAI1gE1iLG+1y9A+IBdGGSghXzHTuW/P0fjOdcaDGn
         nLtANOOtkpLL1VuuC94P10/OyBjE1dWtCzZOhMu1KX/TRFYIc8L4gMpKJuDStRgzGyEO
         Y8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733307249; x=1733912049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMGnNPxPYgtjLytE4uW9hhJz+Jg05BhCFp2UIgwDwC0=;
        b=Vxije5E20t99aTvbKtkDQurAhSzW+kIYnhrxgAYQVnmIoFQ8TDfhP8m2GQjZZu9zmA
         sgfH8UtbdDST08QQeqjqVGgrb86u0k9L8p8mOmFPuflMuf3MALjwVy8UPwfwD6ToUwfJ
         i9Qu2VBxRpuoBCpm5dLtkpPySYSXiEc44ZHjmlnpHhxu4o4xSdjIoFWoc2wMrkfO+/zy
         FYhq70ic+/0tSjSP6YgVZPzQO7f4hzggC6kVjD8DU31fO2910MlbowpPOBHSZXXsSPj+
         AhMM7nhwxIVckTmx5bA1T8bgmeeSDGYE2x2657hiBjhWzRgTTlwzYFY5uXw4eyPA7D4u
         dqNQ==
X-Forwarded-Encrypted: i=1; AJvYcCURf2xukA5rtJ8kafuNAonmtsmcSwVVFTItce5J56LOWUkmDkX/awi2XbGKuhsAKiIwuKccjT8UcjxmIEIT@vger.kernel.org
X-Gm-Message-State: AOJu0YzE+vOWSMG/gYjUEYrwWFcvuBT1se/VYGV61D4ERF+tiuE6rNmI
	FPe5B2kzfP5P+lT9D7akxfHKcp0rjLMyURk144CfVW+ENynY1ZHJuyEoAlWi1g==
X-Gm-Gg: ASbGnct8zd9OdQDTcfY001kOfqOQ43Q8M8lI+EstDaybS9cqe/560nXkugMLSaz78fI
	CeybDdArGIPH22o+0nysHHzlHZbU+2C4/8hSeX/fbgzhGfQTbcpZvVNAwOKLa+0SVXwR3zdIF1r
	eC1rdDSji7dLI8PzwP6WeSAPpbQg+npSxu6RKk+oXQ40s+onlbCvvpMIsevjwxI8GlOEGsQOw++
	e3CV+vTr8rmYlNNbNiKMdobFrslLLoPD02OtA5QdHuv6M0RVs5zPst2Jzu3VHs7tgwud0sVoRBf
	aJRuofKKq7az
X-Google-Smtp-Source: AGHT+IEI5ovyp1RCIv/DEgpLwXFNydHyjD9DBddbq5V/1dJpcQ7kJme1DtYiR17VJHUI0rTtCpgyHQ==
X-Received: by 2002:a7b:ca4d:0:b0:434:9ff3:8ffc with SMTP id 5b1f17b1804b1-434d4aaada7mr918595e9.4.1733307248895;
        Wed, 04 Dec 2024 02:14:08 -0800 (PST)
Received: from google.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e4617a61sm12383645f8f.3.2024.12.04.02.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:14:08 -0800 (PST)
Date: Wed, 4 Dec 2024 10:14:04 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 2/4] iommu/io-pgtable-arm: Re-use the pgtable walk
 for iova_to_phys
Message-ID: <Z1ArbJbqAnD-Qn52@google.com>
References: <20241028213146.238941-1-robdclark@gmail.com>
 <20241028213146.238941-3-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028213146.238941-3-robdclark@gmail.com>

Hi Rob,

On Mon, Oct 28, 2024 at 02:31:38PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Re-use the generic pgtable walk path.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/io-pgtable-arm.c | 74 +++++++++++++++++-----------------
>  1 file changed, 37 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 7e9c0f8ae138..88b128c77893 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -712,42 +712,6 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
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
>  	struct io_pgtable		*iop;
>  	void				*data;
> @@ -763,6 +727,41 @@ static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
>  				 arm_lpae_iopte *ptep,
>  				 int lvl);
>  
> +struct iova_to_phys_data {
> +	arm_lpae_iopte pte;
> +	int lvl;
> +};
> +
> +static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, int lvl,
> +			      arm_lpae_iopte *ptep, size_t size)
> +{
> +	struct iova_to_phys_data *data = walk_data->data;
> +	data->pte = *ptep;
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
> @@ -780,8 +779,9 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
>  		return 0;
>  	}
>  
> -	if (WARN_ON(!iopte_table(pte, lvl)))
> +	if (!iopte_table(pte, lvl)) {
>  		return -EINVAL;
> +	}
>  
>  	ptep = iopte_deref(pte, data);
>  	return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
> -- 
> 2.47.0
> 

