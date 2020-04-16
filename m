Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171571AB4AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 02:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391522AbgDPAVE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 20:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391502AbgDPAVB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 20:21:01 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB09AC061A0F
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 17:20:59 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id u10so2152884ual.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 17:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eC6qxZFBEpX79S7imSS+SXLyRDguJFBFQ459G4/A6PU=;
        b=Tjybkxndpn52QmrNypqycAdU7VrHDwfCFUDQre+EEYlxhUzU2Hmf9n3DOqwfLZDnWB
         voUbxi3Nwdnz7o9orRkUD/kZoWDKkAVfn8zkQHtI/vrJsrmBCyyjsnnFJbsjJI8GIkCd
         qQSKGoHiVxMbkDVqf833lO8dKCDEuPF5puM+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eC6qxZFBEpX79S7imSS+SXLyRDguJFBFQ459G4/A6PU=;
        b=ekuvIUOGs7D+rZpY0dBRwOU7A8PRcjTjV9dLHgopqdNG8LsBoKmsHzpNWco+54D4lq
         R1L7i2FUTxGwqGDl6Ar6icei7FUxecIOqLnwu7or++cmXxxSrOkyPj/EMum5xoqNNoPr
         MhOd3PZ2UPAjy94bNva5yqK7LtHIIp1hljzkO/vPn5JNQWQOyjCY11OS+TOlPyL0ujbA
         RuZ7IMyiC0JbG58F8NOtDBfhttJaTRf+ReWOHRlwEJRMiAeqGslJXi4ytOn3rh0n9IwJ
         qm5uRSYdASe5LPXwOyCb+0ta8c3k7EWgOD4NNhsIFcElv36Pd4orpdTKBAbJqsuOX7Vo
         NeKA==
X-Gm-Message-State: AGi0PuZyDrcnG/HehJitgxx59X8JJwXXMVvRQOW5w7J2Q41muvSoMTX4
        GW7W2JCOQ7hlUAOrCV+eR/hB24+pzFg=
X-Google-Smtp-Source: APiQypKp59xkyUwDsNT233ZYABPd7l6j/FoR8mClDkOdajLqkJsTcuGb3IQuW4J/u0aSzAnW3cfRlQ==
X-Received: by 2002:ab0:43a2:: with SMTP id l31mr6695662ual.115.1586996458497;
        Wed, 15 Apr 2020 17:20:58 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id q188sm3322685vsa.6.2020.04.15.17.20.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 17:20:57 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id c17so1924359uae.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 17:20:57 -0700 (PDT)
X-Received: by 2002:a9f:27ca:: with SMTP id b68mr6989881uab.8.1586996456913;
 Wed, 15 Apr 2020 17:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200414102312.1.I295cb72bc5334a2af80313cbe97cb5c9dcb1442c@changeid>
 <158693439287.105027.14163532309100663169@swboyd.mtv.corp.google.com>
In-Reply-To: <158693439287.105027.14163532309100663169@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 15 Apr 2020 17:20:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbONh=-0VTe_hyWqbB=5iv2G4sWBW-jw2R7FMEKafJKg@mail.gmail.com>
Message-ID: <CAD=FV=VbONh=-0VTe_hyWqbB=5iv2G4sWBW-jw2R7FMEKafJKg@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Remove the pm_lock
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
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

