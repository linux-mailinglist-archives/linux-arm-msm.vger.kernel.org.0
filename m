Return-Path: <linux-arm-msm+bounces-32807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7D298ACC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 21:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06A8B2812A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 19:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EA7199930;
	Mon, 30 Sep 2024 19:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UincmWov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059C515E97;
	Mon, 30 Sep 2024 19:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727724225; cv=none; b=scR9k+6UHaHMKdOI1ClbbqgWoXiOBtAium8ewe8u0raydcZhWscPSsCWodIIR9fLG/epBFYuXqhJAI5MuaV8dsb1lZolUK9j/1cHipeE6kgY5y0T0DksCkf7OJ0kQmiR4NHHwnSeYBBoS3r/u8Xtayx8roVaZxcEZR9pBbsjPy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727724225; c=relaxed/simple;
	bh=x8NnN2ZxkGPpyXWMWlBwageLKxFeZaTLsDUe2v8S9Hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2BezE4prb5tFuIVEGh4eu8KVLuiHKmznYG9RLJQrfGeJeYrZrI/qWafAg2VKun/R2MOWYA6pty3/qiuHgNvS8rYPhdSIXNfFitmRnZ4HvIeK+FvMUhmy6E3qD5VV+9yMNiOaAuBHj8tg57rG3EB9IhWdlWM2xuRW5KkIQHkivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UincmWov; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37cd831ab06so1673379f8f.0;
        Mon, 30 Sep 2024 12:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727724221; x=1728329021; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qX3b1oBcH7dhllUmtQLLIfllaVJ91FdjHmLVaueeXOQ=;
        b=UincmWovoRN6KjoSQqzf6CTi37jl34L7UQP3rRamg8FyAr0eKNkq2Ejorz8RyDAM8L
         eZsmTD0I9MKYLNolBTaPxC9Vs68g3Fx6k+6FsRrW6gn3TeYA1jvO8ymV8XkshQJeX+M4
         FUNeoT+4vB3TJwlpmNFIfrPK/EkzP0iWm5a8v+k1N3FI0z6G4mfjJshGrJCNnptZLr8O
         pRFTir7mYJlpYE0rwQnasggnU6wOv1j9hPD5pkL95c403DOxjmvmMdoILC+IAs0yDHXW
         5C/oZ7Hgn7yDlnERoBVsmoLrNvX0MYzjbHvX0jw4QsYUeQccSm6PUnH7cVFwk6S+LIYf
         IfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727724221; x=1728329021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qX3b1oBcH7dhllUmtQLLIfllaVJ91FdjHmLVaueeXOQ=;
        b=K90gwO7bM0y29LXGJyjQadodbvWuUg204/g9II+kaQ6ZUbEe0rQiqyvk4DwEohYCMp
         4pww3mSv4oK6Z2wtRfG463V6oB/sHRje/7XRFbXH7g7AC+A04Ry/9GA8ajarEspIsUoB
         LXTku6DD291CIGU5op3WB6J8Fmg8DenzLjzU4tXShh5TYxkL9Kg/xXVDhmFWkXKzb6FI
         lcdcwroVHjhyKWbrWX8gFTqT6cl7Fx+vH2LlEGthjJV/vvyCyfxViymkUNtAFjYnWVqI
         nx6oJvCVWOYzJnQQan9wRxV6Prc5Emhl44vlAw2f3d1t22s8TsDIqFJFGDCUYEEkzJHk
         Pxmg==
X-Forwarded-Encrypted: i=1; AJvYcCVwCpGgdRM+B6ChvVfPzpw0LgLzOO3VOj0/HO7U0YYiNK7T1I4hNlDv//0zuvU4nQSDffjCTfFEm5+ejYlY@vger.kernel.org, AJvYcCXFhGQVx8HTpQLDCU2Qo5RyNkj8lUFgpEwYL9ocsGjEqJKAmFLwEIkB4CHJ96aNboUrmYHA0Cdjm1H7tXpvNg==@vger.kernel.org, AJvYcCXR0qEB1oDpSiu+6+p9roBILKEcnEBoKeq1nwmHsqxD4m+jXGTwPzUyj3mJQ3IV4SyAuuRLzFf3I4EW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw22RBlyjgS8oYwEfevOkPEudO1EuFPvxLjke34R5SLKbJxOlr3
	a28hXMjuGHf0py8kzUK/7aBBvHP+AnpDNoZ+bPCtvU1aR+Tc6WyetlYtlGfLhOt567j/s00sTC0
	hrbqDOKJuU8CFiC5+WAHGJF0Wkg==
