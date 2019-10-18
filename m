Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 721B6DC1CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 11:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728971AbfJRJvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 05:51:49 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:33993 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730808AbfJRJvt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 05:51:49 -0400
Received: by mail-vs1-f67.google.com with SMTP id d3so3644287vsr.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2019 02:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=knD6IYh1XTlD/ibBcWNI8K/BimIHANG2UXS26q595lM=;
        b=ajfJ/X3Xn9ixrvBV5r5b5vdMwo992Y4/lgGjzTZi7bhDn1x3Sb8Meb6nx9MEBrDluM
         wrhnsG55M0SzjMG4AsohoOtMMJJoL9p6nTpAtsmnQLjNOoZsheONg2DowRT1K493JMbS
         AcPCbyAW2qjy+PAii2wOQsKFZdkcGbOW3ImYp8HBYWnkDEEqeYubSNKfXGMw+g8MMdgO
         spHUtMIvhhodOch4AZKB1PpBRQ4Z7rOfrmx1Sml7fiQlIgxA/TpCTFSY6Tvk64HXG41m
         kQ5PHiNOkVNqKevQXoTaUDcyOW8JcDP2dgYULeJFd9y3SuLWc6fu6WFxljo+kb0wboJl
         7aYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=knD6IYh1XTlD/ibBcWNI8K/BimIHANG2UXS26q595lM=;
        b=BWiZ+xx6Np8rbXs2qk1LcsqhvNL/9Gteb8n/GubPUNDH6TvOli7YRkIjd+4F8mRdFF
         yC5qPzCdFGSJCqX2JsBP3+YrCSsh77T3HpjAv/tUY/UZdXFDlYaIYTeeNU58WfRCRLfe
         BAFnR67x5sHEiVoRQRrha/q+hp73/awGMWctARWqp1CpNctzuwsmFh4cxs1wodG8lq2j
         RP8j3iY3wXlJB1tghypJdh+EXDZjsHTrvTiQTyYdBVC10X+iNevo6sGENF59A1vYgEW3
         aSDa20BmLrm40CIFQ34McCStPlkGjmUozL1QEVRNVbLbnNKwNFmhDmNSzZAhaxV65fOp
         1R9g==
X-Gm-Message-State: APjAAAXHWCZO9uwQhiNVoHgsijsUVTdHdGgeNs8Mziy56nTRJ4C7vgNn
        d/Vvb9uHbnsucU2242Zx493OkKKRawx/l9hUkWmeNQ==
X-Google-Smtp-Source: APXvYqxFUTnsVUqOPYGTlBe0WnXNlxQEuh5mYZupJcL1UOwQvgkbBN4IMB7XRxQVNzi9OdZCe0CRpSW7L61xE1ZxYCo=
X-Received: by 2002:a67:ebc2:: with SMTP id y2mr4847513vso.191.1571392308109;
 Fri, 18 Oct 2019 02:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191010113937.15962-1-ulf.hansson@linaro.org>
 <20191010113937.15962-2-ulf.hansson@linaro.org> <20191018093839.GB25918@e121166-lin.cambridge.arm.com>
In-Reply-To: <20191018093839.GB25918@e121166-lin.cambridge.arm.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 18 Oct 2019 11:51:11 +0200
Message-ID: <CAPDyKFqcHY6+Eq9d6xTPYMDrUOtGs+64YuwZ1EbFtqQZe0+xEw@mail.gmail.com>
Subject: Re: [PATCH 01/13] cpuidle: psci: Fix potential access to unmapped memory
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
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

On Fri, 18 Oct 2019 at 11:38, Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Thu, Oct 10, 2019 at 01:39:25PM +0200, Ulf Hansson wrote:
> > When the WFI state have been selected, the in-parameter idx to
> > psci_enter_idle_state() is zero. In this case, we must not index the state
> > array as "state[idx - 1]", as it means accessing data outside the array.
> > Fix the bug by pre-checking if idx is zero.
> >
> > Fixes: 9ffeb6d08c3a ("PSCI: cpuidle: Refactor CPU suspend power_state parameter handling")
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/cpuidle/cpuidle-psci.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> > index f3c1a2396f98..2e91c8d6c211 100644
> > --- a/drivers/cpuidle/cpuidle-psci.c
> > +++ b/drivers/cpuidle/cpuidle-psci.c
> > @@ -27,10 +27,10 @@ static DEFINE_PER_CPU_READ_MOSTLY(u32 *, psci_power_state);
> >  static int psci_enter_idle_state(struct cpuidle_device *dev,
> >                               struct cpuidle_driver *drv, int idx)
> >  {
> > -     u32 *state = __this_cpu_read(psci_power_state);
> > +     u32 *states = __this_cpu_read(psci_power_state);
> > +     u32 state = idx ? states[idx - 1] : 0;
> >
> > -     return CPU_PM_CPU_IDLE_ENTER_PARAM(psci_cpu_suspend_enter,
> > -                                        idx, state[idx - 1]);
> > +     return CPU_PM_CPU_IDLE_ENTER_PARAM(psci_cpu_suspend_enter, idx, state);
>
> Technically we don't dereference that array entry but I agree this
> is ugly and potentially broken.

No sure understand the non-deference part.

If the governor selects WFI, the idx will be 0 - and thus we end up
using state[-1], doesn't that dereference an invalid address, no?

>
> My preference is aligning it with ACPI code and allocate one more
> entry in the psci_power_state array (useless for wfi, agreed but
> at least we remove this (-1) handling from the code).

I can do that, but sounds like a slightly bigger change. Are you fine
if I do that on top, so we can get this sent as fix for v5.4-rc[n]?

Kind regards
Uffe
