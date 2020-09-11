Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D022B266855
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 20:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgIKSj1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 14:39:27 -0400
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:56160
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725730AbgIKSjQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 14:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599849555;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=Sv2xGbuKe4nXUJuewGpIJiCbWHq+eGMdmjxqVnN6RH4=;
        b=Pylixs/4vMx0XVVWj8d2tpxixLGmlIf2Hysk/9MtbTuv8rJChntSzQo66GO6glZ5
        CDw/hPqZY+IyttTz5AcHGTnJq13JbljlNK2p8kdlLXuZRUyCrg9gwSLgQGjdCAUDNQl
        1tBq4BA+/L7JVe/K1jWsfdva/YGaCGGhz7pWdhg4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599849555;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=Sv2xGbuKe4nXUJuewGpIJiCbWHq+eGMdmjxqVnN6RH4=;
        b=PD4VCx0Ry4AZ6YoIgupLs+RURhEnE4joXzu1JdZ19mK0KQ0UdLmEMFIWMVcOe4G/
        3hqtq3GoRk2iJEgzQh/3spY7WLetqyPN2MZwNGDgPdwXZRRjfxNbmYQafvpk0XvCeqt
        Mu9V/kxz/GkKpFcKe+3B98GVLdN+z4qVauhbFerg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Sep 2020 18:39:15 +0000
From:   Chris Goldsworthy <cgoldswo@codeaurora.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pratikp@codeaurora.org,
        pdaly@codeaurora.org, sudraja@codeaurora.org,
        iamjoonsoo.kim@lge.com, linux-arm-msm-owner@vger.kernel.org
Subject: Re: cma_alloc(), add sleep-and-retry for temporary page pinning
In-Reply-To: <20200821150143.8a8645b3fabc11016311b78d@linux-foundation.org>
References: <896f92e8c37936e7cb2914e79273e9e8@codeaurora.org>
 <20200821150143.8a8645b3fabc11016311b78d@linux-foundation.org>
Message-ID: <010101747e76e663-8b0bd953-38fa-4348-957c-d890ce1a00b9-000000@us-west-2.amazonses.com>
X-Sender: cgoldswo@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-21 15:01, Andrew Morton wrote:
> On Tue, 11 Aug 2020 15:20:47 -0700 cgoldswo@codeaurora.org wrote:
> 
>> One
>> thing to stress is that there are other instances of CMA page pinning,
>> that
>> this patch isn't attempting to address.
> 
> Oh.  How severe are these?

Hey Andrew,

   - get_user_pages() will pin pages (I think that's a 100% guarantee but 
I'd need to double check that). There isn't a workaround for this as far 
as I know.
   - One issue we've encountered is when the pages for buffer heads are 
stuck on an LRU list (see the call to buffer_busy() in drop_buffers() 
https://elixir.bootlin.com/linux/v5.8.8/source/fs/buffer.c#L3225). We 
deal with this by allowing the buffers to be dropped, if the reason 
buffer_busy() returns true is because the page is on an LRU list.

> Well.  Why not wait infinitely?  Because there are other sources of CMA
> page pinning, I guess.
> 
> Could we take a sleeping lock on the exit_mmap() path and on the
> migration path?  So that the migration path automatically waits for
> the exact amount of time?

Retrying indefinitely whilst alloc_contig_range() returns -EBUSY is 
actually a viable approach.  From the perspective of how long it takes 
to perform a CMA allocation, it is preferable compared to the lock-based 
method, in terms of how long it would take to do a CMA allocation.  With 
our current method, we attempt allocations across an entire CMA region 
before sleeping and retrying. With the lock-based method, we'd be 
sleeping on a per-page basis - this could lead to a situation where we 
spend a great deal of time waiting for a particular page A to be freed, 
that lies in the subset of the CMA region we're allocating form.  We 
could have instead given up on allocating that subset of the CMA region 
(because page A is pinned), and have moved on to a different subset of 
the CMA region, and have successfully allocated that subset, whilst page 
A is still pinned.

I have a patch ready that does this indefinite-retrying, that will be 
sent in reply to this e-mail.

Regards,

Chris.

--
The Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
Forum,
a Linux Foundation Collaborative Project
