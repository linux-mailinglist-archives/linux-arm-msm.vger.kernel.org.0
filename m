Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6045C2694EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 20:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgINSdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 14:33:37 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:45440 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726065AbgINSde (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 14:33:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600108413; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=n5jUUJ7Y5eFQeaeymKJYtour4RQWDP8UQVgNUhiT16A=;
 b=vSWwwthsuvw43y+s7hbL6+PDtzQfz30lNRlw3nVSF8vmRAVruU7lxA4h55N+X6RW4njFavkc
 bRR5FFeSTRFZdgkxGHONcMp0CSSDVyK/yyIh3RSdEx5t4xAnf7xMji0FCieqc8GCvTTmB6Nw
 ogCRoFMj2vxVoQTeN44RLaPFFGw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f5fb76673afa3417e8e9cf3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 18:33:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 65FF0C433FE; Mon, 14 Sep 2020 18:33:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cgoldswo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3085FC433CA;
        Mon, 14 Sep 2020 18:33:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 14 Sep 2020 11:33:08 -0700
From:   Chris Goldsworthy <cgoldswo@codeaurora.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        pratikp@codeaurora.org, pdaly@codeaurora.org,
        sudraja@codeaurora.org, iamjoonsoo.kim@lge.com,
        linux-arm-msm-owner@vger.kernel.org,
        Vinayak Menon <vinmenon@codeaurora.org>,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH v2] mm: cma: indefinitely retry allocations in cma_alloc
In-Reply-To: <a4bdda08-9e2a-4862-00a3-72d4c90e82c7@redhat.com>
References: <06489716814387e7f147cf53d1b185a8@codeaurora.org>
 <1599851809-4342-1-git-send-email-cgoldswo@codeaurora.org>
 <010101747e998731-e49f209f-8232-4496-a9fc-2465334e70d7-000000@us-west-2.amazonses.com>
 <a4bdda08-9e2a-4862-00a3-72d4c90e82c7@redhat.com>
Message-ID: <72ae0f361df527cf70946992e4ab1eb3@codeaurora.org>
X-Sender: cgoldswo@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-14 02:31, David Hildenbrand wrote:
> On 11.09.20 21:17, Chris Goldsworthy wrote:
>> 
>> So, inside of cma_alloc(), instead of giving up when 
>> alloc_contig_range()
>> returns -EBUSY after having scanned a whole CMA-region bitmap, perform
>> retries indefinitely, with sleeps, to give the system an opportunity 
>> to
>> unpin any pinned pages.
>> 
>> Signed-off-by: Chris Goldsworthy <cgoldswo@codeaurora.org>
>> Co-developed-by: Vinayak Menon <vinmenon@codeaurora.org>
>> Signed-off-by: Vinayak Menon <vinmenon@codeaurora.org>
>> ---
>>  mm/cma.c | 25 +++++++++++++++++++++++--
>>  1 file changed, 23 insertions(+), 2 deletions(-)
>> 
>> diff --git a/mm/cma.c b/mm/cma.c
>> index 7f415d7..90bb505 100644
>> --- a/mm/cma.c
>> +++ b/mm/cma.c
>> @@ -442,8 +443,28 @@ struct page *cma_alloc(struct cma *cma, size_t 
>> count, unsigned int align,
>>  				bitmap_maxno, start, bitmap_count, mask,
>>  				offset);
>>  		if (bitmap_no >= bitmap_maxno) {
>> -			mutex_unlock(&cma->lock);
>> -			break;
>> +			if (ret == -EBUSY) {
>> +				mutex_unlock(&cma->lock);
>> +
>> +				/*
>> +				 * Page may be momentarily pinned by some other
>> +				 * process which has been scheduled out, e.g.
>> +				 * in exit path, during unmap call, or process
>> +				 * fork and so cannot be freed there. Sleep
>> +				 * for 100ms and retry the allocation.
>> +				 */
>> +				start = 0;
>> +				ret = -ENOMEM;
>> +				msleep(100);
>> +				continue;
>> +			} else {
>> +				/*
>> +				 * ret == -ENOMEM - all bits in cma->bitmap are
>> +				 * set, so we break accordingly.
>> +				 */
>> +				mutex_unlock(&cma->lock);
>> +				break;
>> +			}
>>  		}
>>  		bitmap_set(cma->bitmap, bitmap_no, bitmap_count);
>>  		/*
>> 
> 
> What about long-term pinnings? IIRC, that can happen easily e.g., with
> vfio (and I remember there is a way via vmsplice).
> 
> Not convinced trying forever is a sane approach in the general case ...

Hi David,

I've botched the threading, so there are discussions with respect to the 
previous patch-set that is missing on this thread, which I will 
summarize below:

V1:
[1] https://lkml.org/lkml/2020/8/5/1097
[2] https://lkml.org/lkml/2020/8/6/1040
[3] https://lkml.org/lkml/2020/8/11/893
[4] https://lkml.org/lkml/2020/8/21/1490
[5] https://lkml.org/lkml/2020/9/11/1072

[1] features version of the patch featured a finite number of retries, 
which has been stable for our kernels. In [2], Andrew questioned whether 
we could actually find a way of solving the problem on the grounds that 
doing a finite number of retries doesn't actually fix the problem (more 
importantly, in [4] Andrew indicated that he would prefer not to merge 
the patch as it doesn't solve the issue).  In [3], I suggest one actual 
fix for this, which is to use preempt_disable/enable() to prevent 
context switches from occurring during the periods in copy_one_pte() and 
exit_mmap() (I forgot to mention this case in the commit text) in which 
_refcount > _mapcount for a page - you would also need to prevent 
interrupts from occurring to if we were to fully prevent the issue from 
occurring.  I think this would be acceptable for the copy_one_pte() 
case, since there _refcount > _mapcount for little time.  For the 
exit_mmap() case, however, _refcount is greater than _mapcount whilst 
the page-tables are being torn down for a process - that could be too 
long for disabling preemption / interrupts.

So, in [4], Andrew asks about two alternatives to see if they're viable: 
(1) acquiring locks on the exit_mmap path and migration paths, (2) 
retrying indefinitely.  In [5], I discuss how using locks could increase 
the time it takes to perform a CMA allocation, such that a retry 
approach would avoid increased CMA allocation times. I'm also uncertain 
about how the locking scheme could be implemented effectively without 
introducing a new per-page lock that will be used specifically to solve 
this issue, and I'm not sure this would be accepted.

We're fine with doing indefinite retries, on the grounds that if there 
is some long-term pinning that occurs when alloc_contig_range returns 
-EBUSY, that it should be debugged and fixed.  Would it be possible to 
make this infinite-retrying something that could be enabled or disabled 
by a defconfig option?

Thanks,

Chris.

-- 
The Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
