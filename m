Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8A64A7A6F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Feb 2022 22:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347514AbiBBV20 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Feb 2022 16:28:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236968AbiBBV2Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Feb 2022 16:28:25 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43ADCC061714
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Feb 2022 13:28:24 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id r144so730252iod.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Feb 2022 13:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B3+VW/9EfZTino0jyY3UEfeRlHvYgao8DjPaWeUn/OQ=;
        b=XezSyPxjpz1BTWmYK0sIFqQQzb3kPxO+OMQm5jHqGMKab/Q+yOI3x8gqWGE6jf6Wia
         ulvtUtpWs2oIrRRhtcnmYxIN7/EoR063RuTNdVA+VIlm2L9hoZi64lycJfDkzpEQmzAw
         rBVhrzfZ4q8Ezkbl2fi5IRj8i6+FuqGhdUFYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B3+VW/9EfZTino0jyY3UEfeRlHvYgao8DjPaWeUn/OQ=;
        b=svCi7VcVE9DJ6fLHRA6Oa47+Y7V7lEHu2Kkb77XAXefVrB+nT8ippGvPyRhasfCLyG
         dnobCqmlAYjsXpcZN3bYdVlqqCzKe30zQk6d9FJLcytqhCQWDXYorSEqX6aFKKrVlwGQ
         4axMdmgrK4jTjPSwOCV3CJaJdMQz3adgbH/lMx+/a5Uf0v6SNQqy/IX3Ru5cF8883Y7S
         u0Ri4wYjUiNuBPrKNDqVAzPwp04ic/ER7Vzz9pKhpCQW5Z+/afPZ8YMPLsTj9ZD+fJsu
         ah3QyvywNn2KkD788GSdOwoNp45Agbnr0O84PtQHTWin4rsRzzv1KujbdOzDJbQv36Co
         4Jgg==
X-Gm-Message-State: AOAM532pg1tLYfksIG36WZHPYM6Tc/0tSii2iJGoNmHr4mHZGA0Al13k
        1386jU2IPNpMZICh9+egpzMw4yGzn/Zs6g==
X-Google-Smtp-Source: ABdhPJwRcMqG+aswsYtL87gLDAtmTVQjSajaoVShQJkKvVIy/9hDzLwlPPk0iulJ2jJ3m8+VL2VWzQ==
X-Received: by 2002:a5d:9d01:: with SMTP id j1mr17157211ioj.195.1643837303539;
        Wed, 02 Feb 2022 13:28:23 -0800 (PST)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com. [209.85.166.177])
        by smtp.gmail.com with ESMTPSA id c3sm24594254iow.28.2022.02.02.13.28.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 13:28:23 -0800 (PST)
Received: by mail-il1-f177.google.com with SMTP id m17so458175ilj.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Feb 2022 13:28:22 -0800 (PST)
X-Received: by 2002:a05:6e02:1be3:: with SMTP id y3mr18555701ilv.120.1643837302621;
 Wed, 02 Feb 2022 13:28:22 -0800 (PST)
MIME-Version: 1.0
References: <20220201001042.3724523-1-dianders@chromium.org>
 <20220131161034.4.I79baad7f52351aafb470f8b21a9fa79d7031ad6a@changeid>
 <CAD=FV=U4oma5qeoboczmKf6Qx7hpuwFbU-wi51p=owaKgZCQtg@mail.gmail.com>
 <Yfh/zXKrzC5zaxl/@builder.lan> <CAD=FV=XhVC2g+Me_7Hj=cKEz_GxUJao7OSbfV-nT6GS535SpOA@mail.gmail.com>
In-Reply-To: <CAD=FV=XhVC2g+Me_7Hj=cKEz_GxUJao7OSbfV-nT6GS535SpOA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Feb 2022 13:28:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U0rhdjZsKYHLwmP188nBqnNPB0fwqQ1z-pGMQLjqXd9A@mail.gmail.com>
Message-ID: <CAD=FV=U0rhdjZsKYHLwmP188nBqnNPB0fwqQ1z-pGMQLjqXd9A@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sc7280: Clean up sdc1 / sdc2 pinctrl
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jan 31, 2022 at 4:34 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Jan 31, 2022 at 4:33 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 31 Jan 18:25 CST 2022, Doug Anderson wrote:
> >
> > > Hi,
> > >
> > > On Mon, Jan 31, 2022 at 4:11 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > > index 40cb414bc377..dc98a87e2871 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > > @@ -616,6 +616,9 @@ qfprom: efuse@784000 {
> > > >
> > > >                 sdhc_1: sdhci@7c4000 {
> > > >                         compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
> > > > +                       pinctrl-names = "default", "sleep";
> > > > +                       pinctrl-0 = <&sdc1_clk>, <&sdc1_cmd>, <&sdc1_data>, <&sdc1_rclk>;
> > > > +                       pinctrl-1 = <&sdc1_clk_sleep>, <&sdc1_cmd_sleep>, <&sdc1_data_sleep>, <&sdc1_rclk_sleep>;
> > > >                         status = "disabled";
> > > >
> > > >                         reg = <0 0x007c4000 0 0x1000>,
> > > > @@ -2425,6 +2428,9 @@ apss_merge_funnel_in: endpoint {
> > > >
> > > >                 sdhc_2: sdhci@8804000 {
> > > >                         compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
> > > > +                       pinctrl-names = "default", "sleep";
> > > > +                       pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;
> > > > +                       pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;
> > > >                         status = "disabled";
> > > >
> > > >                         reg = <0 0x08804000 0 0x1000>;
> > > > @@ -3943,81 +3949,76 @@ qup_uart15_rx: qup-uart15-rx {
> > > >                                 function = "qup17";
> > > >                         };
> > > >
> > > > -                       sdc1_on: sdc1-on {
> > > > -                               clk {
> > > > -                                       pins = "sdc1_clk";
> > > > -                               };
> > > >
> > > > -                               cmd {
> > > > -                                       pins = "sdc1_cmd";
> > > > -                               };
> > > >
> > > > -                               data {
> > > > -                                       pins = "sdc1_data";
> > > > -                               };
> > > > +                       sdc1_clk: sdc1-clk {
> > >
> > > Ugh. I just noticed that there are way too many blank lines here in
> > > the output. Happy to have this fixed when applying or I can post a v2.
> > >
> >
> > I can fix that up as I apply it. Will let it sit for a few days to
> > attract reviews first though.
>
> Sounds good. Thanks! I might end up sending a v2 anyway since I found
> a few more fixups, but I'll at least wait a day or two so I don't spam
> people too hard.

Breadcrumbs: I ended up sending out a v2 (tagged as v3 for other
reasons) that fixes this.

https://lore.kernel.org/r/20220202132301.v3.4.I79baad7f52351aafb470f8b21a9fa79d7031ad6a@changeid/

-Doug
