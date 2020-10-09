Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 506D22899B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 22:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732934AbgJIU1F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 16:27:05 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:46495 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbgJIU1F (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 16:27:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602275224; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=52lzXpIM5c5WEUGQw7Y5zF9EbTe3/SJ1ngiJwmEncaE=;
 b=fiCx33sui98U45zptAq6OkVG72I8eSWfEiu1HNL2u5ixNomNyDI6qJVDEruUeWwLACZXinNl
 JA47d0MYA+dV8pNYBcj0jyS713dfnXmI03JZ1bOUIF9gjtCiqo63EpoqEuuX4lExlIPa1/6H
 8RY/gTrtsPA0wTYNj7TvWIxv6ZQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f80c794a03b63d6738f9986 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Oct 2020 20:27:00
 GMT
Sender: cgoldswo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BE9A5C433FE; Fri,  9 Oct 2020 20:27:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cgoldswo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8D6C2C433F1;
        Fri,  9 Oct 2020 20:26:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 09 Oct 2020 13:26:59 -0700
From:   Chris Goldsworthy <cgoldswo@codeaurora.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     akpm@linux-foundation.org, linux-mm@kvack.org, minchan@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        pratikp@codeaurora.org, pdaly@codeaurora.org,
        sudaraja@codeaurora.org, iamjoonsoo.kim@lge.com, david@redhat.com,
        vinmenon@codeaurora.org, minchan.kim@gmail.com
Subject: Re: [PATCH v4] mm: cma: indefinitely retry allocations in cma_alloc
In-Reply-To: <20200929055937.GA5332@infradead.org>
References: <cover.1601324066.git.cgoldswo@codeaurora.org>
 <afd4f52cc767115bacaeea935e1d7b6e5e7c24e8.1601324066.git.cgoldswo@codeaurora.org>
 <20200929055937.GA5332@infradead.org>
Message-ID: <3cdd6c30c062cf11eb1a7e3c47ff111e@codeaurora.org>
X-Sender: cgoldswo@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-28 22:59, Christoph Hellwig wrote:
> On Mon, Sep 28, 2020 at 01:30:27PM -0700, Chris Goldsworthy wrote:
>> CMA allocations will fail if 'pinned' pages are in a CMA area, since 
>> we
>> cannot migrate pinned pages. The _refcount of a struct page being 
>> greater
>> than _mapcount for that page can cause pinning for anonymous pages.  
>> This
>> is because try_to_unmap(), which (1) is called in the CMA allocation 
>> path,
>> and (2) decrements both _refcount and _mapcount for a page, will stop
>> unmapping a page from VMAs once the _mapcount for a page reaches 0.  
>> This
>> implies that after try_to_unmap() has finished successfully for a page
>> where _recount > _mapcount, that _refcount will be greater than 0.  
>> Later
>> in the CMA allocation path in migrate_page_move_mapping(), we will 
>> have one
>> more reference count than intended for anonymous pages, meaning the
>> allocation will fail for that page.
>> 
>> If a process ends up causing _refcount > _mapcount for a page (by 
>> either
>> incrementing _recount or decrementing _mapcount), such that the 
>> process is
>> context switched out after modifying one refcount but before modifying 
>> the
>> other, the page will be temporarily pinned.
>> 
>> One example of where _refcount can be greater than _mapcount is inside 
>> of
>> zap_pte_range(), which is called for all the entries of a PMD when a
>> process is exiting, to unmap the process's memory.  Inside of
>> zap_pte_range(), after unammping a page with page_remove_rmap(), we 
>> have
>> that _recount > _mapcount.  _refcount can only be decremented after a 
>> TLB
>> flush is performed for the page - this doesn't occur until enough 
>> pages
>> have been batched together for flushing.  The flush can either occur 
>> inside
>> of zap_pte_range() (during the same invocation or a later one), or if 
>> there
>> aren't enough pages collected by the time we unmap all of the pages in 
>> a
>> process, the flush will occur in tlb_finish_mmu() in exit_mmap().  
>> After
>> the flush has occurred, tlb_batch_pages_flush() will decrement the
>> references on the flushed pages.
>> 
>> Another such example like the above is inside of copy_one_pte(), which 
>> is
>> called during a fork. For PTEs for which pte_present(pte) == true,
>> copy_one_pte() will increment the _refcount field followed by the
>> _mapcount field of a page.
>> 
>> So, inside of cma_alloc(), add the option of letting users pass in
>> __GFP_NOFAIL to indicate that we should retry CMA allocations 
>> indefinitely,
>> in the event that alloc_contig_range() returns -EBUSY after having 
>> scanned
>> a whole CMA-region bitmap.
> 
> And who is going to use this?  AS-is this just seems to add code that
> isn't actually used and thus actually tested.  (In addition to beeing
> a relly bad idea as discussed before)

Hi Christoph,

That had slipped my mind - what we would have submitted would have been 
a modified /drivers/dma-heap/heaps/cma_heap.c, which would have created 
a "linux,cma-nofail" heap, that when allocated from, passes GFP_NOFAIL 
to cma_alloc().  But, since this retry approach (finite and infinite) 
has effectively been nacked, I've gone back to the drawing board to find 
either (1) a lock based approach to solving this (as posed by Andrew 
Morton here: https://lkml.org/lkml/2020/8/21/1490), or (2) using 
preempt_disable() calls.

Thanks,

Chris.

>> --- a/kernel/dma/contiguous.c
>> +++ b/kernel/dma/contiguous.c
>> @@ -196,7 +196,7 @@ struct page *dma_alloc_from_contiguous(struct 
>> device *dev, size_t count,
>>  	if (align > CONFIG_CMA_ALIGNMENT)
>>  		align = CONFIG_CMA_ALIGNMENT;
>> 
>> -	return cma_alloc(dev_get_cma_area(dev), count, align, no_warn);
>> +	return cma_alloc(dev_get_cma_area(dev), count, align, no_warn ? 
>> __GFP_NOWARN : 0);
> 
> Also don't add pointlessly overlong lines.

-- 
The Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
