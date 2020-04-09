Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE3F1A30BB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 10:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgDIIQS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 04:16:18 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45974 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgDIIQS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 04:16:18 -0400
Received: by mail-pg1-f193.google.com with SMTP id w11so471455pga.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2020 01:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=XCQYTOYKkewyzGEcrkL/TPuusUnX/PYbV/+OIgYCWvQ=;
        b=Vmm10K769J1HIMC7p1bb5XvOdIpocHqm8j0y9IBwFe4G23ehp2zyzcQjIPELsa/Sr3
         I4YkJg9W5ekMScQSLrRa7iNKsSGbye8bWDns7OLjaNv+ecLmlZyX5T8LtN7ekwhyQJTa
         SkKw8EPdXlE4sGbstb5D5ZpUE/IJdnVzDXRRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=XCQYTOYKkewyzGEcrkL/TPuusUnX/PYbV/+OIgYCWvQ=;
        b=nDziwED8nuxtbjP47KEi6fyedrXh93G6gA/SsN0Ej6k9LVZOGlQNmMcEYAaBbyaFCD
         QS4thhkwbaGf97n+mwmevwJzksIU5r6D3NZzsThtPPl4vLDW9SezzG2wkdB2U613VSiG
         zo6gHcK3Ayja5eCtpYv3BZOUF7/GESU+nMmBrUi5XJAEOT2lRT0AsyUmYXgtrWOBxcgG
         ppp2brPEoB+07Pp7BmO7q13RMOStkrkJvU7152G8v/8q0d/L7t0YK3JGTG957gke1UCX
         8wkGRpw1rqaK0XArjC4vyPPZdKmyQR02Nr+FTzLacY3kww5nal5GZLXqSO2gqGRz+KE6
         mOcQ==
X-Gm-Message-State: AGi0PuY6yl52oJfwZboLJLnd9Gla/Eg+7NJXv7iUnsP8pOGXIep7wMtr
        wyNFguNkQJtIpJWiFoDH1uu3SA==
X-Google-Smtp-Source: APiQypJQ1I6e+EfrgM2OYM3xD+1/9Nx4wNrauyUjPBovQPpK7Q3a1uSLtv/N2GNalrOSPd1O2KBobg==
X-Received: by 2002:aa7:97a6:: with SMTP id d6mr12498752pfq.154.1586420177564;
        Thu, 09 Apr 2020 01:16:17 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y9sm19190490pfo.135.2020.04.09.01.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 01:16:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8553ce0f-6dda-b0e0-d67a-f76ce3c0f945@codeaurora.org>
References: <1586154741-8293-1-git-send-email-mkshah@codeaurora.org> <1586154741-8293-5-git-send-email-mkshah@codeaurora.org> <158631424318.216820.1843109743502322053@swboyd.mtv.corp.google.com> <8553ce0f-6dda-b0e0-d67a-f76ce3c0f945@codeaurora.org>
Subject: Re: [PATCH v16 4/6] soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        dianders@chromium.org, evgreen@chromium.org
Date:   Thu, 09 Apr 2020 01:16:16 -0700
Message-ID: <158642017601.126188.6125314877042857783@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-04-08 00:08:48)
> Hi,
>=20
> On 4/8/2020 8:20 AM, Stephen Boyd wrote:
> > Quoting Maulik Shah (2020-04-05 23:32:19)
> >> for CPU PM notification. They may be in autonomous mode executing
> >> low power mode and do not require rpmh_flush() to happen from CPU
> >> PM notification.
> >>
> >> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> >> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >> ---
> >>   drivers/soc/qcom/rpmh-internal.h |  25 +++++---
> >>   drivers/soc/qcom/rpmh-rsc.c      | 123 +++++++++++++++++++++++++++++=
++++++----
> >>   drivers/soc/qcom/rpmh.c          |  26 +++------
> >>   3 files changed, 137 insertions(+), 37 deletions(-)
> >>
> >> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> >> index b718221..fbe1f3e 100644
> >> --- a/drivers/soc/qcom/rpmh-rsc.c
> >> +++ b/drivers/soc/qcom/rpmh-rsc.c
> >> @@ -6,6 +6,7 @@
> > [...]
> >> +
> >> +static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
> >> +                                   unsigned long action, void *v)
> >> +{
> >> +       struct rsc_drv *drv =3D container_of(nfb, struct rsc_drv, rsc_=
pm);
> >> +       int ret =3D NOTIFY_OK;
> >> +
> >> +       spin_lock(&drv->pm_lock);
> >> +
> >> +       switch (action) {
> >> +       case CPU_PM_ENTER:
> > I thought CPU_PM notifiers weren't supposed to be used anymore? Or at
> > least, the genpd work that has gone on for cpuidle could be used here in
> > place of CPU_PM notifiers?
>=20
> genpd was used in v3 and v4 of this series, where from pd's .power_off=C2=
=A0=20
> function, rpmh_flush() was invoked.
>=20
> genpd can be useful if target firmware supports PSCI's OSI mode, while=20
> sc7180 is non-OSI target.
>=20
> The current approch (using cpu pm notification) can be used for both OSI =

> and non-OSI targets to invoke rpmh_flush() when last cpu goes to power do=
wn.

Ok. Doug and I talked today and I re-read the earlier series and I think
Sudeep was suggesting that if we're doing last man down activities here
then we're better off using OSI vs. PC mode. But I can only assume
that's because the concern is something here requires software's help
for last man down activities like lowering a CPU voltage setting or
turning off some power switch to a hardware block through some i2c
message. The way I understand it the last man down activities here are
just setting up the sleep and wake TCS FIFOs to "do the right thing"
when the last CPU actually goes down and the first CPU wakes up by
running through the pile of "instructions" that we program into the
FIFOs.

The execution of those instructions is all done in hardware so any
aggregation or coordination between CPUs is not really important here.
All that matters is that we set up the sleep and wake TCS FIFOs properly
so that _if_ the whole CPU subsystem goes to sleep we're going to let
the hardware turn off the right stuff and lower voltages, etc. and
vice-versa for wake. If we didn't have to share the TCS FIFOs with
active mode control then we could just tweak the sleep and wake TCS
buckets at runtime and let the hardware state of the CPUs decide to
trigger them at the right time. Unfortunately, we don't have that luxury
and we're stuck repurposing the sleep TCS FIFO to control things like
regulator voltages when the CPU is awake. Yuck!

>=20
> > And so this isn't actually any different
> > than what was proposed originally to use genpd for this?
> >

I guess this answer to this is yes. Which is fine. CPU PM notifiers are
still used by various drivers to do things like save/restore state of
devices that lose state when the CPUs power down. The use of genpd is
helpful for OSI mode because it can describe how/when big and little
clusters are powered off by putting them in different genpds. For
counting the last CPU to turn off it seems simpler to just register for
CPU PM notifiers and not care about genpd logic and nesting clusters,
etc. I'm happy to see this not be a blocker.
