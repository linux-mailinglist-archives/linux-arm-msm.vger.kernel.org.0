Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB36E6D4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2019 08:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732130AbfJ1Hge (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Oct 2019 03:36:34 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:41592 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732043AbfJ1Hge (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Oct 2019 03:36:34 -0400
Received: by mail-vs1-f66.google.com with SMTP id l2so5703425vsr.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2019 00:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gSevzdeX2IyP/Mt0uDEIUvXixgu3G2I8LpM+mdQ2wXA=;
        b=tYCmpD0YYPT8+Lb0VuIpsuPjUIA0Nc0OVx5ptG5Qicr9Z3GSyat/U3BGt9hOU50coh
         gmQzuViBQVklILiaRWJtHTBpRphaY/Ewjdqjzl2jCpW0S4xugOGjCaW0dqXG/orAyGpm
         wAIkbpDkO3veDAwHvktjdlPNsPjRcsrP1qnH8p4vf6g7W9x3QBiuSURUX4TgTOKVuCxy
         KQ1y1sMzF+EVJ1+0igH3qHv7heQptk/Pw1CUwMjrUTKNqp0ChYc7wHGaTGHOlOEvNEjP
         UbyYz7lMLnbT3D6u9ZfwS6yXXx/aax3li1PSjLJStUA3DC3jz8Wrrah2kgGjn1b+8P5p
         vAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gSevzdeX2IyP/Mt0uDEIUvXixgu3G2I8LpM+mdQ2wXA=;
        b=NsUAzG2Bl9ZP2+gzl/qKl5Os6XbH3uHCDxkMdozytzwv90bl/ASA6CyB10g9OMEawf
         2BdBEPzvU67Rxe5FQ9v48hn7+FpdBZM7hUfsZ3KtbGQPRG4RXITZIWc/xzy3rubwfctB
         iNEZoY06WYuR6FesBfTxHisryVLJmKczvLqLesB4IbJ72K0he1aUzmiA6LnRimcz2pn1
         XcQfYb2h9ITR0OCz7wi/MpE1ODFuybPF+CMTG3nNwZ4WgaOSVfot88uFN1ZB+XllNKiF
         LQXVKV8sZt7kHhkrr7qmISBVVDECfuddZzs6g3iqTtjeoTRsJuF6Hk0i3xa7uWgdXIRz
         0ZiA==
X-Gm-Message-State: APjAAAVNw2ea2dsOuHDNrTnTDbi5SXcRtf4gEu4gVzwy7cpxfM7oUux8
        Q4T+SW499BZwmQaGzs9jmniSJc2OYJlsSJLhdBwyIQ==
X-Google-Smtp-Source: APXvYqyiCnipDJKelK+/Ew9PqgA3uPhVtvsxHeLsiippdhvtgIGWzZrGHUAgfICu1Tcc+H0Ynu03qyqsGtT+IodFhaA=
X-Received: by 2002:a67:7ac5:: with SMTP id v188mr8120918vsc.191.1572248190943;
 Mon, 28 Oct 2019 00:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191010113937.15962-1-ulf.hansson@linaro.org>
 <20191010113937.15962-11-ulf.hansson@linaro.org> <20191024163117.GB22036@bogus>
 <CAPDyKFo2Fma1_JMSd39bmQ3X1PV4SmQ0AfEuKyX5KLLe83ycmA@mail.gmail.com> <20191027023023.GC18111@e107533-lin.cambridge.arm.com>
In-Reply-To: <20191027023023.GC18111@e107533-lin.cambridge.arm.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 28 Oct 2019 08:35:55 +0100
Message-ID: <CAPDyKFr1LJ_HP1kcfMh7LE5j7nUT9KzH4vhdCSEE9wg6RfYErQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] cpuidle: psci: Add a helper to attach a CPU to its
 PM domain
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 27 Oct 2019 at 03:30, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Thu, Oct 24, 2019 at 06:47:43PM +0200, Ulf Hansson wrote:
> > On Thu, 24 Oct 2019 at 18:31, Sudeep Holla <sudeep.holla@arm.com> wrote:
> > >
> > > On Thu, Oct 10, 2019 at 01:39:34PM +0200, Ulf Hansson wrote:
> > > > Introduce a PSCI DT helper function, psci_dt_attach_cpu(), which takes a
> > > > CPU number as an in-parameter and tries to attach the CPU's struct device
> > > > to its corresponding PM domain.
> > > >
> > > > Let's makes use of dev_pm_domain_attach_by_name(), as it allows us to
> > > > specify "psci" as the "name" of the PM domain to attach to. Additionally,
> > > > let's also prepare the attached device to be power managed via runtime PM.
> > > >
> > > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > ---
> > > >  drivers/cpuidle/cpuidle-psci-domain.c | 21 +++++++++++++++++++++
> > > >  drivers/cpuidle/cpuidle-psci.h        |  6 ++++++
> > > >  2 files changed, 27 insertions(+)
> > > >
> > > > diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> > > > index 3f5143ccc3e0..7429fd7626a1 100644
> > > > --- a/drivers/cpuidle/cpuidle-psci-domain.c
> > > > +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> > > > @@ -9,9 +9,11 @@
> > > >
> > > >  #define pr_fmt(fmt) "CPUidle PSCI: " fmt
> > > >
> > > > +#include <linux/cpu.h>
> > > >  #include <linux/device.h>
> > > >  #include <linux/kernel.h>
> > > >  #include <linux/pm_domain.h>
> > > > +#include <linux/pm_runtime.h>
> > > >  #include <linux/psci.h>
> > > >  #include <linux/slab.h>
> > > >  #include <linux/string.h>
> > > > @@ -279,3 +281,22 @@ static int __init psci_idle_init_domains(void)
> > > >       return ret;
> > > >  }
> > > >  subsys_initcall(psci_idle_init_domains);
> > > > +
> > > > +struct device *psci_dt_attach_cpu(int cpu)
> > > > +{
> > > > +     struct device *dev;
> > > > +
> > > > +     /* Currently limit the hierarchical topology to be used in OSI mode. */
> > > > +     if (!psci_has_osi_support())
> > > > +             return NULL;
> > > > +
> > > > +     dev = dev_pm_domain_attach_by_name(get_cpu_device(cpu), "psci");
> > >
> > > This clarifies the need for the fixed name. But why not just go by index 0
> > > as the consumer of these psci power-domains will have only one power domain
> > > entry. Why do we need this name compulsory ?
> >
> > The idea is to be future proof. If I recall correctly, the CPU node on
> > some QCOM SoCs may also have "CPR" PM domain specified, thus
> > "multiple" power-domains could be specified.
> >
>
> I am sure we don't want to mx-n-match any power domain provider with
> psci. And also I expect in these above mentioned cases, there won't be any
> psci power domains.
>
> > In any case, using "psci" doesn't really hurt, right?
> >
>
> Doesn't but I don't see need for one as only one should exist, as mentioned
> above we don't want mix-n-match with psci ever.

Not sure I get your point, sorry.

The CPU could very well be attached to more than one power-domain. Of
course not multiple "PSCI power-domains". One could be an PSCI power
domain and another one could be the QCOM CPR (Core power reduction)
power domain.

Have a look at these binding, there are already upstream, perhaps that
clarifies this?
Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt

>
> > > Further, it's specified as
> > > optional in the generic binding, do we make it "required" for this psci
> > > idle states binding anywhere that I missed ?
> >
> > Good point! Unless you tell me differently, I will update the DT doc
> > to clarify this is "required".
> >
>
> No but why is my question ? We don't have to. If firmware/DT wants to
> specify the name, sure. But it must remain optional IMO.

According the QCOM CPR case, we need a way to distinguish what power
domain we should attach the CPU to. If we don't use power-domain-names
to do that, what else should we use?

Kind regards
Uffe
