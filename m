Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD8CAF028
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2019 19:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391832AbfIJRLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Sep 2019 13:11:03 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41595 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731510AbfIJRLD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Sep 2019 13:11:03 -0400
Received: by mail-ed1-f68.google.com with SMTP id z9so17815475edq.8;
        Tue, 10 Sep 2019 10:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iuWQbHX+PMmNOYmd/8pxmVPIKdIed7YlISeGMgRidgc=;
        b=nGVn97TTZhK0PPPfJL9dl6WBhPT2YLeqSt3p+U7yVwjN5WBJDYwgKSOc1NbPrCdimp
         +jFNz7Grhyg+FrsoHamdre2gg4lQ1KAh8/MamoeZAraCi06wUTgRTi8DknjKoLQ76fke
         6WP/46MkYH+188U0fEj/iwGNh+L+E8hcVZ3A7e0ROH7WowUWLEICs/dkWSVdQJ8MsTOZ
         g9tjXofI2V9D49kezB8GYV1VdthPv7Yd6dZO94FeMzDOsp1HyILdtrJIhI9/dl9Mp4QP
         vl1VA0XHL8OZtRUblScbQfNTHWOkd+9bzr6/O5+MlhfATeHSX9LxnWbvp71P6++vzL0Z
         vTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iuWQbHX+PMmNOYmd/8pxmVPIKdIed7YlISeGMgRidgc=;
        b=BnmzDw2oOrx6w4+kGPJN0Z/WovMeZkG08xTVcw0RRKPeAXyzbSYhsw1wt+kCNhQV4q
         yeby7Ol2Ik7xxwNSNVJjMgfBnsALnwu0zAuA1cPigujC1xPeiwoc9VAWxXM6bvJ5jlTb
         9JxgStNPoE+T28hYqdGIsCEcSc21iRDCXtKPmck+ffPya5jxPyMfz7JTXje4fElnuVnc
         QQkn2nyAhfZI8aVSR69nVYaT1EZz6V1mIuwiqfJ0bmOauMXH8dlHmnUyA3NU1/Er9Sa7
         KlWZuUVUTXsvUMJ4ORmyNXqytGARvk1wuhUJ/z19xshTwaGGvQ0P4CGn+PhSjDHqm4Yp
         eacg==
X-Gm-Message-State: APjAAAVPkFBzh7nLhWQD6sA9aV9B4YGy2y9Qzemo9II365HGDVvcxIOz
        nJbMd82j1ZHbvTzjpWOmyADaGd+cUoDsRgtClnM=
X-Google-Smtp-Source: APXvYqxiIVIycVxvEEUmiCW5coXzW8/2YE/GZpopAwpb2E0GVaAmfqW3+sFpN7JvdeaqLP5yP2YwvFPlBP2u18+UK6I=
X-Received: by 2002:a17:906:3293:: with SMTP id 19mr25728734ejw.265.1568135460497;
 Tue, 10 Sep 2019 10:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190906214409.26677-1-robdclark@gmail.com> <c43de10f-7768-592c-0fd8-6fb64b3fd43e@arm.com>
In-Reply-To: <c43de10f-7768-592c-0fd8-6fb64b3fd43e@arm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 10 Sep 2019 10:10:49 -0700
Message-ID: <CAF6AEGv5WtwOuUE-+koL3SxuoXxcT5n=EooD7G_4YRh34HFTwQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] iommu: handle drivers that manage iommu directly
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Bruce Wang <bzwang@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Joe Perches <joe@perches.com>, Joerg Roedel <jroedel@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sean Paul <seanpaul@chromium.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 10, 2019 at 9:34 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 06/09/2019 22:44, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > One of the challenges we have to enable the aarch64 laptops upstream
> > is dealing with the fact that the bootloader enables the display and
> > takes the corresponding SMMU context-bank out of BYPASS.  Unfortunately,
> > currently, the IOMMU framework attaches a DMA (or potentially an
> > IDENTITY) domain before the driver is probed and has a chance to
> > intervene and shutdown scanout.  Which makes things go horribly wrong.
>
> Nope, things already went horribly wrong in arm_smmu_device_reset() -
> sure, sometimes for some configurations it might *seem* like they didn't
> and that you can fudge the context bank state at arm's length from core
> code later, but the truth is that impl->cfg_probe is your last chance to
> guarantee that any necessary SMMU state is preserved.

