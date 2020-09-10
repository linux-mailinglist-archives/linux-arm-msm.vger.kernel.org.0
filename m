Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED973264714
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 15:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730740AbgIJNfH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 09:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730909AbgIJNeC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 09:34:02 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877F3C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 06:33:55 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id b6so7048252iof.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 06:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NA4xq/RvWtw1DoG4R42VuDAYvxbq5gOs0uGkp97do30=;
        b=fcQ8pRBPaEWiThwI4IpJI/6RvrpktlhqIcuTs8ion57IfAcoLZwMinlg018HPs4g0P
         PfERQLGzgxTimYY/S16DcluJPa3UrMAv2VeDrvrD2khzMlgcNU3uG+U66xQTcGI4k/PB
         tyd6Y57erW7Jw7CdoQkzGYnD3z09a+1xAJWCw3ZTA9vq0DdHjCGpzxmBZebxDdyQNZ5o
         a8n4/aQGMi16zmzKxYbuyXtVYNEIktp6No97ibi4qLI+zDV4g/TXIXD87q5g2S3KNUFg
         wjgBbIjqjQrEef6DxEeF173z4nhe4RTeiKBDtbYrCu4PSy+IwGvrlXsJFLKINZmU1V2I
         yoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NA4xq/RvWtw1DoG4R42VuDAYvxbq5gOs0uGkp97do30=;
        b=tyzySH8inQt1/2iOtI/+t5Gp2v3WDrLJXrE6BLoNtI9SQY1ZxI1djOxWE9rehs09Hi
         8pECnK4k+f+3gVwujTIz5UFY1q3EbSTyhW7musLchNHnFSTx6ivXsjz2cZkItFN9qzy2
         ufirLzlr9UMulwZ/1tZ8PvxrwbZSi6miTeZTPJS8lJDQ1zs0vGP6J0thxz1yD2QzahXt
         5MrAPPP03RgUuH9ANlcwdD2PURJHv96d+uJVnb11Mc0bfuiNRhGjboxBieZUerFxLBFA
         vayWfrk4ieEt+z/oW1pP7nSfIMAFK7kiyDCGJ41/L0ATB03pPc3E9wh/UPVhR1FrXwJi
         TwTg==
X-Gm-Message-State: AOAM530oR6VSG3BTitShVRmeqDA4umUKeJCr36cV27BoPuPiDTFl4gzX
        ANNIF0sHxF3BjyduvgzOdVo+RW5SSv3bV+0atbn6lA==
X-Google-Smtp-Source: ABdhPJzlID7Qr9FJiMTGq9orpwBT55dMvomyRpqx73nK5lHz5vZjsdxpDDRxLur0/nChDVSeWcISfULGX7CKyavrOhU=
X-Received: by 2002:a02:834a:: with SMTP id w10mr8873252jag.63.1599744834395;
 Thu, 10 Sep 2020 06:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191221150402.13868-1-murphyt7@tcd.ie> <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
 <20200529124523.GA11817@infradead.org> <CGME20200529190523eucas1p2c086133e707257c0cdc002f502d4f51d@eucas1p2.samsung.com>
 <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com> <ef2150d5-7b6a-df25-c10d-e43316fe7812@samsung.com>
 <b9140772-0370-a858-578c-af503a06d8e9@deltatee.com> <CALQxJuutRaeX89k2o4ffTKYRMizmMu0XbRnzpFuSSrkQR02jKg@mail.gmail.com>
 <766525c3-4da9-6db7-cd90-fb4b82cd8083@deltatee.com> <60a82319-cbee-4cd1-0d5e-3c407cc51330@linux.intel.com>
 <e598fb31-ef7a-c2ee-8a54-bf62d50c480c@deltatee.com> <b27cae1f-07ff-bef2-f125-a5f0d968016d@linux.intel.com>
 <CALQxJut5c=cWdi+SVkN3JnbkhPSYmLkOyRUhduL-UJ9gyKn9Ow@mail.gmail.com>
 <7106602a-9964-851e-9c4e-d8acf4033b89@linux.intel.com> <ea24e077-5aa6-dd8e-69a7-d186b606703f@linux.intel.com>
In-Reply-To: <ea24e077-5aa6-dd8e-69a7-d186b606703f@linux.intel.com>
From:   Tom Murphy <murphyt7@tcd.ie>
Date:   Thu, 10 Sep 2020 14:33:43 +0100
Message-ID: <CALQxJus4prs0T6G9Z4bw5BDgwmkaiynBcoknLsYEY45SNZ6Ukg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/8] Convert the intel iommu driver to the
 dma-iommu api
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc:     kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Julien Grall <julien.grall@arm.com>,
        Will Deacon <will@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Christoph Hellwig <hch@infradead.org>,
        linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Robin Murphy <robin.murphy@arm.com>,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        virtualization@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        David Woodhouse <dwmw2@infradead.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org, Kukjin Kim <kgene@kernel.org>,
        Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 9 Sep 2020 at 13:56, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 09/09/2020 10:16, Tvrtko Ursulin wrote:
> > On 08/09/2020 23:43, Tom Murphy wrote:
> >> On Tue, 8 Sep 2020 at 16:56, Tvrtko Ursulin
> >> <tvrtko.ursulin@linux.intel.com> wrote:
> >>> On 08/09/2020 16:44, Logan Gunthorpe wrote:
> >>>> On 2020-09-08 9:28 a.m., Tvrtko Ursulin wrote:
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h
> >>>>>> b/drivers/gpu/drm/i915/i915
> >>>>>> index b7b59328cb76..9367ac801f0c 100644
> >>>>>> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
> >>>>>> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
> >>>>>> @@ -27,13 +27,19 @@ static __always_inline struct sgt_iter {
> >>>>>>     } __sgt_iter(struct scatterlist *sgl, bool dma) {
> >>>>>>            struct sgt_iter s = { .sgp = sgl };
> >>>>>>
> >>>>>> +       if (sgl && !sg_dma_len(s.sgp))
> >>>>>
> >>>>> I'd extend the condition to be, just to be safe:
> >>>>>       if (dma && sgl && !sg_dma_len(s.sgp))
> >>>>>
> >>>>
> >>>> Right, good catch, that's definitely necessary.
> >>>>
> >>>>>> +               s.sgp = NULL;
> >>>>>> +
> >>>>>>            if (s.sgp) {
> >>>>>>                    s.max = s.curr = s.sgp->offset;
> >>>>>> -               s.max += s.sgp->length;
> >>>>>> -               if (dma)
> >>>>>> +
> >>>>>> +               if (dma) {
> >>>>>> +                       s.max += sg_dma_len(s.sgp);
> >>>>>>                            s.dma = sg_dma_address(s.sgp);
> >>>>>> -               else
> >>>>>> +               } else {
> >>>>>> +                       s.max += s.sgp->length;
> >>>>>>                            s.pfn = page_to_pfn(sg_page(s.sgp));
> >>>>>> +               }
> >>>>>
> >>>>> Otherwise has this been tested or alternatively how to test it?
> >>>>> (How to
> >>>>> repro the issue.)
> >>>>
> >>>> It has not been tested. To test it, you need Tom's patch set without
> >>>> the
> >>>> last "DO NOT MERGE" patch:
> >>>>
> >>>> https://lkml.kernel.org/lkml/20200907070035.GA25114@infradead.org/T/
> >>>
> >>> Tom, do you have a branch somewhere I could pull from? (Just being lazy
> >>> about downloading a bunch of messages from the archives.)
> >>
> >> I don't unfortunately. I'm working locally with poor internet.
> >>
> >>>
> >>> What GPU is in your Lenovo x1 carbon 5th generation and what
> >>> graphical/desktop setup I need to repro?
> >>
> >>
> >> Is this enough info?:
> >>
> >> $ lspci -vnn | grep VGA -A 12
> >> 00:02.0 VGA compatible controller [0300]: Intel Corporation HD
> >> Graphics 620 [8086:5916] (rev 02) (prog-if 00 [VGA controller])
> >>      Subsystem: Lenovo ThinkPad X1 Carbon 5th Gen [17aa:224f]
> >>      Flags: bus master, fast devsel, latency 0, IRQ 148
> >>      Memory at eb000000 (64-bit, non-prefetchable) [size=16M]
> >>      Memory at 60000000 (64-bit, prefetchable) [size=256M]
> >>      I/O ports at e000 [size=64]
> >>      [virtual] Expansion ROM at 000c0000 [disabled] [size=128K]
> >>      Capabilities: [40] Vendor Specific Information: Len=0c <?>
> >>      Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00
> >>      Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable- 64bit-
> >>      Capabilities: [d0] Power Management version 2
> >>      Capabilities: [100] Process Address Space ID (PASID)
> >>      Capabilities: [200] Address Translation Service (ATS)
> >
> > Works for a start. What about the steps to repro? Any desktop
> > environment and it is just visual corruption, no hangs/stalls or such?
> >
> > I've submitted a series consisting of what I understood are the patches
> > needed to repro the issue to our automated CI here:
> >
> > https://patchwork.freedesktop.org/series/81489/
> >
> > So will see if it will catch something, or more targeted testing will be
> > required. Hopefully it does trip over in which case I can add the patch
> > suggested by Logan on top and see if that fixes it. Or I'll need to
> > write a new test case.
> >
> > If you could glance over my series to check I identified the patches
> > correctly it would be appreciated.
>
> Our CI was more than capable at catching the breakage so I've copied you
> on a patch (https://patchwork.freedesktop.org/series/81497/) which has a
> good potential to fix this. (Or improve the robustness of our sg walks,
> depends how you look at it.)
>
> Would you be able to test it in your environment by any chance? If it
> works I understand it unblocks your IOMMU work, right?

I tested your latest patch set ([PATCH 1/2] drm/i915: Fix DMA mapped
scatterlist walks) and it fixes the issue. great work!

>
> Regards,
>
> Tvrtko
