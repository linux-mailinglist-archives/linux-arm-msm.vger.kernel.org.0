Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36443A2857
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 11:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhFJJia (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 05:38:30 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46617 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230151AbhFJJia (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 05:38:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623317794; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3Nr5XeD9lkZbSovGodMNy9bg536mnJtqaK+uPHyUp30=;
 b=ZyoFiQMJsttLWS34+mLJmZYw+DGLEBRTmrqW+I+v0X62EFsrgfysmqUdPVXKrDtjEsNIgeT0
 32aEq6LtE2uv/6hQFav1aMSx207zdNJ5vnNL+Mma0c4H6BxcfBNeSjndm8qf2uRrzz2jq4YJ
 r500srgE7nce3zFFzEJdoTcN8/M=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60c1dd1be27c0cc77f04814f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 10 Jun 2021 09:36:27
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 532DAC433D3; Thu, 10 Jun 2021 09:36:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E64D4C433F1;
        Thu, 10 Jun 2021 09:36:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 10 Jun 2021 15:06:23 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu/io-pgtable-arm: Optimize partial walk flush for
 large scatter-gather list
In-Reply-To: <35bfd245-45e2-8083-b620-330d6dbd7bd7@arm.com>
References: <20210609145315.25750-1-saiprakash.ranjan@codeaurora.org>
 <dbcd394a-4d85-316c-5dd0-033546a66132@arm.com>
 <c600e9b2534d54082a5272b508a7985f@codeaurora.org>
 <35bfd245-45e2-8083-b620-330d6dbd7bd7@arm.com>
Message-ID: <12067ffb8243b220cf03e83aaac3e823@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On 2021-06-10 14:38, Robin Murphy wrote:
> On 2021-06-10 06:24, Sai Prakash Ranjan wrote:
>> Hi Robin,
>> 
>> On 2021-06-10 00:14, Robin Murphy wrote:
>>> On 2021-06-09 15:53, Sai Prakash Ranjan wrote:
>>>> Currently for iommu_unmap() of large scatter-gather list with page 
>>>> size
>>>> elements, the majority of time is spent in flushing of partial walks 
>>>> in
>>>> __arm_lpae_unmap() which is a VA based TLB invalidation (TLBIVA for
>>>> arm-smmu).
>>>> 
>>>> For example: to unmap a 32MB scatter-gather list with page size 
>>>> elements
>>>> (8192 entries), there are 16->2MB buffer unmaps based on the pgsize 
>>>> (2MB
>>>> for 4K granule) and each of 2MB will further result in 512 TLBIVAs 
>>>> (2MB/4K)
>>>> resulting in a total of 8192 TLBIVAs (512*16) for 16->2MB causing a 
>>>> huge
>>>> overhead.
>>>> 
>>>> So instead use io_pgtable_tlb_flush_all() to invalidate the entire 
>>>> context
>>>> if size (pgsize) is greater than the granule size (4K, 16K, 64K). 
>>>> For this
>>>> example of 32MB scatter-gather list unmap, this results in just 16 
>>>> ASID
>>>> based TLB invalidations or tlb_flush_all() callback (TLBIASID in 
>>>> case of
>>>> arm-smmu) as opposed to 8192 TLBIVAs thereby increasing the 
>>>> performance of
>>>> unmaps drastically.
>>>> 
>>>> Condition (size > granule size) is chosen for 
>>>> io_pgtable_tlb_flush_all()
>>>> because for any granule with supported pgsizes, we will have at 
>>>> least 512
>>>> TLB invalidations for which tlb_flush_all() is already recommended. 
>>>> For
>>>> example, take 4K granule with 2MB pgsize, this will result in 512 
>>>> TLBIVA
>>>> in partial walk flush.
>>>> 
>>>> Test on QTI SM8150 SoC for 10 iterations of iommu_{map_sg}/unmap:
>>>> (average over 10 iterations)
>>>> 
>>>> Before this optimization:
>>>> 
>>>>      size        iommu_map_sg      iommu_unmap
>>>>        4K            2.067 us         1.854 us
>>>>       64K            9.598 us         8.802 us
>>>>        1M          148.890 us       130.718 us
>>>>        2M          305.864 us        67.291 us
>>>>       12M         1793.604 us       390.838 us
>>>>       16M         2386.848 us       518.187 us
>>>>       24M         3563.296 us       775.989 us
>>>>       32M         4747.171 us      1033.364 us
>>>> 
>>>> After this optimization:
>>>> 
>>>>      size        iommu_map_sg      iommu_unmap
>>>>        4K            1.723 us         1.765 us
>>>>       64K            9.880 us         8.869 us
>>>>        1M          155.364 us       135.223 us
>>>>        2M          303.906 us         5.385 us
>>>>       12M         1786.557 us        21.250 us
>>>>       16M         2391.890 us        27.437 us
>>>>       24M         3570.895 us        39.937 us
>>>>       32M         4755.234 us        51.797 us
>>>> 
>>>> This is further reduced once the map/unmap_pages() support gets in 
>>>> which
>>>> will result in just 1 tlb_flush_all() as opposed to 16 
>>>> tlb_flush_all().
>>>> 
>>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>>> ---
>>>>   drivers/iommu/io-pgtable-arm.c | 7 +++++--
>>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>> 
>>>> diff --git a/drivers/iommu/io-pgtable-arm.c 
>>>> b/drivers/iommu/io-pgtable-arm.c
>>>> index 87def58e79b5..c3cb9add3179 100644
>>>> --- a/drivers/iommu/io-pgtable-arm.c
>>>> +++ b/drivers/iommu/io-pgtable-arm.c
>>>> @@ -589,8 +589,11 @@ static size_t __arm_lpae_unmap(struct 
>>>> arm_lpae_io_pgtable *data,
>>>>             if (!iopte_leaf(pte, lvl, iop->fmt)) {
>>>>               /* Also flush any partial walks */
>>>> -            io_pgtable_tlb_flush_walk(iop, iova, size,
>>>> -                          ARM_LPAE_GRANULE(data));
>>>> +            if (size > ARM_LPAE_GRANULE(data))
>>>> +                io_pgtable_tlb_flush_all(iop);
>>>> +            else
>>> 
>>> Erm, when will the above condition ever not be true? ;)
>>> 
>> 
>> Ah right, silly me :)
>> 
>>> Taking a step back, though, what about the impact to drivers other
>>> than SMMUv2?
>> 
>> Other drivers would be msm_iommu.c, qcom_iommu.c which does the same
>> thing as arm-smmu-v2 (page based invalidations), then there is 
>> ipmmu-vmsa.c
>> which does tlb_flush_all() for flush walk.
>> 
>>> In particular I'm thinking of SMMUv3.2 where the whole
>>> range can be invalidated by VA in a single command anyway, so the
>>> additional penalties of TLBIALL are undesirable.
>>> 
>> 
>> Right, so I am thinking we can have a new generic quirk 
>> IO_PGTABLE_QUIRK_RANGE_INV
>> to choose between range based invalidations(tlb_flush_walk) and 
>> tlb_flush_all().
>> In this case of arm-smmu-v3.2, we can tie up ARM_SMMU_FEAT_RANGE_INV 
>> with this quirk
>> and have something like below, thoughts?
>> 
>> if (iop->cfg.quirks & IO_PGTABLE_QUIRK_RANGE_INV)
>>          io_pgtable_tlb_flush_walk(iop, iova, size,
>>                                    ARM_LPAE_GRANULE(data));
>> else
>>          io_pgtable_tlb_flush_all(iop);
> 
> The design here has always been that io-pgtable says *what* needs
> invalidating, and we left it up to the drivers to decide exactly
> *how*. Even though things have evolved a bit I don't think that has
> fundamentally changed - tlb_flush_walk is now only used in this one
> place (technically I suppose it could be renamed tlb_flush_table but
> it's not worth the churn), so drivers can implement their own
> preferred table-invalidating behaviour even more easily than choosing
> whether to bounce a quirk through the common code or not. Consider
> what you've already seen for the Renesas IPMMU, or SMMUv1 stage 2...
> 

Thanks for the explanation, makes sense. If I am not mistaken, I see 
that
you are suggesting to move this logic based on size and granule-size to
arm-smmu-v2 driver and one more thing below..


> I'm instinctively a little twitchy about making this a blanket
> optimisation for SMMUv2 since I still remember the palaver with our
> display and MMU-500 integrations, where it had to implement the dodgy
> "prefetch" register to trigger translations before scanning out a
> frame since it couldn't ever afford a TLB miss, thus TLBIALL when
> freeing an old buffer would be a dangerous hammer to swing. However
> IIRC it also had to ensure everything was mapped as 2MB blocks to
> guarantee fitting everything in the TLBs in the first place, so I
> guess it would still work out OK due to never realistically unmapping
> a whole table at once anyway.
> 

You are also hinting to not do this for all SMMUv2 implementations and 
make
it QCOM specific?

If I am wrong in my assumptions here, please let me know otherwise I 
will
prepare the patch :)

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
