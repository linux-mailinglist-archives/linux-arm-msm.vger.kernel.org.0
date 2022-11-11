Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4FD8625E2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 16:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233741AbiKKPUB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 10:20:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234136AbiKKPTg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 10:19:36 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F9C7B21D
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 07:19:07 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id t25so13220882ejb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 07:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yFYxsUt8J7JFyjoGzzxtslLaD/ewaDBkERXxUBqCLSg=;
        b=VQdGlhldW/8GeoluOliWmXmwXcC+nSlOEjPM8Nvh2WMSXVa69KLhNUpGTXJn9Vk/D7
         iLHOU2H09lxRXOosRu0BkP292TglEvYi6sDCJi8rHSCJ1AlYsXyKiJ25P7jzLBWja6Ih
         D0/IGqoAvnT20Otev1EIstuGjC49PyiBC6VrhzOIAf6+tQqsJOv1Y0y/PqurhytXD4qb
         SLSP06QhwIX5jw4rFzLvvqYmrdKBITtFuvP1HwbBH5miQsGugrxa6zmrphfdAhIElli3
         TDGtySGjGHDIAEoXus/vo9HvFfCYoB0MbG/kMAZGTOXobVcwOfd5VfmkJi9tvon7LyR4
         Le5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFYxsUt8J7JFyjoGzzxtslLaD/ewaDBkERXxUBqCLSg=;
        b=KEzkUIJT69tZe8stttqdK6YA1JvmXdRh6gCelQsn1V9Fovs0nHuwrrtYJ0wn5VeEll
         TxJ5RVl2+oj/Xu7RY6CvqiRy4Gd9CvvaiXTuRRGMtDZ48soEx4S2WtIaDRcDWSxbac8d
         Q+1WQ7EhjGrOiRvLXdvYk48fB0KjqVqxbFSUguuQyIrvAe/Hh0/7Hptk6bNrWswNfyeX
         crIDcffnlEX7LZbkDyp3nXcZWcwIt7MAxt+atKTOTZjWGwE7Q4/NjS7+SA3cYU39+rN4
         pf6NB/JD06PQhIDpi2BfzLfhVqqMj+AdfUqUBDo4ELZZUQbnuy3WSu2chBaUcZV2415I
         R4fA==
X-Gm-Message-State: ANoB5pnvSL930skc4g9ZBjQ24LwZV7lDPBqaZ0NDhLHP0yAsPbvemaJY
        Yhjab4rlQNv3qNJJDiJ3wU1U1kF5kjvJV8hsfzoSrw==
X-Google-Smtp-Source: AA0mqf5fs7r3Q7Hcn5cGYKrcbBrTcAMt3nlR6oESsPm8IGvQ9qSyz68bnViPR0UgeDZioWu9KPrylyB19pftcoM03mo=
X-Received: by 2002:a17:906:dc1:b0:7ae:6d3e:a02e with SMTP id
 p1-20020a1709060dc100b007ae6d3ea02emr2091354eji.626.1668179945517; Fri, 11
 Nov 2022 07:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-10-robert.foss@linaro.org> <20221028135718.4pmh6moee2wx2lpf@baldur>
In-Reply-To: <20221028135718.4pmh6moee2wx2lpf@baldur>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 11 Nov 2022 16:18:54 +0100
Message-ID: <CAG3jFyt_Aws4_aW4ocQwtAh3XwRGFK-u7BeRszjmJ7Z715dmwA@mail.gmail.com>
Subject: Re: [PATCH v1 9/9] arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc
 dsi-hdmi bridge
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        quic_kalyant@quicinc.com, swboyd@chromium.org,
        angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
        quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
        quic_jesszhan@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 28 Oct 2022 at 15:57, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Fri, Oct 28, 2022 at 02:08:12PM +0200, Robert Foss wrote:
