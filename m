Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C773952737F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 20:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234688AbiENSwM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 14:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234175AbiENSwL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 14:52:11 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D2AC65BE
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 11:52:09 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id u35so9533890qtc.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 11:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VowmyRAqE11d2HNxXPxSWlPP4vP7Cq9zxwKZGEO15ko=;
        b=tg2E8qDvXOynif718lzoO+9mU2ZTBwXAIHUvfnwZjEwj+uuAkqrW6T4U85wzcok3EV
         PD1xQktQCZfsaUiE9inEU3IiZDiCV6h4dsNSkWRXTN4+AroExpFwWT55kIFUtHB0KxmC
         sJq3G0Wyfhwz7WRO72slRucMLl2sOJJQil1i1EDouwPvCzRMtjL/dpcPtyI2KQzl8otN
         hjfnHLl/vfw+iob3fe5WVCUtYgOXzCwf0yVQBy3vDzCW+MqqG3esI2DRuBmlXRRCiJws
         PaTTa5uH6iE9A9vnOYGATU3chke6ho+dTtkj2GL7WHR+EwvQO5FZvJJjIaCzmAYbqnJj
         OqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VowmyRAqE11d2HNxXPxSWlPP4vP7Cq9zxwKZGEO15ko=;
        b=6AlD1NYnqra6I/dD+BOc7Dcwn+zMCBPQO64rBC9+BAJPY+AchvvCZUa2PaxbM/+3gw
         hWI+QdoILd/fJ7mxaFJdrqQYysI58YaK3Zu2uzfduO2ccFwo9hoQIyq8go0cpuFCDPd8
         fZKesjksn1EHmrZYmoPNalwe5REJLmMcJJz2aYxp4GCaubwddEuuJP1npkDQDhZE5UCT
         5g66qX4nLYj3ioqy4IM9upaDzBR1R/5nnYgvDid+WK4kAejHxx4FTPT21lDEpncy09ur
         Q6HCLSW9CNsojpOM3mQ2I0uMFenyBxEqtIPswZ7y9ub7aH6MErlrM8xbJGLSKlDMDq3+
         X7+g==
X-Gm-Message-State: AOAM5319AQQD3mDU0CXc3lZy7zzJqF47usUBNgkBkacc69VNAHdbMq4C
        1LQzDRtSNf2YFDwbzES44V1bT/g96Sggr0TUWEEtGA==
X-Google-Smtp-Source: ABdhPJwqV94tEk/nQtbYHc8/hwaf9KJ2o2QiFE4FzynIGSAOtdFCzefOk6ZIFWuYL0mJnImb2VqU6UnNq1Ms8VAI6mc=
X-Received: by 2002:ac8:57c2:0:b0:2f3:bd82:241 with SMTP id
 w2-20020ac857c2000000b002f3bd820241mr9898527qta.370.1652554328142; Sat, 14
 May 2022 11:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220514141041.3158521-1-dmitry.baryshkov@linaro.org>
 <20220514141041.3158521-12-dmitry.baryshkov@linaro.org> <382d69dd-d00c-d856-7313-6e2e559d9b76@somainline.org>
