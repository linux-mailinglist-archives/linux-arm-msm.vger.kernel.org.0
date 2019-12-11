Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5A811AA03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 12:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbfLKLi7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 06:38:59 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:34936 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728446AbfLKLi7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 06:38:59 -0500
Received: by mail-vk1-f194.google.com with SMTP id o187so6691110vka.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 03:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6RcaHRsz9KM3vdOHBT0ida8e9taZHqDHpxMchzY+Agc=;
        b=KS0BRqR78va0hw29CIS9GUW4RX0wS6yA+N/8gSThWX2uutlGOdcv4aAmfiXXxSgnBa
         YxZKPsnKzJfQs64mHU+ZhzibHfgU6TBybre4qaBQCFdWEy2OQE8T8zmLpyOxLTgfPM1h
         636lOYAhi4b3IZMAH+HDQKX+3xBvINLpDfH1XPmyEl1AIAOXusemAZSUzPwJ49Cif21W
         cNCLcIqX7Pg3L/5f2C9KubTF0eNQBm4eZfbY9saujLa8cRbwpYi7lKoevMslGypUneik
         WRBs7mjxly4A4MuuXgoJu6qKc5hf1Gvs+KmIeES16yMHapidxjCCkcBB1bPylAtsJVe9
         w0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6RcaHRsz9KM3vdOHBT0ida8e9taZHqDHpxMchzY+Agc=;
        b=h0h7+L5CIAJ/m4a8MddFrppZlvaKZ/3StVfqa1moIPXNcHvFEnCgrWBiRixm9Gt7Qi
         suBdoQ3GK38YWp8FCHQlXZM7lENrjhbKemUkBtEmu6Lr7AfmNqHPZ/gul5nFrvXvj9AB
         g3j7k4UgHHNLInUSL9jeag2Sq73G/qrgk3tL8qmIj+vdPcWDTe9one5WUIMyRXzWH7l+
         pmEo5lQ8GQsahq1bt4DP3+npXb6yE0ddK3hpRhMmnG/sWqy4JFvqCKkxcJEGtlCfHn7h
         NjHMHRj+o6pJC43QLuPSw0eCVVoWplHHEMCROkumDGOTi53aCOaGxkqhXXBtHKMCxRYn
         ZWYQ==
X-Gm-Message-State: APjAAAU5auvtygq3QuLaqGlkMbTDIGF8ILgBAO762mHiKe05fXi/6aPJ
        Q2PTA7wkHvbRnMznwMDaW1bMzPdB7fi8NGaCXaKmtQ==
X-Google-Smtp-Source: APXvYqwqbNuUfs4jU5ey3OT7K1GTYAbbhFH6VtuEUgfvhdq0V28j6NjWA4nrOWTWpi2Iwvq/cA1uc1pDssR0h5ZU3L0=
X-Received: by 2002:a1f:4541:: with SMTP id s62mr2901064vka.59.1576064337968;
 Wed, 11 Dec 2019 03:38:57 -0800 (PST)
MIME-Version: 1.0
References: <20191205103330.27166-1-ulf.hansson@linaro.org>
 <20191205180653.GA1516@e121166-lin.cambridge.arm.com> <CAPDyKFpvkjVKFSMRNgen7JWi5DMvTC3H1nqwcSoR3dQkHzfQZw@mail.gmail.com>
