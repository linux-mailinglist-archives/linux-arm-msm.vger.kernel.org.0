Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46CDC24AC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 10:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbfEUIux (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 04:50:53 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33229 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbfEUIuw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 04:50:52 -0400
Received: by mail-lj1-f195.google.com with SMTP id w1so15148598ljw.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 01:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EXuZkAoJAIgKITpqT/ed3jeYtW/LzF2mHQoWIrpAi0Q=;
        b=rEyrvCTG0oCL2S5dWHGMbVpYr6RF1pPm7ehHUq5G3IRISyVIB+nZ9J9X8B3J4YvCIh
         8989FJPW2KJHwWh1nlh4W9y1Yd82aBSQ2W7cdnrZ0gq42yw4OxgKrAely0YzuTTuRlke
         SJd/TstoYadCDRj8WUr5QQALI5i0anAkzbnVgVGgwL9Bn+xyrhtR6Zmx+Oo2IcuArRAr
         aKyq5289MtzoyvDbUdlCEKgiczDs0BFBYe6u/nk+1ieTmiEpGyNLAsjhYIK9iw7hPfVg
         BWKRHurtFD9OTwUE1ZOmn8ndbdBNQEwxk/pZoClRpTe9wYSjMYkiKSK8iLsoFp5GuzzZ
         Totw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EXuZkAoJAIgKITpqT/ed3jeYtW/LzF2mHQoWIrpAi0Q=;
        b=dk1gKYB3dI5UcUihKUNz3CiDddGcQgnaltbYEYr+PC8ng1h/1w8np/00BHm4otsMGf
         vqefRNEOr8dfRIB6TuVuFfvHTXZHjo6m3KUx9TVwCMi07k9GzkfAtq5RYQwDk/rPTtsZ
         0VGcgTcsulXz69Etr39upAvpjTDW1IrY1dV9pWhl5/r20m/Jr91pjakfmEvwKH6Ko7Nf
         belzjZNVItOtY9zsOHagTzMgmr3IpzJoMVeBjIJHgGVVQJlW6z0Z76Wj1uJhYpwpslZd
         RkjH+r57ANhmopFymj/LjvyXW96BAb3B7t1UKkN3nEEksCyrzuYz9J9C+VKtsrH1q2y1
         jlzg==
X-Gm-Message-State: APjAAAWcrRFobu0EhJQlfHPEYa8lcx6kCX7Bf/OcCrsTmAOPR9VKNe7M
        NtgOo7iWep9+fBGaB1qa1Tr59w==
X-Google-Smtp-Source: APXvYqySLGoaqi4d5AmtXg7Be/qVUVt2CEjTCxyfwpqOpZ0ct9cLmmnACgNFzZZp0Tjc3rIX2mS+5A==
X-Received: by 2002:a2e:964a:: with SMTP id z10mr5529450ljh.22.1558428650168;
        Tue, 21 May 2019 01:50:50 -0700 (PDT)
Received: from centauri (m83-185-80-163.cust.tele2.se. [83.185.80.163])
        by smtp.gmail.com with ESMTPSA id q21sm4640044lfa.84.2019.05.21.01.50.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 21 May 2019 01:50:49 -0700 (PDT)
Date:   Tue, 21 May 2019 10:50:47 +0200
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
Message-ID: <20190521085047.GA22910@centauri>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <2a0626da4d8d5a1018c351b24b63e5e0d7a45a10.1557486950.git.amit.kucheria@linaro.org>
 <20190514161220.GC1824@centauri.ideon.se>
 <CAP245DWgfQakjXSTU2AfhkLOjAue83A-X6Qb40DC1QQj01GogQ@mail.gmail.com>
 <20190515130256.GA27174@centauri>
 <CAP245DX+w3mPAQ5uJnkMkir9TSEH39qm7-gtS4N_O0SpOEZVkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP245DX+w3mPAQ5uJnkMkir9TSEH39qm7-gtS4N_O0SpOEZVkQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 21, 2019 at 11:08:09AM +0530, Amit Kucheria wrote:
> On Wed, May 15, 2019 at 6:33 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
> >
> > On Wed, May 15, 2019 at 03:43:19PM +0530, Amit Kucheria wrote:
> > > On Tue, May 14, 2019 at 9:42 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
> > > >
> > > > On Fri, May 10, 2019 at 04:59:42PM +0530, Amit Kucheria wrote:
> > > > > Instead of using Qualcomm-specific terminology, use generic node names
> > > > > for the idle states that are easier to understand. Move the description
> > > > > into the "idle-state-name" property.
> > > > >
> > > > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 11 ++++++-----
> > > > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > > > index ded1052e5693..400b609bb3fd 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > > > @@ -110,7 +110,7 @@
> > > > >                       reg = <0x0>;
> > > > >                       next-level-cache = <&L2_0>;
> > > > >                       enable-method = "psci";
> > > > > -                     cpu-idle-states = <&CPU_SPC>;
> > > > > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> > > > >                       clocks = <&apcs>;
> > > > >                       operating-points-v2 = <&cpu_opp_table>;
> > > > >                       #cooling-cells = <2>;
> > > > > @@ -122,7 +122,7 @@
> > > > >                       reg = <0x1>;
> > > > >                       next-level-cache = <&L2_0>;
> > > > >                       enable-method = "psci";
> > > > > -                     cpu-idle-states = <&CPU_SPC>;
> > > > > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> > > > >                       clocks = <&apcs>;
> > > > >                       operating-points-v2 = <&cpu_opp_table>;
> > > > >                       #cooling-cells = <2>;
> > > > > @@ -134,7 +134,7 @@
> > > > >                       reg = <0x2>;
> > > > >                       next-level-cache = <&L2_0>;
> > > > >                       enable-method = "psci";
> > > > > -                     cpu-idle-states = <&CPU_SPC>;
> > > > > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> > > > >                       clocks = <&apcs>;
> > > > >                       operating-points-v2 = <&cpu_opp_table>;
> > > > >                       #cooling-cells = <2>;
> > > > > @@ -146,7 +146,7 @@
> > > > >                       reg = <0x3>;
> > > > >                       next-level-cache = <&L2_0>;
> > > > >                       enable-method = "psci";
> > > > > -                     cpu-idle-states = <&CPU_SPC>;
> > > > > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> > > > >                       clocks = <&apcs>;
> > > > >                       operating-points-v2 = <&cpu_opp_table>;
> > > > >                       #cooling-cells = <2>;
> > > > > @@ -160,8 +160,9 @@
> > > > >               idle-states {
> > > > >                       entry-method="psci";
> > > >
> > > > Please add a space before and after "=".
> > > >
> > > > >
> > > > > -                     CPU_SPC: spc {
> > > > > +                     CPU_SLEEP_0: cpu-sleep-0 {
> > > >
> > > > While I like your idea of using power state names from
> > > > Server Base System Architecture document (SBSA) where applicable,
> > > > does each qcom power state have a matching state in SBSA?
> > > >
> > > > These are the qcom power states:
> > > > https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/Documentation/devicetree/bindings/arm/msm/lpm-levels.txt?h=msm-4.4#n53
> > > >
> > > > Note that qcom defines:
> > > > "wfi", "retention", "gdhs", "pc", "fpc"
> > > > while SBSA simply defines "idle_standby" (aka wfi), "idle_retention", "sleep".
> > > >
> > > > Unless you know the equivalent name for each qcom power state
> > > > (perhaps several qcom power states are really the same SBSA state?),
> > > > I think that you should omit the renaming from this patch series.
> > >
> > > That is what SLEEP_0, SLEEP_1, SLEEP_2 could be used for.
> >
> > Ok, sounds good to me.
> >
> > >
> > > IOW, all these qcom definitions are nicely represented in the
> > > state-name and we could simply stick to SLEEP_0, SLEEP_1 for the node
> > > names. There is wide variability in the the names of the qcom idle
> > > states across SoC families downstream, so I'd argue against using
> > > those for the node names.
> > >
> > > Just for cpu states (non-wfi) I see the use of the following names
> > > downstream across families. The C<num> seems to come from x86
> > > world[1]:
> > >
> > >  - C4,   standalone power collapse (spc)
> > >  - C4,   power collapse (fpc)
> > >  - C2D, retention
> > >  - C3,   power collapse (pc)
> > >  - C4,   rail power collapse (rail-pc)
> > >
> > > [1] https://www.hardwaresecrets.com/everything-you-need-to-know-about-the-cpu-c-states-power-saving-modes/
> >
> > Indeed, there seems to be mixed names used, I've also seen "fpc-def".
> >
> > So, you have convinced me.
> >
> >
> > Kind regards,
> > Niklas
> 
> Can I take that as a Reviewed-by?

Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
