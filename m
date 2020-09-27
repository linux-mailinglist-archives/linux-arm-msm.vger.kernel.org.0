Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98FD27A28A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Sep 2020 21:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgI0TXm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Sep 2020 15:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgI0TXm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Sep 2020 15:23:42 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A62CC0613CE;
        Sun, 27 Sep 2020 12:23:42 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n14so7304237pff.6;
        Sun, 27 Sep 2020 12:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u2VujvViCPW9bQl3M4Hw73kIcsiw+qE84774Rc6ZPDE=;
        b=HW0OCuY+UHhken3tkWaGdJotz2CyjZ1EMsyXqO+kLYRM2Sdw3TMQx1l9h0eeKmJBNr
         4xcgqZGCVZQ7SvNKpxAStuvvW/WRufImJ/K47nYGWs8LhmgYtKMSuPD+7UKpMrjX2xnE
         gTCq/tl0hSY/ivAPjlwMEavmO5PTZGl5O96pknLu+/EfJ26jg/EjEc/K24+gi/AK8OPc
         Ktjg3xF6AB8kZOSI2PKREyks59s6mSiOjh1kDbUuJyGyjCmisxpINWTg/83UOBnEvH72
         HqTNwqD+XIkNkCzc44zLzfD7xkQxETHlJisdrRWRBtNjTyny30N4h4hnBiNU6GIHxZ+D
         rAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=u2VujvViCPW9bQl3M4Hw73kIcsiw+qE84774Rc6ZPDE=;
        b=G6x1ZWU/4BoPBd/ztPdQi9s9BWfzT02dBRhx8aq30u5hVmo5Ub6F0jUN4bcae+YLQZ
         G3sUfl18Xm+NOD5RQ1nUIV9/CcljytvhCu1EXZvFaR7deUE+sXuiAzrM/9sUxnNPiF7K
         0A2Vp3v4phUPdzMGOI/QiPzGSswR+ju8MV6zV3HRxjllPbHJI0gkxm+OTjy/xQoduRfu
         kHJMNnDK198dg3zy/ydrXF4666khTYtaMiEgdVNmsATi8dgq2D9s/33RmMoUjNbUOHro
         rXbN+gHzTs4CdwXNy3EhsTG87s4HS8+AV3Vs0RiCz31GfgKybRWNbzdxt2sLWj0IZYcr
         Z93g==
X-Gm-Message-State: AOAM5326GaT2XYnx1KgQB9RWCkUQ6FJsTf4oEgP+033XVEUbKd4CdsDn
        p7R6/nCAosXvYYJtKl5wvCw=
X-Google-Smtp-Source: ABdhPJy/PHrccNNBR8Sl9h+/EYYjW/AIhm1SrINMF1kgpZjkA1QFxyi4zQDT5sr7QcR2zfFvTO5xfg==
X-Received: by 2002:a17:902:a403:b029:d2:6379:a9a6 with SMTP id p3-20020a170902a403b02900d26379a9a6mr8318570plq.68.1601234621597;
        Sun, 27 Sep 2020 12:23:41 -0700 (PDT)
