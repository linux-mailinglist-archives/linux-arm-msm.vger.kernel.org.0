Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8424E3045
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Mar 2022 19:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352131AbiCUSzO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Mar 2022 14:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239977AbiCUSzN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Mar 2022 14:55:13 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0246D3121A
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 11:53:47 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id q129so15215509oif.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 11:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=QsItZtJmJ2CFB/IluEilX1aCyTGMoKcJJhXW/pui3cs=;
        b=CngDF1MVwEO3lmynF+1vbj0LbrsGQqTNxN+rlV6L4NBGpLQ0vRuKc5YZg8LXrGcxqV
         yD/qt87ex9YLdjI9rKoby0Fu0l8DXeAv++yvThjoZFlBme/BEicPYWhiq/067rmeWqgy
         039yEalaOMYt+Jf+Xh+rO956Iaraqw8MfDV/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=QsItZtJmJ2CFB/IluEilX1aCyTGMoKcJJhXW/pui3cs=;
        b=RHNfdF4YoMvVJvgOYzQFJQuB6FhGucFc16GTY//tQEg997C0U83vAWhJVSc7lnJdFA
         p3w91r+n7aeMGeXYqN0YDR/i6VtB+iVlJP3VLDkjwrzcScY4cRi9c56EbfntHv9Uc03o
         SQ7+RE3DjIHH7+1AzcTvdSIBUbs0U+tzODqpDE2mfu+eP5c7hs36OwuYbM8ifcHr/sZi
         HVJXPRO5exgrIIZjSOC6Dkwpqun6qooRwdGHSyx0qGHkWFlNJjZpaRsSmw/8+umKPU+m
         deV3RIiIrXEKoQ/1/Iyn5kdf144BzjxeVqGBGlRQK4FT17uP5J87UMfL15SQh9EHRMQn
         eipA==
X-Gm-Message-State: AOAM531IwxgE6P4ydcHspjSxzbelqvnzve41GT+0MW6AAgdE276aigwh
        05M4jvMJuDAeYVYWLlaYC4yZUzHat9X1oDW5ntXJWA==
X-Google-Smtp-Source: ABdhPJwYzDcCTvKabFEJ1mwqClZzWrwQNz6j/RVLn4zSvahDVJN8VgpKIjzun9aJwk6RJ6HJuCpLNF0PrBMN9YDNHPo=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr281721oif.63.1647888826407; Mon, 21 Mar
 2022 11:53:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Mar 2022 19:53:45 +0100
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WNqCdPpKdV4gHL4Y9aDpwGW+OE3AcxKrx-OXNfQSLFBQ@mail.gmail.com>
References: <20220317010640.2498502-1-swboyd@chromium.org> <20220317010640.2498502-3-swboyd@chromium.org>
 <CAD=FV=WNqCdPpKdV4gHL4Y9aDpwGW+OE3AcxKrx-OXNfQSLFBQ@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 21 Mar 2022 19:53:45 +0100
Message-ID: <CAE-0n53UbZq4MqrzNLEpmJO4j1S+d-LNPqpSwu5VM0873NSyGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Fully describe fingerprint node on Herobrine
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2022-03-18 13:55:56)
> Hi,
>
> On Wed, Mar 16, 2022 at 6:06 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Update the fingerprint node on Herobrine to match the fingerprint DT
> > binding. This will allow us to drive the reset and boot gpios from the
> > driver when it is re-attached after flashing. We'll also be able to boot
> > the fingerprint processor if the BIOS isn't doing it for us.
> >
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Matthias Kaehlcke <mka@chromium.org>
> > Cc: Alexandru M Stan <amstan@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >
> > Depends on https://lore.kernel.org/r/20220317005814.2496302-1-swboyd@chromium.org
> >
> >  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> > index 984a7faf0888..282dda78ba3f 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> > @@ -396,13 +396,16 @@ ap_spi_fp: &spi9 {
> >         cs-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
> >
> >         cros_ec_fp: ec@0 {
> > -               compatible = "google,cros-ec-spi";
> > +               compatible = "google,cros-ec-fp";
> >                 reg = <0>;
> >                 interrupt-parent = <&tlmm>;
> >                 interrupts = <61 IRQ_TYPE_LEVEL_LOW>;
> >                 pinctrl-names = "default";
> >                 pinctrl-0 = <&fp_to_ap_irq_l>, <&fp_rst_l>, <&fpmcu_boot0>;
> > +               boot0-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
> > +               reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
> >                 spi-max-frequency = <3000000>;
> > +               vdd-supply = <&pp3300_fp_mcu>;
>
> IMO we shouldn't specify vdd-supply here when it's a bogus regulator
> (doesn't actually control the relevant GPIO). Having device trees like
> this will make it hard to transition to the kernel controlling this
> GPIO in the future because the cros-ec-fp driver won't know whether
> it's controlling the GPIO or not. So my vote would be either:
>
> 1. Go whole hog and have the kernel in charge of the regulator,
> exposing regulator control to the userspace updater through some sort
> of GPIO
>
> - or -
>
> 2. Make the "vdd-supply" optional and don't specify it until we're
> ready to go whole hog.

It isn't an optional supply because the device always has this voltage
pin connected to power it. I think we decided in the driver side patches
that this isn't an issue because the driver will ignore the regulator
for now. Eventually it will take control and firmware flashing will be
done differently. If you don't agree please let me know.

>
> Also note: looking back at the note about the fingerprint regulator,
> there's something I wonder if we tried. Did we try to have the
> userspace "updater" try unbinding the fingerprint regulator so it
> could get control of the GPIO? Then the regulator could normally have
> control of it but if userspace wanted control it would unbind the
> regulator driver.
>

Nope we didn't try that. I find it pretty disappointing that userspace
needs to control the regulator at all though. We should work towards
moving the control into the kernel for all these gpios and regulators so
that userspace simply flashes the firmware in a platform agnostic way.
