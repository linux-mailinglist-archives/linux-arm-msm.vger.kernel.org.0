Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610D51AD3AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 02:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbgDQAdO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 20:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725858AbgDQAdO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 20:33:14 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FF3C061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 17:33:14 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id c24so60996uap.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 17:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1ucYU/r7+yD1eULFrMllNCtHtA6o8h+uSI2plba/H4A=;
        b=ELhdnX0AGyli5AW8J9vflrzj7yYF3tC1CxfidL2Vrto5TlTdT4mgKO1Zmt/ydIOSiH
         OIb87NyRtTOWWvNCBZynYWeIZApLb6vJhDnmCx+YXEIq3n0e25UU1iTecNsF0FDkioHy
         3xy49uFb1shFcKD0f/zwiIk2H4IfUc2pfpYTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ucYU/r7+yD1eULFrMllNCtHtA6o8h+uSI2plba/H4A=;
        b=kzvGVxOIEUTdy4vhR0VPszSrT+zBN4sAv3QMae9sPuHljo91olTdp27ClGyUZBB/p5
         1jyuFfFSAjduZMslSAnzN9n102kvsdV/Dk8WSirhbNiDCean82WR7pBCF6yRMRzJlaTD
         n7fjwJcnLhvAGYnaco3WkRcyfE2PEhTEqRsG1juKNwuLJFcer+3DHt9/6WD6sV1jybSE
         93Pbs9WM5pV4K+L9HG41vjxptGl5LgC4+PXBcJpoFFfoWj82gXhPJsTKQsahM+8Qa0qc
         Cp9UDIk15XTP10DQdb7cyIOk7HJe4Dm/bbhsDSSnOFAmFqOkSsbJCvyoXxbYPmzYY5tC
         VTGA==
X-Gm-Message-State: AGi0PuaeaQ2iC1UfZ9XNkZNGUME5Dp6rrUXnT8AOrg6KKGSyRSM2VhTM
        wuOUQIFOI4VZU7FazoVHMXtfod5rXeM=
X-Google-Smtp-Source: APiQypIZ0r4s/wQob0Stcv09uRUl73a/1uLL9bN8orV/PVG5TBV7MRj/DsxX3Fj+0rSBhKAas6YSpg==
X-Received: by 2002:ab0:7509:: with SMTP id m9mr552724uap.36.1587083593004;
        Thu, 16 Apr 2020 17:33:13 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id d12sm6393774vke.55.2020.04.16.17.33.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 17:33:12 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id 1so149449vsl.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 17:33:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3204:: with SMTP id r4mr282736vsf.109.1587083591511;
 Thu, 16 Apr 2020 17:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200414102312.1.I295cb72bc5334a2af80313cbe97cb5c9dcb1442c@changeid>
 <4cf5c74a-44c0-190d-e752-a46ccd5cda7d@codeaurora.org>
