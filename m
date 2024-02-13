Return-Path: <linux-arm-msm+bounces-10880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EBB85304C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 13:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4084F1F299E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 12:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1BA3A1B5;
	Tue, 13 Feb 2024 12:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="L2cTcTUN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0903A1CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707826383; cv=none; b=iyHfE0F44hLlji+/j02xuzVvGA8cAT3+/lnFkzLYpY8sKi06Dzp8xY1EjxcvP2hTZ+BldrArhjjjS49n0XFSR7UOWHr0bEFQs8AWby9gXzC026BeUiQ4lihan8xXuQPKKv32dZBD4caG6e/O9E9DTV+dzfmk2pixhWj7ilQKB0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707826383; c=relaxed/simple;
	bh=+bZnJcvLbBr67dRtqXosVQCfwvQmnNsE9e8Q61aZkME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ua+c/GKnk2FXg9hw0h0VHaTscUtVtrk+pTLxotSyNWthzGDTxEWrnTyBwynj07/Tli0qAGHJpNrJmzc/iS7EuWhOeXFNZECRS8wxX4Y5YTDx2XT0XmQapkQ1tVTZF7rtBgFcXlV03j53tiim3RKhnY/NFrES9IXnPKObmXwNVm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=L2cTcTUN; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-21922481a2fso3072509fac.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 04:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1707826379; x=1708431179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lh2S53PNrVSpQ9ctYNwyUkzWXBkJcw0etvJ1hxA115I=;
        b=L2cTcTUNHgwVeqKeOt8+GBCxLVFQszzjVX1XGoBltnfbDFsFvUmwjjNrbDjKYhUkGd
         aYaZiklSMXJTkubtx1zwHx9psxkRJkiDrVOTvrXV5/WrFRC5G7ylpULs2PiPXKABvEM2
         LE2TpTHfDHz8zoGd4xmnDgTJysZSeRPD11tDYZU7u91W7WI6IjxHiC91MTiQy9nAga1M
         NwHJ5ncNQYyCf9en5jXjY/xRBafxXyv0jhtyhOF70GaKf64msAYsUOhTwwBmYJxRbcYv
         1D+gSUXmgeavQgYfIDYvgD15F9lRcrtCJ3EdVUe5P7dmJFaaXH+JomNsWo3CsMPFNCPn
         TCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707826379; x=1708431179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lh2S53PNrVSpQ9ctYNwyUkzWXBkJcw0etvJ1hxA115I=;
        b=M1YHmJhj8hFsVwt9DVcBX9+GFvRbi7Xqpcmsjcfkfx01jhGIthpIl5nB49VzN1iAEQ
         bMKUkM4xDdf4JhwKQbIosv9p0WLiaOaUPHU57/RwwtiprT5LcDSNmijM9JsVzn29NBaA
         9lRaZU/4y1Z6mHvokWjGG8yl8wH27pfJoc/xAvXyc65lLuvNocfCJMHCdzyVrWwrhIdj
         QzMTlR2YAyzgPFTHT/635XRdluZXjXuJ1k6vvY3142rTAPctdV7athyV/kszf+AaeocY
         rT6n5xKMgfHbUVJe6JhU6AUavMVweOXDDFIcr5YsHbVHjFQ4iOou1f6DWxsR0PdIj0Bz
         pj5A==
X-Forwarded-Encrypted: i=1; AJvYcCVKua9N09ZKaTX2u6vW6c+7eqoM/pgT3IdpyDMC2+qJ/AmWPHgEVOx0Cfc9TF3KTeqjZlno9dct6nn2t7FSzt0yUQos7It8xBP7Vn/13Q==
X-Gm-Message-State: AOJu0Yzhc6pR3htbE6XeQkzfyR1+hQGvwp+icPqktsByfqAkBU7ZguYZ
	0A0bOGT3myJAdoIMnR2ozIC7cczqwAKSEsUPVB3YgYmpq2DI71b9i0Yqs1b9nOQ=
X-Google-Smtp-Source: AGHT+IF2S9NvcWTIHZLBSkIb+Q4dx69PQhLwBzE8c7PMO/UI2iadkvy+/2caCK/VF1CqKs//+EdA9Q==
X-Received: by 2002:a05:6870:c08e:b0:21d:d9b:c3fd with SMTP id c14-20020a056870c08e00b0021d0d9bc3fdmr139240oad.55.1707826379654;
        Tue, 13 Feb 2024 04:12:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2Ro/6j76H4+eYPLEB5BTAvd5rTrW/8UhzECCu6fwZzxbdzMM0SdAuI9ybj/E0Ugy+RxmKQivEi89dwRYWHXUIov3z8oBQvUatKs1hPmwzqhXOKVMnf0YuRjqnAJla4DB7u9rv5wn3+HrOYc3ZlQhF9e3PBvPk8irT7HZRtTTMkcJmdsbJZz6PjYRMBYW3FTjQxp3zfWwwCDMW3DgZtW7PyPHfBGvfntvE3sFPdLhIwMZq7CwPMkMw+92tC7iX46F53xxoCrI=
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id p9-20020a0568301d4900b006e2df9470d4sm435849oth.80.2024.02.13.04.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 04:12:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rZrej-0040Cc-KN;
	Tue, 13 Feb 2024 08:12:57 -0400
Date: Tue, 13 Feb 2024 08:12:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Revert "iommu/arm-smmu: Convert to domain_alloc_paging()"
Message-ID: <20240213121257.GI765010@ziepe.ca>
References: <20240213-iommu-revert-domain-alloc-v1-1-325ff55dece4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213-iommu-revert-domain-alloc-v1-1-325ff55dece4@linaro.org>

On Tue, Feb 13, 2024 at 01:31:56PM +0200, Dmitry Baryshkov wrote:
> This reverts commit 9b3febc3a3da ("iommu/arm-smmu: Convert to
> domain_alloc_paging()"). It breaks Qualcomm MSM8996 platform. Calling
> arm_smmu_write_context_bank() from new codepath results in the platform
> being reset because of the unclocked hardware access.
> 
> Fixes: 9b3febc3a3da ("iommu/arm-smmu: Convert to domain_alloc_paging()")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)

Please no, as I said in the other email the only thing that should be
reverted is this:

> @@ -875,15 +879,6 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
>  	mutex_init(&smmu_domain->init_mutex);
>  	spin_lock_init(&smmu_domain->cb_lock);
>  
> -	if (dev) {
> -		struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
> -
> -		if (arm_smmu_init_domain_context(smmu_domain, cfg->smmu, dev)) {
> -			kfree(smmu_domain);
> -			return NULL;
> -		}
> -	}
> -
>  	return &smmu_domain->domain;
>  }

Everything else is fine, you already tested with that arrangement.

Jason

