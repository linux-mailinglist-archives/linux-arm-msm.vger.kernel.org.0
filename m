Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0028283204
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 10:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgJEI3U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 04:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbgJEI3U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 04:29:20 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E145C0613CE;
        Mon,  5 Oct 2020 01:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=kqzUKtK8GOb7bW4H3n/BFL1qICkSEHQYXjLgPEjS2CE=; b=Glk+6xlfldc5C47KvhK2HtCy16
        5q1YyA1feL1tcE7Hzba/dTGO/FxmAE2DI74IF+5jWJiiOO59aBZnRDlV8g2D9Y1FO2655hlVoQw5b
        3GWKGKcU1hQ4yqZqVolk105sJMA7jG5Fdi4BlYPhG0Kr3jv/YiyWiew4liHZYYCmLZunB1ODmTkQF
        IOK8DIAj9Pm4aePKRQdja4x/zTMTQjpl/3A5dva1fvbte/Aq8HFsnf3FTcSkp15MwLhCYSABHhomg
        r7fZkCLM89YznfPZ18GTqcE0XfvGjyoNVeQXzrX3oY6JROSZ6DYKlPxTAJzThg6XXVp3SuiT4Omre
        MlopKnsA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kPLru-0008Kj-3d; Mon, 05 Oct 2020 08:29:14 +0000
Date:   Mon, 5 Oct 2020 09:29:14 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Christoph Hellwig <hch@infradead.org>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
Message-ID: <20201005082914.GA31702@infradead.org>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 02, 2020 at 08:46:35AM -0400, Jonathan Marek wrote:
> > > +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
> > > +		size_t range_start, size_t range_end)
> > > +{
> > > +	struct msm_gem_object *msm_obj = to_msm_bo(obj);
> > > +
> > > +	/* TODO: sync only the required range, and don't invalidate on clean */
> > > +
> > > +	if (flags & MSM_GEM_SYNC_CACHE_CLEAN)
> > > +		sync_for_device(msm_obj);
> > > +
> > > +	if (flags & MSM_GEM_SYNC_CACHE_INVALIDATE)
> > > +		sync_for_cpu(msm_obj);
> > 
> > And make to these ones as well.  They are complete abuses of the DMA
> > API, and while we had to live with that for now to not cause regressions
> > they absoutely must not be exposed in a userspace ABI like this.
> > 
> 
> How do you propose that cached non-coherent memory be implemented? It is a
> useful feature for userspace.

If the driver is using the DMA API you need to use dma_alloc_noncoherent
and friends as of 5.10 (see the iommu list for the discussion).

If you use the raw IOMMU API (which I think the msm drm driver does) you
need to work with the maintainers to implement a cache synchronization
API that is not tied to the DMA API.
