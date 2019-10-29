Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B04CE8D40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 17:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390140AbfJ2QtS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 12:49:18 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37460 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727545AbfJ2QtS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 12:49:18 -0400
Received: by mail-pg1-f196.google.com with SMTP id p1so9980666pgi.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2019 09:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=kul6aeK0Z9JpaaEloiN+6LBHmMqPXsKAW0f0LSVkgFI=;
        b=jkMeu05KchoLwigQwKyP/KgA9aQvBIMx9YUFYIvimkWdQaXuNdXPnXfiRBcIGD5GcY
         Ih9w2x9beBbwo18j8rJv5zau3pXLDz3DKTbNZykYtMNvSaOd9cZzleocvW1w5MB8UtOg
         RNQxzWp7tTZnJv6w1CpP5NR5V6RICy+zJWkOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=kul6aeK0Z9JpaaEloiN+6LBHmMqPXsKAW0f0LSVkgFI=;
        b=K+Alr7DA6KhqcPMk/ApH9XhsXO4OtsvaOaMDsZovLOx+fpQJZyVTWNb1fwFLpCUaMg
         HiYu3nLLvPGjwEc9hwRUtEYlUMQdNJD7zUHuc0eXEEszqnIsmFQxbUNrT5nJOzoAaR9Q
         wWu0Tp500et3pPL2lxtVh1+gOMa5yra+BMZPZVihXO492TK1C30KNh48lEJdtrcUeiZ2
         NfiI8hxziwyWGpIFRgr6eXXl94Mgnqor/ZT8VL1E4esqEwK1FuYCE3YaDrkEqJVNJhwU
         R/LfaGQysbTYHTlGlHfv8x7GYhSQISTx3s5H9x7zow14w5SNpG3lAnAbN+bw7gBlxWvk
         XOMg==
X-Gm-Message-State: APjAAAVbdfaZFZDqo9Gva9v8swGUKmGkkyB8UVz43BuewCYaNILhbhKb
        S6UNdJSin3dl172eUmhrBVA7JQ==
X-Google-Smtp-Source: APXvYqx57HqfZpu0z/lUgMsWUtfKtZcr4fRpHEkTX5ewBYX7Npv2CDDJr6pv6qg7foRPJqSEG5ynOQ==
X-Received: by 2002:a65:6456:: with SMTP id s22mr27825078pgv.287.1572367757387;
        Tue, 29 Oct 2019 09:49:17 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s7sm3805723pgv.61.2019.10.29.09.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 09:49:16 -0700 (PDT)
Message-ID: <5db86d8c.1c69fb81.7b0b8.e331@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191023090219.15603-3-rnayak@codeaurora.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org> <20191023090219.15603-3-rnayak@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 02/11] arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Tue, 29 Oct 2019 09:49:15 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-10-23 02:02:10)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> new file mode 100644
> index 000000000000..084854341ddd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -0,0 +1,300 @@
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
> +                       clock-output-names =3D "xo_board";

Can you drop the output names property? I think we don't care that the
name is "xo-board" instead of "xo_board" now.

> +                       #clock-cells =3D <0>;
> +               };
> +
> +               sleep_clk: sleep-clk {
> +                       compatible =3D "fixed-clock";
> +                       clock-frequency =3D <32764>;
> +                       clock-output-names =3D "sleep_clk";
> +                       #clock-cells =3D <0>;
> +               };
> +       };
> +
[...]
> +
> +       soc: soc {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges =3D <0 0 0 0 0x10 0>;
> +               dma-ranges =3D <0 0 0 0  0x10 0>;

Why the extra space here               ^ ?

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
> +                       uart10: serial@a88000 {
> +                               compatible =3D "qcom,geni-debug-uart";
> +                               reg =3D <0 0x00a88000 0 0x4000>;
> +                               clock-names =3D "se";
> +                               clocks =3D <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +                               pinctrl-names =3D "default";
> +                               pinctrl-0 =3D <&qup_uart10_default>;
> +                               interrupts =3D <GIC_SPI 355 IRQ_TYPE_LEVE=
L_HIGH>;
> +                               status =3D "disabled";
> +                       };

Can we not add all the i2c/spi/uart cores here?

> +               };
