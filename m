Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 585799064C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2019 18:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbfHPQ61 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Aug 2019 12:58:27 -0400
Received: from foss.arm.com ([217.140.110.172]:59112 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbfHPQ61 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Aug 2019 12:58:27 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBC6628;
        Fri, 16 Aug 2019 09:58:26 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 793BF3F694;
        Fri, 16 Aug 2019 09:58:25 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH v3 0/2] iommu/arm-smmu: Split pagetable
 support
To:     freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
        Will Deacon <will@kernel.org>, jean-philippe.brucker@arm.com,
        linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-arm-kernel@lists.infradead.org
References: <1565216500-28506-1-git-send-email-jcrouse@codeaurora.org>
 <20190815153304.GD28465@jcrouse1-lnx.qualcomm.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <ac248f33-2528-c1d4-17ed-17e92e6ed5ad@arm.com>
Date:   Fri, 16 Aug 2019 17:58:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190815153304.GD28465@jcrouse1-lnx.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jordan,

On 15/08/2019 16:33, Jordan Crouse wrote:
> On Wed, Aug 07, 2019 at 04:21:38PM -0600, Jordan Crouse wrote:
>> (Sigh, resend. I freaked out my SMTP server)
>>
>> This is part of an ongoing evolution for enabling split pagetable support for
>> arm-smmu. Previous versions can be found [1].
>>
>> In the discussion for v2 Robin pointed out that this is a very Adreno specific
>> use case and that is exactly true. Not only do we want to configure and use a
>> pagetable in the TTBR1 space, we also want to configure the TTBR0 region but
>> not allocate a pagetable for it or touch it until the GPU hardware does so. As
>> much as I want it to be a generic concept it really isn't.
>>
>> This revision leans into that idea. Most of the same io-pgtable code is there
>> but now it is wrapped as an Adreno GPU specific format that is selected by the
>> compatible string in the arm-smmu device.
>>
>> Additionally, per Robin's suggestion we are skipping creating a TTBR0 pagetable
>> to save on wasted memory.
>>
>> This isn't as clean as I would like it to be but I think that this is a better
>> direction than trying to pretend that the generic format would work.
>>
>> I'm tempting fate by posting this and then taking some time off, but I wanted
>> to try to kick off a conversation or at least get some flames so I can try to
>> refine this again next week. Please take a look and give some advice on the
>> direction.
> 
> Will, Robin -
> 
> Modulo the impl changes from Robin, do you think that using a dedicated
> pagetable format is the right approach for supporting split pagetables for the
> Adreno GPU?

How many different Adreno drivers would benefit from sharing it?

The more I come back to this, the more I'm convinced that io-pgtable 
should focus on the heavy lifting of pagetable management - the code 
that nobody wants to have to write at all, let alone more than once - 
and any subtleties which aren't essential to that should be pushed back 
into whichever callers actually care. Consider that already, literally 
no caller actually uses an unmodified stage 1 TCR value as provided in 
the io_pgtable_cfg.

I feel it would be most productive to elaborate further in the form of 
patches, so let me get right on that and try to bash something out 
before I go home tonight...

Robin.

> If so, then is adding the changes to io-pgtable-arm.c possible for 5.4 and then
> add the implementation specific code on top of Robin's stack later or do you
> feel they should come as part of a package deal?
> 
> Jordan
> 
>> Jordan Crouse (2):
>>    iommu/io-pgtable-arm: Add support for ARM_ADRENO_GPU_LPAE io-pgtable
>>      format
>>    iommu/arm-smmu: Add support for Adreno GPU pagetable formats
>>
>>   drivers/iommu/arm-smmu.c       |   8 +-
>>   drivers/iommu/io-pgtable-arm.c | 214 ++++++++++++++++++++++++++++++++++++++---
>>   drivers/iommu/io-pgtable.c     |   1 +
>>   include/linux/io-pgtable.h     |   2 +
>>   4 files changed, 209 insertions(+), 16 deletions(-)
>>
>> -- 
>> 2.7.4
>>
>> _______________________________________________
>> Freedreno mailing list
>> Freedreno@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/freedreno
> 
