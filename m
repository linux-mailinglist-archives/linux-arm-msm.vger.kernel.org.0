Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9AB24794
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 07:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfEUFiW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 01:38:22 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:35140 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbfEUFiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 01:38:22 -0400
Received: by mail-qk1-f195.google.com with SMTP id c15so10338714qkl.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 22:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ylhlFxOQtj3eEV5EznbPBmp2z9RTytA2Ra4QbX683aw=;
        b=pACzS81CvGQTJCH9GhT/KUwRkEs1crnUg5F/m5oHZdu+OBy/9veH3hy2qondpMgaRM
         A8OAdTYheYg9WhJJwfvIruNfnheKSd+itzj3fHkh6/7roccoq6+C25TAmXwuAWL8eAl0
         ZGp9vk0FTqJT/JJbUG41jOtCBveAN9j0KNZZwiCgKiBlc2gRXKz/ZY0sPe88TC8yZt+v
         FWyzjDJuh6ulHzXzoWW3B1POzRB6emNPfMhy9BMveRQppKHPxluyIq84k/lCdLmyRggm
         RCkJNg3KtMX3weSI+tMNEDxiv+w3gK2nxSMlT03vGtNJX3sQMHPcika4qR4BHQ1n44Cu
         Fk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ylhlFxOQtj3eEV5EznbPBmp2z9RTytA2Ra4QbX683aw=;
        b=R4Kny+8sRVGWh9Kuo0/K/GIVkCf36I0qoL/3bwSRbdfPvGkGvtZAXmwjHuByfficsL
         yUPWw+nZowyt+8BFclYYRhH5h3y5+vHp5XJGjxmSIJ5I9f1M+CA2/axnTI7Tyk4SO+kS
         j50QiSqgMLHis+QkTU3Dzg43r6Iz3AtxFKutkVg/bBhlxOiJ4q0nzBaOO64Jxkm1xUTq
         OLdUz4w+gsbpiM6TeqpBP+U1fflNBhIwTohqa193fXDNbWPcdUeBHXUeC6lYCxbmiyEG
         QPhGMxMfJdNpksCym7bqJhHOB3fipEX+ZWKEtTYvhZGQamU3iU4YJ4hwbd3CFw0RUO8X
         pYgg==
X-Gm-Message-State: APjAAAV/874HusCY/fcV97jkheSpxnWXGAX3Ldes6j4ng/SvN5gTeP8N
        Abnch/KoVdlGGRkpvR0n7yVl9P/r1eHba6NpkoCJmQ==
X-Google-Smtp-Source: APXvYqwhLJkCq5Uyj5G0PBRyyWoG2hNCCMuCxvP8Exzk4c7voHBZjs/UCFuIQ1U7I+Ph2naAnq98GeHD2EZF/qEf93w=
X-Received: by 2002:a37:8703:: with SMTP id j3mr2373239qkd.188.1558417100902;
 Mon, 20 May 2019 22:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <2a0626da4d8d5a1018c351b24b63e5e0d7a45a10.1557486950.git.amit.kucheria@linaro.org>
 <20190514161220.GC1824@centauri.ideon.se> <CAP245DWgfQakjXSTU2AfhkLOjAue83A-X6Qb40DC1QQj01GogQ@mail.gmail.com>
 <20190515130256.GA27174@centauri>
