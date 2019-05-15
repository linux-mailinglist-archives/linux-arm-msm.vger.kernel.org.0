Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBB21F4F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2019 15:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfEONDD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 09:03:03 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33181 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfEONDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 09:03:03 -0400
Received: by mail-lj1-f194.google.com with SMTP id w1so2465611ljw.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2019 06:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5EfvjTphEiWxfZkH/SJILym7SxsbhbZY/PCb8VawuUg=;
        b=ayeka6UTHhnGsyqjF/S0VQygqFcDtLsdyoMY05IN04kMYtr3VGUF7yySk0v64kDxw2
         F+MmrRhH0WdMFtjh/xHhQYCxTnt03vC32ioECsuFXa3a288soB46gSic3vYe+ahXulrj
         pZxPJtnbXkpg8j6gw1DCzZTAegenaUjP1XKOQ7QworNc8LK6HOnIb0C7Mtc843clREw6
         Rehe7xaqhUDjyDAtJramsatSwzA8WKy1nE0gwSPPn/vB59pUjDTpnBzdP863YGr3Qze1
         tdKlcUfA7oEYORa5+vRRbn48hsZ2eUPCAvzRCXoBUDaTQjet9BvbxFxRrbxXNqnqtUOE
         mhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5EfvjTphEiWxfZkH/SJILym7SxsbhbZY/PCb8VawuUg=;
        b=K0cnIhJL4K9T/+W96sf5H81g03JuikJKz8gZ5Lf8Uckl46tG2YhubiJQ+KpfXxeEFC
         I++CRh9DjsCxhP6I/evAmjFMwlbe5ApEAIe8JLqSmuViCIytUWCyO2cg0j6cxdk8h7H8
         cEHBWzY47JWFP5KurSVAUi95Jgqc4KmTJ7UXBA8OfMlmKuh6XnS8MVvMcANjZhTLoS/b
         7NE+cu73GipR+n+HpB0BfD6P8Cb/gEJuxUARCrnw4VHOCeHJ+BUgu7DcNaWnd03xpNBK
         zYQe+dsVyLhadHMx5Rl5i0lukUXy5ss9++ATWEl68s5E+LJUGP7ZprF9LeRs+CbIjvdA
         xTdg==
X-Gm-Message-State: APjAAAU4pazEURsNKyXTba8bA90BkE38aXz3DNNMRs4dPmsONstIeqU0
        20wC1CRojpB8rfQSFKK2lEJJ2Q==
X-Google-Smtp-Source: APXvYqwFzZ8mYcYbxGTpyfsT4epedCPOJ5kwTzY4bpkxtWnhik0432wibEAWxrwHTUyU/3539mcM7Q==
X-Received: by 2002:a2e:309:: with SMTP id 9mr21863831ljd.114.1557925380569;
        Wed, 15 May 2019 06:03:00 -0700 (PDT)
Received: from centauri (m83-185-80-163.cust.tele2.se. [83.185.80.163])
        by smtp.gmail.com with ESMTPSA id j6sm387581ljc.0.2019.05.15.06.02.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 15 May 2019 06:02:59 -0700 (PDT)
Date:   Wed, 15 May 2019 15:02:56 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        DTML <devicetree@vger.kernel.org>
Subject: Re: [PATCHv1 4/8] arm64: dts: qcom: msm8916: Use more generic idle
 state names
Message-ID: <20190515130256.GA27174@centauri>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <2a0626da4d8d5a1018c351b24b63e5e0d7a45a10.1557486950.git.amit.kucheria@linaro.org>
 <20190514161220.GC1824@centauri.ideon.se>
 <CAP245DWgfQakjXSTU2AfhkLOjAue83A-X6Qb40DC1QQj01GogQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP245DWgfQakjXSTU2AfhkLOjAue83A-X6Qb40DC1QQj01GogQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 15, 2019 at 03:43:19PM +0530, Amit Kucheria wrote:
