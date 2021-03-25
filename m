Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBFCB349C95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 23:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhCYW7M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 18:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbhCYW6j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 18:58:39 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC149C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 15:58:39 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id y32so2159849pga.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 15:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=hw+3sv5+PL5lIV4V4w73UqWJdbAiZ4X8q9GG5F6ZhhI=;
        b=AMAjy49h9dUuGz9f6RZUhA+SjsLdLpe99v8Xx6VzeFxRkGa1ec0dpi5ugAmmJ97qm+
         CPhEsFeeW11dyKMARcuIn1ckwN5OdufL3Tl45s/czTPimGSCpMvbYhePAoFwbZ+JWCdl
         bhkyr7fHiiuX2cJW4M+CjCw9q/f+w+ew3CHk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=hw+3sv5+PL5lIV4V4w73UqWJdbAiZ4X8q9GG5F6ZhhI=;
        b=qQxDhdMrXexH/ouu8sDmV8YbgcJnpIkz80gdfVXjUEPgZYlLAB/OTl0z83nVJSm0T5
         0GDdNm2a9hbzIXLujIPSL9b398TsMb/br5FjZehpbip9jm0MH9gnevAu6e98sxuJSlmL
         OLgoZokbyF2elodPqg3NVyAP7t9qXPSFZdLCnSs09M9IdPcaQD1yhPFiNzNGlpq0Nlpu
         aQu7bofb8q2wWbfwA1mA7dnGfs1g2MLSK3GAMqPIgeEXrm5ial7OJJ+pGhZsTd0n+zTw
         4Bj/amKTG/smd2v1bDB63Fs/vnUU7BRkIgy3Lh2Oot706Faj+EXDK3gUk2VZJ58yVgf5
         B8ew==
X-Gm-Message-State: AOAM5332xpPaZ/0ZHKaWjqvelnwv1ZJYNJe5qNXe0c3fSJEwfOWCD2p2
        evPOChAR3s3Zke8laq65hnSRGA==
X-Google-Smtp-Source: ABdhPJzmTKgkYiPmMYbBf05OIv9EvQJrIyjt4h41rEE4zaAAqoPcqAFZjG1sQO3VmfyoJJbmz1OjDg==
X-Received: by 2002:a63:4441:: with SMTP id t1mr9698954pgk.124.1616713119197;
        Thu, 25 Mar 2021 15:58:39 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:18a3:238:26c5:1521])
        by smtp.gmail.com with ESMTPSA id u2sm6634077pfn.79.2021.03.25.15.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 15:58:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1616673661-20038-3-git-send-email-mkrishn@codeaurora.org>
References: <1616673661-20038-1-git-send-email-mkrishn@codeaurora.org> <1616673661-20038-3-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v14 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI PHY bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Thu, 25 Mar 2021 15:58:37 -0700
Message-ID: <161671311714.3012082.4777798674596112311@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-03-25 05:01:00)
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.y=
aml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> new file mode 100644
> index 0000000..4a26bef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DSI 10nm PHY
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +allOf:
> +  - $ref: dsi-phy-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-10nm
> +      - const: qcom,dsi-phy-10nm-8998
> +
> +  reg:
> +    items:
> +      - description: dsi phy register set
> +      - description: dsi phy lane register set
> +      - description: dsi pll register set
> +
> +  reg-names:
> +    items:
> +      - const: dsi_phy
> +      - const: dsi_phy_lane
> +      - const: dsi_pll
> +
> +  vdds-supply:
> +    description: |
> +      Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
> +      connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - vdds-supply
> +
> +unevaluatedProperties: false

additionalProperties: false instead? This comment applies to the other
bindings in this patch.

