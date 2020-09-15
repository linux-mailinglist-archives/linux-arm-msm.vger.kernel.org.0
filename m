Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B64269A49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 02:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgIOAPu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 20:15:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:58920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbgIOAPs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 20:15:48 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1AC79206E9;
        Tue, 15 Sep 2020 00:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600128947;
        bh=eJAKXbjQRhlUWNf6yttu6zsF7yiDxg1ojRKUmhKU2rE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fVaCKp6Kpiv+E8WkGRRSUgEYvetWdCMynnenDYkap3CJeSXzLLc/1EVOEtAw8cVyU
         lMGWBLMYTBwarJNPzUbrodotuNY0xHpomoKNEGitu0lB5iYjnCJnGabAvPynOMoSJu
         OAYIqVOUL7q3b+ZE0OwAzccczCs3CasCtHCLtpdE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1599584848-15530-3-git-send-email-tdas@codeaurora.org>
References: <1599584848-15530-1-git-send-email-tdas@codeaurora.org> <1599584848-15530-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 2/3] dt-bindings: clock: Add YAML schemas for the QCOM Camera clock bindings.
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
Date:   Mon, 14 Sep 2020 17:15:45 -0700
Message-ID: <160012894580.4188128.6576587604872852836@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-09-08 10:07:27)
> The Camera Subsystem clock provider have a bunch of generic properties
> that are needed in a device tree. Add a YAML schemas for those.
>=20
> Add clock ids for Camera clocks which are required to bring the camera

Why capitalize camera?

> subsystem out of reset.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../bindings/clock/qcom,sc7180-camcc.yaml          |  73 +++++++++++++
>  include/dt-bindings/clock/qcom,camcc-sc7180.h      | 121 +++++++++++++++=
++++++
>  2 files changed, 194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-c=
amcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,camcc-sc7180.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.ya=
ml b/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
> new file mode 100644
> index 0000000..07bd38e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sc7180-camcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Camera Clock & Reset Controller Binding for SC7180
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm camera clock control module which supports the clocks, resets=
 and
> +  power domains on SC7180.
> +
> +  See also:
> +  - dt-bindings/clock/qcom,camcc-sc7180.h.
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7180-camcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source

Why do we need board XO

> +      - description: Camera_ahb clock from GCC
> +      - description: Camera XO clock from GCC
> +

And also the gate on XO in GCC? Presumably only the one in GCC should be
going to the camera clock controller?

> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: iface
> +      - const: xo
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
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@ad00000 {
> +      compatible =3D "qcom,sc7180-camcc";
> +      reg =3D <0x0ad00000 0x10000>;
> +      clocks =3D <&rpmhcc RPMH_CXO_CLK>,
> +               <&gcc GCC_CAMERA_AHB_CLK>,
> +               <&gcc GCC_CAMERA_XO_CLK>;
> +      clock-names =3D "bi_tcxo", "iface", "xo";
> +      #clock-cells =3D <1>;
> +      #reset-cells =3D <1>;
> +      #power-domain-cells =3D <1>;
> +    };
> +...
