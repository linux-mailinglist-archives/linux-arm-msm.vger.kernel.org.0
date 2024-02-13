Return-Path: <linux-arm-msm+bounces-10876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BC3852FA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 12:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 083BE1F24E7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 11:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851B6376FB;
	Tue, 13 Feb 2024 11:38:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C884C376F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 11:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707824291; cv=none; b=m+GYVnMHiImDzB4yFWkDuRiYEdBZIpgOv+ILS3jcu+7K9NQEW2S6JqmkCM5DxK4cEDubHOe8DgpG0voOifegEq2YMFp57T0OFlm3X8zKlnd1zAy7xZ8R6AEanD1AdV+Y57syjxYoE8rh2lqOVpvBndbEHX+b/HmYbcsbghh3WwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707824291; c=relaxed/simple;
	bh=0xhQ5imjyroJnZ2WvTMgqWRCONVg/qtTrWTIMVL9xpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgXWMmJLnJzEaccnloNznjKIAALkAXOxKOHte/1QslhvCosiu5QHU/7QiMijhH2BLAX9LUb680F74l9RF8Dk7AOthqhum2388KPJ28c8LzXA4YWM3n/9MlMLfgc7FNi3roa6WWvlwKh1HIMZpaYCRgM4l9Nta9JKPeghs1gJ2HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90BF2DA7;
	Tue, 13 Feb 2024 03:38:50 -0800 (PST)
Received: from [10.57.49.48] (unknown [10.57.49.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28DCF3F5A1;
	Tue, 13 Feb 2024 03:38:07 -0800 (PST)
Message-ID: <02a590bd-6379-455a-8184-d631ae88e63a@arm.com>
Date: Tue, 13 Feb 2024 11:38:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "iommu/arm-smmu: Convert to domain_alloc_paging()"
Content-Language: en-GB
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org
References: <20240213-iommu-revert-domain-alloc-v1-1-325ff55dece4@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20240213-iommu-revert-domain-alloc-v1-1-325ff55dece4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-13 11:31 am, Dmitry Baryshkov wrote:
> This reverts commit 9b3febc3a3da ("iommu/arm-smmu: Convert to
> domain_alloc_paging()"). It breaks Qualcomm MSM8996 platform. Calling
> arm_smmu_write_context_bank() from new codepath results in the platform
> being reset because of the unclocked hardware access.

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Fixes: 9b3febc3a3da ("iommu/arm-smmu: Convert to domain_alloc_paging()")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 17 ++++++-----------
>   1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 68b6bc5e7c71..6317aaf7b3ab 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -859,10 +859,14 @@ static void arm_smmu_destroy_domain_context(struct arm_smmu_domain *smmu_domain)
>   	arm_smmu_rpm_put(smmu);
>   }
>   
> -static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
> +static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
>   {
>   	struct arm_smmu_domain *smmu_domain;
>   
> +	if (type != IOMMU_DOMAIN_UNMANAGED) {
> +		if (using_legacy_binding || type != IOMMU_DOMAIN_DMA)
> +			return NULL;
> +	}
>   	/*
>   	 * Allocate the domain and initialise some of its data structures.
>   	 * We can't really do anything meaningful until we've added a
> @@ -875,15 +879,6 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
>   	mutex_init(&smmu_domain->init_mutex);
>   	spin_lock_init(&smmu_domain->cb_lock);
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
>   	return &smmu_domain->domain;
>   }
>   
> @@ -1600,7 +1595,7 @@ static struct iommu_ops arm_smmu_ops = {
>   	.identity_domain	= &arm_smmu_identity_domain,
>   	.blocked_domain		= &arm_smmu_blocked_domain,
>   	.capable		= arm_smmu_capable,
> -	.domain_alloc_paging	= arm_smmu_domain_alloc_paging,
> +	.domain_alloc		= arm_smmu_domain_alloc,
>   	.probe_device		= arm_smmu_probe_device,
>   	.release_device		= arm_smmu_release_device,
>   	.probe_finalize		= arm_smmu_probe_finalize,
> 
> ---
> base-commit: 46d4e2eb58e14c8935fa0e27d16d4c62ef82849a
> change-id: 20240213-iommu-revert-domain-alloc-fa729e537df5
> 
> Best regards,

