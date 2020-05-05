Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5925B1C60E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 21:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgEETOy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 15:14:54 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46976 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbgEETOx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 15:14:53 -0400
Received: by mail-ot1-f68.google.com with SMTP id z25so2636199otq.13;
        Tue, 05 May 2020 12:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c07EkN8nUavQhuddMPdcCa0IqRMVwevRP8t8M8iGngk=;
        b=R5O4evYzv3xcI7CQy76kYyUB+FQg0LmcJDAyu97CUOtKauKAICBWRPpMVFEFlfd08b
         RCl2q6e3+FGM3qnODMR+UKrkGRR2YZX+2F61V8aex7S778JIX55FuDOwWFRuYfl783UC
         X7i3acBxNddZQ4NJ+5CMH7BjAj3/Pm2DotgY6KuLgw+BDykka74A7IIiXbi0/8ZTbCqV
         nNAFYdFnn72ARLEIE6ti//wDjVg6dBCw49aMaEVvR7Rbl6qat8PW5MxUMxpqVNQOZWKy
         ZU0g4MrpBgMVbyWHd0i2WqGqdiQW+VA2VELw7ko5knDd+IIXR19Kj7rsb+n9fXTdl5g9
         +Zvw==
X-Gm-Message-State: AGi0PubJgDiEvKv2/X3xh1d8SKEO6OBaXcJH9vgzGzlUL2BAHiE+Kcvb
        3pqJyqMgnO2qOEgkjD/f5w==
X-Google-Smtp-Source: APiQypLJ7B8BekQTVMEcUznrg8i5h9ec/mhxt5tyxQ9F79nU+fqxew4SDSJu20DnhOGzihLlcUNGbg==
X-Received: by 2002:a9d:6c09:: with SMTP id f9mr3830759otq.94.1588706092211;
        Tue, 05 May 2020 12:14:52 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n132sm790879oig.49.2020.05.05.12.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 12:14:51 -0700 (PDT)
Received: (nullmailer pid 31997 invoked by uid 1000);
        Tue, 05 May 2020 19:14:50 -0000
Date:   Tue, 5 May 2020 14:14:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] devicetree: bindings: phy: Document ipq806x dwc3
 qcom phy
Message-ID: <20200505191450.GA26404@bogus>
References: <20200501215807.11175-1-ansuelsmth@gmail.com>
 <20200501215807.11175-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501215807.11175-2-ansuelsmth@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 01, 2020 at 11:58:05PM +0200, Ansuel Smith wrote:
> Document dwc3 qcom phy hs and ss phy bindings needed to correctly
> inizialize and use usb on ipq806x SoC.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
> v5:
> * Fix dt_binding_check error
> v4:
> * Add qcom to specific bindings
> v3:
> * Use explicit reg instead of regmap
> 
>  .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 58 ++++++++++++++
>  .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 79 +++++++++++++++++++
>  2 files changed, 137 insertions(+)
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
> index 000000000000..fa10a1c51cf0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
> @@ -0,0 +1,79 @@
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
> +    description: |
> +      - "ref" Required.
> +      - "xo"	Optional external reference clock.

description just repeats what the schema says. Just drop.

> +    items:
> +      - const: ref
> +      - const: xo
> +
> +  qcom,rx_eq:

s/_/-/

> +    maxItems: 1

Drop. Not an array.

> +    description: Override value for rx_eq.
> +    default: 4

0-2^32 are okay values?

> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  qcom,tx_deamp_3_5db:

Same issues in this one.

> +    maxItems: 1
> +    description: Override value for transmit preemphasis.
> +    default: 23
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  qcom,mpll:

And here.

> +    maxItems: 1
> +    description: Override value for mpll.
> +    default: 0
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
