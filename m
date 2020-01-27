Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22B1A14A9E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 19:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgA0ShK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 13:37:10 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33551 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgA0ShK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 13:37:10 -0500
Received: by mail-ot1-f67.google.com with SMTP id b18so9435917otp.0;
        Mon, 27 Jan 2020 10:37:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ICbHNu8A8bhtHhbDmOEUiiPxJXfKbGBYxDSRbSQX0RY=;
        b=YnhwovSt6nMZcfBIAlSB/OOvkCQpvZ6uCfXBz9p2YZWKrJNIgvy8hpudxyDNlzpWgY
         +5iInSP2a3TpJph476NzZHbNJCLeQbwCJCLdi4ZQCQWaH9QfMykrVIdAklyIgB72aibr
         FGHwxIfqTL0WanfBiulyo4tgDSu54JMcJJgl0oQh//ZEmIwOu1hWpXVm0QuqcocBInOj
         8gt4VL1s9EB9xjry4jf3nEYkRO40nE3BUbuQJkaY1aOQP3QR0Whypk1uboTlUAX39iQt
         0avjLD6TX1HhrN86IBXejOGp2O9K+c3xyrKOWZ+LXkLLwlFhJ6SJQ8ESx4jBfSUUBCtg
         lw5g==
X-Gm-Message-State: APjAAAUehnzP09OEm4NWtsw44tGj094U26DvDuW+q6BEVpVXKmFLxeGR
        8Oa1dF0cX8tV311uD0WKyA==
X-Google-Smtp-Source: APXvYqwSDqquahahc9sOyi2lephhmCMoBVLnIhn0uYN4vGwsUQ+3EqQqmFeOu1agpR051zgktNiaNA==
X-Received: by 2002:a05:6830:124b:: with SMTP id s11mr13094651otp.333.1580150227768;
        Mon, 27 Jan 2020 10:37:07 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d11sm5793736otl.31.2020.01.27.10.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 10:37:06 -0800 (PST)
Received: (nullmailer pid 26821 invoked by uid 1000);
        Mon, 27 Jan 2020 18:37:05 -0000
Date:   Mon, 27 Jan 2020 12:37:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 04/19] dt-bindings: Add Qualcomm USB SuperSpeed PHY
 bindings
Message-ID: <20200127183705.GA30702@bogus>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
 <20200122185610.131930-5-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122185610.131930-5-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 22, 2020 at 06:55:55PM +0000, Bryan O'Donoghue wrote:
> From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> 
> Binding description for Qualcomm's Synopsys 1.0.0 SuperSpeed phy
> controller embedded in QCS404.
> 
> Based on Sriharsha Allenki's <sallenki@codeaurora.org> original
> definitions.
> 
> [bod: converted to yaml format]
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/phy/intel,lgm-emmc-phy.yaml      | 56 --------------

Working around errors? Should be fixed now, but not yet in linux-next.

>  .../devicetree/bindings/phy/qcom,usb-ss.yaml  | 75 +++++++++++++++++++
>  2 files changed, 75 insertions(+), 56 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml


> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
> new file mode 100644
> index 000000000000..3325b2f2e6a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom,usb-ss.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Synopsys 1.0.0 SuperSpeed USB PHY
> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |
> +  Qualcomm Synopsys 1.0.0 SuperSpeed USB PHY
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,usb-ssphy

Should be SoC specific.

> +
> +  reg:
> +    maxItems: 1
> +    description: USB PHY base address and length of the register map.

Can drop this. Doesn't really add anything.

> +
> +  "#phy-cells":
> +    const: 0
> +    description: Should be 0. See phy/phy-bindings.txt for details.

'Should be 0' is already expressed by the schema. The remaining 
reference isn't needed.

> +
> +  clocks:
> +    maxItems: 3
> +    minItems: 3
> +    description: phandles for rpmcc clock, PHY AHB clock, SuperSpeed pipe clock.

Split the description into 3 entries of 'items'. With that, 
minItems/maxItems is implicit.

> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: phy

'ahb' seems like a better name.

> +      - const: pipe
> +
> +  vdd-supply:
> +    maxItems: 1

Drop.

> +    description: phandle to the regulator VDD supply node.
> +
> +  vdda1p8-supply:
> +    maxItems: 1

Drop.

> +    description: phandle to the regulator 1.8V supply node.
> +
> +  resets:
> +    items:
> +      - description: COM reset
> +      - description: PHY reset line
> +
> +  reset-names:
> +    items:
> +      - const: com
> +      - const: phy

required and additionalProperties needed.

> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-qcs404.h>
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +    usb3_phy: usb3-phy@78000 {
> +        compatible = "qcom,usb-ssphy";
> +        reg = <0x78000 0x400>;
> +        #phy-cells = <0>;
> +        clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
> +                 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
> +                 <&gcc GCC_USB3_PHY_PIPE_CLK>;
> +        clock-names = "ref", "phy", "pipe";
> +        resets = <&gcc GCC_USB3_PHY_BCR>,
> +                 <&gcc GCC_USB3PHY_PHY_BCR>;
> +        reset-names = "com", "phy";
> +        vdd-supply = <&vreg_l3_1p05>;
> +        vdda1p8-supply = <&vreg_l5_1p8>;
> +    };
> +...
> -- 
> 2.25.0
> 
