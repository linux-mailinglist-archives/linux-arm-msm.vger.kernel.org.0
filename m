Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3E7C3706
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 16:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389017AbfJAOWH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 10:22:07 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45154 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388994AbfJAOWG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 10:22:06 -0400
Received: by mail-io1-f68.google.com with SMTP id c25so48295734iot.12;
        Tue, 01 Oct 2019 07:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lvgQDu9WXpCvWJp0oOMglHPGYf9ZHsEL9W0aSNo7TEo=;
        b=rxOxoRq3U+cKt4FFrG3NOwdes/J/KJuRWeS4BdORHW6mtwrPawK8KLTLauQbZM4VA1
         7IvT3qOuIk0KTwjD3YHkA1627hH68DWiJafqoEcdyK6s8RGWkjQj+d8a8zHCvo3RjN/I
         JovOl9GOOMIQ4gbhJoqCNYV9ozPUrnxDbks32/xpZf95ydCWElw8/eIqFXG0+rb9YrQG
         Ax4vlOF9Ljt5nS6qOY0DCFAvTOpYT5RXETaWgOJDHD1KfbxUEFwPVphoEUR5pH08Hj0F
         f1depZObQeep5qvRPKRtaSwB9z/vi1+5e4STyz2OaK2F64zF7+Cm3vvD4O2noEeaZ8hY
         WOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lvgQDu9WXpCvWJp0oOMglHPGYf9ZHsEL9W0aSNo7TEo=;
        b=ARNcCa3E9FFlfmRxW7FxRSLveIJkMBWoJ3R3+SSvb5JBepzq7+Mv+WUubZhuAFgQ8S
         1gPn9ndGT5oFWm1+FmNAJXwvVKtaKCwKPAmir7JUwHIuT9FGt3OBU4G620owqmsP6/pu
         /y/VX8NXX+pg9X+gg1qXa7oaCAJCwOA8l/x7n9ChPhk94cv/Z1rPdPegVzPCKstNhs/K
         wmHzJ6kCplS48+i+BrGLPTT0j0P1MzzHbvD3Xxb/POl7Pt6JNBt4vaVkcmbxOLFhrFNU
         h/YFUyLTi1gwLlJkYvepo4cFnSk1zeftzn1a7k6bZ2DpGXS3B6z+GvxxiuX/3xxuAr1C
         d84A==
X-Gm-Message-State: APjAAAVCM4eranipohU0O30/QVsTBlfC9hNMWB2cN86L0b6fcG1T90ai
        mMsbd89z8EbxY3N1ZylyuOOcHRy3w39ppV/uBFY=
X-Google-Smtp-Source: APXvYqzj3Dxc1vunf9zG16glLNgfbvBzc1tu6VphnQxFvrhVNxB+wbIjd5c7ptmWW4q03c4MTmTyqqAz/VzFpTwOuJY=
X-Received: by 2002:a92:b752:: with SMTP id c18mr26696367ilm.42.1569939725259;
 Tue, 01 Oct 2019 07:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <49cf5d94beb9af9ef4e78d4c52f3b0ad20b7c63f.1558430617.git.amit.kucheria@linaro.org>
 <CAOCk7NptTHPOdyEkCAofjTPuDQ5dsnPMQgfC0R8=7cp05xKQiA@mail.gmail.com> <CAHLCerOS1Hi3XdDZzTKFKnrsATj5cMKtjPEuJknWu-aPtwzP9g@mail.gmail.com>
In-Reply-To: <CAHLCerOS1Hi3XdDZzTKFKnrsATj5cMKtjPEuJknWu-aPtwzP9g@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 1 Oct 2019 08:21:54 -0600
Message-ID: <CAOCk7NpA5OmgmH0PZpcrj1KmhdrTKvOb+3eUL6=Mo8HRUnKjdA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low
 power states
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Sibi Sankar <sibis@codeaurora.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 30, 2019 at 4:44 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
> Can you try removing just the *SLEEP_1 states from the cpu-idle-states
> property? I want to understand if this is triggered just by the deeper
> C-state.

Still seeing the issue with just the SLEEP_0 states.  For reference,
Bjorn suggested adding kpti=no to the command line, which also
appeared to have no effect on the issue.

