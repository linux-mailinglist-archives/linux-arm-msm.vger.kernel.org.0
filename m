Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A66E330E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2019 15:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbfFCNVN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jun 2019 09:21:13 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44812 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbfFCNVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jun 2019 09:21:13 -0400
Received: by mail-ed1-f68.google.com with SMTP id b8so26877123edm.11;
        Mon, 03 Jun 2019 06:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zUZXyuZyG2fDHsGvmi+k7bXfPwkhPnoz7sk7xMguNts=;
        b=ombLNLEaF/dFYAicRp2VoKFrkfCYOqTVTAkLZD4bpMiRzOLoLKdG4QuF1LUCIDERjI
         9nh8/D1Dmnh1QItnCTXmxbAahU1gtgAYQ0pDKCRsFsjMXOMMgiKZJ2uY0R/Jhe20DHR5
         U34UETveyU0xFGQMqw6+DC4o55r3lOPN5QNA2GCjyaAyTv/UOoe56m/faFSCjtkguOnw
         Y6sE+Nu256ykweXIkvNxVunSA2c21HCDKqnhoG8GS3lJFerLLZcOY2Nhov1GRDlzSMMl
         5WLNDHK7k1IXXW+dCeCSt2tTHplLmDWdFlRgXMAj3uiLlW41gmqy5HJLitsfJiuYljfp
         PDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zUZXyuZyG2fDHsGvmi+k7bXfPwkhPnoz7sk7xMguNts=;
        b=kZN1LlybrkTy8mEY22pUFS42bxch1S6630UYVp0VpaPITAWSUPJFqycKViwByv3Wcu
         ViI1Smk/7jZGSdLnuaidu1hv0I8seMHnpPzmqSxwLvFMsR4IyJXPbLztY1RjUVcHi2Qe
         2H7X3+7DRh1nKOBtCCfR2yKAMM6acnSsToCNenJErye6oMkyc8cBQ0XTMAXMpwBUZoO9
         bwJgww3C4sc8kvvvbERcf9U1BqQk0saoSiT+SLyd/LHNawhASIXto6Q5ToWsUjQI6JxT
         hY5s4AFMUMyhb14cNB4wlPOACgQl1BKzC+u/ctCQkUnTP8O9KXweRJqWHWq/QH/07ra7
         hD7g==
X-Gm-Message-State: APjAAAX3lCDNMq1/47JUUJLDUVbLu4L66PWeYHLQl+YFWHq3cYlfbV7H
        aaphO7b1W6qGSNCJ84KwpqbQQWKOt6nfpohNTxk=
X-Google-Smtp-Source: APXvYqyKo7O9gwJcMEKm78nevLJSasxgDOvAf3Bu9lrKU3SGNfxGO3bGLZsPCGJciHrCkDKyNdKoIOvLbGurRikTp7A=
X-Received: by 2002:a50:a7a5:: with SMTP id i34mr28554346edc.294.1559568070994;
 Mon, 03 Jun 2019 06:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20181201165348.24140-1-robdclark@gmail.com> <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
 <CAF6AEGtj+kyXqKeJK2-0e1jw_A4wz-yBEyv5zhf5Vfoi2_p2CA@mail.gmail.com> <401f9948-14bd-27a2-34c1-fb429cae966d@arm.com>
In-Reply-To: <401f9948-14bd-27a2-34c1-fb429cae966d@arm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 3 Jun 2019 06:20:57 -0700
Message-ID: <CAF6AEGuGGAThqs9ztTNyGnMyhFc9wbtn=N8A4qqQxcN_PAxsEw@mail.gmail.com>
Subject: Re: [PATCH] of/device: add blacklist for iommu dma_ops
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Christoph Hellwig <hch@lst.de>,
        Will Deacon <will.deacon@arm.com>,
        David Airlie <airlied@linux.ie>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 3, 2019 at 4:14 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 03/06/2019 11:47, Rob Clark wrote:
> > On Sun, Jun 2, 2019 at 11:25 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >>
> >> On Mon, Jun 3, 2019 at 4:40 AM Rob Clark <robdclark@gmail.com> wrote:
> >>>
> >>> So, another case I've come across, on the display side.. I'm working
> >>> on handling the case where bootloader enables display (and takes iommu
> >>> out of reset).. as soon as DMA domain gets attached we get iommu
> >>> faults, because bootloader has already configured display for scanout.
> >>> Unfortunately this all happens before actual driver is probed and has
> >>> a chance to intervene.
> >>>
> >>> It's rather unfortunate that we tried to be clever rather than just
> >>> making drivers call some function to opt-in to the hookup of dma iommu
> >>> ops :-(
> >>
> >> I think it still works for the 90% of cases and if 10% needs some
> >> explicit work in the drivers, that's better than requiring 100% of the
> >> drivers to do things manually.
>
> Right, it's not about "being clever", it's about not adding opt-in code
> to the hundreds and hundreds and hundreds of drivers which *might* ever
> find themselves used on a system where they would need the IOMMU's help
> for DMA.

Well, I mean, at one point we didn't do the automatic iommu hookup, we
could have just stuck with that and added a helper so drivers could
request the hookup.  Things wouldn't have been any more broken than
before, and when people bring up systems where iommu is required, they
could have added the necessary dma_iommu_configure() call.  But that
is water under the bridge now.

> >> Adding Marek who had the same problem on Exynos.
> >
> > I do wonder how many drivers need to iommu_map in their ->probe()?
> > I'm thinking moving the auto-hookup to after a successful probe(),
> > with some function a driver could call if they need mapping in probe,
> > might be a way to eventually get rid of the blacklist.  But I've no
> > idea how to find the subset of drivers that would be broken without a
> > dma_setup_iommu_stuff() call in their probe.
>
> Wouldn't help much. That particular issue is nothing to do with DMA ops
> really, it's about IOMMU initialisation. On something like SMMUv3 there
> is literally no way to turn the thing on without blocking unknown
> traffic - it *has* to have stream table entries programmed before it can
> even allow stuff to bypass.

fwiw, on these sdm850 laptops (and I think sdm845 boards like mtp and
db845c) the SMMU (v2) is taken out of bypass by the bootloader.  Bjorn
has some patches for arm-smmu to read-back the state at boot.

(Although older devices were booting with display enabled but SMMU in bypass.)

> The answer is either to either pay attention to the "Quiesce all DMA
> capable devices" part of the boot protocol (which has been there since
> pretty much forever), or to come up with some robust way of
> communicating "live" boot-time mappings to IOMMU drivers so that they
> can program themselves appropriately during probe.

Unfortunately display lit up by bootloader is basically ubiquitous.
Every single android phone does it.  All of the windows-arm laptops do
it.  Basically 99.9% of things that have a display do it.  It's a
tough problem to solve involving clks, gdsc, regulators, etc, in
addition to the display driver.. and sadly now smmu.  And devices
where we can make changes to and update the firmware are rather rare.
So there is really no option to ignore this problem.

I guess if we had some early-quirks mechanism like x86 does, we could
mash the display off early in boot.  That would be an easy solution.
Although I'd prefer a proper solution so that android phones aren't
carrying around enormous stacks of hack patches to achieve a smooth
flicker-free boot.

I suppose arm-smmu could realize that the context bank is already
taken out of bypass..  although I'm not entirely sure if we can assume
that the CPU would be able to read back the pagetable setup by the
bootloader.  Maybe Vivek has an idea about that?

BR,
-R
