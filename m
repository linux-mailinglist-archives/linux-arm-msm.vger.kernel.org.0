Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5108241A4FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 03:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238470AbhI1ByO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 21:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238457AbhI1ByN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 21:54:13 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C28C061604
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 18:52:35 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id r1so28261591ybo.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 18:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EuUTukvCpi090Ch8dilcH0ZbWY/oyx0dABKBe0VRp4E=;
        b=TLNBfxn5lXrNCEVTViF+/bsXa5DhtFkNYhpzGqUuc1tYOMnFt0UJTdavO0baRTnpVt
         l/wUeGggovcmCs50QSDY2mKOXG1Mdo25VpD8V2MhrbVo88rfEcJuAOhxz0h0Ftww3BGP
         s2gWAlj9O9TEhL4lXx0keBXlRdyewNdGs1FKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EuUTukvCpi090Ch8dilcH0ZbWY/oyx0dABKBe0VRp4E=;
        b=B/0o6iDr7czyUN6YiS57AsApDQYozTen94I12Zpt6KvvVunSzUKHApsjct4anI9lDh
         bPLs2pMuMgzhAvd7E//JAZ6ZwnHBhWeO4JnJaqIzObuqY9H0cwUQWKOEdgIClQvAmOU9
         h5oicInEzbyJ1gc7fX+6Mmx30MUCfwls+A3z78yFl2cez5ndzggcEBYfXBr4jE9Pfe5N
         5kqkCDpNl0+Kcinaj+EUqctKaWtD4NWwXJL6ZCGAm4dhriDgwUfiTMmrkFyhIEgNAZcx
         U7Nj63hP4xKgzbo7yFdKb08uH3jaKezg3FAv+NQ5rHqez8PLT3z+AAXKH8j+oppesOK8
         y3dA==
X-Gm-Message-State: AOAM532rmPO9520dqofZrkATysE73GZmM9uHYwMP0L/TZzPi7duu/8Lv
        UhocuJz9PeFjc8k1Ss6jG37l9jf1zRC83d9y/vETUg==
X-Google-Smtp-Source: ABdhPJx/sbIexkN8BY5i+JDAWMEQgUe2m+ku48UFiQ0+XHMEBWkdh62NjGgu8Iil/iDWL1fDsg2Q+/ymNO762iGNw7c=
X-Received: by 2002:a25:cf07:: with SMTP id f7mr3561724ybg.100.1632793954626;
 Mon, 27 Sep 2021 18:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210924165322.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
 <YVJAh755zCGUmobm@builder.lan>
In-Reply-To: <YVJAh755zCGUmobm@builder.lan>
From:   Philip Chen <philipchen@chromium.org>
Date:   Mon, 27 Sep 2021 18:52:23 -0700
Message-ID: <CA+cxXh=WiOpoZzRjYMR37dhDbYgAe=_KK1JmdC6sd-qJg01u=w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sc7180: Factor out ti-sn65dsi86 support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Mon, Sep 27, 2021 at 3:07 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 24 Sep 18:54 CDT 2021, Philip Chen wrote:
>
> > Factor out ti-sn65dsi86 edp bridge as a separate dts fragment.
> > This helps us introduce the second source edp bridge later.
> >
>
> I'd prefer to see the second patch in this series to conclude that this
> is the right approach.

Sure, I posted v2 with the second patch enabling the second source edp bridge.
PTAL.

