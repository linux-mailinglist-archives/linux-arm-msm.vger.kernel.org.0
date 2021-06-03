Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B27239ACFE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 23:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbhFCVhd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 17:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhFCVhd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 17:37:33 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280F3C061756
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jun 2021 14:35:36 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id j17-20020a0568200231b029024900620310so488954oob.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 14:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=fdGca/qkXtFIrcRqfF9Oz+FtnAgDYxa2k4yJTgHSE9Q=;
        b=DOZw7Gr9pDSoeMVNbsz8uTCNISGH2vhGvbGtWQMr0Fp9rnyxMjCI5vGvl2LpscweQo
         wv3w2GJEXjJOZ2fHsri7XyaJ1qifvbALUJFjnIer/nTrQstULiIub4T0uijaZ348mxJx
         d90Of6OCT5YxhVWGDsFyp9qZ7O7fqFtrg/ElE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=fdGca/qkXtFIrcRqfF9Oz+FtnAgDYxa2k4yJTgHSE9Q=;
        b=fhyiqO2EVpZdius1Tv9SIgmFoiz4+DYMNHpjVDPioYSg34iv+Q5POTxi12ZZJHKdEA
         8Xd4P1D0x1WUp/flJMjQAhwrm1ZeGO71wT8ZYcRGu2xVJwpADLueycxQ7Nd9SEa+IcP9
         GgJm+qoIaNV4mF2i2biFDJfc5uAL8cOWGWf6m7ssQ3YXqUEsrGpLWvmpDio8jzyjpKv0
         XkECdXJI3xya2yy1YMUZtEhmzguZktIUm0m5BpGrR9FBN+MX06GkZDPQfm9AW7vMsoiI
         Fgayw1n+vOJYzf9CDp1PD8uQn5DWfmi539sCuttl8Qq8hmEQZEHwgRs3hkLQFUbbCOWV
         Zfrg==
X-Gm-Message-State: AOAM531tagvDDtxG67YFMFj5FSMDu8L4Er9I3LEwlram9Ng3G+h1Bpaz
        w5GU0eV+awv6WjNnyw0Z/vQNYYIuMdgFpXIsWZeK5A==
X-Google-Smtp-Source: ABdhPJycnioH5Ed8RBIYP+Bjnktnsogk9MbeJEjp7I2J4ue38o/zYJWTWMH0j6NofP7729BFjMbMBTAF7hmWnC2eYzc=
X-Received: by 2002:a4a:85ca:: with SMTP id u10mr1068395ooh.80.1622756135377;
 Thu, 03 Jun 2021 14:35:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Jun 2021 21:35:35 +0000
MIME-Version: 1.0
In-Reply-To: <d3ec375b9cbe72030e240a84a6c7e13d@codeaurora.org>
References: <1622736555-15775-1-git-send-email-khsieh@codeaurora.org>
 <YLkI/6ItCz+SbbuJ@yoga> <d3ec375b9cbe72030e240a84a6c7e13d@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 3 Jun 2021 21:35:34 +0000
Message-ID: <CAE-0n53B6oa2zUm0h28Z-U4uhdMabZPRFV=h-ffyBKLs_uHZ-Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm64/dts/qcom/sc7180: Add Display Port dt node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>, khsieh@codeaurora.org
Cc:     robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org,
        agross@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting khsieh@codeaurora.org (2021-06-03 14:28:37)
> On 2021-06-03 09:53, Bjorn Andersson wrote:
> > On Thu 03 Jun 11:09 CDT 2021, Kuogee Hsieh wrote:
> >
> >> Add DP device node on sc7180.
> >>
> >> Changes in v2:
> >> -- replace msm_dp with dp
> >> -- replace dp_opp_table with opp_table
> >>
> >
> > I'm sorry for those suggestions, I don't like either one of them.
> >
> > And for everything but changes to the DRM code the changelog goes below
> > the --- line, so it's not part of the git history.
> >
> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |  9 ++++
> >>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 78
> >> ++++++++++++++++++++++++++++
> >>  2 files changed, 87 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >> b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >> index 24d293e..40367a2 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >> @@ -786,6 +786,15 @@ hp_i2c: &i2c9 {
> >>      status = "okay";
> >>  };
> >>
> >> +&dp {
> >> +        status = "okay";
> >> +        pinctrl-names = "default";
> >> +        pinctrl-0 = <&dp_hot_plug_det>;
> >> +        data-lanes = <0 1>;
> >
> > Is it a limitation of the EC in Trogdor that you can only do 2 lanes?
>
> yes,
>

It's not an EC limitation. It's a hardware design decision. We have one
type-c PHY on the sc7180 SoC and we have two type-c ports on the board
so we have decided to only use two lanes for DP and two lanes for USB on
the type-c ports so that both type-c ports work all the time.
