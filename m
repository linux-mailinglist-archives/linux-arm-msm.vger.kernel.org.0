Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE9FE983FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 21:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbfHUTHY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 15:07:24 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:45977 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728528AbfHUTHX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 15:07:23 -0400
Received: by mail-ua1-f66.google.com with SMTP id w7so1155450uao.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2019 12:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HI7fjA+U9drVxTWyKrVt26tOcRHK/3YAFJFXAGMGVCI=;
        b=anlSaBpOeSw5h+2sviVMF6tO1Po/6TvfrrlN9WOxmK4BbS+ASZ4cTffesa67UI41Ud
         VhadryK7m/Iw7lTa6m5gY1gNPqvu3Ty0lAqbDmu2vnKSFESkrFAKqe5GdcNmzXVdZ4GO
         yff0YI1BSqN1EoNq0gRiGW/FUceCOWYwfgE7JWHFpTqbHITIEeQ3+QScQ8vC8zZ/dMRt
         azygIvHpqM+IgPdnKXSev8q1F5kmVUahGROQFDWXeOoR/FtQcYLmg3tpPnfuoSmVyBk0
         SScr1q5kNTKxpfnWibfak9HlTSfasYFRTRKqNYAYbtoclvmBWNvTzK1X+GpTdH3JvaFh
         O/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HI7fjA+U9drVxTWyKrVt26tOcRHK/3YAFJFXAGMGVCI=;
        b=a1eFCeTOhgPiX01izbZau5utA6YqJKVpSJonOMJbcAGaNApRAkH/UvJe17ioJglZ2h
         nJiJ5d4L21yjEWqSmnUrmgM5btOQn7hQW35p/gHhGVgMtwOu9huaxRMudhihcjBFgJvE
         1tBilBpS/kLh5Bjij4L3tgtrjeZWtjWwnDH0PG/9CErTh56+XTofxk4NcLKs3+rdNQCD
         fvyg7RE7adPxjjPz5/yjs6FQUVuQye2qadx/xe5HouPAZZnxp8ti7LK7UI8l43QZTnP/
         7W2Rp3rJ7D719rXiotKnB43w3d3TBc8nuxA7QoOvkXdOrb4enVrTCtYt+TxhI/DafRXF
         sFBw==
X-Gm-Message-State: APjAAAUKRc+kdJPnWAO5khtsIp38g7RDDHmGiIq1Jr0R6jJV2OOIYamc
        tGIf7Z/gh9e+U56z4MXTVwEU7Pap67WknSACNs6YrQCsKTQ=
X-Google-Smtp-Source: APXvYqzqgSPab8sq7Ivar4TvcM2MapFR0xlKdjb6St7E/11/Ftb+lFX5ih/I/NaS9kIbPQEycd39hHMcSs6l9L8t5kk=
X-Received: by 2002:ab0:7812:: with SMTP id x18mr3369805uaq.67.1566414441888;
 Wed, 21 Aug 2019 12:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190821184239.12364-1-vkoul@kernel.org> <20190821184239.12364-2-vkoul@kernel.org>
In-Reply-To: <20190821184239.12364-2-vkoul@kernel.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Thu, 22 Aug 2019 00:37:10 +0530
Message-ID: <CAHLCerN6OOi_3M3-q-kaikjGDRb=27eoAz8h6jP8dt15MAx8sQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] arm64: dts: qcom: sm8150: Add base dts file
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 22, 2019 at 12:14 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> This add base DTS file with cpu, psci, firmware, clock node tlmm and
> spmi and enables boot to console
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 308 +++++++++++++++++++++++++++
>  1 file changed, 308 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8150.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> new file mode 100644
> index 000000000000..417b21d1897c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -0,0 +1,308 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019, Linaro Limited
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>

This include isn't strictly needed until patch 8, I believe. Sorry
didn't catch this earlier.

Other than that, for the series,

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>