X-Google-Smtp-Source: AGHT+IEMX0DX1g2dSpYDstDlnS0OJAEWl/hJeMon2mDNTtJNiLhMd+ogVLfNwQVC7wSV9OzqTvCMVqxorUIgtRgn8nQ=
X-Received: by 2002:a5d:42c6:0:b0:374:b9d7:5120 with SMTP id
 ffacd0b85a97d-37cd5aa9c5fmr5719935f8f.23.1727724220744; Mon, 30 Sep 2024
 12:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240921163455.12577-1-alex.vinarskis@gmail.com>
 <20240921163455.12577-4-alex.vinarskis@gmail.com> <f9997a19-5aae-41c9-9ca2-c847d8071230@gmail.com>
In-Reply-To: <f9997a19-5aae-41c9-9ca2-c847d8071230@gmail.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 30 Sep 2024 21:23:40 +0200
Message-ID: <CAMcHhXohz6kquH_JT9eAKMntxxyjDt+oZUB_kfAO840oJ5=LPQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based Dell
 XPS 13 9345
To: Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurentiu.Tudor1@dell.com, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Peter de Kraker <peterdekraker@umito.nl>, bryan_kemp@dell.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Sept 2024 at 20:26, Laurentiu Tudor
<tudor.laurentiu.oss@gmail.com> wrote:
>
> Hi Alex,
>
> Thanks for this! Comment inline.
>
> On 9/21/24 19:33, Aleksandrs Vinarskis wrote:
> > Initial support for Dell XPS 9345 13" 2024 (Tributo) based on X1E80100.
> >
> > Working:
> > * Touchpad
> > * Keyboard (only post suspend&resume, i2c-hid patch WIP)
> > * eDP, with brightness control
> > * NVME
> > * USB Type-C ports in USB2/USB3 (one orientation)
> > * WiFi
> > * GPU/aDSP/cDSP firmware loading (requires binaries from Windows)
> > * Lid switch
> > * Sleep/suspend, nothing visibly broken on resume
> >
> > Not working:
> > * Speakers (WIP, pin guessing, x4 WSA8845)
> > * Microphones (WIP, pin guessing)
> > * Fingerprint Reader (WIP, USB MP with ptn3222)
> > * USB as DP/USB3 (WIP, PS8830 based)
> > * Camera
> > * Battery Info
> >
> > Should be working, but cannot be tested due to lack of hw:
> > * Higher res OLED, higher res IPS panels
> > * Touchscreen
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > ---
> >   arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >   .../dts/qcom/x1e80100-dell-tributo-13.dts     | 860 ++++++++++++++++++
>
>
> Could you please use the marketing name for the device tree file name &
> machine compatible, e.g. "x1e80100-dell-xps13-9345.dts" for the dts file
> and "dell,xps13-9345" for the compat? I'm thinking that this will help
> people to identify it more easily.

Hi,

Even though I agree that it may be easier to identify for a
non-developer, I am a bit skeptical as Dell has a pretty weird naming
convention which sometimes results in the name being non-unique.
In particular case - 9345 - 9 stands for XPS series, 3 stands for 13",
and 45 would typically be the last digit of year + 0 (so 40), but with
the introduction of last year's ''13 Plus"series they added a 5. At
present, this is unique, however in 10 years it may not be.

I have recently hit this issue when working on Dell XPS 15" 2024
(9530), which has the same model number as Dell XPS 15" 2013 and led
to huge confusions. Only way to distinguish them is by codename
('fiorano' for the newer one), or using a complete name including the
year... The codename on the other hand is easily searchable both in
the source code and online.

I tried to browse the source code for existing notation, but didn't
find anything strongly supporting one or another way, so decided to
follow Microsoft Surface's example with codenames ('romulus').
Codenaming is also imperfect though, as in Dell's case it typically
refers to chassis, rather than _the_ particular device, which
typically lasts several years. Typically throughout chassis generation
internals stay +/- the same, but we can't know if any of the changes
would be breaking. Perhaps then, `x1e80100-dell-tributo-9345` and
`dell,tributo-9345` respectively, as this would be the shortest yet
most complete description? 'Tributo' already implies its XPS 13" and
chassis variation (touchar, hidden trackpad etc etc), '9345' implies
XPS 13" of 2024 (?) and in combination with chassis variant pinpoints
the model.
Otherwise, if it's strongly desired to use marketing names it can be
reduced down to `x1e80100-dell-9345.dts` and `dell,9345` altogether as
9345 implies it being both 'XPS' series and 13", and we can hope that
by 2034 Dell won't repeat the same mistake with naming. Curious to
hear maintainers' opinions as well.

