Return-Path: <linux-arm-msm+bounces-30988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F9B96DF98
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 18:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 375001C20E1D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157D41A00EC;
	Thu,  5 Sep 2024 16:27:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8952A19E96D;
	Thu,  5 Sep 2024 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725553662; cv=none; b=Z0EgjTmPomVufOO9+6lmoVhpI/R0SGmUs9jzUxyzTUgCXLgb82nYcw0COxz1eH0ucahKaabQKGXXObnTeFix/vULbytSTgatzvZQ66La/GC/fTYjdL9ezRLCJTI2KIVCDW2AXuiVY/PGvbmx+Ge2Q5KUNg+PHnIMQBz51QlSaAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725553662; c=relaxed/simple;
	bh=81fAHoIzFt6ZxG85spJwq3b7CR/qS9ElMhacK1ReKZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qDqMwqeEFYTz7V6pmkO1BPzOok/JpFMOl92H/NKWMkl7xrrCWcnpiUrJYRvwopvQ9+J4pLiu+XNgrzguDcpTLBSNbIfHgV+98sX97sWJsDwScF0rCPXfs/OPkfBrNB1rUb34HrmyLNQtRsLdnsmz0zZXsbNvqyvlsOQMOV2aYSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F38CFEC;
	Thu,  5 Sep 2024 09:28:06 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 836863F73B;
	Thu,  5 Sep 2024 09:27:32 -0700 (PDT)
Message-ID: <53f13813-a515-475a-836d-0b6017a117eb@arm.com>
Date: Thu, 5 Sep 2024 17:27:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent
 unmap"
To: Will Deacon <will@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Ashish Mhetre <amhetre@nvidia.com>,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240905124956.84932-1-robdclark@gmail.com>
 <20240905155330.GA15246@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240905155330.GA15246@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2024 4:53 pm, Will Deacon wrote:
> Hi Rob,
> 
> On Thu, Sep 05, 2024 at 05:49:56AM -0700, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
>>
>> It was causing gpu smmu faults on x1e80100.
>>
>> I _think_ what is causing this is the change in ordering of
>> __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
>> memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
>> this patch is supposed to work correctly in the face of other
>> concurrent translations (to buffers unrelated to the one being
>> unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
>> stale data read back into the tlb.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>   drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++-----------------
>>   1 file changed, 14 insertions(+), 17 deletions(-)
> 
> Please can you try the diff below, instead?

Given that the GPU driver's .tlb_add_page is a no-op, I can't see this 
making a difference. In fact, given that msm_iommu_pagetable_unmap() 
still does a brute-force iommu_flush_iotlb_all() after io-pgtable 
returns, and in fact only recently made .tlb_flush_walk start doing 
anything either for the sake of the map path, I'm now really wondering 
how this patch has had any effect at all... :/

> 
> Will
> 
> --->8
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 0e67f1721a3d..0a32e9499e2c 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -672,7 +672,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>                  /* Clear the remaining entries */
>                  __arm_lpae_clear_pte(ptep, &iop->cfg, i);
>   
> -               if (gather && !iommu_iotlb_gather_queued(gather))
> +               if (!iommu_iotlb_gather_queued(gather))

Note that this would reintroduce the latent issue which was present 
originally, wherein iommu_iotlb_gather_queued(NULL) is false, but if we 
actually allow a NULL gather to be passed to io_pgtable_tlb_add_page() 
it may end up being dereferenced (e.g. in arm-smmu-v3).

Thanks,
Robin.

>                          for (int j = 0; j < i; j++)
>                                  io_pgtable_tlb_add_page(iop, gather, iova + j * size, size);
>   

