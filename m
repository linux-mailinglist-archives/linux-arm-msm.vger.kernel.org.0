Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B99FBE3917
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2019 19:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410006AbfJXRBP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Oct 2019 13:01:15 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:34682 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409956AbfJXRBP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Oct 2019 13:01:15 -0400
Received: by mail-vk1-f194.google.com with SMTP id d126so5463366vkb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2019 10:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RBmI5ndT/rdjwDOXYP/KFIiToDnQR4EfL3VmkBr9f70=;
        b=Wcd9I4prVPt4pYBLuTiHtwoyObyHOOGRcl8I/PVau5xjSltxf1UCTiShSh7x7Ut7Fb
         aN+J0Mj4B6gkiMTpaPFrpQXBN+YVE4Oz3TQQsKZcTSa2ScfGr5tNBqBwCR1QZiQ3Iw+e
         S1fRUgWXU7iQNp8v1lYtOXzEoLH4eOy6XsJzmERHxti4Gha0JzMyw1UaVj5iMnk43kVF
         hBWL4IFKXA3/8uo6PyRfJ9ElUvyRpqv7I8v6kAdJTss1w2XXm6yvGmlndEgMjgM6v/1T
         5G00/ReE+jhWY68vblefAAtmIyJ2qsmIco8KyuK8Rw7jdwDRYOQmoadjXoBt8EfsAUSo
         iJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RBmI5ndT/rdjwDOXYP/KFIiToDnQR4EfL3VmkBr9f70=;
        b=DT0VHHGuIqus+A5eO31rg/QMCN/d6P4jWuIM/6A+85rnFJY8TClSFwsnZCyOOjlfpx
         olkA9y4yf2+RutU02u7pjij8h4B6bNvv+8QbmWZz3STdRQqi8VOgk0FREBB5roY5qKgZ
         1YLKWrHibG4n3eT6SidulTboDpSe8S/wj9xDC5PsII44VsSF2lVGitLvUVunAJpnccT8
         ouFvk9io6nMinYiYYEoq1o50Jtk+QiBrACdjVczUV3UdanlQsOJyuyOed7IWXrF3YcHQ
         /XharVi74/yXmx3gl+e7nVQ5ZMGxpKiT7YOyGjOfjdDBdMc6dQyQ0serKQSC7zJmLAbs
         XZGg==
X-Gm-Message-State: APjAAAWVgazzJhZj3Wmzn/9bLcYMK+8mCXv+0I2ZPbeDnHDYLbpx3GHG
        poaxgiNZSexE6GAAB3nWIB8d7TsqrGayC8U3LLDjGw==
X-Google-Smtp-Source: APXvYqx+/WMjFqRZHQ6kYItgeBnM23srHiuZcapnsvjGB1wwOdbVBEo6wgMMItlmMC3G3Y4sUiCAGzrvEtO6ZLyJml4=
X-Received: by 2002:a1f:7381:: with SMTP id o123mr9587850vkc.53.1571936474341;
 Thu, 24 Oct 2019 10:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191010113937.15962-1-ulf.hansson@linaro.org>
 <20191010113937.15962-13-ulf.hansson@linaro.org> <20191024163257.GC22036@bogus>
In-Reply-To: <20191024163257.GC22036@bogus>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 24 Oct 2019 19:00:38 +0200
Message-ID: <CAPDyKFpwrfHj-az5x5dW92VAxi887FgWW6GKhfPv_kuj14TDjQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] cpuidle: psci: Manage runtime PM in the idle path
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

On Thu, 24 Oct 2019 at 18:33, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Thu, Oct 10, 2019 at 01:39:36PM +0200, Ulf Hansson wrote:
> > In case we have succeeded to attach a CPU to its PM domain, let's deploy
> > runtime PM support for the corresponding attached device, to allow the CPU
> > to be powered-managed accordingly.
> >
> > To set the triggering point for when runtime PM reference counting should
> > be done, let's store the index of deepest idle state for the CPU in the per
> > CPU struct. Then use this index to compare the selected idle state index
> > when entering idle, as to understand whether runtime PM reference counting
> > is needed or not.
> >
> > Note that, from the hierarchical point view, there may be good reasons to
> > do runtime PM reference counting even on shallower idle states, but at this
> > point this isn't supported, mainly due to limitations set by the generic PM
> > domain.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/cpuidle/cpuidle-psci.c | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> > index 1510422c7a53..0919b40c1a85 100644
> > --- a/drivers/cpuidle/cpuidle-psci.c
> > +++ b/drivers/cpuidle/cpuidle-psci.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> >  #include <linux/psci.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/slab.h>
> >
> >  #include <asm/cpuidle.h>
> > @@ -25,6 +26,7 @@
> >
> >  struct psci_cpuidle_data {
> >       u32 *psci_states;
> > +     u32 rpm_state_id;
> >       struct device *dev;
> >  };
> >
> > @@ -50,14 +52,28 @@ static int psci_enter_idle_state(struct cpuidle_device *dev,
> >                               struct cpuidle_driver *drv, int idx)
> >  {
> >       int ret;
> > -     u32 *states = __this_cpu_read(psci_cpuidle_data.psci_states);
> > -     u32 state = psci_get_domain_state();
> > +     struct psci_cpuidle_data *data = this_cpu_ptr(&psci_cpuidle_data);
> > +     u32 *states = data->psci_states;
> > +     struct device *pd_dev = data->dev;
> > +     bool runtime_pm = (pd_dev && data->rpm_state_id == idx);
> > +     u32 state;
>
> Wonder if we can have separate psci_enter_idle_state for OSI mode so
> that all these runtime extra check can be reduced ? It will also make
> sure there's no additional latency for PC mode because of OSI.

Good idea, that's the plan. See previous answer.

Perhaps if I add a patch on top, implementing your suggestion, would
you be happy with that?

Kind regards
Uffe
