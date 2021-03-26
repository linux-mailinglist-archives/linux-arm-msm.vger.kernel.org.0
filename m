Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E45234AE6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 19:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhCZSVQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 14:21:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:33454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230076AbhCZSVJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 14:21:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FF9161A24;
        Fri, 26 Mar 2021 18:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616782868;
        bh=45HeEwINR4dgMIAp38qK014aflZeSWa2TR2wX5Ajwqs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JD1cq2MjxhYa8TXbe248Ll0t56e8XKEHws1e0SxfKW/APUbgQGfnlIZsNd9YH/KEA
         J5dHg4yfTaQH7usyK88QVw8ButyaZcJuLS9/YcTBZdgwpahBhE2KahJp3xgjll++qH
         EbTyOY4HrrSkcEO2wAAWKuUz9OZvbcqF6mFJS0owBSo5u5j4ir2hF++m+Km6PoW2V9
         DYrgO36fvNNp8OFP+rG8NtkLHeXST4Yi0UEfd17euU0aNlb9aFTtli9vv9uvtwFPh9
         jAtJiIA+RhFZYxM22BZNus2NCAmTWinZiqEULQbSIUnnU0hZS+6PoYdcI6YX3AWF0m
         nKaIrezQzD44Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210326145816.9758-4-bartosz.dudziak@snejp.pl>
References: <20210326145816.9758-1-bartosz.dudziak@snejp.pl> <20210326145816.9758-4-bartosz.dudziak@snejp.pl>
Subject: Re: [PATCH 3/5] arm: dts: qcom: Add support for MSM8226 SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 26 Mar 2021 11:21:06 -0700
Message-ID: <161678286687.3012082.6223383564849110277@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bartosz Dudziak (2021-03-26 07:58:14)
> This patch adds basic device tree support for MSM8226 SoC which belongs

git grep "This patch" -- Documentation/process/submitting-patches.rst

> to the Snapdragon 400 family. For now, this file adds the basic nodes
> like gcc, pinctrl and other required configuration for booting up to
> the serial console.
>=20
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  arch/arm/boot/dts/qcom-msm8226.dtsi | 152 ++++++++++++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom-msm8226.dtsi
>=20
> diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom=
-msm8226.dtsi
> new file mode 100644
> index 0000000000..81bb19398e
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
> @@ -0,0 +1,152 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-msm8974.h>
> +
> +/ {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <1>;
> +       model =3D "Qualcomm Technologies, Inc. MSM8226";
> +       compatible =3D "qcom,msm8226";
> +       interrupt-parent =3D <&intc>;
> +
> +       chosen { };
> +
> +       memory {
> +               device_type =3D "memory";
> +               /* We expect the bootloader to fill in the size */
> +               reg =3D <0x0 0x0>;
> +       };
> +
> +       soc: soc {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges;
> +               compatible =3D "simple-bus";
> +
> +               intc: interrupt-controller@f9000000 {
> +                       compatible =3D "qcom,msm-qgic2";
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <3>;
> +                       reg =3D <0xF9000000 0x1000>,

lowercase hex please.

> +                             <0xF9002000 0x1000>;
> +               };
> +
> +               gcc: clock-controller@fc400000 {
> +                       compatible =3D "qcom,gcc-msm8226";
> +                       #clock-cells =3D <1>;
> +                       #reset-cells =3D <1>;
> +                       #power-domain-cells =3D <1>;
> +                       reg =3D <0xfc400000 0x4000>;
> +               };
> +
> +               msmgpio: pinctrl@fd510000 {
> +                       compatible =3D "qcom,msm8226-pinctrl";
> +                       reg =3D <0xfd510000 0x4000>;
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +                       gpio-ranges =3D <&msmgpio 0 0 117>;
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +                       interrupts =3D <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               blsp1_uart3: serial@f991f000 {
> +                       compatible =3D "qcom,msm-uartdm-v1.4", "qcom,msm-=
uartdm";
> +                       reg =3D <0xf991f000 0x1000>;
> +                       interrupts =3D <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&gcc GCC_BLSP1_UART3_APPS_CLK>, <&gcc=
 GCC_BLSP1_AHB_CLK>;
> +                       clock-names =3D "core", "iface";
> +                       status =3D "disabled";
> +               };
> +
> +               restart@fc4ab000 {
> +                       compatible =3D "qcom,pshold";
> +                       reg =3D <0xfc4ab000 0x4>;
> +               };
> +
> +               rng@f9bff000 {
> +                       compatible =3D "qcom,prng";
> +                       reg =3D <0xf9bff000 0x200>;
> +                       clocks =3D <&gcc GCC_PRNG_AHB_CLK>;
> +                       clock-names =3D "core";
> +               };
> +
> +               timer@f9020000 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       ranges;
> +                       compatible =3D "arm,armv7-timer-mem";
> +                       reg =3D <0xf9020000 0x1000>;
> +                       clock-frequency =3D <19200000>;

Can you remove this clock-frequency property? Hopefully the firmware is
setting this frequency properly so the driver can read it out of the
registers instead of DT.

> +
> +                       frame@f9021000 {
> +                               frame-number =3D <0>;
> +                               interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_=
HIGH>,
> +                                            <GIC_SPI 7 IRQ_TYPE_LEVEL_HI=
GH>;
> +                               reg =3D <0xf9021000 0x1000>,
> +                                     <0xf9022000 0x1000>;
> +                       };
> +
> +                       frame@f9023000 {
> +                               frame-number =3D <1>;
> +                               interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_=
HIGH>;
> +                               reg =3D <0xf9023000 0x1000>;
> +                               status =3D "disabled";
> +                       };
> +
> +                       frame@f9024000 {
> +                               frame-number =3D <2>;
> +                               interrupts =3D <GIC_SPI 10 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               reg =3D <0xf9024000 0x1000>;
> +                               status =3D "disabled";
> +                       };
> +
> +                       frame@f9025000 {
> +                               frame-number =3D <3>;
> +                               interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               reg =3D <0xf9025000 0x1000>;
> +                               status =3D "disabled";
> +                       };
> +
> +                       frame@f9026000 {
> +                               frame-number =3D <4>;
> +                               interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               reg =3D <0xf9026000 0x1000>;
> +                               status =3D "disabled";
> +                       };
> +
> +                       frame@f9027000 {
> +                               frame-number =3D <5>;
> +                               interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               reg =3D <0xf9027000 0x1000>;
> +                               status =3D "disabled";
> +                       };
> +
> +                       frame@f9028000 {
> +                               frame-number =3D <6>;
> +                               interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               reg =3D <0xf9028000 0x1000>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +       };
> +
> +       timer {
> +               compatible =3D "arm,armv7-timer";
> +               interrupts =3D <GIC_PPI 2
> +                               (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LO=
W)>,
> +                            <GIC_PPI 3
> +                               (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LO=
W)>,
> +                            <GIC_PPI 4
> +                               (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LO=
W)>,
> +                            <GIC_PPI 1
> +                               (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LO=
W)>;
> +               clock-frequency =3D <19200000>;

Same frequency comment.

> +       };
> +};
