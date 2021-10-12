Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6FB429BFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 05:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbhJLDhK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 23:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbhJLDhJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 23:37:09 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5EBC06161C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 20:35:07 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id z15so12152422qvj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 20:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EmhQGrBHhBqco3/fKYTerqn3hrMIea7RZ3yw7yTntJk=;
        b=FC1XDkTlI9I/tEz1ohiUY519cWZieN3uOODYV1C8Mv3OPjdtuFF+dqXcKq77X5dTbL
         FITyfzUfZejn0lwoVQeHM4AB2z4b5c5tInY0RTkagZbfu5nYFlWPBc5Zx/zpJMx3zM5T
         4v/o6h1PcKie+43TKXDMoBuLDUJX7aItxVIUwGjHMLdz2mtn+hb6QeNbKqm4fEoCBz6p
         8K8yqovQoXvFiY2FMTkwqAP8uFXwjIjE+AiWX1ww9oZJJ99LE+Hy8oYKAZ8Sy+kQYNFs
         MzLN+AGWmAWrziF0nCvPLEkzSA9KcMArO6SdzuV4FN6wl/LXMiF3A/sm2Jz+cRzHwFSu
         mokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EmhQGrBHhBqco3/fKYTerqn3hrMIea7RZ3yw7yTntJk=;
        b=gNRh4zux4t37MsEHXWPAkw3Oe5CmruDDMa+IqUix/fQ0Ko+Zcmdi53GZqMam/Dz3Iu
         1DaqfO0M4rQGxOhCZM1gdH+WDgOipD5i8SYRRCDGb4etfmRqPelpjSw8B+6SoT1+/v/A
         ANMNn2M4R9az7uBn+aKlQByTnMZaXNZVhLyuQkFMgFfnPmnpy6syD26T21lq2ud3YRQj
         rpASoH0C7vLlPWwO/ghMFD9BHTm3PwCCOD4IqjCnh4CyYruhhfm99o4pW8dLbCTj/ldK
         GEWCnbBhoC52hK95xdMFJYtZAibW/rBMB7k4HeyC+Bv9UsjwkgXOQuhZHQXooc2u3oG9
         Nyqg==
X-Gm-Message-State: AOAM533g5NcO9FyNak6CDRDSSo2eIe7fiL7k0ujYneq9lr6jSqmRVHI0
        42OKhAKnWWt+oYnta4h7GWly+Q+p8KuSNll1qX0Njg==
X-Google-Smtp-Source: ABdhPJwYk1vV8P7NVAAIhul2dADSwoQQewMWHAp5qbboSqFlQZFU1gNvtKnlICCH4yrsmE2uME429X0JuBEM+OhICKQ=
X-Received: by 2002:a05:6214:70f:: with SMTP id b15mr27855384qvz.16.1634009706228;
 Mon, 11 Oct 2021 20:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211010023350.978638-1-dmitry.baryshkov@linaro.org>
 <YWJpJnaQ2Nr4PUwr@yoga> <CAK8P3a3irqEVH2e9wCK4MSSBKRW-n8pFSzYBks9ri-hepewkUw@mail.gmail.com>
 <CAA8EJpoD4Th1tdwYQLnZur2oA0xX0LojSrNFLyJqdi6+rnB3YQ@mail.gmail.com>
 <CAK8P3a3JwQP1b0KeLRN0UCMmzFn3+gY2oexYUwGyt2bOqC0P4A@mail.gmail.com>
 <CAA8EJppAx_bweNhQuQuA5pQkWpyvtYNqttL-fiKgqpJpRqHMKw@mail.gmail.com> <CAK8P3a3DLP3qPee0us4VZfU7h9ND8vtzA-Lv3a5JVGd=RnxsNg@mail.gmail.com>
In-Reply-To: <CAK8P3a3DLP3qPee0us4VZfU7h9ND8vtzA-Lv3a5JVGd=RnxsNg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 12 Oct 2021 06:34:54 +0300
Message-ID: <CAA8EJposhLFzgXJ3aBXdyvV8ukH+nXQpnY_=uaVBFbgL19QipA@mail.gmail.com>
Subject: Re: [PATCH] iommu: fix ARM_SMMU vs QCOM_SCM compilation
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 11 Oct 2021 at 12:57, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Oct 11, 2021 at 11:10 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 11 Oct 2021 at 09:09, Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Mon, Oct 11, 2021 at 6:11 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > > On Sun, 10 Oct 2021 at 20:42, Arnd Bergmann <arnd@arndb.de> wrote:
> > > >
> > > > The patch seems correct, but it becomes overcomplicated. What about:
> > > > - restoring QCOM_SCM stubs
> > >
> > > The stubs are what has led to the previous bugs in this area to often
> > > go unnoticed for too long, as illustrated by your suggestion
> > >
> > > > - making ARM_SMMU select QCOM_SCM if ARM_SMMU_QCOM
> > >
> > > I assume you meant "select QCOM_SCM if ARCH_QCOM",
> > > after we stop using ARM_SMMU_QCOM?
> > >
> > > > This would have almost the same result as with your patch, but without
> > > > extra ARM_SMMU_QCOM Kconfig symbol.
> > >
> > > The "almost" is the problem: consider the case of
> > >
> > > CONFIG_ARM=y
> > > CONFIG_COMPILE_TEST=y
> > > CONFIG_ARCH_QCOM=n
> > > CONFIG_ARM_SMMU=y
> > > CONFIG_DRM_MSM=m
> > > CONFIG_QCOM_SCM=m (selected by DRM_MSM)
> > >
> > > The stubs here lead to ARM_SMMU linking against the QCOM_SCM
> > > driver from built-in code, which fails because QCOM_SCM itself
> > > is a loadable module.
> >
> > I see. The idealist in me wishes to change my suggestion to
> > 'select QCOM_SCM if ARCH_QCOM || COMPILE_TEST'
> > but I have the subtle feeling that this also might fail somehow.
>
> I think that would actually work, but it has the nasty side-effect
> that simply flipping 'CONFIG_COMPILE_TEST' changes what
> the kernel does, rather than just hiding or unhiding additional
> options.
>
> > > We can move the "select QCOM_SCM" in the ARM_SMMU_QCOM
> > > symbol if we make that a tristate though, if you want to separate it
> > > a little more.
> >
> > This would complicate things a bit, as we would no longer be able to
> > use 'arm-smmu-$(CONFIG_ARM_SMMU_QCOM) +=' construct.
>
> I'm fairly sure we could still use that, Kbuild is smart enough
> to include both 'file-m +=' and 'file-y += ' in 'file.ko', see
> scripts/Makefile.lib:
>
> # If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a
> composite object
> multi-obj-y := $(call multi-search, $(obj-y), .o, -objs -y)
> multi-obj-m := $(call multi-search, $(obj-m), .o, -objs -y -m)
> multi-obj-ym := $(multi-obj-y) $(multi-obj-m)
>
> # Replace multi-part objects by their individual parts,
> # including built-in.a from subdirectories
> real-obj-y := $(call real-search, $(obj-y), .o, -objs -y)
> real-obj-m := $(call real-search, $(obj-m), .o, -objs -y -m)

Ah, I thought Kbuild would accept only  foo-y, please excuse me.

>
> What doesn't work is having a built-in driver in a directory that is
> guarded with a =m symbol, or including a =m object into a =y
> module.
>
>         Arnd



-- 
With best wishes
Dmitry
