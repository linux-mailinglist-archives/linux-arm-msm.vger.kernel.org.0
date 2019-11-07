Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69786F360B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 18:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730632AbfKGRq4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 12:46:56 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45692 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbfKGRq4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 12:46:56 -0500
Received: by mail-pl1-f194.google.com with SMTP id y24so1968348plr.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 09:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=+ZwOLuGlKSzdj2JTU0dldwC9xvDia0GK/gPydTupk/c=;
        b=dUp2mThS12TwVoXD+I4Rq2uQAwHCC+nxojkmXTzLuYbI4+dhtR/0rN1ubSLQZZVC+n
         ut/gZft31QNvv/ck8yT8G/M0tn7sHDmLpVqX7/h6GOY979GRuU+uRj27RkkLZ4cwBrJT
         EKgfvLWQ1WHA+ZEywsj2hUxoOiGMWmaP8sbvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=+ZwOLuGlKSzdj2JTU0dldwC9xvDia0GK/gPydTupk/c=;
        b=QCdZG+inEy1j6ftPuQHbNr2lQooqKttiavuT35CsbrlAmN1ktNtzgDr8DwCDclv0yZ
         DYiwnYvmv+pS+VjEaYmFsTizHPczO4rx/if9h2B/+kuT5ooe4AqtPSmtjFGpuITkpmt4
         NInryC62Yu3jJR1Q8s4CkS0j5UYNTQGhFSoNpkm79PNq5vdmqYt0Olk2tlAuqcs49m7/
         3hbgFyF7fguuJEssqifmBBFtLnRa6iN7rHXWptaxTbVr0pg/BsacaOO7C9/pBVDMusWc
         5IZKvTO9DlabX6l+xWjjaVGZsIGv32yuxuYj2ZJgFfG7+BtW0CTugHrMS44Hkt2B9XXq
         XCYg==
X-Gm-Message-State: APjAAAWFfsEU9cXVJLxaLbzCjxk3hqWM+exH7rQC6ub1LpQoDzWAnudV
        6AUR1f1zltK9rUWzoK2F9e4+mg==
X-Google-Smtp-Source: APXvYqz+SL+SdaRe23Rq1F7L3NNUusbktvP72V1HILQfIv5KqscbVRKRxiP/6TTsehOEgopyPnJ+7g==
X-Received: by 2002:a17:902:b282:: with SMTP id u2mr5042248plr.301.1573148814972;
        Thu, 07 Nov 2019 09:46:54 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b200sm3256834pfb.86.2019.11.07.09.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 09:46:54 -0800 (PST)
Message-ID: <5dc4588e.1c69fb81.5f75c.83ad@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-3-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-3-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 02/14] arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 09:46:53 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:05)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> new file mode 100644
> index 000000000000..17870dd67390
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -0,0 +1,299 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * SC7180 SoC device tree source
> + *
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
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
> +                       clock-frequency =3D <38400000>;
> +                       #clock-cells =3D <0>;
> +               };
> +
> +               sleep_clk: sleep-clk {
> +                       compatible =3D "fixed-clock";
> +                       clock-frequency =3D <32764>;
> +                       clock-output-names =3D "sleep_clk";

Remove this one too?

> +                       #clock-cells =3D <0>;
> +               };
> +       };
> +
[...]
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               /* We expect the bootloader to fill in the size */
> +               reg =3D <0 0x80000000 0 0>;
> +       };
> +
> +       pmu {
> +               compatible =3D "arm,armv8-pmuv3";
> +               interrupts =3D <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       psci {
> +               compatible =3D "arm,psci-1.0";
> +               method =3D "smc";
> +       };
> +
> +       soc: soc {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges =3D <0 0 0 0 0x10 0>;
> +               dma-ranges =3D <0 0 0 0 0x10 0>;
> +               compatible =3D "simple-bus";
> +
> +               gcc: clock-controller@100000 {
> +                       compatible =3D "qcom,gcc-sc7180";
> +                       reg =3D <0 0x00100000 0 0x1f0000>;
> +                       #clock-cells =3D <1>;
> +                       #reset-cells =3D <1>;
> +                       #power-domain-cells =3D <1>;
> +               };
> +
> +               qupv3_id_1: geniqup@ac0000 {
> +                       compatible =3D "qcom,geni-se-qup";
> +                       reg =3D <0 0x00ac0000 0 0x6000>;
> +                       clock-names =3D "m-ahb", "s-ahb";
> +                       clocks =3D <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
> +                                <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       ranges;
> +                       status =3D "disabled";
> +
> +                       uart8: serial@a88000 {
> +                               compatible =3D "qcom,geni-debug-uart";
> +                               reg =3D <0 0x00a88000 0 0x4000>;
> +                               clock-names =3D "se";
> +                               clocks =3D <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +                               pinctrl-names =3D "default";
> +                               pinctrl-0 =3D <&qup_uart8_default>;
> +                               interrupts =3D <GIC_SPI 355 IRQ_TYPE_LEVE=
L_HIGH>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               tlmm: pinctrl@3500000 {
> +                       compatible =3D "qcom,sc7180-pinctrl";
> +                       reg =3D <0 0x03500000 0 0x300000>,
> +                             <0 0x03900000 0 0x300000>,
> +                             <0 0x03d00000 0 0x300000>;
> +                       reg-names =3D "west", "north", "south";
> +                       interrupts =3D <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +                       gpio-ranges =3D <&tlmm 0 0 120>;
> +
> +                       qup_uart8_default: qup-uart8-default {
> +                               pinmux {
> +                                       pins =3D "gpio44", "gpio45";
> +                                       function =3D "qup12";

That looks weird to have qup12 function on uart8. It's right?

> +                               };
> +                       };
> +               };
> +
