Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBF626A03D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgIOHyk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:54:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28652 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726222AbgIOHxw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600156430;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=bN+Rpvez8zN7Ji/o5hwHXHmkbUAWCPHcxfFu3KTtkcE=;
        b=ghnrNCjAVmJRY4Z27X3fd0Xhpto1TNmI76HgTDhG2ap6TxC/aQv+5sX0vw0pJClVE6t5oF
        1YUFPR6dpyIGH5gviDaVfJBgnzxPuxqVOqChCj2LgAxY7MxmgHtkQPGpsWYPXsiu8zpeLz
        05DZ9Ci/KqIojSLa+vIMqTDksidIkgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-hWhIrIVRNEOgCnqrkTOmcA-1; Tue, 15 Sep 2020 03:53:37 -0400
X-MC-Unique: hWhIrIVRNEOgCnqrkTOmcA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0862C10BBEF1;
        Tue, 15 Sep 2020 07:53:35 +0000 (UTC)
Received: from [10.36.114.89] (ovpn-114-89.ams2.redhat.com [10.36.114.89])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B7A017EB8B;
        Tue, 15 Sep 2020 07:53:31 +0000 (UTC)
Subject: Re: [PATCH v2] mm: cma: indefinitely retry allocations in cma_alloc
To:     Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc:     akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        pratikp@codeaurora.org, pdaly@codeaurora.org,
        sudraja@codeaurora.org, iamjoonsoo.kim@lge.com,
        linux-arm-msm-owner@vger.kernel.org,
        Vinayak Menon <vinmenon@codeaurora.org>,
        linux-kernel-owner@vger.kernel.org
References: <06489716814387e7f147cf53d1b185a8@codeaurora.org>
 <1599851809-4342-1-git-send-email-cgoldswo@codeaurora.org>
 <010101747e998731-e49f209f-8232-4496-a9fc-2465334e70d7-000000@us-west-2.amazonses.com>
 <a4bdda08-9e2a-4862-00a3-72d4c90e82c7@redhat.com>
 <72ae0f361df527cf70946992e4ab1eb3@codeaurora.org>
