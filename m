Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E25E194A62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 22:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbgCZVTN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 17:19:13 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:35202 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727495AbgCZVTN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 17:19:13 -0400
Received: by mail-vs1-f65.google.com with SMTP id u11so4927249vsg.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 14:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HLvF4D/A+305Z0Ss7OvyVOW8EKybx8dnVL63yLJQoSs=;
        b=lLCWTSx5UqSh1z9NnVQzYiYoMn4TP35oA4HiiZ2zg+gz1uWvA+MYB28BWMVb+myRlf
         yBDUSkf7M1bBlypo1Dyzj+oCK+e2sSTUs/746Hrfro3PhrXSHp+6Zqf8eO+3EisjzJVa
         zPwknJn2VhJeTHZuqGhS4nOxlhXGCopNoSS6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HLvF4D/A+305Z0Ss7OvyVOW8EKybx8dnVL63yLJQoSs=;
        b=FiDPcOy2O1yNI/p4pR3XUNikqDkzZt89sP0l86gUrwBFZT1PsNVbh7veqixs7IKF7D
         JEwo4WwJN3o4D+ZfVF2LxMFTJ6hH8EQM+gokDBk7ZtA48yM2c8QAmwcKecIDuJxUQaCL
         8Ngb8ubj0Z6X+3hAkDlzLs0hZX1fTBhdq5np7UJWujSrKvhl2TopjI6/D7L/lzGzF6yV
         PiFwJsTEw+t+1ZLZtFw8W7eam+1U9R5+iurRTySwyPZyZcKSLFystnDiGHb8N4HJpCjg
         CMJjdF32QLCSN0gm/7XbYDERP4E3jO0hG2S0im1YNpGfNp/cOsecRCy1q1zzhdmkKoQf
         D/RA==
X-Gm-Message-State: ANhLgQ3ZEmpx8CE9kWsMncI5c//TDAzcVbZX6TNtDJJRiIc9JosdfzOK
        24tVWyqrjPVzGysNk5YFFo5UDgPnk3g=
X-Google-Smtp-Source: ADFU+vvzDHVkqfymo74D9SY8z1Sl6MgwX7+a2/pBEDO+6t/4S7bnq8ehJTOcPlTWDdt8xWipa5n0vA==
X-Received: by 2002:a67:68c4:: with SMTP id d187mr9088448vsc.92.1585257550755;
        Thu, 26 Mar 2020 14:19:10 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id d10sm1631258vsp.1.2020.03.26.14.19.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2020 14:19:10 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id y138so4911639vsy.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 14:19:09 -0700 (PDT)
X-Received: by 2002:a05:6102:3204:: with SMTP id r4mr8703099vsf.109.1585257549044;
 Thu, 26 Mar 2020 14:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <1585244270-637-1-git-send-email-mkshah@codeaurora.org> <1585244270-637-5-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1585244270-637-5-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 26 Mar 2020 14:18:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQAbqitmYR7=5+AAL8pqy2imzEWf8BTkBoD6mthAwpKw@mail.gmail.com>
Message-ID: <CAD=FV=UQAbqitmYR7=5+AAL8pqy2imzEWf8BTkBoD6mthAwpKw@mail.gmail.com>
Subject: Re: [PATCH v14 4/6] soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 26, 2020 at 10:38 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Add changes to invoke rpmh flush() from cpu pm notification.
> This is done when last cpu is entering power collapse and

s/when last/when the last/

> controller is not busy.

A few overall comments:

* CPU_PM certainly seems interesting and I wasn't aware of it.

* Your series is predicated on nobody calling any of the RPMH
functions after the last CPU enters low power mode with CPU_PM_ENTER
and before some CPU calls CPU_PM_EXIT.  Is it worth adding a check for
that to the code?  This is super important for the 'zero-active-TCS'
case but even for the 'some-active-TCS' it's still important that
nobody tries to update the sleep/wake values after you flush.

