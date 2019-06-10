Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45E573BC48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2019 20:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388900AbfFJS5o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 14:57:44 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:36753 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388889AbfFJS5o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 14:57:44 -0400
Received: by mail-vs1-f66.google.com with SMTP id l20so6171257vsp.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2019 11:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hev5OwEACcFPK6C/FK48RMoXOAu7262fSU4AViD4u8w=;
        b=Kai5Z2EkT0zQjVLtISRnsn979fWob+Jsr+Kyg5eRj7CxJ7C+1El4hYerae8V2HnD10
         Vr4/J7G71YpP58NVfVe+X4DYJx2Izsxl0vEeKRtW4ySmvYYI5LNYwJUX7UhV6DWJPQjH
         mUMz6Ce5gPtIrO9yjGBJzdAJQWnFUjaqtBndYVPwHg9T7/wrirYFF33oBhoXNCWsQ0ly
         KLJeIWIl7AB5Hauw6t+B6m/FwhNQB7siy27tLNScZnfT0W34zAk5zCjZUXKcR+ZUDtyf
         nP3cEYZvjT/IvcQYnobXENvk1R8HugzTubIA/RSZDO0UaLZT8wV9gyrXBgrcgIRnElYH
         7QnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hev5OwEACcFPK6C/FK48RMoXOAu7262fSU4AViD4u8w=;
        b=ADZDGdCYbgM4JLy8yGRTZ9FJ9dHozFyopSHr+krpWLFtb88PZBU4M0/wUrm5YEcQQ5
         eqwqrju0aVIzPwOBU3cful8LPedDGLx/3SlwTOBahfTIle6Xo6FIcr0wFzGgspx3jdsq
         vTqy5cLa6pR27N6U9wdRO7JRSanBcAx7hv4snjcpbuawJbpXRzWrdgFZmDB5o/tRAldt
         wB93DeMiwnbbAUDzuK1ZrQ0QHO0lzzFAW8nHJXHWZtBHkk6HjJm8h4T0lhDQFDAR+CBM
         GDn3sbSLAbZEmqHwwQfJvXNRqzsmIQe8aU+436mkTvWqFnuldh3u2loxtrW/iHybU3F9
         mBcg==
X-Gm-Message-State: APjAAAV9qlZlclu0NlL6WdC3jY3uhIM3wwIpDqielSuAzX7h7ObVxzNV
        Gd+YUQn6jBJSU8Rn0HQkGNqkY7gdIukl0MtH0r4FnQ==
X-Google-Smtp-Source: APXvYqwm/ynTvjQ+f9xLC1Cl7wUK4nvhtVIJf0TZpVpspEnFtpsiTVdCmUl3c7IKVyU5GWmfDB+ArZ52XPhJqykZu18=
X-Received: by 2002:a67:ebc5:: with SMTP id y5mr26971295vso.34.1560193063536;
 Mon, 10 Jun 2019 11:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190513192300.653-1-ulf.hansson@linaro.org> <CAJZ5v0gbK3AFCVC1b9LyXeMOM8fKR1=ECXZwaeSYRSqcK0UgYA@mail.gmail.com>
 <CAPDyKFpU3u248Gi+FnrVdY-EWXJQuu14uNV9d3Xs0W-K-EMEhg@mail.gmail.com>
 <20190607154210.GJ15577@e107155-lin> <20190607193407.GB24059@builder>
 <20190610103225.GA26602@e107155-lin> <CAPDyKFr31SwmHHAREbR3dWMQ55LzzUyTc4M5FZvNsqWfX7SE8Q@mail.gmail.com>
 <20190610171557.GA4560@redmoon>
In-Reply-To: <20190610171557.GA4560@redmoon>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 10 Jun 2019 20:57:07 +0200
Message-ID: <CAPDyKFqC8+Sv5WRhwOxqphAt8tb_PDisy13Miz5e-PajvwS1ew@mail.gmail.com>
Subject: Re: [PATCH 00/18] ARM/ARM64: Support hierarchical CPU arrangement for PSCI
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Raju P . L . S . S . S . N" <rplsssn@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Kevin Hilman <khilman@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Souvik Chakravarty <souvik.chakravarty@arm.com>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 10 Jun 2019 at 19:16, Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Mon, Jun 10, 2019 at 05:54:39PM +0200, Ulf Hansson wrote:
>
> [...]
>
> > My summary from the earlier ones, is that because the PSCI spec
> > includes support for OSI, we should also support it in the kernel (and
> > ATF). In a discussion offlist, Lorenzo agreed that it's okay to add,
> > without an apple to apple comparison. Maybe Lorenzo can fill in and
> > state this publicly, to save us all some time?
>
> The comparison should have been made before even requesting PSCI OSI
> mode changes to the specifications, so we have a chip on our shoulders
> anyway.
>
> We will enable PSCI OSI but that's not where the problem lies, enabling
> PSCI OSI from a firmware perspective should take 10 lines of code,
> not:

Thanks for confirming!

>
>  drivers/firmware/psci/Makefile                |   2 +-
>  drivers/firmware/psci/psci.c                  | 219 ++++++++--
>  drivers/firmware/psci/psci.h                  |  29 ++
>  drivers/firmware/psci/psci_pm_domain.c        | 403 ++++++++++++++++++
>
> I have some concerns about these changes that I will state in the
> relevant patches.

Most of the above changes isn't for solely for OSI, but to support a
hierarchical topology described in the PSCI DT layout. This is for
example needed when other resources shares the same power rail as the
CPU cluster.

In other words, the series is orthogonal to whether OSI or PC mode is
used for PSCI, just to make that clear. BTW, this is what you
requested me to change into, a while ago.

>
> > My final point in regards to the OSI mode support, it's a minor part
> > of the series. I don't see how that should hurt from a maintenance
> > point of view, or perhaps I am wrong? In any case, I offer my help
> > with review/maintenance in any form as you may see need/fit.
>
> I will go through the series but most of this code should move
> to core PM code, it has nothing to do with PSCI.

I am looking forward to your review - and for sure, I am open to suggestions!

>
> BTW, apologies for the delay, I was away.
>
> Thanks,
> Lorenzo

Kind regards
Uffe
