Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F52F3E4BC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 20:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbhHISDc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 14:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232642AbhHISD3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 14:03:29 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CF0C0613D3;
        Mon,  9 Aug 2021 11:03:09 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id d131-20020a1c1d890000b02902516717f562so609968wmd.3;
        Mon, 09 Aug 2021 11:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AottaItdNpwEGaBVEcs2HSf4MSRq1/DJ2ThJuxRDL0Y=;
        b=t3NjC6Wc6R/U+WyQTTgjVH/rdU4MqhTP0Ldt3iBZ+QpVu9bL/uGwFDnkHE9hVifDCw
         3IHL95I8zaBeiaRjAM8US5bFNnCjxRac/VGFA+Geg17X9YiMzbnumQpHDImztVOSJ7zm
         pyRaYK6D8iHhJZyQf177eCA5HEiqiDgZx1cwGEq3jiyTFf0a3HaF4WT3h2XDMC9JveI8
         25FJk7rWKgpQTmPm+7RSUs+LWiOVzjwOm6CljybSU6PCzUweeQn5O2mir8+//cpT9hE3
         jh0ItWDJiXwm4P60mG+2u9z+n9u2Ajd1YDkL5rO3eq0Xr1w8yOfy8tu3aDGGz69D8y9B
         sZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AottaItdNpwEGaBVEcs2HSf4MSRq1/DJ2ThJuxRDL0Y=;
        b=iTk/E7LcbSPgkcTty2EEaKAW505JYlBDS/9GL+C9QYwhQZn2kVWeoHVZo76IAqMvSb
         RHj/qexfYomV4CbMpvWysMPsZV4eT0LhOZqeGHnndhQxBWi6lqgIjaX4dVSqIeIJElr+
         H0p+edEMWqmoj7cxjNKB2gKB4GUZLcV5S1OKifwtcrsk7Mnuqgi05agbKyHnVdnPFWrR
         P8jiCzYrj+yXo2GrUMDgxwNHnhqkjHsLmqU9gHmUgiSIbuGPO6LlD06CeIsf+mcD9XBz
         04xFo57+y9v8VnlurQIOh6EmkVo9aaa0AXkDg+3L+uWfdvY5HEWBohXUAUU2ybiyvUI8
         SiRQ==
X-Gm-Message-State: AOAM53390z314XD9jHV88/zxuAWWWUFmd9Li166EcW85i03SgxqJ0phm
        tpRHc0jUQ+vcVtEmkz0uvOr6nSIxmq/3K0nyRCc=
X-Google-Smtp-Source: ABdhPJwPQuU1umbzHs0AJtjSZtlKt3cKEhS0AjOuobmEY6ysunNkpvrb+zdwqw/9Gv8yOZQu0gTllxVLx8C+clsD3c0=
X-Received: by 2002:a1c:f414:: with SMTP id z20mr398052wma.94.1628532187414;
 Mon, 09 Aug 2021 11:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210728140052.GB22887@mms-0441> <8b2742c8891abe4fec3664730717a089@codeaurora.org>
 <20210802105544.GA27657@willie-the-truck> <CAF6AEGvtpFu8st=ZFNoKjP9YsAenciLxL1zMFi_iqMCvdby73w@mail.gmail.com>
 <20210802151409.GE28735@willie-the-truck> <CAF6AEGtzvyEUm0Fc8QT5t9KNK7i0FbFyi7zDM2_PMCzZBp7qbw@mail.gmail.com>
 <20210809145651.GC1458@willie-the-truck> <CAF6AEGsSUojA=V0n2iRWTCn++buqN=Eoxo0r3=+=PBu1O=H-AQ@mail.gmail.com>
 <20210809170508.GB1589@willie-the-truck> <CAF6AEGtmZ3LzAJdtnKDQDbEN-a6_JgdN-fZ96pkU3dZqkiW91g@mail.gmail.com>
 <20210809174022.GA1840@willie-the-truck> <76bfd0b4248148dfbf9d174ddcb4c2a2@codeaurora.org>
In-Reply-To: <76bfd0b4248148dfbf9d174ddcb4c2a2@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 9 Aug 2021 11:07:22 -0700
Message-ID: <CAF6AEGtiVgHc7rcfzOpBmtVGQBvGPCBmtKJ3AJx887NSMj0EzQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 0/3] iommu/drm/msm: Allow non-coherent masters
 to use system cache
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        David Airlie <airlied@linux.ie>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
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

