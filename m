Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED924284710
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 09:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgJFHXO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 03:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgJFHXN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 03:23:13 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DF8C061755;
        Tue,  6 Oct 2020 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=LZfRYo0iMKJHueffgm2fjDYL1qbPK90x4hNzewCnXZs=; b=QkbHf2XS7gOCf6VcB4CwAg4WTX
        ZKNz9Mwa2uhEt7YTFSBhxhIxj9Ze+fqhQ908UWmw15vjNqyL+/zQFFqn5fLVvKx4AHr9HKR4foXQm
        mq15b26NFHcMPISJL6ZazHo9U5i0KmNLEB4pe6czynTOXoOB8xY0ZjRwj+4ZxYAoK+jd91Moqm9Ls
        oko46zYe78Om+J3adUAisoN/iGlvEcI5Y8yshjTzq4Eoj2soQEmYVGFD4cYIG+iEvM9UTQM1qDhlU
        ZGhgPAm5i2vLhcYF4aT/PTq5Hs5HFr7Ue6hjXpKsgkmuKzHoqX6RFO3BcL5o62MVhGnoefKJjmKYn
        9rlQRDlg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kPhJS-0003cQ-N4; Tue, 06 Oct 2020 07:23:06 +0000
Date:   Tue, 6 Oct 2020 08:23:06 +0100
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
        open list <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
Message-ID: <20201006072306.GA12834@infradead.org>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 05, 2020 at 10:35:43AM -0400, Jonathan Marek wrote:
> The cache synchronization doesn't have anything to do with IOMMU (for
> example: cache synchronization would be useful in cases where drm/msm
> doesn't use IOMMU).

It has to do with doing DMA.  And we have two frameworks for doing DMA:
either the DMA API which is for general driver use, and which as part of
the design includes cache maintainance hidden behind the concept of
ownership transfers.  And we have the much more bare bones IOMMU API.

If people want to use the "raw" IOMMU API with not cache coherent
devices we'll need a cache maintainance API that goes along with it.
It could either be formally part of the IOMMU API or be separate.

> What is needed is to call arch_sync_dma_for_{cpu,device} (which is what I
> went with initially, but then decided to re-use drm/msm's
> sync_for_{cpu,device}). But you are also saying those functions aren't for
> driver use, and I doubt IOMMU maintainers will want to add wrappers for
> these functions just to satisfy this "not for driver use" requirement.

arch_sync_dma_for_{cpu,device} are low-level helpers (and not very
great ones at that).  The definitively should not be used by drivers.
They would be very useful buildblocks for a IOMMU cache maintainance
API.

Of course the best outcome would be if we could find a way for the MSM
drm driver to just use DMA API and not deal with the lower level
abstractions.  Do you remember why the driver went for use of the IOMMU
API?
