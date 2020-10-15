Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1B028ED43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 08:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729462AbgJOGzh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 02:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgJOGzh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 02:55:37 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D338C061755;
        Wed, 14 Oct 2020 23:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=1vZhw/JrbB2T8GVpb8VuLYmLoPDb9JW5DiEoY3ZRNZg=; b=Fycf1JgekT0YbewfwlGQNRxEiq
        pJjRTzJhLS2LSjjnsUqAEHFvAs/UjhL1lG9jsBd3BRTuTCNFToaNXo2Jz84l6buTUGtzQU8nrm/eS
        CzQz4jTRPnPfl6blS+u/Oj+MCPFeCSsHgXEXjatO5/9CZiNqsLLyVUT9J8ASYh/VhLRkC5XOs/XhU
        VZVovGpVYzsa6HeIWVSq3wwywNKJXx4TCv86aLhltul6lPWtqHfE3yGQGewNXjPK9o4VGbk6tZaVk
        qnOgou5uPSrnmd8aow5y9SZoBcJEqRePqY2hkKbPUtKsr1abESVw4BjKI+PENYB37As7agZTH6gkH
        /Tfpr9xg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kSxAi-0004Aa-6Z; Thu, 15 Oct 2020 06:55:32 +0000
Date:   Thu, 15 Oct 2020 07:55:32 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
Message-ID: <20201015065532.GA15371@infradead.org>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
 <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
 <20201007062519.GA23519@infradead.org>
 <c3baadae-8e20-86a6-44f5-4571a8d3035e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3baadae-8e20-86a6-44f5-4571a8d3035e@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 13, 2020 at 02:42:38PM +0100, Robin Murphy wrote:
> I still think this situation would be best handled with a variant of
> dma_ops_bypass that also guarantees to bypass SWIOTLB, and can be set
> automatically when attaching to an unmanaged IOMMU domain.

dma_ops_bypass should mostly do the right thing as-is.  swiotlb bouncing
is triggered of two things:

 1) the dma_mask.  This is under control of the driver, and obviously
    if it is too small for a legit reason we can't just proceed
 2) force_dma_unencrypted() - we'd need to do an opt-out here, either
    by a flag or by being smart and looking for an attached iommu on
    the device

> That way the
> device driver can make DMA API calls in the appropriate places that do the
> right thing either way, and only needs logic to decide whether to use the
> returned DMA addresses directly or ignore them if it knows they're
> overridden by its own IOMMU mapping.

I'd be happy to review patches for this.