In-Reply-To: <4cf5c74a-44c0-190d-e752-a46ccd5cda7d@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 16 Apr 2020 17:33:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xw5n2CR3+3NtW1+7HD947ULeNQqCAC_OWAY0yRD=cfVQ@mail.gmail.com>
Message-ID: <CAD=FV=Xw5n2CR3+3NtW1+7HD947ULeNQqCAC_OWAY0yRD=cfVQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Remove the pm_lock
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 16, 2020 at 3:51 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi,
>
> On 4/14/2020 10:53 PM, Douglas Anderson wrote:
> > It has been postulated that the pm_lock is bad for performance because
> > a CPU currently running rpmh_flush() could block other CPUs from
> > coming out of idle.  Similarly CPUs coming out of / going into idle
> > all need to contend with each other for the spinlock just to update
> > the variable tracking who's in PM.
> >
> > Let's optimize this a bit.  Specifically:
> >
> > - Use a count rather than a bitmask.  This is faster to access and
> >    also means we can use the atomic_inc_return() function to really
> >    detect who the last one to enter PM was.
> > - Accept that it's OK if we race and are doing the flush (because we
> >    think we're last) while another CPU is coming out of idle.  As long
> >    as we block that CPU if/when it tries to do an active-only transfer
> >    we're OK.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >   drivers/soc/qcom/rpmh-internal.h |  7 ++---
> >   drivers/soc/qcom/rpmh-rsc.c      | 46 +++++++++++++++-----------------
> >   2 files changed, 24 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
> > index dba8510c0669..449cd511702b 100644
> > --- a/drivers/soc/qcom/rpmh-internal.h
> > +++ b/drivers/soc/qcom/rpmh-internal.h
> > @@ -97,7 +97,7 @@ struct rpmh_ctrlr {
> >    * @num_tcs:            Number of TCSes in this DRV.
> >    * @rsc_pm:             CPU PM notifier for controller.
> >    *                      Used when solver mode is not present.
> > - * @cpus_entered_pm:    CPU mask for cpus in idle power collapse.
> > + * @cpus_in_pm:         Number of CPUs not in idle power collapse.
> >    *                      Used when solver mode is not present.
> >    * @tcs:                TCS groups.
> >    * @tcs_in_use:         S/W state of the TCS; only set for ACTIVE_ONLY
> > @@ -111,8 +111,6 @@ struct rpmh_ctrlr {
> >    *                      grabbing this lock and a tcs_lock at the same time,
> >    *                      grab the tcs_lock first so we always have a
> >    *                      consistent lock ordering.
> > - * @pm_lock:            Synchronize during PM notifications.
> > - *                      Used when solver mode is not present.
> >    * @client:             Handle to the DRV's client.
> >    */
> >   struct rsc_drv {
> > @@ -121,11 +119,10 @@ struct rsc_drv {
> >       int id;
> >       int num_tcs;
> >       struct notifier_block rsc_pm;
> > -     struct cpumask cpus_entered_pm;
> > +     atomic_t cpus_in_pm;
> >       struct tcs_group tcs[TCS_TYPE_NR];
> >       DECLARE_BITMAP(tcs_in_use, MAX_TCS_NR);
> >       spinlock_t lock;
> > -     spinlock_t pm_lock;
> >       struct rpmh_ctrlr client;
> >   };
> >
> > diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> > index 732316bb67dc..4e45a8ac6cde 100644
> > --- a/drivers/soc/qcom/rpmh-rsc.c
> > +++ b/drivers/soc/qcom/rpmh-rsc.c
> > @@ -740,6 +740,8 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
> >    * SLEEP and WAKE sets. If AMCs are busy, controller can not enter
> >    * power collapse, so deny from the last cpu's pm notification.
> >    *
> > + * Context: Must be called with the drv->lock held.
> > + *
> >    * Return:
> >    * * False          - AMCs are idle
> >    * * True           - AMCs are busy
> > @@ -754,9 +756,6 @@ static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
> >        * dedicated TCS for active state use, then re-purposed wake TCSes
> >        * should be checked for not busy, because we used wake TCSes for
> >        * active requests in this case.
> > -      *
> > -      * Since this is called from the last cpu, need not take drv or tcs
> > -      * lock before checking tcs_is_free().
> >        */
> >       if (!tcs->num_tcs)
> >               tcs = &drv->tcs[WAKE_TCS];
> > @@ -791,36 +790,36 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
> >   {
> >       struct rsc_drv *drv = container_of(nfb, struct rsc_drv, rsc_pm);
> >       int ret = NOTIFY_OK;
> > -
> > -     spin_lock(&drv->pm_lock);
> > +     int cpus_in_pm;
> >
> >       switch (action) {
> >       case CPU_PM_ENTER:
> > -             cpumask_set_cpu(smp_processor_id(), &drv->cpus_entered_pm);
> > -
> > -             if (!cpumask_equal(&drv->cpus_entered_pm, cpu_online_mask))
> > -                     goto exit;
> > +             cpus_in_pm = atomic_inc_return(&drv->cpus_in_pm);
> > +             if (cpus_in_pm < num_online_cpus())
> > +                     return NOTIFY_OK;
> >               break;
> >       case CPU_PM_ENTER_FAILED:
> >       case CPU_PM_EXIT:
> > -             cpumask_clear_cpu(smp_processor_id(), &drv->cpus_entered_pm);
> > -             goto exit;
> > -     }
> > -
> > -     ret = rpmh_rsc_ctrlr_is_busy(drv);
> > -     if (ret) {
> > -             ret = NOTIFY_BAD;
> > -             goto exit;
> > +             atomic_dec(&drv->cpus_in_pm);
> > +             return NOTIFY_OK;
> >       }
> >
> > -     ret = rpmh_flush(&drv->client);
> > -     if (ret)
> > +     /*
> > +      * It's likely we're on the last CPU. Grab the drv->lock and write
> > +      * out the sleep/wake commands to RPMH hardware. Grabbing the lock
> > +      * means that if we race with another CPU coming up we are still
> > +      * guaranteed to be safe. If another CPU came up just after we checked
> > +      * and has already started an active transfer then we'll notice we're
> > +      * busy and abort. If another CPU comes up after we start flushing it
> > +      * will be blocked from starting an active transfer until we're done
> > +      * flushing. If another CPU starts an active transfer after we release
> > +      * the lock we're still OK because we're no longer the last CPU.
> > +      */
> > +     spin_lock(&drv->lock);
> > +     if (rpmh_rsc_ctrlr_is_busy(drv) || !rpmh_flush(&drv->client))
> >               ret = NOTIFY_BAD;
> > -     else
> > -             ret = NOTIFY_OK;
> > +     spin_unlock(&drv->lock);
> >
> > -exit:
> > -     spin_unlock(&drv->pm_lock);
> >       return ret;
> >   }
> There is a race if we allow other CPUs to exit without pm lock
> below scenarios can happen.
>
> 1. for the last cpu (CPU-x) CPU_PM_ENTER notification came
> 2. On CPU-x, rpmh_flush() is in progress with drv->lock held, which is
> at the flush_batch() stage
> 3. Meanwhile any other CPU (CPU-y) woken up and did CPU_PM_EXIT
> 4. From the woken up cpu, rpmh_invalidate() is invoked.
> 5. It takes ctrlr->cache_lock and empties the cached batch requests
> (making list empty and kfree() the cached requests)
> 6. The last cpu (CPU-x) which was doing rpmh_flush() suddently gets the
> list empty which it was traversing in flush_batch(),
>     leading to null pointer derefence.
>
> To Fix above race condtion, ctrlr->cache_lock should be taken inside
> rpmh_flush() starting point.

Good catch!


> also need to remove lockdep_assert_irqs_disabled() which got insterted,
> since IRQ might be enabled by this time if some CPU exits.

I'm pretty sure lockdep_assert_irqs_disabled() should stay.  That's
talking about whether the local CPU's IRQs are disabled.  Whether
another processor is running or not will not affect the local CPU.


-Doug
