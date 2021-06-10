Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602DB3A23FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 07:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhFJF1L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 01:27:11 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:55634 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbhFJF1K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 01:27:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623302715; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Bgf1x/nFWFQGqJpMO9ldu/lRRQ3GhGowilaUgKGPmUA=;
 b=EeWzjBDhR/7rX3NJoN94o3cnTFpWcfcJJpE0HFDfW6L1OT2tC4tpQo8g7x7lMR9x2XTU1d8y
 ireyGMvUU1xDrP5siM3HfdbXlt2g0VPjbaZGWwM9LA1druavlt6smFvPVqWzbJ4+aeCcbapk
 XaRePHGjhE0R+HSrWBVnTFWOJ3U=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60c1a22ce27c0cc77f461e9a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 10 Jun 2021 05:25:00
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DDBA7C43144; Thu, 10 Jun 2021 05:24:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 23D8BC4338A;
        Thu, 10 Jun 2021 05:24:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 10 Jun 2021 10:54:58 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu/io-pgtable-arm: Optimize partial walk flush for
 large scatter-gather list
In-Reply-To: <dbcd394a-4d85-316c-5dd0-033546a66132@arm.com>
References: <20210609145315.25750-1-saiprakash.ranjan@codeaurora.org>
 <dbcd394a-4d85-316c-5dd0-033546a66132@arm.com>
Message-ID: <c600e9b2534d54082a5272b508a7985f@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On 2021-06-10 00:14, Robin Murphy wrote:
> On 2021-06-09 15:53, Sai Prakash Ranjan wrote:
>> Currently for iommu_unmap() of large scatter-gather list with page 
>> size
>> elements, the majority of time is spent in flushing of partial walks 
>> in
>> __arm_lpae_unmap() which is a VA based TLB invalidation (TLBIVA for
>> arm-smmu).
>> 
>> For example: to unmap a 32MB scatter-gather list with page size 
>> elements
>> (8192 entries), there are 16->2MB buffer unmaps based on the pgsize 
>> (2MB
>> for 4K granule) and each of 2MB will further result in 512 TLBIVAs 
>> (2MB/4K)
>> resulting in a total of 8192 TLBIVAs (512*16) for 16->2MB causing a 
>> huge
>> overhead.
>> 
>> So instead use io_pgtable_tlb_flush_all() to invalidate the entire 
>> context
>> if size (pgsize) is greater than the granule size (4K, 16K, 64K). For 
>> this
>> example of 32MB scatter-gather list unmap, this results in just 16 
>> ASID
>> based TLB invalidations or tlb_flush_all() callback (TLBIASID in case 
>> of
>> arm-smmu) as opposed to 8192 TLBIVAs thereby increasing the 
>> performance of
>> unmaps drastically.
>> 
>> Condition (size > granule size) is chosen for 
>> io_pgtable_tlb_flush_all()
>> because for any granule with supported pgsizes, we will have at least 
>> 512
>> TLB invalidations for which tlb_flush_all() is already recommended. 
>> For
>> example, take 4K granule with 2MB pgsize, this will result in 512 
>> TLBIVA
>> in partial walk flush.
>> 
>> Test on QTI SM8150 SoC for 10 iterations of iommu_{map_sg}/unmap:
>> (average over 10 iterations)
>> 
>> Before this optimization:
>> 
>>      size        iommu_map_sg      iommu_unmap
>>        4K            2.067 us         1.854 us
>>       64K            9.598 us         8.802 us
>>        1M          148.890 us       130.718 us
>>        2M          305.864 us        67.291 us
>>       12M         1793.604 us       390.838 us
>>       16M         2386.848 us       518.187 us
>>       24M         3563.296 us       775.989 us
>>       32M         4747.171 us      1033.364 us
>> 
>> After this optimization:
>> 
>>      size        iommu_map_sg      iommu_unmap
>>        4K            1.723 us         1.765 us
>>       64K            9.880 us         8.869 us
>>        1M          155.364 us       135.223 us
>>        2M          303.906 us         5.385 us
>>       12M         1786.557 us        21.250 us
>>       16M         2391.890 us        27.437 us
>>       24M         3570.895 us        39.937 us
>>       32M         4755.234 us        51.797 us
>> 
>> This is further reduced once the map/unmap_pages() support gets in 
>> which
>> will result in just 1 tlb_flush_all() as opposed to 16 
>> tlb_flush_all().
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   drivers/iommu/io-pgtable-arm.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/iommu/io-pgtable-arm.c 
>> b/drivers/iommu/io-pgtable-arm.c
>> index 87def58e79b5..c3cb9add3179 100644
>> --- a/drivers/iommu/io-pgtable-arm.c
>> +++ b/drivers/iommu/io-pgtable-arm.c
>> @@ -589,8 +589,11 @@ static size_t __arm_lpae_unmap(struct 
>> arm_lpae_io_pgtable *data,
>>     		if (!iopte_leaf(pte, lvl, iop->fmt)) {
>>   			/* Also flush any partial walks */
>> -			io_pgtable_tlb_flush_walk(iop, iova, size,
>> -						  ARM_LPAE_GRANULE(data));
>> +			if (size > ARM_LPAE_GRANULE(data))
>> +				io_pgtable_tlb_flush_all(iop);
>> +			else
> 
> Erm, when will the above condition ever not be true? ;)
> 

Ah right, silly me :)

> Taking a step back, though, what about the impact to drivers other
> than SMMUv2?

Other drivers would be msm_iommu.c, qcom_iommu.c which does the same
thing as arm-smmu-v2 (page based invalidations), then there is 
ipmmu-vmsa.c
which does tlb_flush_all() for flush walk.

> In particular I'm thinking of SMMUv3.2 where the whole
> range can be invalidated by VA in a single command anyway, so the
> additional penalties of TLBIALL are undesirable.
> 

Right, so I am thinking we can have a new generic quirk 
IO_PGTABLE_QUIRK_RANGE_INV
to choose between range based invalidations(tlb_flush_walk) and 
tlb_flush_all().
In this case of arm-smmu-v3.2, we can tie up ARM_SMMU_FEAT_RANGE_INV 
with this quirk
and have something like below, thoughts?

if (iop->cfg.quirks & IO_PGTABLE_QUIRK_RANGE_INV)
         io_pgtable_tlb_flush_walk(iop, iova, size,
                                   ARM_LPAE_GRANULE(data));
else
         io_pgtable_tlb_flush_all(iop);

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
