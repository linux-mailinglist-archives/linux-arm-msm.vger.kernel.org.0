Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48C0B253715
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 20:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgHZS13 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 14:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbgHZS0y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 14:26:54 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B2EC061574;
        Wed, 26 Aug 2020 11:26:53 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x7so2834378wro.3;
        Wed, 26 Aug 2020 11:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bu4pOYOLpF8hHIWAO8QllDzn4fIcc5GK3Fq1pOjr02M=;
        b=aATDp49DrNEi4o+dQ3aZilAVzYRQBAblxtl0UNdBGXKSmVRdFgpISE1zQyc7cNSsZ9
         lW/EYpEmbA0Lu3HCV4gTg4WJlfsP9Ucv3zSATOZO1HiWK3Xl7zEtjeqoNbC6i1Ns4mAR
         ZRq0r3vG4sM3xbUlDy8LPAizO4V/iBIepvQgRwBNTOXvKWuZklWHI7dz6KPp6mM5pW+8
         e4/LtEjr5E3izgeXPBOlpPbB1jJpfchAVzL6KSrkYYKPwTjqCaTuOMWV4ujlyA488gay
         4N7boVhG1b57UDIcUR6HQBrmSeSXAtmip16JCAoNV2oOOh9NdAZhe34FxbbIB/ucho4E
         KVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bu4pOYOLpF8hHIWAO8QllDzn4fIcc5GK3Fq1pOjr02M=;
        b=KMT3IIu+WYoS+2TjRhO2ASZGjQ1stICBN3bZz98cCXy0H5V67NQ9cx/0nOnoyDSFVm
         S655VKHuuHugwYv6oXlhqHAByKuf6g8UUnhlBQmzjyGbF3hJ/p9JJiExDo0bf89WiDag
         Yw5NLd7sb68w9XhQfUPMfGr3ncvRTfx3eVfjw4pny56QIvH94z20taUQz/EJbMEsCnEy
         t/Qfid7r+pKyeJ2ANjAVh1hW+yv5SwPj48uzAGJQvi5wfZ8LO7JxQeJeKHI0UjO7imNr
         2Yw4eaRjV4a9cQKGwYJGQX6/6mThq332GBJ7q2XvoHCqi/SSbPRKTHUEBKP71pyjOUZP
         N+vA==
X-Gm-Message-State: AOAM531uRpkhojzPLxSEH8WtuRUSROfEwKZQb6eE1hYseE3DBJtR+792
        tOnaQh44sFPlvNC7RGw8S0tBJn/ndQxIGB5CSpc=
X-Google-Smtp-Source: ABdhPJw6XRhfFzc0ep7oxhqIsPm6hA1ZYk5Rt4Z7Rf4kNW/IcW2BOalXNQMof7JDtDOsechyJwXMAwWd0bJeEtpmfUE=
X-Received: by 2002:a5d:6085:: with SMTP id w5mr16385547wrt.362.1598466412249;
 Wed, 26 Aug 2020 11:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191221150402.13868-1-murphyt7@tcd.ie> <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
 <20200529124523.GA11817@infradead.org> <CGME20200529190523eucas1p2c086133e707257c0cdc002f502d4f51d@eucas1p2.samsung.com>
 <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com> <ef2150d5-7b6a-df25-c10d-e43316fe7812@samsung.com>
 <b9140772-0370-a858-578c-af503a06d8e9@deltatee.com> <CALQxJuutRaeX89k2o4ffTKYRMizmMu0XbRnzpFuSSrkQR02jKg@mail.gmail.com>
In-Reply-To: <CALQxJuutRaeX89k2o4ffTKYRMizmMu0XbRnzpFuSSrkQR02jKg@mail.gmail.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 26 Aug 2020 14:26:40 -0400
Message-ID: <CADnq5_PRuPtpzR-pCgXARRXVaC0vO=HdcGUkGQr7sDqUmq7G_Q@mail.gmail.com>
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
To:     Tom Murphy <murphyt7@tcd.ie>
Cc:     Logan Gunthorpe <logang@deltatee.com>, kvm@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-tegra@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Christoph Hellwig <hch@infradead.org>,
        linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-s390@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        linux-mediatek@lists.infradead.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:VIRTIO CORE, NET..." 
        <virtualization@lists.linux-foundation.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Kukjin Kim <kgene@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 24, 2020 at 2:56 AM Tom Murphy <murphyt7@tcd.ie> wrote:
>
> Hi Logan/All,
>
> I have added a check for the sg_dma_len == 0 :
> """
>  } __sgt_iter(struct scatterlist *sgl, bool dma) {
>         struct sgt_iter s = { .sgp = sgl };
>
> +       if (sgl && sg_dma_len(sgl) == 0)
> +           s.sgp = NULL;
>
>         if (s.sgp) {
>             .....
> """
> at location [1].
> but it doens't fix the problem.
>
> You're right though, this change does need to be made, this code
> doesn't handle pages of sg_dma_len(sg) == 0 correctly
> So my guess is that we have more bugs in other parts of the i915
> driver (or there is a problem with my "sg_dma_len == 0" fix above).
> I have been trying to spot where else the code might be buggy but I
> haven't had any luck so far.
>
> I'm doing a microconfernce (at LPC 2020) this wednesdays [1] on this
> if you're interested in attending.
> I'm hoping I can chat about it with a few people and find how can
> reproduce and fix this issues. I don't have any more time I can give
> to this unfortunately and it would be a shame for the work to go to
> waste.
>
> [0] https://github.com/torvalds/linux/blob/d012a7190fc1fd72ed48911e77ca97ba4521bccd/drivers/gpu/drm/i915/i915_scatterlist.h#L28
> [1] https://linuxplumbersconf.org/event/7/contributions/846/
>
> On Fri, 29 May 2020 at 22:21, Logan Gunthorpe <logang@deltatee.com> wrote:
> >
> >
> >
> > On 2020-05-29 3:11 p.m., Marek Szyprowski wrote:
> > > Patches are pending:
> > > https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
> >
> > Cool, nice! Though, I still don't think that fixes the issue in
> > i915_scatterlist.h given it still ignores sg_dma_len() and strictly
> > relies on sg_next()/sg_is_last() to stop iterating -- and I suspect this
> > is the bug that got in Tom's way.
> >
> > >> However, as Robin pointed out, there are other ugly tricks like stopping
> > >> iterating through the SGL when sg_dma_len() is zero. For example, the
> > >> AMD driver appears to use drm_prime_sg_to_page_addr_arrays() which does
> > >> this trick and thus likely isn't buggy (otherwise, I'd expect someone to
> > >> have complained by now seeing AMD has already switched to IOMMU-DMA.

We ran into the same issue with amdgpu and radeon when the AMD IOMMU
driver was converted and had to fix it as well.  The relevant fixes
were:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=42e67b479eab6d26459b80b4867298232b0435e7
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0199172f933342d8b1011aae2054a695c25726f4
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=47f7826c520ecd92ffbffe59ecaa2fe61e42ec70
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c0f83d164fb8f3a2b7bc379a6c1e27d1123a9eab

Alex

> > >
> > > I'm not sure that this is a trick. Stopping at zero sg_dma_len() was
> > > somewhere documented.
> >
> > Well whatever you want to call it, it is ugly to have some drivers doing
> > one thing with the returned value and others assuming there's an extra
> > zero at the end. It just causes confusion for people reading/copying the
> > code. It would be better if they are all consistent. However, I concede
> > stopping at zero should not be broken, presently.
> >
> > Logan
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