Received: from google.com ([2620:15c:211:1:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id f19sm8039968pfj.25.2020.09.27.12.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 12:23:40 -0700 (PDT)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Sun, 27 Sep 2020 12:23:38 -0700
From:   Minchan Kim <minchan@kernel.org>
To:     Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc:     akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        pratikp@codeaurora.org, pdaly@codeaurora.org,
        sudaraja@codeaurora.org, iamjoonsoo.kim@lge.com, david@redhat.com,
        Vinayak Menon <vinmenon@codeaurora.org>
Subject: Re: [PATCH v3] mm: cma: indefinitely retry allocations in cma_alloc
Message-ID: <20200927192338.GA2593886@google.com>
References: <cover.1600922611.git.cgoldswo@codeaurora.org>
 <6904d64c97ca71b14ed0548a0287162bb6fb4b7b.1600922611.git.cgoldswo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6904d64c97ca71b14ed0548a0287162bb6fb4b7b.1600922611.git.cgoldswo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 23, 2020 at 10:16:25PM -0700, Chris Goldsworthy wrote:
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
> 
> Signed-off-by: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Co-developed-by: Vinayak Menon <vinmenon@codeaurora.org>
> Signed-off-by: Vinayak Menon <vinmenon@codeaurora.org>
> ---
>  arch/powerpc/kvm/book3s_hv_builtin.c       |  2 +-
>  drivers/dma-buf/heaps/cma_heap.c           |  2 +-
>  drivers/s390/char/vmcp.c                   |  2 +-
>  drivers/staging/android/ion/ion_cma_heap.c |  2 +-
>  include/linux/cma.h                        |  2 +-
>  kernel/dma/contiguous.c                    |  4 ++--
>  mm/Kconfig                                 | 11 ++++++++++
>  mm/cma.c                                   | 35 +++++++++++++++++++++++++-----
>  mm/cma_debug.c                             |  2 +-
>  mm/hugetlb.c                               |  4 ++--
>  10 files changed, 50 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
> index 073617c..21c3f6a 100644
> --- a/arch/powerpc/kvm/book3s_hv_builtin.c
> +++ b/arch/powerpc/kvm/book3s_hv_builtin.c
> @@ -74,7 +74,7 @@ struct page *kvm_alloc_hpt_cma(unsigned long nr_pages)
>  	VM_BUG_ON(order_base_2(nr_pages) < KVM_CMA_CHUNK_ORDER - PAGE_SHIFT);
>  
>  	return cma_alloc(kvm_cma, nr_pages, order_base_2(HPT_ALIGN_PAGES),
> -			 false);
> +			 0);
>  }
>  EXPORT_SYMBOL_GPL(kvm_alloc_hpt_cma);
>  
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index 626cf7f..7657359 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -66,7 +66,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
>  	helper_buffer->heap = heap;
>  	helper_buffer->size = len;
>  
> -	cma_pages = cma_alloc(cma_heap->cma, nr_pages, align, false);
> +	cma_pages = cma_alloc(cma_heap->cma, nr_pages, align, 0);
>  	if (!cma_pages)
>  		goto free_buf;
>  
> diff --git a/drivers/s390/char/vmcp.c b/drivers/s390/char/vmcp.c
> index 9e06628..11c4e3b 100644
> --- a/drivers/s390/char/vmcp.c
> +++ b/drivers/s390/char/vmcp.c
> @@ -70,7 +70,7 @@ static void vmcp_response_alloc(struct vmcp_session *session)
>  	 * anymore the system won't work anyway.
>  	 */
>  	if (order > 2)
> -		page = cma_alloc(vmcp_cma, nr_pages, 0, false);
> +		page = cma_alloc(vmcp_cma, nr_pages, 0, 0);
>  	if (page) {
>  		session->response = (char *)page_to_phys(page);
>  		session->cma_alloc = 1;
> diff --git a/drivers/staging/android/ion/ion_cma_heap.c b/drivers/staging/android/ion/ion_cma_heap.c
> index bf65e67..128d3a5 100644
> --- a/drivers/staging/android/ion/ion_cma_heap.c
> +++ b/drivers/staging/android/ion/ion_cma_heap.c
> @@ -39,7 +39,7 @@ static int ion_cma_allocate(struct ion_heap *heap, struct ion_buffer *buffer,
>  	if (align > CONFIG_CMA_ALIGNMENT)
>  		align = CONFIG_CMA_ALIGNMENT;
>  
> -	pages = cma_alloc(cma_heap->cma, nr_pages, align, false);
> +	pages = cma_alloc(cma_heap->cma, nr_pages, align, 0);
>  	if (!pages)
>  		return -ENOMEM;
>  
> diff --git a/include/linux/cma.h b/include/linux/cma.h
> index 6ff79fe..2bd8544 100644
> --- a/include/linux/cma.h
> +++ b/include/linux/cma.h
> @@ -43,7 +43,7 @@ extern int cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
>  					const char *name,
>  					struct cma **res_cma);
>  extern struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
> -			      bool no_warn);
> +			      gfp_t gfp_mask);
>  extern bool cma_release(struct cma *cma, const struct page *pages, unsigned int count);
>  
>  extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data);
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index cff7e60..55c62b2 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -196,7 +196,7 @@ struct page *dma_alloc_from_contiguous(struct device *dev, size_t count,
>  	if (align > CONFIG_CMA_ALIGNMENT)
>  		align = CONFIG_CMA_ALIGNMENT;
>  
> -	return cma_alloc(dev_get_cma_area(dev), count, align, no_warn);
> +	return cma_alloc(dev_get_cma_area(dev), count, align, no_warn ? __GFP_NOWARN : 0);
>  }
>  
>  /**
> @@ -219,7 +219,7 @@ static struct page *cma_alloc_aligned(struct cma *cma, size_t size, gfp_t gfp)
>  {
>  	unsigned int align = min(get_order(size), CONFIG_CMA_ALIGNMENT);
>  
> -	return cma_alloc(cma, size >> PAGE_SHIFT, align, gfp & __GFP_NOWARN);
> +	return cma_alloc(cma, size >> PAGE_SHIFT, align, gfp);
>  }
>  
>  /**
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 6c97488..83a5135 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -524,6 +524,17 @@ config CMA_AREAS
>  
>  	  If unsure, leave the default value "7".
>  
> +config CMA_RETRY_SLEEP_DURATION
> +	int "Sleep duration between retries"
> +	depends on CMA
> +	default 100
> +	help
> +	  Time to sleep for in milliseconds between the indefinite
> +	  retries of a CMA allocation that are induced by passing
> +	  __GFP_NOFAIL to cma_alloc().
> +
> +	  If unsure, leave the value as "100".

What's the point of this new config? If we need it, How could admin set their value?
How does it make bad if we just use simple default vaule?
IOW, I'd like to avoid introducing new config if we don't see good
justifcation.

> +
>  config MEM_SOFT_DIRTY
>  	bool "Track memory changes"
>  	depends on CHECKPOINT_RESTORE && HAVE_ARCH_SOFT_DIRTY && PROC_FS
> diff --git a/mm/cma.c b/mm/cma.c
> index 7f415d7..4fbad2b 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -32,6 +32,7 @@
>  #include <linux/highmem.h>
>  #include <linux/io.h>
>  #include <linux/kmemleak.h>
> +#include <linux/delay.h>
>  #include <trace/events/cma.h>
>  
>  #include "cma.h"
> @@ -403,13 +404,15 @@ static inline void cma_debug_show_areas(struct cma *cma) { }
>   * @cma:   Contiguous memory region for which the allocation is performed.
>   * @count: Requested number of pages.
>   * @align: Requested alignment of pages (in PAGE_SIZE order).
> - * @no_warn: Avoid printing message about failed allocation
> + * @gfp_mask: If __GFP_NOWARN is passed, suppress messages about failed
> + *	      allocations. If __GFP_NOFAIL is passed, try doing the CMA
> + *	      allocation indefinitely until the allocation succeeds.
>   *
>   * This function allocates part of contiguous memory on specific
>   * contiguous memory area.
>   */
>  struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
> -		       bool no_warn)
> +		       gfp_t gfp_mask)
>  {
>  	unsigned long mask, offset;
>  	unsigned long pfn = -1;
> @@ -442,8 +445,28 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
>  				bitmap_maxno, start, bitmap_count, mask,
>  				offset);
>  		if (bitmap_no >= bitmap_maxno) {
> -			mutex_unlock(&cma->lock);
> -			break;
> +			if (ret == -EBUSY && gfp_mask & __GFP_NOFAIL) {
> +				mutex_unlock(&cma->lock);
> +
> +				/*
> +				 * Page may be momentarily pinned by some other
> +				 * process which has been scheduled out, e.g.
> +				 * in exit path, during unmap call, or process
> +				 * fork and so cannot be freed there. Sleep
> +				 * for 100ms and retry the allocation.
> +				 */
> +				start = 0;
> +				ret = -ENOMEM;
> +				msleep(CONFIG_CMA_RETRY_SLEEP_DURATION);

Should it be uninterruptible, really?