In-Reply-To: <20190515130256.GA27174@centauri>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 21 May 2019 11:08:09 +0530
Message-ID: <CAP245DX+w3mPAQ5uJnkMkir9TSEH39qm7-gtS4N_O0SpOEZVkQ@mail.gmail.com>
Subject: Re: [PATCHv1 4/8] arm64: dts: qcom: msm8916: Use more generic idle
 state names
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 15, 2019 at 6:33 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
>
> On Wed, May 15, 2019 at 03:43:19PM +0530, Amit Kucheria wrote:
> > On Tue, May 14, 2019 at 9:42 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
> > >
> > > On Fri, May 10, 2019 at 04:59:42PM +0530, Amit Kucheria wrote:
> > > > Instead of using Qualcomm-specific terminology, use generic node names
> > > > for the idle states that are easier to understand. Move the description
> > > > into the "idle-state-name" property.
> > > >
> > > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 11 ++++++-----
> > > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > > index ded1052e5693..400b609bb3fd 100644
> > > > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > > @@ -110,7 +110,7 @@
> > > >                       reg = <0x0>;
> > > >                       next-level-cache = <&L2_0>;
> > > >                       enable-method = "psci";
> > > > -                     cpu-idle-states = <&CPU_SPC>;
> > > > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> > > >                       clocks = <&apcs>;
> > > >                       operating-points-v2 = <&cpu_opp_table>;
> > > >                       #cooling-cells = <2>;
> > > > @@ -122,7 +122,7 @@
> > > >                       reg = <0x1>;
> > > >                       next-level-cache = <&L2_0>;
> > > >                       enable-method = "psci";
> > > > -                     cpu-idle-states = <&CPU_SPC>;
> > > > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> > > >                       clocks = <&apcs>;
> > > >                       operating-points-v2 = <&cpu_opp_table>;
> > > >                       #cooling-cells = <2>;
> > > > @@ -134,7 +134,7 @@
> > > >                       reg = <0x2>;
> > > >                       next-level-cache = <&L2_0>;
> > > >                       enable-method = "psci";
> > > > -                     cpu-idle-states = <&CPU_SPC>;
> > > > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> > > >                       clocks = <&apcs>;
> > > >                       operating-points-v2 = <&cpu_opp_table>;
> > > >                       #cooling-cells = <2>;
> > > > @@ -146,7 +146,7 @@
> > > >                       reg = <0x3>;
> > > >                       next-level-cache = <&L2_0>;
> > > >                       enable-method = "psci";
> > > > -                     cpu-idle-states = <&CPU_SPC>;
> > > > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> > > >                       clocks = <&apcs>;
> > > >                       operating-points-v2 = <&cpu_opp_table>;
> > > >                       #cooling-cells = <2>;
> > > > @@ -160,8 +160,9 @@
> > > >               idle-states {
> > > >                       entry-method="psci";
> > >
> > > Please add a space before and after "=".
> > >
> > > >
> > > > -                     CPU_SPC: spc {
> > > > +                     CPU_SLEEP_0: cpu-sleep-0 {
> > >
> > > While I like your idea of using power state names from
> > > Server Base System Architecture document (SBSA) where applicable,
> > > does each qcom power state have a matching state in SBSA?
> > >
> > > These are the qcom power states:
> > > https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/Documentation/devicetree/bindings/arm/msm/lpm-levels.txt?h=msm-4.4#n53
> > >
> > > Note that qcom defines:
> > > "wfi", "retention", "gdhs", "pc", "fpc"
> > > while SBSA simply defines "idle_standby" (aka wfi), "idle_retention", "sleep".
> > >
> > > Unless you know the equivalent name for each qcom power state
> > > (perhaps several qcom power states are really the same SBSA state?),
> > > I think that you should omit the renaming from this patch series.
> >
> > That is what SLEEP_0, SLEEP_1, SLEEP_2 could be used for.
>
> Ok, sounds good to me.
>
> >
> > IOW, all these qcom definitions are nicely represented in the
> > state-name and we could simply stick to SLEEP_0, SLEEP_1 for the node
> > names. There is wide variability in the the names of the qcom idle
> > states across SoC families downstream, so I'd argue against using
> > those for the node names.
> >
> > Just for cpu states (non-wfi) I see the use of the following names
> > downstream across families. The C<num> seems to come from x86
> > world[1]:
> >
> >  - C4,   standalone power collapse (spc)
> >  - C4,   power collapse (fpc)
> >  - C2D, retention
> >  - C3,   power collapse (pc)
> >  - C4,   rail power collapse (rail-pc)
> >
> > [1] https://www.hardwaresecrets.com/everything-you-need-to-know-about-the-cpu-c-states-power-saving-modes/
>
> Indeed, there seems to be mixed names used, I've also seen "fpc-def".
>
> So, you have convinced me.
>
>
> Kind regards,
> Niklas

Can I take that as a Reviewed-by?
