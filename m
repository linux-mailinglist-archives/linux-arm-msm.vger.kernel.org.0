Return-Path: <linux-arm-msm+bounces-31139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D0C96F820
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 17:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F54C2867C8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 15:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACA71D2F48;
	Fri,  6 Sep 2024 15:25:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9415A1D0DCB;
	Fri,  6 Sep 2024 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725636326; cv=none; b=DhX/bAgf/QaamTk0WWgKT/xuJXvA+Y24NkOv5XMRlCtHA4+hr7TZd8+ym0U9eZsdmdCby9XKT0IAvjvUIYjphhc16kva5qB8ae8Uabtel6NMm5isOwUBN1UqYdFBFR2DYa+WWD1NkXzLvkPMgoVs48brvfmFv6Uk9tBG5TY0Nek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725636326; c=relaxed/simple;
	bh=NljnRnbutnsxF1J9z4hLJYKWZghTvG8RmywBz2ykkPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/u7LWWCGc3xZsiX1UAoq8SWH97j4Bil5N+iz+eNoM4Akbm5uXPiWqB3jFXiIB5HPcDgNZ6iFfsn3V0EgoY+PfPkmH+upJf/0P1PoiSz7R6gPNoOrvypXIEZ3v7uNV/vKSfy0vqCiUmONnvNR3/GpmYfzDVIKhUTCfkhdcnVIg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA5FEFEC;
	Fri,  6 Sep 2024 08:25:49 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFFDF3F73F;
	Fri,  6 Sep 2024 08:25:20 -0700 (PDT)
Message-ID: <8e17f1ac-0178-454b-b9dc-bb14ad6c465b@arm.com>
Date: Fri, 6 Sep 2024 16:25:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent
 unmap"
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Ashish Mhetre <amhetre@nvidia.com>, Rob Clark <robdclark@chromium.org>,
 Joerg Roedel <joro@8bytes.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240905124956.84932-1-robdclark@gmail.com>
 <20240905155330.GA15246@willie-the-truck>
 <53f13813-a515-475a-836d-0b6017a117eb@arm.com>
 <20240906105656.GA16124@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240906105656.GA16124@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2024 11:56 am, Will Deacon wrote:
> On Thu, Sep 05, 2024 at 05:27:28PM +0100, Robin Murphy wrote:
>> On 05/09/2024 4:53 pm, Will Deacon wrote:
>>> On Thu, Sep 05, 2024 at 05:49:56AM -0700, Rob Clark wrote:
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
>>>>
>>>> It was causing gpu smmu faults on x1e80100.
>>>>
>>>> I _think_ what is causing this is the change in ordering of
>>>> __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
>>>> memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
>>>> this patch is supposed to work correctly in the face of other
>>>> concurrent translations (to buffers unrelated to the one being
>>>> unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
>>>> stale data read back into the tlb.
>>>>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> ---
>>>>    drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++-----------------
>>>>    1 file changed, 14 insertions(+), 17 deletions(-)
>>>
>>> Please can you try the diff below, instead?
>>
>> Given that the GPU driver's .tlb_add_page is a no-op, I can't see this
>> making a difference. In fact, given that msm_iommu_pagetable_unmap() still
>> does a brute-force iommu_flush_iotlb_all() after io-pgtable returns, and in
>> fact only recently made .tlb_flush_walk start doing anything either for the
>> sake of the map path, I'm now really wondering how this patch has had any
>> effect at all... :/
> 
> Hmm, yup. Looks like Rob has come back to say the problem lies elsewhere
> anyway.
> 
> One thing below though...
> 
>>>
>>> Will
>>>
>>> --->8
>>>
>>> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
>>> index 0e67f1721a3d..0a32e9499e2c 100644
>>> --- a/drivers/iommu/io-pgtable-arm.c
>>> +++ b/drivers/iommu/io-pgtable-arm.c
>>> @@ -672,7 +672,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>>                   /* Clear the remaining entries */
>>>                   __arm_lpae_clear_pte(ptep, &iop->cfg, i);
>>> -               if (gather && !iommu_iotlb_gather_queued(gather))
>>> +               if (!iommu_iotlb_gather_queued(gather))
>>
>> Note that this would reintroduce the latent issue which was present
>> originally, wherein iommu_iotlb_gather_queued(NULL) is false, but if we
>> actually allow a NULL gather to be passed to io_pgtable_tlb_add_page() it
>> may end up being dereferenced (e.g. in arm-smmu-v3).
> 
> I think there is still something to fix here. arm_lpae_init_pte() can
> pass a NULL gather to __arm_lpae_unmap() and I don't think skipping the
> invalidation is correct in that case. Either the drivers need to handle
> that or we shouldn't be passing NULL.
> 
> What do you think?

The subtlety there is that in that case it's always a non-leaf PTE, so 
all that goes back to the driver is io_pgtable_tlb_flush_walk() and the 
gather is never used.

Thanks,
Robin.

