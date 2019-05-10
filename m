Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB2019EC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 16:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbfEJONA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 10:13:00 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:37536 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727758AbfEJONA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 10:13:00 -0400
Received: by mail-qk1-f194.google.com with SMTP id c1so2404659qkk.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2019 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Oc+HOjNDQ7ZjdNxPUZBvb85a2F3DpskyEuAF4ob+cf0=;
        b=hXfOvlq1JUHYhRQN/Ecd6q0zC9XIBX61zsDh4XQdCD1zQW1hPj/PmsBI1uZaFd1hua
         HyikYujCWvHzujSK9TUo7erUKIbg+TcbT4C1ME7V3DcZmZmsLNfCqnNwWQCZT3/piURz
         BjcK8xDlY6we/9H/6O11CQvtXeodO10bkJAZBLljlda8dyXKkd+GFVMl437QHNa1+whW
         ayDJNGtMe8+v0bDP1lK5OTlIEA4ZTBR8NuerSXE6G+JfM45GsUVMJm6IHn0WevIw0s8Q
         4lJCgH8aBbCvlje7zjfrPYon2n35yILcwaOD2wDBxULpMTkYisUSyBAG86VbqJ5YCzgd
         cwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Oc+HOjNDQ7ZjdNxPUZBvb85a2F3DpskyEuAF4ob+cf0=;
        b=QSNxLGj0r7czO8LfX2DAh5b9/DC4KVNdpCcpQtChFb6ylQgZqtfa/GbkWDkybJUyd1
         1li3FdlwbgDxD1DHIHmN93MB+S57G/CIWPS6qOUuZkEmOBICzzDui7D5efNuPBBDVv+p
         CCERQD9TTOrExciKHLS/rt5UaSt0nXY2T2v8uf5et72up+jjUBhxZIoyTFmBteLyYnn7
         kh19c2JToSAXc6vy0fInzeGvm9L0V7LoLgD9BRe6e/83XgSpkFK5VbWwawU2pLIjGY3p
         x2PBtmAcrcBvqESI013ERSsdRVWn/BteBCC4o6YHgqh0BtVp1nZfDNkYYLHhnXIxHAhx
         n3VQ==
X-Gm-Message-State: APjAAAWVoODza0MhOqPrfXusY1JU4LGiJlKZ3eN6uLm0GrozgJHMIs3s
        Rrtil+eztzClN1/bWZX2BQMoLkpnL2/SDO5CZRQliQ==
X-Google-Smtp-Source: APXvYqxObyuwfh5p481QM2OYq3veOhpwYH8bBAQxOrz4FO1Oxji5/awAiK377X9YEKdfToc/V6XqP4PX5sLCPZ6tIyU=
X-Received: by 2002:a37:9606:: with SMTP id y6mr8611016qkd.352.1557497578809;
 Fri, 10 May 2019 07:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <0afe77d25490b10250f9eac4b4e92ccac8c42718.1557486950.git.amit.kucheria@linaro.org>
 <3de9c573-5971-15fc-1632-706fc30e90c2@free.fr>
In-Reply-To: <3de9c573-5971-15fc-1632-706fc30e90c2@free.fr>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Fri, 10 May 2019 19:42:47 +0530
Message-ID: <CAP245DU7=h=t1_QoM9nMGE-Amduuh+GPQBnmEEG+NGDdXCiR=g@mail.gmail.com>
Subject: Re: [PATCHv1 7/8] arm64: dts: qcom: msm8998: Add PSCI cpuidle low
 power states
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 10, 2019 at 6:45 PM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> On 10/05/2019 13:29, Amit Kucheria wrote:
>
> > Add device bindings for cpuidle states for cpu devices.
> >
> > Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8998.dtsi | 32 +++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > index 3fd0769fe648..208281f318e2 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > @@ -78,6 +78,7 @@
> >                       compatible = "arm,armv8";
> >                       reg = <0x0 0x0>;
> >                       enable-method = "psci";
> > +                     cpu-idle-states = <&LITTLE_CPU_PD>;
>
> For some reason, I was expecting the big cores to come first, but according
> to /proc/cpuinfo, cores 0-3 are part 0x801, while cores 4-7 are part 0x800.
>
> According to https://github.com/pytorch/cpuinfo/blob/master/src/arm/uarch.c
>
> 0x801 = Low-power Kryo 260 / 280 "Silver" -> Cortex-A53
> 0x800 = High-performance Kryo 260 (r10p2) / Kryo 280 (r10p1) "Gold" -> Cortex-A73

