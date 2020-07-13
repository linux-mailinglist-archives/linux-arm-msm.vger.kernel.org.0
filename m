Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263D321E1A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 22:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgGMUsl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 16:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgGMUsk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 16:48:40 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A68EBC061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 13:48:40 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id d4so10699898otk.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 13:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lh221sZMEzUwu+YkumvRaKYqnEn8mE4Ip8GmS9KXxVg=;
        b=OSChuGC7pSQQ/bJlgydK0ADw9GvoUXuvT90prm9gM0Cw5HnXeeBbGpWTISeAUDtyfY
         8NWSstNPyc0j3sRyNZSqMoTpyFqwGZvcCTm6iA6ni1f6Qx/pcOO3DscgLa/zWB8Oaqkv
         Ku+NZmXt4FPKqF3r7TAqgG/zBcC9K1l/G6lOU+yIKh2l5/7zIzxTz7jGOPILinNI/AOq
         K50ZacpLUVPLV3Ir0ZUyEITsvg6TkE0ElG84vHO3+Yf/grx5v3AGgKKLyLgUfQ2WJgWD
         o5Nr6AEl+TsYsFneyN3RyzJWH8m9mSrjU/8m4g9IUNhVxapN2eG75uAUQUJDesJTqLlD
         4/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lh221sZMEzUwu+YkumvRaKYqnEn8mE4Ip8GmS9KXxVg=;
        b=J8+TH7l3b2r/j5l0ZOL2UNSVPQyysd+4dKx7lQr+zNB1ESUmCB9KDSTtYiJizZSMot
         H4Zj+0tbKVGXfo4fqFehjNfdbe4horID2v7XhfAccLWriu0WWjBtfJM6o32K3kd9FuhL
         KcPIDSVtVijHCtwjg9HHum6kqMSJEocAmDX3Y7io6zDEBS9VcunArRobQa48ky4GhOd1
         rd/ZtWBrG7tiEi3IPr/j5poi2nDExqLSFywC0L1bcc+eKKKsVCRt5m56Thymn+xTEbfy
         6BMfj7kWCUbN0++owk3MGQiFhwokMqPTDXs7SwAZR3oVSN7ir2gshhSrIyx7eXtgK/Gk
         gYJg==
X-Gm-Message-State: AOAM533aNwgAGEgbGOP1YvjnmZt95ANhevAsmItBpr6Kz3DdHqNHt+/K
        tzMceVJ0CRZpugFy8Boe8smAXmZgHnF3z28NY93qUQ==
X-Google-Smtp-Source: ABdhPJy9C2Om36y+PsKBCgaQym7s/MdG28IdH6HbTh4AdwgaQh3TIVhuMIJqa0h9wiOoK7uSCd2oiaqiq2jjsDnYL9s=
X-Received: by 2002:a9d:7303:: with SMTP id e3mr1212486otk.221.1594673320007;
 Mon, 13 Jul 2020 13:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-6-john.stultz@linaro.org> <20200702141825.GA16941@willie-the-truck>
 <CALAqxLVZ2EhutYjOt7Be1RgnYwHT6-4m6DxA-t1wuxuSy=6yDQ@mail.gmail.com>
 <20200710075411.GA30011@willie-the-truck> <CALAqxLWadLrxckRHRAR0Q417RnFKquQJbRfO_DLEVH56cykRow@mail.gmail.com>
 <20200713204133.GA3731@willie-the-truck>
