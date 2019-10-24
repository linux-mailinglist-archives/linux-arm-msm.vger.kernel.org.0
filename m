Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A04CBE385A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2019 18:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392098AbfJXQlk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Oct 2019 12:41:40 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:40300 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390204AbfJXQlk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Oct 2019 12:41:40 -0400
Received: by mail-yb1-f194.google.com with SMTP id d12so472571ybn.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2019 09:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AuLGn9MbFeqhUIgzYi5XtxY3pZzXl0hLfc2cMacvOHM=;
        b=P4XElw3788YW/xZYNWr8N2sWy6aV8YTTJ9gVN7DpcxhYEYlDI+Du4GzfxPzOh/tH0s
         iYbfSAw/u4A/CqgxxVLRZvTKHQfhhldeVCnatkX5JHqDJNUcucakM9IsEJYAtD0dekwi
         EVsomqHxbcTtJT/ZfeUyxgw3KmGLUYiSQT9IYnSZ517NpEHS946575PHYAtXET4YUhSw
         zEN8+vEdiLzZkzyxnGZMgL7/R99xE6Ls4dGfPC0QQSAf3Vx5riF2x7A055L3lvmwFeIH
         JXPMmM4wyfI2r1C2EzmjjEqLMCV6qosXd1NilO8jLJTnbnM5WCu435/z8tZgFbNfM1QX
         OlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AuLGn9MbFeqhUIgzYi5XtxY3pZzXl0hLfc2cMacvOHM=;
        b=Nu/JbtUiKI2fr82t7Q4lU5T2ory5Lyh3OaIEIc566+3x6cZij8BH+1glSt2l2l51p1
         CG7+21gqGM4xEEolQZh9wiEFcrZf0DDKe3N9vjywZr//H0/OTo99id75Pc0L2e1UeGUr
         s5MVv35uSuNs8G5GO1P9OK6Ci25PuWijYe23GO0kHMWgdXi2PV3QqlIz4AHg5fPNZc9X
         eBY8M4Ey5useICtoyh0CBQRIIfrOZieWEDNeY87sHSZkvWqr/gtyLBBt3CWfczKF8fND
         s03skDLnETN4sdHGhC4v1Urf7DhgET4RNSV8alsFSQnk+DXqV2f1IPspU3wHJoEjSzzY
         4UtQ==
X-Gm-Message-State: APjAAAXJSWitkxsoiBePXyAGeOFD3Zl0lXUZylI+Z6tXLaQvtrUV58G3
        gKFiaT5oTCt96d+JhulI4ymENMp/awayWOcUwTIiZEbe
X-Google-Smtp-Source: APXvYqy74Ut4sOP+Ng6xq9ZzOQxeKxc4qIBLgzZIiVNUBqbGsiMXdqL/G0WIfNquxGH2s7Jym2dcXG7hBKr/03cccbw=
X-Received: by 2002:ab0:7644:: with SMTP id s4mr6353812uaq.15.1571934816730;
 Thu, 24 Oct 2019 09:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191010113937.15962-1-ulf.hansson@linaro.org>
 <20191010113937.15962-7-ulf.hansson@linaro.org> <20191024153621.GE11467@bogus>
In-Reply-To: <20191024153621.GE11467@bogus>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 24 Oct 2019 18:33:00 +0200
Message-ID: <CAPDyKFrPqnNENH2bWG=unEWRxLdC0BQEOU9-tYAT175sX7Z7vw@mail.gmail.com>
Subject: Re: [PATCH 06/13] cpuidle: psci: Simplify OF parsing of CPU idle
 state nodes
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

On Thu, 24 Oct 2019 at 17:36, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Thu, Oct 10, 2019 at 01:39:30PM +0200, Ulf Hansson wrote:
> > Iterating through the idle state nodes in DT, to find out the number of
> > states that needs to be allocated is unnecessary, as it has already been
> > done from dt_init_idle_driver(). Therefore, drop the iteration and use the
> > number we already have at hand.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/cpuidle/cpuidle-psci.c | 33 ++++++++++++++++-----------------
> >  1 file changed, 16 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> > index 2e91c8d6c211..1195a1056139 100644
> > --- a/drivers/cpuidle/cpuidle-psci.c
> > +++ b/drivers/cpuidle/cpuidle-psci.c
> > @@ -73,28 +73,22 @@ static int __init psci_dt_parse_state_node(struct device_node *np, u32 *state)
> >       return 0;
> >  }
> >
> > -static int __init psci_dt_cpu_init_idle(struct device_node *cpu_node, int cpu)
> > +static int __init psci_dt_cpu_init_idle(struct device_node *cpu_node,
> > +                             unsigned int state_nodes, int cpu)
>
> [super nit] Too much in the beginning of the patch to not notice this ;)
> May need some '(' alignment here and other places in general.

I was trying to find a consistent way of doing it, according to the
existing code, but I failed. :-)

Two cases exist where calls/functions crosses one line, one use solely
tabs and the other uses tab+whitespace to align "exactly". You are
saying that you prefer the latter? If so, I can adopt to that.

>
> >  {
> > -     int i, ret = 0, count = 0;
> > +     int i, ret = 0;
> >       u32 *psci_states;
> >       struct device_node *state_node;
> >
> > -     /* Count idle states */
> > -     while ((state_node = of_parse_phandle(cpu_node, "cpu-idle-states",
> > -                                           count))) {
> > -             count++;
> > -             of_node_put(state_node);
> > -     }
> > -
> > -     if (!count)
> > -             return -ENODEV;
> > -
> > -     psci_states = kcalloc(count, sizeof(*psci_states), GFP_KERNEL);
> > +     psci_states = kcalloc(state_nodes, sizeof(*psci_states), GFP_KERNEL);
> >       if (!psci_states)
> >               return -ENOMEM;
> >
> > -     for (i = 0; i < count; i++) {
> > +     for (i = 0; i < state_nodes; i++) {
> >               state_node = of_parse_phandle(cpu_node, "cpu-idle-states", i);
>
> Can we move above to use of_get_cpu_state_node ? Since it also handles
> domain-idle-states.
>
> > +             if (!state_node)
> > +                     break;
> > +
> >               ret = psci_dt_parse_state_node(state_node, &psci_states[i]);
> >               of_node_put(state_node);
> >
> > @@ -104,6 +98,11 @@ static int __init psci_dt_cpu_init_idle(struct device_node *cpu_node, int cpu)
> >               pr_debug("psci-power-state %#x index %d\n", psci_states[i], i);
> >       }
> >
> > +     if (i != state_nodes) {
> > +             ret = -ENODEV;
> > +             goto free_mem;
> > +     }
> > +
> >       /* Idle states parsed correctly, initialize per-cpu pointer */
> >       per_cpu(psci_power_state, cpu) = psci_states;
> >       return 0;
> > @@ -113,7 +112,7 @@ static int __init psci_dt_cpu_init_idle(struct device_node *cpu_node, int cpu)
> >       return ret;
> >  }
> >
> > -static __init int psci_cpu_init_idle(unsigned int cpu)
> > +static __init int psci_cpu_init_idle(unsigned int cpu, unsigned int state_nodes)
>
> Does it make sense to rename it as state_count or something similar ?

Let me check to see if it makes sense to change it. Rebasing on top of
your recently submitted patch, might tell better.

> And it may need + 1 once we add wfi also as entry as suggested by
> Lorenzo.

Yep.

Kind regards
Uffe
