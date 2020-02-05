Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D111534CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 16:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbgBEPzy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 10:55:54 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:44634 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727697AbgBEPzy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 10:55:54 -0500
Received: by mail-vs1-f67.google.com with SMTP id p6so1613284vsj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2020 07:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ei9H45SV2oMs69C7hL0SyaAz256oxS6zCX5MjvjcWsU=;
        b=Nbq5QFkLGVrepL0kiN0uMOeJSiQzYs0SIsaGXzuFw02d55rgJXVER2UguTreuVRGJO
         Od4xBaxLrJDFSjE6bsj/+aUv9g+rYikRSWZyUQledbdk/qhAy29jK+vcs1DSM5HzxPuO
         c5BOqGKN/1CIxVjv2yrQJRe4hCvPMRT57oeV36R1VPLE01xb9GAo9MxqQEOTMXvDJNZk
         zkaFAQgOgMOYJxNPMgclviF2hmrn2Yfp6AO3+sQxJIajd3Ok/x+B0cgXXgWrzRXYHfKd
         fpR95zPsC6lrCVdelVsr4LatgdvMAc1Y+1iJx5DWEh/KAgqOL/zuXYPqb5PRsywUb1/s
         Ze9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ei9H45SV2oMs69C7hL0SyaAz256oxS6zCX5MjvjcWsU=;
        b=D/5FhpTJsEjUyQI953DjWdd9xtt+O5rUdNULLe18SYpYcIsLikiEIF9gapKnNh7uuL
         8vJQRZezfNeof/8/JlKkxyhrUKOnrNXw0uAzhjy0YM4h6ZFJAFRp4yvO0QHhxsmAsiK6
         Nsa8Sh4CYK49mk2KleJQYLEFRLcDmaK/dQ9gYyTB+LbMy/BgSa7StDy9GJkJhWE0edWR
         bHGFhnqeXU+4G0L1hmvpsq2aivn5om3WlIMz8exVuADXc21SpPSvt07D7uBaksOAXdoG
         ZFrvniu7jFA4iPB1h3q7Gec/9IrOW+dqsM35vnZmknEDT9Jm+7ZPtvMzyIEaTlAAxw6Y
         g5bw==
X-Gm-Message-State: APjAAAW04WlgVSQ8ApmXYgS5QkKB1xIViRksXx64m5B10C7pfSRYwy4K
        o2fTsltNS6dFukg4W5UylJTAx+yG7qyt17Ym4tfmJw==
X-Google-Smtp-Source: APXvYqwSSPQAZY6rLGXHvigKNLyKPELRR7aaS7nR0axlfGQtU2mVxCkKTFTO+6ddkXy//tB9BMu4/9jHYzXyjFWuYuM=
X-Received: by 2002:a05:6102:757:: with SMTP id v23mr22937800vsg.35.1580918153583;
 Wed, 05 Feb 2020 07:55:53 -0800 (PST)
MIME-Version: 1.0
References: <1580736940-6985-1-git-send-email-mkshah@codeaurora.org>
 <1580736940-6985-6-git-send-email-mkshah@codeaurora.org> <20200203170832.GA38466@bogus>
 <0d7f7ade-3a1e-5428-d851-f1a886f58712@codeaurora.org> <20200204152132.GA44858@bogus>
 <6ff7c82d-4204-a339-4070-0154ab4515f1@codeaurora.org> <20200205140603.GB38466@bogus>
In-Reply-To: <20200205140603.GB38466@bogus>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 5 Feb 2020 16:55:17 +0100
Message-ID: <CAPDyKFoyepN2VX4COMomp1e9dXPozzrgCdcy0paee2jp8Wm3YA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] drivers: firmware: psci: Add hierarchical domain
 idle states converter
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 5 Feb 2020 at 15:06, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Wed, Feb 05, 2020 at 05:53:00PM +0530, Maulik Shah wrote:
> >
> > On 2/4/2020 8:51 PM, Sudeep Holla wrote:
> > > On Tue, Feb 04, 2020 at 10:22:42AM +0530, Maulik Shah wrote:
> > > > On 2/3/2020 10:38 PM, Sudeep Holla wrote:
> > > > > On Mon, Feb 03, 2020 at 07:05:38PM +0530, Maulik Shah wrote:
> > > > > > From: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > >
> > > > > > If the hierarchical CPU topology is used, but the OS initiated mode isn't
> > > > > > supported, we need to rely solely on the regular cpuidle framework to
> > > > > > manage the idle state selection, rather than using genpd and its
> > > > > > governor.
> > > > > >
> > > > > > For this reason, introduce a new PSCI DT helper function,
> > > > > > psci_dt_pm_domains_parse_states(), which parses and converts the
> > > > > > hierarchically described domain idle states from DT, into regular flattened
> > > > > > cpuidle states. The converted states are added to the existing cpuidle
> > > > > > driver's array of idle states, which make them available for cpuidle.
> > > > > >
> > > > > And what's the main motivation for this if OSI is not supported in the
> > > > > firmware ?
> > > > Hi Sudeep,
> > > >
> > > > Main motivation is to do last-man activities before the CPU cluster can
> > > > enter a deep idle state.
> > > >
> > > Details on those last-man activities will help the discussion. Basically
> > > I am wondering what they are and why they need to done in OSPM ?
> >
> > Hi Sudeep,
> >
> > there are cases like,
> >
> > Last cpu going to deepest idle mode need to lower various resoruce
> > requirements (for eg DDR freq).
> >
>
> In PC mode, only PSCI implementation knows the last man and there shouldn't
> be any notion of it in OS. If you need it, you may need OSI. You are still
> mixing up the things. NACK for any such approach, sorry.

Sudeep, I don't quite agree with your NACK to this. At least not yet. :-)

I do agree that the best suited solution seems to be OSI, as to
support this kind of SoC requirements.

However, if for some reason the PC mode is being used, we could still
allow Linux to control "last-man activities" as it knows what each CPU
has voted for when going idle. Yes, the PSCI FW decides in the end,
but that doesn't really matter. Or is there another technical reason
to why you object?

As a matter of fact, if we allow support for PC mode with
"last-man-activities", it would allow us to make a fair
performance/energy comparison between the two PSCI CPU suspend modes,
for the same SoC. I would be thrilled about looking into doing such
tests, I bet you are as well!?

Kind regards
Uffe
