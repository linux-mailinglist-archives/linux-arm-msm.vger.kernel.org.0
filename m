Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DA427681F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 07:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgIXFNV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Sep 2020 01:13:21 -0400
Received: from z5.mailgun.us ([104.130.96.5]:56922 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726765AbgIXFNV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Sep 2020 01:13:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600924400; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3rstsPGgySfsl4lGNnBfruTzexmptpldkhpyMx81+PQ=;
 b=eqtlwumVysMhYM6P36iLiTDtpoDrFFkmghY6vZraJIOmhVYxyCntx0lAP9Z1NZpMCynJvJXA
 sSf74eAnfplA9VYE2Vh/fTMYIyLbYLS4SD7pLuBbdW07vp6C2w3UyjIvLO2d3Mc+wz1Ry578
 Ce57qqSzXQnz8+JS0ZrQoa46axY=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f6c2ae53e7bfb5c371eeb3b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Sep 2020 05:13:09
 GMT
Sender: cgoldswo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E30D8C43385; Thu, 24 Sep 2020 05:13:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cgoldswo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A0CDC433CB;
        Thu, 24 Sep 2020 05:13:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 23 Sep 2020 22:13:07 -0700
From:   Chris Goldsworthy <cgoldswo@codeaurora.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        pratikp@codeaurora.org, pdaly@codeaurora.org,
        sudaraja@codeaurora.org, iamjoonsoo.kim@lge.com,
        linux-arm-msm-owner@vger.kernel.org,
        Vinayak Menon <vinmenon@codeaurora.org>,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH v2] mm: cma: indefinitely retry allocations in cma_alloc
In-Reply-To: <5cfa914fca107d884aa845b9273ec656@codeaurora.org>
References: <06489716814387e7f147cf53d1b185a8@codeaurora.org>
 <1599851809-4342-1-git-send-email-cgoldswo@codeaurora.org>
 <010101747e998731-e49f209f-8232-4496-a9fc-2465334e70d7-000000@us-west-2.amazonses.com>
 <a4bdda08-9e2a-4862-00a3-72d4c90e82c7@redhat.com>
 <72ae0f361df527cf70946992e4ab1eb3@codeaurora.org>
 <a3d62a77-4c4f-e86c-de6d-5222c2a747e0@redhat.com>
 <5cfa914fca107d884aa845b9273ec656@codeaurora.org>
Message-ID: <23a1565b9bb5f6002bd3e529d533f22b@codeaurora.org>
X-Sender: cgoldswo@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-17 10:54, Chris Goldsworthy wrote:
> On 2020-09-15 00:53, David Hildenbrand wrote:
>> On 14.09.20 20:33, Chris Goldsworthy wrote:
>>> On 2020-09-14 02:31, David Hildenbrand wrote:
>>>> On 11.09.20 21:17, Chris Goldsworthy wrote:
>>>>> 
>>>>> So, inside of cma_alloc(), instead of giving up when
>>>>> alloc_contig_range()
>>>>> returns -EBUSY after having scanned a whole CMA-region bitmap,
>>>>> perform
>>>>> retries indefinitely, with sleeps, to give the system an 
>>>>> opportunity
>>>>> to
>>>>> unpin any pinned pages.
>>>>> 
>>>>> Signed-off-by: Chris Goldsworthy <cgoldswo@codeaurora.org>
>>>>> Co-developed-by: Vinayak Menon <vinmenon@codeaurora.org>
>>>>> Signed-off-by: Vinayak Menon <vinmenon@codeaurora.org>
>>>>> ---
>>>>>  mm/cma.c | 25 +++++++++++++++++++++++--
>>>>>  1 file changed, 23 insertions(+), 2 deletions(-)
>>>>> 
>>>>> diff --git a/mm/cma.c b/mm/cma.c
>>>>> index 7f415d7..90bb505 100644
>>>>> --- a/mm/cma.c
>>>>> +++ b/mm/cma.c
>>>>> @@ -442,8 +443,28 @@ struct page *cma_alloc(struct cma *cma, size_t
>>>>> count, unsigned int align,
>>>>>  				bitmap_maxno, start, bitmap_count, mask,
>>>>>  				offset);
>>>>>  		if (bitmap_no >= bitmap_maxno) {
>>>>> -			mutex_unlock(&cma->lock);
>>>>> -			break;
>>>>> +			if (ret == -EBUSY) {
>>>>> +				mutex_unlock(&cma->lock);
>>>>> +
>>>>> +				/*
>>>>> +				 * Page may be momentarily pinned by some other
>>>>> +				 * process which has been scheduled out, e.g.
>>>>> +				 * in exit path, during unmap call, or process
>>>>> +				 * fork and so cannot be freed there. Sleep
>>>>> +				 * for 100ms and retry the allocation.
>>>>> +				 */
>>>>> +				start = 0;
>>>>> +				ret = -ENOMEM;
>>>>> +				msleep(100);
>>>>> +				continue;
>>>>> +			} else {
>>>>> +				/*
>>>>> +				 * ret == -ENOMEM - all bits in cma->bitmap are
>>>>> +				 * set, so we break accordingly.
>>>>> +				 */
>>>>> +				mutex_unlock(&cma->lock);
>>>>> +				break;
>>>>> +			}
>>>>>  		}
>>>>>  		bitmap_set(cma->bitmap, bitmap_no, bitmap_count);
>>>>>  		/*
>>>>> 
>>>> 
>>>> What about long-term pinnings? IIRC, that can happen easily e.g.,
>>>> with
>>>> vfio (and I remember there is a way via vmsplice).
>>>> 
>>>> Not convinced trying forever is a sane approach in the general case
>>>> ...
>>> 
>>> V1:
>>> [1] https://lkml.org/lkml/2020/8/5/1097
>>> [2] https://lkml.org/lkml/2020/8/6/1040
>>> [3] https://lkml.org/lkml/2020/8/11/893
>>> [4] https://lkml.org/lkml/2020/8/21/1490
>>> [5] https://lkml.org/lkml/2020/9/11/1072
>>> 
>>> We're fine with doing indefinite retries, on the grounds that if 
>>> there
>>> is some long-term pinning that occurs when alloc_contig_range returns
>>> -EBUSY, that it should be debugged and fixed.  Would it be possible 
>>> to
>>> make this infinite-retrying something that could be enabled or
>>> disabled
>>> by a defconfig option?
>> 
>> Two thoughts:
>> 
>> This means I strongly prefer something like [3] if feasible.
> 
> _Resending so that this ends up on LKML_
> 
> I can give [3] some further thought then.  Also, I realized [3] will 
> not
> completely solve the problem, it just reduces the window in which
> _refcount > _mapcount (as mentioned in earlier threads, we encountered
> the pinning when a task in copy_one_pte() or in the exit_mmap() path
> gets context switched out).  If we were to try a sleeping-lock based
> solution, do you think it would be permissible to add another lock to
> struct page?

I have not been able to think of a clean way of introducing calls to 
preempt_disable() in exit_mmap(), which is the more problematic case.  
We would need to track state across multiple invocations of 
zap_pte_range() (which is called for each entry in a PMD when a 
process's memory is being unmapped), and would also need to extend this 
to tlb_finish_mmu(), which is called after all the process's memory has 
been unmapped: 
https://elixir.bootlin.com/linux/v5.8.10/source/mm/mmap.c#L3164.  As a 
follow-up to this patch, I'm submitting a patch that re-introduces the 
GFP mask for cma_alloc, that will perform indefinite retires if 
__GFP_NOFAIL is passed to the function.

-- 
The Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
