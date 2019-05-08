Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9617417CAB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 16:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfEHO4G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 10:56:06 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43933 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfEHO4G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 10:56:06 -0400
Received: by mail-lj1-f193.google.com with SMTP id z5so12646331lji.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2019 07:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8htDcYzvv7rGzEh8SqUEM1/ymGp68hJkdW1G1i150EM=;
        b=w0hD5FuVoDkpcYZEH7/hQmo7kvYPFTKu1Nne/k7qLwFcxkpw/KA/DE8ou6SQJEMxiF
         RNoQRLE/udVXpEIRwi0W3p8AGuVvUhjx0AWZJiZMN25RpB0z60h3ibiMC0AliArsOJU8
         g8lNCi1CJ9w18AE6YIKpI6Im/05JygD3Aw5h0xzHpNF5FGVP5XAE0qSnZGxgnnY/1uu0
         ZkHRqJVrTK7mEbcYwd5Sh6yMApDYwoX97jVRsG+EaGwTIaixZ1l+eAUSWf8qjQwXcMEI
         XWM/pnA8T5HS+TdFR7HKUFd/06ijxR2DOUdeNIt203QVWrpjiXkviHzIF8n1lR/9yEX3
         6lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8htDcYzvv7rGzEh8SqUEM1/ymGp68hJkdW1G1i150EM=;
        b=M9MbTl+pxeIb7dEDalNzydn/K8Jaj++RZR+9N75LgOx2WyrDsMytxgRKeBkd6VYWGb
         +YeGrB+xEqA54PYXem6Tsm1Fj5YBRX0HyY4isF/ptRu6oqAQ+qGuIbFkj6CiY8qkxg0w
         cv4XMjGPlf58oH/3A3BFn1BpNoztPEaRVeTArDhBszInuLmPzY0hfpz5IG4wSdq2KBuI
         TsQmBzmFzHCWSNndsMo4Zt9ipamENrIj2/ax9MtuE0LXk3Leza/wJ3XG8+BxF+BOsMVQ
         xge8JM7uO9KqHOgFjmbFbIwmDO736U8Q8q9Z3pnwUPxMl886nXu9DvfI23s35ihpzVTM
         ++vg==
X-Gm-Message-State: APjAAAUgXMcujpy9rh/CnGbDX5HHS7PP/hwSZGTQ/tI5MySxLHNM/Zxo
        ImA9aN3hOQsntZJ2IFQVjBOgbw==
X-Google-Smtp-Source: APXvYqx8dgczlzcNNVH0OesMn1GM0gojrEv212M95EXagjHgR2Kb8Z7o1Y3rRcUCMZyDw3bXEW13WA==
X-Received: by 2002:a2e:7a03:: with SMTP id v3mr22963583ljc.142.1557327363560;
        Wed, 08 May 2019 07:56:03 -0700 (PDT)
Received: from centauri ([90.228.168.81])
        by smtp.gmail.com with ESMTPSA id k2sm3893991ljg.6.2019.05.08.07.56.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 08 May 2019 07:56:02 -0700 (PDT)
Date:   Wed, 8 May 2019 16:56:00 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
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
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add PSCI cpuidle support
Message-ID: <20190508145600.GA26843@centauri>
References: <20190506193115.20909-1-niklas.cassel@linaro.org>
 <CAP245DXLHqU3tv5cii=Z1G4J5m=Emy7yiHP=zSTpY6GX02NKcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP245DXLHqU3tv5cii=Z1G4J5m=Emy7yiHP=zSTpY6GX02NKcg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 08, 2019 at 02:48:19AM +0530, Amit Kucheria wrote:
> On Tue, May 7, 2019 at 1:01 AM Niklas Cassel <niklas.cassel@linaro.org> wrote:
> >
> > Add device bindings for CPUs to suspend using PSCI as the enable-method.
> >
> > Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs404.dtsi | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > index ffedf9640af7..f9db9f3ee10c 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > @@ -31,6 +31,7 @@
> >                         reg = <0x100>;
> >                         enable-method = "psci";
> >                         next-level-cache = <&L2_0>;
> > +                       cpu-idle-states = <&CPU_PC>;
> >                 };
> >
> >                 CPU1: cpu@101 {
> > @@ -39,6 +40,7 @@
> >                         reg = <0x101>;
> >                         enable-method = "psci";
> >                         next-level-cache = <&L2_0>;
> > +                       cpu-idle-states = <&CPU_PC>;
> >                 };
> >
> >                 CPU2: cpu@102 {
> > @@ -47,6 +49,7 @@
> >                         reg = <0x102>;
> >                         enable-method = "psci";
> >                         next-level-cache = <&L2_0>;
> > +                       cpu-idle-states = <&CPU_PC>;
> >                 };
> >
> >                 CPU3: cpu@103 {
> > @@ -55,12 +58,24 @@
> >                         reg = <0x103>;
> >                         enable-method = "psci";
> >                         next-level-cache = <&L2_0>;
> > +                       cpu-idle-states = <&CPU_PC>;
> >                 };
> >
> >                 L2_0: l2-cache {
> >                         compatible = "cache";
> >                         cache-level = <2>;
> >                 };
> > +
> > +               idle-states {
> 
> entry-method="psci" property goes here. I have a patch fixing it for 410c ;-)
> 
> I don't think the psci_cpuidle_ops will even get called without this.

Hello Amit,

I added debug prints in psci_cpu_suspend_enter() and arm_cpuidle_suspend()
when verifying this patch, and psci_cpu_suspend_enter() is indeed called,
with the correct psci suspend parameter.

The output from:
grep "" /sys/bus/cpu/devices/cpu0/cpuidle/state?/*
also looks sane.

However, if 'entry-method="psci"' is required according to the DT binding,
perhaps you can send a 2/2 series that fixes both this patch and msm8916 ?

> Did you see any changes in consumption with this patch? I was trying
> to measure that before sending this out.

I don't know of any way to measure the power consumption on this board,
so no, I haven't been able to verify that the firmware actually does
the right thing here.


Kind regards,
Niklas

> 
> > +                       CPU_PC: pc {
> > +                               compatible = "arm,idle-state";
> > +                               arm,psci-suspend-param = <0x40000003>;
> > +                               entry-latency-us = <125>;
> > +                               exit-latency-us = <180>;
> > +                               min-residency-us = <595>;
> > +                               local-timer-stop;
> > +                       };
> > +               };
> >         };
> >
> >         firmware {
> > --
> > 2.21.0
> >
