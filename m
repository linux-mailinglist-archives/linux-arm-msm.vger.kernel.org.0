Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A20324226F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 00:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgHKWVH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 18:21:07 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55605 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726085AbgHKWVG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 18:21:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597184465; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=GkjVxjWcHd8v5LtDQt1A/M6EKaHCXRkAMU5b0RhlAIg=; b=jX6Hy3GNoUfF3oF7LXyTt0uQAjK2fY+BgnzjE6t+5Gquhq7C4aCvRJm/hMxreXcnkEqEtBBp
 ey7jpPMSSD42uQbAlqd5FPkoPe4DZuE5ihD6J1P6j1D+TbZEP/SiJvueCGi/dbMobKYUOC5p
 hr0BAk3ivZt0Vkdv+dfpwDhUmGI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-west-2.postgun.com with SMTP id
 5f3319c22889723bf82fd5d0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 Aug 2020 22:20:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D0AEEC433CA; Tue, 11 Aug 2020 22:20:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cgoldswo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BEF66C433C9;
        Tue, 11 Aug 2020 22:20:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 11 Aug 2020 15:20:47 -0700
From:   cgoldswo@codeaurora.org
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pratikp@codeaurora.org,
        pdaly@codeaurora.org, sudraja@codeaurora.org,
        iamjoonsoo.kim@lge.com, linux-arm-msm-owner@vger.kernel.org
Subject: Re: cma_alloc(), add sleep-and-retry for temporary page pinning
Message-ID: <896f92e8c37936e7cb2914e79273e9e8@codeaurora.org>
X-Sender: cgoldswo@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-06 18:31, Andrew Morton wrote:
> On Wed,  5 Aug 2020 19:56:21 -0700 Chris Goldsworthy
> <cgoldswo@codeaurora.org> wrote:
> 
>> On mobile devices, failure to allocate from a CMA area constitutes a
>> functional failure.  Sometimes during CMA allocations, we have 
>> observed
>> that pages in a CMA area allocated through alloc_pages(), that we're 
>> trying
>> to migrate away to make room for a CMA allocation, are temporarily 
>> pinned.
>> This temporary pinning can occur when a process that owns the pinned 
>> page
>> is being forked (the example is explained further in the commit text).
>> This patch addresses this issue by adding a sleep-and-retry loop in
>> cma_alloc() . There's another example we know of similar to the above 
>> that
>> occurs during exit_mmap() (in zap_pte_range() specifically), but I 
>> need to
>> determine if this is still relevant today.
> 

> Sounds fairly serious but boy, we're late for 5.9.
> 
> I can queue it for 5.10 with a cc:stable so that it gets backported
> into earlier kernels a couple of months from now, if we think the
> seriousness justifies backporting(?).
> 

Queuing this seems like the best way to proceed, if we were to pick up 
this patch.
I think we can forgo back-porting this, as this is something that will 
only be
needed as vendors such as our selves start using Google's Generic Kernel 
Image
(we've carried this patch in our tree for over four years).

> 
> And...  it really is a sad little patch, isn't it?  Instead of fixing
> the problem, it reduces the problem's probability by 5x.  Can't we do
> better than this?

I have one alternative in mind.  I have been able to review the 
exit_mmap()
case, so before proceeding, let's do a breakdown of the problem: we can
categorize the pinning issue we're trying to address here as being one 
of
(1) incrementing _refcount and getting context-switched out before
incrementing _mapcount (applies to forking a process / copy_one_pte()), 
and
(2) decrementing _mapcount and getting context-switched out before
decrementing _refcount (applies to tearing down a process / 
exit_mmap()).
So, one alternative would be to insert preempt_disable/enable() calls at
affected sites. So, for the copy_one_pte() pinning case, we could do the
following inside of copy_one_pte():

         if (page) {
+               preempt_disable();
                 get_page(page);
                 page_dup_rmap(page, false);
+               preempt_enable();
                 rss[mm_counter(page)]++;
         }

I'm not sure if this approach would be acceptable for the exit_mmap()
pinning case (applicable when CONFIG_MMU_GATHER_NO_GATHER=y).  For the
purposes of this discussion, we can look at two function calls inside of
exit_mmap(), in the order they're called in, to show how the pinning is
occuring:

     1. Calling unmap_vmas(): this unmaps the pages in each VMA for an
     exiting task, using zap_pte_range() - zap_pte_range() reduces the
     _mapcount for each page in a VMA, using page_remove_rmap().  After
     calling page_remove_rmap(), the page is placed into a list in
     __tlb_remove_page().  This list of pages will be used when flushing
     TLB entries later on during the process teardown.

     2. Calling tlb_finish_mmu(): This is will flush the TLB entries
     associated with pages, before calling put_page() on them, using the
     previously collected pages from __tlb_remove_page() - the call flow 
is
     tlb_flush_mmu() > tlb_flush_mmu() > tlb_flush_mmu_free()
     > tlb_batch_pages_flush() > free_pages_and_swap_cache() >
     release_pages(), where release_pages() is described as a "batched
     put_page()"

The preempt_disable/enable() approach would entail doing the following
inside of exit_mmap():

+       preempt_disable();
         unmap_vmas(&tlb, vma, 0, -1);
         free_pgtables(&tlb, vma, FIRST_USER_ADDRESS, 
USER_PGTABLES_CEILING);
         tlb_finish_mmu(&tlb, 0, -1);
+       preempt_enable();

I'm not sure doing this is feasible, given how long it could take to do 
the
process teardown.

The good thing about this patch is that it has been stable in our kernel
for four years (though for some SoCs we increased the retry counts).  
One
thing to stress is that there are other instances of CMA page pinning, 
that
this patch isn't attempting to address. Please let me know if you're 
okay
with queuing this for the 5.10 merge window - if you are, I can add an
option to configure the number of retries, and will resend the patch 
once
the 5.9 merge window closes.

Thanks,

Chris.

-- 
The Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
