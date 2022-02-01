Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82C84A541B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 01:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbiBAAez (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 19:34:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbiBAAey (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 19:34:54 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B014CC06173B
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 16:34:54 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id i62so19222381ioa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 16:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0RxjgSGztYUFbx7bjM7KqKNH0qHJ5gdw8CggC6+9rrQ=;
        b=IL6Y0sZzrChCOgfOM3tMFFLMgnoZbgv3BLZ8uvwghxync3/m7dJ2meo7QZNfdIFpFV
         AE6NUtEQQtCT/QODYblVO8UVgEdDxaUF7EiM+GP41QIxOGg4PcmoTVoyZIZAnzXt++DN
         0Xjv56VGx1Gb/LxPntRGY81CcPP1YlzbOQ33A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0RxjgSGztYUFbx7bjM7KqKNH0qHJ5gdw8CggC6+9rrQ=;
        b=72TyzZqMCUZm03QhKylbkv0ctSR5E3DSlSYi0tUJyTXnN3MjMcGTpV4PFbgMWcX+R0
         Xs9ZEYYuASfp77jNItO5/JJSQS9v5OTIM2si2xMZHMsIJBvEZYtlVSOlz1DKWxe5h9hg
         Opsek4Xn3QiBrKxkr15aw70lMM5EioOF/WkwNR4JPG882jrYLo69eQ0a91x6Q5eXbFFu
         DSASD37R6jI9H1qQ3uEzF5D+nJV0LRKBRclWFPp0OMr9TkEPMi9i9fAuH2hsrQ0SbrhD
         /KyiYBczyWeW9J0O3b2VJc6JWpkSuMyYhn4BE7hyFVkbPkB4UfazD0uScfj8wqFV7gkn
         yeJA==
X-Gm-Message-State: AOAM533aIVZwaeEBc1Z6OjkxdE/tce02SiFy5uTtRjmSEwIgdwUaR4Xb
        KjX4zF5Tsh98ZyIgtHVXq9zBmrqwE0b+9A==
X-Google-Smtp-Source: ABdhPJwMhDuATWwF7nQSCVL8OoTnttJG62uqLnbqy1VvXYBIUxjcDi0WZCXArQHFQqUqFmEcWzwG7Q==
X-Received: by 2002:a05:6638:1396:: with SMTP id w22mr4340539jad.11.1643675693962;
        Mon, 31 Jan 2022 16:34:53 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id j3sm7413634ilq.13.2022.01.31.16.34.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 16:34:53 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id e79so19142553iof.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 16:34:53 -0800 (PST)
X-Received: by 2002:a05:6638:168d:: with SMTP id f13mr8859539jat.44.1643675692795;
 Mon, 31 Jan 2022 16:34:52 -0800 (PST)
MIME-Version: 1.0
References: <20220201001042.3724523-1-dianders@chromium.org>
 <20220131161034.4.I79baad7f52351aafb470f8b21a9fa79d7031ad6a@changeid>
 <CAD=FV=U4oma5qeoboczmKf6Qx7hpuwFbU-wi51p=owaKgZCQtg@mail.gmail.com> <Yfh/zXKrzC5zaxl/@builder.lan>
In-Reply-To: <Yfh/zXKrzC5zaxl/@builder.lan>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 31 Jan 2022 16:34:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XhVC2g+Me_7Hj=cKEz_GxUJao7OSbfV-nT6GS535SpOA@mail.gmail.com>
Message-ID: <CAD=FV=XhVC2g+Me_7Hj=cKEz_GxUJao7OSbfV-nT6GS535SpOA@mail.gmail.com>
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

On Mon, Jan 31, 2022 at 4:33 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 31 Jan 18:25 CST 2022, Doug Anderson wrote:
>
> > Hi,
> >
> > On Mon, Jan 31, 2022 at 4:11 PM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > index 40cb414bc377..dc98a87e2871 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > @@ -616,6 +616,9 @@ qfprom: efuse@784000 {
> > >
> > >                 sdhc_1: sdhci@7c4000 {
> > >                         compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
> > > +                       pinctrl-names = "default", "sleep";
> > > +                       pinctrl-0 = <&sdc1_clk>, <&sdc1_cmd>, <&sdc1_data>, <&sdc1_rclk>;
> > > +                       pinctrl-1 = <&sdc1_clk_sleep>, <&sdc1_cmd_sleep>, <&sdc1_data_sleep>, <&sdc1_rclk_sleep>;
> > >                         status = "disabled";
> > >
> > >                         reg = <0 0x007c4000 0 0x1000>,
> > > @@ -2425,6 +2428,9 @@ apss_merge_funnel_in: endpoint {
> > >
> > >                 sdhc_2: sdhci@8804000 {
> > >                         compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
> > > +                       pinctrl-names = "default", "sleep";
> > > +                       pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;
> > > +                       pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;
> > >                         status = "disabled";
> > >
> > >                         reg = <0 0x08804000 0 0x1000>;
> > > @@ -3943,81 +3949,76 @@ qup_uart15_rx: qup-uart15-rx {
> > >                                 function = "qup17";
> > >                         };
> > >
> > > -                       sdc1_on: sdc1-on {
> > > -                               clk {
> > > -                                       pins = "sdc1_clk";
> > > -                               };
> > >
> > > -                               cmd {
> > > -                                       pins = "sdc1_cmd";
> > > -                               };
> > >
> > > -                               data {
> > > -                                       pins = "sdc1_data";
> > > -                               };
> > > +                       sdc1_clk: sdc1-clk {
> >
> > Ugh. I just noticed that there are way too many blank lines here in
> > the output. Happy to have this fixed when applying or I can post a v2.
> >
>
> I can fix that up as I apply it. Will let it sit for a few days to
> attract reviews first though.

Sounds good. Thanks! I might end up sending a v2 anyway since I found
a few more fixups, but I'll at least wait a day or two so I don't spam
people too hard.

-Doug
