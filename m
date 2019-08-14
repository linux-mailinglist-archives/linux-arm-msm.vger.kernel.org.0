Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3592B8D89C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 18:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbfHNQ65 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 12:58:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:49796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727558AbfHNQ65 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 12:58:57 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 098FD2063F;
        Wed, 14 Aug 2019 16:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565801935;
        bh=14kpVeN5jWNC6nXkPCoNsGsW334g7m9vBYuBFQ8RO2I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eUYaSxcXPQBD2jPWEqORt3lTGGIh9QpwxIFCcuuN1cRYap2lFt3aoDTYVuPYspwuI
         4KC6SA73+hPzfA6jr6S01yHwYwydB9FDaxrsAFAC7AMNxM9I2P2D0keZE+P30n00xW
         aBrf9Cdjw2NKkgUe8s1xulcf0SAj4UwKLekvV7kc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814125012.8700-2-vkoul@kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-2-vkoul@kernel.org>
Subject: Re: [PATCH 01/22] arm64: dts: qcom: sm8150: add base dts file
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 09:58:54 -0700
Message-Id: <20190814165855.098FD2063F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:49:51)
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> new file mode 100644
> index 000000000000..cd9fcadaeacb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2019, Linaro Limited
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-sm8150.h>
> +
> +/ {
> +       interrupt-parent =3D <&intc>;
> +
> +       #address-cells =3D <2>;
> +       #size-cells =3D <2>;
> +
> +       chosen { };
> +
> +       clocks {
> +               xo_board: xo-board {
> +                       compatible =3D "fixed-clock";
> +                       #clock-cells =3D <0>;
> +                       clock-frequency =3D <19200000>;

Is it 19.2 or 38.4 MHz? It seems like lately there are dividers, but I
guess it doesn't really matter in the end.

> +                       clock-output-names =3D "xo_board";
> +               };
> +
> +               sleep_clk: sleep-clk {
> +                       compatible =3D "fixed-clock";
> +                       #clock-cells =3D <0>;
> +                       clock-frequency =3D <32764>;
> +                       clock-output-names =3D "sleep_clk";

Does it matter to have this property anymore? Presumably it's OK if the
name is now sleep-clk instead of sleep_clk because the name doesn't
matter to connect clk tree.

> +               };
> +       };
> +
> +       cpus {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <0>;
> +
> +               CPU0: cpu@0 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "qcom,kryo485";
> +                       reg =3D <0x0 0x0>;
> +                       enable-method =3D "psci";
> +                       next-level-cache =3D <&L2_0>;
> +                       L2_0: l2-cache {
> +                               compatible =3D "cache";
> +                               next-level-cache =3D <&L3_0>;
> +                               L3_0: l3-cache {
> +                                     compatible =3D "cache";
> +                               };
> +                       };
> +               };
> +
> +               CPU1: cpu@100 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "qcom,kryo485";
> +                       reg =3D <0x0 0x100>;
> +                       enable-method =3D "psci";
> +                       next-level-cache =3D <&L2_100>;
> +                       L2_100: l2-cache {
> +                               compatible =3D "cache";
> +                               next-level-cache =3D <&L3_0>;
> +                       };
> +
> +               };
> +
> +               CPU2: cpu@200 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "qcom,kryo485";
> +                       reg =3D <0x0 0x200>;
> +                       enable-method =3D "psci";
> +                       next-level-cache =3D <&L2_200>;
> +                       L2_200: l2-cache {
> +                               compatible =3D "cache";
> +                               next-level-cache =3D <&L3_0>;
> +                       };
> +               };
> +
> +               CPU3: cpu@300 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "qcom,kryo485";
> +                       reg =3D <0x0 0x300>;
> +                       enable-method =3D "psci";
> +                       next-level-cache =3D <&L2_300>;
> +                       L2_300: l2-cache {
> +                               compatible =3D "cache";
> +                               next-level-cache =3D <&L3_0>;
> +                       };
> +               };
> +
> +               CPU4: cpu@400 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "qcom,kryo485";
> +                       reg =3D <0x0 0x400>;
> +                       enable-method =3D "psci";
> +                       next-level-cache =3D <&L2_400>;
> +                       L2_400: l2-cache {
> +                               compatible =3D "cache";
> +                               next-level-cache =3D <&L3_0>;
> +                       };
> +               };
> +
> +               CPU5: cpu@500 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "qcom,kryo485";
> +                       reg =3D <0x0 0x500>;
> +                       enable-method =3D "psci";
> +                       next-level-cache =3D <&L2_500>;
> +                       L2_500: l2-cache {
> +                               compatible =3D "cache";
> +                               next-level-cache =3D <&L3_0>;
> +                       };
> +               };
> +
> +               CPU6: cpu@600 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "qcom,kryo485";
> +                       reg =3D <0x0 0x600>;
> +                       enable-method =3D "psci";
> +                       next-level-cache =3D <&L2_600>;
> +                       L2_600: l2-cache {
> +                               compatible =3D "cache";
> +                               next-level-cache =3D <&L3_0>;
> +                       };
> +               };
> +
> +               CPU7: cpu@700 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "qcom,kryo485";