> > The sm8350-hdk ships with the LT9611 UXC DSI/HDMI bridge chip.
> >
> > In order to toggle the board to enable the HDMI output,
> > switch #7 & #8 on the rightmost multi-switch package have
> > to be toggled to On.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 106 ++++++++++++++++++++++++
> >  1 file changed, 106 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > index 6e07feb4b3b2..6666b38b58f8 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > @@ -20,6 +20,17 @@ chosen {
> >               stdout-path = "serial0:115200n8";
> >       };
> >
> > +     hdmi-out {
> > +             compatible = "hdmi-connector";
> > +             type = "a";
> > +
> > +             port {
> > +                     hdmi_con: endpoint {
> > +                             remote-endpoint = <&lt9611_out>;
> > +                     };
> > +             };
> > +     };
> > +
> >       vph_pwr: vph-pwr-regulator {
> >               compatible = "regulator-fixed";
> >               regulator-name = "vph_pwr";
> > @@ -29,6 +40,32 @@ vph_pwr: vph-pwr-regulator {
> >               regulator-always-on;
> >               regulator-boot-on;
> >       };
> > +
> > +     lt9611_1v2: lt9611-1v2 {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "LT9611_1V2";
> > +
> > +             vin-supply = <&vph_pwr>;
> > +             regulator-min-microvolt = <1200000>;
> > +             regulator-max-microvolt = <1200000>;
> > +             gpio = <&tlmm 49 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             regulator-boot-on;
> > +             regulator-always-on;
>
> Why is this always-on?

It shouldn't be. Removing this in v2.

>
> > +     };
> > +
> > +     lt9611_3v3: lt9611-3v3 {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "LT9611_3V3";
> > +
> > +             vin-supply = <&vreg_bob>;
> > +             gpio = <&tlmm 47 GPIO_ACTIVE_HIGH>;
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +             enable-active-high;
> > +             regulator-boot-on;
> > +             regulator-always-on;
> > +     };
> >  };
> >
> >  &adsp {
> > @@ -220,6 +257,15 @@ &dispcc {
> >  &dsi0 {
> >       status = "okay";
> >       vdda-supply = <&vreg_l6b_1p2>;
> > +
> > +     ports {
> > +             port@1 {
> > +                     endpoint {
> > +                             remote-endpoint = <&lt9611_a>;
> > +                             data-lanes = <0 1 2 3>;
> > +                     };
> > +             };
> > +     };
> >  };
> >
> >  &dsi0_phy  {
> > @@ -231,6 +277,48 @@ &gpi_dma1 {
> >       status = "okay";
> >  };
> >
> > +&i2c15 {
> > +     status = "okay";
>
> Please keep status last. (Yes I see that it goes against the convention
> in this file, so let's update that at some point as well)

Ack.

>
> > +     clock-frequency = <400000>;
> > +
> > +     lt9611_codec: hdmi-bridge@2b {
> > +             compatible = "lontium,lt9611uxc";
> > +             reg = <0x2b>;
> > +             status = "okay";
>
> This is the default, you can omit it.

Ack.

>
> > +
> > +             interrupts-extended = <&tlmm 50 IRQ_TYPE_EDGE_FALLING>;
> > +             reset-gpios = <&tlmm 48 GPIO_ACTIVE_HIGH>;
> > +
> > +             vdd-supply = <&lt9611_1v2>;
> > +             vcc-supply = <&lt9611_3v3>;
> > +
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> > +
> > +             ports {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     port@0 {
> > +                             reg = <0>;
> > +
> > +                             lt9611_a: endpoint {
> > +                                     remote-endpoint = <&dsi0_out>;
> > +                             };
> > +                     };
> > +
> > +                     port@2 {
> > +                             reg = <2>;
> > +
> > +                             lt9611_out: endpoint {
> > +                                     remote-endpoint = <&hdmi_con>;
> > +                             };
> > +                     };
> > +
> > +             };
> > +     };
> > +};
> > +
> >  &mdss {
> >       status = "okay";
> >  };
> > @@ -248,6 +336,10 @@ &qupv3_id_0 {
> >       status = "okay";
> >  };
> >
> > +&qupv3_id_2 {
> > +     status = "okay";
> > +};
> > +
> >  &slpi {
> >       status = "okay";
> >       firmware-name = "qcom/sm8350/slpi.mbn";
> > @@ -544,4 +636,18 @@ usb_hub_enabled_state: usb-hub-enabled-state {
> >               drive-strength = <2>;
> >               output-low;
> >       };
> > +
> > +     lt9611_rst_pin: lt9611-rst-state {
> > +             pins = "gpio48";
> > +             function = "normal";
> > +
> > +             output-high;
> > +             input-disable;
> > +     };
> > +
> > +     lt9611_irq_pin: lt9611-irq {
>
> pinctrl state nodes should be suffixed with "-state".
>
> And you can lump the two pins into a single -state, with rst-pins and
> irq-pins as subnodes, defining the two pins.
>
> Regards,
> Bjorn
>
> > +             pins = "gpio50";
> > +             function = "gpio";
> > +             bias-disable;
> > +     };
> >  };
> > --
> > 2.34.1
> >
