Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5BC22870A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Oct 2020 10:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbgJHI2B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 04:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgJHI2B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 04:28:01 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C00BC061755;
        Thu,  8 Oct 2020 01:28:01 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 5FA562FB; Thu,  8 Oct 2020 10:27:59 +0200 (CEST)
Date:   Thu, 8 Oct 2020 10:27:57 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
Message-ID: <20201008082757.GB3107@8bytes.org>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006072306.GA12834@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 06, 2020 at 08:23:06AM +0100, Christoph Hellwig wrote:
> If people want to use the "raw" IOMMU API with not cache coherent
> devices we'll need a cache maintainance API that goes along with it.
> It could either be formally part of the IOMMU API or be separate.

The IOMMU-API does not care about the caching effects of DMA, is manages
IO address spaces for devices. I also don't know how this would be going
to be implemented, the IOMMU-API does not have the concept of handles
for mapped ranges and does not care about CPU virtual addresses (which
are needed for cache flushes) of the memory it maps into IO page-tables.

So I think a cache management API should be separate from the IOMMU-API.

Regards,

	Joerg
