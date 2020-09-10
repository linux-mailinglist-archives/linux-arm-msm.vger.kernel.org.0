Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB752654C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 00:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbgIJWD4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 18:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgIJWDy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 18:03:54 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C780CC061573;
        Thu, 10 Sep 2020 15:03:53 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x23so2179706wmi.3;
        Thu, 10 Sep 2020 15:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XwFesGR4NbCLq0zixfOqhv5ARStJ9CjQZ3o4UAP9K2k=;
        b=Ryg27q/gAZXbg6huhbkDvo7fSvYgt+GSFoQpCeq1JnM98lYeNn1mU0FPPQjx8+zCR7
         HO7cWjwGxLY+h/9hS+8lXwfAdzU25b/SOByjCW516cHROFpUlc4E84piriVXDA48SJ/M
         /AAdslZCcSarc31hmEtZQSGY8Q4GXkfi1BfK/281hA6gGFH62+hTlrfivfTpcxXfECkf
         b6MATUAd7FQDf1Fer5hJHd61DSrCV/PjwZVnBYKKUMSGFBT0prFUD2qcQ0Lupkp1ye7H
         uJOdx9f4noBxv6I1KggJpV17U/pj6gg3zA/oppkQKW1iCBL5V1OelDW1gvcGqFZhjCqW
         SFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XwFesGR4NbCLq0zixfOqhv5ARStJ9CjQZ3o4UAP9K2k=;
        b=mEygLPC3mXo3buF+1VH688becNg/sJwRSLyNwVa+ssWw2u/2ssuT0+Yjc5mjA/i6Zf
         fC2r1sx9mb42FPLvLJzx5wX6H7t9/mSjW3Q8Sl207ymTOMvuZDMGJX4cebyAylN9hL6/
         ksFRsMkG1DJsvh+5bVI63tIEBZMq1D+4dQV8vtuOMZCrYxiBBUA8XnCEy3EnYUXMXMaf
         5clcH7iErVaJiYH9Pt+oN1m+lR6Z2vzfP0G+nVGTYgn9Na+r2dh+CO1oQz+mmB/R/qwb
         vFWoJQEhi8aBcTBKk3Ka8wSSOzAzfSFGLHZVyOBepfCm+zo/KODmChpUb7jLIaCWy9Uh
         dSrg==
X-Gm-Message-State: AOAM530/HjeSK/ZK1TgL2OrTJ0hp47k/eXAL/9tK4r/h6IfD5chuzV7Y
        TVUCFlrvnrucMRBp2a8xgOWUga7f8p0Z6P36XWY=
X-Google-Smtp-Source: ABdhPJzKmH/rmiHX/MqNIlb9eckwnYeH5cxMnEa8h0PE/vcCG2cB5ok8HqYzXdjuavUOrjkKgumjScxKYz3UVx9VSr4=
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr2030447wmg.164.1599775431560;
 Thu, 10 Sep 2020 15:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <1594899334-19772-1-git-send-email-kalyan_t@codeaurora.org>
 <1594899334-19772-2-git-send-email-kalyan_t@codeaurora.org> <20200910220037.GA472@uller>
In-Reply-To: <20200910220037.GA472@uller>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 10 Sep 2020 15:04:47 -0700
Message-ID: <CAF6AEGvriNYkeaBVmK2mEG1OVojun2nQ7c2X6BuE-E-B4DRujA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: sc7180: add bus clock to mdp node for
 sc7180 target
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 10, 2020 at 3:00 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 16 Jul 11:35 UTC 2020, Kalyan Thota wrote:
>
> > From: Krishna Manikandan <mkrishn@codeaurora.org>
> >
> > Move the bus clock to mdp device node,in order
> > to facilitate bus band width scaling on sc7180
> > target.
> >
> > The parent device MDSS will not vote for bus bw,
> > instead the vote will be triggered by mdp device
> > node. Since a minimum vote is required to turn
> > on bus clock, move the clock node to mdp device
> > from where the votes are requested.
> >
> > This patch has dependency on the below series
> > https://patchwork.kernel.org/patch/11468783/
> >
>
> Isn't this dependency on an old revision of patch 3/3 in this series?
>
> Regardless, I don't see either the linked patch or patch 3 merged in
> linux-next, so I presume I should not merge this?

I guess that would be "drm/msm/dpu: add support for clk and bw scaling
for display" on msm-next-staging[1] (about to be msm-next)

[1] https://gitlab.freedesktop.org/drm/msm/-/commits/msm-next-staging


> Regards,
> Bjorn
>
> > Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 4f2c0d1..31fed6d 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -1510,10 +1510,9 @@
> >                       power-domains = <&dispcc MDSS_GDSC>;
> >
> >                       clocks = <&gcc GCC_DISP_AHB_CLK>,
> > -                              <&gcc GCC_DISP_HF_AXI_CLK>,
> >                                <&dispcc DISP_CC_MDSS_AHB_CLK>,
> >                                <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > -                     clock-names = "iface", "bus", "ahb", "core";
> > +                     clock-names = "iface", "ahb", "core";
> >
> >                       assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> >                       assigned-clock-rates = <300000000>;
> > @@ -1539,12 +1538,13 @@
> >                                     <0 0x0aeb0000 0 0x2008>;
> >                               reg-names = "mdp", "vbif";
> >
> > -                             clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                             clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> > +                                      <&dispcc DISP_CC_MDSS_AHB_CLK>,
> >                                        <&dispcc DISP_CC_MDSS_ROT_CLK>,
> >                                        <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> >                                        <&dispcc DISP_CC_MDSS_MDP_CLK>,
> >                                        <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > -                             clock-names = "iface", "rot", "lut", "core",
> > +                             clock-names = "bus", "iface", "rot", "lut", "core",
> >                                             "vsync";
> >                               assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> >                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > --
> > 1.9.1
> >
