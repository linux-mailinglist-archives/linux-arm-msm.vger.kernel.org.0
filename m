Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C604A1A87B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 19:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730321AbgDNRio (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 13:38:44 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43058 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730099AbgDNRil (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 13:38:41 -0400
Received: by mail-ot1-f68.google.com with SMTP id g14so451589otg.10;
        Tue, 14 Apr 2020 10:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8Nz3sKqk6tf6wfMqMfDxAKL6dU6xyEXZ2XEc3RZw1kA=;
        b=HAea2NfyN4EFRHBhVGk45x5b1ywH72yfmLIX+OIf4N7IU41ZZgJQlIsdkf9JzvKfWd
         aDGUkIWXXNgf6OruWAIYGOXvogoqXyXN5Pqx7BSf0nOa+fPplI7anS1zgRRs1Tvat5U7
         ksCGk9BG9xvyZh8qd3c3UFRCQlGYgcYgFq35smDJcIUQIbGasG9NbttBq6eUTYjUTqc5
         e/KEkTZ6je/8bY0GnCNzVU3mYAuHk9LCsKmo7UqFzV75fHgO7aS8WKLIPPG2zNf4GOhQ
         B/Bw9LiGsKzUSSMBxPGhQSQr/oqgjypOpK294XQ/a7sCMIVaJl3KpQH+bwIjlMziPHD+
         rySA==
X-Gm-Message-State: AGi0PuamumCRgqT3zCvTLvm2P0jC+yyFY0t0A5n8DwUsWmeYuw5XsrXa
        cQMLy6QPcUPg8Fv19mnMWQ==
X-Google-Smtp-Source: APiQypLLc0miyc2capf1MVVpp0fAaq2ltXN508BsmSUu5FT95kopV2NU4H4Jg7eQPEjl2rrJC7bPYg==
X-Received: by 2002:a9d:2c1:: with SMTP id 59mr699714otl.321.1586885920167;
        Tue, 14 Apr 2020 10:38:40 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d61sm5640680otb.53.2020.04.14.10.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 10:38:39 -0700 (PDT)
Received: (nullmailer pid 2638 invoked by uid 1000);
        Tue, 14 Apr 2020 17:38:38 -0000
Date:   Tue, 14 Apr 2020 12:38:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] devicetree: bindings: phy: Document dwc3 qcom phy
Message-ID: <20200414173838.GA29176@bogus>
References: <20200403002608.946-1-ansuelsmth@gmail.com>
 <20200403002608.946-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403002608.946-2-ansuelsmth@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 03, 2020 at 02:26:05AM +0200, Ansuel Smith wrote:
> Document dwc3 qcom phy hs and ss phy bindings needed to correctly
> inizialize and use usb on ipq806x SoC
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../bindings/phy/qcom,dwc3-hs-usb-phy.yaml    | 65 +++++++++++++++++++
>  .../bindings/phy/qcom,dwc3-ss-usb-phy.yaml    | 65 +++++++++++++++++++
>  2 files changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,dwc3-ss-usb-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-phy.yaml
> new file mode 100644
> index 000000000000..0bb59e3c2ab8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-phy.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,dwc3-hs-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm DWC3 HS PHY CONTROLLER
> +
> +maintainers:
> +  - Ansuel Smith <ansuelsmth@gmail.com>
> +
> +description:
> +  DWC3 PHY nodes are defined to describe on-chip Synopsis Physical layer
> +  controllers. Each DWC3 PHY controller should have its own node.
> +
> +properties:
> +  compatible:
> +    const: qcom,dwc3-hs-usb-phy
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  regmap:
> +    maxItems: 1
> +    description: phandle to usb3 dts definition
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
> +  - regmap
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
> +
> +    hs_phy_0: hs_phy_0 {
> +      compatible = "qcom,dwc3-hs-usb-phy";
> +      regmap = <&usb3_0>;

If the registers for the phy are part of 'qcom,dwc3' then make this node 
a child of it.

> +      clocks = <&gcc USB30_0_UTMI_CLK>;
> +      clock-names = "ref";
> +      #phy-cells = <0>;
> +    };
> +
> +    usb3_0: usb3@110f8800 {
> +      compatible = "qcom,dwc3", "syscon";
> +      reg = <0x110f8800 0x8000>;
> +
> +      /* ... */

Incomplete examples should or will fail validation.

> +    };
