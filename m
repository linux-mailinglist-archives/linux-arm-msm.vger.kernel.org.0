Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 762AF19A8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 11:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbfEJJYq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 05:24:46 -0400
Received: from foss.arm.com ([217.140.101.70]:40896 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727160AbfEJJYq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 05:24:46 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A7F7A78;
        Fri, 10 May 2019 02:24:45 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B2FC3F738;
        Fri, 10 May 2019 02:24:42 -0700 (PDT)
Date:   Fri, 10 May 2019 10:24:37 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Amit Kucheria <amit.kucheria@linaro.org>
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
        Sudeep Holla <sudeep.holla@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add PSCI cpuidle support
Message-ID: <20190510091158.GA10284@e107155-lin>
References: <20190508145600.GA26843@centauri>
 <CAHLCerN8L4np0WAY4hTjTnPXFtTK6EH0BXWLXzB-NiRaAnvcDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHLCerN8L4np0WAY4hTjTnPXFtTK6EH0BXWLXzB-NiRaAnvcDA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 09, 2019 at 11:19:23PM +0530, Amit Kucheria wrote:
> (Adding Lorenzo and Sudeep)
>
> On Wed, May 8, 2019 at 8:26 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
> >
> > On Wed, May 08, 2019 at 02:48:19AM +0530, Amit Kucheria wrote:
> > > On Tue, May 7, 2019 at 1:01 AM Niklas Cassel <niklas.cassel@linaro.org> wrote:
> > > >
> > > > Add device bindings for CPUs to suspend using PSCI as the enable-method.
> > > >
> > > > Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/qcs404.dtsi | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > > > index ffedf9640af7..f9db9f3ee10c 100644
> > > > --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > > > @@ -31,6 +31,7 @@
> > > >                         reg = <0x100>;
> > > >                         enable-method = "psci";
> > > >                         next-level-cache = <&L2_0>;
> > > > +                       cpu-idle-states = <&CPU_PC>;
> > > >                 };
> > > >
> > > >                 CPU1: cpu@101 {
> > > > @@ -39,6 +40,7 @@
> > > >                         reg = <0x101>;
> > > >                         enable-method = "psci";
> > > >                         next-level-cache = <&L2_0>;
> > > > +                       cpu-idle-states = <&CPU_PC>;
> > > >                 };
> > > >
> > > >                 CPU2: cpu@102 {
> > > > @@ -47,6 +49,7 @@
> > > >                         reg = <0x102>;
> > > >                         enable-method = "psci";
> > > >                         next-level-cache = <&L2_0>;
> > > > +                       cpu-idle-states = <&CPU_PC>;
> > > >                 };
> > > >
> > > >                 CPU3: cpu@103 {
> > > > @@ -55,12 +58,24 @@
> > > >                         reg = <0x103>;
> > > >                         enable-method = "psci";
> > > >                         next-level-cache = <&L2_0>;
> > > > +                       cpu-idle-states = <&CPU_PC>;
> > > >                 };
> > > >
> > > >                 L2_0: l2-cache {
> > > >                         compatible = "cache";
> > > >                         cache-level = <2>;
> > > >                 };
> > > > +
> > > > +               idle-states {
> > >
> > > entry-method="psci" property goes here. I have a patch fixing it for 410c ;-)
> > >
> > > I don't think the psci_cpuidle_ops will even get called without this.
> >
> > Hello Amit,
> >
> > I added debug prints in psci_cpu_suspend_enter() and arm_cpuidle_suspend()
> > when verifying this patch, and psci_cpu_suspend_enter() is indeed called,
> > with the correct psci suspend parameter.
> >
> > The output from:
> > grep "" /sys/bus/cpu/devices/cpu0/cpuidle/state?/*
> > also looks sane.
> >
> > However, if 'entry-method="psci"' is required according to the DT binding,
> > perhaps you can send a 2/2 series that fixes both this patch and msm8916 ?
>
> Last time I discussed this with Lorenzo and Sudeep (on IRC), I pointed
> out that entry-method="psci" isn't checked for in code anywhere. Let's
> get their view on this for posterity.
>

Yes entry-method="psci" is required as per DT binding but not checked
in code on arm64. We have CPU ops with idle enabled only for "psci", so
there's not need to check.

Once we have DT schema validation, this will be caught, so it's better
to fix it.

> What does entry-method="psci" in the idle-states node achieve that
> enable-method="psci" in the cpu node doesn't achieve? (Note: enable-
> vs. entry-).
>

From DT binding perspective, we can have different CPU enable-method
and CPU idle entry-method. However on arm64, it's restricted to PSCI
only. I need to check what happens on arm32 though, as the driver
invocation happens via CPUIDLE_METHOD_OF_DECLARE.

> The enable-method property is the one that sets up the
> psci_cpuidle_ops callbacks through the CPUIDLE_METHOD_OF_DECLARE
> macro.
>

Indeed.

> IOW, if we deprecated the entry-method property, everything would
> still work, wouldn't it?

Why do you want to deprecated just because Linux kernel doesn't want to
use it. That's not a valid reason IMO.

> Do we expect to support PSCI platforms that might have a different
> entry-method for idle states?

Not on ARM64, but same DT bindings can be used for idle-states on
say RISC-V and have some value other than "psci".

> Should I whip up a patch removing entry-method? Since we don't check
> for it today, it won't break the old DTs either.
>

Nope, I don't think so. But if it's causing issues, we can look into it.
I don't want to restrict the use of the bindings for ARM/ARM64 or psci only.

--
Regards,
Sudeep
