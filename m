Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B258A2185F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 13:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728385AbgGHLVR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 07:21:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:47650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728658AbgGHLVR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 07:21:17 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A3DD20772;
        Wed,  8 Jul 2020 11:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594207277;
        bh=uEMpqJPXyTKnzmhKTl4BDaBptKj9HPBB3NJEF8PgMZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D8pTFkZUH8jeoGYRQT7C/Ic0J8K38qjB1S6wFeIuEBzVZ4zt8DIMD6UQUArwaAV2K
         Bp3KXeserCR9C/OsmSXM114UEHcmEbTnUvvxbWJ09de9YXXSojhz0b95gY6+BiInJI
         2+Tj90Z4C4OYCYYLKx41rBtSY/TqH73enFJQDA1s=
Date:   Wed, 8 Jul 2020 16:51:13 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH v7 2/2] devicetree: bindings: phy: Document
 ipq806x dwc3 qcom phy
Message-ID: <20200708112113.GG34333@vkoul-mobl>
References: <20200615205333.20747-1-ansuelsmth@gmail.com>
 <20200615205333.20747-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615205333.20747-2-ansuelsmth@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-06-20, 22:53, Ansuel Smith wrote:
> Document dwc3 qcom phy hs and ss phy bindings needed to correctly
> inizialize and use usb on ipq806x SoC.

Rob ?

> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
> v7:
> * Drop useless AllOf 
> v6:
> * Add maximum value
> v5:
> * Fix dt_binding_check error
> v4:
> * Add qcom to specific bindings
> v3:
> * Use explicit reg instead of regmap
> 
>  .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 55 ++++++++++++++
>  .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 73 +++++++++++++++++++
>  2 files changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
> new file mode 100644
> index 000000000000..23887ebe08fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,ipq806x-usb-phy-hs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm ipq806x usb DWC3 HS PHY CONTROLLER
> +
> +maintainers:
> +  - Ansuel Smith <ansuelsmth@gmail.com>
> +
> +description:
> +  DWC3 PHY nodes are defined to describe on-chip Synopsis Physical layer
> +  controllers used in ipq806x. Each DWC3 PHY controller should have its
> +  own node.
> +
> +properties:
> +  compatible:
> +    const: qcom,ipq806x-usb-phy-hs
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: ref
> +      - const: xo
> +
> +required:
> +  - compatible
> +  - "#phy-cells"
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
> +
> +    hs_phy_0: phy@110f8800 {
> +      compatible = "qcom,ipq806x-usb-phy-hs";
> +      reg = <0x110f8800 0x30>;
> +      clocks = <&gcc USB30_0_UTMI_CLK>;
> +      clock-names = "ref";
> +      #phy-cells = <0>;
> +    };
> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
> new file mode 100644
> index 000000000000..fa30c24b4405
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,ipq806x-usb-phy-ss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm ipq806x usb DWC3 SS PHY CONTROLLER
> +
> +maintainers:
> +  - Ansuel Smith <ansuelsmth@gmail.com>
> +
> +description:
> +  DWC3 PHY nodes are defined to describe on-chip Synopsis Physical layer
> +  controllers used in ipq806x. Each DWC3 PHY controller should have its
> +  own node.
> +
> +properties:
> +  compatible:
> +    const: qcom,ipq806x-usb-phy-ss
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: ref
> +      - const: xo
> +
> +  qcom,rx-eq:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Override value for rx_eq.
> +    default: 4
> +    maximum: 7
> +
> +  qcom,tx-deamp-3_5db:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Override value for transmit preemphasis.
> +    default: 23
> +    maximum: 63
> +
> +  qcom,mpll:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Override value for mpll.
> +    default: 0
> +    maximum: 7
> +
> +required:
> +  - compatible
> +  - "#phy-cells"
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
> +
> +    ss_phy_0: phy@110f8830 {
> +      compatible = "qcom,ipq806x-usb-phy-ss";
> +      reg = <0x110f8830 0x30>;
> +      clocks = <&gcc USB30_0_MASTER_CLK>;
> +      clock-names = "ref";
> +      #phy-cells = <0>;
> +    };
> -- 
> 2.25.1

-- 
~Vinod
