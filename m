Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF8B729DB68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 00:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390454AbgJ1XyA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 19:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390025AbgJ1XxO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 19:53:14 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F666C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 16:53:14 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id x203so1408418oia.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 16:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cyg6GxQ7aGb81qvbCIMAVMxTggeWanr2R08/4sn6t1o=;
        b=Qbp/oUp5QTY96Xl+9fGyEj7BDD8Ntl3OjFgxZOrUkX+HGGHN3+g8so2aa8C+yTl9oz
         GR6wK5vCSeupCfxmYnLAWXGnx+32aVMYvvIrOCpLZso2axKsw447co85OgvtdWMpbe8L
         3PEWfGhaSIiWG00RKHUXD7qqCwzpjcIgMydaZU274pRjaR219g+su48SCT1RT3C6bdPw
         of0InmDrAk8osDU7hXLCtd3Cw2RqlDp6sFnUjo+dq/USuWq8RP+lsDVpLSZezfphvbhs
         z1APFV/clS1r7+0FcV+R8Hr1g8mUYDkL7XozwDB1DaqjUhXiWO6DQWxm+u2bDmiqrXfo
         AMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cyg6GxQ7aGb81qvbCIMAVMxTggeWanr2R08/4sn6t1o=;
        b=nOoH+YYSyyGaW2gZ+T3XaRivMKXw+pmT0Any70jS8oHTstIv3E5U9TafLIEq+PFcM/
         rCSg1ekMGlOCz4Hju9P1Qm97ufNuGIx7JGS0rSJppgk3V3dQ2irKQQd5nVRve7WXokX5
         VACjFqp8y//42J9Kk3r4jKYpiXwwytwfHWtTMADsRkN9fMGqIzRxmlwx31Ap6SDokN/F
         3po90sZmEffEW8RG8yLcfP1SWeBxFTeiAy9sbn9vVC1Epesn+fr8IMZuszuXScaeWeOu
         yLLOSMUg21a2j4YACs9+B0J34FZjXpebL5fQHpZGMBJFx2+hXitXylyPU77Xk9OBfCsZ
         rMNQ==
X-Gm-Message-State: AOAM530+htDHxnYOkqtrp1pFrwr3iBLgvCPNiPpr1IgXC7Xd7t35E7zg
        CuZI14rfR2bMsl6pxNLq9z+K9AoXGjELIgogQeV4Ww3c3PZwwA==
X-Google-Smtp-Source: ABdhPJwFK6CsnkmHO+BIuvRK/KRVa2t3oQuVylL8YPWfyyIxfJPnOIDKRcTsPvp8IeE3+sA/i60PwxYpTSJ7+yq2PVI=
X-Received: by 2002:a05:6808:9b8:: with SMTP id e24mr4180101oig.97.1603864439722;
 Tue, 27 Oct 2020 22:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-6-john.stultz@linaro.org> <20200702141825.GA16941@willie-the-truck>
 <CALAqxLVZ2EhutYjOt7Be1RgnYwHT6-4m6DxA-t1wuxuSy=6yDQ@mail.gmail.com>
 <20200710075411.GA30011@willie-the-truck> <CALAqxLWadLrxckRHRAR0Q417RnFKquQJbRfO_DLEVH56cykRow@mail.gmail.com>
 <20200713204133.GA3731@willie-the-truck>
In-Reply-To: <20200713204133.GA3731@willie-the-truck>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 27 Oct 2020 22:53:47 -0700
Message-ID: <CALAqxLUDVEq4ds2Wbic6uaK3=dELKKO4eGQxjHFFz19GeUFd_w@mail.gmail.com>
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
        iommu@lists.linux-foundation.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 13, 2020 at 1:41 PM Will Deacon <will@kernel.org> wrote:
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

Hey Will,
  Sorry to dredge up this old thread. I've been off busy with other
things and didn't get around to trying to rework this until now.

Unfortunately I'm still having some trouble coming up with a better
solution. Initially I figured I'd rework the qcom_scm driver to, so
that we have the various qcom_scm_* as inline functions, which call
out to function pointers that the qcom_scm driver would register when
the module loaded (Oof, and unfortunately there are a *ton* qcom_scm_*
functions so its a bunch of churn).

The trouble I realized with that approach is that if the ARM_SMMU code
is built in, then it may try to use the qcom_scm code before the
module loads and sets those function pointers. So while it would build
ok, the issue would be when the arm_smmu_device_reset() is done by
done on arm_smmu_device_probe(), it wouldn't actually call the right
code.  There isn't a really good way to deal with the module loading
at some random time after arm_smmu_device_probe() completes.

This is the benefit of the module symbol dependency tracking: If the
arm_smmu.ko calls symbols in qcom_scm.ko then qcom_scm.ko has to load
first.
But if arm_smmu is built in, I haven't found a clear mechanism to
force qcom_scm to load before we probe, if it's configured as a
module.

I also looked into the idea of reworking the arm-smmu-impl code to be
modular instead, and while it does provide a similar method of using
function pointers to minimize the amount of symbols the arm-smmu code
needs to know about, the initialization call path is
arm_smmu_device_probe -> arm_smmu_impl_init -> qcom_smmu_impl_init. So
it doesn't really allow for dynamic registration of implementation
modules at runtime.

So I'm sort of stewing on maybe trying to rework the directionality,
so the arm-smmu-qcom.o code probes and calls arm_smmu_impl_init and
that is what initializes the arm_smmu_device_probe logic?

Alternatively, I'm considering trying to switch the module dependency
annotation so that the CONFIG_QCOM_SCM modularity depends on ARM_SMMU
being a module. But that is sort of putting the restriction on the
callee instead of the caller (sort of flipping the meaning of the
depends), which feels prone to later trouble (and with multiple users
of CONFIG_QCOM_SCM needing similar treatment, it would make it
difficult to discover the right combination of configs needed to allow
it to be a module).

Anyway, I wanted to reach out to see if you had any further ideas
here. Sorry for letting such a large time gap pass!

thanks
-john