Is this compatible documented?

> +                       reg =3D <0x0 0x700>;
> +                       enable-method =3D "psci";
> +                       next-level-cache =3D <&L2_700>;
> +                       L2_700: l2-cache {
> +                               compatible =3D "cache";
> +                               next-level-cache =3D <&L3_0>;
> +                       };
> +               };
> +       };
> +
> +       firmware {
> +               scm: scm {
> +                       compatible =3D "qcom,scm-sm8150", "qcom,scm";
> +                       #reset-cells =3D <1>;
> +               };
> +       };
> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               /* We expect the bootloader to fill in the size */
> +               reg =3D <0 0x80000000 0 0>;
> +       };
> +
> +       psci {
> +               compatible =3D "arm,psci-1.0";
> +               method =3D "smc";
> +       };
> +
> +       soc: soc@0 {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges =3D <0 0 0 0xffffffff>;
> +               compatible =3D "simple-bus";
> +
> +               gcc: clock-controller@100000 {
> +                       compatible =3D "qcom,gcc-sm8150";
> +                       reg =3D <0x00100000 0x1f0000>;
> +                       #clock-cells =3D <1>;
> +                       #reset-cells =3D <1>;
> +                       #power-domain-cells =3D <1>;
> +                       clock-names =3D "bi_tcxo", "sleep_clk";
> +                       clocks =3D <&xo_board>, <&sleep_clk>;
> +               };
> +
> +               qupv3_id_1: geniqup@ac0000 {
> +                       compatible =3D "qcom,geni-se-qup";
> +                       reg =3D <0x00ac0000 0x6000>;
> +                       clock-names =3D "m-ahb", "s-ahb";
> +                       clocks =3D <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
> +                                <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       ranges;
> +                       status =3D "disabled";
> +
> +                       uart2: serial@a90000 {
> +                               compatible =3D "qcom,geni-debug-uart";
> +                               reg =3D <0x00a90000 0x4000>;
> +                               clock-names =3D "se";
> +                               clocks =3D <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
> +                               interrupts =3D <GIC_SPI 357 IRQ_TYPE_LEVE=
L_HIGH>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               intc: interrupt-controller@17a00000 {
> +                       compatible =3D "arm,gic-v3";
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <3>;
> +                       reg =3D <0x17a00000 0x10000>,     /* GICD */
> +                             <0x17a60000 0x100000>;    /* GICR * 8 */
> +                       interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

Is there an its node? Probably the same as sdm845?

> +               };
> +
> +               timer@17c20000 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       ranges;
> +                       compatible =3D "arm,armv7-timer-mem";
> +                       reg =3D <0x17c20000 0x1000>;
> +                       clock-frequency =3D <19200000>;

This property shouldn't be necessary. Please remove.

> +
> +                       frame@17c21000{
> +                               frame-number =3D <0>;
> +                               interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_=
HIGH>,
> +                                            <GIC_SPI 6 IRQ_TYPE_LEVEL_HI=
GH>;