>
> On Tue, Oct 1, 2019 at 3:50 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > Amit, the merged version of the below change causes a boot failure
> > (nasty hang, sometimes with RCU stalls) on the msm8998 laptops.  Oddly
> > enough, it seems to be resolved if I remove the cpu-idle-states
> > property from one of the cpu nodes.
> >
> > I see no issues with the msm8998 MTP.
> >
> > Do you have any suggestions on how we might debug this?
> >
> > On Tue, May 21, 2019 at 3:38 AM Amit Kucheria <amit.kucheria@linaro.org> wrote:
> > >
> > > Add device bindings for cpuidle states for cpu devices.
> > >
> > > Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/msm8998.dtsi | 50 +++++++++++++++++++++++++++
> > >  1 file changed, 50 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > > index 3fd0769fe648..54810980fcf9 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > > @@ -78,6 +78,7 @@
> > >                         compatible = "arm,armv8";
> > >                         reg = <0x0 0x0>;
> > >                         enable-method = "psci";
> > > +                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
> > >                         efficiency = <1024>;
> > >                         next-level-cache = <&L2_0>;
> > >                         L2_0: l2-cache {
> > > @@ -97,6 +98,7 @@
> > >                         compatible = "arm,armv8";
> > >                         reg = <0x0 0x1>;
> > >                         enable-method = "psci";
> > > +                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
> > >                         efficiency = <1024>;
> > >                         next-level-cache = <&L2_0>;
> > >                         L1_I_1: l1-icache {
> > > @@ -112,6 +114,7 @@
> > >                         compatible = "arm,armv8";
> > >                         reg = <0x0 0x2>;
> > >                         enable-method = "psci";
> > > +                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
> > >                         efficiency = <1024>;
> > >                         next-level-cache = <&L2_0>;
> > >                         L1_I_2: l1-icache {
> > > @@ -127,6 +130,7 @@
> > >                         compatible = "arm,armv8";
> > >                         reg = <0x0 0x3>;
> > >                         enable-method = "psci";
> > > +                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
> > >                         efficiency = <1024>;
> > >                         next-level-cache = <&L2_0>;
> > >                         L1_I_3: l1-icache {
> > > @@ -142,6 +146,7 @@
> > >                         compatible = "arm,armv8";
> > >                         reg = <0x0 0x100>;
> > >                         enable-method = "psci";
> > > +                       cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
> > >                         efficiency = <1536>;
> > >                         next-level-cache = <&L2_1>;
> > >                         L2_1: l2-cache {
> > > @@ -161,6 +166,7 @@
> > >                         compatible = "arm,armv8";
> > >                         reg = <0x0 0x101>;
> > >                         enable-method = "psci";
> > > +                       cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
> > >                         efficiency = <1536>;
> > >                         next-level-cache = <&L2_1>;
> > >                         L1_I_101: l1-icache {
> > > @@ -176,6 +182,7 @@
> > >                         compatible = "arm,armv8";
> > >                         reg = <0x0 0x102>;
> > >                         enable-method = "psci";
> > > +                       cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
> > >                         efficiency = <1536>;
> > >                         next-level-cache = <&L2_1>;
> > >                         L1_I_102: l1-icache {
> > > @@ -191,6 +198,7 @@
> > >                         compatible = "arm,armv8";
> > >                         reg = <0x0 0x103>;
> > >                         enable-method = "psci";
> > > +                       cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
> > >                         efficiency = <1536>;
> > >                         next-level-cache = <&L2_1>;
> > >                         L1_I_103: l1-icache {
> > > @@ -238,6 +246,48 @@
> > >                                 };
> > >                         };
> > >                 };
> > > +
> > > +               idle-states {
> > > +                       entry-method = "psci";
> > > +
> > > +                       LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
> > > +                               compatible = "arm,idle-state";
> > > +                               idle-state-name = "little-retention";
> > > +                               arm,psci-suspend-param = <0x00000002>;
> > > +                               entry-latency-us = <43>;
> > > +                               exit-latency-us = <86>;
> > > +                               min-residency-us = <200>;
> > > +                       };
> > > +
> > > +                       LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
> > > +                               compatible = "arm,idle-state";
> > > +                               idle-state-name = "little-power-collapse";
> > > +                               arm,psci-suspend-param = <0x00000003>;
> > > +                               entry-latency-us = <100>;
> > > +                               exit-latency-us = <612>;
> > > +                               min-residency-us = <1000>;
> > > +                               local-timer-stop;
> > > +                       };
> > > +
> > > +                       BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
> > > +                               compatible = "arm,idle-state";
> > > +                               idle-state-name = "big-retention";
> > > +                               arm,psci-suspend-param = <0x00000002>;
> > > +                               entry-latency-us = <41>;
> > > +                               exit-latency-us = <82>;
> > > +                               min-residency-us = <200>;
> > > +                       };
> > > +
> > > +                       BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
> > > +                               compatible = "arm,idle-state";
> > > +                               idle-state-name = "big-power-collapse";
> > > +                               arm,psci-suspend-param = <0x00000003>;
> > > +                               entry-latency-us = <100>;
> > > +                               exit-latency-us = <525>;
> > > +                               min-residency-us = <1000>;
> > > +                               local-timer-stop;
> > > +                       };
> > > +               };
> > >         };
> > >
> > >         firmware {
> > > --
> > > 2.17.1
> > >