> On Tue, May 14, 2019 at 9:42 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
> >
> > On Fri, May 10, 2019 at 04:59:42PM +0530, Amit Kucheria wrote:
> > > Instead of using Qualcomm-specific terminology, use generic node names
> > > for the idle states that are easier to understand. Move the description
> > > into the "idle-state-name" property.
> > >
> > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 11 ++++++-----
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > index ded1052e5693..400b609bb3fd 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > @@ -110,7 +110,7 @@
> > >                       reg = <0x0>;
> > >                       next-level-cache = <&L2_0>;
> > >                       enable-method = "psci";
> > > -                     cpu-idle-states = <&CPU_SPC>;
> > > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> > >                       clocks = <&apcs>;
> > >                       operating-points-v2 = <&cpu_opp_table>;
> > >                       #cooling-cells = <2>;
> > > @@ -122,7 +122,7 @@
> > >                       reg = <0x1>;
> > >                       next-level-cache = <&L2_0>;
> > >                       enable-method = "psci";
> > > -                     cpu-idle-states = <&CPU_SPC>;
> > > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> > >                       clocks = <&apcs>;
> > >                       operating-points-v2 = <&cpu_opp_table>;
> > >                       #cooling-cells = <2>;
> > > @@ -134,7 +134,7 @@
> > >                       reg = <0x2>;
> > >                       next-level-cache = <&L2_0>;
> > >                       enable-method = "psci";
> > > -                     cpu-idle-states = <&CPU_SPC>;
> > > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> > >                       clocks = <&apcs>;
> > >                       operating-points-v2 = <&cpu_opp_table>;
> > >                       #cooling-cells = <2>;
> > > @@ -146,7 +146,7 @@
> > >                       reg = <0x3>;
> > >                       next-level-cache = <&L2_0>;
> > >                       enable-method = "psci";
> > > -                     cpu-idle-states = <&CPU_SPC>;
> > > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> > >                       clocks = <&apcs>;
> > >                       operating-points-v2 = <&cpu_opp_table>;
> > >                       #cooling-cells = <2>;
> > > @@ -160,8 +160,9 @@
> > >               idle-states {
> > >                       entry-method="psci";
> >
> > Please add a space before and after "=".
> >
> > >
> > > -                     CPU_SPC: spc {
> > > +                     CPU_SLEEP_0: cpu-sleep-0 {
> >
> > While I like your idea of using power state names from
> > Server Base System Architecture document (SBSA) where applicable,
> > does each qcom power state have a matching state in SBSA?
> >
> > These are the qcom power states:
> > https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/Documentation/devicetree/bindings/arm/msm/lpm-levels.txt?h=msm-4.4#n53
> >
> > Note that qcom defines:
> > "wfi", "retention", "gdhs", "pc", "fpc"
> > while SBSA simply defines "idle_standby" (aka wfi), "idle_retention", "sleep".
> >
> > Unless you know the equivalent name for each qcom power state
> > (perhaps several qcom power states are really the same SBSA state?),
> > I think that you should omit the renaming from this patch series.
> 
> That is what SLEEP_0, SLEEP_1, SLEEP_2 could be used for.

Ok, sounds good to me.

> 
> IOW, all these qcom definitions are nicely represented in the
> state-name and we could simply stick to SLEEP_0, SLEEP_1 for the node
> names. There is wide variability in the the names of the qcom idle
> states across SoC families downstream, so I'd argue against using
> those for the node names.
> 
> Just for cpu states (non-wfi) I see the use of the following names
> downstream across families. The C<num> seems to come from x86
> world[1]:
> 
>  - C4,   standalone power collapse (spc)
>  - C4,   power collapse (fpc)
>  - C2D, retention
>  - C3,   power collapse (pc)
>  - C4,   rail power collapse (rail-pc)
> 
> [1] https://www.hardwaresecrets.com/everything-you-need-to-know-about-the-cpu-c-states-power-saving-modes/

Indeed, there seems to be mixed names used, I've also seen "fpc-def".

So, you have convinced me.


Kind regards,
Niklas

> 
> > >                               compatible = "arm,idle-state";
> > > +                             idle-state-name = "standalone-power-collapse";
> > >                               arm,psci-suspend-param = <0x40000002>;
> > >                               entry-latency-us = <130>;
> > >                               exit-latency-us = <150>;
> > > --
> > > 2.17.1
> > >
