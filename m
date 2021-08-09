Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658B03E4A7B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 19:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233546AbhHIRFf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 13:05:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:48628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229877AbhHIRFf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 13:05:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1CFFE60EDF;
        Mon,  9 Aug 2021 17:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628528714;
        bh=RMEf6LXCfJbK+5TTchOmMqltVVe9V4z4Y8ERl5RAQFM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bZ4bYvr9of3IX6/kJXELIQD0M2qMjKO/Tan+GITh8wWQ1xSzJ15p8SsyetE3oiIzO
         WyMXatW+Of8xKEO76q4JvIbfaWjyTrAmrDnTn03Q503o1YabO6BzpzyD9tdCVwzs5I
         eH4f56y7dm5DgKRASUgB9iQ13s+qNMpQhL6oc/4sFQk0CdetzetYY7mJA3DwCXK1qW
         5uSLMUin1RmapmmEFqeNsfczb85mWu1PRd2oq13lek/PmL4Wzw3iacr0/KIB6Orr97
         eMicvuMLzITfHMHptVFn045cthfAOhVRD1nrz8TIKUivzvKoiTlrQWzD/flcYUY50Z
         ESCe01X25SoOQ==
Date:   Mon, 9 Aug 2021 18:05:08 +0100
From:   Will Deacon <will@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Georgi Djakov <djakov@kernel.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        David Airlie <airlied@linux.ie>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Kristian H Kristensen <hoegsberg@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Freedreno] [PATCH 0/3] iommu/drm/msm: Allow non-coherent
 masters to use system cache
Message-ID: <20210809170508.GB1589@willie-the-truck>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210728140052.GB22887@mms-0441>
 <8b2742c8891abe4fec3664730717a089@codeaurora.org>
 <20210802105544.GA27657@willie-the-truck>
 <CAF6AEGvtpFu8st=ZFNoKjP9YsAenciLxL1zMFi_iqMCvdby73w@mail.gmail.com>
 <20210802151409.GE28735@willie-the-truck>
 <CAF6AEGtzvyEUm0Fc8QT5t9KNK7i0FbFyi7zDM2_PMCzZBp7qbw@mail.gmail.com>
 <20210809145651.GC1458@willie-the-truck>
 <CAF6AEGsSUojA=V0n2iRWTCn++buqN=Eoxo0r3=+=PBu1O=H-AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGsSUojA=V0n2iRWTCn++buqN=Eoxo0r3=+=PBu1O=H-AQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 09, 2021 at 09:57:08AM -0700, Rob Clark wrote:
> On Mon, Aug 9, 2021 at 7:56 AM Will Deacon <will@kernel.org> wrote:
> > On Mon, Aug 02, 2021 at 06:36:04PM -0700, Rob Clark wrote:
> > > On Mon, Aug 2, 2021 at 8:14 AM Will Deacon <will@kernel.org> wrote:
> > > > On Mon, Aug 02, 2021 at 08:08:07AM -0700, Rob Clark wrote:
> > > > > On Mon, Aug 2, 2021 at 3:55 AM Will Deacon <will@kernel.org> wrote:
> > > > > > On Thu, Jul 29, 2021 at 10:08:22AM +0530, Sai Prakash Ranjan wrote:
> > > > > > > On 2021-07-28 19:30, Georgi Djakov wrote:
> > > > > > > > On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
> > > > > > > > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> > > > > > > > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> > > > > > > > > the memory type setting required for the non-coherent masters to use
> > > > > > > > > system cache. Now that system cache support for GPU is added, we will
> > > > > > > > > need to set the right PTE attribute for GPU buffers to be sys cached.
> > > > > > > > > Without this, the system cache lines are not allocated for GPU.
> > > > > > > > >
> > > > > > > > > So the patches in this series introduces a new prot flag IOMMU_LLC,
> > > > > > > > > renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> > > > > > > > > and makes GPU the user of this protection flag.
> > > > > > > >
> > > > > > > > Thank you for the patchset! Are you planning to refresh it, as it does
> > > > > > > > not apply anymore?
> > > > > > > >
> > > > > > >
> > > > > > > I was waiting on Will's reply [1]. If there are no changes needed, then
> > > > > > > I can repost the patch.
> > > > > >
> > > > > > I still think you need to handle the mismatched alias, no? You're adding
> > > > > > a new memory type to the SMMU which doesn't exist on the CPU side. That
> > > > > > can't be right.
> > > > > >
> > > > >
> > > > > Just curious, and maybe this is a dumb question, but what is your
> > > > > concern about mismatched aliases?  I mean the cache hierarchy on the
> > > > > GPU device side (anything beyond the LLC) is pretty different and
> > > > > doesn't really care about the smmu pgtable attributes..
> > > >
> > > > If the CPU accesses a shared buffer with different attributes to those which
> > > > the device is using then you fall into the "mismatched memory attributes"
> > > > part of the Arm architecture. It's reasonably unforgiving (you should go and
> > > > read it) and in some cases can apply to speculative accesses as well, but
> > > > the end result is typically loss of coherency.
> > >
> > > Ok, I might have a few other sections to read first to decipher the
> > > terminology..
> > >
> > > But my understanding of LLC is that it looks just like system memory
> > > to the CPU and GPU (I think that would make it "the point of
> > > coherence" between the GPU and CPU?)  If that is true, shouldn't it be
> > > invisible from the point of view of different CPU mapping options?
> >
> > You could certainly build a system where mismatched attributes don't cause
> > loss of coherence, but as it's not guaranteed by the architecture and the
> > changes proposed here affect APIs which are exposed across SoCs, then I
> > don't think it helps much.
> >
> 
> Hmm, the description of the new mapping flag is that it applies only
> to transparent outer level cache:
> 
> +/*
> + * Non-coherent masters can use this page protection flag to set cacheable
> + * memory attributes for only a transparent outer level of cache, also known as
> + * the last-level or system cache.
> + */
> +#define IOMMU_LLC      (1 << 6)
> 
> But I suppose we could call it instead IOMMU_QCOM_LLC or something
> like that to make it more clear that it is not necessarily something
> that would work with a different outer level cache implementation?

... or we could just deal with the problem so that other people can reuse
the code. I haven't really understood the reluctance to solve this properly.

Am I missing some reason this isn't solvable?

Will