cfg_probe is where Bjorn's patch is preserving the SMMU state.  So I
think that should ensure device_reset() preserves the configuration..
or at least if something is missing, that seems fixable.

> The remainder of the problem involves reworking default domain
> allocation such that we can converge on what iommu_request_dm_for_dev()
> currently does but without the momentary attachment to a translation
> domain to cause hiccups. That's starting here:
>
> https://lore.kernel.org/linux-iommu/cover.1566353521.git.sai.praneeth.prakhya@intel.com/

I suppose if the stream-match state and bootloader chosen context bank
is preserved, then keeping it direct-mapped would avoid things
starting to fault before display driver is probed.  That plus some
solution for GPU default domain would narrow the scope of what I need
to just avoiding getting iommu dma_ops installed.

> > But in this case, drm/msm is already directly managing it's IOMMUs
> > directly, the DMA API attached iommu_domain simply gets in the way.
> > This series adds a way that a driver can indicate to drivers/iommu
> > that it does not wish to have an DMA managed iommu_domain attached.
> > This way, drm/msm can shut down scanout cleanly before attaching it's
> > own iommu_domain.
> >
> > NOTE that to get things working with arm-smmu on the aarch64 laptops,
> > you also need a patchset[1] from Bjorn Andersson to inherit SMMU config
> > at boot, when it is already enabled.
> >
> > [1] https://www.spinics.net/lists/arm-kernel/msg732246.html
> >
> > NOTE that in discussion of previous revisions, RMRR came up.  This is
> > not really a replacement for RMRR (nor does RMRR really provide any
> > more information than we already get from EFI GOP, or DT in the
> > simplefb case).  I also don't see how RMRR could help w/ SMMU handover
> > of CB/SMR config (Bjorn's patchset[1]) without defining new tables.
>
> The point of RMRR-like-things is that they identify not just the memory
> region but also the specific device accessing them, which means the
> IOMMU driver knows up-front which IDs etc. it must be careful not to
> disrupt. Obviously for SMMU that *would* be some new table (designed to
> encompass everything relevant) since literal RMRRs are specifically an
> Intel VT-d thing.

Perhaps I'm not looking in the right place, but the extent of what I
could find about RMRR tables was:

https://github.com/tianocore/edk2/blob/master/MdePkg/Include/IndustryStandard/DmaRemappingReportingTable.h#L122

I couldn't really see how that specifies the device.  But entirely
possible that I'm not seeing the whole picture.

I am a bit curious about how windows handles this, since they must
have the same problem on these laptops.

> > This perhaps doesn't solve the more general case of bootloader enabled
> > display for drivers that actually want to use DMA API managed IOMMU.
> > But it does also happen to avoid a related problem with GPU, caused by
> > the DMA domain claiming the context bank that the GPU firmware expects
> > to use.
>
> Careful bringing that up again, or I really will rework the context bank
> allocator to avoid this default domain problem entirely... ;)

That doesn't seem like a bad outcome ;-)

BR,
-R

> Robin.
>
> >  And it avoids spurious TLB invalidation coming from the unused
> > DMA domain.  So IMHO this is a useful and necessary change.
> >
> > Rob Clark (2):
> >    iommu: add support for drivers that manage iommu explicitly
> >    drm/msm: mark devices where iommu is managed by driver
> >
> >   drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 1 +
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 1 +
> >   drivers/gpu/drm/msm/msm_drv.c              | 1 +
> >   drivers/iommu/iommu.c                      | 2 +-
> >   drivers/iommu/of_iommu.c                   | 3 +++
> >   include/linux/device.h                     | 3 ++-
> >   7 files changed, 10 insertions(+), 2 deletions(-)
> >
