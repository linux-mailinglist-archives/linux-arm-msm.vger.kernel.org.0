Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C9B2786DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Sep 2020 14:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbgIYMSZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Sep 2020 08:18:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45849 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728260AbgIYMSZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Sep 2020 08:18:25 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601036303;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=99LVqaZ2JhGw/lqukrhDTBHQBDObKyuQBXOoJJs5WVE=;
        b=iw0J3v8VSaSiPmu2W/MVhb50wPpzUrlN/H3t9s/h+cmrNJq7MhccUfzXCC95gygVUcKU2D
        DlXNJDOaeEALUEqjpFabBnVvG8Y8g8faAYTN1k/VH6ZXm6UdQ2cSSCxRVjls3dbp6II+xI
        aop3C9VDi9v1VKX7eOcTRVfHwSvzY64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-_EIA4Cf4OXmQI9REX4dcPw-1; Fri, 25 Sep 2020 08:18:20 -0400
X-MC-Unique: _EIA4Cf4OXmQI9REX4dcPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A68A81CB02;
        Fri, 25 Sep 2020 12:18:19 +0000 (UTC)
Received: from [10.36.112.211] (ovpn-112-211.ams2.redhat.com [10.36.112.211])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3036478837;
        Fri, 25 Sep 2020 12:18:16 +0000 (UTC)
Subject: Re: [PATCH v3] mm: cma: indefinitely retry allocations in cma_alloc
To:     Chris Goldsworthy <cgoldswo@codeaurora.org>,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        pratikp@codeaurora.org, pdaly@codeaurora.org,
        sudaraja@codeaurora.org, iamjoonsoo.kim@lge.com
Cc:     Vinayak Menon <vinmenon@codeaurora.org>
References: <cover.1600922611.git.cgoldswo@codeaurora.org>
 <6904d64c97ca71b14ed0548a0287162bb6fb4b7b.1600922611.git.cgoldswo@codeaurora.org>
From:   David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <566091ab-11f2-f071-6072-3c1b0f80cc4e@redhat.com>
Date:   Fri, 25 Sep 2020 14:18:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <6904d64c97ca71b14ed0548a0287162bb6fb4b7b.1600922611.git.cgoldswo@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24.09.20 07:16, Chris Goldsworthy wrote:
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
> +				continue;
> +			} else {
> +				/*
> +				 * ret == -ENOMEM - all bits in cma->bitmap are
> +				 * set, so we break accordingly.
> +				 */
> +				mutex_unlock(&cma->lock);
> +				break;
> +			}
>  		}
>  		bitmap_set(cma->bitmap, bitmap_no, bitmap_count);
>  		/*
> @@ -456,7 +479,7 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
>  		pfn = cma->base_pfn + (bitmap_no << cma->order_per_bit);
>  		mutex_lock(&cma_mutex);
>  		ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA,
> -				     GFP_KERNEL | (no_warn ? __GFP_NOWARN : 0));
> +				     GFP_KERNEL | (gfp_mask & __GFP_NOWARN));

Right, we definetly don't want to pass the flag further down.

Alternative would be cma_alloc_nofail(). That helps avoid people passing
 stuff like GFP_USER and wondering why it doesn't have an effect.

-- 
Thanks,

David / dhildenb

