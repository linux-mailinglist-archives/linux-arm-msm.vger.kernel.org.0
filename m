Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0208730E51D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 22:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbhBCVrA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 16:47:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:41320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229897AbhBCVq7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 16:46:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFFBE64DA3;
        Wed,  3 Feb 2021 21:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612388778;
        bh=t9q36+UozJsJ0NMC2j5rVcV+pwE4hj88IGjV6WTPNUo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uVRuQ5P0IfFTsuCtMSN892U6rEqrIfX9TVmgXodJDinRCg5OkM9Co88RgxyBq3rmJ
         O1HkbK7cKkulp25CDBWLst0L8JbCrIbj9RZ2I3zHtl7ISsV3+3Xpwe2YdEHmqESL8B
         n3KtHxLGn0iPYvsF4A4J7y0VYF7TycoLYNNOgb0y03Lc9skcbp8DdrHCOt1R8K6jqG
         5OJdLRid3AWksbYRNL/FyX/t09EMZzgUtuvsXVH/eAZDPQHXygnGPxNCy+yzvqANxP
         XgiZ6rgkWPPgE8bta9cwEBqe6erV6gX23odAuK6lYsgo/L1wSwUDQXgSdhT7ENA+kK
         RNVV1TErPzzyQ==
Date:   Wed, 3 Feb 2021 21:46:12 +0000
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Kristian H Kristensen <hoegsberg@google.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] iommu/io-pgtable-arm: Add IOMMU_LLC page protection
 flag
Message-ID: <20210203214612.GB19847@willie-the-truck>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <3f589e7de3f9fa93e84c83420c5270c546a0c368.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210129090516.GB3998@willie-the-truck>
 <5d23fce629323bcda71594010824aad0@codeaurora.org>
 <20210201111556.GA7172@willie-the-truck>
 <CAF6AEGsARmkAFsjaQLfa2miMgeijo183MWDKGtW_ti-UCpzBqA@mail.gmail.com>
 <20210201182016.GA21629@jcrouse1-lnx.qualcomm.com>
 <7e9aade14d0b7f69285852ade4a5a9f4@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e9aade14d0b7f69285852ade4a5a9f4@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 02, 2021 at 11:56:27AM +0530, Sai Prakash Ranjan wrote:
> On 2021-02-01 23:50, Jordan Crouse wrote:
> > On Mon, Feb 01, 2021 at 08:20:44AM -0800, Rob Clark wrote:
> > > On Mon, Feb 1, 2021 at 3:16 AM Will Deacon <will@kernel.org> wrote:
> > > > On Fri, Jan 29, 2021 at 03:12:59PM +0530, Sai Prakash Ranjan wrote:
> > > > > On 2021-01-29 14:35, Will Deacon wrote:
> > > > > > On Mon, Jan 11, 2021 at 07:45:04PM +0530, Sai Prakash Ranjan wrote:
> > > > > > > +#define IOMMU_LLC        (1 << 6)
> > > > > >
> > > > > > On reflection, I'm a bit worried about exposing this because I think it
> > > > > > will
> > > > > > introduce a mismatched virtual alias with the CPU (we don't even have a
> > > > > > MAIR
> > > > > > set up for this memory type). Now, we also have that issue for the PTW,
> > > > > > but
> > > > > > since we always use cache maintenance (i.e. the streaming API) for
> > > > > > publishing the page-tables to a non-coheren walker, it works out.
> > > > > > However,
> > > > > > if somebody expects IOMMU_LLC to be coherent with a DMA API coherent
> > > > > > allocation, then they're potentially in for a nasty surprise due to the
> > > > > > mismatched outer-cacheability attributes.
> > > > > >
> > > > >
> > > > > Can't we add the syscached memory type similar to what is done on android?
> > > >
> > > > Maybe. How does the GPU driver map these things on the CPU side?
> > > 
> > > Currently we use writecombine mappings for everything, although there
> > > are some cases that we'd like to use cached (but have not merged
> > > patches that would give userspace a way to flush/invalidate)
> > > 
> > 
> > LLC/system cache doesn't have a relationship with the CPU cache.  Its
> > just a
> > little accelerator that sits on the connection from the GPU to DDR and
> > caches
> > accesses. The hint that Sai is suggesting is used to mark the buffers as
> > 'no-write-allocate' to prevent GPU write operations from being cached in
> > the LLC
> > which a) isn't interesting and b) takes up cache space for read
> > operations.
> > 
> > Its easiest to think of the LLC as a bonus accelerator that has no cost
> > for
> > us to use outside of the unfortunate per buffer hint.
> > 
> > We do have to worry about the CPU cache w.r.t I/O coherency (which is a
> > different hint) and in that case we have all of concerns that Will
> > identified.
> > 
> 
> For mismatched outer cacheability attributes which Will mentioned, I was
> referring to [1] in android kernel.

I've lost track of the conversation here :/

When the GPU has a buffer mapped with IOMMU_LLC, is the buffer also mapped
into the CPU and with what attributes? Rob said "writecombine for
everything" -- does that mean ioremap_wc() / MEMREMAP_WC?

Finally, we need to be careful when we use the word "hint" as "allocation
hint" has a specific meaning in the architecture, and if we only mismatch on
those then we're actually ok. But I think IOMMU_LLC is more than just a
hint, since it actually drives eviction policy (i.e. it enables writeback).

Sorry for the pedantry, but I just want to make sure we're all talking
about the same things!

Cheers,

Will
