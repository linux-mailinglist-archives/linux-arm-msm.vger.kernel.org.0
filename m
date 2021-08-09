Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96FC73E4A9C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 19:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233644AbhHIRO3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 13:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233616AbhHIRO3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 13:14:29 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D44C0613D3;
        Mon,  9 Aug 2021 10:14:08 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id l34-20020a05600c1d22b02902573c214807so15266793wms.2;
        Mon, 09 Aug 2021 10:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OYBhnOmTd7LND1yY/zv5ucewtbUAfml9H7e83nBYGaU=;
        b=iV/CrzxPf5LK9wpOJ4gIsz00vkbrDVCaMRV0siwGLmCot6OV/PuwxeA3aH8WpT2tUk
         JPCW2Bg7t+Ak07vobtTF8WukfTCipoxZRVvtn+LZ3b6c2m7fvFTpCpAY9w2H5E6thGF7
         e6FPlI538zmMzus1bkfH6iCZG3tXHDmED3hC2oHkHYLs75brD0iuAOWt4TB4wDj+pnmZ
         p528D7p2/nQUaGjNXhlozch0Cm4sUd6uzgX6bFrG5kNzYqnry2tlef742gidzk3sWqyr
         X9Xu3fmuMEepCmxevReyNJ8aVo8Gf10WVtQIuk5gNQnkHTY0wT7XWHNvspguI7rgzhvt
         UpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OYBhnOmTd7LND1yY/zv5ucewtbUAfml9H7e83nBYGaU=;
        b=LZ3iruSTSZhvHnpidgN3iOIK7TxDAvBHU6/IJisdaWu4+5D9upz0WqjfrQ5vYmtO9C
         NLmNFKw1+1jKjGVODxditcXVBY0s8pPrhgazpJ+Joj4+54RTBezMLSdOnKFDE4/bgJkz
         vmUKWO+38yPpKnvO/5lnm/aSCaJRwx2mbX8tT6EbmSgL2xI234HpDBog9SMBhElYNRkE
         6h0DmZ8EFlbXc9ESNmZGY/Sk5qXlr00XjwQqTFq8VibN2gUCsD8eRsdswcCsU9VHVH1h
         iAAGZWPYxCTU1VIQbuVG+LswBmRb0haRw7p23fCTwdOCh8+oDkp+Nt35Qe5wYJmCpTsH
         OhUA==
X-Gm-Message-State: AOAM5321UHcJNC03lFTjcnk8r4IEoAW8BfMhBmXjxl0q/YtIm6A7MGEk
        S4zWyJlX1CwjlapCPN995E9Av35t7R6G/7BS80E=
X-Google-Smtp-Source: ABdhPJwxbNcSIwX1UvQlFgc6jaQF022CNM5CpPLnowyIJkQeARUVpaWilm/NcmlhZvtsDnq6R/nB7hevA0KRmy5vjQI=
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr161960wma.49.1628529246173;
 Mon, 09 Aug 2021 10:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210728140052.GB22887@mms-0441> <8b2742c8891abe4fec3664730717a089@codeaurora.org>
 <20210802105544.GA27657@willie-the-truck> <CAF6AEGvtpFu8st=ZFNoKjP9YsAenciLxL1zMFi_iqMCvdby73w@mail.gmail.com>
 <20210802151409.GE28735@willie-the-truck> <CAF6AEGtzvyEUm0Fc8QT5t9KNK7i0FbFyi7zDM2_PMCzZBp7qbw@mail.gmail.com>
 <20210809145651.GC1458@willie-the-truck> <CAF6AEGsSUojA=V0n2iRWTCn++buqN=Eoxo0r3=+=PBu1O=H-AQ@mail.gmail.com>
 <20210809170508.GB1589@willie-the-truck>
In-Reply-To: <20210809170508.GB1589@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 9 Aug 2021 10:18:21 -0700
Message-ID: <CAF6AEGtmZ3LzAJdtnKDQDbEN-a6_JgdN-fZ96pkU3dZqkiW91g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 0/3] iommu/drm/msm: Allow non-coherent masters
 to use system cache