On Mon, Aug 9, 2021 at 10:47 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> On 2021-08-09 23:10, Will Deacon wrote:
> > On Mon, Aug 09, 2021 at 10:18:21AM -0700, Rob Clark wrote:
> >> On Mon, Aug 9, 2021 at 10:05 AM Will Deacon <will@kernel.org> wrote:
> >> >
> >> > On Mon, Aug 09, 2021 at 09:57:08AM -0700, Rob Clark wrote:
> >> > > On Mon, Aug 9, 2021 at 7:56 AM Will Deacon <will@kernel.org> wrote:
> >> > > > On Mon, Aug 02, 2021 at 06:36:04PM -0700, Rob Clark wrote:
> >> > > > > On Mon, Aug 2, 2021 at 8:14 AM Will Deacon <will@kernel.org> wrote:
> >> > > > > > On Mon, Aug 02, 2021 at 08:08:07AM -0700, Rob Clark wrote:
> >> > > > > > > On Mon, Aug 2, 2021 at 3:55 AM Will Deacon <will@kernel.org> wrote:
> >> > > > > > > > On Thu, Jul 29, 2021 at 10:08:22AM +0530, Sai Prakash Ranjan wrote:
> >> > > > > > > > > On 2021-07-28 19:30, Georgi Djakov wrote:
> >> > > > > > > > > > On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
> >> > > > > > > > > > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> >> > > > > > > > > > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> >> > > > > > > > > > > the memory type setting required for the non-coherent masters to use
> >> > > > > > > > > > > system cache. Now that system cache support for GPU is added, we will
> >> > > > > > > > > > > need to set the right PTE attribute for GPU buffers to be sys cached.
> >> > > > > > > > > > > Without this, the system cache lines are not allocated for GPU.
> >> > > > > > > > > > >
> >> > > > > > > > > > > So the patches in this series introduces a new prot flag IOMMU_LLC,
> >> > > > > > > > > > > renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> >> > > > > > > > > > > and makes GPU the user of this protection flag.
> >> > > > > > > > > >
> >> > > > > > > > > > Thank you for the patchset! Are you planning to refresh it, as it does
> >> > > > > > > > > > not apply anymore?
> >> > > > > > > > > >
> >> > > > > > > > >
> >> > > > > > > > > I was waiting on Will's reply [1]. If there are no changes needed, then
> >> > > > > > > > > I can repost the patch.
> >> > > > > > > >
> >> > > > > > > > I still think you need to handle the mismatched alias, no? You're adding
> >> > > > > > > > a new memory type to the SMMU which doesn't exist on the CPU side. That
> >> > > > > > > > can't be right.
> >> > > > > > > >
> >> > > > > > >
> >> > > > > > > Just curious, and maybe this is a dumb question, but what is your
> >> > > > > > > concern about mismatched aliases?  I mean the cache hierarchy on the
> >> > > > > > > GPU device side (anything beyond the LLC) is pretty different and
> >> > > > > > > doesn't really care about the smmu pgtable attributes..
> >> > > > > >
> >> > > > > > If the CPU accesses a shared buffer with different attributes to those which
> >> > > > > > the device is using then you fall into the "mismatched memory attributes"
> >> > > > > > part of the Arm architecture. It's reasonably unforgiving (you should go and
> >> > > > > > read it) and in some cases can apply to speculative accesses as well, but
> >> > > > > > the end result is typically loss of coherency.
> >> > > > >
> >> > > > > Ok, I might have a few other sections to read first to decipher the
> >> > > > > terminology..
> >> > > > >
> >> > > > > But my understanding of LLC is that it looks just like system memory
> >> > > > > to the CPU and GPU (I think that would make it "the point of
> >> > > > > coherence" between the GPU and CPU?)  If that is true, shouldn't it be
> >> > > > > invisible from the point of view of different CPU mapping options?
> >> > > >
> >> > > > You could certainly build a system where mismatched attributes don't cause
> >> > > > loss of coherence, but as it's not guaranteed by the architecture and the
> >> > > > changes proposed here affect APIs which are exposed across SoCs, then I
> >> > > > don't think it helps much.
> >> > > >
> >> > >
> >> > > Hmm, the description of the new mapping flag is that it applies only
> >> > > to transparent outer level cache:
> >> > >
> >> > > +/*
> >> > > + * Non-coherent masters can use this page protection flag to set cacheable
> >> > > + * memory attributes for only a transparent outer level of cache, also known as
> >> > > + * the last-level or system cache.
> >> > > + */
> >> > > +#define IOMMU_LLC      (1 << 6)
> >> > >
> >> > > But I suppose we could call it instead IOMMU_QCOM_LLC or something
> >> > > like that to make it more clear that it is not necessarily something
> >> > > that would work with a different outer level cache implementation?
> >> >
> >> > ... or we could just deal with the problem so that other people can reuse
> >> > the code. I haven't really understood the reluctance to solve this properly.
> >> >
> >> > Am I missing some reason this isn't solvable?
> >>
> >> Oh, was there another way to solve it (other than foregoing setting
> >> INC_OCACHE in the pgtables)?  Maybe I misunderstood, is there a
> >> corresponding setting on the MMU pgtables side of things?
> >
> > Right -- we just need to program the CPU's MMU with the matching memory
> > attributes! It's a bit more fiddly if you're just using ioremap_wc()
> > though, as it's usually the DMA API which handles the attributes under
> > the
> > hood.
> >
> > Anyway, sorry, I should've said that explicitly earlier on. We've done
> > this
> > sort of thing in the Android tree so I assumed Sai knew what needed to
> > be
> > done and then I didn't think to explain to you :(
> >
>
> Right I was aware of that but even in the android tree there is no user
> :)
> I think we can't have a new memory type without any user right in
> upstream
> like android tree?
>
> @Rob, I think you  already tried adding a new MT and used
> pgprot_syscached()
> in GPU driver but it was crashing?

Correct, but IIRC there were some differences in the code for memory
types compared to the android tree.. I couldn't figure out the
necessary patches to cherry-pick to get the android patch to apply
cleanly, so I tried re-implementing it without having much of a clue
about how that code works (which was probably the issue) ;-)

BR,
-R
