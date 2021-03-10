Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB0D73338B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 10:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbhCJJ0K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 04:26:10 -0500
Received: from verein.lst.de ([213.95.11.211]:35412 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230397AbhCJJZk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 04:25:40 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2657568B05; Wed, 10 Mar 2021 10:25:34 +0100 (CET)
Date:   Wed, 10 Mar 2021 10:25:33 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Christoph Hellwig <hch@lst.de>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        David Woodhouse <dwmw2@infradead.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 14/17] iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
Message-ID: <20210310092533.GA6819@lst.de>
References: <20210301084257.945454-1-hch@lst.de> <20210301084257.945454-15-hch@lst.de> <1658805c-ed28-b650-7385-a56fab3383e3@arm.com> <20210310091501.GC5928@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310091501.GC5928@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 10, 2021 at 10:15:01AM +0100, Christoph Hellwig wrote:
> On Thu, Mar 04, 2021 at 03:25:27PM +0000, Robin Murphy wrote:
> > On 2021-03-01 08:42, Christoph Hellwig wrote:
> >> Use explicit methods for setting and querying the information instead.
> >
> > Now that everyone's using iommu-dma, is there any point in bouncing this 
> > through the drivers at all? Seems like it would make more sense for the x86 
> > drivers to reflect their private options back to iommu_dma_strict (and 
> > allow Intel's caching mode to override it as well), then have 
> > iommu_dma_init_domain just test !iommu_dma_strict && 
> > domain->ops->flush_iotlb_all.
> 
> Hmm.  I looked at this, and kill off ->dma_enable_flush_queue for
> the ARM drivers and just looking at iommu_dma_strict seems like a
> very clear win.
> 
> OTOH x86 is a little more complicated.  AMD and intel defaul to lazy
> mode, so we'd have to change the global iommu_dma_strict if they are
> initialized.  Also Intel has not only a "static" option to disable
> lazy mode, but also a "dynamic" one where it iterates structure.  So
> I think on the get side we're stuck with the method, but it still
> simplifies the whole thing.

Actually... Just mirroring the iommu_dma_strict value into
struct iommu_domain should solve all of that with very little
boilerplate code. 