On Wed, Apr 15, 2020 at 12:06 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-04-14 10:23:26)
> > diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> > index 732316bb67dc..4e45a8ac6cde 100644
> > --- a/drivers/soc/qcom/rpmh-rsc.c
> > +++ b/drivers/soc/qcom/rpmh-rsc.c
> > @@ -791,36 +790,36 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
> >  {
> >         struct rsc_drv *drv = container_of(nfb, struct rsc_drv, rsc_pm);
> >         int ret = NOTIFY_OK;
> > -
> > -       spin_lock(&drv->pm_lock);
> > +       int cpus_in_pm;
> >
> >         switch (action) {
> >         case CPU_PM_ENTER:
> > -               cpumask_set_cpu(smp_processor_id(), &drv->cpus_entered_pm);
> > -
> > -               if (!cpumask_equal(&drv->cpus_entered_pm, cpu_online_mask))
> > -                       goto exit;
> > +               cpus_in_pm = atomic_inc_return(&drv->cpus_in_pm);
> > +               if (cpus_in_pm < num_online_cpus())
>
> Might be worth adding a comment here explaining that num_online_cpus()
> is stable because this is called from the cpu PM notifier path and a CPU
> can't go offline or come online without stopping the world.

Good idea.


> > +                       return NOTIFY_OK;
> >                 break;
> >         case CPU_PM_ENTER_FAILED:
> >         case CPU_PM_EXIT:
> > -               cpumask_clear_cpu(smp_processor_id(), &drv->cpus_entered_pm);
> > -               goto exit;
> > -       }
> > -
> > -       ret = rpmh_rsc_ctrlr_is_busy(drv);
> > -       if (ret) {
> > -               ret = NOTIFY_BAD;
> > -               goto exit;
> > +               atomic_dec(&drv->cpus_in_pm);
>
> We should also handle the cluster PM enums. I'm actually confused the
> compiler didn't complain about that already. Presumably we want to just
> ignore the cluster PM notifications because the counter handles it
> already. Looks like other code uses NOTIFY_DONE for the default case.

Hrm, I guess my compiler isn't set to warn for that?  :-/

...in any case I think the right thing to do here is to add
"default:".  Really we _only_ care about the ones we already have
cases for and if anyone adds any other notifications we really don't
care about them.


> > +               return NOTIFY_OK;
> >         }
> >
> > -       ret = rpmh_flush(&drv->client);
> > -       if (ret)
> > +       /*
> > +        * It's likely we're on the last CPU. Grab the drv->lock and write
> > +        * out the sleep/wake commands to RPMH hardware. Grabbing the lock
> > +        * means that if we race with another CPU coming up we are still
> > +        * guaranteed to be safe. If another CPU came up just after we checked
> > +        * and has already started an active transfer then we'll notice we're
> > +        * busy and abort. If another CPU comes up after we start flushing it
> > +        * will be blocked from starting an active transfer until we're done
> > +        * flushing. If another CPU starts an active transfer after we release
> > +        * the lock we're still OK because we're no longer the last CPU.
> > +        */
> > +       spin_lock(&drv->lock);
>
> This should probably be a raw spinlock given that this is called from
> the idle path and sleeping there is not very nice for RT. That can come
> later of course.

Actually, maybe I should just do a spin_trylock().  If I fail to get
the lock I can just return NOTIFY_BAD, right?


> > +       if (rpmh_rsc_ctrlr_is_busy(drv) || !rpmh_flush(&drv->client))
>
> It almost feels like rpmh_rsc_ctrlr_is_busy() shold be rolled straight
> into rpmh_flush() so that rpmh_flush() fails if there are active
> requests in flight.

I'm going to leave that change out for now.  Maulik says there are
other code paths in future patches that will call rpmh_flush().  If we
see every call to rpmh_flush() follow the same pattern then we can
roll it in then?


> >                 ret = NOTIFY_BAD;

Oh, I think we have a bug here.  If we return NOTIFY_BAD we probably
need to decrement our count.  From reading the code I think
CPU_PM_ENTER_FAILED doesn't get called for the person that returned
NOTIFY_BAD.  I'll try to confirm, then fix.


> > -       else
> > -               ret = NOTIFY_OK;
> > +       spin_unlock(&drv->lock);
>
> I'm looking at the latest linux-next code that I think has all the
> patches on the list for rpmh (latest commit is 1d3c6f86fd3f ("soc: qcom:
> rpmh: Allow RPMH driver to be loaded as a module")). I see that
> tcs->lock is taken first, and then drv->lock is taken next in
> tcs_write(). But then this takes drv->lock first and then calls
> rpmh_flush() (which goes to a different file.. yay!) and that calls
> flush_batch() which calls rpmh_rsc_write_ctrl_data() (back to this
> file... yay again!) which then locks tcs->lock. Isn't that an ABBA
> deadlock?

Oops.  Somehow I thought I had checked that and the ABBA was only
there before all the cleanup patches, but I think you're right.  I
think I can fix this by just changing the order we grab locks in
tcs_write().  At first I was bummed because I thought that would mean
I'd have to hold both locks while calling:

  __tcs_buffer_write(drv, tcs_id, 0, msg);
  __tcs_set_trigger(drv, tcs_id, true);

...but I just realized that even if I change the order I grab the
locks it doesn't mean I have to change the order I release the locks!


I'll plan to send another spin tomorrow since my day is about over now.

-Doug
