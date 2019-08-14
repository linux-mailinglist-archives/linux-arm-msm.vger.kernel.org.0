Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2908C8DBCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 19:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728849AbfHNRDK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 13:03:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:51702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728855AbfHNRDK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 13:03:10 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0EF3D21721;
        Wed, 14 Aug 2019 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565802189;
        bh=CxvDG9zCWBcJ812reKgHR+JSRHBdcJUP+rEPiz+YCcg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NJ4K9dUAH+t+UIQvAHVJFiRbRzhHLGejThFYXNc9CX5R6DksIoGG7XHUrbfzF9jwX
         kfR6DJb5Gb3Ke06rKLCw+Zabi0EuAngzPLUuhN3SIEzI0HHUKDo/N4SFbMOCc0fMPR
         S+Leo21cz7twxJopaDlRCeqiCdGyViIV0rs4l758=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814125012.8700-7-vkoul@kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-7-vkoul@kernel.org>
Subject: Re: [PATCH 06/22] arm64: dts: qcom: pm8150: Add Base DTS file
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 10:03:08 -0700
Message-Id: <20190814170309.0EF3D21721@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:49:56)
> Add base DTS file for pm8150 along with GPIOs
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8150.dtsi | 41 ++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8150.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/q=
com/pm8150.dtsi
> new file mode 100644
> index 000000000000..b533e254a203
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2019, Linaro Limited
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +       pm8150_0: pm8150@0 {

I think node name should be 'pmic'

> +               compatible =3D "qcom,spmi-pmic";

This should also have the model number? "qcom,pm8150"?

> +               reg =3D <0x0 SPMI_USID>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               pm8150_gpios: gpio@c000 {
> +                       compatible =3D "qcom,pm8150-gpio";
> +                       reg =3D <0xc000>;
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +                       interrupts =3D <0 0xc0 0 IRQ_TYPE_NONE>,
> +                                    <0 0xc1 0 IRQ_TYPE_NONE>,
> +                                    <0 0xc2 0 IRQ_TYPE_NONE>,
> +                                    <0 0xc3 0 IRQ_TYPE_NONE>,
> +                                    <0 0xc4 0 IRQ_TYPE_NONE>,
> +                                    <0 0xc5 0 IRQ_TYPE_NONE>,
> +                                    <0 0xc6 0 IRQ_TYPE_NONE>,
> +                                    <0 0xc7 0 IRQ_TYPE_NONE>,
> +                                    <0 0xc8 0 IRQ_TYPE_NONE>,
> +                                    <0 0xc9 0 IRQ_TYPE_NONE>,
> +                                    <0 0xca 0 IRQ_TYPE_NONE>,
> +                                    <0 0xcb 0 IRQ_TYPE_NONE>;
> +               };
> +       };
> +
> +       qcom,pm8150@1 {

Same comment, pmic@1.

> +               compatible =3D"qcom,spmi-pmic";
> +               reg =3D <0x1 SPMI_USID>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +       };
> +};
