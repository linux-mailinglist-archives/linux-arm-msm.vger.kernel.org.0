Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930632B1727
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 09:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgKMIZu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 03:25:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:53902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgKMIZu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 03:25:50 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDD9120B80;
        Fri, 13 Nov 2020 08:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605255949;
        bh=5Yk3gV0oJDAUAzplpg16TibsmWQlxH5hgiS1jHN+tSw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eFqRPUkHpnmi0XrChjGgg/NKWF/0Y5xqD6Kfb19H/UCilMhwQf8Y6CwQY3vZC6w4E
         TOt3Ouvx6YRWHKocdHoVHaW++UDwK0i3PqGIkTpHl3b0NMgeq4GHgmDfuXRLONklJA
         FDnZzpAOR/lY96soNIXqxs7hyqijOaSM1KGLvsvk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1602766748-25490-2-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1602766748-25490-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1602766748-25490-2-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: spmi: document binding for the Mediatek SPMI controller
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        srv_heupstream@mediatek.com
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 13 Nov 2020 00:25:47 -0800
Message-ID: <160525594725.3428466.12052263156487418623@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Hsin-Hsiung Wang (2020-10-15 05:59:07)
> This adds documentation for the SPMI controller found on Mediatek SoCs.
>=20
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>

I don't know what's going on but my MUA sees a bunch of CRLF line
endings in these patches.

> diff --git a/Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.yaml b/=
Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.yaml
> new file mode 100644
> index 000000000000..39459ca2e0da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/spmi-mtk-pmif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek SPMI Controller Device Tree Bindings
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Matthias Brugger <matthias.bgg@gmail.com>

Is there someone at mediatek who can be the maintainer of this binding?

> +
> +description: |+

What's up with the plus?

> +  On MediaTek SoCs the PMIC is connected via SPMI and the controller all=
ows
> +  for multiple SoCs to control a single SPMI master.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6873-spmi
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: "pmif"
> +      - const: "spmimst"
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: "pmif_sys_ck"
> +      - const: "pmif_tmr_ck"
> +      - const: "spmimst_clk_mux"
> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-parents:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names

Is reg-names really required?

> +  - clocks
> +  - clock-names

I think we need additionalProperties: False here

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +
> +    spmi: spmi@10027000 {
> +        compatible =3D "mediatek,mt6873-spmi";
> +        reg =3D <0 0x10027000 0 0x000e00>,
> +              <0 0x10029000 0 0x000100>;

I think we can drop the two cells and just have one cell binding here?

> +        reg-names =3D "pmif", "spmimst";
> +        clocks =3D <&infracfg CLK_INFRA_PMIC_AP>,
> +                 <&infracfg CLK_INFRA_PMIC_TMR>,
> +                 <&topckgen CLK_TOP_SPMI_MST_SEL>;
> +        clock-names =3D "pmif_sys_ck",
> +                      "pmif_tmr_ck",
> +                      "spmimst_clk_mux";
> +        assigned-clocks =3D <&topckgen CLK_TOP_PWRAP_ULPOSC_SEL>;
> +        assigned-clock-parents =3D <&topckgen CLK_TOP_OSC_D10>;
> +    };
> +...