> +
> +examples:
> +  - |
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +     dsi-phy@ae94400 {
> +         compatible =3D "qcom,dsi-phy-10nm";
> +         reg =3D <0x0ae94400 0x200>,
> +               <0x0ae94600 0x280>,
> +               <0x0ae94a00 0x1e0>;
> +         reg-names =3D "dsi_phy",
> +                     "dsi_phy_lane",
> +                     "dsi_pll";
> +
> +         #clock-cells =3D <1>;
> +         #phy-cells =3D <0>;
> +
> +         vdds-supply =3D <&vdda_mipi_dsi0_pll>;
> +         clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&rpmhcc RPMH_CXO_CLK>;
> +         clock-names =3D "iface", "ref";
> +     };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.y=
aml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> new file mode 100644
> index 0000000..72a00cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-14nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DSI 14nm PHY
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +allOf:
> +  - $ref: dsi-phy-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-14nm
> +      - const: qcom,dsi-phy-14nm-660
> +
> +  reg:
> +    items:
> +      - description: dsi phy register set
> +      - description: dsi phy lane register set
> +      - description: dsi pll register set
> +
> +  reg-names:
> +    items:
> +      - const: dsi_phy
> +      - const: dsi_phy_lane
> +      - const: dsi_pll
> +
> +  vcca-supply:
> +    description: Phandle to vcca regulator device node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - vcca-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +     dsi-phy@ae94400 {
> +         compatible =3D "qcom,dsi-phy-14nm";
> +         reg =3D <0x0ae94400 0x200>,
> +               <0x0ae94600 0x280>,
> +               <0x0ae94a00 0x1e0>;
> +         reg-names =3D "dsi_phy",
> +                     "dsi_phy_lane",
> +                     "dsi_pll";
> +
> +         #clock-cells =3D <1>;
> +         #phy-cells =3D <0>;
> +
> +         vcca-supply =3D <&vcca_reg>;
> +         clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&rpmhcc RPMH_CXO_CLK>;
> +         clock-names =3D "iface", "ref";
> +     };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.y=
aml b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
> new file mode 100644
> index 0000000..743806d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-20nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DSI 20nm PHY
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +allOf:
> +  - $ref: dsi-phy-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-20nm
> +
> +  reg:
> +    items:
> +      - description: dsi pll register set
> +      - description: dsi phy register set
> +      - description: dsi phy regulator register set
> +
> +  reg-names:
> +    items:
> +      - const: dsi_pll
> +      - const: dsi_phy
> +      - const: dsi_phy_regulator
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
> +  - vddio-supply
> +  - vcca-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +     dsi-phy@fd922a00 {
> +         compatible =3D "qcom,dsi-phy-20nm";
> +         reg =3D <0xfd922a00 0xd4>,
> +               <0xfd922b00 0x2b0>,
> +               <0xfd922d80 0x7b>;
> +         reg-names =3D "dsi_pll",
> +                     "dsi_phy",
> +                     "dsi_phy_regulator";
> +
> +         #clock-cells =3D <1>;
> +         #phy-cells =3D <0>;
> +
> +         vcca-supply =3D <&vcca_reg>;
> +         vddio-supply =3D <&vddio_reg>;
> +
> +         clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&rpmhcc RPMH_CXO_CLK>;
> +         clock-names =3D "iface", "ref";
> +     };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.y=
aml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> new file mode 100644
> index 0000000..78f6b16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-28nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DSI 28nm PHY
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +allOf:
> +  - $ref: dsi-phy-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-28nm-hpm
> +      - const: qcom,dsi-phy-28nm-lp
> +      - const: qcom,dsi-phy-28nm-8960
> +
> +  reg:
> +    items:
> +      - description: dsi pll register set
> +      - description: dsi phy register set
> +      - description: dsi phy regulator register set
> +
> +  reg-names:
> +    items:
> +      - const: dsi_pll
> +      - const: dsi_phy
> +      - const: dsi_phy_regulator
> +
> +  vddio-supply:
> +    description: Phandle to vdd-io regulator device node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - vddio-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +     dsi-phy@fd922a00 {
> +         compatible =3D "qcom,dsi-phy-28nm";
> +         reg =3D <0xfd922a00 0xd4>,
> +               <0xfd922b00 0x2b0>,
> +               <0xfd922d80 0x7b>;
> +         reg-names =3D "dsi_pll",
> +                     "dsi_phy",
> +                     "dsi_phy_regulator";
> +
> +         #clock-cells =3D <1>;
> +         #phy-cells =3D <0>;
> +
> +         vddio-supply =3D <&vddio_reg>;
> +
> +         clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&rpmhcc RPMH_CXO_CLK>;
> +         clock-names =3D "iface", "ref";
> +     };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-common=
.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
> new file mode 100644
> index 0000000..c81399f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI PHY common dt properties
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  This defines the DSI PHY dt properties which are common for all
> +  dsi phy versions.
> +
> +properties:
> +  "#clock-cells":
> +    const: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Display AHB clock
> +      - description: Board XO source
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ref
> +
> +required:
> +  - clocks
> +  - clock-names

Why isn't #phy-cells and #clock-cells always required? I would guess
power-domains may also always be required.

> +
> +additionalProperties: true
> +...
