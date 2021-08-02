Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F553DDBCE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 17:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233976AbhHBPEJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 11:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234755AbhHBPEG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 11:04:06 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B15C06175F;
        Mon,  2 Aug 2021 08:03:56 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id z4so21879683wrv.11;
        Mon, 02 Aug 2021 08:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7XHOcI1iqZxijVLGLW7nItKOPrRmjBgh32wAYk4SY0A=;
        b=XHfgl+M3acCK7c0V7HKcPwXjFcClgkgpF8EEGCvsL19dxnBBG8PXPRDF0zkNLhAD8C
         eoElgSmdGbPUlGq0V/ocmmR/FLq0tG2IvgAFaeO0dAPN+lrF5Z5l68N7kuJnebiW22km
         AjHuMo7XLOekNR127PjRnsWmXdYNG5QBW93oZYKySrszC/IQ1M+p2SCvLhVmy4jGlZgi
         NV2kQ2FPtPB5CHuO16ms8wcPhglWnWHekMJQChMndk42kaSo3w+aN2L6H1UKXpq2JD57
         J/e9MuBhv8XBN+aL4sxNFY29iIIpagoCscQ9lmuvskMtv/HlEwPCDZ10W664wygmid0Z
         l6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7XHOcI1iqZxijVLGLW7nItKOPrRmjBgh32wAYk4SY0A=;
        b=aZnhbs7oV4GDgkuOvNJPkvOcyvxkJuRMqeARpcP7wb1EYvrHcLZdURitSwSGqguvCn
         LmwJTbYRK7JP8w5iJF2JHSnBBgotwH6oeE0Bg1PtJGMxZy7zDPjN5no17xszOtng3Haa
         PvwE4V9m/xgtS9pY7eMncTi4anpxZNrODdaOQ3ZsDCjOLcTjGuTKs2fm/mOeG+y/nUiZ
         8rtr2cxGj63CNQWfpEq7cFpMDwzrOy3zqIhxdTdv6VIbvkkYG0WWB5n2ahust6tYhk76
         uEaZaFvdWny0hMlZ7KhoxVyWB1cexUdZAUIS3G3tlrr7L5u/A16T6GCnDY15iWKyHDj8
         jHSA==
X-Gm-Message-State: AOAM532mbRAQz4v8RK6ddoEZFl2ilCqVlOTszoCJumSRa4aE3WAXCzLX
        K96ZhWb/VeBPuLYiCsGTtQ2JL4/cTSdMvoW5M/k=
X-Google-Smtp-Source: ABdhPJwGH/Eqr7CF+Kt6gNll6QNMzEySN4X0hbpZ4Q5OsyHEbBPyczRncKgDY8mkF35HvK0Ng4dxN6be2gs74L1YFnE=
X-Received: by 2002:a5d:4348:: with SMTP id u8mr19002665wrr.28.1627916635155;
 Mon, 02 Aug 2021 08:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210728140052.GB22887@mms-0441> <8b2742c8891abe4fec3664730717a089@codeaurora.org>
 <20210802105544.GA27657@willie-the-truck>
In-Reply-To: <20210802105544.GA27657@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 2 Aug 2021 08:08:07 -0700
Message-ID: <CAF6AEGvtpFu8st=ZFNoKjP9YsAenciLxL1zMFi_iqMCvdby73w@mail.gmail.com>
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

On Mon, Aug 2, 2021 at 3:55 AM Will Deacon <will@kernel.org> wrote:
>
> On Thu, Jul 29, 2021 at 10:08:22AM +0530, Sai Prakash Ranjan wrote:
> > On 2021-07-28 19:30, Georgi Djakov wrote:
> > > On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
> > > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> > > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> > > > the memory type setting required for the non-coherent masters to use
> > > > system cache. Now that system cache support for GPU is added, we will
> > > > need to set the right PTE attribute for GPU buffers to be sys cached.
> > > > Without this, the system cache lines are not allocated for GPU.
> > > >
> > > > So the patches in this series introduces a new prot flag IOMMU_LLC,
> > > > renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> > > > and makes GPU the user of this protection flag.
> > >
> > > Thank you for the patchset! Are you planning to refresh it, as it does
> > > not apply anymore?
> > >
> >
> > I was waiting on Will's reply [1]. If there are no changes needed, then
> > I can repost the patch.
>
> I still think you need to handle the mismatched alias, no? You're adding
> a new memory type to the SMMU which doesn't exist on the CPU side. That
> can't be right.
>

Just curious, and maybe this is a dumb question, but what is your
concern about mismatched aliases?  I mean the cache hierarchy on the
GPU device side (anything beyond the LLC) is pretty different and
doesn't really care about the smmu pgtable attributes..

BR,
-R
