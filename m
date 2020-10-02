Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694E62819E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 19:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388008AbgJBRlM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 13:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgJBRlM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 13:41:12 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F315C0613E3
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2020 10:41:12 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id x69so1981761oia.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2020 10:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G5plTR1yFLz1FScdzv2h84cURs+vvah1GNw3UpqFWR0=;
        b=vKh6wUILmBZcXsrZPzWbcyb92tx/EcKcz8zDBNVETZoRTPcyhLrILl8akKPF/uVrUe
         w1bolPwsi4x4HtFEZdOSvtUN3tt5ttqxReplTmB2hSHLbDRspV1hebN8g6OUL04kGDYt
         vc099PXxsZCEmT49d3un0ep6N0Mbs5/WUH9MttZn+F+dk5EAe3z535i6/EfAOl9VCKSK
         JsazPWy4QbyhZSaq5se+7Z0KtOnkc1y16PbRh+SOJw1BMNw9/sfdOres7T2L1kuR/LZ6
         2dt/yTSHqbWlpoA1SK55q1RyX8mgBuPJ15p+IEAHW9M/6aKdaYMYPk66Ku6uWIkxQ80b
         3lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G5plTR1yFLz1FScdzv2h84cURs+vvah1GNw3UpqFWR0=;
        b=AT1h0qJfNFKqyzs/p8NnTZwjz1gB3hTNxC21daMGN7njpiauOJlvuRnkU1azbkL2/k
         rtrMr9zOKEkyIokLXO9OJ6ddEYDB4ESoZyk6o1V552T9WbO3gl99sEMFQYUuTFA+wqQy
         Q1ytPGhv1QB0MnH4/3AWkHJm9npq69cL/j7jIoL5z5G1wHNkYfYmM33v6keakDLdb2KV
         loF81tJfLmwY+YhQzmlPDvTM4OSjTUWWnVSGNU5L/w7mjbAUTaT3IVN4HgODOCIhiJ7Z
         xQ/GuiZihwB+UA3l78reoyPDAV1kpHvWD22YT7GQ/qrtjV5VTDeljdydPu3i2mMzGqtm
         3Tyg==
X-Gm-Message-State: AOAM530UDF6BxwxcCNBqx0JXB4fOzsH0ajqErYL7ntArAebve1jnC121
        6KSci1/qsbr9Ca0rRcEJvfIASUz2CQYSZUNCAXYOCg==
X-Google-Smtp-Source: ABdhPJzsUwL78Y4dwiR1pRxSlUJIyTedY19qy8s6lQbGMiIH3jY6M6U5eBQDR6pRLF3opHkH1IGZTO6aYvKvrUJCQBA=
X-Received: by 2002:aca:bbd7:: with SMTP id l206mr1869243oif.173.1601660471445;
 Fri, 02 Oct 2020 10:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200909195640.3127341-1-robert.marko@sartura.hr> <20200909195640.3127341-5-robert.marko@sartura.hr>
