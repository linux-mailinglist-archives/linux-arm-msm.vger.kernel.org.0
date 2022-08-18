Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 530C8598E21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Aug 2022 22:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346114AbiHRUfA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 16:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345574AbiHRUe4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 16:34:56 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0CAC888B
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 13:34:55 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id t5so3291289edc.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 13:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=2hDqEKcdmlYS+rmxMoV7evAJDeqAhao6y+38M8d8WAw=;
        b=JmjuAiUEh8LDFy22IDRUpw9ZDS42dlK7Mq1k8lu9nRgQ6JsQ5jjykvqGPtpZF8+ShW
         cKfizZF4FHBZ2y1NhmQwtx84tp+fPWsDRigx0GmT5jv9eAYEds53keBKYdHiyj6wUDkm
         Dn5cUN82C37nyUdf4CFexaOv2B6CfP4Ot+w3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2hDqEKcdmlYS+rmxMoV7evAJDeqAhao6y+38M8d8WAw=;
        b=MZ0P3IneogktB5I7FMFMVz9+eEHGGW8rTMGNVLyJG8EjTuEa8Cl2uyrL7x0gN3GL32
         SeAIhqwCqxDD5b9qfVKjOaAiiJhx8Zw8GhZyiErSZqreKUBKVrfYqSXVv02ehRIbJ82B
         aqiCeR4I0qPrhvPFjq+lidrD73HJ/K8ZRMLkEZfHMs8rW5octec5zhm6ZqYltjLq8zac
         OtBTmRfi2KeNa7hXGGRJuvepMdin4oU5DNZ3rwu5BWIqKqVFo0/uOIowgt9BNJ5vd4KG
         sa6+SkDOVtkAZUV/XnCoG1VutixY0wosvuocZbI3fCYSYpJpLhtLRGoLtqeK5GKe5WLo
         H0kQ==
X-Gm-Message-State: ACgBeo1maPqh5IHYfP9pQG/Hglx56wwhzGU0QxXJFt8IYyUD0s1Adc6l
        LoXCCaHrIZWQQgleGJSwjzw5Ycx9p9ZIaTTE
X-Google-Smtp-Source: AA6agR7UOlTOL7H9j8EILRgNLxAN+pI8XCIvRDPKEhewqpkqNYnR8V84waQE7PKnCioFUEmUhbkEVg==
X-Received: by 2002:aa7:cb92:0:b0:443:98d6:20da with SMTP id r18-20020aa7cb92000000b0044398d620damr3485937edt.399.1660854893318;
        Thu, 18 Aug 2022 13:34:53 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id k13-20020a170906128d00b006f3ef214ddesm1286404ejb.68.2022.08.18.13.34.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 13:34:52 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id k16so2975025wrx.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 13:34:52 -0700 (PDT)
X-Received: by 2002:a05:6000:1541:b0:222:cf65:18d7 with SMTP id
 1-20020a056000154100b00222cf6518d7mr2401685wry.659.1660854892286; Thu, 18 Aug
 2022 13:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220818084216.1.I5c2b6fea19c4c0dec67fd4931f03df8e5ccaca95@changeid>
 <CAE-0n52GzxXEsToWzfU1TMuASuC6TKK7NXxYbBQWxNmM74FxZA@mail.gmail.com>
In-Reply-To: <CAE-0n52GzxXEsToWzfU1TMuASuC6TKK7NXxYbBQWxNmM74FxZA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Aug 2022 13:34:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WNuqtpnCr2Zn0z_L1OCiwD8dNzhDxvhfHYuYVmciPbuQ@mail.gmail.com>
Message-ID: <CAD=FV=WNuqtpnCr2Zn0z_L1OCiwD8dNzhDxvhfHYuYVmciPbuQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add sleep state for alc5682 codec
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     "Joseph S. Barrera III" <joebar@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Alexandru Stan <amstan@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Aug 18, 2022 at 11:46 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Joseph S. Barrera III (2022-08-18 08:42:19)
> > Add sleep state to acl5682. In default, gpio28 (HP_IRQ) is bias-pull-up.
> > To save power, in the new sleep state, gpio28 is bias-disable.
> >
> > sleeping, /sys/kernel/debug/gpio shows gpio28 as "no pull". When codec
>
> Is something missing? The sentence starts with 'sleeping'.
>
> > is awake (microphone plugged in and in use), it shows gpio28 as "pull up".
> >
> > Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> > ---
> >
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > index b5f534db135a..94dd6c34d997 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > @@ -755,8 +755,9 @@ hp_i2c: &i2c9 {
> >         alc5682: codec@1a {
> >                 compatible = "realtek,rt5682i";
> >                 reg = <0x1a>;
> > -               pinctrl-names = "default";
> > +               pinctrl-names = "default", "sleep";
> >                 pinctrl-0 = <&hp_irq>;
> > +               pinctrl-1 = <&hp_sleep>;
> >
> >                 #sound-dai-cells = <1>;
> >
> > @@ -1336,6 +1337,18 @@ pinconf {
> >                 };
> >         };
> >
> > +       hp_sleep: hp-sleep {
> > +               pinmux {
> > +                       pins = "gpio28";
> > +                       function = "gpio";
> > +               };
> > +
> > +               pinconf {
> > +                       pins = "gpio28";
> > +                       bias-disable;
> > +               };
>
> Does removing the bias cause an irq to trigger? I'm worried that this
> change may cause a spurious irq upon entering or exiting sleep, maybe
> both actually. The irq is double edged so we really want it to stay
> stable at one level whenever the gpio interrupt hardware is sensing the
> line.
>
> From what I can tell the pin is powered by AVDD-supply

Officially DBVDD I think, but (at least on the trogdor hardware) they
are the same rail.

> and I can't tell
> if that is ever powered off while the driver is probed. Probably not?

It doesn't seem to be. The driver I'm looking at turns on all the
regulators at probe time and never turns them off.

> If
> the power to the pin on the codec is never turned off then there isn't a
> power leak from what I can tell.

I tend to agree with Stephen's analysis. We actually need to keep the
pullup enabled unless we are actually turning power off to the codec,
which we don't seem to be doing.

I guess I'm a little surprised that we don't even seem to turn any of
this codec's regulators off in S3. That seems like it would be drawing
power that we don't want. Maybe the "low power" mode of the codec is
low enough and we need to avoid powering it off to avoid pops / hisses
in S3 or something? If that's true, this might be one of those places
where the "LPM" of the regulators might actually be useful...


-Doug