> +#include <dt-bindings/clock/qcom,rpmh.h>
> +
> +/ {
> +       interrupt-parent = <&intc>;
> +
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       chosen { };
> +
> +       clocks {
> +               xo_board: xo-board {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <38400000>;
> +                       clock-output-names = "xo_board";
> +               };
> +
> +               sleep_clk: sleep-clk {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <32764>;
> +                       clock-output-names = "sleep_clk";
> +               };
> +       };
> +
> +       cpus {
> +               #address-cells = <2>;
> +               #size-cells = <0>;
> +
> +               CPU0: cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "qcom,kryo485";
> +                       reg = <0x0 0x0>;
> +                       enable-method = "psci";
> +                       next-level-cache = <&L2_0>;
> +                       L2_0: l2-cache {
> +                               compatible = "cache";
> +                               next-level-cache = <&L3_0>;
> +                               L3_0: l3-cache {
> +                                     compatible = "cache";
> +                               };
> +                       };
> +               };
> +
> +               CPU1: cpu@100 {
> +                       device_type = "cpu";
> +                       compatible = "qcom,kryo485";
> +                       reg = <0x0 0x100>;
> +                       enable-method = "psci";
> +                       next-level-cache = <&L2_100>;
> +                       L2_100: l2-cache {
> +                               compatible = "cache";
> +                               next-level-cache = <&L3_0>;
> +                       };
> +
> +               };
> +
> +               CPU2: cpu@200 {
> +                       device_type = "cpu";
> +                       compatible = "qcom,kryo485";
> +                       reg = <0x0 0x200>;
> +                       enable-method = "psci";
> +                       next-level-cache = <&L2_200>;
> +                       L2_200: l2-cache {
> +                               compatible = "cache";
> +                               next-level-cache = <&L3_0>;
> +                       };
> +               };
> +
> +               CPU3: cpu@300 {
> +                       device_type = "cpu";
> +                       compatible = "qcom,kryo485";
> +                       reg = <0x0 0x300>;
> +                       enable-method = "psci";
> +                       next-level-cache = <&L2_300>;
> +                       L2_300: l2-cache {
> +                               compatible = "cache";
> +                               next-level-cache = <&L3_0>;
> +                       };
> +               };
> +
> +               CPU4: cpu@400 {
> +                       device_type = "cpu";
> +                       compatible = "qcom,kryo485";
> +                       reg = <0x0 0x400>;
> +                       enable-method = "psci";
> +                       next-level-cache = <&L2_400>;
> +                       L2_400: l2-cache {
> +                               compatible = "cache";
> +                               next-level-cache = <&L3_0>;
> +                       };
> +               };
> +
> +               CPU5: cpu@500 {
> +                       device_type = "cpu";
> +                       compatible = "qcom,kryo485";
> +                       reg = <0x0 0x500>;
> +                       enable-method = "psci";
> +                       next-level-cache = <&L2_500>;
> +                       L2_500: l2-cache {
> +                               compatible = "cache";
> +                               next-level-cache = <&L3_0>;
> +                       };
> +               };
> +
> +               CPU6: cpu@600 {
> +                       device_type = "cpu";
> +                       compatible = "qcom,kryo485";
> +                       reg = <0x0 0x600>;
> +                       enable-method = "psci";
> +                       next-level-cache = <&L2_600>;
> +                       L2_600: l2-cache {
> +                               compatible = "cache";
> +                               next-level-cache = <&L3_0>;
> +                       };
> +               };
> +
> +               CPU7: cpu@700 {
> +                       device_type = "cpu";
> +                       compatible = "qcom,kryo485";
> +                       reg = <0x0 0x700>;
> +                       enable-method = "psci";
> +                       next-level-cache = <&L2_700>;
> +                       L2_700: l2-cache {
> +                               compatible = "cache";
> +                               next-level-cache = <&L3_0>;
> +                       };
> +               };
> +       };
> +
> +       firmware {
> +               scm: scm {
> +                       compatible = "qcom,scm-sm8150", "qcom,scm";
> +                       #reset-cells = <1>;
> +               };
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               /* We expect the bootloader to fill in the size */
> +               reg = <0x0 0x80000000 0x0 0x0>;
> +       };
> +
> +       psci {
> +               compatible = "arm,psci-1.0";
> +               method = "smc";
> +       };
> +
> +       soc: soc@0 {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges = <0 0 0 0 0x10 0>;
> +               dma-ranges = <0 0 0 0 0x10 0>;
> +               compatible = "simple-bus";
> +
> +               gcc: clock-controller@100000 {
> +                       compatible = "qcom,gcc-sm8150";
> +                       reg = <0x0 0x00100000 0x0 0x1f0000>;
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +                       #power-domain-cells = <1>;
> +                       clock-names = "bi_tcxo",
> +                                     "sleep_clk";
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                                <&sleep_clk>;
> +               };
> +
> +               qupv3_id_1: geniqup@ac0000 {
> +                       compatible = "qcom,geni-se-qup";
> +                       reg = <0x0 0x00ac0000 0x0 0x6000>;
> +                       clock-names = "m-ahb", "s-ahb";
> +                       clocks = <&gcc 123>,
> +                                <&gcc 124>;
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +                       status = "disabled";
> +
> +                       uart2: serial@a90000 {
> +                               compatible = "qcom,geni-debug-uart";
> +                               reg = <0x0 0x00a90000 0x0 0x4000>;
> +                               clock-names = "se";
> +                               clocks = <&gcc 105>;
> +                               interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> +                               status = "disabled";
> +                       };
> +               };
> +
> +               tlmm: pinctrl@3100000 {
> +                       compatible = "qcom,sm8150-pinctrl";
> +                       reg = <0x0 0x03100000 0x0 0x300000>,
> +                             <0x0 0x03500000 0x0 0x300000>,
> +                             <0x0 0x03900000 0x0 0x300000>,
> +                             <0x0 0x03D00000 0x0 0x300000>;
> +                       reg-names = "west", "east", "north", "south";
> +                       interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +                       gpio-ranges = <&tlmm 0 0 175>;
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +               };
> +
> +               spmi_bus: spmi@c440000 {
> +                       compatible = "qcom,spmi-pmic-arb";
> +                       reg = <0x0 0x0c440000 0x0 0x0001100>,
> +                             <0x0 0x0c600000 0x0 0x2000000>,
> +                             <0x0 0x0e600000 0x0 0x0100000>,
> +                             <0x0 0x0e700000 0x0 0x00a0000>,
> +                             <0x0 0x0c40a000 0x0 0x0026000>;
> +                       reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> +                       interrupt-names = "periph_irq";
> +                       interrupts = <GIC_SPI 481 IRQ_TYPE_LEVEL_HIGH>;
> +                       qcom,ee = <0>;
> +                       qcom,channel = <0>;
> +                       #address-cells = <2>;
> +                       #size-cells = <0>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <4>;
> +                       cell-index = <0>;
> +               };
> +
> +               intc: interrupt-controller@17a00000 {
> +                       compatible = "arm,gic-v3";
> +                       interrupt-controller;
> +                       #interrupt-cells = <3>;
> +                       reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
> +                             <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
> +                       interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               timer@17c20000 {
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +                       compatible = "arm,armv7-timer-mem";
> +                       reg = <0x0 0x17c20000 0x0 0x1000>;
> +                       clock-frequency = <19200000>;
> +
> +                       frame@17c21000{
> +                               frame-number = <0>;
> +                               interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +                                            <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +                               reg = <0x0 0x17c21000 0x0 0x1000>,
> +                                     <0x0 0x17c22000 0x0 0x1000>;
> +                       };
> +
> +                       frame@17c23000 {
> +                               frame-number = <1>;
> +                               interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +                               reg = <0x0 0x17c23000 0x0 0x1000>;
> +                               status = "disabled";
> +                       };
> +
> +                       frame@17c25000 {
> +                               frame-number = <2>;
> +                               interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +                               reg = <0x0 0x17c25000 0x0 0x1000>;
> +                               status = "disabled";
> +                       };
> +
> +                       frame@17c27000 {
> +                               frame-number = <3>;
> +                               interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +                               reg = <0x0 0x17c26000 0x0 0x1000>;
> +                               status = "disabled";
> +                       };
> +
> +                       frame@17c29000 {
> +                               frame-number = <4>;
> +                               interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +                               reg = <0x0 0x17c29000 0x0 0x1000>;
> +                               status = "disabled";
> +                       };
> +
> +                       frame@17c2b000 {
> +                               frame-number = <5>;
> +                               interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +                               reg = <0x0 0x17c2b000 0x0 0x1000>;
> +                               status = "disabled";
> +                       };
> +
> +                       frame@17c2d000 {
> +                               frame-number = <6>;
> +                               interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +                               reg = <0x0 0x17c2d000 0x0 0x1000>;
> +                               status = "disabled";
> +                       };
> +               };
> +       };
> +
> +       timer {
> +               compatible = "arm,armv8-timer";
> +               interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
> +                            <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
> +                            <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
> +                            <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
> +       };
> +};
> --
> 2.20.1
>
