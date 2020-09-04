Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234B325E024
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 18:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgIDQrA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 12:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgIDQq7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 12:46:59 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D04C061244;
        Fri,  4 Sep 2020 09:46:59 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id ef16so3308640qvb.8;
        Fri, 04 Sep 2020 09:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TBpouKohZ4xnNFvQAORhEKmSrdyDNk10oVx1FtC9Bws=;
        b=EgsDNr8jq4DF077DE8FFLRkR59IU61+j8V/Ka9V7oYrWIFPZmMCFtBwfask+T/m7M7
         ABkQRjkqmQNhqKh2VT7i4UJ/Wt90Z38MeTrYGvULyHJ82SQ6PsuQNCiKdiLa9nveFUpl
         R04cMMdDGxXDTRPRVqK11KOxC3g2sVS1/0YvzjlCoZCwTT0+M1Yo/uJWYoNvcaH8IrzS
         D4wFxN5u+Z5lTv8jIxdDc9Kz7W6pwsymzzpENZP0uaCYmJuezDkqwdXmmIDXl+AlvX5a
         XlvvIg2z5oM4vk2ffrT0qm6Rw0F7DcmoUiFJgFt2a2LOiExIWcNVg47MKAjj5MqzSRpP
         R2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TBpouKohZ4xnNFvQAORhEKmSrdyDNk10oVx1FtC9Bws=;
        b=g+tYxbV7BsPwjGudb6bg1xkdjgCdRJZ3foys09dQqAsd2x7tRwrDgwAx97+Vl8/mbZ
         bQynJ/see74USOaLKE0Ox1CTRO70zYkEAxSgDNlAClvFF65S3K75K5L/p03WJWos1hUc
         UypN5BbFj8wiaNqR1Zt1YBLFwre0Z0C9IJNweflNa/5oXQbEawnvhmseJq8/peFprbGX
         OmxLHqQJHE0bvhoi4VXJKkpQ9x+pePUl8/0ARupETlmRgKtBuT47Nt11B4pZpBVM2tDr
         L6eu6MqkCzokc2VcA1i5Mc2055fWBDoO7aKzJOR3NJKauGeyvHWMVwlMn5Jpv7TJMc2Z
         mRyg==
X-Gm-Message-State: AOAM532BTdTavX90ZfYt2gBt2cfvLkZ9OYZC04qLvZ/71b3HbTu4E8Bm
        7DHP9v184aI+Pmc9wbZx6nbxj3oajrhkUs0/SvY=
X-Google-Smtp-Source: ABdhPJwyy/xhHl+JQi8gUbkrBFV9qdIEd42p3ahcLsVYoc0LxBY3nBUW4K/0j87szLhObsiHhZk2WUEKzePSgoAinVs=
X-Received: by 2002:ad4:4ae9:: with SMTP id cp9mr8657659qvb.96.1599238018778;
 Fri, 04 Sep 2020 09:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220238.603465-1-robdclark@gmail.com> <20200904091117.GH6714@8bytes.org>
In-Reply-To: <20200904091117.GH6714@8bytes.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 4 Sep 2020 09:47:45 -0700
Message-ID: <CAF6AEGtFoUQZv3HOpjXckExvXGVsqgPVe-rjq+wLXWM9+pjWkA@mail.gmail.com>
Subject: Re: [PATCH 00/20] iommu/arm-smmu + drm/msm: per-process GPU pgtables
To:     Joerg Roedel <joro@8bytes.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Brian Masney <masneyb@onstation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hanna Hawa <hannah@marvell.com>,
        Joerg Roedel <jroedel@suse.de>,
        John Stultz <john.stultz@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jon Hunter <jonathanh@nvidia.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pritesh Raithatha <praithatha@nvidia.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>, Takashi Iwai <tiwai@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 4, 2020 at 2:11 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> On Mon, Aug 17, 2020 at 03:01:25PM -0700, Rob Clark wrote:
> > Jordan Crouse (12):
> >   iommu/arm-smmu: Pass io-pgtable config to implementation specific
> >     function
> >   iommu/arm-smmu: Add support for split pagetables
> >   iommu/arm-smmu: Prepare for the adreno-smmu implementation
> >   iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
> >   dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
> >   drm/msm: Add a context pointer to the submitqueue
> >   drm/msm: Drop context arg to gpu->submit()
> >   drm/msm: Set the global virtual address range from the IOMMU domain
> >   drm/msm: Add support to create a local pagetable
> >   drm/msm: Add support for private address space instances
> >   drm/msm/a6xx: Add support for per-instance pagetables
> >   arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
> >
> > Rob Clark (8):
> >   drm/msm: remove dangling submitqueue references
> >   iommu: add private interface for adreno-smmu
> >   drm/msm/gpu: add dev_to_gpu() helper
> >   drm/msm: set adreno_smmu as gpu's drvdata
> >   iommu/arm-smmu: constify some helpers
> >   arm: dts: qcom: sc7180: Set the compatible string for the GPU SMMU
> >   iommu/arm-smmu: add a way for implementations to influence SCTLR
> >   drm/msm: show process names in gem_describe
>
> Can the DRM parts be merged independently from the IOMMU parts or does
> this need to be queued together? If it needs to be together I defer the
> decission to Will through which tree this should go.
>

Hi,

v16 of this series re-ordered the patches and has some notes at the
top of the cover letter[1] about a potential way to land it.. tl;dr:
the drm parts can and adreno-smmu-priv.h can go independently of
iommu.  And the first four iommu patches can go in independently of
drm.  But the last two iommu patches have a dependency on the drm
patches.

Note that I'll send one more revision of the series shortly (I have a
small fixup for one of the drm patches for an issue found in testing,
and Bjorn had some suggestions about "iommu/arm-smmu: Prepare for the
adreno-smmu implementation" that I need to look at.

BR,
-R

[1] https://lkml.org/lkml/2020/9/1/1469
