Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75EC61A2F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 20:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbfEJS2x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 14:28:53 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:34491 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727535AbfEJS2x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 14:28:53 -0400
Received: by mail-ua1-f68.google.com with SMTP id f9so2483066ual.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2019 11:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=53B459eecvRty+a3wV9xVIaRrF5O7M+rhPq+rsdt49Q=;
        b=Cg00A8UFLYkETfa0fNN/fBZTQ/WB3tM0tBvqcgmsD7y4Qnh+T7w5qI3un3uJFEYnzl
         KaC1ZQ/e9h8U5x1HQqzOqNI+6QLjLi/9TFwZV2s5ZCpnbc93Q+uelEF4LDdko9hbTWIF
         qGhDp/rhVSoIR1YCxVfG+VsqcQf+Yd0U54jPTVl1qycbXo2zKhtQGbXG2QYvHgQQ3MYy
         MINutBZLASFsyKnRhT4dShy9e9JHBIsnDYytNtgzXxVPJULGq0ypi0kXFh3+jCuckYps
         rDP7Xjq0ehMyZeT2eXWFoObjJNJn2iG704TlGzr7DBAVgSeiKZfsnMw2fDgzI8Qw7I6n
         OMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=53B459eecvRty+a3wV9xVIaRrF5O7M+rhPq+rsdt49Q=;
        b=bYG8+R2taz7GnUObWIDPLb9QWF5gq+2WQ1brGkFq+n57+P/dPPKDVpoXn9qyZVSnAi
         hELQbFHB2yhSv+vohPjlxMEyq3X7e7Qe5l2l6HEFRp/VIo5gnGQ29a6qUYUA6JQz2PN7
         z4psl1ffOStuib8kTYzXm26J7KREwMF2F3tjCwwvvEAORfV0rXGkjz5XPKBR8gYJ5GD2
         POrB+9/qg/7Hql75CZucbchMBKH+nwpBxmuG21OyKhhXPau2G1/V16nsLHlxqhka2jOP
         f63eluIut08hLMDdhwisK5XMCZJZtNUglYKiMtTzXEQEn87suWnApSr9KAOVHfTzN0CP
         AESw==
X-Gm-Message-State: APjAAAV72m/fqKdsFTik/nWPbY0spQD4afSuG/kmtkIcEzUsO86ncd1a
        khksA/Xp1xipObcdxhadGnHVKJo9z5n1Pxm+7iZesg==
X-Google-Smtp-Source: APXvYqwXRa9KK3jbWYWs+gozP2JQn6xPfkndKLXXl4HD2u+AuhwHY19lfENjCYj/mWKbuNyqLzndwn0I636BipoYXhc=
X-Received: by 2002:ab0:154e:: with SMTP id p14mr6334650uae.48.1557512931577;
 Fri, 10 May 2019 11:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190508145600.GA26843@centauri> <CAHLCerN8L4np0WAY4hTjTnPXFtTK6EH0BXWLXzB-NiRaAnvcDA@mail.gmail.com>
 <20190510091158.GA10284@e107155-lin>