From:   David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <a3d62a77-4c4f-e86c-de6d-5222c2a747e0@redhat.com>
Date:   Tue, 15 Sep 2020 09:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <72ae0f361df527cf70946992e4ab1eb3@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14.09.20 20:33, Chris Goldsworthy wrote:
> On 2020-09-14 02:31, David Hildenbrand wrote:
>> On 11.09.20 21:17, Chris Goldsworthy wrote:
>>>
>>> So, inside of cma_alloc(), instead of giving up when 
>>> alloc_contig_range()
>>> returns -EBUSY after having scanned a whole CMA-region bitmap, perform
>>> retries indefinitely, with sleeps, to give the system an opportunity 
>>> to
>>> unpin any pinned pages.
>>>
>>> Signed-off-by: Chris Goldsworthy <cgoldswo@codeaurora.org>
>>> Co-developed-by: Vinayak Menon <vinmenon@codeaurora.org>
>>> Signed-off-by: Vinayak Menon <vinmenon@codeaurora.org>
>>> ---
>>>  mm/cma.c | 25 +++++++++++++++++++++++--
>>>  1 file changed, 23 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/cma.c b/mm/cma.c
>>> index 7f415d7..90bb505 100644
>>> --- a/mm/cma.c
>>> +++ b/mm/cma.c
>>> @@ -442,8 +443,28 @@ struct page *cma_alloc(struct cma *cma, size_t 
>>> count, unsigned int align,
>>>  				bitmap_maxno, start, bitmap_count, mask,
>>>  				offset);
>>>  		if (bitmap_no >= bitmap_maxno) {
>>> -			mutex_unlock(&cma->lock);
>>> -			break;
>>> +			if (ret == -EBUSY) {
>>> +				mutex_unlock(&cma->lock);
>>> +
>>> +				/*
>>> +				 * Page may be momentarily pinned by some other
>>> +				 * process which has been scheduled out, e.g.
>>> +				 * in exit path, during unmap call, or process
>>> +				 * fork and so cannot be freed there. Sleep
>>> +				 * for 100ms and retry the allocation.
>>> +				 */
>>> +				start = 0;
>>> +				ret = -ENOMEM;
>>> +				msleep(100);
>>> +				continue;
>>> +			} else {
>>> +				/*
>>> +				 * ret == -ENOMEM - all bits in cma->bitmap are
>>> +				 * set, so we break accordingly.
>>> +				 */
>>> +				mutex_unlock(&cma->lock);
>>> +				break;
>>> +			}
>>>  		}
>>>  		bitmap_set(cma->bitmap, bitmap_no, bitmap_count);
>>>  		/*
>>>
>>
>> What about long-term pinnings? IIRC, that can happen easily e.g., with
>> vfio (and I remember there is a way via vmsplice).
>>
>> Not convinced trying forever is a sane approach in the general case ...
> 
> Hi David,
> 
> I've botched the threading, so there are discussions with respect to the 
> previous patch-set that is missing on this thread, which I will 
> summarize below:
> 
> V1:
> [1] https://lkml.org/lkml/2020/8/5/1097
> [2] https://lkml.org/lkml/2020/8/6/1040
> [3] https://lkml.org/lkml/2020/8/11/893
> [4] https://lkml.org/lkml/2020/8/21/1490
> [5] https://lkml.org/lkml/2020/9/11/1072
> 
> [1] features version of the patch featured a finite number of retries, 
> which has been stable for our kernels. In [2], Andrew questioned whether 
> we could actually find a way of solving the problem on the grounds that 
> doing a finite number of retries doesn't actually fix the problem (more 
> importantly, in [4] Andrew indicated that he would prefer not to merge 
> the patch as it doesn't solve the issue).  In [3], I suggest one actual 
> fix for this, which is to use preempt_disable/enable() to prevent 
> context switches from occurring during the periods in copy_one_pte() and 
> exit_mmap() (I forgot to mention this case in the commit text) in which 
> _refcount > _mapcount for a page - you would also need to prevent 
> interrupts from occurring to if we were to fully prevent the issue from 
> occurring.  I think this would be acceptable for the copy_one_pte() 
> case, since there _refcount > _mapcount for little time.  For the 
> exit_mmap() case, however, _refcount is greater than _mapcount whilst 
> the page-tables are being torn down for a process - that could be too 
> long for disabling preemption / interrupts.
> 
> So, in [4], Andrew asks about two alternatives to see if they're viable: 
> (1) acquiring locks on the exit_mmap path and migration paths, (2) 
> retrying indefinitely.  In [5], I discuss how using locks could increase 
> the time it takes to perform a CMA allocation, such that a retry 
> approach would avoid increased CMA allocation times. I'm also uncertain 
> about how the locking scheme could be implemented effectively without 
> introducing a new per-page lock that will be used specifically to solve 
> this issue, and I'm not sure this would be accepted.

Thanks for the nice summary!

> 
> We're fine with doing indefinite retries, on the grounds that if there 
> is some long-term pinning that occurs when alloc_contig_range returns 
> -EBUSY, that it should be debugged and fixed.  Would it be possible to 
> make this infinite-retrying something that could be enabled or disabled 
> by a defconfig option?

Two thoughts:

1. Most (all?) alloc_contig_range() users are interested in handling
short-term pinnings in a nice way (IOW, make the allocation succeed).
I'd much rather want to see this being handled in a nice fashion inside
alloc_contig_range() than having to encode endless loops in the caller.
This means I strongly prefer something like [3] if feasible. But I can
understand that stuff ([5]) is complicated. I have to admit that I am
not an expert on the short term pinning described by you, and how to
eventually fix it.

2. The issue that I am having is that long-term pinnings are
(unfortunately) a real thing. It's not something to debug and fix as you
suggest. Like, run a VM with VFIO (e.g., PCI passthrough). While that VM
is running, all VM memory will be pinned. If memory falls onto a CMA
region your cma_alloc() will be stuck in an (endless, meaning until the
VM ended) loop. I am not sure if all cma users are fine with that -
especially, think about CMA being used for gigantic pages now.

Assume you want to start a new VM while the other one is running and use
some (new) gigantic pages for it. Suddenly you're trapped in an endless
loop in the kernel. That's nasty.

We do have a similar endless loop on the memory hotunplug/offlining path
(offline_pages()). However, if triggered by a user (echo 0 >
/sys/devices/system/memory/memoryX/online), a user can stop trying by
sending a signal.


If we want to stick to retrying forever, can't we use flags like
__GFP_NOFAIL to explicitly enable this new behavior for selected
cma_alloc() users that really can't fail/retry manually again?

-- 
Thanks,

David / dhildenb

