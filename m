Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4987E5508B5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jun 2022 07:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbiFSFGP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jun 2022 01:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbiFSFGN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jun 2022 01:06:13 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FBEB11A38
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jun 2022 22:06:12 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id g18so4369514qvn.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jun 2022 22:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g4eUI0BzbqwGfzltxtB1irXUPNhqdMTDmFUtF3/NrEk=;
        b=zHsc3IUT4Fbw+cGtTC7if0IXCCImCmFqk/hM3dLQbUPKhRHUKnFLZF9SUf3B81v5NP
         D83b2xZDg5fFpyaO5Qr8Zp7Jl0CKjh8wh4gVpHQctiDEuiNcX8yLhN98C3z9X9Pc08i9
         qmxBpWvDGthGUYuJczAFRk4ran3B6P3uNofIX2dyxfbt4E+iso3NQ48Ep98mdv8MsExC
         RX6Cdeu8qSg7vGg+Sz3qGs06XR2L3llI2Smls+0om2jzXGkCRKjc9Z7HmW+diWxpEwXz
         JT5RRdx9LJAxOFZUcIKNeBrs/AEKEaQrE/x9AvmDK4nIfW+DPHnatP4GWX0AhpbrXH2L
         O9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g4eUI0BzbqwGfzltxtB1irXUPNhqdMTDmFUtF3/NrEk=;
        b=qe2PYk2cMu0dIv3OKmM6lMUj6EFefZSSSECzZUKnf/C5mburq4FKh3/EGyWFgGXMN+
         QuR/bUgDl4AvVEEVdCjTTaoj92QAMSvDz1cVOMBSXiVYaxK7Uu0aVeDhzSnpg+O9KT68
         f1/2XpqCADxQGLvCbjLLQM5IHVlle/StA1TWkvQ3dYLGx9DRnBQs7gmYkcLt5Bf8AmHc
         kHkBLSvj7nOMo/+e00PwPKvEf4nSzoi38R9TgNVDwCsgV1yVM7QuGS26q2HGj4vX5Jws
         G0nxR0+hB1iu0qNc49cfHo7kADPRZw1oUYfwZOpzHZpbLROq1lYhNfgw3IzEKY8oHnPI
         S4pQ==
X-Gm-Message-State: AJIora+A6SfJVSLjrRieDmQKlb4I3dO9Hq8ofA7Ka9HyZ/r78LXf1Owu
        uZJuWIKqmtHh6HLMFuYoxrs9N0WSYO1Mu/68jEBwjw==
X-Google-Smtp-Source: AGRyM1sud0zhM7jkdrKtZrSMEefvPSTwagyhaVTx2h3tVe+6G4KWz3aHPaaZLXUwxhbZWLhmy2iETlAl/4Tvp/nMLlo=
X-Received: by 2002:ac8:7e87:0:b0:306:6575:6035 with SMTP id
 w7-20020ac87e87000000b0030665756035mr14886059qtj.629.1655615171582; Sat, 18
 Jun 2022 22:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
 <20220617122922.769562-7-dmitry.baryshkov@linaro.org> <155e3867-c37e-4cc4-782c-3903b134c427@somainline.org>
In-Reply-To: <155e3867-c37e-4cc4-782c-3903b134c427@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 19 Jun 2022 08:06:00 +0300
Message-ID: <CAA8EJpoDEXHkf1sbvrEc0-Pc8jSd3ZMjTGHj4bwSzo_q4UP9HA@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: msm8996: add clocks to the MMCC
 device node
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 19 Jun 2022 at 02:53, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
>
>
> On 17.06.2022 14:29, Dmitry Baryshkov wrote:
> > As we are converting this platform to use DT clock bindings, add clocks
> > and clock-names properties to the MMCC device tree node.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>
>
> Sidenote: would RPM XO work here, or is it broken on 8996?

I was not sure, which of XOs should be used here, thus I just left the xo_board.

We already have several other devices on 8996 which use xo_board, so
ideally we should fix all of them later.

>
> Konrad
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index dffb87a5ee74..0c7b7cd9f23e 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -751,6 +751,22 @@ mmcc: clock-controller@8c0000 {
> >                       #reset-cells = <1>;
> >                       #power-domain-cells = <1>;
> >                       reg = <0x008c0000 0x40000>;
> > +                     clocks = <&xo_board>,
> > +                              <&gcc GCC_MMSS_NOC_CFG_AHB_CLK>,
> > +                              <&gcc GPLL0>,
> > +                              <&dsi0_phy 1>,
> > +                              <&dsi0_phy 0>,
> > +                              <0>,
> > +                              <0>,
> > +                              <0>;
> > +                     clock-names = "xo",
> > +                                   "gcc_mmss_noc_cfg_ahb_clk",
> > +                                   "gpll0",
> > +                                   "dsi0pll",
> > +                                   "dsi0pllbyte",
> > +                                   "dsi1pll",
> > +                                   "dsi1pllbyte",
> > +                                   "hdmipll";
> >                       assigned-clocks = <&mmcc MMPLL9_PLL>,
> >                                         <&mmcc MMPLL1_PLL>,
> >                                         <&mmcc MMPLL3_PLL>,
> >



-- 
With best wishes
Dmitry
