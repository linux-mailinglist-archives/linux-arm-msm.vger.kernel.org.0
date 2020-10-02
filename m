Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 576B72819E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 19:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388415AbgJBRkz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 13:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387934AbgJBRko (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 13:40:44 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A355EC0613E3
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2020 10:40:43 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id c2so2144173otp.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2020 10:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D2lgLF8Qpm8OgcRtMwx6agyAQsXe4nEXjvj/FY+r7L8=;
        b=oDHLeaIYmUubWCUtwWqOrAamhga5ZEKLJPLPDWSK/tRv/JHIGOBNer5bGwdgA3shEE
         JCS0UAnhpDjWxLB/iGBA/hFon92LcVKVbOgl1A7jOy3X+kspn2t9F9WRr9e22SOy51to
         b+yZgwYs2eLTVpc4lxcDwKx8u+R0Iuqm/SWYzMi+6VH/G0hM7jiIiC4YJPuxC/10Wufl
         K3Zh6MH8BZuvS1ZcyPkSf5GiOIvUsW3Y7iehM2GWJAaQVK2OOW3N4kN9YV2UICK+8M4H
         qtRPjQP8bb0kJiqH9YeZJklxqEgb2Vk1ys96JNs5COtASLCiulgOClR3Rq1u+tN4uhHs
         5KpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D2lgLF8Qpm8OgcRtMwx6agyAQsXe4nEXjvj/FY+r7L8=;
        b=bfkMuIIywTk/r0+EptNNn9NJTlZj8sGMOq6WpDV22YdPsJnwVmu0tzbr0c1CYFnoYg
         iYY4HWjBdvkTSsuOVra2E48XEY67Hc1ne8T3dSFqfK/j4gSJVxbesGsMnZir8OgIBbH1
         gXwZeh/t3WdOL3lYFZCxh9n7iZ0P+1mEd1TIYqnoKdpYxZ5gDW3kw4kgxoX9ADRpxn4j
         8HsZ0JApd3hWnCtds9TC/btiJdx6dqhJzSkN8x2JfbfmL6RS3rx7RIzzOB4dPuaLpQXT
         VLX1SvgNqTNLses4JKi2T5dLvwsiDIre/JhqHN6UpdRmJ/+GpsfTquBnMUjvu/kA6vil
         DlTA==
X-Gm-Message-State: AOAM533TgXJYMmC078xDczqbmXAqNMf1Kur8WdFI4ELPxTyKlWI5PP/G
        DFuh5qSOejCUWRrsLZYMGGGm0k8sOefB5X7G8+2TQA==
X-Google-Smtp-Source: ABdhPJy4DjSCaIxWZ7dTxI57hJb5iJXOh7hMr3rrPf7kGVDE2sxxvmk+SPmuOSBAIA96vK4bkd/iSofzReLXaCzS0OI=
X-Received: by 2002:a9d:ecc:: with SMTP id 70mr2570305otj.66.1601660443014;
 Fri, 02 Oct 2020 10:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200909195640.3127341-1-robert.marko@sartura.hr> <20200909195640.3127341-3-robert.marko@sartura.hr>
In-Reply-To: <20200909195640.3127341-3-robert.marko@sartura.hr>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Fri, 2 Oct 2020 19:40:31 +0200
Message-ID: <CA+HBbNGLoaqijUhvtxvoiBF_sz_Aeaa+uVfR5jXs_Rz6wwBpRQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm: dts: add 8devices Jalapeno
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robh+dt@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 9, 2020 at 9:56 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> 8devices Jalapeno is a dual-band SoM, based on Qualcomm
> IPQ4018 + QCA8072 platform.
>
> Specification:
> QCA IPQ4018, Quad core ARM v7 Cortex A7 717MHz
> 256 MB of DDR3 RAM
> 8 MB of SPI NOR flash
> 128 MB of Winbond SPI NAND flash
> WLAN1: Qualcomm Atheros QCA4018 2.4GHz 802.11bgn 2:2x2
> WLAN2: Qualcomm Atheros QCA4018 5GHz 802.11a/n/ac 2:2x2
> ETH: Qualcomm Atheros QCA8072 Gigabit Switch (1 x LAN, 1 x WAN)
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
> Changes since v1:
> * Drop include that does not exist
>
>  arch/arm/boot/dts/Makefile                  |   1 +
>  arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts | 214 ++++++++++++++++++++
>  2 files changed, 215 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 4572db3fa5ae..9b474208057d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -890,6 +890,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>         qcom-apq8074-dragonboard.dtb \
>         qcom-apq8084-ifc6540.dtb \
>         qcom-apq8084-mtp.dtb \
> +       qcom-ipq4018-jalapeno.dtb \
>         qcom-ipq4019-ap.dk01.1-c1.dtb \
>         qcom-ipq4019-ap.dk04.1-c1.dtb \
>         qcom-ipq4019-ap.dk04.1-c3.dtb \
> diff --git a/arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts b/arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts
> new file mode 100644
> index 000000000000..394412619894
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts
> @@ -0,0 +1,214 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +// Copyright (c) 2018, Robert Marko <robimarko@gmail.com>
> +
> +#include "qcom-ipq4019.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +       model = "8devices Jalapeno";
> +       compatible = "8dev,jalapeno";
> +};
> +
> +&tlmm {
> +       mdio_pins: mdio_pinmux {
> +               pinmux_1 {
> +                       pins = "gpio53";
> +                       function = "mdio";
> +               };
> +
> +               pinmux_2 {
> +                       pins = "gpio52";
> +                       function = "mdc";
> +               };
> +
> +               pinconf {
> +                       pins = "gpio52", "gpio53";
> +                       bias-pull-up;
> +               };
> +       };
> +
> +       serial_pins: serial_pinmux {
> +               mux {
> +                       pins = "gpio60", "gpio61";
> +                       function = "blsp_uart0";
> +                       bias-disable;
> +               };
> +       };
> +
> +       spi_0_pins: spi_0_pinmux {
> +               pin {
> +                       function = "blsp_spi0";
> +                       pins = "gpio55", "gpio56", "gpio57";
> +                       drive-strength = <2>;
> +                       bias-disable;
> +               };
> +
> +               pin_cs {
> +                       function = "gpio";
> +                       pins = "gpio54", "gpio59";
> +                       drive-strength = <2>;
> +                       bias-disable;
> +                       output-high;
> +               };
> +       };
> +};
> +
> +&watchdog {
> +       status = "okay";
> +};
> +
> +&prng {
> +       status = "okay";
> +};
> +
> +&blsp_dma {
> +       status = "okay";
> +};
> +
> +&blsp1_spi1 {
> +       status = "okay";
> +
> +       pinctrl-0 = <&spi_0_pins>;
> +       pinctrl-names = "default";
> +       cs-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>, <&tlmm 59 GPIO_ACTIVE_HIGH>;
> +
> +       flash@0 {
> +               status = "okay";
> +
> +               compatible = "jedec,spi-nor";
> +               reg = <0>;
> +               spi-max-frequency = <24000000>;
> +
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       partition@0 {
> +                               label = "SBL1";
> +                               reg = <0x00000000 0x00040000>;
> +                               read-only;
> +                       };
> +
> +                       partition@40000 {
> +                               label = "MIBIB";
> +                               reg = <0x00040000 0x00020000>;
> +                               read-only;
> +                       };
> +
> +                       partition@60000 {
> +                               label = "QSEE";
> +                               reg = <0x00060000 0x00060000>;
> +                               read-only;
> +                       };
> +
> +                       partition@c0000 {
> +                               label = "CDT";
> +                               reg = <0x000c0000 0x00010000>;
> +                               read-only;
> +                       };
> +
> +                       partition@d0000 {
> +                               label = "DDRPARAMS";
> +                               reg = <0x000d0000 0x00010000>;
> +                               read-only;
> +                       };
> +
> +                       partition@e0000 {
> +                               label = "u-boot-env";
> +                               reg = <0x000e0000 0x00010000>;
> +                       };
> +
> +                       partition@f0000 {
> +                               label = "u-boot";
> +                               reg = <0x000f0000 0x00080000>;
> +                               read-only;
> +                       };
> +
> +                       partition@170000 {
> +                               label = "ART";
> +                               reg = <0x00170000 0x00010000>;
> +                               read-only;
> +                       };
> +               };
> +       };
> +
> +       spi-nand@1 {
> +               status = "okay";
> +
> +               compatible = "spi-nand";
> +               reg = <1>;
> +               spi-max-frequency = <24000000>;
> +
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       partition@0 {
> +                               label = "ubi1";
> +                               reg = <0x00000000 0x04000000>;
> +                       };
> +
> +                       partition@4000000 {
> +                               label = "ubi2";
> +                               reg = <0x04000000 0x04000000>;
> +                       };
> +               };
> +       };
> +};
> +
> +&blsp1_uart1 {
> +       status = "okay";
> +
> +       pinctrl-0 = <&serial_pins>;
> +       pinctrl-names = "default";
> +};
> +
> +&cryptobam {
> +       status = "okay";
> +};
> +
> +&crypto {
> +       status = "okay";
> +};
> +
> +&mdio {
> +       status = "okay";
> +
> +       pinctrl-0 = <&mdio_pins>;
> +       pinctrl-names = "default";
> +};
> +
> +&wifi0 {
> +       status = "okay";
> +
> +       qcom,ath10k-calibration-variant = "8devices-Jalapeno";
> +};
> +
> +&wifi1 {
> +       status = "okay";
> +
> +       qcom,ath10k-calibration-variant = "8devices-Jalapeno";
> +};
> +
> +&usb3_ss_phy {
> +       status = "okay";
> +};
> +
> +&usb3_hs_phy {
> +       status = "okay";
> +};
> +
> +&usb3 {
> +       status = "okay";
> +};
> +
> +&usb2_hs_phy {
> +       status = "okay";
> +};
> +
> +&usb2 {
> +       status = "okay";
> +};
> --
> 2.26.2
>

Hi,
Is there an issue with the patch preventing the review?

Regards,
Robert
