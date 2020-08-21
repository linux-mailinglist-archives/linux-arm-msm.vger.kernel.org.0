Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1297C24E2EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Aug 2020 00:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgHUWBp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 18:01:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:37208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726731AbgHUWBo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 18:01:44 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95B9D207C3;
        Fri, 21 Aug 2020 22:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598047304;
        bh=aq7qmIMUGdMaoUlA+6jQpfeWcG91tpxIXFUSsaIi1FU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=yQNLm87wvpu/PSjqkUXCuyDFfqEx5vmk96zjhAzeD2wDj86JlCP+M142C36DgZQkP
         pvwYdh0H9KVArGe0M6Ah0Rd8+GCxjWa9LNEE+BeYyaOuaPAENds6qAanbnF/rZP3Kv
         vcsfzrgfrj5bsVjBAnLSE9AsG9/HbFjoj11LyXIc=
Date:   Fri, 21 Aug 2020 15:01:43 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     cgoldswo@codeaurora.org
Cc:     linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pratikp@codeaurora.org,
        pdaly@codeaurora.org, sudraja@codeaurora.org,
        iamjoonsoo.kim@lge.com, linux-arm-msm-owner@vger.kernel.org
Subject: Re: cma_alloc(), add sleep-and-retry for temporary page pinning
Message-Id: <20200821150143.8a8645b3fabc11016311b78d@linux-foundation.org>
In-Reply-To: <896f92e8c37936e7cb2914e79273e9e8@codeaurora.org>
References: <896f92e8c37936e7cb2914e79273e9e8@codeaurora.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 11 Aug 2020 15:20:47 -0700 cgoldswo@codeaurora.org wrote:

> On 2020-08-06 18:31, Andrew Morton wrote:
> > On Wed,  5 Aug 2020 19:56:21 -0700 Chris Goldsworthy
> > <cgoldswo@codeaurora.org> wrote:
> > 
> >> On mobile devices, failure to allocate from a CMA area constitutes a
> >> functional failure.  Sometimes during CMA allocations, we have 
> >> observed
> >> that pages in a CMA area allocated through alloc_pages(), that we're 
> >> trying
> >> to migrate away to make room for a CMA allocation, are temporarily 
> >> pinned.
> >> This temporary pinning can occur when a process that owns the pinned 
> >> page
> >> is being forked (the example is explained further in the commit text).
> >> This patch addresses this issue by adding a sleep-and-retry loop in
> >> cma_alloc() . There's another example we know of similar to the above 
> >> that
> >> occurs during exit_mmap() (in zap_pte_range() specifically), but I 
> >> need to
> >> determine if this is still relevant today.
> > 
> 
> > Sounds fairly serious but boy, we're late for 5.9.
> > 
> > I can queue it for 5.10 with a cc:stable so that it gets backported
> > into earlier kernels a couple of months from now, if we think the
> > seriousness justifies backporting(?).
> > 
> 
> Queuing this seems like the best way to proceed

I'd really prefer not.  It's very hacky and it isn't a fix - it's a
likelihood-reducer.

> > 
> > And...  it really is a sad little patch, isn't it?  Instead of fixing
> > the problem, it reduces the problem's probability by 5x.  Can't we do
> > better than this?
> 
> I have one alternative in mind.  I have been able to review the 
> exit_mmap()
> case, so before proceeding, let's do a breakdown of the problem: we can
> categorize the pinning issue we're trying to address here as being one 
> of
> (1) incrementing _refcount and getting context-switched out before
> incrementing _mapcount (applies to forking a process / copy_one_pte()), 
> and
> (2) decrementing _mapcount and getting context-switched out before
> decrementing _refcount (applies to tearing down a process / 
> exit_mmap()).
> So, one alternative would be to insert preempt_disable/enable() calls at
> affected sites. So, for the copy_one_pte() pinning case, we could do the
> following inside of copy_one_pte():
> 
>          if (page) {
> +               preempt_disable();
>                  get_page(page);
>                  page_dup_rmap(page, false);
> +               preempt_enable();
>                  rss[mm_counter(page)]++;
>          }

This would make the retry loop much more reliable, and
preempt_disable() is fast.  Such additions should be clearly commented
(a bare preempt_disable() explains nothing).  Perhaps by wrapping the
prerempt_disable() in a suitably-named wrapper function.

But it's still really unpleasant.

> 
> The good thing about this patch is that it has been stable in our kernel
> for four years (though for some SoCs we increased the retry counts).  

That's discouraging!

> One
> thing to stress is that there are other instances of CMA page pinning, 
> that
> this patch isn't attempting to address.

Oh.  How severe are these?

> Please let me know if you're 
> okay
> with queuing this for the 5.10 merge window - if you are, I can add an
> option to configure the number of retries, and will resend the patch 
> once
> the 5.9 merge window closes.

Well.  Why not wait infinitely?  Because there are other sources of CMA
page pinning, I guess.


Could we take a sleeping lock on the exit_mmap() path and on the
migration path?  So that the migration path automatically waits for
the exact amount of time?
