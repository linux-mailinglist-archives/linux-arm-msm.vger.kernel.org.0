Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 012F612D816
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2019 11:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfLaK6I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Dec 2019 05:58:08 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:33375 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbfLaK6I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Dec 2019 05:58:08 -0500
Received: by mail-ua1-f68.google.com with SMTP id a12so12012096uan.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2019 02:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+/cKqjQLaJDro7xvoXO4GbUduNP7FMY1FciksM8xP3U=;
        b=c1QrRxtKFL6J8jqPPYsh2NWqI2SvT1QZwpyQPCFvWl7TlrsDv1zz2NeU9wW+oC6fRO
         Lf18Z7YEB/mMljsM04RtR96vUxjmuIdCsWxWutwB9xcVXqv6EKxYYYyDNF0a9TKplc5N
         yM++wpeVRkiN7LAyQshU74N+o33d1tA3iFG1TSznLFLOCu9er53lzDHHAEBn4YQpjvmO
         if9fkmGW/ZVyzroooqbPRKt54L1prY555r6o3bbCY6twdqoh/3a78j/Z0RJfP+tSyH3T
         EEtSDgwqVlVNiHmBmnYyS/PzlRl3jfOYDRJRRNQJ+65KeCU2Jv+m7JbA+/Fd1jAUugfa
         KWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+/cKqjQLaJDro7xvoXO4GbUduNP7FMY1FciksM8xP3U=;
        b=IlzOuctAe0EytaPQ5fhzKhOWniFm7FfH9ySqzBWyM8AkHJbMcBZ8YsHUxyc4ieFioE
         k8o4tkZTEJ1EgicJPpkpRwtQXPtQXkcVTX6mtA5UHSjnzWt+QxCGsOVnbvx7thC5USQJ
         sQgXAro8QwiCHB4dRxTpCWle53DEZhuYeMyZKRWYupM50rczCqVW2YMUF7rkhiib/L7r
         4OYqvsrrjzsA9I6cShtQFvgHjin3Sp0sOUG5qZ858Sh6TBb3yD0i9BQhGUq3ymBuhTQa
         VqpbZHbImBGJlsVdTERTVQ6CTXaWkWwLNrUJfMzNBNHgDn7qeyq37OjDqSjZK2r2O0g3
         layA==
X-Gm-Message-State: APjAAAVjWXmkklw88oNbpWBD9agl6tgGsGnEJhVg1/W0ojVK6MGpyOog
        82QcmpO2yQAmSi7pcWsAnddjiKNHx4R9ZCu6q4Z06Q==
X-Google-Smtp-Source: APXvYqx8FuDv+nWH+nrmP0n+23730KIME9tRmdH9bfWI43L4BCAZZTdBdLH2Kk0/hiP4PMzhqGhTdS0owH0gAg84u4E=
X-Received: by 2002:ab0:5510:: with SMTP id t16mr44743488uaa.15.1577789886750;
 Tue, 31 Dec 2019 02:58:06 -0800 (PST)
MIME-Version: 1.0
References: <20191230144402.30195-1-ulf.hansson@linaro.org>
 <CAPDyKFrVQO-WFOfX_EKVTUYnesGj93GQMKxFNpbMt6s3xv_qBw@mail.gmail.com> <CAJZ5v0gSY_Zg+sbBEfTaeBCiOf_L6JP4_-4tdpeFU0iCGJu3Nw@mail.gmail.com>
In-Reply-To: <CAJZ5v0gSY_Zg+sbBEfTaeBCiOf_L6JP4_-4tdpeFU0iCGJu3Nw@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 31 Dec 2019 11:57:30 +0100
Message-ID: <CAPDyKFpCisiRfvRhuZ6M6SovDPQ8ZNhHz9XbprftkXazaCi+PQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] cpuidle: psci: Support hierarchical CPU arrangement
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
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

