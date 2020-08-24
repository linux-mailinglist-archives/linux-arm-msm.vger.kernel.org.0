Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 843A624F0A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Aug 2020 02:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgHXAE4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Aug 2020 20:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbgHXAEs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Aug 2020 20:04:48 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521C0C0613ED
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2020 17:04:47 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id q14so5803157ilj.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2020 17:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2qvzvkep7ZlQHNyjrGsuXQAp+x7s+RjdNiOv81NxtoQ=;
        b=ph3cmZeijsQTsHnHnrr9eCGgxMPexaLwCGnu3F9Od9T7oE9SJ1xriseSecoaLR+A31
         cxdttU99z8vHmtpSvs9wLGOOgPOY6GzwuKuovZh4UMjplaxKJu/wyAtKKGV99cTnuUCc
         b9jW667DJd78gpOSqL093TQrnCvZ9zpW4sDgc9e3s4gqdpHbIh0cqwIbSVLaQrTLqDAX
         thER0vKrZAtqkOJvYQeGZuITMeh4kPZ6AWC1kOvIEmnWvuxZr35lD2OOnlXMpkqB5GBo
         XlqFU7D/ggoXmysuTUVEiDWk1jvnBEMzHRuwpliqu/K2HYrSEPvB6WXxqYArt4mYifKa
         QdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2qvzvkep7ZlQHNyjrGsuXQAp+x7s+RjdNiOv81NxtoQ=;
        b=s6Fo6rK/nkhEdlJXwAy7kC5h1+woXIpLEOt4Ad5WfUy7EGqmYRknpdadiARQEVoJ23
         2IXJDbkvH31Lt6mk5pDPEG36qmVEPnBj47WiPszYFbnsush4kcPj3bWCm3Rta1upkC1c
         zt7+mvkQwP0ywg912v6P9L4vElOowwvV3s7aAfyBpx/6l1VhgHJzlPNlXL5hxi1WG+Hn
         t40YAlbxJAC6roqy9GTFfHs60n1osL8T9D4fCGk6YzZWc/lQCeNjF7y/Alxj961hta9k
         nzBlaJzku/q4ZbOAS5EL9lCK93H90DXkqTFAqkYHo+QSpAn3CRzRdT6Hol+FJNoToKJu
         n0yA==
X-Gm-Message-State: AOAM5314kGd6Rr8aDK3EEYB7xKFkvDlceNkSJy3v1A5UXol/dwQKqRrE
        hoKIduPWABvytTTaBs0ETzNw98gKP3d/aaRg11HDPg==
X-Google-Smtp-Source: ABdhPJx+Rb9Dh5afCkPV93ubbfa83YINwHuyBNL6aGGIC9gNFt/GVdQQ5DqMV2LQPpqLPd5cGrS+QMzugsAJ9rHE3h4=
X-Received: by 2002:a92:4f:: with SMTP id 76mr2640989ila.11.1598227486317;
 Sun, 23 Aug 2020 17:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191221150402.13868-1-murphyt7@tcd.ie> <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
 <20200529124523.GA11817@infradead.org> <CGME20200529190523eucas1p2c086133e707257c0cdc002f502d4f51d@eucas1p2.samsung.com>
 <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com> <ef2150d5-7b6a-df25-c10d-e43316fe7812@samsung.com>
 <b9140772-0370-a858-578c-af503a06d8e9@deltatee.com>
In-Reply-To: <b9140772-0370-a858-578c-af503a06d8e9@deltatee.com>
From:   Tom Murphy <murphyt7@tcd.ie>
Date:   Mon, 24 Aug 2020 01:04:35 +0100
Message-ID: <CALQxJuutRaeX89k2o4ffTKYRMizmMu0XbRnzpFuSSrkQR02jKg@mail.gmail.com>
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Christoph Hellwig <hch@infradead.org>,
        iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Julien Grall <julien.grall@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Alex Williamson <alex.williamson@redhat.com>,
        linux-mediatek@lists.infradead.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        virtualization@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        Robin Murphy <robin.murphy@arm.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Logan/All,

I have added a check for the sg_dma_len == 0 :
"""
 } __sgt_iter(struct scatterlist *sgl, bool dma) {
        struct sgt_iter s = { .sgp = sgl };

+       if (sgl && sg_dma_len(sgl) == 0)
+           s.sgp = NULL;

        if (s.sgp) {
            .....
"""
at location [1].
but it doens't fix the problem.

You're right though, this change does need to be made, this code
doesn't handle pages of sg_dma_len(sg) == 0 correctly
So my guess is that we have more bugs in other parts of the i915
driver (or there is a problem with my "sg_dma_len == 0" fix above).
I have been trying to spot where else the code might be buggy but I
haven't had any luck so far.

I'm doing a microconfernce (at LPC 2020) this wednesdays [1] on this
if you're interested in attending.
I'm hoping I can chat about it with a few people and find how can
reproduce and fix this issues. I don't have any more time I can give
to this unfortunately and it would be a shame for the work to go to
waste.

[0] https://github.com/torvalds/linux/blob/d012a7190fc1fd72ed48911e77ca97ba4521bccd/drivers/gpu/drm/i915/i915_scatterlist.h#L28
[1] https://linuxplumbersconf.org/event/7/contributions/846/

On Fri, 29 May 2020 at 22:21, Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2020-05-29 3:11 p.m., Marek Szyprowski wrote:
> > Patches are pending:
> > https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
>
> Cool, nice! Though, I still don't think that fixes the issue in
> i915_scatterlist.h given it still ignores sg_dma_len() and strictly
> relies on sg_next()/sg_is_last() to stop iterating -- and I suspect this
> is the bug that got in Tom's way.
>
> >> However, as Robin pointed out, there are other ugly tricks like stopping
> >> iterating through the SGL when sg_dma_len() is zero. For example, the
> >> AMD driver appears to use drm_prime_sg_to_page_addr_arrays() which does
> >> this trick and thus likely isn't buggy (otherwise, I'd expect someone to
> >> have complained by now seeing AMD has already switched to IOMMU-DMA.
> >
> > I'm not sure that this is a trick. Stopping at zero sg_dma_len() was
> > somewhere documented.
>
> Well whatever you want to call it, it is ugly to have some drivers doing
> one thing with the returned value and others assuming there's an extra
> zero at the end. It just causes confusion for people reading/copying the
> code. It would be better if they are all consistent. However, I concede
> stopping at zero should not be broken, presently.
>
> Logan
