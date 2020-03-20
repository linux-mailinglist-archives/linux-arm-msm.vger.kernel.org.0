Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6F1018C765
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 07:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgCTG2W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 02:28:22 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:39339 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbgCTG2W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 02:28:22 -0400
Received: by mail-il1-f196.google.com with SMTP id w15so4595447ilq.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2020 23:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iNXs70iQMmbCeWom+A/Tg16i/IbQyXAZI0Q/ppb6028=;
        b=mlwq4CYA+23qP9sIb47R10WlCGq2DIeqg0u1nZRI7nIlEwzdaBM16J0diAb1hlohhx
         6DmTCrAETojeuHxXASGkurUqmDfwjHRaPO4za7UkVii+FhFKjU1p/Uh7mi3KFwpjPhsb
         iUmifGiws8WLlb2N+d2f8DAIA3I+MwtdSl7QMUdRy6dZmidqOFzKWaoRrSqr4hGVvYFe
         lxvu2QhZ23+aceqTRPs5AhP4qiprkvMy5v6UfWHtbzwVFjivSqy8raQEj8IKp649aRSz
         OzRNio30MUjHUatFuFBVrSm+4Q22qFcnN1y399wmFgi4y40WUSo1BlDO9PO4lb7z5YMG
         C1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iNXs70iQMmbCeWom+A/Tg16i/IbQyXAZI0Q/ppb6028=;
        b=L6ZMPzJ3VVaoqCfzIwEemMhG338k/u4EO2FxLtXaOXDBKr8re+ZwABJvzqZ2uzM+Ee
         NnlgsdeI1zTEN/weeGv49Irtyv5Vdj+45dYOQkF26L7FK8q82JjictqeyWwcO2gzMB4z
         EGzKRwI76X7Lqe+CvcEHCOS1PinDAw0/isj6aq3u/MlY3sB++MNWo7ksYh9HH8CtNI7Z
         rxJbL9jZ6JMxy9oiQuQ6Qdb9tuMEHzpwsmHBNQYY9u9trRVJjQIwt0bIoSBPIAQdHCq5
         8VBKzXmRf3FvSF85CpaIQyxk9z+gWgXPUTDW7X54WbXHka5AndcG1iBdbmZqlu7KJdk9
         V5lA==
X-Gm-Message-State: ANhLgQ2Z5Z2bQpnn8GZfJIS9/odmTyrk+/FYbfFv/fkjD3SADhJEPhZO
        Y9hlGCTmpwY0ibd9BO6etrnUujrfM2juTNUUELhIsA==
X-Google-Smtp-Source: ADFU+vu5z05Ntsthh3MN1VmTHwq3rO5otoJoIS27t3cZsZdixT+HOBtJfxy3n0Krurf+ZkaYNXqDSZk62sBvXeLV7BQ=
X-Received: by 2002:a92:41c7:: with SMTP id o190mr6554977ila.11.1584685701013;
 Thu, 19 Mar 2020 23:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191221150402.13868-1-murphyt7@tcd.ie> <87blrzwcn8.fsf@intel.com>
 <432d306c-fe9f-75b2-f0f7-27698f1467ad@arm.com> <87o8vzuv4i.fsf@intel.com>
In-Reply-To: <87o8vzuv4i.fsf@intel.com>
From:   Tom Murphy <murphyt7@tcd.ie>
Date:   Thu, 19 Mar 2020 23:28:09 -0700
Message-ID: <CALQxJuujCe7TsqkbfusPnzef2SApDBNPa7wj=U4ozDJWCoBHOg@mail.gmail.com>
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Julien Grall <julien.grall@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Eric Auger <eric.auger@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Any news on this? Is there anyone who wants to try and fix this possible bu=
g?

On Mon, 23 Dec 2019 at 03:41, Jani Nikula <jani.nikula@linux.intel.com> wro=
te:
>
> On Mon, 23 Dec 2019, Robin Murphy <robin.murphy@arm.com> wrote:
> > On 2019-12-23 10:37 am, Jani Nikula wrote:
> >> On Sat, 21 Dec 2019, Tom Murphy <murphyt7@tcd.ie> wrote:
> >>> This patchset converts the intel iommu driver to the dma-iommu api.
> >>>
> >>> While converting the driver I exposed a bug in the intel i915 driver
> >>> which causes a huge amount of artifacts on the screen of my
> >>> laptop. You can see a picture of it here:
> >>> https://github.com/pippy360/kernelPatches/blob/master/IMG_20191219_22=
5922.jpg
> >>>
> >>> This issue is most likely in the i915 driver and is most likely cause=
d
> >>> by the driver not respecting the return value of the
> >>> dma_map_ops::map_sg function. You can see the driver ignoring the
> >>> return value here:
> >>> https://github.com/torvalds/linux/blob/7e0165b2f1a912a06e381e91f0f4e4=
95f4ac3736/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c#L51
> >>>
> >>> Previously this didn=E2=80=99t cause issues because the intel map_sg =
always
> >>> returned the same number of elements as the input scatter gather list
> >>> but with the change to this dma-iommu api this is no longer the
> >>> case. I wasn=E2=80=99t able to track the bug down to a specific line =
of code
> >>> unfortunately.
> >>>
> >>> Could someone from the intel team look at this?
> >>
> >> Let me get this straight. There is current API that on success always
> >> returns the same number of elements as the input scatter gather
> >> list. You propose to change the API so that this is no longer the case=
?
> >
> > No, the API for dma_map_sg() has always been that it may return fewer
> > DMA segments than nents - see Documentation/DMA-API.txt (and otherwise,
> > the return value would surely be a simple success/fail condition).
> > Relying on a particular implementation behaviour has never been strictl=
y
> > correct, even if it does happen to be a very common behaviour.
> >
> >> A quick check of various dma_map_sg() calls in the kernel seems to
> >> indicate checking for 0 for errors and then ignoring the non-zero retu=
rn
> >> is a common pattern. Are you sure it's okay to make the change you're
> >> proposing?
> >
> > Various code uses tricks like just iterating the mapped list until the
> > first segment with zero sg_dma_len(). Others may well simply have bugs.
>
> Thanks for the clarification.
>
> BR,
> Jani.
>
> >
> > Robin.
> >
> >> Anyway, due to the time of year and all, I'd like to ask you to file a
> >> bug against i915 at [1] so this is not forgotten, and please let's not
> >> merge the changes before this is resolved.
> >>
> >>
> >> Thanks,
> >> Jani.
> >>
> >>
> >> [1] https://gitlab.freedesktop.org/drm/intel/issues/new
> >>
> >>
>
> --
> Jani Nikula, Intel Open Source Graphics Center
