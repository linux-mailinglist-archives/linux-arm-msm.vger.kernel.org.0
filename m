Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E96E27B601
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 22:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgI1UL5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 16:11:57 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:31233 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbgI1UL4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 16:11:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601323915; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=op/U87fsFlt3hvvtSBRrE2L1WvnY7Uc8jC7iUSSh17U=;
 b=bpr0v+w4foDTEg1p+ccPijirsF4NrIcRsNjes4rjk3FCD3Mh8zdY2t7TSoLdfvd6SWCyCRts
 3yuJL1x2n+qoCcsIrA0TAZ3t9lorwUWeQ1bd4DMJF5NKBPA38HW3jZYMpVDAn06lNLjO7hBU
 tS7d/n4ETxerHxyh6kbFkdKgnHw=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f724351be59ebabf3657019 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 20:10:57
 GMT
Sender: cgoldswo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1866C43387; Mon, 28 Sep 2020 20:10:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cgoldswo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B4E03C433C8;
        Mon, 28 Sep 2020 20:10:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 28 Sep 2020 13:10:55 -0700
From:   Chris Goldsworthy <cgoldswo@codeaurora.org>
To:     Minchan Kim <minchan@kernel.org>
Cc:     akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        pratikp@codeaurora.org, pdaly@codeaurora.org,
        sudaraja@codeaurora.org, iamjoonsoo.kim@lge.com, david@redhat.com,
        Vinayak Menon <vinmenon@codeaurora.org>,
        Minchan Kim <minchan.kim@gmail.com>
Subject: Re: [PATCH v3] mm: cma: indefinitely retry allocations in cma_alloc
In-Reply-To: <20200927192338.GA2593886@google.com>
References: <cover.1600922611.git.cgoldswo@codeaurora.org>
 <6904d64c97ca71b14ed0548a0287162bb6fb4b7b.1600922611.git.cgoldswo@codeaurora.org>
 <20200927192338.GA2593886@google.com>
Message-ID: <4af80340b8905a02d48202ea033131c9@codeaurora.org>
X-Sender: cgoldswo@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-27 12:23, Minchan Kim wrote:
> On Wed, Sep 23, 2020 at 10:16:25PM -0700, Chris Goldsworthy wrote:
>> CMA allocations will fail if 'pinned' pages are in a CMA area, since 
>> we


>> 
>> +config CMA_RETRY_SLEEP_DURATION
>> +	int "Sleep duration between retries"
>> +	depends on CMA
>> +	default 100
>> +	help
>> +	  Time to sleep for in milliseconds between the indefinite
>> +	  retries of a CMA allocation that are induced by passing
>> +	  __GFP_NOFAIL to cma_alloc().
>> +
>> +	  If unsure, leave the value as "100".
> 
> What's the point of this new config? If we need it, How could admin
> set their value?
> How does it make bad if we just use simple default vaule?
> IOW, I'd like to avoid introducing new config if we don't see good
> justifcation.

I thought that it would be useful for developers, but I guess it would 
be much better for this to be runtime configurable.  But, I don't think 
there's a strong reason to be able to configure the value - 100 ms has 
worked for us.  I'll update scrap this option in a follow-up patch, and 
will use 100 ms as the sleeping time.

>> +
>>  config MEM_SOFT_DIRTY
>>  	bool "Track memory changes"
>>  	depends on CHECKPOINT_RESTORE && HAVE_ARCH_SOFT_DIRTY && PROC_FS
>> diff --git a/mm/cma.c b/mm/cma.c
>> index 7f415d7..4fbad2b 100644
>> --- a/mm/cma.c
>> +++ b/mm/cma.c
>> @@ -32,6 +32,7 @@
>>  #include <linux/highmem.h>
>>  #include <linux/io.h>
>>  #include <linux/kmemleak.h>
>> +#include <linux/delay.h>
>>  #include <trace/events/cma.h>
>> 
>>  #include "cma.h"
>> @@ -403,13 +404,15 @@ static inline void cma_debug_show_areas(struct 
>> cma *cma) { }
>>   * @cma:   Contiguous memory region for which the allocation is 
>> performed.
>>   * @count: Requested number of pages.
>>   * @align: Requested alignment of pages (in PAGE_SIZE order).
>> - * @no_warn: Avoid printing message about failed allocation
>> + * @gfp_mask: If __GFP_NOWARN is passed, suppress messages about 
>> failed
>> + *	      allocations. If __GFP_NOFAIL is passed, try doing the CMA
>> + *	      allocation indefinitely until the allocation succeeds.
>>   *
>>   * This function allocates part of contiguous memory on specific
>>   * contiguous memory area.
>>   */
>>  struct page *cma_alloc(struct cma *cma, size_t count, unsigned int 
>> align,
>> -		       bool no_warn)
>> +		       gfp_t gfp_mask)
>>  {
>>  	unsigned long mask, offset;
>>  	unsigned long pfn = -1;
>> @@ -442,8 +445,28 @@ struct page *cma_alloc(struct cma *cma, size_t 
>> count, unsigned int align,
>>  				bitmap_maxno, start, bitmap_count, mask,
>>  				offset);
>>  		if (bitmap_no >= bitmap_maxno) {
>> -			mutex_unlock(&cma->lock);
>> -			break;
>> +			if (ret == -EBUSY && gfp_mask & __GFP_NOFAIL) {
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
>> +				msleep(CONFIG_CMA_RETRY_SLEEP_DURATION);
> 
> Should it be uninterruptible, really?

Good point - I'll replace the msleep() this with 
schedule_timeout_killable() in the follow-up patch.

-- 
The Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
