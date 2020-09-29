Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0634827BCAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 07:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgI2F7t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 01:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgI2F7t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 01:59:49 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A42C061755;
        Mon, 28 Sep 2020 22:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=wA89tJ94QEACm+CvOa3cuLKJ/3Xp3KHmFNtmB7yxesk=; b=Kf+RX6OZg3/26s9VFgx9KQIrx+
        sydjJ9aJjJpfpF7MxAtXWM5u8gdQlxJ0wa+mvOuF3X7Oy395kkNMotLRDqmUwVc6kLnKuPuoylYWF
        SLMgndmTCGZGUHU88vlsU+GsiE6xCSHMcDBy9ptAfzI0KwBLO7OC8+14wriMf2hgL/i8k8PZa2hyc
        OtVoqqZo+bDWmczocvHKvDPWLP48vEObaWcre4d3c0UM/3eq8U0PRct3VsBWLn4J+XOaB9s3YLlla
        VWgCrRjemI2IUAIEp8B5bwJOp9Ck69tnSkZvBpq0AqNAASuXOBcwqbzCHH3g+G+ofY/Etl3ON7FuA
        LvpyZvCg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kN8fp-0001as-DI; Tue, 29 Sep 2020 05:59:37 +0000
Date:   Tue, 29 Sep 2020 06:59:37 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc:     akpm@linux-foundation.org, linux-mm@kvack.org, minchan@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        pratikp@codeaurora.org, pdaly@codeaurora.org,
        sudaraja@codeaurora.org, iamjoonsoo.kim@lge.com, david@redhat.com,
        vinmenon@codeaurora.org, minchan.kim@gmail.com
Subject: Re: [PATCH v4] mm: cma: indefinitely retry allocations in cma_alloc
Message-ID: <20200929055937.GA5332@infradead.org>
References: <cover.1601324066.git.cgoldswo@codeaurora.org>
 <afd4f52cc767115bacaeea935e1d7b6e5e7c24e8.1601324066.git.cgoldswo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afd4f52cc767115bacaeea935e1d7b6e5e7c24e8.1601324066.git.cgoldswo@codeaurora.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 28, 2020 at 01:30:27PM -0700, Chris Goldsworthy wrote:
> CMA allocations will fail if 'pinned' pages are in a CMA area, since we
> cannot migrate pinned pages. The _refcount of a struct page being greater
> than _mapcount for that page can cause pinning for anonymous pages.  This
> is because try_to_unmap(), which (1) is called in the CMA allocation path,
> and (2) decrements both _refcount and _mapcount for a page, will stop
> unmapping a page from VMAs once the _mapcount for a page reaches 0.  This
> implies that after try_to_unmap() has finished successfully for a page
> where _recount > _mapcount, that _refcount will be greater than 0.  Later
> in the CMA allocation path in migrate_page_move_mapping(), we will have one
> more reference count than intended for anonymous pages, meaning the
> allocation will fail for that page.
> 
> If a process ends up causing _refcount > _mapcount for a page (by either
> incrementing _recount or decrementing _mapcount), such that the process is
> context switched out after modifying one refcount but before modifying the
> other, the page will be temporarily pinned.
> 
> One example of where _refcount can be greater than _mapcount is inside of
> zap_pte_range(), which is called for all the entries of a PMD when a
> process is exiting, to unmap the process's memory.  Inside of
> zap_pte_range(), after unammping a page with page_remove_rmap(), we have
> that _recount > _mapcount.  _refcount can only be decremented after a TLB
> flush is performed for the page - this doesn't occur until enough pages
> have been batched together for flushing.  The flush can either occur inside
> of zap_pte_range() (during the same invocation or a later one), or if there
> aren't enough pages collected by the time we unmap all of the pages in a
> process, the flush will occur in tlb_finish_mmu() in exit_mmap().  After
> the flush has occurred, tlb_batch_pages_flush() will decrement the
> references on the flushed pages.
> 
> Another such example like the above is inside of copy_one_pte(), which is
> called during a fork. For PTEs for which pte_present(pte) == true,
> copy_one_pte() will increment the _refcount field followed by the
> _mapcount field of a page.
> 
> So, inside of cma_alloc(), add the option of letting users pass in
> __GFP_NOFAIL to indicate that we should retry CMA allocations indefinitely,
> in the event that alloc_contig_range() returns -EBUSY after having scanned
> a whole CMA-region bitmap.

And who is going to use this?  AS-is this just seems to add code that
isn't actually used and thus actually tested.  (In addition to beeing
a relly bad idea as discussed before)

> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -196,7 +196,7 @@ struct page *dma_alloc_from_contiguous(struct device *dev, size_t count,
>  	if (align > CONFIG_CMA_ALIGNMENT)
>  		align = CONFIG_CMA_ALIGNMENT;
>  
> -	return cma_alloc(dev_get_cma_area(dev), count, align, no_warn);
> +	return cma_alloc(dev_get_cma_area(dev), count, align, no_warn ? __GFP_NOWARN : 0);

Also don't add pointlessly overlong lines.
