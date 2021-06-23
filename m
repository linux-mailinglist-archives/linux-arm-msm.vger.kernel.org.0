Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1563B1B62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 15:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbhFWNp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 09:45:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:63761 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230061AbhFWNpZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 09:45:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624455788; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wV+nd+kMY0rKltOol5zVxgEq9lFFAYRlvZph3teCol0=;
 b=hYJHJqbMhkb26dYRCBqd8UdPhDFZI2mq9yyUvnwn2Fh+lqWf6rCp0q6+S/lOoVVKAXMRyY4+
 rgJ3bJ74PwS6WXOjbO0J94JpAeb0FdxyVqd1i3qD0HKY47X5L/K0RATg0SeLmZs/OchT6a+5
 NMYk6sAJChfjBVYZOqrjVv5Gia4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60d33a67ec0b18a745f1b036 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Jun 2021 13:43:03
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AE96EC4360C; Wed, 23 Jun 2021 13:43:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 763E6C433F1;
        Wed, 23 Jun 2021 13:43:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 23 Jun 2021 19:13:01 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <treding@nvidia.com>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv2 1/3] iommu/io-pgtable: Add a quirk to use
 tlb_flush_all() for partial walk flush
In-Reply-To: <015e1274-d28e-f5e3-7f96-b79cf3d56a8e@arm.com>
References: <cover.1623981933.git.saiprakash.ranjan@codeaurora.org>
 <b099af10926b34249f4a30262db37f50491bebe7.1623981933.git.saiprakash.ranjan@codeaurora.org>
 <904f283c-f8b1-ba84-d010-eacc87bb53c5@arm.com>
 <a110e58e36af207be2bed04d1331832a@codeaurora.org>
 <2b093b93-7fab-be35-59d8-4463c199719a@arm.com>
 <c0329da89bee9b51b88d907875608877@codeaurora.org>
 <015e1274-d28e-f5e3-7f96-b79cf3d56a8e@arm.com>
Message-ID: <7f2d853b9d6cf5b4781810ce86dc8ceb@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On 2021-06-23 00:07, Robin Murphy wrote:
> On 2021-06-22 15:27, Sai Prakash Ranjan wrote:
>> Hi Robin,
>> 
>> On 2021-06-22 17:41, Robin Murphy wrote:
>>> On 2021-06-22 08:11, Sai Prakash Ranjan wrote:
>>>> Hi Robin,
>>>> 
>>>> On 2021-06-21 21:15, Robin Murphy wrote:
>>>>> On 2021-06-18 03:51, Sai Prakash Ranjan wrote:
>>>>>> Add a quirk IO_PGTABLE_QUIRK_TLB_INV_ALL to invalidate entire 
>>>>>> context
>>>>>> with tlb_flush_all() callback in partial walk flush to improve 
>>>>>> unmap
>>>>>> performance on select few platforms where the cost of 
>>>>>> over-invalidation
>>>>>> is less than the unmap latency.
>>>>> 
>>>>> I still think this doesn't belong anywhere near io-pgtable at all.
>>>>> It's a driver-internal decision how exactly it implements a 
>>>>> non-leaf
>>>>> invalidation, and that may be more complex than a predetermined
>>>>> boolean decision. For example, I've just realised for SMMUv3 we 
>>>>> can't
>>>>> invalidate multiple levels of table at once with a range command,
>>>>> since if we assume the whole thing is mapped at worst-case page
>>>>> granularity we may fail to invalidate any parts which are mapped as
>>>>> intermediate-level blocks. If invalidating a 1GB region (with 4KB
>>>>> granule) means having to fall back to 256K non-range commands, we 
>>>>> may
>>>>> not want to invalidate by VA then, even though doing so for a 2MB
>>>>> region is still optimal.
>>>>> 
>>>>> It's also quite feasible that drivers might want to do this for 
>>>>> leaf
>>>>> invalidations too - if you don't like issuing 512 commands to
>>>>> invalidate 2MB, do you like issuing 511 commands to invalidate 
>>>>> 2044KB?
>>>>> - and at that point the logic really has to be in the driver 
>>>>> anyway.
>>>>> 
>>>> 
>>>> Ok I will move this to tlb_flush_walk() functions in the drivers. In 
>>>> the previous
>>>> v1 thread, you suggested to make the choice in 
>>>> iommu_get_dma_strict() test,
>>>> I assume you meant the test in iommu_dma_init_domain() with a flag 
>>>> or was it
>>>> the leaf driver(ex:arm-smmu.c) test of iommu_get_dma_strict() in 
>>>> init_domain?
>>> 
>>> Yes, I meant literally inside the same condition where we currently
>>> set "pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;" in
>>> arm_smmu_init_domain_context().
>>> 
>> 
>> Ok got it, thanks.
>> 
>>>> I am still a bit confused on where this flag would be? Should this 
>>>> be a part
>>>> of struct iommu_domain?
>>> 
>>> Well, if you were to rewrite the config with an alternative set of
>>> flush_ops at that point it would be implicit. For a flag, probably
>>> either in arm_smmu_domain or arm_smmu_impl. Maybe a flag would be 
>>> less
>>> useful than generalising straight to a "maximum number of by-VA
>>> invalidations it's worth sending individually" threshold value?
>> 
>> But then we would still need some flag to make this implementation
>> specific (qcom specific for now) and this threshold would just be
>> another condition although it would have been useful if this was
>> generic enough.
> 
> Well, for that approach I assume we could do something like
> special-case 0, or if it's a mutable per-domain value maybe just
> initialise it to SIZE_MAX or whatever such that it would never be
> reached in practice. Whichever way, it was meant to be implied that
> anything at the domain level would still be subject to final
> adjustment by the init_context hook.
> 

Ok that should work, so I went ahead with another set of flush_ops
and posted out v3.

Thanks,
Sai

> 
>>> It's clear to me what overall shape and separation of responsibility 
>>> is
>>> most logical, but beyond that I don't have a particularly strong
>>> opinion on the exact implementation; I've just been chucking ideas
>>> around :)
>>> 
>> 
>> Your ideas are very informative and useful :)
>> 
>> Thanks,
>> Sai
>> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
