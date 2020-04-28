Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A05C1BC44B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 17:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgD1P6t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 11:58:49 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33864 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728105AbgD1P6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 11:58:48 -0400
Received: by mail-ot1-f66.google.com with SMTP id 72so33488335otu.1;
        Tue, 28 Apr 2020 08:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MivbelJxNHa4mdFZfVhvWBP5Vwv2IXDtOtO6A6eppmk=;
        b=YyGmKNyi5r8qSORYGgMGiUdYHSnp9UN1KD7+lKwZwpJMfGiJiiUsxarrNvQGpc+H0r
         +C/aDCl6iYlD87DXHuVDy6+O14W61UNHXtGmxT4hVRAXvK2vKdFhsT4HxvyAXbFojI8Z
         rjp/eh6shjNdbdeBKRyliI/B8XG3oHfSL35UNz1hs4X2n8O5+TUTP5R7OS2H8eyt8REV
         awUSWmRjH3TDTk271vPr75IK7tbeZS5nPiL/LxFrYiQGotfZYdnamSUaVBHjKr7cc/04
         tSfKx9xALeA+bxT0TNHaK1j4LJC0JTBQRY+lzid7cBnWwUfx5KcE8J5/lGLaqP1NhGJE
         aHmQ==
X-Gm-Message-State: AGi0PuauXMIsuI2o9pDf57Co8LKUzu5++qnY3V9pfYnPZhrPczaXycj1
        mqMgh29Fdtk4pKBqGt5JAA==
X-Google-Smtp-Source: APiQypL2q5pmI3xD++E1lAurIiqAjUjSCNH77eIrxVFi+r/6KnDIqJqluLOrTGCDXGiX60gxAFnFzg==
X-Received: by 2002:aca:4a0c:: with SMTP id x12mr3438710oia.19.1588089527751;
        Tue, 28 Apr 2020 08:58:47 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q142sm4938585oic.44.2020.04.28.08.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 08:58:47 -0700 (PDT)
Received: (nullmailer pid 2205 invoked by uid 1000);
        Tue, 28 Apr 2020 15:58:46 -0000
Date:   Tue, 28 Apr 2020 10:58:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] devicetree: bindings: phy: Document ipq806x dwc3
 qcom phy
Message-ID: <20200428155846.GA29778@bogus>
References: <20200415210729.9618-1-ansuelsmth@gmail.com>
 <20200415210729.9618-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415210729.9618-2-ansuelsmth@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 15, 2020 at 11:07:27PM +0200, Ansuel Smith wrote:
> Document dwc3 qcom phy hs and ss phy bindings needed to correctly
> inizialize and use usb on ipq806x SoC.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
> v3:
> * Use explicit reg instead of regmap
> 
>  .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 58 +++++++++++++++
>  .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 70 +++++++++++++++++++
>  2 files changed, 128 insertions(+)
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
> index 000000000000..29a7d3aed289
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
> @@ -0,0 +1,70 @@
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
> +      - "ref" Is required
> +      - "xo"	Optional external reference clock
> +    items:
> +      - const: ref
> +      - const: xo
> +
> +  rx_eq:

qcom,rx-eq

> +    maxItems: 1

Is this an array?

> +    description: Override value for rx_eq. Default is 4.
> +
> +  tx_deamp_3_5db:

qcom,tx-deamp-3-5db

> +    maxItems: 1
> +    description: Override value for transmit preemphasis. Default is 23.

default: 23

> +
> +  mpll:

qcom,mpll

> +    maxItems: 1
> +    description: Override value for mpll. Default is 0.

Constraints?

default: 0

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