Hmm, did I mess up the order of the big and LITTLE cores? I'll take a
look again.

> >                       efficiency = <1024>;
> >                       next-level-cache = <&L2_0>;
> >                       L2_0: l2-cache {
> > @@ -97,6 +98,7 @@
> >                       compatible = "arm,armv8";
> >                       reg = <0x0 0x1>;
> >                       enable-method = "psci";
> > +                     cpu-idle-states = <&LITTLE_CPU_PD>;
> >                       efficiency = <1024>;
> >                       next-level-cache = <&L2_0>;
> >                       L1_I_1: l1-icache {
> > @@ -112,6 +114,7 @@
> >                       compatible = "arm,armv8";
> >                       reg = <0x0 0x2>;
> >                       enable-method = "psci";
> > +                     cpu-idle-states = <&LITTLE_CPU_PD>;
> >                       efficiency = <1024>;
> >                       next-level-cache = <&L2_0>;
> >                       L1_I_2: l1-icache {
> > @@ -127,6 +130,7 @@
> >                       compatible = "arm,armv8";
> >                       reg = <0x0 0x3>;
> >                       enable-method = "psci";
> > +                     cpu-idle-states = <&LITTLE_CPU_PD>;
> >                       efficiency = <1024>;
> >                       next-level-cache = <&L2_0>;
> >                       L1_I_3: l1-icache {
> > @@ -142,6 +146,7 @@
> >                       compatible = "arm,armv8";
> >                       reg = <0x0 0x100>;
> >                       enable-method = "psci";
> > +                     cpu-idle-states = <&BIG_CPU_PD>;
> >                       efficiency = <1536>;
> >                       next-level-cache = <&L2_1>;
> >                       L2_1: l2-cache {
> > @@ -161,6 +166,7 @@
> >                       compatible = "arm,armv8";
> >                       reg = <0x0 0x101>;
> >                       enable-method = "psci";
> > +                     cpu-idle-states = <&BIG_CPU_PD>;
> >                       efficiency = <1536>;
> >                       next-level-cache = <&L2_1>;
> >                       L1_I_101: l1-icache {
> > @@ -176,6 +182,7 @@
> >                       compatible = "arm,armv8";
> >                       reg = <0x0 0x102>;
> >                       enable-method = "psci";
> > +                     cpu-idle-states = <&BIG_CPU_PD>;
> >                       efficiency = <1536>;
> >                       next-level-cache = <&L2_1>;
> >                       L1_I_102: l1-icache {
> > @@ -191,6 +198,7 @@
> >                       compatible = "arm,armv8";
> >                       reg = <0x0 0x103>;
> >                       enable-method = "psci";
> > +                     cpu-idle-states = <&BIG_CPU_PD>;
> >                       efficiency = <1536>;
> >                       next-level-cache = <&L2_1>;
> >                       L1_I_103: l1-icache {
> > @@ -238,6 +246,30 @@
> >                               };
> >                       };
> >               };
> > +
> > +             idle-states {
> > +                     entry-method="psci";
> > +
> > +                     LITTLE_CPU_PD: little-power-down {
> > +                             compatible = "arm,idle-state";
> > +                             idle-state-name = "little-power-down";
> > +                             arm,psci-suspend-param = <0x00000002>;
> > +                             entry-latency-us = <43>;
> > +                             exit-latency-us = <43>;
>
> Little cores have higher latency (+5%) than big cores?
>
> > +                             min-residency-us = <200>;
> > +                             local-timer-stop;
> > +                     };
> > +
> > +                     BIG_CPU_PD: big-power-down {
> > +                             compatible = "arm,idle-state";
> > +                             idle-state-name = "big-power-down";
> > +                             arm,psci-suspend-param = <0x00000002>;
> > +                             entry-latency-us = <41>;
> > +                             exit-latency-us = <41>;
> > +                             min-residency-us = <200>;
> > +                             local-timer-stop;
> > +                     };
> > +             };
>
> What is the simplest way to test this patch?

You should be able to see state transitions in /sys/devices/cpu/cpu?/cpuidle/*/*

$ grep "" /sys/devices/cpu/cpu?/cpuidle/*/*

And if you have an instrumented board with power rails exposed, you
could measure the cpu rails with and without some load on the CPUs.
That'd help us tune the values too, in the future.

Regards,
Amit
