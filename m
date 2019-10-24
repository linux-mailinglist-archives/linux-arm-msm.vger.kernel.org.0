Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BECE8E392D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2019 19:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410062AbfJXREF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Oct 2019 13:04:05 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:45759 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407806AbfJXREF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Oct 2019 13:04:05 -0400
Received: by mail-ua1-f67.google.com with SMTP id j5so7378689uak.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2019 10:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dzIZOdfZOm9/tczR85zTnpbzPA2Dr5D7KrkOTuOLCMQ=;
        b=pIlGYlwHvtHqaHlxQfDr0+75g9uN4+rdyZh81DemB0rBcak8UrgQ+FyY/pPMLvkjKX
         baoSN4HgwIIshTRvEC+0DlfgTvd9pFnAoiFvQVRMbeDOmDOlDM5eKZYM67BQSogtCsX0
         LbrnqE319qj1A0n3q+dKnGM5wG4GztlgYSvivE4nF5ONzddS2i8kEDuv2nEY+yVejdNs
         42Fu1Lsqo4ex/EIhAH9ZjXXhe+EcWVBQJJik8eGD8lMZOLkqns1yS/zcbys8/wFC+Je6
         B/FciVafCNEoRUYobQSP8ffCI6kHqESXVDdk50gcw+FbYsOmjKTbwT18Pgq916TWKH8K
         zzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dzIZOdfZOm9/tczR85zTnpbzPA2Dr5D7KrkOTuOLCMQ=;
        b=UgPnFHWVH+7yzeICfzOHonXYd5IzsF0X3WpmdKfXtj2jWDxw59A7dWnHG68nJYIAD8
         wu46oXoVEQmzw+vu2RONomedsYje93eT1StaBQyoTxyZFQ6AWVwxx4FQBzI2u6Mdz1BK
         r7aXiJimd7f8I1VqTPpLYsb5YbumuualqKmh65V6jg/JAb4fdR9JgZY6bAhTTTTpSXFi
         9BmF5LYvqjYJj2Xzqj6Z78OHdq4/m/5cL07MN/shfM09Uz1g3tOaBftJ7GcxAx2Dt2gY
         EcrVo4+kRiuTNBwZ5HduP78wD7OekbCwz0SJm+rl2zGYsQvs0ZJRjhg57DzmRNyjVhKu
         RYxg==
X-Gm-Message-State: APjAAAVopm/bHBA0DEVq6nAwmch1j5pNfMvbY9icKNH0rLZ5IRPByWg7
        k5up2g0T+AsTbpGUlXHe0LBBEIWyqdSOc5BK8UQL5g==
X-Google-Smtp-Source: APXvYqzkr6vzJLu1qnQfTtAWGkrgV+rK9emrmymKXieNlDnMIIeTryB5+UQZjsnWebYgfKxZq8M5lsS16aVzuXCyxTE=
X-Received: by 2002:ab0:5a97:: with SMTP id w23mr9528899uae.129.1571936644649;
 Thu, 24 Oct 2019 10:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191010113937.15962-1-ulf.hansson@linaro.org>
 <20191010113937.15962-14-ulf.hansson@linaro.org> <20191024164106.GA24887@bogus>
In-Reply-To: <20191024164106.GA24887@bogus>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 24 Oct 2019 19:03:28 +0200
Message-ID: <CAPDyKFoWTqORFGSe0TwMuRh5wUunm2fDu-uHPZR9xRyT6UjmFQ@mail.gmail.com>
Subject: Re: [PATCH 13/13] arm64: dts: Convert to the hierarchical CPU
 topology layout for MSM8916
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
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Lina Iyer <lina.iyer@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

- Andy

On Thu, 24 Oct 2019 at 18:41, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Thu, Oct 10, 2019 at 01:39:37PM +0200, Ulf Hansson wrote:
> > To enable the OS to better support PSCI OS initiated CPU suspend mode,
> > let's convert from the flattened layout to the hierarchical layout.
> >
> > In the hierarchical layout, let's create a power domain provider per CPU
> > and describe the idle states for each CPU inside the power domain provider
> > node. To group the CPUs into a cluster, let's add another power domain
> > provider and make it act as the master domain. Note that, the CPU's idle
> > states remains compatible with "arm,idle-state", while the cluster's idle
> > state becomes compatible with "domain-idle-state".
> >
> > Cc: Andy Gross <andy.gross@linaro.org>
> > Co-developed-by: Lina Iyer <lina.iyer@linaro.org>
> > Signed-off-by: Lina Iyer <lina.iyer@linaro.org>
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 57 +++++++++++++++++++++++++--
> >  1 file changed, 53 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > index 5ea9fb8f2f87..1ece0c763592 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > @@ -102,10 +102,11 @@
> >                       reg = <0x0>;
> >                       next-level-cache = <&L2_0>;
> >                       enable-method = "psci";
> > -                     cpu-idle-states = <&CPU_SLEEP_0>;
> >                       clocks = <&apcs>;
> >                       operating-points-v2 = <&cpu_opp_table>;
> >                       #cooling-cells = <2>;
> > +                     power-domains = <&CPU_PD0>;
> > +                     power-domain-names = "psci";
>
> As mentioned in the patch: Do we really need to make power-domain-names
> compulsory ?

Yes, I think that is a good idea. However, let's discuss in the other
thread instead.

Again, thanks a lot for reviewing!

Kind regards
Uffe