In-Reply-To: <CAPDyKFpvkjVKFSMRNgen7JWi5DMvTC3H1nqwcSoR3dQkHzfQZw@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 11 Dec 2019 12:38:22 +0100
Message-ID: <CAPDyKFp7Cmwvat0PXK9-2nmp4u2s0t=V+p1sOfdz-OQ66dr6zQ@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: psci: Support CPU hotplug for the hierarchical model
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 5 Dec 2019 at 20:09, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 5 Dec 2019 at 19:07, Lorenzo Pieralisi
> <lorenzo.pieralisi@arm.com> wrote:
> >
> > On Thu, Dec 05, 2019 at 11:33:30AM +0100, Ulf Hansson wrote:
> > > When the hierarchical CPU topology is used and when a CPU is put offline,
> > > that CPU prevents its PM domain from being powered off, which is because
> > > genpd observes the corresponding attached device as being active from a
> > > runtime PM point of view. Furthermore, any potential master PM domains are
> > > also prevented from being powered off.
> > >
> > > To address this limitation, let's add add a new CPU hotplug state
> > > (CPUHP_AP_CPU_PM_STARTING) and register up/down callbacks for it, which
> > > allows us to deal with runtime PM accordingly.
> > >
> > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > ---
> > >
> > > Lorenzo, Sudeep, Rafael, Daniel,
> > >
> > > Note that, this patch is based upon a recently posted series [1] and the intent
> > > is to queue it on top. I can fold it into the series and resend it all, if that
> > > makes it easier for people. Just tell me what you prefer.
> > >
> > > Kind regards
> > > Uffe
> > >
> > > [1]
> > > https://patchwork.kernel.org/cover/11263735/
> > >
> > > ---
> > >  drivers/cpuidle/cpuidle-psci.c | 45 +++++++++++++++++++++++++++++++++-
> > >  include/linux/cpuhotplug.h     |  1 +
> > >  2 files changed, 45 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> > > index 835c7c3aa118..46b481c524cc 100644
> > > --- a/drivers/cpuidle/cpuidle-psci.c
> > > +++ b/drivers/cpuidle/cpuidle-psci.c
> > > @@ -8,6 +8,7 @@
> > >
> > >  #define pr_fmt(fmt) "CPUidle PSCI: " fmt
> > >
> > > +#include <linux/cpuhotplug.h>
> > >  #include <linux/cpuidle.h>
> > >  #include <linux/cpumask.h>
> > >  #include <linux/cpu_pm.h>
> > > @@ -31,6 +32,7 @@ struct psci_cpuidle_data {
> > >
> > >  static DEFINE_PER_CPU_READ_MOSTLY(struct psci_cpuidle_data, psci_cpuidle_data);
> > >  static DEFINE_PER_CPU(u32, domain_state);
> > > +static bool psci_cpuidle_use_cpuhp;
> > >
> > >  void psci_set_domain_state(u32 state)
> > >  {
> > > @@ -72,6 +74,44 @@ static int psci_enter_domain_idle_state(struct cpuidle_device *dev,
> > >       return ret;
> > >  }
> > >
> > > +static int psci_idle_cpuhp_up(unsigned int cpu)
> > > +{
> > > +     struct device *pd_dev = __this_cpu_read(psci_cpuidle_data.dev);
> > > +
> > > +     if (pd_dev)
> > > +             pm_runtime_get_sync(pd_dev);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int psci_idle_cpuhp_down(unsigned int cpu)
> > > +{
> > > +     struct device *pd_dev = __this_cpu_read(psci_cpuidle_data.dev);
> > > +
> > > +     if (pd_dev) {
> > > +             pm_runtime_put_sync(pd_dev);
> > > +             /* Clear domain state to start fresh at next online. */
> > > +             psci_set_domain_state(0);
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void psci_idle_init_cpuhp(void)
> > > +{
> > > +     int err;
> > > +
> > > +     if (!psci_cpuidle_use_cpuhp)
> > > +             return;
> > > +
> > > +     err = cpuhp_setup_state_nocalls(CPUHP_AP_CPU_PM_STARTING,
> > > +                                     "cpuidle/psci:online",
> > > +                                     psci_idle_cpuhp_up,
> > > +                                     psci_idle_cpuhp_down);
> >
> > I would make it a cpuhp_setup_state() call and remove
> >
> > if (cpu_online(cpu))
> >         pm_runtime_get_sync_dev(dev);
> >
> > in check in psci_dt_attach_cpu().
> >
> > Lorenzo
>
> Thanks for the suggestion, but that doesn't work when
> CONFIG_CPU_HOTPLUG is unset.
>
> As a matter of fact, I just realized that I haven't tried to compile
> without that Kconfig option. I should probably add a stub for
> psci_idle_init_cpuhp() to address that.

Just forget about what I said above, it's nonsense.

cpuhp_setup_state() and friends works fine even if CONFIG_CPU_HOTPLUG
is unset. I did test this, but some reason I forgot about it.

However, there is another problem with your proposal above, which is
that the CPUHP callback is assigned after the cpuidle drivers (one per
CPU) have been registered. Which means, CPUs may enter idle even
before the CPUHP callbacks are registered. In other words, we need to
keep the call to pm_runtime_get_sync_dev() in psci_dt_attach_cpu() as
to properly reflect the state of the CPU.

[...]

BTW, I am about to post a new version in a couple of hours. Any other
thing you want to point out, before the next submission?

Kind regards
Uffe
