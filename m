Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A1528589A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 08:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgJGGZ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Oct 2020 02:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgJGGZZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Oct 2020 02:25:25 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB8CC061755;
        Tue,  6 Oct 2020 23:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=hGY4fKBH3lXrbLnK7loOw4AUvRukRocZITr25lF2ycI=; b=PNf5g8627c2NOMQqhvL0eUPUY9
        pG18AoTA0MELpyOL/b9ay/ykTBDatHDGS3jlfCwIic9g3kmcO8E6ny88Ao5zGscnjagnX/WHNFZM5
        eZ2NTCUXNprEyCfiCQ/EGzyj6MxRlkn48EyhjY9cX/mqtGmGzUcF/05YoWWqOT3az/7lCzZyLl22/
        JnPVX/l/zI1jAPk8897xZBq8Pfmxbi5IX6xg+uZiAsB6ckYTKIB56aoRVnPqszsGMjoVPJQUTNCy1
        9FlS3lHhBHqvrySZFyfKyRFMIWGkyvr72addRKiyZPfjxgqJLXANCq04HlVz81s002Ig6I9P5Ekbx
        glO7NLFQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kQ2t5-0006Rp-Uy; Wed, 07 Oct 2020 06:25:19 +0000
Date:   Wed, 7 Oct 2020 07:25:19 +0100
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
Message-ID: <20201007062519.GA23519@infradead.org>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
 <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 06, 2020 at 09:19:32AM -0400, Jonathan Marek wrote:
> One example why drm/msm can't use DMA API is multiple page table support
> (that is landing in 5.10), which is something that definitely couldn't work
> with DMA API.
> 
> Another one is being able to choose the address for mappings, which AFAIK
> DMA API can't do (somewhat related to this: qcom hardware often has ranges
> of allowed addresses, which the dma_mask mechanism fails to represent, what
> I see is drivers using dma_mask as a "maximum address", and since addresses
> are allocated from the top it generally works)

That sounds like a good enough rason to use the IOMMU API.  I just
wanted to make sure this really makes sense.