In-Reply-To: <20200713204133.GA3731@willie-the-truck>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 13 Jul 2020 13:48:29 -0700
Message-ID: <CALAqxLXDVRzWDfuAS78EFwyYs3yr3QrPF3Tze0KAW1fo9c7M2A@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To:     Will Deacon <will@kernel.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 13, 2020 at 1:41 PM Will Deacon <will@kernel.org> wrote:
>
> On Fri, Jul 10, 2020 at 03:21:53PM -0700, John Stultz wrote:
> > On Fri, Jul 10, 2020 at 12:54 AM Will Deacon <will@kernel.org> wrote:
> > > On Thu, Jul 09, 2020 at 08:28:45PM -0700, John Stultz wrote:
> > > > On Thu, Jul 2, 2020 at 7:18 AM Will Deacon <will@kernel.org> wrote:
> > > > > On Thu, Jun 25, 2020 at 12:10:39AM +0000, John Stultz wrote:
> > > > > > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > > > > > index b510f67dfa49..714893535dd2 100644
> > > > > > --- a/drivers/iommu/Kconfig
> > > > > > +++ b/drivers/iommu/Kconfig
> > > > > > @@ -381,6 +381,7 @@ config SPAPR_TCE_IOMMU
> > > > > >  config ARM_SMMU
> > > > > >       tristate "ARM Ltd. System MMU (SMMU) Support"
> > > > > >       depends on (ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)) && MMU
> > > > > > +     depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> > > > > >       select IOMMU_API
> > > > > >       select IOMMU_IO_PGTABLE_LPAE
> > > > > >       select ARM_DMA_USE_IOMMU if ARM
> > > > >
> > > > > This looks like a giant hack. Is there another way to handle this?
> > > >
> > > > Sorry for the slow response here.
> > > >
> > > > So, I agree the syntax looks strange (requiring a comment obviously
> > > > isn't a good sign), but it's a fairly common way to ensure drivers
> > > > don't get built in if they optionally depend on another driver that
> > > > can be built as a module.
> > > >   See "RFKILL || !RFKILL", "EXTCON || !EXTCON", or "USB_GADGET ||
> > > > !USB_GADGET" in various Kconfig files.
> > > >
> > > > I'm open to using a different method, and in a different thread you
> > > > suggested using something like symbol_get(). I need to look into it
> > > > more, but that approach looks even more messy and prone to runtime
> > > > failures. Blocking the unwanted case at build time seems a bit cleaner
> > > > to me, even if the syntax is odd.
> > >
> > > Maybe just split it out then, so that the ARM_SMMU entry doesn't have this,
> > > as that driver _really_ doesn't care about SoC details like this. In other
> > > words, add a new entry along the lines of:
> > >
> > >         config ARM_SMMU_QCOM_IMPL
> > >         default y
> > >         #if QCOM_SCM=m this can't be =y
> > >         depends on ARM_SMMU & (QCOM_SCM || !QCOM_SCM)
> > >
> > > and then have arm-smmu.h provide a static inline qcom_smmu_impl_init()
> > > which returns -ENODEV if CONFIG_ARM_SMMU_QCOM_IMPL=n and hack the Makefile
> > > so that we don't bother to compile arm-smmu-qcom.o in that case.
> > >
> > > Would that work?
> >
> > I think this proposal still has problems with the directionality of the call.
> >
> > The arm-smmu-impl.o calls to arm-smmu-qcom.o which calls qcom_scm.o
> > So if qcom_scm.o is part of a module, the calling code in
> > arm-smmu-qcom.o also needs to be a module, which means CONFIG_ARM_SMMU
> > needs to be a module.
> >
> > I know you said the arm-smmu driver doesn't care about SoC details,
> > but the trouble is that currently the arm-smmu driver does directly
> > call the qcom-scm code. So it is a real dependency. However, if
> > QCOM_SCM is not configured, it calls stubs and that's ok.  In that
> > way, the "depends on QCOM_SCM || !QCOM_SCM" line actually makes sense.
> > It looks terrible because we're used to boolean logic, but it's
> > ternary.
>
> Yes, it looks ugly, but the part I really have issues with is that building
> QCOM_SCM=m and ARM_SMMU=y is perfectly fine if you don't run on an SoC
> with the qcom implementation. I don't see why we need to enforce things
> here beyond making sure that all selectable permutations _build_ and
> fail gracefully at runtime on the qcom SoC if SCM isn't available.

Ok. Thanks, that context/rationale makes sense to me now!  I'll dig in
and see if I can figure out the runtime get_symbol handling you
suggested for the scm callout.

Thanks again for the feedback!
-john
