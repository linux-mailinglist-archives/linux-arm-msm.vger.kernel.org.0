Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDD21F5D22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 22:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgFJU0m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 16:26:42 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37607 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbgFJU0m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 16:26:42 -0400
Received: by mail-io1-f67.google.com with SMTP id r2so3838750ioo.4;
        Wed, 10 Jun 2020 13:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dLb7+PK/r7ZuXzs/JmtPoYfJOAKaZP0F2k4snoGnWsU=;
        b=k+c8qYuPb25cGW4peDqRuSLPhG8c1ugseYt1knsjVyCpHHAohFnoUXXVSrrss+/KhJ
         klBbGFksueffg1H7P/KlWzFkA2bpjR3wW+TDdqnPpWKan+6PtHeHGrdicSdwH/h1Jrhx
         934o3wdOZ9Pq7gP2xETitp1p2QCZwbeSbDMaI6aNkN4yteo05tYT2JTfRKOpifBMdyGd
         /LYtB+Kf9UUyjuq7pGqPCuHufIoWewysa+bq5oBYDofbk4uWfA/0YFunBMaeA7wsECX6
         0fIrF5HHErTZjiRnRAJaMTp/4e4YuCbvnaq28vfRruFqcK6XagC/Zyli2QqnqmHOOmQz
         ve8w==
X-Gm-Message-State: AOAM531ISWY+AFZqD5yIVlV5XDUIXezVHaQZ+ZeHHMeT9P2CKjGGlZzj
        aXmr0bQOIID9VV4LlcEAKw==
X-Google-Smtp-Source: ABdhPJyAmUHIBz4O89zykUj+XKP55VbFK+EU3Y8jWd5wfBs0TJ/1pGP+ZZc0aZlh3G9jL0gzne9Igg==
X-Received: by 2002:a6b:ab82:: with SMTP id u124mr3783659ioe.137.1591820800305;
        Wed, 10 Jun 2020 13:26:40 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y12sm414686ili.83.2020.06.10.13.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:26:39 -0700 (PDT)
Received: (nullmailer pid 3654596 invoked by uid 1000);
        Wed, 10 Jun 2020 20:26:38 -0000
Date:   Wed, 10 Jun 2020 14:26:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/2] devicetree: bindings: phy: Document ipq806x dwc3
 qcom phy
Message-ID: <20200610202638.GA3649967@bogus>
References: <20200603132237.6036-1-ansuelsmth@gmail.com>
 <20200603132237.6036-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603132237.6036-2-ansuelsmth@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 03, 2020 at 03:22:35PM +0200, Ansuel Smith wrote:
> Document dwc3 qcom phy hs and ss phy bindings needed to correctly
> inizialize and use usb on ipq806x SoC.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
> v6:
> * Add maximum value
> v5:
> * Fix dt_binding_check error
> v4:
> * Add qcom to specific bindings
> v3:
> * Use explicit reg instead of regmap
> 
>  .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 58 ++++++++++++++
>  .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 76 +++++++++++++++++++
>  2 files changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
> new file mode 100644
> index 000000000000..c019de7478e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
> @@ -0,0 +1,58 @@
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
> +    description: |
> +      - "ref" Is required
> +      - "xo"	Optional external reference clock

This is just saying what the schema says. Drop it.

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
> index 000000000000..3696a8d7a5c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
> @@ -0,0 +1,76 @@
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
> +    description: Override value for rx_eq.
> +    default: 4
> +    maximum: 7
> +    allOf:

You can drop 'allOf' now and just do $ref directly.

> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  qcom,tx-deamp-3_5db:
> +    description: Override value for transmit preemphasis.
> +    default: 23
> +    maximum: 63
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  qcom,mpll:
> +    description: Override value for mpll.
> +    default: 0
> +    maximum: 7
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
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
> 
