Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5E2153949
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 20:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbgBETrx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 14:47:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:44580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727085AbgBETrw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 14:47:52 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 464C020730;
        Wed,  5 Feb 2020 19:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580932070;
        bh=erZuHPE5oBTfwxLwohCXCrhyZgZqkGPnYYKFrljQVlM=;
        h=In-Reply-To:References:From:Subject:To:Date:From;
        b=SR5ts6RDCOu7tBX8GQ0h6AY3HwfEN8QaCVus+ggaeyQV6x0OjodIQ0rMXKJ9Sspw5
         NaAFiYPxBekuxHlpzQqDUzzXgyGLZSvREpKWqmdfmSFXOxyoAzleFpKxQ6WS7ppHco
         6rPIbIPGVQK+u43v9kfDE2iJJE91tr6qTrP7+HB0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1579905147-12142-8-git-send-email-vnkgutta@codeaurora.org>
References: <1579905147-12142-1-git-send-email-vnkgutta@codeaurora.org> <1579905147-12142-8-git-send-email-vnkgutta@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: sm8250: Add sm8250 dts file
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, jshriram@codeaurora.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, psodagud@codeaurora.org,
        robh+dt@kernel.org, tdas@codeaurora.org, tsoni@codeaurora.org,
        vinod.koul@linaro.org, vnkgutta@codeaurora.org
