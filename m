Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 017B33A5E49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 10:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbhFNIWW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 04:22:22 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:47087 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232578AbhFNIWV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 04:22:21 -0400
Received: by mail-ot1-f53.google.com with SMTP id 66-20020a9d02c80000b02903615edf7c1aso10007789otl.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 01:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uKKGjhbeg0B0pKWCQNCe7um9AkbBnP2WvySTEIvvkOk=;
        b=Uhis+g582+5K2zRjimIe24IVA3XkBcXb7RMCMBxQBe2VQLc44N9mD+KyQQsxIlKEp/
         +ePMaEu1IoqYc5jXeO2IKw1tUiMcEx/t1fdYO15cFz7minxO0IqjHkeyJWTNi8ZZ0shO
         OkfrOkGGvtQKL/wUo6ZanBpClCgKjflVY1Uz4CnBi+NaYM0Ya4VyqewQI1WxAjACLmk7
         OiSP4rY1i+njCUuiR4yDoBAw4EDKMPUMPuAsDP0qyZNM7v6GPtVGfBrIuRqR/Ig1u3Mf
         uiy+V3kzJDYTphulSz0pgVmYNIaBONTlw2U/WoaqoSxComtJAYE1Gl39chUogeZrwjcb
         M1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uKKGjhbeg0B0pKWCQNCe7um9AkbBnP2WvySTEIvvkOk=;
        b=JOMkEW9bFoptnJIEkIFBsleOk5qTQTSQER0k3GFoxyOSk/61Bxa6Lb3SYnsB2WpnZu
         EKWOwfUbg0ICLQcPtVN3uxlCfCxk8IZqTs1HlqqV6KtuK286w2pr8WmNpLSai/oax9FL
         oD25qiYVM5q8hfgfjPkJ3N3qDft1uAkUl7SpmX9MZcVH5HxSgxZQe2Fe2Pe/VNxZaAY6
         E9xwYV+kLKVdwh5j8uHcu1deOb9ArEaOKC68eR4M/D9xosi4Pk3jSQxhAbTsxocSCUJ6
         SQ9popveSGIxrOvjnEvZ4vSoGnPZZ9pBQfacFZaZYGHp5twY3d50XwkmakKMyCj1Hdyy
         Vt7A==
X-Gm-Message-State: AOAM532kNL1prcOzcUJ/Q1n0d7R+ZnXOoP0zw2vDxHE5nwOXl91Cso/6
        VZgsZ9pd+LU3qblExnhn5WMLo89Dj6igC/ZZdKjk8g==
X-Google-Smtp-Source: ABdhPJxBDo0O2EeYl93hlJpqgDDaLnFsFjvBy49fSG3rWvzSl1xzv0jzJYQ2C0W9+Fo8I8zDFQzfqAdwA3kAkUvKCNU=
X-Received: by 2002:a9d:1726:: with SMTP id i38mr11907743ota.51.1623658758080;
 Mon, 14 Jun 2021 01:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-9-bhupesh.sharma@linaro.org> <YMLJsieGd+G+/kxK@builder.lan>
In-Reply-To: <YMLJsieGd+G+/kxK@builder.lan>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 14 Jun 2021 13:49:07 +0530
Message-ID: <CAH=2NtxHXi1nduzRtVZA5YfMjWeCxPCC-y6gwTbT5nYH+OxqGw@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: sa8155p-adp: Add base dts file
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Bjorn,

On Fri, 11 Jun 2021 at 07:55, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:
>
> > Add base DTS file for sa8155p-adp and enable boot to console,
>
> Please spell out "sa8155-adp", i.e. "Add base DTS for SA8155p Automotive
> Development Platform."

Ok, will do.

> > tlmm reserved range and also include pmic file(s).
> >
> > SA8155p-adp board is based on sm8150 Qualcomm Snapdragon SoC.
> >
>
> It's not based on sm8150, it's based on sa8155p, so let's express this
> as "The SA8155p platform is similar to the SM8150, so use this as base
> for now", to document why we decided to do this.
>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-gpio@vger.kernel.org
> > Cc: bhupesh.linux@gmail.com
>
> This would go into the git history as "I specifically asked for input
> from these people", so please keep this list shorter (but for a change
> like this it's probably better to omit it completely)

Ok, will keep it shorter for future series.

> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile        |   1 +
> >  arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 363 +++++++++++++++++++++++
> >  2 files changed, 364 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 456502aeee49..38d3a4728871 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -71,6 +71,7 @@ dtb-$(CONFIG_ARCH_QCOM)     += sdm845-xiaomi-beryllium.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sdm850-lenovo-yoga-c630.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sm8150-hdk.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sm8150-mtp.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      += sa8155p-adp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sm8250-hdk.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sm8250-mtp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sm8350-hdk.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> > new file mode 100644
> > index 000000000000..470d740e060a
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> > @@ -0,0 +1,363 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2021, Linaro Limited
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include "sm8150.dtsi"
> > +#include "pmm8155au_1.dtsi"
> > +#include "pmm8155au_2.dtsi"
> > +
> > +/ {
> > +     model = "Qualcomm Technologies, Inc. SA8155P ADP";
> > +     compatible = "qcom,sa8155p-adp";
> > +
> > +     aliases {
> > +             serial0 = &uart2;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path = "serial0:115200n8";
> > +     };
> > +
> > +     vreg_3p3: vreg_3p3_regulator {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vreg_3p3";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +     };
> > +
> > +     /*
> > +      * Apparently RPMh does not provide support for PM8150 S4 because it
> > +      * is always-on; model it as a fixed regulator.
> > +      */
>
> You can reduce this to
>
>         /* S4A is always on and not controllable through RPMh */
>

Ok, I wanted to keep it similar to the comment we have for sm815o-mtp,
but this is fine as well.

> > +     vreg_s4a_1p8: smps4 {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vreg_s4a_1p8";
> > +
> > +             regulator-min-microvolt = <1800000>;
> > +             regulator-max-microvolt = <1800000>;
> > +
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +
> > +             vin-supply = <&vreg_3p3>;
> > +     };
> > +};
> > +
> > +&apps_rsc {
> > +     pmm8155au-1-rpmh-regulators {
> > +             compatible = "qcom,pmm8155au-1-rpmh-regulators";
> > +             qcom,pmic-id = "a";
> > +
> > +             vdd-s1-supply = <&vreg_3p3>;
> > +             vdd-s2-supply = <&vreg_3p3>;
> > +             vdd-s3-supply = <&vreg_3p3>;
> > +             vdd-s4-supply = <&vreg_3p3>;
> > +             vdd-s5-supply = <&vreg_3p3>;
> > +             vdd-s6-supply = <&vreg_3p3>;
> > +             vdd-s7-supply = <&vreg_3p3>;
> > +             vdd-s8-supply = <&vreg_3p3>;
> > +             vdd-s9-supply = <&vreg_3p3>;
> > +             vdd-s10-supply = <&vreg_3p3>;
> > +
> > +             vdd-l1-l8-l11-supply = <&vreg_s6a_0p92>;
> > +             vdd-l2-l10-supply = <&vreg_3p3>;
> > +             vdd-l3-l4-l5-l18-supply = <&vreg_s6a_0p92>;
> > +             vdd-l6-l9-supply = <&vreg_s6a_0p92>;
> > +             vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
> > +             vdd-l13-l16-l17-supply = <&vreg_3p3>;
> > +
> > +             vreg_s5a_2p04: smps5 {
> > +                     regulator-min-microvolt = <1904000>;
> > +                     regulator-max-microvolt = <2000000>;
> > +             };
> > +
> > +             vreg_s6a_0p92: smps6 {
> > +                     regulator-min-microvolt = <920000>;
> > +                     regulator-max-microvolt = <1128000>;
> > +             };
> > +
> > +             vdda_wcss_pll:
>
> This is the "label" of the pad which the regulator typically is
> connected to (rather than a denotion of which regulator it is). So even
> though we have these in some of the other boards, I would prefer if you
> skip them and only use the vreg_xyz_abc variant.

Ok.

> > +             vreg_l1a_0p752: ldo1 {
> > +                     regulator-min-microvolt = <752000>;
> > +                     regulator-max-microvolt = <752000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> [..]
> > +&usb_1_dwc3 {
> > +     dr_mode = "peripheral";
>
> We have enough pieces to handle mode switching on this platform, but as
> discussed, lets leave it as "peripheral" until your local setup is back
> online.

Sure, in later patches, I can try playing more with this configuration.

Regards,
Bhupesh
