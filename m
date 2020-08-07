Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF9F523E584
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 03:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbgHGBbn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 21:31:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:46892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbgHGBbn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 21:31:43 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63A292075A;
        Fri,  7 Aug 2020 01:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596763902;
        bh=KikFKrxPdlMuyXaFyfeVCmhJS242GxglL7oAilNZm7o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=n9KoeYEGT00hSajaoYWncupWY0N84Cxu6QQXrdDYJoTCpNakq8Cl3AwEN5okeUjgz
         ozs3r9FbcsZTcdsNXLZDR+BG0kvX/SCGAcSVmUHw35NS4MzUnRd95pPVjlxZuTInOq
         +x9zqXhUYwa7KsWgjBuvTpjOjIQKtQlv8Go84hF0=
Date:   Thu, 6 Aug 2020 18:31:41 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc:     linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pratikp@codeaurora.org,
        pdaly@codeaurora.org, sudraja@codeaurora.org,
        iamjoonsoo.kim@lge.com
Subject: Re: cma_alloc(), add sleep-and-retry for temporary page pinning
Message-Id: <20200806183141.14a4fb8d210d3bdec68e1e7f@linux-foundation.org>
In-Reply-To: <1596682582-29139-1-git-send-email-cgoldswo@codeaurora.org>
References: <1596682582-29139-1-git-send-email-cgoldswo@codeaurora.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed,  5 Aug 2020 19:56:21 -0700 Chris Goldsworthy <cgoldswo@codeaurora.org> wrote:

> On mobile devices, failure to allocate from a CMA area constitutes a
> functional failure.  Sometimes during CMA allocations, we have observed
> that pages in a CMA area allocated through alloc_pages(), that we're trying
> to migrate away to make room for a CMA allocation, are temporarily pinned.
> This temporary pinning can occur when a process that owns the pinned page
> is being forked (the example is explained further in the commit text).
> This patch addresses this issue by adding a sleep-and-retry loop in
> cma_alloc() . There's another example we know of similar to the above that
> occurs during exit_mmap() (in zap_pte_range() specifically), but I need to
> determine if this is still relevant today.

Sounds fairly serious but boy, we're late for 5.9.

I can queue it for 5.10 with a cc:stable so that it gets backported
into earlier kernels a couple of months from now, if we think the
seriousness justifies backporting(?). 

Or I can do something else - thoughts?

And...  it really is a sad little patch, isn't it?  Instead of fixing
the problem, it reduces the problem's probability by 5x.  Can't we do
better than this?