User-Agent: alot/0.8.1
Date:   Wed, 05 Feb 2020 11:47:49 -0800
Message-Id: <20200205194750.464C020730@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Venkata Narendra Kumar Gutta (2020-01-24 14:32:27)
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/q=
com/sm8250.dtsi
> new file mode 100644
> index 0000000..f63df12
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -0,0 +1,450 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
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
> +                       clock-frequency =3D <38400000>;
> +                       clock-output-names =3D "xo_board";
> +               };
> +
> +               sleep_clk: sleep-clk {
> +                       compatible =3D "fixed-clock";
> +                       #clock-cells =3D <0>;
> +                       clock-frequency =3D <32000>;
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
> +                             compatible =3D "cache";
> +                             next-level-cache =3D <&L3_0>;
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
> +                             compatible =3D "cache";
> +                             next-level-cache =3D <&L3_0>;
> +                       };
> +               };
> +
> +               CPU2: cpu@200 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "qcom,kryo485";
> +                       reg =3D <0x0 0x200>;
> +                       enable-method =3D "psci";
> +                       next-level-cache =3D <&L2_200>;
> +                       L2_200: l2-cache {
> +                             compatible =3D "cache";
> +                             next-level-cache =3D <&L3_0>;
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
> +                             compatible =3D "cache";
> +                             next-level-cache =3D <&L3_0>;
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
> +                             compatible =3D "cache";
> +                             next-level-cache =3D <&L3_0>;
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
> +                             compatible =3D "cache";
> +                             next-level-cache =3D <&L3_0>;
> +                       };
> +
> +               };
> +
> +               CPU6: cpu@600 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "qcom,kryo485";
> +                       reg =3D <0x0 0x600>;
> +                       enable-method =3D "psci";
> +                       next-level-cache =3D <&L2_600>;
> +                       L2_600: l2-cache {
> +                             compatible =3D "cache";
> +                             next-level-cache =3D <&L3_0>;
> +                       };
> +               };
> +
> +               CPU7: cpu@700 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "qcom,kryo485";
> +                       reg =3D <0x0 0x700>;
> +                       enable-method =3D "psci";
> +                       next-level-cache =3D <&L2_700>;
> +                       L2_700: l2-cache {
> +                             compatible =3D "cache";
> +                             next-level-cache =3D <&L3_0>;
> +                       };
> +               };
> +       };
> +
> +       firmware: firmware {

Does this need a label?

> +               scm: scm {
> +                       compatible =3D "qcom,scm";
> +                       #reset-cells =3D <1>;
> +               };
> +       };
> +
> +       tcsr_mutex: hwlock {
> +               compatible =3D "qcom,tcsr-mutex";
> +               syscon =3D <&tcsr_mutex_regs 0 0x1000>;
> +               #hwlock-cells =3D <1>;
> +       };
> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               /* We expect the bootloader to fill in the size */
> +               reg =3D <0x0 0x80000000 0x0 0x0>;
> +       };
> +
> +       pmu {
> +               compatible =3D "arm,armv8-pmuv3";
> +               interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       psci {
> +               compatible =3D "arm,psci-1.0";
> +               method =3D "smc";
> +       };
> +
> +       reserved_memory: reserved-memory {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges;
> +
> +               hyp_mem: memory@80000000 {
> +                       reg =3D <0x0 0x80000000 0x0 0x600000>;
> +                       no-map;
> +               };
> +
> +               xbl_aop_mem: memory@80700000 {
> +                       reg =3D <0x0 0x80700000 0x0 0x160000>;
> +                       no-map;
> +               };
> +
> +               cmd_db: memory@80860000 {
> +                       compatible =3D "qcom,cmd-db";
> +                       reg =3D <0x0 0x80860000 0x0 0x20000>;
> +                       no-map;
> +               };
> +
> +               smem_mem: memory@80900000 {
> +                       reg =3D <0x0 0x80900000 0x0 0x200000>;
> +                       no-map;
> +               };
> +
> +               removed_mem: memory@80b00000 {
> +                       reg =3D <0x0 0x80b00000 0x0 0x5300000>;
> +                       no-map;
> +               };
> +
> +               camera_mem: memory@86200000 {
> +                       reg =3D <0x0 0x86200000 0x0 0x500000>;
> +                       no-map;
> +               };
> +
> +               wlan_mem: memory@86700000 {
> +                       reg =3D <0x0 0x86700000 0x0 0x100000>;
> +                       no-map;
> +               };
> +
> +               ipa_fw_mem: memory@86800000 {
> +                       reg =3D <0x0 0x86800000 0x0 0x10000>;
> +                       no-map;
> +               };
> +
> +               ipa_gsi_mem: memory@86810000 {
> +                       reg =3D <0x0 0x86810000 0x0 0xa000>;
> +                       no-map;
> +               };
> +
> +               gpu_mem: memory@8681a000 {
> +                       reg =3D <0x0 0x8681a000 0x0 0x2000>;
> +                       no-map;
> +               };
> +
> +               npu_mem: memory@86900000 {
> +                       reg =3D <0x0 0x86900000 0x0 0x500000>;
> +                       no-map;
> +               };
> +
> +               video_mem: memory@86e00000 {
> +                       reg =3D <0x0 0x86e00000 0x0 0x500000>;
> +                       no-map;
> +               };
> +
> +               cvp_mem: memory@87300000 {
> +                       reg =3D <0x0 0x87300000 0x0 0x500000>;
> +                       no-map;
> +               };
> +
> +               cdsp_mem: memory@87800000 {
> +                       reg =3D <0x0 0x87800000 0x0 0x1400000>;
> +                       no-map;
> +               };
> +
> +               slpi_mem: memory@88c00000 {
> +                       reg =3D <0x0 0x88c00000 0x0 0x1500000>;
> +                       no-map;
> +               };
> +
> +               adsp_mem: memory@8a100000 {
> +                       reg =3D <0x0 0x8a100000 0x0 0x1d00000>;
> +                       no-map;
> +               };
> +
> +               spss_mem: memory@8be00000 {
> +                       reg =3D <0x0 0x8be00000 0x0 0x100000>;
> +                       no-map;
> +               };
> +
> +               cdsp_secure_heap: memory@8bf00000 {
> +                       reg =3D <0x0 0x8bf00000 0x0 0x4600000>;
> +                       no-map;
> +               };
> +       };
> +
> +       smem {
> +               compatible =3D "qcom,smem";
> +               memory-region =3D <&smem_mem>;
> +               hwlocks =3D <&tcsr_mutex 3>;
> +       };
> +
> +       soc: soc@0 {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges =3D <0 0 0 0 0x10 0>;
> +               dma-ranges =3D <0 0 0 0 0x10 0>;
> +               compatible =3D "simple-bus";
> +
> +               gcc: clock-controller@100000 {
> +                       compatible =3D "qcom,gcc-sm8250";
> +                       reg =3D <0x0 0x00100000 0x0 0x1f0000>;
> +                       #clock-cells =3D <1>;
> +                       #reset-cells =3D <1>;
> +                       #power-domain-cells =3D <1>;
> +                       clock-names =3D "bi_tcxo",
> +                                       "sleep_clk";

Weird tabbign here.

> +                       clocks =3D <&rpmhcc RPMH_CXO_CLK>,
> +                               <&sleep_clk>;

And here.

> +               };
> +
> +               qupv3_id_1: geniqup@ac0000 {
> +                       compatible =3D "qcom,geni-se-qup";
> +                       reg =3D <0x0 0x00ac0000 0x0 0x6000>;
> +                       clock-names =3D "m-ahb", "s-ahb";
> +                       clocks =3D <&gcc 133>,
> +                               <&gcc 134>;

Make it one line instead of two?

> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       ranges;
> +                       status =3D "disabled";
> +
> +                       uart2: serial@a90000 {
> +                               compatible =3D "qcom,geni-debug-uart";
> +                               reg =3D <0x0 0x00a90000 0x0 0x4000>;
> +                               clock-names =3D "se";
> +                               clocks =3D <&gcc 113>;
> +                               interrupts =3D <GIC_SPI 357 IRQ_TYPE_LEVE=
L_HIGH>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               intc: interrupt-controller@17a00000 {
> +                       compatible =3D "arm,gic-v3";
> +                       #interrupt-cells =3D <3>;
> +                       interrupt-controller;
> +                       reg =3D <0x0 0x17a00000 0x0 0x10000>,     /* GICD=
 */
> +                             <0x0 0x17a60000 0x0 0x100000>;    /* GICR *=
 8 */
> +                       interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

Is there an ITS node? I think so. Please add it and mark it disabled.

> +               };
> +
> +               pdc: interrupt-controller@b220000 {
> +                       compatible =3D "qcom,sm8250-pdc";
> +                       reg =3D <0x0b220000 0x30000>, <0x17c000f0 0x60>;
> +                       qcom,pdc-ranges =3D <0 480 94>, <94 609 31>,
> +                                       <125 63 1>, <126 716 12>;

Weird tabbing here.

> +                       #interrupt-cells =3D <2>;
> +                       interrupt-parent =3D <&intc>;
> +                       interrupt-controller;
> +               };
> +
> +               spmi_bus: qcom,spmi@c440000 {

Node name should be 'spmi'.

> +                       compatible =3D "qcom,spmi-pmic-arb";
> +                       reg =3D <0x0 0x0c440000 0x0 0x0001100>,
> +                             <0x0 0x0c600000 0x0 0x2000000>,
> +                             <0x0 0x0e600000 0x0 0x0100000>,
> +                             <0x0 0x0e700000 0x0 0x00a0000>,
> +                             <0x0 0x0c40a000 0x0 0x0026000>;
> +                       reg-names =3D "core", "chnls", "obsrvr", "intr", =
"cnfg";
> +                       interrupt-names =3D "periph_irq";
> +                       interrupts-extended =3D <&pdc 1 IRQ_TYPE_LEVEL_HI=
GH>;

Nice!

> +                       qcom,ee =3D <0>;
> +                       qcom,channel =3D <0>;
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <0>;
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <4>;
> +                       cell-index =3D <0>;

What is this property for?

> +               };
> +
> +               apps_rsc: rsc@18200000 {
> +                       label =3D "apps_rsc";
> +                       compatible =3D "qcom,rpmh-rsc";
> +                       reg =3D <0x0 0x18200000 0x0 0x10000>,
> +                               <0x0 0x18210000 0x0 0x10000>,
> +                               <0x0 0x18220000 0x0 0x10000>;

More weird tabbing.

> +                       reg-names =3D "drv-0", "drv-1", "drv-2";
> +                       interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +                       qcom,tcs-offset =3D <0xd00>;
> +                       qcom,drv-id =3D <2>;
> +                       qcom,tcs-config =3D <ACTIVE_TCS  2>,
> +                                               <SLEEP_TCS   3>,
> +                                               <WAKE_TCS    3>,
> +                                               <CONTROL_TCS 1>;

More weird tabbing.

> +
> +                       rpmhcc: clock-controller {
> +                               compatible =3D "qcom,sm8250-rpmh-clk";
> +                               #clock-cells =3D <1>;
> +                               clock-names =3D "xo";
> +                               clocks =3D <&xo_board>;
> +                       };
> +               };
> +
> +               tcsr_mutex_regs: syscon@1f40000 {
> +                       compatible =3D "syscon";
> +                       reg =3D <0x0 0x01f40000 0x0 0x40000>;
> +               };
> +
> +               timer@17c20000 {

Doug fixed these in another thread to use offset. Run dt_bindings_check
and see how it fails.

> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       ranges;
> +                       compatible =3D "arm,armv7-timer-mem";
> +                       reg =3D <0x0 0x17c20000 0x0 0x1000>;
> +                       clock-frequency =3D <19200000>;

Remove this. Firmware should set it up properly.

> +
> +                       frame@17c21000 {
> +                               frame-number =3D <0>;
> +                               interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_=
HIGH>,
> +                                            <GIC_SPI 6 IRQ_TYPE_LEVEL_HI=
GH>;
> +                               reg =3D <0x0 0x17c21000 0x0 0x1000>,
> +                                     <0x0 0x17c22000 0x0 0x1000>;
> +                       };
> +
> +                       frame@17c23000 {
> +                               frame-number =3D <1>;
> +                               interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_=
HIGH>;
> +                               reg =3D <0x0 0x17c23000 0x0 0x1000>;
> +                               status =3D "disabled";
> +                       };
> +
> +                       frame@17c25000 {
> +                               frame-number =3D <2>;
> +                               interrupts =3D <GIC_SPI 10 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               reg =3D <0x0 0x17c25000 0x0 0x1000>;
> +                               status =3D "disabled";
> +                       };
> +
> +                       frame@17c27000 {
> +                               frame-number =3D <3>;
> +                               interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               reg =3D <0x0 0x17c27000 0x0 0x1000>;
> +                               status =3D "disabled";
> +                       };
> +
> +                       frame@17c29000 {
> +                               frame-number =3D <4>;
> +                               interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               reg =3D <0x0 0x17c29000 0x0 0x1000>;
> +                               status =3D "disabled";
> +                       };
> +
> +                       frame@17c2b000 {
> +                               frame-number =3D <5>;
> +                               interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               reg =3D <0x0 0x17c2b000 0x0 0x1000>;
> +                               status =3D "disabled";
> +                       };
> +
> +                       frame@17c2d000 {
> +                               frame-number =3D <6>;
> +                               interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               reg =3D <0x0 0x17c2d000 0x0 0x1000>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +       };
> +