* I think your series is focused on idle, right?  What about
suspend/resume?  You need a flush before suspend, right?  Do you need
to register for something to handle suspend, or do the pm callbacks
all get called for full system suspend?  If so, how late do they get
called?


> Controller that do have 'HW solver' mode do not need to register

s/Controller/Controllers


> @@ -85,22 +85,30 @@ struct rpmh_ctrlr {
>   * Resource State Coordinator controller (RSC)
>   *
>   * @name:       controller identifier
> + * @base:       start address of the RSC's DRV registers
>   * @tcs_base:   start address of the TCS registers in this controller
>   * @id:         instance id in the controller (Direct Resource Voter)
>   * @num_tcs:    number of TCSes in this DRV
> + * @rsc_pm:     CPU PM notifier for controller
> + * @cpus_in_pc: CPU mask for cpus in idle power collapse

Name "cpus_entered_pm" to match Linux naming?  Also the comment should
clearly say that this is only used in non-solver mode.


>   * @tcs:        TCS groups
>   * @tcs_in_use: s/w state of the TCS
>   * @lock:       synchronize state of the controller
> + * @pm_lock:    synchronize during PM notifications

Comment should say that this is only for non-solver mode.


> @@ -521,6 +527,71 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
>         return tcs_ctrl_write(drv, msg);
>  }
>
> +/**
> + * rpmh_rsc_ctrlr_is_busy: Check if any of the AMCs are busy.
> + *
> + * @drv: The controller
> + *
> + * Returns True if the TCSes are engaged in handling requests, False otherwise.

This is almost, but not quite in kernel-doc syntax.  Why not make it
match the example in "Documentation/doc-guide/kernel-doc.rst"?
Specifically trying to follow that style:

 * rpmh_rsc_ctrlr_is_busy() - Check if any of the AMCs are busy.
 * @drv: The controller
 *
 * Return: true if TCSes are engaged in handling requests; else false


> +static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
> +{
> +       int m;
> +       struct tcs_group *tcs = get_tcs_of_type(drv, ACTIVE_TCS);
> +
> +       /**

nit: why double star in "/**"?  That's for kerneldoc comments.  I
don't think it makes sense here...


> +        * If we made an active request on a RSC that does not have a
> +        * dedicated TCS for active state use, then re-purposed wake TCSes
> +        * should be checked for not busy
> +        */
> +       if (!tcs->num_tcs)
> +               tcs = get_tcs_of_type(drv, WAKE_TCS);
> +
> +       for (m = tcs->offset; m < tcs->offset + tcs->num_tcs; m++) {
> +               if (!tcs_is_free(drv, m))

As per my documentation patch, tcs_is_free():

 * Must be called with the drv->lock held or the tcs_lock for the TCS being
 * tested.

...I think you're OK calling without the lock since you're running on
the last CPU (and you're blocking any other CPUs from coming online)
and interrupts are disabled, but please document.


> +static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
> +                                   unsigned long action, void *v)
> +{
> +       struct rsc_drv *drv = container_of(nfb, struct rsc_drv, rsc_pm);
> +       unsigned long flags;
> +       int ret = NOTIFY_OK;
> +
> +       spin_lock_irqsave(&drv->pm_lock, flags);

nit: you can get away with just spin_lock().  cpu_pm_enter() is
documented to be called with interrupts already disabled so the
"irqsave" and "irqrestore" is useless.


> +       switch (action) {
> +       case CPU_PM_ENTER:
> +               cpumask_set_cpu(raw_smp_processor_id(), &drv->cpus_in_pc);
> +
> +               if (!cpumask_equal(&drv->cpus_in_pc, cpu_online_mask))

Is it ever possible to offline a CPU after doing "CPU_PM_ENTER" on it?
 If so you'll never be "equal" to the online mask again.  This seems
safer:

!cpumask_subset(cpu_online_mask, &drv->cpus_in_pc)


> +                       goto exit;
> +               break;
> +       case CPU_PM_ENTER_FAILED:
> +       case CPU_PM_EXIT:
> +               cpumask_clear_cpu(raw_smp_processor_id(), &drv->cpus_in_pc);
> +               goto exit;
> +       }
> +
> +       ret = rpmh_rsc_ctrlr_is_busy(drv);
> +       if (ret) {
> +               ret = NOTIFY_BAD;
> +               goto exit;
> +       }

Are you sure you can't just skip the call to rpmh_rsc_ctrlr_is_busy()?
 Specifically, I'm not sure why you need to block until the last
active mode transaction is done.

a) If the active mode transaction was on its own TCS, I'd hope that
the RPMH hardware would know to let the active transitions happen
before triggering the sleep (please confirm)

b) If the active mode transaction was borrowing the wake TCS the flush
should notice and return NOTIFY_BAD anyway.

