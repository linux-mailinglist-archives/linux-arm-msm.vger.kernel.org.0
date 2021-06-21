Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E5A3AEF04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 18:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbhFUQf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 12:35:29 -0400
Received: from foss.arm.com ([217.140.110.172]:37164 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232448AbhFUQc4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 12:32:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A1FD1042;
        Mon, 21 Jun 2021 09:30:33 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 901683F694;
        Mon, 21 Jun 2021 09:30:31 -0700 (PDT)
Subject: Re: [PATCHv2 2/3] iommu/io-pgtable: Optimize partial walk flush for
 large scatter-gather list
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Tomasz Figa <tfiga@chromium.org>
References: <cover.1623981933.git.saiprakash.ranjan@codeaurora.org>
 <150fc7ab1c7f9b70a95dae1f4bc3b9018c0f9e04.1623981933.git.saiprakash.ranjan@codeaurora.org>
 <CAD=FV=WA_mBnxv-D3YOYUkDAAcYgktFgnw2zeTkMneqFxBg=yg@mail.gmail.com>
 <716fbc51ec73434e325d84752a471e89@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <291a733f-0693-cc4d-7499-28f619b2027d@arm.com>
Date:   Mon, 21 Jun 2021 17:30:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <716fbc51ec73434e325d84752a471e89@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-21 06:47, Sai Prakash Ranjan wrote:
> Hi,
> 
> On 2021-06-19 03:39, Doug Anderson wrote:
>> Hi,
>>
>> On Thu, Jun 17, 2021 at 7:51 PM Sai Prakash Ranjan
>> <saiprakash.ranjan@codeaurora.org> wrote:
>>>
>>> Currently for iommu_unmap() of large scatter-gather list with page size
>>> elements, the majority of time is spent in flushing of partial walks in
>>> __arm_lpae_unmap() which is a VA based TLB invalidation invalidating
>>> page-by-page on iommus like arm-smmu-v2 (TLBIVA) which do not support
>>> range based invalidations like on arm-smmu-v3.2.
>>>
>>> For example: to unmap a 32MB scatter-gather list with page size elements
>>> (8192 entries), there are 16->2MB buffer unmaps based on the pgsize (2MB
>>> for 4K granule) and each of 2MB will further result in 512 TLBIVAs 
>>> (2MB/4K)
>>> resulting in a total of 8192 TLBIVAs (512*16) for 16->2MB causing a huge
>>> overhead.
>>>
>>> So instead use tlb_flush_all() callback (TLBIALL/TLBIASID) to invalidate
>>> the entire context for partial walk flush on select few platforms where
>>> cost of over-invalidation is less than unmap latency
>>
>> It would probably be worth punching this description up a little bit.
>> Elsewhere you said in more detail why this over-invalidation is less
>> of a big deal for the Qualcomm SMMU. It's probably worth saying
>> something like that here, too. Like this bit paraphrased from your
>> other email:
>>
>> On qcom impl, we have several performance improvements for TLB cache
>> invalidations in HW like wait-for-safe (for realtime clients such as
>> camera and display) and few others to allow for cache lookups/updates
>> when TLBI is in progress for the same context bank.
>>
> 
> Sure will add this info as well in the next version.
> 
>>
>>> using the newly
>>> introduced quirk IO_PGTABLE_QUIRK_TLB_INV_ALL. We also do this for
>>> non-strict mode given its all about over-invalidation saving time on
>>> individual unmaps and non-deterministic generally.
>>
>> As per usual I'm mostly clueless, but I don't quite understand why you
>> want this new behavior for non-strict mode. To me it almost seems like
>> the opposite? Specifically, non-strict mode is already outside the
>> critical path today and so there's no need to optimize it. I'm
>> probably not explaining myself clearly, but I guess i'm thinking:
>>
>> a) today for strict, unmap is in the critical path and it's important
>> to get it out of there. Getting it out of the critical path is so
>> important that we're willing to over-invalidate to speed up the
>> critical path.
>>
>> b) today for non-strict, unmap is not in the critical path.
>>
>> So I would almost expect your patch to _disable_ your new feature for
>> non-strict mappings, not auto-enable your new feature for non-strict
>> mappings.
>>
>> If I'm babbling, feel free to ignore. ;-) Looking back, I guess Robin
>> was the one that suggested the behavior you're implementing, so it's
>> more likely he's right than I am. ;-)
>>
> 
> Thanks for taking a look. Non-strict mode is only for leaf entries and
> dma domains and this optimization is for non-leaf entries and is applicable
> for both, see __arm_lpae_unmap(). In other words, if you have 
> iommu.strict=0
> (non-strict mode) and try unmapping a large sg buffer as the problem 
> described
> in the commit text, you would still go via this path in unmap and see the
> delay without this patch. So what Robin suggested is that, let's do this
> unconditionally for all users with non-strict mode as opposed to only
> restricting it to implementation specific in case of strict mode.

Right, unmapping tables works out as a bit of a compromise for 
non-strict mode - we don't use a freelist to defer the freeing of 
pagetable pages, so we rely on making non-leaf invalidations 
synchronously to knock out walk caches which may be pointing to the page 
beforte we free it. We might actually be able to get away without that 
for non-strict unmaps, since partial walks pointing at freed memory 
probably aren't too much more hazardous than the equivalent leaf TLB 
entries while the IOVA region is held in the flush queue, but it 
certainly does matter for maps when we're knocking out a (presumably 
empty) table entry to put down a new block whose IOVA will be 
immediately live.

Robin.