In-Reply-To: <20190510091158.GA10284@e107155-lin>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Fri, 10 May 2019 23:58:40 +0530
Message-ID: <CAHLCerM83weBBvwurU45d9_M0Wg49WjDFTRJ6KL8vj7cavz03g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add PSCI cpuidle support
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Niklas Cassel <niklas.cassel@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Lina Iyer <lina.iyer@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 10, 2019 at 2:54 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Thu, May 09, 2019 at 11:19:23PM +0530, Amit Kucheria wrote:
> > (Adding Lorenzo and Sudeep)
> >
> > On Wed, May 8, 2019 at 8:26 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
> > >
> > > On Wed, May 08, 2019 at 02:48:19AM +0530, Amit Kucheria wrote:
> > > > On Tue, May 7, 2019 at 1:01 AM Niklas Cassel <niklas.cassel@linaro.org> wrote:
> > > > >
> > > > > Add device bindings for CPUs to suspend using PSCI as the enable-method.
> > > > >
> > > > > Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/qcs404.dtsi | 15 +++++++++++++++
> > > > >  1 file changed, 15 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > > > > index ffedf9640af7..f9db9f3ee10c 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > > > > @@ -31,6 +31,7 @@
> > > > >                         reg = <0x100>;
> > > > >                         enable-method = "psci";
> > > > >                         next-level-cache = <&L2_0>;
> > > > > +                       cpu-idle-states = <&CPU_PC>;
> > > > >                 };
> > > > >
> > > > >                 CPU1: cpu@101 {
> > > > > @@ -39,6 +40,7 @@
> > > > >                         reg = <0x101>;
> > > > >                         enable-method = "psci";
> > > > >                         next-level-cache = <&L2_0>;
> > > > > +                       cpu-idle-states = <&CPU_PC>;
> > > > >                 };
> > > > >
> > > > >                 CPU2: cpu@102 {
> > > > > @@ -47,6 +49,7 @@
> > > > >                         reg = <0x102>;
> > > > >                         enable-method = "psci";
> > > > >                         next-level-cache = <&L2_0>;
> > > > > +                       cpu-idle-states = <&CPU_PC>;
> > > > >                 };
> > > > >
> > > > >                 CPU3: cpu@103 {
> > > > > @@ -55,12 +58,24 @@
> > > > >                         reg = <0x103>;
> > > > >                         enable-method = "psci";
> > > > >                         next-level-cache = <&L2_0>;
> > > > > +                       cpu-idle-states = <&CPU_PC>;
> > > > >                 };
> > > > >
> > > > >                 L2_0: l2-cache {
> > > > >                         compatible = "cache";
> > > > >                         cache-level = <2>;
> > > > >                 };
> > > > > +
> > > > > +               idle-states {
> > > >
> > > > entry-method="psci" property goes here. I have a patch fixing it for 410c ;-)
> > > >
> > > > I don't think the psci_cpuidle_ops will even get called without this.
> > >
> > > Hello Amit,
> > >
> > > I added debug prints in psci_cpu_suspend_enter() and arm_cpuidle_suspend()
> > > when verifying this patch, and psci_cpu_suspend_enter() is indeed called,
> > > with the correct psci suspend parameter.
> > >
> > > The output from:
> > > grep "" /sys/bus/cpu/devices/cpu0/cpuidle/state?/*
> > > also looks sane.
> > >
> > > However, if 'entry-method="psci"' is required according to the DT binding,
> > > perhaps you can send a 2/2 series that fixes both this patch and msm8916 ?
> >
> > Last time I discussed this with Lorenzo and Sudeep (on IRC), I pointed
> > out that entry-method="psci" isn't checked for in code anywhere. Let's
> > get their view on this for posterity.
> >
>
> Yes entry-method="psci" is required as per DT binding but not checked
> in code on arm64. We have CPU ops with idle enabled only for "psci", so
> there's not need to check.

I don't see it being checked on arm32 either.

> Once we have DT schema validation, this will be caught, so it's better
> to fix it.
>
> > What does entry-method="psci" in the idle-states node achieve that
> > enable-method="psci" in the cpu node doesn't achieve? (Note: enable-
> > vs. entry-).
> >
>
> From DT binding perspective, we can have different CPU enable-method
> and CPU idle entry-method. However on arm64, it's restricted to PSCI
> only. I need to check what happens on arm32 though, as the driver
> invocation happens via CPUIDLE_METHOD_OF_DECLARE.
>
> > The enable-method property is the one that sets up the
> > psci_cpuidle_ops callbacks through the CPUIDLE_METHOD_OF_DECLARE
> > macro.
> >
>
> Indeed.
>
> > IOW, if we deprecated the entry-method property, everything would
> > still work, wouldn't it?
>
> Why do you want to deprecated just because Linux kernel doesn't want to
> use it. That's not a valid reason IMO.

Fair enough. Just want to make sure that it isn't some vestigial
property that was never used. Do you know if another OS is actually
using it?

> > Do we expect to support PSCI platforms that might have a different
> > entry-method for idle states?
>
> Not on ARM64, but same DT bindings can be used for idle-states on
> say RISC-V and have some value other than "psci".

Both enable-method and entry-method properties are currently only used
(and documented) for ARM platforms. Hence this discussion about
deprecation of one of them.

> > Should I whip up a patch removing entry-method? Since we don't check
> > for it today, it won't break the old DTs either.
> >
>
> Nope, I don't think so. But if it's causing issues, we can look into it.
> I don't want to restrict the use of the bindings for ARM/ARM64 or psci only.

Only a couple of minor issues:
1. There is a trickle of DTs that need fixing up every now and then
because they don't use entry-method in their idle-states node. Schema
validation ought to fix that.
2. A property that isn't ready by any code is a bit confusing. Perhaps
we can mention something to the effect in the documentation?

Regards,
Amit
