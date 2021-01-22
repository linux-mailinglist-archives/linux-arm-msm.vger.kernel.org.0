Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8577300C79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 20:35:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728600AbhAVTW7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 14:22:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728521AbhAVS5h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 13:57:37 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE7EC061786
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jan 2021 10:56:56 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id p5so7080160oif.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jan 2021 10:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iPbrs6uc7m2Ax/IA6kfEf0cb7RYlqD2geOBz+EuCH/k=;
        b=DXJWaJj7WUk1CAC4nNzvfEcLjreMgB/gQrL3/FUs1099GUvg+yCm24CqM30RoHSDi5
         3Lk4oBmy1wlK1+zvVkHdgXSU4ceT1O1aqj7g92fi5k2ofw/VCz23djhYR4TPOZgHHNSw
         UAX7vqo2/sMNLxd6phrEJe22wHvbXOWpSfebGC4LKxqm4bHDFxTseg/bM4E2kR8a1m+G
         kqStFaEmQFm5IYomLFehlpaOzrNqHlueo0mJQb5xxMLYDDCnk+3C0BFLJzOj7dHfEQ3B
         d29LfA69QVSjFOl5DsH1Ft8kfrZKL64H3LfJcFfGjKre67VSNaQHvJwRNC+O8AgEGh5L
         JLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iPbrs6uc7m2Ax/IA6kfEf0cb7RYlqD2geOBz+EuCH/k=;
        b=QFEsZ5YDbJzZAjdlkvZ2Ulaz/+w85UYGCEXa5Gv1W5SYWMr2KPAuVuY3ph3N+YIcfh
         1BO4AmrQsmQJnDPqO6/fbEtJ9QvvA/FbTS7QB7EQ9uq7ujJC/xKahL71Ncsw0Ea4AISz
         7/HF4K8R6Pv23s4LbAy95WjoVtfBBKq05n6hCDvdSh0clQ1gz0UoBlWiJ3R5XTGWVkh0
         0seq/rUwQrrottdd5MZ/53/45tiEagyWI6ulLOh4A2/xlGDpcsAThCUgyoS6LBYalri7
         yKTpDixRD/yv5/gZEC/L4p1mFLY0U6+NFc8ykXYdFTls948p7VoQbSZICHa8O6eL1AuA
         aRgA==
X-Gm-Message-State: AOAM5339DVhcC7VhNd/zm9euRGW77J8XUVrIXirKigET7gRvtwEuYmJ7
        U84cJOalIDMHcekPUztqff4zsQ==
X-Google-Smtp-Source: ABdhPJx3/qHZKazpQRCeWmsyg12EnkHLxO1lGldNIM08HTrp1b/TMz0ROiqysW18zhtdngOhp2VJfA==
X-Received: by 2002:aca:3554:: with SMTP id c81mr4252305oia.23.1611341815743;
        Fri, 22 Jan 2021 10:56:55 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 68sm1826004otr.16.2021.01.22.10.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 10:56:54 -0800 (PST)
Date:   Fri, 22 Jan 2021 12:56:53 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Andy Gross <agross@kernel.org>, robh+dt@kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH v2 4/4] arm: dts: add 8devices Habanero DVK
Message-ID: <YAsf9aZ8mXU8vLZK@builder.lan>
References: <20200909195640.3127341-1-robert.marko@sartura.hr>
 <20200909195640.3127341-5-robert.marko@sartura.hr>
 <CA+HBbNEkmYMi5KutwrBVh3uqzjdEmHrbJnPbH43C9B-Kq1MBNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+HBbNEkmYMi5KutwrBVh3uqzjdEmHrbJnPbH43C9B-Kq1MBNA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 02 Oct 12:41 CDT 2020, Robert Marko wrote:

