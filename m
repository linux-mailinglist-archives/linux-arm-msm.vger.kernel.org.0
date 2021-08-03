Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76D453DE401
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 03:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233574AbhHCBcF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 21:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233208AbhHCBcE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 21:32:04 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE22AC06175F;
        Mon,  2 Aug 2021 18:31:52 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id e25-20020a05600c4b99b0290253418ba0fbso1079368wmp.1;
        Mon, 02 Aug 2021 18:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xoYKeNMcKT9d+jkGEnzy+zqeIUVXh9cRA8f49lcGYC8=;
        b=K4cUt6vdJtIGAoypcfbhOnCY7xrdQNo/3h5B6VyuGQC6ZNWK/BBe++Xkxp67ld0Rn0
         Zh1pJzHrvpzYLV1x4DFyxUiEyQ46SCW4/9Oh792YF+bcXDwFnTL1anQNGnPNR12vVrKh
         WS89KEbB9yo18n717VtF6iTXDAQi6CVZ24pgQjC7Q7vZZ0qvVDrCemM4HWR4/0t6pRvb
         0YgX1LDLC5ekVWNwayNpI0OPAKJP7zmlBTS0tXXOEjxbgVf3n0We5wttMwz2tAfm+Yoe
         EhkzubmCCp386nRqW3vNJdOhPwdOWwFQTkeZrUrwSgV/s+ewosTRt+Dpoy174Qz0n96d
         atfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xoYKeNMcKT9d+jkGEnzy+zqeIUVXh9cRA8f49lcGYC8=;
        b=suhrVOqrSAxyZOwahJaFxIv9ke2pspyLnY79GWQq5gY6XRTMLI78EPjU7lVRUInGsU
         kaKcQAnTFf+ZMKx7SUXxNK+XgAUQg0Uex+511wOSDG5k33F52chEJRN/ZpsBhHwWYEVr
         m4rs7oACSHl6aykMLZ8lwZtgBNkY4LtBB+EOn3e+/1KZQ/SwiG5m48Mpo0hY4zzYL3vP
         3WE0n+O8eM0rXfwUwfAGyrcS/DKVjLHUo2Y+tF0KT+xdyloO90/M1lyih4lV5QvRUSnl
         CoIyy2nh9aBSEyfERfqGWyexn+osDUfkg/E86MvhtUzbVaIg+DQDxWnCsC2fRsI2cuhx
         nbgg==
X-Gm-Message-State: AOAM530yCc3RlzaxBzjbwA5lp6zs9NiiBxNATz5N52/Z61tgoOM+EncR
        OknlojYxdsPyPOFs/y5xEUHVG6dR3aR+5/b1vtX0g2GV6OU=
X-Google-Smtp-Source: ABdhPJxdMWZqPHrh+Mxx9qIF7HQSUcdRyEEsbC9X4CVXONVLsF849KG7gxpA1BIWW/BxUAjLxanM9tlNbBcIasoLz7Q=
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr1613548wma.49.1627954311450;
 Mon, 02 Aug 2021 18:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210728140052.GB22887@mms-0441> <8b2742c8891abe4fec3664730717a089@codeaurora.org>
 <20210802105544.GA27657@willie-the-truck> <CAF6AEGvtpFu8st=ZFNoKjP9YsAenciLxL1zMFi_iqMCvdby73w@mail.gmail.com>
 <20210802151409.GE28735@willie-the-truck>
In-Reply-To: <20210802151409.GE28735@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 2 Aug 2021 18:36:04 -0700
Message-ID: <CAF6AEGtzvyEUm0Fc8QT5t9KNK7i0FbFyi7zDM2_PMCzZBp7qbw@mail.gmail.com>
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

On Mon, Aug 2, 2021 at 8:14 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Aug 02, 2021 at 08:08:07AM -0700, Rob Clark wrote:
> > On Mon, Aug 2, 2021 at 3:55 AM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Thu, Jul 29, 2021 at 10:08:22AM +0530, Sai Prakash Ranjan wrote:
> > > > On 2021-07-28 19:30, Georgi Djakov wrote:
> > > > > On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
> > > > > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> > > > > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> > > > > > the memory type setting required for the non-coherent masters to use
> > > > > > system cache. Now that system cache support for GPU is added, we will
> > > > > > need to set the right PTE attribute for GPU buffers to be sys cached.
> > > > > > Without this, the system cache lines are not allocated for GPU.
> > > > > >
> > > > > > So the patches in this series introduces a new prot flag IOMMU_LLC,
> > > > > > renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> > > > > > and makes GPU the user of this protection flag.
> > > > >
> > > > > Thank you for the patchset! Are you planning to refresh it, as it does
> > > > > not apply anymore?
> > > > >
> > > >
> > > > I was waiting on Will's reply [1]. If there are no changes needed, then
> > > > I can repost the patch.
> > >
> > > I still think you need to handle the mismatched alias, no? You're adding
> > > a new memory type to the SMMU which doesn't exist on the CPU side. That
> > > can't be right.
> > >
> >
> > Just curious, and maybe this is a dumb question, but what is your
> > concern about mismatched aliases?  I mean the cache hierarchy on the
> > GPU device side (anything beyond the LLC) is pretty different and
> > doesn't really care about the smmu pgtable attributes..
>
> If the CPU accesses a shared buffer with different attributes to those which
> the device is using then you fall into the "mismatched memory attributes"
> part of the Arm architecture. It's reasonably unforgiving (you should go and
> read it) and in some cases can apply to speculative accesses as well, but
> the end result is typically loss of coherency.

Ok, I might have a few other sections to read first to decipher the
terminology..

But my understanding of LLC is that it looks just like system memory
to the CPU and GPU (I think that would make it "the point of
coherence" between the GPU and CPU?)  If that is true, shouldn't it be
invisible from the point of view of different CPU mapping options?

BR,
-R
