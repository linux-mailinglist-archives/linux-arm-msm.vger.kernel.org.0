Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3053110CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 20:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbhBER3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 12:29:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbhBER1Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 12:27:16 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE16BC061756
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 11:08:59 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id t11so1518812pgu.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 11:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=WegjrX6b31rCH316vzEP9pVBbElEqSCMHgHsoE9NTLc=;
        b=Oo3nyugxpZwE7IhTTRk6daw0yTraxs48s9KBWI3CXhjdjj2O9uHSXgm8IAtbdZyKcv
         Ircm49jM9QMjYKGQ2trOvZdc1MU38uJJPEPFx4ap0XBb2tbI+3Z9m07/gwpmpqX9QWID
         8Tv3fKD9SzXfrkVmBInUImP2vygrGNd70NlIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=WegjrX6b31rCH316vzEP9pVBbElEqSCMHgHsoE9NTLc=;
        b=ETH9ff6Hb9qfjGyjT9Q9AhDkbmBR/dJR9EJIATFpFyJIXdcWjy+EDcCB0cMSGZ1mM+
         eG+9pllMeAa3BxqE94lvnpY7bXM4En0BqvBB+zPj8I/oCcP0j+hRcI3tevEFXL27ymiC
         X2Q5YB1gdIpe96pTxQ0qmA+p3cAhwtkGQdB2FH7832KJp+XcAElggeDJmPqebhOCYaC4
         5Ocw5SHPObT0yGTfPME/fDSTzs5hMe579xo8HQtLmPgcDzy2YjOhu+uU55imTEvEEWD3
         utlDIoIS63Sv6dHUAJ7JZ6aGQyQjyKbziaQDoCY0UY9p4vuOgC3tWdNTn16HFcY9jGkJ
         cwQA==
X-Gm-Message-State: AOAM5327iQZ+4w9Vsy8DDQMGSu2xJ/B2oKyc773OHyhT7OwJ4WBqEjNQ
        nJNKqN2uzZyUGmZa4kqaM4rJmA==
X-Google-Smtp-Source: ABdhPJx276jUemlTQ22fyElSRdUhISNDkM8nGx4Cs7mcgkOaqIlS/Wu09kZp3T0cfhB/HYuA1Lzo+Q==
X-Received: by 2002:a05:6a00:1a4b:b029:1d2:8522:75e7 with SMTP id h11-20020a056a001a4bb02901d2852275e7mr5685647pfv.80.1612552139369;
        Fri, 05 Feb 2021 11:08:59 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3d74:5f76:aaaa:6cb8])
        by smtp.gmail.com with ESMTPSA id b129sm11434379pgc.52.2021.02.05.11.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 11:08:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1612420939-15502-3-git-send-email-mkrishn@codeaurora.org>
References: <1612420939-15502-1-git-send-email-mkrishn@codeaurora.org> <1612420939-15502-3-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v10 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI PHY bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Fri, 05 Feb 2021 11:08:57 -0800
Message-ID: <161255213727.76967.3173217084231917944@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-02-03 22:42:18)
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.y=
aml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> new file mode 100644
> index 0000000..cf6d09a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI 10nm PHY dt properties
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI 10nm PHY.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-10nm
> +      - const: qcom,dsi-phy-10nm-8998
> +
> +  reg-names:
> +    items:
> +      - const: dsi_phy
> +      - const: dsi_phy_lane
> +      - const: dsi_pll
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +    items:
> +      - description: Display AHB clock
> +      - description: Board XO source
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ref
> +
> +  vdds-supply:
> +    description: |
> +      Phandle to vdds regulator device node. This supply will be connect=
ed to
> +      DSI0_MIPI_DSI_PLL_VDDA0P9 pin.

Cool, can we get this same description for the other SoCs? It helps SoC
integrators understand the pin on the SoC and how it relates to this
supply because the name is different.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - vdds-supply
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +     soc {
> +       #address-cells =3D <2>;
> +       #size-cells =3D <2>;

You can leave out the soc node.

> +
> +       mdss@ae00000 {
> +         #address-cells =3D <2>;
> +         #size-cells =3D <2>;
> +         reg =3D <0 0xae00000 0 0x1000>;
> +
> +         dsi-phy@ae94400 {
> +               compatible =3D "qcom,dsi-phy-10nm";
> +               reg =3D <0 0x0ae94400 0 0x200>,
> +                     <0 0x0ae94600 0 0x280>,
> +                     <0 0x0ae94a00 0 0x1e0>;
> +               reg-names =3D "dsi_phy",
> +                           "dsi_phy_lane",
> +                           "dsi_pll";
> +
> +               #clock-cells =3D <1>;
> +               #phy-cells =3D <0>;
> +
> +               vdds-supply =3D <&vdda_mipi_dsi0_pll>;
> +               clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                        <&rpmhcc RPMH_CXO_CLK>;
> +               clock-names =3D "iface", "ref";
> +
> +         };
> +       };
> +     };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.y=
aml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> new file mode 100644
> index 0000000..3ec6c25
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-14nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI 14nm PHY dt properties
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI 14nm PHY.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-14nm
> +      - const: qcom,dsi-phy-14nm-660
> +
> +  reg-names:
> +    items:
> +      - const: dsi_phy
> +      - const: dsi_phy_lane
> +      - const: dsi_pll
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +    items:
> +      - description: Display AHB clock
> +      - description: Board XO source
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ref
> +
> +  vcca-supply:
> +    description: Phandle to vcca regulator device node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - vcca-supply
> +
> +additionalProperties: true
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.y=
aml b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
> new file mode 100644
> index 0000000..ce1996e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-20nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI 20nm PHY dt properties
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI 20nm PHY.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-20nm
> +
> +  reg-names:
> +    items:
> +      - const: dsi_pll
> +      - const: dsi_phy
> +      - const: dsi_phy_regulator
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2

There's a maxItems but then clocks is required. Does that mean sometimes
no clocks are required? Seems like maxItems should be dropped.

> +    items:
> +      - description: Display AHB clock
> +      - description: Board XO source
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ref
> +
> +  vcca-supply:
> +    description: Phandle to vcca regulator device node.
> +
> +  vddio-supply:
> +    description: Phandle to vdd-io regulator device node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - vddio-supply
> +  - vcca-supply
> +
> +additionalProperties: true
> +...

Where's the example?

> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.y=
aml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> new file mode 100644
> index 0000000..dfe09fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-28nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI 28nm PHY dt properties
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI 28nm PHY.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-28nm-hpm
> +      - const: qcom,dsi-phy-28nm-lp
> +      - const: qcom,dsi-phy-28nm-8960
> +
> +  reg-names:
> +    items:
> +      - const: dsi_pll
> +      - const: dsi_phy
> +      - const: dsi_phy_regulator
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +    items:
> +      - description: Display AHB clock
> +      - description: Board XO source
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ref
> +
> +  vddio-supply:
> +    description: Phandle to vdd-io regulator device node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - vddio-supply
> +
> +additionalProperties: true
> +...

Where's the example?