In-Reply-To: <20200909195640.3127341-5-robert.marko@sartura.hr>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Fri, 2 Oct 2020 19:41:00 +0200
Message-ID: <CA+HBbNEkmYMi5KutwrBVh3uqzjdEmHrbJnPbH43C9B-Kq1MBNA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm: dts: add 8devices Habanero DVK
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
> 8devices Habanero DVK is a dual-band SoM development kit based on Qualcomm
> IPQ4019 + QCA8075 platform.
>
> Specs are:
> CPU: QCA IPQ4019
> RAM: DDR3L 512MB
> Storage: 32MB SPI-NOR and optional Parallel SLC NAND(Some boards ship with it and some without)
> WLAN1: 2.4 GHz built into IPQ4019 (802.11n) 2x2
> WLAN2: 5 GHz built into IPO4019 (802.11ac Wawe-2) 2x2
> Ethernet: 5x Gbit LAN (QCA 8075)
> USB: 1x USB 2.0 and 1x USB 3.0 (Both built into IPQ4019)
> MicroSD slot (Uses SD controller built into IPQ4019)
> SDIO3.0/EMMC slot (Uses the same SD controller)
> Mini PCI-E Gen 2.0 slot (Built into IPQ4019)
> 5x LEDs (4 GPIO controllable)
> 2x Pushbutton (1 is connected to GPIO, other to SoC reset)
> LCD ZIF socket (Uses the LCD controller built into IPQ4019 which has no driver support)
> 1x UART 115200 rate on J18
>
> 2x breakout development headers
> 12V DC Jack for power
> DIP switch for bootstrap configuration
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
> Changes since v1:
> * Drop include that does not exist
>
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/qcom-ipq4019-habanero-dvk.dts    | 304 ++++++++++++++++++
>  2 files changed, 305 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom-ipq4019-habanero-dvk.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 246d82fc5fcd..004262e0d699 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -898,6 +898,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>         qcom-ipq4019-ap.dk04.1-c3.dtb \
>         qcom-ipq4019-ap.dk07.1-c1.dtb \
>         qcom-ipq4019-ap.dk07.1-c2.dtb \
> +       qcom-ipq4019-habanero-dvk.dtb \
>         qcom-ipq8064-ap148.dtb \
>         qcom-ipq8064-rb3011.dtb \
>         qcom-msm8660-surf.dtb \
> diff --git a/arch/arm/boot/dts/qcom-ipq4019-habanero-dvk.dts b/arch/arm/boot/dts/qcom-ipq4019-habanero-dvk.dts
> new file mode 100644
> index 000000000000..fe054adda0a7
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-ipq4019-habanero-dvk.dts
> @@ -0,0 +1,304 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/* Copyright (c) 2019, Robert Marko <robimarko@gmail.com> */
> +
> +#include "qcom-ipq4019.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +       model = "8devices Habanero DVK";
> +       compatible = "8dev,habanero-dvk";
> +
> +       keys {
> +               compatible = "gpio-keys";
> +
> +               reset {
> +                       label = "reset";
> +                       gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
> +                       linux,code = <KEY_RESTART>;
> +               };
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led_status: status {
> +                       label = "habanero-dvk:green:status";
> +                       gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
> +                       panic-indicator;
> +               };
> +
> +               led_upgrade: upgrade {
> +                       label = "habanero-dvk:green:upgrade";
> +                       gpios = <&tlmm 40 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               wlan2g {
> +                       label = "habanero-dvk:green:wlan2g";
> +                       gpios = <&tlmm 46 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger = "phy0tpt";
> +               };
> +
> +               wlan5g {
> +                       label = "habanero-dvk:green:wlan5g";
> +                       gpios = <&tlmm 48 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger = "phy1tpt";
> +               };
> +       };
> +};
> +
> +&vqmmc {
> +       status = "okay";
> +};
> +
> +&sdhci {
> +       status = "okay";
> +
> +       pinctrl-0 = <&sd_pins>;
> +       pinctrl-names = "default";
> +       cd-gpios = <&tlmm 22 GPIO_ACTIVE_LOW>;
> +       vqmmc-supply = <&vqmmc>;
> +};
> +
> +&qpic_bam {
> +       status = "okay";
> +};
> +
> +&tlmm {
> +       mdio_pins: mdio_pinmux {
> +               mux_1 {
> +                       pins = "gpio6";
> +                       function = "mdio";
> +                       bias-pull-up;
> +               };
> +
> +               mux_2 {
> +                       pins = "gpio7";
> +                       function = "mdc";
> +                       bias-pull-up;
> +               };
> +       };
> +
> +       serial_pins: serial_pinmux {
> +               mux {
> +                       pins = "gpio16", "gpio17";
> +                       function = "blsp_uart0";
> +                       bias-disable;
> +               };
> +       };
> +
> +       spi_0_pins: spi_0_pinmux {
> +               pinmux {
> +                       function = "blsp_spi0";
> +                       pins = "gpio13", "gpio14", "gpio15";
> +                       drive-strength = <12>;
> +                       bias-disable;
> +               };
> +
> +               pinmux_cs {
> +                       function = "gpio";
> +                       pins = "gpio12";
> +                       drive-strength = <2>;
> +                       bias-disable;
> +                       output-high;
> +               };
> +       };
> +
> +       nand_pins: nand_pins {
> +               pullups {
> +                       pins =  "gpio52", "gpio53", "gpio58", "gpio59";
> +                       function = "qpic";
> +                       bias-pull-up;
> +               };
> +
> +               pulldowns {
> +                       pins = "gpio54", "gpio55", "gpio56", "gpio57",
> +                               "gpio60", "gpio62", "gpio63", "gpio64",
> +                               "gpio65", "gpio66", "gpio67", "gpio68",
> +                               "gpio69";
> +                       function = "qpic";
> +                       bias-pull-down;
> +               };
> +       };
> +
> +       sd_pins: sd_pins {
> +               pinmux {
> +                       function = "sdio";
> +                       pins = "gpio23", "gpio24", "gpio25", "gpio26",
> +                               "gpio28", "gpio29", "gpio30", "gpio31";
> +                       drive-strength = <10>;
> +               };
> +
> +               pinmux_sd_clk {
> +                       function = "sdio";
> +                       pins = "gpio27";
> +                       drive-strength = <16>;
> +               };
> +
> +               pinmux_sd7 {
> +                       function = "sdio";
> +                       pins = "gpio32";
> +                       drive-strength = <10>;
> +                       bias-disable;
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
> +       cs-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
> +
> +       flash@0 {
> +               compatible = "jedec,spi-nor";
> +               spi-max-frequency = <24000000>;
> +               reg = <0>;
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
> +                       partition@40000 {
> +                               label = "MIBIB";
> +                               reg = <0x00040000 0x00020000>;
> +                               read-only;
> +                       };
> +                       partition@60000 {
> +                               label = "QSEE";
> +                               reg = <0x00060000 0x00060000>;
> +                               read-only;
> +                       };
> +                       partition@c0000 {
> +                               label = "CDT";
> +                               reg = <0x000c0000 0x00010000>;
> +                               read-only;
> +                       };
> +                       partition@d0000 {
> +                               label = "DDRPARAMS";
> +                               reg = <0x000d0000 0x00010000>;
> +                               read-only;
> +                       };
> +                       partition@e0000 {
> +                               label = "APPSBLENV"; /* uboot env */
> +                               reg = <0x000e0000 0x00010000>;
> +                               read-only;
> +                       };
> +                       partition@f0000 {
> +                               label = "APPSBL"; /* uboot */
> +                               reg = <0x000f0000 0x00080000>;
> +                               read-only;
> +                       };
> +                       partition@170000 {
> +                               label = "ART";
> +                               reg = <0x00170000 0x00010000>;
> +                               read-only;
> +                       };
> +                       partition@180000 {
> +                               label = "cfg";
> +                               reg = <0x00180000 0x00040000>;
> +                       };
> +                       partition@1c0000 {
> +                               label = "firmware";
> +                               compatible = "denx,fit";
> +                               reg = <0x001c0000 0x01e40000>;
> +                       };
> +               };
> +       };
> +};
> +
> +/* Some DVK boards ship without NAND */
> +&nand {
> +       status = "okay";
> +
> +       pinctrl-0 = <&nand_pins>;
> +       pinctrl-names = "default";
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
> +&pcie0 {
> +       status = "okay";
> +
> +       perst-gpio = <&tlmm 38 GPIO_ACTIVE_LOW>;
> +       wake-gpio = <&tlmm 50 GPIO_ACTIVE_LOW>;
> +
> +       /* Free slot for use */
> +       bridge@0,0 {
> +               reg = <0x00000000 0 0 0 0>;
> +               #address-cells = <3>;
> +               #size-cells = <2>;
> +               ranges;
> +       };
> +};
> +
> +&wifi0 {
> +       status = "okay";
> +
> +       qcom,ath10k-calibration-variant = "8devices-Habanero";
> +};
> +
> +&wifi1 {
> +       status = "okay";
> +
> +       qcom,ath10k-calibration-variant = "8devices-Habanero";
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