To:     Will Deacon <will@kernel.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 9, 2021 at 10:05 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Aug 09, 2021 at 09:57:08AM -0700, Rob Clark wrote:
> > On Mon, Aug 9, 2021 at 7:56 AM Will Deacon <will@kernel.org> wrote:
> > > On Mon, Aug 02, 2021 at 06:36:04PM -0700, Rob Clark wrote:
> > > > On Mon, Aug 2, 2021 at 8:14 AM Will Deacon <will@kernel.org> wrote:
> > > > > On Mon, Aug 02, 2021 at 08:08:07AM -0700, Rob Clark wrote:
> > > > > > On Mon, Aug 2, 2021 at 3:55 AM Will Deacon <will@kernel.org> wrote:
> > > > > > > On Thu, Jul 29, 2021 at 10:08:22AM +0530, Sai Prakash Ranjan wrote:
> > > > > > > > On 2021-07-28 19:30, Georgi Djakov wrote:
> > > > > > > > > On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
> > > > > > > > > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> > > > > > > > > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> > > > > > > > > > the memory type setting required for the non-coherent masters to use
> > > > > > > > > > system cache. Now that system cache support for GPU is added, we will
> > > > > > > > > > need to set the right PTE attribute for GPU buffers to be sys cached.
> > > > > > > > > > Without this, the system cache lines are not allocated for GPU.
> > > > > > > > > >
> > > > > > > > > > So the patches in this series introduces a new prot flag IOMMU_LLC,
> > > > > > > > > > renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> > > > > > > > > > and makes GPU the user of this protection flag.
> > > > > > > > >
> > > > > > > > > Thank you for the patchset! Are you planning to refresh it, as it does
> > > > > > > > > not apply anymore?
> > > > > > > > >
> > > > > > > >
> > > > > > > > I was waiting on Will's reply [1]. If there are no changes needed, then
> > > > > > > > I can repost the patch.
> > > > > > >
> > > > > > > I still think you need to handle the mismatched alias, no? You're adding
> > > > > > > a new memory type to the SMMU which doesn't exist on the CPU side. That
> > > > > > > can't be right.
> > > > > > >
> > > > > >
> > > > > > Just curious, and maybe this is a dumb question, but what is your
> > > > > > concern about mismatched aliases?  I mean the cache hierarchy on the
> > > > > > GPU device side (anything beyond the LLC) is pretty different and
> > > > > > doesn't really care about the smmu pgtable attributes..
> > > > >
> > > > > If the CPU accesses a shared buffer with different attributes to those which
> > > > > the device is using then you fall into the "mismatched memory attributes"
> > > > > part of the Arm architecture. It's reasonably unforgiving (you should go and
> > > > > read it) and in some cases can apply to speculative accesses as well, but
> > > > > the end result is typically loss of coherency.
> > > >
> > > > Ok, I might have a few other sections to read first to decipher the
> > > > terminology..
> > > >
> > > > But my understanding of LLC is that it looks just like system memory
> > > > to the CPU and GPU (I think that would make it "the point of
> > > > coherence" between the GPU and CPU?)  If that is true, shouldn't it be
> > > > invisible from the point of view of different CPU mapping options?
> > >
> > > You could certainly build a system where mismatched attributes don't cause
> > > loss of coherence, but as it's not guaranteed by the architecture and the
> > > changes proposed here affect APIs which are exposed across SoCs, then I
> > > don't think it helps much.
> > >
> >
> > Hmm, the description of the new mapping flag is that it applies only
> > to transparent outer level cache:
> >
> > +/*
> > + * Non-coherent masters can use this page protection flag to set cacheable
> > + * memory attributes for only a transparent outer level of cache, also known as
> > + * the last-level or system cache.
> > + */
> > +#define IOMMU_LLC      (1 << 6)
> >
> > But I suppose we could call it instead IOMMU_QCOM_LLC or something
> > like that to make it more clear that it is not necessarily something
> > that would work with a different outer level cache implementation?
>
> ... or we could just deal with the problem so that other people can reuse
> the code. I haven't really understood the reluctance to solve this properly.
>
> Am I missing some reason this isn't solvable?
>

Oh, was there another way to solve it (other than foregoing setting
INC_OCACHE in the pgtables)?  Maybe I misunderstood, is there a
corresponding setting on the MMU pgtables side of things?

BR,
-R
