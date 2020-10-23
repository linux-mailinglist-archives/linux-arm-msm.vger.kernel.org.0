Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF1D32969E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 08:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S375420AbgJWGsh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 02:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S375419AbgJWGsh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 02:48:37 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709D7C0613CE;
        Thu, 22 Oct 2020 23:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=D9BSERH8ih1u+6l81BXwEfO3WbdwyDqTa0foZ95ppTs=; b=Tx5in8IS3ZrlOQR1hw4rSA2ItZ
        /EtjDvxk7ZQ4p7vDOinRhe9SCX6JstnBsBix456/AOjX8q9d6aIZ/SDs0MMTWPIt7hVmr6t8xAPZb
        GjcAbtIIqDtkWWHk1ma2q1E0ZeoZo+278v82AJ8CC9Qzmp8RCKv3hIvhpn5mTfemOgesu+qqsuOLQ
        Jwxaj85RBsyL2z0/vPWznuqpNAQNrgpf95kaIQ/TSmk2ZNoBZmk5CtuuoIgOLxVEqh7BLCSKgZSms
        g32q0VgMEMAETedrJ4nXop2B4UYhGdQmOwjE2apgCNizq6HILfk5Hw2BQ9c5C8ZRgEha3/BmPB8lO
        kRD4wbGw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kVqsK-00065i-DT; Fri, 23 Oct 2020 06:48:32 +0000
Date:   Fri, 23 Oct 2020 07:48:32 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Christoph Hellwig <hch@infradead.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        iommu@lists.linux-foundation.org,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
Message-ID: <20201023064832.GA23355@infradead.org>
References: <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
 <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
 <20201007062519.GA23519@infradead.org>
 <c3baadae-8e20-86a6-44f5-4571a8d3035e@arm.com>
 <20201015065532.GA15371@infradead.org>
 <20201015153334.GF438822@phenom.ffwll.local>
 <20201015154300.GA8047@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015154300.GA8047@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 15, 2020 at 04:43:01PM +0100, Christoph Hellwig wrote:
> > Somewhat related, but is there a way to tell the dma-api to fail instead
> > of falling back to swiotlb? In many case for gpu drivers it's much better
> > if we fall back to dma_alloc_coherent and manage the copying ourselves
> > instead of abstracting this away in the dma-api. Currently that's "solved"
> > rather pessimistically by always allocating from dma_alloc_coherent if
> > swiotlb could be in the picture (at least for ttm based drivers, i915 just
> > falls over).
> 
> Is this for the alloc_pages plus manually map logic in various drivers?
> 
> They should switch to the new dma_alloc_pages API that I'll send to
> Linus for 5.10 soon.

Daniel, can you clarify this?
