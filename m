Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE0DB3A8172
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 15:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhFONz4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 09:55:56 -0400
Received: from foss.arm.com ([217.140.110.172]:36164 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229937AbhFONz4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 09:55:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DECF312FC;
        Tue, 15 Jun 2021 06:53:51 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A01003F719;
        Tue, 15 Jun 2021 06:53:50 -0700 (PDT)
Subject: Re: [PATCH] iommu/io-pgtable-arm: Optimize partial walk flush for
 large scatter-gather list
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Krishna Reddy <vdumpa@nvidia.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Thierry Reding <treding@nvidia.com>
References: <20210609145315.25750-1-saiprakash.ranjan@codeaurora.org>
 <dbcd394a-4d85-316c-5dd0-033546a66132@arm.com>
 <c600e9b2534d54082a5272b508a7985f@codeaurora.org>
 <35bfd245-45e2-8083-b620-330d6dbd7bd7@arm.com>
 <12067ffb8243b220cf03e83aaac3e823@codeaurora.org>
 <266f190e-99ae-9175-cf13-7a77730af389@arm.com>
 <dfdabcdec99a4c6e3bf2b3c5eebe067f@codeaurora.org>
 <61c69d23-324a-85d7-2458-dfff8df9280b@arm.com>
 <BY5PR12MB37646698F37C00381EFF7C77B3349@BY5PR12MB3764.namprd12.prod.outlook.com>
 <07001b4ed6c0a491eacce6e4dc13ab5e@codeaurora.org>
 <BY5PR12MB376480219C42E5FCE0FE0FFBB3349@BY5PR12MB3764.namprd12.prod.outlook.com>
 <f749ba0957b516ab5f0ea57033d308c7@codeaurora.org>
 <BY5PR12MB376433B3FD0A59EF57C4522DB3319@BY5PR12MB3764.namprd12.prod.outlook.com>
 <5eb5146ab51a8fe0b558680d479a26cd@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <da62ff1c-9b49-34d3-69a1-1a674e4a30f7@arm.com>
Date:   Tue, 15 Jun 2021 14:53:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5eb5146ab51a8fe0b558680d479a26cd@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-15 12:51, Sai Prakash Ranjan wrote:
> Hi Krishna,
> 
> On 2021-06-14 23:18, Krishna Reddy wrote:
>>> Right but we won't know until we profile the specific usecases or try 
>>> them in
>>> generic workload to see if they affect the performance. Sure, over 
>>> invalidation is
>>> a concern where multiple buffers can be mapped to same context and 
>>> the cache
>>> is not usable at the time for lookup and such but we don't do it for 
>>> small buffers
>>> and only for large buffers which means thousands of TLB entry 
>>> mappings in
>>> which case TLBIASID is preferred (note: I mentioned the HW team
>>> recommendation to use it for anything greater than 128 TLB entries) 
>>> in my
>>> earlier reply. And also note that we do this only for partial walk 
>>> flush, we are not
>>> arbitrarily changing all the TLBIs to ASID based.
>>
>> Most of the heavy bw use cases does involve processing larger buffers.
>> When the physical memory is allocated dis-contiguously at page_size
>> (let's use 4KB here)
>> granularity, each aligned 2MB chunks IOVA unmap would involve
>> performing a TLBIASID
>> as 2MB is not a leaf. Essentially, It happens all the time during
>> large buffer unmaps and
>> potentially impact active traffic on other large buffers. Depending on 
>> how much
>> latency HW engines can absorb, the overflow/underflow issues for ISO
>> engines can be
>> sporadic and vendor specific.
>> Performing TLBIASID as default for all SoCs is not a safe operation.
>>
> 
> Ok so from what I gather from this is that its not easy to test for the
> negative impact and you don't have data on such yet and the behaviour is
> very vendor specific. To add on qcom impl, we have several performance
> improvements for TLB cache invalidations in HW like wait-for-safe(for 
> realtime
> clients such as camera and display) and few others to allow for cache
> lookups/updates when TLBI is in progress for the same context bank, so 
> atleast
> we are good here.
> 
>>
>>> I am no camera expert but from what the camera team mentioned is that 
>>> there
>>> is a thread which frees memory(large unused memory buffers) 
>>> periodically which
>>> ends up taking around 100+ms and causing some camera test failures with
>>> frame drops. Parallel efforts are already being made to optimize this 
>>> usage of
>>> thread but as I mentioned previously, this is *not a camera 
>>> specific*, lets say
>>> someone else invokes such large unmaps, it's going to face the same 
>>> issue.
>>
>> From the above, It doesn't look like the root cause of frame drops is
>> fully understood.
>> Why is 100+ms delay causing camera frame drop?  Is the same thread
>> submitting the buffers
>> to camera after unmap is complete? If not, how is the unmap latency
>> causing issue here?
>>
> 
> Ok since you are interested in camera usecase, I have requested for more 
> details
> from the camera team and will give it once they comeback. However I 
> don't think
> its good to have unmap latency at all and that is being addressed by 
> this patch.
> 
>>
>>> > If unmap is queued and performed on a back ground thread, would it
>>> > resolve the frame drops?
>>>
>>> Not sure I understand what you mean by queuing on background thread 
>>> but with
>>> that or not, we still do the same number of TLBIs and hop through
>>> iommu->io-pgtable->arm-smmu to perform the the unmap, so how will that
>>> help?
>>
>> I mean adding the unmap requests into a queue and processing them from
>> a different thread.
>> It is not to reduce the TLBIs. But, not to block subsequent buffer
>> allocation, IOVA map requests, if they
>> are being requested from same thread that is performing unmap. If
>> unmap is already performed from
>> a different thread, then the issue still need to be root caused to
>> understand it fully. Check for any
>> serialization issues.
>>
> 
> This patch is to optimize unmap latency because of large number of mmio 
> writes(TLBIVAs)
> wasting CPU cycles and not to fix camera issue which can probably be 
> solved by
> parallelization. It seems to me like you are ok with the unmap latency 
> in general
> which we are not and want to avoid that latency.
> 
> Hi @Robin, from these discussions it seems they are not ok with the change
> for all SoC vendor implementations and do not have any data on such impact.
> As I mentioned above, on QCOM platforms we do have several optimizations 
> in HW
> for TLBIs and would like to make use of it and reduce the unmap latency.
> What do you think, should this be made implementation specific?

Yes, it sounds like there's enough uncertainty for now that this needs 
to be an opt-in feature. However, I still think that non-strict mode 
could use it generically, since that's all about over-invalidating to 
save time on individual unmaps - and relatively non-deterministic - already.

So maybe we have a second set of iommu_flush_ops, or just a flag 
somewhere to control the tlb_flush_walk functions internally, and the 
choice can be made in the iommu_get_dma_strict() test, but also forced 
on all the time by your init_context hook. What do you reckon?

Robin.