P.S. I've sent the V3 version of the series, it probably makes sense
to move this conversation there for visibility.

Alex

>
> ---
> Thanks & Best Regards, Laurentiu
>
> >   2 files changed, 861 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
>
>
>
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index ae002c7cf126..111c589d6bae 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -271,6 +271,7 @@ dtb-$(CONFIG_ARCH_QCOM)   += sm8650-qrd.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += x1e78100-lenovo-thinkpad-t14s.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-asus-vivobook-s15.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-crd.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      += x1e80100-dell-tributo-13.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-lenovo-yoga-slim7x.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-microsoft-romulus13.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-microsoft-romulus15.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
> > new file mode 100644
> > index 000000000000..ec04b64f9558
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
> > @@ -0,0 +1,860 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > + * Copyright (c) 2024 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/gpio-keys.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > +
> > +#include "x1e80100.dtsi"
> > +#include "x1e80100-pmics.dtsi"
> > +
> > +/ {
> > +     model = "Dell XPS 13 9345";
> > +     compatible = "dell,tributo-13", "qcom,x1e80100";
> > +     chassis-type = "laptop";
> > +
> > +     gpio-keys {
> > +             compatible = "gpio-keys";
> > +
> > +             pinctrl-0 = <&hall_int_n_default>;
> > +             pinctrl-names = "default";
> > +
> > +             switch-lid {
> > +                     gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
> > +                     linux,input-type = <EV_SW>;
> > +                     linux,code = <SW_LID>;
> > +                     wakeup-source;
> > +                     wakeup-event-action = <EV_ACT_DEASSERTED>;
> > +             };
> > +     };
> > +
> > +     leds {
> > +             compatible = "gpio-leds";
> > +
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&cam_indicator_en>;
> > +
> > +             led-camera-indicator {
> > +                     label = "white:camera-indicator";
> > +                     function = LED_FUNCTION_INDICATOR;
> > +                     color = <LED_COLOR_ID_WHITE>;
> > +                     gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> > +                     linux,default-trigger = "none";
> > +                     default-state = "off";
> > +                     /* Reuse as a panic indicator until we get a "camera on" trigger */
> > +                     panic-indicator;
> > +             };
> > +     };
> > +
> > +     pmic-glink {
> > +             compatible = "qcom,x1e80100-pmic-glink",
> > +                          "qcom,sm8550-pmic-glink",
> > +                          "qcom,pmic-glink";
> > +             orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> > +                                 <&tlmm 123 GPIO_ACTIVE_HIGH>;
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             /* Right-side USB Type-C port */
> > +             connector@0 {
> > +                     compatible = "usb-c-connector";
> > +                     reg = <0>;
> > +                     power-role = "dual";
> > +                     data-role = "dual";
> > +
> > +                     ports {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             port@0 {
> > +                                     reg = <0>;
> > +
> > +                                     pmic_glink_ss0_hs_in: endpoint {
> > +                                             remote-endpoint = <&usb_1_ss0_dwc3_hs>;
> > +                                     };
> > +                             };
> > +
> > +                             port@1 {
> > +                                     reg = <1>;
> > +
> > +                                     pmic_glink_ss0_ss_in: endpoint {
> > +                                             remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +
> > +             /* Left-side USB Type-C port */
> > +             connector@1 {
> > +                     compatible = "usb-c-connector";
> > +                     reg = <1>;
> > +                     power-role = "dual";
> > +                     data-role = "dual";
> > +
> > +                     ports {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             port@0 {
> > +                                     reg = <0>;
> > +
> > +                                     pmic_glink_ss1_hs_in: endpoint {
> > +                                             remote-endpoint = <&usb_1_ss1_dwc3_hs>;
> > +                                     };
> > +                             };
> > +
> > +                             port@1 {
> > +                                     reg = <1>;
> > +
> > +                                     pmic_glink_ss1_ss_in: endpoint {
> > +                                             remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     reserved-memory {
> > +             linux,cma {
> > +                     compatible = "shared-dma-pool";
> > +                     size = <0x0 0x8000000>;
> > +                     reusable;
> > +                     linux,cma-default;
> > +             };
> > +     };
> > +
> > +     vreg_edp_3p3: regulator-edp-3p3 {
> > +             compatible = "regulator-fixed";
> > +
> > +             regulator-name = "VREG_EDP_3P3";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +
> > +             gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +
> > +             pinctrl-0 = <&edp_reg_en>;
> > +             pinctrl-names = "default";
> > +
> > +             regulator-boot-on;
> > +     };
> > +
> > +     vreg_nvme: regulator-nvme {
> > +             compatible = "regulator-fixed";
> > +
> > +             regulator-name = "VREG_NVME_3P3";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +
> > +             gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +
> > +             pinctrl-0 = <&nvme_reg_en>;
> > +             pinctrl-names = "default";
> > +     };
> > +
> > +     vreg_vph_pwr: regulator-vph-pwr {
> > +             compatible = "regulator-fixed";
> > +
> > +             regulator-name = "vph_pwr";
> > +             regulator-min-microvolt = <3700000>;
> > +             regulator-max-microvolt = <3700000>;
> > +
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +     };
> > +};
> > +
> > +&apps_rsc {
> > +     regulators-0 {
> > +             compatible = "qcom,pm8550-rpmh-regulators";
> > +             qcom,pmic-id = "b";
> > +             vdd-bob1-supply = <&vreg_vph_pwr>;
> > +             vdd-bob2-supply = <&vreg_vph_pwr>;
> > +             vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
> > +             vdd-l2-l13-l14-supply = <&vreg_bob1>;
> > +             vdd-l5-l16-supply = <&vreg_bob1>;
> > +             vdd-l6-l7-supply = <&vreg_bob2>;
> > +             vdd-l8-l9-supply = <&vreg_bob1>;
> > +             vdd-l12-supply = <&vreg_s5j_1p2>;
> > +             vdd-l15-supply = <&vreg_s4c_1p8>;
> > +             vdd-l17-supply = <&vreg_bob2>;
> > +
> > +             vreg_bob1: bob1 {
> > +                     regulator-name = "vreg_bob1";
> > +                     regulator-min-microvolt = <3008000>;
> > +                     regulator-max-microvolt = <3960000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_bob2: bob2 {
> > +                     regulator-name = "vreg_bob2";
> > +                     regulator-min-microvolt = <2504000>;
> > +                     regulator-max-microvolt = <3008000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l2b_3p0: ldo2 {
> > +                     regulator-name = "vreg_l2b_3p0";
> > +                     regulator-min-microvolt = <3072000>;
> > +                     regulator-max-microvolt = <3072000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l4b_1p8: ldo4 {
> > +                     regulator-name = "vreg_l4b_1p8";
> > +                     regulator-min-microvolt = <1800000>;
> > +                     regulator-max-microvolt = <1800000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l6b_1p8: ldo6 {
> > +                     regulator-name = "vreg_l6b_1p8";
> > +                     regulator-min-microvolt = <1800000>;
> > +                     regulator-max-microvolt = <2960000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l8b_3p0: ldo8 {
> > +                     regulator-name = "vreg_l8b_3p0";
> > +                     regulator-min-microvolt = <3072000>;
> > +                     regulator-max-microvolt = <3072000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l9b_2p9: ldo9 {
> > +                     regulator-name = "vreg_l9b_2p9";
> > +                     regulator-min-microvolt = <2960000>;
> > +                     regulator-max-microvolt = <2960000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l12b_1p2: ldo12 {
> > +                     regulator-name = "vreg_l12b_1p2";
> > +                     regulator-min-microvolt = <1200000>;
> > +                     regulator-max-microvolt = <1200000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l13b_3p0: ldo13 {
> > +                     regulator-name = "vreg_l13b_3p0";
> > +                     regulator-min-microvolt = <3072000>;
> > +                     regulator-max-microvolt = <3072000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l14b_3p0: ldo14 {
> > +                     regulator-name = "vreg_l14b_3p0";
> > +                     regulator-min-microvolt = <3072000>;
> > +                     regulator-max-microvolt = <3072000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l15b_1p8: ldo15 {
> > +                     regulator-name = "vreg_l15b_1p8";
> > +                     regulator-min-microvolt = <1800000>;
> > +                     regulator-max-microvolt = <1800000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l17b_2p5: ldo17 {
> > +                     regulator-name = "vreg_l17b_2p5";
> > +                     regulator-min-microvolt = <2504000>;
> > +                     regulator-max-microvolt = <2504000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +     };
> > +
> > +     regulators-1 {
> > +             compatible = "qcom,pm8550ve-rpmh-regulators";
> > +             qcom,pmic-id = "c";
> > +             vdd-l1-supply = <&vreg_s5j_1p2>;
> > +             vdd-l2-supply = <&vreg_s1f_0p7>;
> > +             vdd-l3-supply = <&vreg_s1f_0p7>;
> > +
> > +             vreg_s4c_1p8: smps4 {
> > +                     regulator-name = "vreg_s4c_1p8";
> > +                     regulator-min-microvolt = <1856000>;
> > +                     regulator-max-microvolt = <2000000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l1c_1p2: ldo1 {
> > +                     regulator-name = "vreg_l1c_1p2";
> > +                     regulator-min-microvolt = <1200000>;
> > +                     regulator-max-microvolt = <1200000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l2c_0p8: ldo2 {
> > +                     regulator-name = "vreg_l2c_0p8";
> > +                     regulator-min-microvolt = <880000>;
> > +                     regulator-max-microvolt = <880000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l3c_0p9: ldo3 {
> > +                     regulator-name = "vreg_l3c_0p9";
> > +                     regulator-min-microvolt = <920000>;
> > +                     regulator-max-microvolt = <920000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +     };
> > +
> > +     regulators-2 {
> > +             compatible = "qcom,pmc8380-rpmh-regulators";
> > +             qcom,pmic-id = "d";
> > +             vdd-l1-supply = <&vreg_s1f_0p7>;
> > +             vdd-l2-supply = <&vreg_s1f_0p7>;
> > +             vdd-l3-supply = <&vreg_s4c_1p8>;
> > +             vdd-s1-supply = <&vreg_vph_pwr>;
> > +
> > +             vreg_l1d_0p8: ldo1 {
> > +                     regulator-name = "vreg_l1d_0p8";
> > +                     regulator-min-microvolt = <880000>;
> > +                     regulator-max-microvolt = <880000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l2d_0p9: ldo2 {
> > +                     regulator-name = "vreg_l2d_0p9";
> > +                     regulator-min-microvolt = <912000>;
> > +                     regulator-max-microvolt = <912000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l3d_1p8: ldo3 {
> > +                     regulator-name = "vreg_l3d_1p8";
> > +                     regulator-min-microvolt = <1800000>;
> > +                     regulator-max-microvolt = <1800000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +     };
> > +
> > +     regulators-3 {
> > +             compatible = "qcom,pmc8380-rpmh-regulators";
> > +             qcom,pmic-id = "e";
> > +             vdd-l2-supply = <&vreg_s1f_0p7>;
> > +             vdd-l3-supply = <&vreg_s5j_1p2>;
> > +
> > +             vreg_l2e_0p8: ldo2 {
> > +                     regulator-name = "vreg_l2e_0p8";
> > +                     regulator-min-microvolt = <880000>;
> > +                     regulator-max-microvolt = <880000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l3e_1p2: ldo3 {
> > +                     regulator-name = "vreg_l3e_1p2";
> > +                     regulator-min-microvolt = <1200000>;
> > +                     regulator-max-microvolt = <1200000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +     };
> > +
> > +     regulators-4 {
> > +             compatible = "qcom,pmc8380-rpmh-regulators";
> > +             qcom,pmic-id = "f";
> > +             vdd-l1-supply = <&vreg_s5j_1p2>;
> > +             vdd-l2-supply = <&vreg_s5j_1p2>;
> > +             vdd-l3-supply = <&vreg_s5j_1p2>;
> > +             vdd-s1-supply = <&vreg_vph_pwr>;
> > +
> > +             vreg_s1f_0p7: smps1 {
> > +                     regulator-name = "vreg_s1f_0p7";
> > +                     regulator-min-microvolt = <700000>;
> > +                     regulator-max-microvolt = <1100000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +     };
> > +
> > +     regulators-6 {
> > +             compatible = "qcom,pm8550ve-rpmh-regulators";
> > +             qcom,pmic-id = "i";
> > +             vdd-l1-supply = <&vreg_s4c_1p8>;
> > +             vdd-l2-supply = <&vreg_s5j_1p2>;
> > +             vdd-l3-supply = <&vreg_s1f_0p7>;
> > +             vdd-s1-supply = <&vreg_vph_pwr>;
> > +             vdd-s2-supply = <&vreg_vph_pwr>;
> > +
> > +             vreg_s1i_0p9: smps1 {
> > +                     regulator-name = "vreg_s1i_0p9";
> > +                     regulator-min-microvolt = <900000>;
> > +                     regulator-max-microvolt = <920000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_s2i_1p0: smps2 {
> > +                     regulator-name = "vreg_s2i_1p0";
> > +                     regulator-min-microvolt = <1000000>;
> > +                     regulator-max-microvolt = <1100000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l1i_1p8: ldo1 {
> > +                     regulator-name = "vreg_l1i_1p8";
> > +                     regulator-min-microvolt = <1800000>;
> > +                     regulator-max-microvolt = <1800000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l2i_1p2: ldo2 {
> > +                     regulator-name = "vreg_l2i_1p2";
> > +                     regulator-min-microvolt = <1200000>;
> > +                     regulator-max-microvolt = <1200000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l3i_0p8: ldo3 {
> > +                     regulator-name = "vreg_l3i_0p8";
> > +                     regulator-min-microvolt = <880000>;
> > +                     regulator-max-microvolt = <880000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +     };
> > +
> > +     regulators-7 {
> > +             compatible = "qcom,pm8550ve-rpmh-regulators";
> > +             qcom,pmic-id = "j";
> > +             vdd-l1-supply = <&vreg_s1f_0p7>;
> > +             vdd-l2-supply = <&vreg_s5j_1p2>;
> > +             vdd-l3-supply = <&vreg_s1f_0p7>;
> > +             vdd-s5-supply = <&vreg_vph_pwr>;
> > +
> > +             vreg_s5j_1p2: smps5 {
> > +                     regulator-name = "vreg_s5j_1p2";
> > +                     regulator-min-microvolt = <1256000>;
> > +                     regulator-max-microvolt = <1304000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l1j_0p9: ldo1 {
> > +                     regulator-name = "vreg_l1j_0p9";
> > +                     regulator-min-microvolt = <912000>;
> > +                     regulator-max-microvolt = <912000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l2j_1p2: ldo2 {
> > +                     regulator-name = "vreg_l2j_1p2";
> > +                     regulator-min-microvolt = <1256000>;
> > +                     regulator-max-microvolt = <1256000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l3j_0p8: ldo3 {
> > +                     regulator-name = "vreg_l3j_0p8";
> > +                     regulator-min-microvolt = <880000>;
> > +                     regulator-max-microvolt = <880000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +     };
> > +};
> > +
> > +&gpu {
> > +     status = "okay";
> > +
> > +     zap-shader {
> > +             firmware-name = "qcom/x1e80100/dell/tributo/qcdxkmsuc8380.mbn";
> > +     };
> > +};
> > +
> > +&i2c0 {
> > +     clock-frequency = <400000>;
> > +     status = "okay";
> > +
> > +     keyboard@5 {
> > +             compatible = "hid-over-i2c";
> > +             reg = <0x5>;
> > +
> > +             hid-descr-addr = <0x20>;
> > +             interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +             pinctrl-0 = <&kybd_default>;
> > +             pinctrl-names = "default";
> > +
> > +             wakeup-source;
> > +     };
> > +};
> > +
> > +&i2c3 {
> > +     clock-frequency = <400000>;
> > +     status = "disabled";
> > +     /* PS8830 Retimer @0x8 */
> > +     /* Unknown device @0x9 */
> > +};
> > +
> > +&i2c5 {
> > +     clock-frequency = <100000>;
> > +     status = "disabled";
> > +     /* Unknown device @0x3b */
> > +};
> > +
> > +&i2c7 {
> > +     clock-frequency = <400000>;
> > +     status = "disabled";
> > +     /* PS8830 Retimer @0x8 */
> > +     /* Unknown device @0x9 */
> > +};
> > +
> > +&i2c8 {
> > +     clock-frequency = <400000>;
> > +
> > +     status = "okay";
> > +
> > +     touchscreen@0 {
> > +             compatible = "hid-over-i2c";
> > +             reg = <0x0>;
> > +
> > +             hid-descr-addr = <0x1>;
> > +             interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +             pinctrl-0 = <&ts0_default>;
> > +             pinctrl-names = "default";
> > +     };
> > +};
> > +
> > +&i2c9 {
> > +     clock-frequency = <400000>;
> > +     status = "disabled";
> > +     /* USB3 retimer device @0x4f */
> > +};
> > +
> > +&i2c17 {
> > +     clock-frequency = <400000>;
> > +     status = "okay";
> > +
> > +     touchpad@2c {
> > +             compatible = "hid-over-i2c";
> > +             reg = <0x2c>;
> > +
> > +             hid-descr-addr = <0x20>;
> > +             interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +             pinctrl-0 = <&tpad_default>;
> > +             pinctrl-names = "default";
> > +
> > +             wakeup-source;
> > +     };
> > +};
> > +
> > +&mdss {
> > +     status = "okay";
> > +};
> > +
> > +&mdss_dp3 {
> > +     compatible = "qcom,x1e80100-dp";
> > +     /delete-property/ #sound-dai-cells;
> > +
> > +     status = "okay";
> > +
> > +     aux-bus {
> > +             panel {
> > +                     /* 1920x1200 IPS panel is SHP1593, PNP09FF compatible */
> > +                     compatible = "edp-panel";
> > +                     power-supply = <&vreg_edp_3p3>;
> > +
> > +                     port {
> > +                             edp_panel_in: endpoint {
> > +                                     remote-endpoint = <&mdss_dp3_out>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     ports {
> > +             port@1 {
> > +                     reg = <1>;
> > +
> > +                     mdss_dp3_out: endpoint {
> > +                             data-lanes = <0 1 2 3>;
> > +                             link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > +
> > +                             remote-endpoint = <&edp_panel_in>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&mdss_dp3_phy {
> > +     vdda-phy-supply = <&vreg_l3j_0p8>;
> > +     vdda-pll-supply = <&vreg_l2j_1p2>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&pcie4 {
> > +     perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> > +     wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> > +
> > +     pinctrl-0 = <&pcie4_default>;
> > +     pinctrl-names = "default";
> > +
> > +     status = "okay";
> > +};
> > +
> > +&pcie4_phy {
> > +     vdda-phy-supply = <&vreg_l3i_0p8>;
> > +     vdda-pll-supply = <&vreg_l3e_1p2>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&pcie6a {
> > +     perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> > +     wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> > +
> > +     vddpe-3v3-supply = <&vreg_nvme>;
> > +
> > +     pinctrl-0 = <&pcie6a_default>;
> > +     pinctrl-names = "default";
> > +
> > +     status = "okay";
> > +};
> > +
> > +&pcie6a_phy {
> > +     vdda-phy-supply = <&vreg_l1d_0p8>;
> > +     vdda-pll-supply = <&vreg_l2j_1p2>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&qupv3_0 {
> > +     status = "okay";
> > +};
> > +
> > +&qupv3_1 {
> > +     status = "okay";
> > +};
> > +
> > +&qupv3_2 {
> > +     status = "okay";
> > +};
> > +
> > +&remoteproc_adsp {
> > +     firmware-name = "qcom/x1e80100/dell/tributo/qcadsp8380.mbn",
> > +                     "qcom/x1e80100/dell/tributo/adsp_dtbs.elf";
> > +
> > +     status = "okay";
> > +};
> > +
> > +&remoteproc_cdsp {
> > +     firmware-name = "qcom/x1e80100/dell/tributo/qccdsp8380.mbn",
> > +                     "qcom/x1e80100/dell/tributo/cdsp_dtbs.elf";
> > +
> > +     status = "okay";
> > +};
> > +
> > +&smb2360_0_eusb2_repeater {
> > +     vdd18-supply = <&vreg_l3d_1p8>;
> > +     vdd3-supply = <&vreg_l2b_3p0>;
> > +};
> > +
> > +&smb2360_1_eusb2_repeater {
> > +     vdd18-supply = <&vreg_l3d_1p8>;
> > +     vdd3-supply = <&vreg_l14b_3p0>;
> > +};
> > +
> > +&tlmm {
> > +     gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
> > +                            <76 4>,  /* SPI19 (TZ Protected) */
> > +                            <238 1>; /* UFS Reset */
> > +
> > +     cam_indicator_en: cam-indicator-en-state {
> > +             pins = "gpio110";
> > +             function = "gpio";
> > +             drive-strength = <2>;
> > +             bias-disable;
> > +     };
> > +
> > +     edp_reg_en: edp-reg-en-state {
> > +             pins = "gpio70";
> > +             function = "gpio";
> > +             drive-strength = <16>;
> > +             bias-disable;
> > +     };
> > +
> > +     hall_int_n_default: hall-int-n-state {
> > +             pins = "gpio92";
> > +             function = "gpio";
> > +
> > +             bias-disable;
> > +     };
> > +
> > +     kybd_default: kybd-default-state {
> > +             pins = "gpio67";
> > +             function = "gpio";
> > +             bias-pull-up;
> > +     };
> > +
> > +     nvme_reg_en: nvme-reg-en-state {
> > +             pins = "gpio18";
> > +             function = "gpio";
> > +             drive-strength = <2>;
> > +             bias-disable;
> > +     };
> > +
> > +     pcie4_default: pcie4-default-state {
> > +             clkreq-n-pins {
> > +                     pins = "gpio147";
> > +                     function = "pcie4_clk";
> > +                     drive-strength = <2>;
> > +                     bias-pull-up;
> > +             };
> > +
> > +             perst-n-pins {
> > +                     pins = "gpio146";
> > +                     function = "gpio";
> > +                     drive-strength = <2>;
> > +                     bias-disable;
> > +             };
> > +
> > +             wake-n-pins {
> > +                     pins = "gpio148";
> > +                     function = "gpio";
> > +                     drive-strength = <2>;
> > +                     bias-pull-up;
> > +             };
> > +     };
> > +
> > +     pcie6a_default: pcie6a-default-state {
> > +             clkreq-n-pins {
> > +                     pins = "gpio153";
> > +                     function = "pcie6a_clk";
> > +                     drive-strength = <2>;
> > +                     bias-pull-up;
> > +             };
> > +
> > +             perst-n-pins {
> > +                     pins = "gpio152";
> > +                     function = "gpio";
> > +                     drive-strength = <2>;
> > +                     bias-disable;
> > +             };
> > +
> > +             wake-n-pins {
> > +                     pins = "gpio154";
> > +                     function = "gpio";
> > +                     drive-strength = <2>;
> > +                     bias-pull-up;
> > +             };
> > +     };
> > +
> > +     tpad_default: tpad-default-state {
> > +             disable-pins {
> > +                     pins = "gpio38";
> > +                     function = "gpio";
> > +                     output-high;
> > +             };
> > +
> > +             int-n-pins {
> > +                     pins = "gpio3";
> > +                     function = "gpio";
> > +                     bias-pull-up;
> > +             };
> > +
> > +             reset-n-pins {
> > +                     pins = "gpio52";
> > +                     function = "gpio";
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> > +     ts0_default: ts0-default-state {
> > +             disable-pins {
> > +                     pins = "gpio75";
> > +                     function = "gpio";
> > +                     output-high;
> > +             };
> > +
> > +             int-n-pins {
> > +                     pins = "gpio51";
> > +                     function = "gpio";
> > +                     bias-pull-up;
> > +             };
> > +
> > +             reset-n-pins {
> > +                     /* Technically should be High-Z input */
> > +                     pins = "gpio48";
> > +                     function = "gpio";
> > +                     output-low;
> > +                     drive-strength = <2>;
> > +             };
> > +     };
> > +};
> > +
> > +&uart21 {
> > +     compatible = "qcom,geni-debug-uart";
> > +     status = "okay";
> > +};
> > +
> > +&usb_1_ss0_hsphy {
> > +     vdd-supply = <&vreg_l3j_0p8>;
> > +     vdda12-supply = <&vreg_l2j_1p2>;
> > +
> > +     phys = <&smb2360_0_eusb2_repeater>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&usb_1_ss0_qmpphy {
> > +     vdda-phy-supply = <&vreg_l3e_1p2>;
> > +     vdda-pll-supply = <&vreg_l1j_0p9>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&usb_1_ss0 {
> > +     status = "okay";
> > +};
> > +
> > +&usb_1_ss0_dwc3 {
> > +     dr_mode = "host";
> > +};
> > +
> > +&usb_1_ss0_dwc3_hs {
> > +     remote-endpoint = <&pmic_glink_ss0_hs_in>;
> > +};
> > +
> > +&usb_1_ss0_qmpphy_out {
> > +     remote-endpoint = <&pmic_glink_ss0_ss_in>;
> > +};
> > +
> > +&usb_1_ss1_hsphy {
> > +     vdd-supply = <&vreg_l3j_0p8>;
> > +     vdda12-supply = <&vreg_l2j_1p2>;
> > +
> > +     phys = <&smb2360_1_eusb2_repeater>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&usb_1_ss1_qmpphy {
> > +     vdda-phy-supply = <&vreg_l3e_1p2>;
> > +     vdda-pll-supply = <&vreg_l2d_0p9>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&usb_1_ss1 {
> > +     status = "okay";
> > +};
> > +
> > +&usb_1_ss1_dwc3 {
> > +     dr_mode = "host";
> > +};
> > +
> > +&usb_1_ss1_dwc3_hs {
> > +     remote-endpoint = <&pmic_glink_ss1_hs_in>;
> > +};
> > +
> > +&usb_1_ss1_qmpphy_out {
> > +     remote-endpoint = <&pmic_glink_ss1_ss_in>;
> > +};
>

