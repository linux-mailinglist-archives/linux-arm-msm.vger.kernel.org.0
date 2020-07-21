Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 842542279D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 09:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgGUHv6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 03:51:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:58358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727837AbgGUHv5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 03:51:57 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C8053208E4;
        Tue, 21 Jul 2020 07:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595317916;
        bh=ntUEEOistZRYlYxAe/OIXCaUSHEuCFu4ON7rJM+hkDM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ahfBN40/RRChtiBnraGchV29VjzxUmjgm7gXPJE6LxwkPV/0MSX52Z0R3Dd+1VC/E
         jHCSkFjMNWoYL6l5gSteT2a4Ra2I53SVy2Aeut5GV1bOzcP2hodI9AwdkUbGmOwDK8
         Kui264khcfiO8n50/aEyYT8suL4r9fC2Ll8DbvjU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1594795010-9074-3-git-send-email-tdas@codeaurora.org>
References: <1594795010-9074-1-git-send-email-tdas@codeaurora.org> <1594795010-9074-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 21 Jul 2020 00:51:56 -0700
Message-ID: <159531791606.3847286.11896325263133276429@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-07-14 23:36:48)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscor=
ecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.=
yaml
> new file mode 100644
> index 0000000..41d0a6d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sc7180-lpasscorecc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm LPASS Core Clock Controller Binding for SC7180
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm LPASS core clock control module which supports the clocks and
> +  power domains on SC7180.
> +
> +  See also:
> +  - dt-bindings/clock/qcom,lpasscorecc-sc7180.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc7180-lpasshm
> +      - qcom,sc7180-lpasscorecc
> +
> +  clocks:
> +    items:
> +      - description: gcc_lpass_sway clock from GCC

Needs bi_tcxo description.

> +
> +  clock-names:
> +    items:
> +      - const: iface

Needs bi_tcxo

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: lpass core cc register
> +      - description: lpass audio cc register
> +
> +  reg-names:
> +    items:
> +      - const: lpass_core_cc
> +      - const: lpass_audio_cc
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: qcom,sc7180-lpasshm
> +then:
> +  properties:
> +    reg:
> +      maxItems: 1
> +
> +else:
> +  properties:
> +    reg:
> +      minItems: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +    #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
> +    clock-controller@63000000 {
> +      compatible =3D "qcom,sc7180-lpasshm";
> +        reg =3D <0x63000000 0x28>;
> +        clocks =3D <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
> +        clock-names =3D "iface";
> +        #clock-cells =3D <1>;
> +        #power-domain-cells =3D <1>;
> +    };
> +
> +  - |
> +    clock-controller@62d00000 {
> +        compatible =3D "qcom,sc7180-lpasscorecc";
> +        reg =3D <0x62d00000 0x50000>,
> +            <0x62780000 0x30000>;

Tabbing looks wrong. Just use spaces?

> +        reg-names =3D "lpass_core_cc", "lpass_audio_cc";
> +        clocks =3D <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
> +        clock-names =3D "iface";
> +        power-domains =3D <&lpass_hm LPASS_CORE_HM_GDSCR>;
> +        #clock-cells =3D <1>;
> +        #power-domain-cells =3D <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,gcc-sc7180.h b/include/dt-bin=
dings/clock/qcom,gcc-sc7180.h
> index 992b67b..bdf43adc 100644
> --- a/include/dt-bindings/clock/qcom,gcc-sc7180.h
> +++ b/include/dt-bindings/clock/qcom,gcc-sc7180.h
> @@ -138,6 +138,7 @@
>  #define GCC_MSS_Q6_MEMNOC_AXI_CLK                              128
>  #define GCC_MSS_SNOC_AXI_CLK                                   129
>  #define GCC_SEC_CTRL_CLK_SRC                                   130
> +#define GCC_LPASS_CFG_NOC_SWAY_CLK                             131
> =20
>  /* GCC resets */
>  #define GCC_QUSB2PHY_PRIM_BCR                                  0

This hunk should be in the next patch. Oh but then that patch should come
before this one so the binding can use it. Either way, shouldn't be part
of this patch.