>
> Regards,
> Bjorn
>
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
> > ---
> >
> >  .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  1 +
> >  .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  1 +
> >  .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  1 +
> >  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  1 +
> >  .../dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi | 87 +++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 81 -----------------
> >  6 files changed, 91 insertions(+), 81 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> > index a758e4d22612..1d13fba3bd2f 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> > @@ -11,6 +11,7 @@
> >  ap_h1_spi: &spi0 {};
> >
> >  #include "sc7180-trogdor.dtsi"
> > +#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
> >
> >  /* Deleted nodes from trogdor.dtsi */
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > index 00535aaa43c9..27b26a782af9 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > @@ -11,6 +11,7 @@
> >  ap_h1_spi: &spi0 {};
> >
> >  #include "sc7180-trogdor.dtsi"
> > +#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
> >
> >  &ap_sar_sensor {
> >       semtech,cs0-ground;
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
> > index a246dbd74cc1..e7c7cad14989 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
> > @@ -11,6 +11,7 @@
> >  ap_h1_spi: &spi0 {};
> >
> >  #include "sc7180-trogdor.dtsi"
> > +#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
> >
> >  / {
> >       thermal-zones {
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
> > index 2b522f9e0d8f..457c25499863 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
> > @@ -13,6 +13,7 @@
> >  ap_h1_spi: &spi0 {};
> >
> >  #include "sc7180-trogdor.dtsi"
> > +#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
> >
> >  / {
> >       model = "Google Trogdor (rev1+)";
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
> > new file mode 100644
> > index 000000000000..7b1034a5a8e9
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
> > @@ -0,0 +1,87 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Google Trogdor dts fragment for the boards with TI sn65dsi86 edp bridge
> > + *
> > + * Copyright 2021 Google LLC.
> > + */
> > +
> > +&dsi0_out {
> > +     remote-endpoint = <&sn65dsi86_in>;
> > +     data-lanes = <0 1 2 3>;
> > +};
> > +
> > +&edp_brij_i2c {
> > +     sn65dsi86_bridge: bridge@2d {
> > +             compatible = "ti,sn65dsi86";
> > +             reg = <0x2d>;
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&edp_brij_en>, <&edp_brij_irq>;
> > +             gpio-controller;
> > +             #gpio-cells = <2>;
> > +
> > +             interrupt-parent = <&tlmm>;
> > +             interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +             enable-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
> > +
> > +             vpll-supply = <&pp1800_edp_vpll>;
> > +             vccio-supply = <&pp1800_brij_vccio>;
> > +             vcca-supply = <&pp1200_brij>;
> > +             vcc-supply = <&pp1200_brij>;
> > +
> > +             clocks = <&rpmhcc RPMH_LN_BB_CLK3>;
> > +             clock-names = "refclk";
> > +
> > +             no-hpd;
> > +
> > +             ports {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     port@0 {
> > +                             reg = <0>;
> > +                             sn65dsi86_in: endpoint {
> > +                                     remote-endpoint = <&dsi0_out>;
> > +                             };
> > +                     };
> > +
> > +                     port@1 {
> > +                             reg = <1>;
> > +                             sn65dsi86_out: endpoint {
> > +                                     data-lanes = <0 1>;
> > +                                     remote-endpoint = <&panel_in_edp>;
> > +                             };
> > +                     };
> > +             };
> > +
> > +             aux-bus {
> > +                     panel: panel {
> > +                             /* Compatible will be filled in per-board */
> > +                             power-supply = <&pp3300_dx_edp>;
> > +                             backlight = <&backlight>;
> > +                             hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
> > +
> > +                             port {
> > +                                     panel_in_edp: endpoint {
> > +                                             remote-endpoint = <&sn65dsi86_out>;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&tlmm {
> > +     edp_brij_irq: edp-brij-irq {
> > +             pinmux {
> > +                     pins = "gpio11";
> > +                     function = "gpio";
> > +             };
> > +
> > +             pinconf {
> > +                     pins = "gpio11";
> > +                     drive-strength = <2>;
> > +                     bias-pull-down;
> > +             };
> > +     };
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > index 0f2b3c00e434..5ad3f15652d5 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > @@ -602,15 +602,6 @@ &camcc {
> >  &dsi0 {
> >       status = "okay";
> >       vdda-supply = <&vdda_mipi_dsi0_1p2>;
> > -
> > -     ports {
> > -             port@1 {
> > -                     endpoint {
> > -                             remote-endpoint = <&sn65dsi86_in>;
> > -                             data-lanes = <0 1 2 3>;
> > -                     };
> > -             };
> > -     };
> >  };
> >
> >  &dsi_phy {
> > @@ -621,65 +612,6 @@ &dsi_phy {
> >  edp_brij_i2c: &i2c2 {
> >       status = "okay";
> >       clock-frequency = <400000>;
> > -
> > -     sn65dsi86_bridge: bridge@2d {
> > -             compatible = "ti,sn65dsi86";
> > -             reg = <0x2d>;
> > -             pinctrl-names = "default";
> > -             pinctrl-0 = <&edp_brij_en>, <&edp_brij_irq>;
> > -             gpio-controller;
> > -             #gpio-cells = <2>;
> > -
> > -             interrupt-parent = <&tlmm>;
> > -             interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
> > -
> > -             enable-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
> > -
> > -             vpll-supply = <&pp1800_edp_vpll>;
> > -             vccio-supply = <&pp1800_brij_vccio>;
> > -             vcca-supply = <&pp1200_brij>;
> > -             vcc-supply = <&pp1200_brij>;
> > -
> > -             clocks = <&rpmhcc RPMH_LN_BB_CLK3>;
> > -             clock-names = "refclk";
> > -
> > -             no-hpd;
> > -
> > -             ports {
> > -                     #address-cells = <1>;
> > -                     #size-cells = <0>;
> > -
> > -                     port@0 {
> > -                             reg = <0>;
> > -                             sn65dsi86_in: endpoint {
> > -                                     remote-endpoint = <&dsi0_out>;
> > -                             };
> > -                     };
> > -
> > -                     port@1 {
> > -                             reg = <1>;
> > -                             sn65dsi86_out: endpoint {
> > -                                     data-lanes = <0 1>;
> > -                                     remote-endpoint = <&panel_in_edp>;
> > -                             };
> > -                     };
> > -             };
> > -
> > -             aux-bus {
> > -                     panel: panel {
> > -                             /* Compatible will be filled in per-board */
> > -                             power-supply = <&pp3300_dx_edp>;
> > -                             backlight = <&backlight>;
> > -                             hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
> > -
> > -                             port {
> > -                                     panel_in_edp: endpoint {
> > -                                             remote-endpoint = <&sn65dsi86_out>;
> > -                                     };
> > -                             };
> > -                     };
> > -             };
> > -     };
> >  };
> >
> >  ap_sar_sensor_i2c: &i2c5 {
> > @@ -1245,19 +1177,6 @@ pinconf {
> >               };
> >       };
> >
> > -     edp_brij_irq: edp-brij-irq {
> > -             pinmux {
> > -                     pins = "gpio11";
> > -                     function = "gpio";
> > -             };
> > -
> > -             pinconf {
> > -                     pins = "gpio11";
> > -                     drive-strength = <2>;
> > -                     bias-pull-down;
> > -             };
> > -     };
> > -
> >       en_pp3300_codec: en-pp3300-codec {
> >               pinmux {
> >                       pins = "gpio83";
> > --
> > 2.33.0.685.g46640cef36-goog
> >
