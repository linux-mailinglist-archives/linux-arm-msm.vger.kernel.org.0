Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC84268866
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 11:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgINJbk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 05:31:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48646 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726278AbgINJbj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 05:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600075897;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=KC4dOXf7VZaZsdTy2uDpr2jiYmI14gbjeyDc6PEbm8Y=;
        b=iPjRcOLsdoDlpBTXmhdbp16byW4KW6t5Wwzv6CPyJ2o61iEGDlrsTQtWDaig8HEltJmtot
        zp/qWznjoR39cGR62iUVJd8VCvk1hEcsaG074U+T5yT492pT4Ne7sfJcdBQ6yU8tiNXX+0
        ATKyIgwBaKQaISJOsssr5KlXz4oFZEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-n1VGXgdVP0mLvQD--89XHQ-1; Mon, 14 Sep 2020 05:31:33 -0400
X-MC-Unique: n1VGXgdVP0mLvQD--89XHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A4541882FA1;
        Mon, 14 Sep 2020 09:31:31 +0000 (UTC)
Received: from [10.36.114.162] (ovpn-114-162.ams2.redhat.com [10.36.114.162])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C63585DA60;
        Mon, 14 Sep 2020 09:31:24 +0000 (UTC)
Subject: Re: [PATCH v2] mm: cma: indefinitely retry allocations in cma_alloc
To:     Chris Goldsworthy <cgoldswo@codeaurora.org>,
        akpm@linux-foundation.org
Cc:     linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pratikp@codeaurora.org,
        pdaly@codeaurora.org, sudraja@codeaurora.org,
        iamjoonsoo.kim@lge.com, linux-arm-msm-owner@vger.kernel.org,
        Vinayak Menon <vinmenon@codeaurora.org>
References: <06489716814387e7f147cf53d1b185a8@codeaurora.org>
 <1599851809-4342-1-git-send-email-cgoldswo@codeaurora.org>
 <010101747e998731-e49f209f-8232-4496-a9fc-2465334e70d7-000000@us-west-2.amazonses.com>
From:   David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <a4bdda08-9e2a-4862-00a3-72d4c90e82c7@redhat.com>
Date:   Mon, 14 Sep 2020 11:31:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <010101747e998731-e49f209f-8232-4496-a9fc-2465334e70d7-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11.09.20 21:17, Chris Goldsworthy wrote:
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
> One example of where _refcount can be greater than _mapcount for a page we
> would not expect to be pinned is inside of copy_one_pte(), which is called
> during a fork. For ptes for which pte_present(pte) == true, copy_one_pte()
> will increment the _refcount field followed by the  _mapcount field of a
> page. If the process doing copy_one_pte() is context switched out after
> incrementing _refcount but before incrementing _mapcount, then the page
> will be temporarily pinned.
> 
> So, inside of cma_alloc(), instead of giving up when alloc_contig_range()
> returns -EBUSY after having scanned a whole CMA-region bitmap, perform
> retries indefinitely, with sleeps, to give the system an opportunity to
> unpin any pinned pages.
> 
> Signed-off-by: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Co-developed-by: Vinayak Menon <vinmenon@codeaurora.org>
> Signed-off-by: Vinayak Menon <vinmenon@codeaurora.org>
> ---
>  mm/cma.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/cma.c b/mm/cma.c
> index 7f415d7..90bb505 100644
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
> @@ -442,8 +443,28 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
>  				bitmap_maxno, start, bitmap_count, mask,
>  				offset);
>  		if (bitmap_no >= bitmap_maxno) {
> -			mutex_unlock(&cma->lock);
> -			break;
> +			if (ret == -EBUSY) {
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
> +				msleep(100);
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
> 

What about long-term pinnings? IIRC, that can happen easily e.g., with
vfio (and I remember there is a way via vmsplice).

Not convinced trying forever is a sane approach in the general case ...

-- 
Thanks,

David / dhildenb