> On Wed, Sep 9, 2020 at 9:56 PM Robert Marko <robert.marko@sartura.hr> wrote:
> >
> > 8devices Habanero DVK is a dual-band SoM development kit based on Qualcomm
> > IPQ4019 + QCA8075 platform.
> >
> > Specs are:
> > CPU: QCA IPQ4019
> > RAM: DDR3L 512MB
> > Storage: 32MB SPI-NOR and optional Parallel SLC NAND(Some boards ship with it and some without)
> > WLAN1: 2.4 GHz built into IPQ4019 (802.11n) 2x2
> > WLAN2: 5 GHz built into IPO4019 (802.11ac Wawe-2) 2x2
> > Ethernet: 5x Gbit LAN (QCA 8075)
> > USB: 1x USB 2.0 and 1x USB 3.0 (Both built into IPQ4019)
> > MicroSD slot (Uses SD controller built into IPQ4019)
> > SDIO3.0/EMMC slot (Uses the same SD controller)
> > Mini PCI-E Gen 2.0 slot (Built into IPQ4019)
> > 5x LEDs (4 GPIO controllable)
> > 2x Pushbutton (1 is connected to GPIO, other to SoC reset)
> > LCD ZIF socket (Uses the LCD controller built into IPQ4019 which has no driver support)
> > 1x UART 115200 rate on J18
> >
> > 2x breakout development headers
> > 12V DC Jack for power
> > DIP switch for bootstrap configuration
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
> > ---
> > Changes since v1:
> > * Drop include that does not exist
> >
> >  arch/arm/boot/dts/Makefile                    |   1 +
> >  .../boot/dts/qcom-ipq4019-habanero-dvk.dts    | 304 ++++++++++++++++++
> >  2 files changed, 305 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/qcom-ipq4019-habanero-dvk.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 246d82fc5fcd..004262e0d699 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -898,6 +898,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
> >         qcom-ipq4019-ap.dk04.1-c3.dtb \
> >         qcom-ipq4019-ap.dk07.1-c1.dtb \
> >         qcom-ipq4019-ap.dk07.1-c2.dtb \
> > +       qcom-ipq4019-habanero-dvk.dtb \
> >         qcom-ipq8064-ap148.dtb \
> >         qcom-ipq8064-rb3011.dtb \
> >         qcom-msm8660-surf.dtb \
> > diff --git a/arch/arm/boot/dts/qcom-ipq4019-habanero-dvk.dts b/arch/arm/boot/dts/qcom-ipq4019-habanero-dvk.dts
> > new file mode 100644
> > index 000000000000..fe054adda0a7
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/qcom-ipq4019-habanero-dvk.dts
> > @@ -0,0 +1,304 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> > +/* Copyright (c) 2019, Robert Marko <robimarko@gmail.com> */
> > +
> > +#include "qcom-ipq4019.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +
> > +/ {
> > +       model = "8devices Habanero DVK";
> > +       compatible = "8dev,habanero-dvk";
> > +
> > +       keys {
> > +               compatible = "gpio-keys";
> > +
> > +               reset {
> > +                       label = "reset";
> > +                       gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
> > +                       linux,code = <KEY_RESTART>;
> > +               };
> > +       };
> > +
> > +       leds {
> > +               compatible = "gpio-leds";
> > +
> > +               led_status: status {
> > +                       label = "habanero-dvk:green:status";
> > +                       gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
> > +                       panic-indicator;
> > +               };
> > +
> > +               led_upgrade: upgrade {
> > +                       label = "habanero-dvk:green:upgrade";
> > +                       gpios = <&tlmm 40 GPIO_ACTIVE_HIGH>;
> > +               };
> > +
> > +               wlan2g {
> > +                       label = "habanero-dvk:green:wlan2g";
> > +                       gpios = <&tlmm 46 GPIO_ACTIVE_HIGH>;
> > +                       linux,default-trigger = "phy0tpt";
> > +               };
> > +
> > +               wlan5g {
> > +                       label = "habanero-dvk:green:wlan5g";
> > +                       gpios = <&tlmm 48 GPIO_ACTIVE_HIGH>;
> > +                       linux,default-trigger = "phy1tpt";
> > +               };
> > +       };
> > +};
> > +
> > +&vqmmc {
> > +       status = "okay";
> > +};
> > +
> > +&sdhci {
> > +       status = "okay";
> > +
> > +       pinctrl-0 = <&sd_pins>;
> > +       pinctrl-names = "default";
> > +       cd-gpios = <&tlmm 22 GPIO_ACTIVE_LOW>;
> > +       vqmmc-supply = <&vqmmc>;
> > +};
> > +
> > +&qpic_bam {
> > +       status = "okay";
> > +};
> > +
> > +&tlmm {
> > +       mdio_pins: mdio_pinmux {
> > +               mux_1 {
> > +                       pins = "gpio6";
> > +                       function = "mdio";
> > +                       bias-pull-up;
> > +               };
> > +
> > +               mux_2 {
> > +                       pins = "gpio7";
> > +                       function = "mdc";
> > +                       bias-pull-up;
> > +               };
> > +       };
> > +
> > +       serial_pins: serial_pinmux {
> > +               mux {
> > +                       pins = "gpio16", "gpio17";
> > +                       function = "blsp_uart0";
> > +                       bias-disable;
> > +               };
> > +       };
> > +
> > +       spi_0_pins: spi_0_pinmux {
> > +               pinmux {
> > +                       function = "blsp_spi0";
> > +                       pins = "gpio13", "gpio14", "gpio15";
> > +                       drive-strength = <12>;
> > +                       bias-disable;
> > +               };
> > +
> > +               pinmux_cs {
> > +                       function = "gpio";
> > +                       pins = "gpio12";
> > +                       drive-strength = <2>;
> > +                       bias-disable;
> > +                       output-high;
> > +               };
> > +       };
> > +
> > +       nand_pins: nand_pins {
> > +               pullups {
> > +                       pins =  "gpio52", "gpio53", "gpio58", "gpio59";
> > +                       function = "qpic";
> > +                       bias-pull-up;
> > +               };
> > +
> > +               pulldowns {
> > +                       pins = "gpio54", "gpio55", "gpio56", "gpio57",
> > +                               "gpio60", "gpio62", "gpio63", "gpio64",
> > +                               "gpio65", "gpio66", "gpio67", "gpio68",
> > +                               "gpio69";
> > +                       function = "qpic";
> > +                       bias-pull-down;
> > +               };
> > +       };
> > +
> > +       sd_pins: sd_pins {
> > +               pinmux {
> > +                       function = "sdio";
> > +                       pins = "gpio23", "gpio24", "gpio25", "gpio26",
> > +                               "gpio28", "gpio29", "gpio30", "gpio31";
> > +                       drive-strength = <10>;
> > +               };
> > +
> > +               pinmux_sd_clk {
> > +                       function = "sdio";
> > +                       pins = "gpio27";
> > +                       drive-strength = <16>;
> > +               };
> > +
> > +               pinmux_sd7 {
> > +                       function = "sdio";
> > +                       pins = "gpio32";
> > +                       drive-strength = <10>;
> > +                       bias-disable;
> > +               };
> > +       };
> > +};
> > +
> > +&watchdog {
> > +       status = "okay";
> > +};
> > +
> > +&prng {
> > +       status = "okay";
> > +};
> > +
> > +&blsp_dma {
> > +       status = "okay";
> > +};
> > +
> > +&blsp1_spi1 {
> > +       status = "okay";
> > +
> > +       pinctrl-0 = <&spi_0_pins>;
> > +       pinctrl-names = "default";
> > +       cs-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
> > +
> > +       flash@0 {
> > +               compatible = "jedec,spi-nor";
> > +               spi-max-frequency = <24000000>;
> > +               reg = <0>;
> > +
> > +               partitions {
> > +                       compatible = "fixed-partitions";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <1>;
> > +
> > +                       partition@0 {
> > +                               label = "SBL1";
> > +                               reg = <0x00000000 0x00040000>;
> > +                               read-only;
> > +                       };
> > +                       partition@40000 {
> > +                               label = "MIBIB";
> > +                               reg = <0x00040000 0x00020000>;
> > +                               read-only;
> > +                       };
> > +                       partition@60000 {
> > +                               label = "QSEE";
> > +                               reg = <0x00060000 0x00060000>;
> > +                               read-only;
> > +                       };
> > +                       partition@c0000 {
> > +                               label = "CDT";
> > +                               reg = <0x000c0000 0x00010000>;
> > +                               read-only;
> > +                       };
> > +                       partition@d0000 {
> > +                               label = "DDRPARAMS";
> > +                               reg = <0x000d0000 0x00010000>;
> > +                               read-only;
> > +                       };
> > +                       partition@e0000 {
> > +                               label = "APPSBLENV"; /* uboot env */
> > +                               reg = <0x000e0000 0x00010000>;
> > +                               read-only;
> > +                       };
> > +                       partition@f0000 {
> > +                               label = "APPSBL"; /* uboot */
> > +                               reg = <0x000f0000 0x00080000>;
> > +                               read-only;
> > +                       };
> > +                       partition@170000 {
> > +                               label = "ART";
> > +                               reg = <0x00170000 0x00010000>;
> > +                               read-only;
> > +                       };
> > +                       partition@180000 {
> > +                               label = "cfg";
> > +                               reg = <0x00180000 0x00040000>;
> > +                       };
> > +                       partition@1c0000 {
> > +                               label = "firmware";
> > +                               compatible = "denx,fit";
> > +                               reg = <0x001c0000 0x01e40000>;
> > +                       };
> > +               };
> > +       };
> > +};
> > +
> > +/* Some DVK boards ship without NAND */
> > +&nand {
> > +       status = "okay";
> > +
> > +       pinctrl-0 = <&nand_pins>;
> > +       pinctrl-names = "default";
> > +};
> > +
> > +&blsp1_uart1 {
> > +       status = "okay";
> > +
> > +       pinctrl-0 = <&serial_pins>;
> > +       pinctrl-names = "default";
> > +};
> > +
> > +&cryptobam {
> > +       status = "okay";
> > +};
> > +
> > +&crypto {
> > +       status = "okay";
> > +};
> > +
> > +&mdio {
> > +       status = "okay";
> > +
> > +       pinctrl-0 = <&mdio_pins>;
> > +       pinctrl-names = "default";
> > +};
> > +
> > +&pcie0 {
> > +       status = "okay";
> > +
> > +       perst-gpio = <&tlmm 38 GPIO_ACTIVE_LOW>;
> > +       wake-gpio = <&tlmm 50 GPIO_ACTIVE_LOW>;
> > +
> > +       /* Free slot for use */
> > +       bridge@0,0 {
> > +               reg = <0x00000000 0 0 0 0>;
> > +               #address-cells = <3>;
> > +               #size-cells = <2>;
> > +               ranges;
> > +       };
> > +};
> > +
> > +&wifi0 {
> > +       status = "okay";
> > +
> > +       qcom,ath10k-calibration-variant = "8devices-Habanero";
> > +};
> > +
> > +&wifi1 {
> > +       status = "okay";
> > +
> > +       qcom,ath10k-calibration-variant = "8devices-Habanero";
> > +};
> > +
> > +&usb3_ss_phy {
> > +       status = "okay";
> > +};
> > +
> > +&usb3_hs_phy {
> > +       status = "okay";
> > +};
> > +
> > +&usb3 {
> > +       status = "okay";
> > +};
> > +
> > +&usb2_hs_phy {
> > +       status = "okay";
> > +};
> > +
> > +&usb2 {
> > +       status = "okay";
> > +};
> > --
> > 2.26.2
> >
> 
> Hi,
> Is there an issue with the patch preventing the review?
> 

Found this in my inbox and I don't know why I never replied to you,
perhaps because kernel test robot says it doesn't build...

I tried to apply it now but there's no "vqmmc" so it doesn't build :/


If you're still interested in this I'd be happy to merge it if you can
fix up the vqmmc - and if respinning it I would appreciate if you could
sort the nodes alphabetically.

Regards,
Bjorn