On Tue, 31 Dec 2019 at 11:43, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Tue, Dec 31, 2019 at 11:38 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > Rafael,
> >
> > On Mon, 30 Dec 2019 at 15:44, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > Changes in v5:
> > >         - Remove PM domains in the error path, when failing to enable OSI.
> > >         - Folded in a patch that adds a genpd OF helper to remove subdomains.
> > >         - Added reviewed-by tags.
> > >
> > > Changes in v4:
> > >         - Move the check for OSI support from psci_dt_attach_cpu() to the
> > >         caller's side of it.
> > >         - Add comment in the code about using the deepest idle state as the
> > >         triggering point for the domain state selection.
> > >         - Folded in a patch to enable support for CPU hotplug.
> > >
> > > Changes in v3:
> > >         - Take one step further to completely avoid executing any OSI specific
> > >         code from the ->enter() callback, while operating in the default PSCI
> > >         Platform Coordinated mode.
> > >         - Update example for the PSCI DT bindings to make it compile with
> > >         "make dt_binding_check"
> > >
> > > Changes in v2:
> > >         - Avoid to affect the non-OSI path with specific changes for OSI. This
> > >         forced me to re-order the series and a caused more or less minor changes
> > >         to most of the patches.
> > >         - Updated the DT bindings for PSCI to clarify and to include the "psci"
> > >         name of the PM domain to attach to.
> > >         - Replaced patch1 with another patch from Sudeep, solving the same
> > >         problem, but in a different way.
> > >
> > > This series enables initial support for hierarchical CPU arrangement, managed
> > > by PSCI and its corresponding cpuidle driver. It's based on using the generic
> > > PM domain (genpd), which nowadays also supports devices belonging to CPUs.
> > >
> > > The last DTS patch enables the hierarchical topology to be used for the Qcom
> > > 410c Dragonboard, which supports the PSCI OS-initiated mode.
> > >
> > > More detailed background can be found from previous submissions [1].
> > >
> > > The series is also available at:
> > > git.linaro.org/people/ulf.hansson/linux-pm.git next
> > >
> > > Kind regards
> > > Ulf Hansson
> > >
> > > [1]
> > > https://lwn.net/Articles/788306/
> > >
> > > Lina Iyer (1):
> > >   cpuidle: dt: Support hierarchical CPU idle states
> > >
> > > Sudeep Holla (1):
> > >   cpuidle: psci: Align psci_power_state count with idle state count
> > >
> > > Ulf Hansson (13):
> > >   dt: psci: Update DT bindings to support hierarchical PSCI states
> > >   firmware: psci: Export functions to manage the OSI mode
> > >   of: base: Add of_get_cpu_state_node() to get idle states for a CPU
> > >     node
> > >   cpuidle: psci: Simplify OF parsing of CPU idle state nodes
> > >   cpuidle: psci: Support hierarchical CPU idle states
> > >   cpuidle: psci: Add a helper to attach a CPU to its PM domain
> > >   cpuidle: psci: Attach CPU devices to their PM domains
> > >   cpuidle: psci: Prepare to use OS initiated suspend mode via PM domains
> > >   cpuidle: psci: Manage runtime PM in the idle path
> > >   cpuidle: psci: Support CPU hotplug for the hierarchical model
> > >   PM / Domains: Introduce a genpd OF helper that removes a subdomain
> > >   cpuidle: psci: Add support for PM domains by using genpd
> > >   arm64: dts: Convert to the hierarchical CPU topology layout for
> > >     MSM8916
> > >
> > >  .../devicetree/bindings/arm/cpus.yaml         |  15 +
> > >  .../devicetree/bindings/arm/psci.yaml         | 104 ++++++
> > >  arch/arm64/boot/dts/qcom/msm8916.dtsi         |  57 +++-
> > >  drivers/base/power/domain.c                   |  38 +++
> > >  drivers/cpuidle/Makefile                      |   4 +-
> > >  drivers/cpuidle/cpuidle-psci-domain.c         | 308 ++++++++++++++++++
> > >  drivers/cpuidle/cpuidle-psci.c                | 161 +++++++--
> > >  drivers/cpuidle/cpuidle-psci.h                |  17 +
> > >  drivers/cpuidle/dt_idle_states.c              |   5 +-
> > >  drivers/firmware/psci/psci.c                  |  18 +-
> > >  drivers/of/base.c                             |  36 ++
> > >  include/linux/cpuhotplug.h                    |   1 +
> > >  include/linux/of.h                            |   8 +
> > >  include/linux/pm_domain.h                     |   8 +
> > >  include/linux/psci.h                          |   2 +
> > >  15 files changed, 747 insertions(+), 35 deletions(-)
> > >  create mode 100644 drivers/cpuidle/cpuidle-psci-domain.c
> > >  create mode 100644 drivers/cpuidle/cpuidle-psci.h
> > >
> > > --
> > > 2.17.1
> > >
> >
> > This series is ready to go (unless you have some objections of
> > course), would you mind queuing it up?
> >
> > Of course, patch15 can be left for arm-soc.
> >
> > If you prefer a pull-request, just tell me.
>
> So I would prefer arm-soc to take the whole lot if that's not a problem.

Not really, I can send a PR to those guys within a day or two.

Although, I assume you are aware that most of the changes are in
drivers/cpuidle/  ...?

>
> Feel free to add ACKs from me to the patches for this purpose if that helps
>
> Thanks!

Thanks!

Kind regards
Uffe