Oh!  ...but looking closer at case b) points out a problem anyway.
You need to go into rpmh_flush() and stop having it loop on 'while
(ret == -EAGAIN)".  As per my documentation series (please review)
when -EAGAIN is returned it's important that the caller enable
interrupts for a little while before trying again.  You're not doing
that here.  Maybe if you fix it then you can get rid of your special
case rpmh_rsc_ctrlr_is_busy()?


> +       ret = rpmh_flush(&drv->client);

Back when RPMH first landed we had a whole argument about whether it
should be one file or two.  Given that it's currently two files, I
think the abstraction is that rpmh-rsc generally doesn't call into
rpmh except for the very special rpmh_tx_done().

...so seems like the whole pm_callback should move into rpmh.c and not
in rpmh-rsc.c?


> @@ -533,21 +604,20 @@ static int rpmh_probe_tcs_config(struct platform_device *pdev,
>         int i, ret, n, st = 0;
>         struct tcs_group *tcs;
>         struct resource *res;
> -       void __iomem *base;
>         char drv_id[10] = {0};
>
>         snprintf(drv_id, ARRAY_SIZE(drv_id), "drv-%d", drv->id);
>         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, drv_id);
> -       base = devm_ioremap_resource(&pdev->dev, res);
> -       if (IS_ERR(base))
> -               return PTR_ERR(base);
> +       drv->base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(drv->base))
> +               return PTR_ERR(drv->base);

I don't understand this part of the change.  Why move "base" into the
driver data.  It's not needed after probe.  Please undo this.  If you
really feel like base needs to be separate please move to its own
patch.


> @@ -663,6 +734,20 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> +       /*
> +        * CPU PM notification are not required for controllers that support
> +        * 'HW solver' mode where they can be in autonomous mode executing low
> +        * power mode to power down.
> +        */
> +       solver_config = readl_relaxed(drv->base + DRV_SOLVER_CONFIG);
> +       solver_config &= DRV_HW_SOLVER_MASK << DRV_HW_SOLVER_SHIFT;
> +       solver_config = solver_config >> DRV_HW_SOLVER_SHIFT;
> +       if (!solver_config) {
> +               drv->rsc_pm.notifier_call = rpmh_rsc_cpu_pm_callback;
> +               cpu_pm_register_notifier(&drv->rsc_pm);
> +               spin_lock_init(&drv->pm_lock);

nit: init the spin lock before registering instead of after.


>   * @ctrlr: controller making request to flush cached data
>   *
> - * Return: -EBUSY if the controller is busy, probably waiting on a response
> - * to a RPMH request sent earlier.
> + * Return: 0 on success, error number otherwise.
>   *
> - * This function is always called from the sleep code from the last CPU
> - * that is powering down the entire system. Since no other RPMH API would be
> - * executing at this time, it is safe to run lockless.
> + * This function can either be called from sleep code on the last CPU
> + * (thus no spinlock needed) or with the ctrlr->cache_lock already held.

Now you can remove the "or with the ctrlr->cache_lock already held"
since it's no longer true.


-Doug
