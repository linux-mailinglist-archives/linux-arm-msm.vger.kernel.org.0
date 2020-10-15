Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41F7728F607
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 17:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731061AbgJOPnH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 11:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730957AbgJOPnH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 11:43:07 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC98C061755;
        Thu, 15 Oct 2020 08:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=UfF27sEhMEzOUuKtPSUEIOacG1Uky8VuZ8tGa3014PI=; b=qiOxssgQW83wNoO58DAw8tk3KM
        6/ParIJvMZcFbEexanutV1KdiUSZOc3afV+2l385wIqUCM9Bql2GiliQ7M12ViBDqRZMTv6GsgZ7i
        syWH7IiNDdCFjYdl9rmUk42ULFbtRTpf1BD1qC0MndqdpcL7hGW1qoHq9gVSH0A/HOkXMSTlwbcGf
        PjGyBfbQF5bpNnaIkY8JQWQiX1CW8OPnbXw5euPHZvPN/fnOYCHsTQ2Kpoq6UaDpavzkVc5nbMwFX
        GMHLA0c5pnv6/tjJra+LzV/VR7fzT+gd0EZL7JkRykOuyDTrvSIR6OOM8r+VjfPdu6RWp2HQ/8yDh
        ebdqRieQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kT5PA-00027N-RG; Thu, 15 Oct 2020 15:43:00 +0000
Date:   Thu, 15 Oct 2020 16:43:00 +0100
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
Message-ID: <20201015154300.GA8047@infradead.org>
References: <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
 <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
 <20201007062519.GA23519@infradead.org>
 <c3baadae-8e20-86a6-44f5-4571a8d3035e@arm.com>
 <20201015065532.GA15371@infradead.org>
 <20201015153334.GF438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015153334.GF438822@phenom.ffwll.local>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 15, 2020 at 05:33:34PM +0200, Daniel Vetter wrote:
> On Thu, Oct 15, 2020 at 07:55:32AM +0100, Christoph Hellwig wrote:
> > On Tue, Oct 13, 2020 at 02:42:38PM +0100, Robin Murphy wrote:
> > > I still think this situation would be best handled with a variant of
> > > dma_ops_bypass that also guarantees to bypass SWIOTLB, and can be set
> > > automatically when attaching to an unmanaged IOMMU domain.
> > 
> > dma_ops_bypass should mostly do the right thing as-is.  swiotlb bouncing
> > is triggered of two things:
> > 
> >  1) the dma_mask.  This is under control of the driver, and obviously
> >     if it is too small for a legit reason we can't just proceed
> 
> Somewhat related, but is there a way to tell the dma-api to fail instead
> of falling back to swiotlb? In many case for gpu drivers it's much better
> if we fall back to dma_alloc_coherent and manage the copying ourselves
> instead of abstracting this away in the dma-api. Currently that's "solved"
> rather pessimistically by always allocating from dma_alloc_coherent if
> swiotlb could be in the picture (at least for ttm based drivers, i915 just
> falls over).

Is this for the alloc_pages plus manually map logic in various drivers?

They should switch to the new dma_alloc_pages API that I'll send to
Linus for 5.10 soon.
