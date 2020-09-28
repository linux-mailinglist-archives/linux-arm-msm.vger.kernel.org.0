Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10BE27A8D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 09:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgI1HjU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 03:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgI1HjU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 03:39:20 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC06C0613CE;
        Mon, 28 Sep 2020 00:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=hqkx8jeEj++yCvhNy1iXe80ijlnH1MK0e5LKjgnXTCY=; b=vEz9VsuLO+XrX52MGpk4MZGAqG
        YW/LJ9w04opOx+0057JpZsIG1B852u+NILq642TWBciFNMEsoJNI6P0pM2qLTdsILQZQnSjapOgSq
        MQYAagaBgjIZVVCaHPU9kKg1qAU82R6Ki5rv9lLZMtJII24mdc4oYd2gBjokDJ0Mb9T8xK8Ni2PFr
        mpqpRLyHftzZxMtE6jZFc2UrhjvgrhjgVvgFNqyi4Y7wSMlzYX+mKWX2ydKCW98oAqwRqfMZjmMHZ
        PRy5/TdKduM6cYjXrTLFLhmJz8B028n0DxgIrpjBbazjtRjS2bd6KXC2mUYpEcqMt1mcbOp8DYYBW
        d5ITwp4A==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kMnkZ-00088p-6o; Mon, 28 Sep 2020 07:39:07 +0000
Date:   Mon, 28 Sep 2020 08:39:07 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     Chris Goldsworthy <cgoldswo@codeaurora.org>,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        pratikp@codeaurora.org, pdaly@codeaurora.org,
        sudraja@codeaurora.org, iamjoonsoo.kim@lge.com,
        linux-arm-msm-owner@vger.kernel.org,
        Vinayak Menon <vinmenon@codeaurora.org>,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH v2] mm: cma: indefinitely retry allocations in cma_alloc
Message-ID: <20200928073907.GA29322@infradead.org>
References: <06489716814387e7f147cf53d1b185a8@codeaurora.org>
 <1599851809-4342-1-git-send-email-cgoldswo@codeaurora.org>
 <010101747e998731-e49f209f-8232-4496-a9fc-2465334e70d7-000000@us-west-2.amazonses.com>
 <a4bdda08-9e2a-4862-00a3-72d4c90e82c7@redhat.com>
 <72ae0f361df527cf70946992e4ab1eb3@codeaurora.org>
 <a3d62a77-4c4f-e86c-de6d-5222c2a747e0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3d62a77-4c4f-e86c-de6d-5222c2a747e0@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 15, 2020 at 09:53:30AM +0200, David Hildenbrand wrote:
> Two thoughts:
> 
> 1. Most (all?) alloc_contig_range() users are interested in handling
> short-term pinnings in a nice way (IOW, make the allocation succeed).
> I'd much rather want to see this being handled in a nice fashion inside
> alloc_contig_range() than having to encode endless loops in the caller.
> This means I strongly prefer something like [3] if feasible. But I can
> understand that stuff ([5]) is complicated. I have to admit that I am
> not an expert on the short term pinning described by you, and how to
> eventually fix it.

Agreed.  Also retrying forever is simply broken, and will lead to
deadlocks for the DMA calls into CMA, so with my dma-mapping hat on
I have to hard-NAK this approach.