In-Reply-To: <382d69dd-d00c-d856-7313-6e2e559d9b76@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 14 May 2022 21:51:57 +0300
Message-ID: <CAA8EJpqwDdM0uGO0+S72NMbOJocGSMuQghovPvn9ox17bAMTLA@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] arm64: dts: qcom: sdm660: Add initial Inforce
 IFC6560 board support
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 14 May 2022 at 17:43, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
>
> On 14/05/2022 16:10, Dmitry Baryshkov wrote:
> > The IFC6560 is a board from Inforce Computing, built around the SDA660
> > SoC. This patch describes core clocks, some regulators from the two
> > PMICs, debug uart, storage, bluetooth and audio DSP remoteproc.
> >
> > The regulator settings are inherited from prior work by Konrad Dybcio
> > and AngeloGioacchino Del Regno.
> >
> > Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >   .../boot/dts/qcom/sda660-inforce-ifc6560.dts  | 471 ++++++++++++++++++
> >   2 files changed, 472 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index f9e6343acd03..5f717fe0e8d0 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -88,6 +88,7 @@ dtb-$(CONFIG_ARCH_QCOM)     += sc7280-herobrine-herobrine-r1.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += sc7280-idp.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += sc7280-idp2.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += sc7280-crd.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      += sda660-inforce-ifc6560.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += sdm630-sony-xperia-ganges-kirin.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += sdm630-sony-xperia-nile-discovery.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += sdm630-sony-xperia-nile-pioneer.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> > new file mode 100644
> > index 000000000000..d1923c1310f6
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> > @@ -0,0 +1,471 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2021, Linaro Ltd.
> > + * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
> > + * Copyright (c) 2020, AngeloGioacchino Del Regno
> > + *                     <angelogioacchino.delregno@somainline.org>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sdm660.dtsi"
> > +#include "pm660.dtsi"
> > +#include "pm660l.dtsi"
> > +
> > +/ {
> > +     model = "Inforce 6560 Single Board Computer";
> > +     compatible = "inforce,ifc6560", "qcom,sda660";
> > +     chassis-type = "embedded"; /* SBC */
> > +
> > +     aliases {
> > +             serial0 = &blsp1_uart2;
> > +             serial1 = &blsp2_uart1;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path = "serial0:115200n8";
> > +     };
> > +
> > +     gpio-keys {
> > +             compatible = "gpio-keys";
> > +
> > +             volup {
> > +                     label = "Volume Up";
> > +                     gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
> > +                     linux,code = <KEY_VOLUMEUP>;
> > +                     debounce-interval = <15>;
> > +             };
> > +     };
> > +
> > +     /*
> > +      * Until we hook up type-c detection, we
> > +      * have to stick with this. But it works.
> > +      */
> > +     extcon_usb: extcon-usb {
> > +             compatible = "linux,extcon-usb-gpio";
> > +             id-gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
> > +     };
> > +
> > +     hdmi-out {
> > +             compatible = "hdmi-connector";
> > +             type = "a";
> > +
> > +             port {
> > +                     hdmi_con: endpoint {
> > +                             remote-endpoint = <&adv7533_out>;
> > +                     };
> > +             };
> > +     };
> > +
> > +     vph_pwr: vph-pwr-regulator {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vph_pwr";
> > +             regulator-min-microvolt = <3800000>;
> > +             regulator-max-microvolt = <3800000>;
> > +
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +     };
> > +
> > +     v3p3_bck_bst: v3p3-bck-bst-regulator {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "v3p3_bck_bst";
> > +
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +
> > +             vin-supply = <&vph_pwr>;
> > +     };
> > +
> > +     v1p2_ldo: v1p2-ldo-regulator {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "v1p2_ldo";
> > +
> > +             regulator-min-microvolt = <1200000>;
> > +             regulator-max-microvolt = <1200000>;
> > +
> > +             vin-supply = <&vph_pwr>;
> > +     };
> > +
> > +     v5p0_boost: v5p0-boost-regulator {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "v5p0_boost";
> > +
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +
> > +             vin-supply = <&vph_pwr>;
> > +     };
> > +};
> > +
> > +&adsp_pil {
> > +     firmware-name = "qcom/ifc6560/adsp.mbn";
> > +};
> > +
> > +&blsp1_dma {
> > +     /*
> > +      * The board will lock up if we toggle the BLSP clock, unless the
> > +      * BAM DMA interconnects support is in place.
> > +      */
> > +     /delete-property/ clocks;
> > +};
> > +
> > +&blsp_i2c6 {
> > +     status = "okay";
> > +
> > +     adv7533: hdmi@39 {
> > +             compatible = "adi,adv7535";
> > +             reg = <0x39>, <0x66>;
> > +             reg-names = "main", "edid";
> > +
> > +             interrupt-parent = <&pm660l_gpios>;
> > +             interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> > +
> > +             clocks = <&rpmcc RPM_SMD_BB_CLK2>;
> > +             clock-names = "cec";
> > +             /*
> > +              * Limit to 3 lanes to prevent the bridge from changing amount
> > +              * of lanes in the fly. MSM DSI host doesn't like that.
> > +              */
> > +             adi,dsi-lanes = <3>;
> > +             avdd-supply = <&vreg_l13a_1p8>;
> > +             dvdd-supply = <&vreg_l13a_1p8>;
> > +             pvdd-supply = <&vreg_l13a_1p8>;
> > +             a2vdd-supply = <&vreg_l13a_1p8>;
> > +             v3p3-supply = <&v3p3_bck_bst>;
> > +
> > +             ports {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     port@0 {
> > +                             reg = <0>;
> > +
> > +                             adv7533_in: endpoint {
> > +                                     remote-endpoint = <&dsi0_out>;
> > +                             };
> > +                     };
> > +
> > +                     port@1 {
> > +                             reg = <1>;
> > +
> > +                             adv7533_out: endpoint {
> > +                                     remote-endpoint = <&hdmi_con>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&blsp1_uart2 {
> > +     status = "okay";
> > +};
> > +
> > +&blsp2_dma {
> > +     /*
> > +      * The board will lock up if we toggle the BLSP clock, unless the
> > +      * BAM DMA interconnects support is in place.
> > +      */
> > +     /delete-property/ clocks;
> > +};
> > +
> > +&blsp2_uart1 {
> > +     status = "okay";
> > +
> > +     bluetooth {
> > +             compatible = "qcom,wcn3990-bt";
> > +
> > +             vddio-supply = <&vreg_l13a_1p8>;
> > +             vddxo-supply = <&vreg_l9a_1p8>;
> > +             vddrf-supply = <&vreg_l6a_1p3>;
> > +             vddch0-supply = <&vreg_l19a_3p3>;
> > +             max-speed = <3200000>;
> > +     };
> > +};
> > +
> > +&dsi0 {
> > +     status = "okay";
> > +     vdda-supply = <&vreg_l1a_1p225>;
> > +};
> > +
> > +&dsi0_out {
> > +     remote-endpoint = <&adv7533_in>;
> > +     data-lanes = <0 1 2 3>;
> > +};
> > +
> > +&dsi0_phy {
> > +     status = "okay";
> > +     vcca-supply = <&vreg_l1b_0p925>;
> > +};
> > +
> > +&mdp {
> > +     status = "okay";
> > +};
>
> It's enabled by default.

I thought I removed this chunk!

>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sdm630.dtsi?h=next-20220513#n1454
>
>
> > +
> > +&mdss {
> > +     status = "okay";
> > +};
> > +
> > +&mmss_smmu {
> > +     status = "okay";
> > +};
> > +
> > +&pon_pwrkey {
> > +     status = "okay";
> > +};
> > +
> > +&pon_resin {
> > +     status = "okay";
> > +
> > +     linux,code = <KEY_VOLUMEUP>;
> > +};
> > +
> > +&qusb2phy0 {
> > +     status = "okay";
> > +
> > +     vdd-supply = <&vreg_l1b_0p925>;
> > +     vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
> > +};
> > +
> > +&qusb2phy1 {
> > +     status = "okay";
> > +
> > +     vdd-supply = <&vreg_l1b_0p925>;
> > +     vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
> > +};
> > +
> > +&rpm_requests {
> > +     pm660-regulators {
> > +             compatible = "qcom,rpm-pm660-regulators";
> > +
> > +             vdd_s1-supply = <&vph_pwr>;
> > +             vdd_s2-supply = <&vph_pwr>;
> > +             vdd_s3-supply = <&vph_pwr>;
> > +             vdd_s4-supply = <&vph_pwr>;
> > +             vdd_s5-supply = <&vph_pwr>;
> > +             vdd_s6-supply = <&vph_pwr>;
> > +
> > +             vdd_l1_l6_l7-supply = <&vreg_s5a_1p35>;
> > +             vdd_l2_l3-supply = <&vreg_s2b_1p05>;
> > +             vdd_l5-supply = <&vreg_s2b_1p05>;
> > +             vdd_l8_l9_l10_l11_l12_l13_l14-supply = <&vreg_s4a_2p04>;
> > +             vdd_l15_l16_l17_l18_l19-supply = <&vreg_bob>;
> > +
> > +             vreg_s4a_2p04: s4 {
> > +                     regulator-min-microvolt = <1805000>;
> > +                     regulator-max-microvolt = <2040000>;
> > +                     regulator-enable-ramp-delay = <200>;
> > +                     regulator-ramp-delay = <0>;
> > +                     regulator-always-on;
> > +             };
> > +
> > +             vreg_s5a_1p35: s5 {
> > +                     regulator-min-microvolt = <1224000>;
> > +                     regulator-max-microvolt = <1350000>;
> > +                     regulator-enable-ramp-delay = <200>;
> > +                     regulator-ramp-delay = <0>;
> > +             };
> > +
> > +             vreg_l1a_1p225: l1 {
> > +                     regulator-min-microvolt = <1150000>;
> > +                     regulator-max-microvolt = <1250000>;
> > +                     regulator-enable-ramp-delay = <250>;
> > +                     regulator-allow-set-load;
> > +             };
> > +
> > +             vreg_l6a_1p3: l6 {
> > +                     regulator-min-microvolt = <1304000>;
> > +                     regulator-max-microvolt = <1368000>;
> > +                     regulator-enable-ramp-delay = <250>;
> > +                     regulator-ramp-delay = <0>;
> > +                     regulator-allow-set-load;
> > +             };
> > +
> > +             vreg_l8a_1p8: l8 {
> > +                     regulator-min-microvolt = <1800000>;
> > +                     regulator-max-microvolt = <1800000>;
> > +                     regulator-enable-ramp-delay = <250>;
> > +                     regulator-ramp-delay = <0>;
> > +                     regulator-system-load = <325000>;
> > +                     regulator-allow-set-load;
> > +             };
> > +
> > +             vreg_l9a_1p8: l9 {
> > +                     regulator-min-microvolt = <1804000>;
> > +                     regulator-max-microvolt = <1896000>;
> > +                     regulator-enable-ramp-delay = <250>;
> > +                     regulator-ramp-delay = <0>;
> > +                     regulator-allow-set-load;
> > +             };
> > +
> > +             vreg_l13a_1p8: l13 {
> > +                     /* This gives power to the LPDDR4: never turn it off! */
> > +                     regulator-min-microvolt = <1800000>;
> > +                     regulator-max-microvolt = <1944000>;
> > +                     regulator-enable-ramp-delay = <250>;
> > +                     regulator-ramp-delay = <0>;
> > +                     regulator-always-on;
> > +                     regulator-boot-on;
> > +             };
> > +
> > +             vreg_l19a_3p3: l19 {
> > +                     regulator-min-microvolt = <3312000>;
> > +                     regulator-max-microvolt = <3400000>;
> > +                     regulator-enable-ramp-delay = <250>;
> > +                     regulator-ramp-delay = <0>;
> > +                     regulator-allow-set-load;
> > +             };
> > +     };
> > +
> > +     pm660l-regulators {
> > +             compatible = "qcom,rpm-pm660l-regulators";
> > +
> > +             vdd_s1-supply = <&vph_pwr>;
> > +             vdd_s2-supply = <&vph_pwr>;
> > +             vdd_s3_s4-supply = <&vph_pwr>;
> > +             vdd_s5-supply = <&vph_pwr>;
> > +             vdd_s6-supply = <&vph_pwr>;
> > +
> > +             vdd_l1_l9_l10-supply = <&vreg_s2b_1p05>;
> > +             vdd_l2-supply = <&vreg_bob>;
> > +             vdd_l3_l5_l7_l8-supply = <&vreg_bob>;
> > +             vdd_l4_l6-supply = <&vreg_bob>;
> > +             vdd_bob-supply = <&vph_pwr>;
> > +
> > +             vreg_s2b_1p05: s2 {
> > +                     regulator-min-microvolt = <1050000>;
> > +                     regulator-max-microvolt = <1050000>;
> > +                     regulator-enable-ramp-delay = <200>;
> > +                     regulator-ramp-delay = <0>;
> > +             };
> > +
> > +             vreg_l1b_0p925: l1 {
> > +                     regulator-min-microvolt = <800000>;
> > +                     regulator-max-microvolt = <925000>;
> > +                     regulator-enable-ramp-delay = <250>;
> > +                     regulator-allow-set-load;
> > +             };
> > +
> > +             vreg_l2b_2p95: l2 {
> > +                     regulator-min-microvolt = <1648000>;
> > +                     regulator-max-microvolt = <3100000>;
> > +                     regulator-enable-ramp-delay = <250>;
> > +                     regulator-ramp-delay = <0>;
> > +                     regulator-allow-set-load;
> > +             };
> > +
> > +             vreg_l4b_2p95: l4 {
> > +                     regulator-min-microvolt = <2944000>;
> > +                     regulator-max-microvolt = <2952000>;
> > +                     regulator-enable-ramp-delay = <250>;
> > +                     regulator-ramp-delay = <0>;
> > +
> > +                     regulator-min-microamp = <200>;
> > +                     regulator-max-microamp = <600000>;
> > +                     regulator-system-load = <570000>;
> > +                     regulator-allow-set-load;
> > +             };
> > +
> > +             /*
> > +              * Downstream specifies a range of 1721-3600mV,
> > +              * but the only assigned consumers are SDHCI2 VMMC
> > +              * and Coresight QPDI that both request pinned 2.95V.
> > +              * Tighten the range to 1.8-3.328 (closest to 3.3) to
> > +              * make the mmc driver happy.
> > +              */
> > +             vreg_l5b_2p95: l5 {
> > +                     regulator-min-microvolt = <1800000>;
> > +                     regulator-max-microvolt = <3328000>;
> > +                     regulator-enable-ramp-delay = <250>;
> > +                     regulator-system-load = <800000>;
> > +                     regulator-ramp-delay = <0>;
> > +                     regulator-allow-set-load;
> > +             };
> > +
> > +             vreg_l7b_3p125: l7 {
> > +                     regulator-min-microvolt = <2700000>;
> > +                     regulator-max-microvolt = <3125000>;
> > +                     regulator-enable-ramp-delay = <250>;
> > +             };
> > +
> > +             vreg_l8b_3p3: l8 {
> > +                     regulator-min-microvolt = <2800000>;
> > +                     regulator-max-microvolt = <3400000>;
> > +                     regulator-enable-ramp-delay = <250>;
> > +                     regulator-ramp-delay = <0>;
> > +             };
> > +
> > +             vreg_bob: bob {
> > +                     regulator-min-microvolt = <3300000>;
> > +                     regulator-max-microvolt = <3624000>;
> > +                     regulator-enable-ramp-delay = <500>;
> > +                     regulator-ramp-delay = <0>;
> > +             };
> > +     };
> > +};
> > +
> > +&sdc2_state_on {
>
> I'm not sure if letters go before numbers, that said this may not
> necessarily be wrong.

In my opinion, the numbers come before letters. But in this case it's
even simpler, If I understand your concern correctly.
It is 'sdc2...' vs 'sdhc...'.

>
>
> > +     sd-cd {
> > +             pins = "gpio54";
> > +             bias-pull-up;
> > +             drive-strength = <2>;
> > +     };
> > +};
> > +
> > +&sdc2_state_off {
> > +     sd-cd {
> > +             pins = "gpio54";
> > +             bias-disable;
> > +             drive-strength = <2>;
> > +     };
> > +};
> > +
> > +&sdhc_1 {
> > +     status = "okay";
> > +     supports-cqe;
> > +
> > +     vmmc-supply = <&vreg_l4b_2p95>;
> > +     vqmmc-supply = <&vreg_l8a_1p8>;
> > +
> > +     mmc-ddr-1_8v;
> > +     mmc-hs400-1_8v;
> > +     mmc-hs400-enhanced-strobe;
> > +};
> > +
> > +&sdhc_2 {
> > +     status = "okay";
> > +
> > +     vmmc-supply = <&vreg_l5b_2p95>;
> > +     vqmmc-supply = <&vreg_l2b_2p95>;
> > +
> > +     cd-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
> > +     no-sdio;
> > +     no-emmc;
> > +};
> > +
> > +&tlmm {
> > +     gpio-reserved-ranges = <0 4>, <8 4>;
> > +
> > +     sdc2_card_det_n: sd-card-det-n {
> > +             pins = "gpio54";
> > +             function = "gpio";
> > +             bias-pull-up;
> > +     };
>
> Unused now, I think

Ugh. True.

>
>
> > +};
> > +
> > +&usb2 {
> > +     status = "okay";
> > +};
> > +
> > +&usb2_dwc3 {
> > +     dr_mode = "host";
> > +};
> > +
> > +&usb3 {
> > +     status = "okay";
> > +};
> > +
> > +&usb3_dwc3 {
> > +     dr_mode = "peripheral";
> > +     extcon = <&extcon_usb>;
> > +};



-- 
With best wishes
Dmitry
