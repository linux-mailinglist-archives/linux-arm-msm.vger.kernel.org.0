Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F212F3D49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 01:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393301AbhALVgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 16:36:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:33476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436645AbhALUG4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 15:06:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A514F22202;
        Tue, 12 Jan 2021 20:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610481975;
        bh=R+BCcR/MhTRR2NIT8E6o0tV4cFGyb+NeUAwC/5Db1G0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OXhkcmnTMOIvFLE9z0buC5FPpYL2xv2ml8Fakg+DacUYTxSLbXKyenyZduopjiXyS
         uaoYqRkym9u+DfdHam7knTDRZNwmMxhTu7ip2HOXwQC5ap2KKBe135sAphKAlvY0BZ
         Hl/LRH93XXEHS4+4USHQEKAdLnpWej45tRUb7zndk6wiqfKgAavMMAoLL6djHa6XZ+
         ysF6IZXwW/5OzMmJn99CNmw9Ji5FoavD1s9UPbAZrvhLF12zVuP9uJnQ+YAspjsKRQ
         tF1Vx0ntBWLQZNo01+rLVUofXV8plxKFf3LEMwsdeQYmjJRSUzTKMwuFnRT6tf927P
         KJLwiqzg4qcYw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1608058114-29025-2-git-send-email-tdas@codeaurora.org>
References: <1608058114-29025-1-git-send-email-tdas@codeaurora.org> <1608058114-29025-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: Add SC7280 GCC clock binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 12 Jan 2021 12:06:14 -0800
Message-ID: <161048197433.3661239.10431667618674179787@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-12-15 10:48:33)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml=
 b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
> new file mode 100644
> index 0000000..79c64d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-sc7280.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for SC7280
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets=
 and
> +  power domains on SC7280.
> +
> +  See also:
> +  - dt-bindings/clock/qcom,gcc-sc7280.h
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-sc7280
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Board active XO source
> +      - description: Sleep clock source
> +      - description: PCIE-0 pipe clock source
> +      - description: PCIE-1 pipe clock source
> +      - description: USB30 phy wrapper pipe clock source
> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: bi_tcxo_ao
> +      - const: sleep_clk
> +      - const: pcie_0_pipe_clk
> +      - const: pcie_1_pipe_clk
> +      - const: usb3_phy_wrapper_gcc_usb30_pipe_clk

Don't ufs phy clks also go into gcc?

> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  protected-clocks:
> +    description:
> +      Protected clock specifier list as per common clock binding.

I suppose this is fine.

> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@100000 {
> +      compatible =3D "qcom,gcc-sc7280";
> +      reg =3D <0x00100000 0x1f0000>;
> +      clocks =3D <&rpmhcc RPMH_CXO_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK_A>,
> +               <&sleep_clk>,
> +               <&pcie_0_pipe_clk>, <&pcie_1_pipe_clk>,
> +               <&usb3_phy_wrapper_gcc_usb30_pipe_clk>;
> +      clock-names =3D "bi_tcxo", "bi_tcxo_ao", "sleep_clk", "pcie_0_pipe=
_clk",
> +                     "pcie_1_pipe_clk", "usb3_phy_wrapper_gcc_usb30_pipe=
_clk";
> +      #clock-cells =3D <1>;
> +      #reset-cells =3D <1>;
> +      #power-domain-cells =3D <1>;
> +    };
> +...
