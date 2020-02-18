Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABDA5163355
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 21:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgBRUqB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 15:46:01 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40074 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgBRUqA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 15:46:00 -0500
Received: by mail-oi1-f196.google.com with SMTP id a142so21516426oii.7;
        Tue, 18 Feb 2020 12:46:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7Et/eZlIxf7cVf5P7AQvi+7oih65Y9drHHn98Cm1z2c=;
        b=nL9CNNhwaWbRNkriyrlk1JekTV8gx+c2QLi11WmPhANAubSXF7KE3rbN5m8LqF7jlL
         ajkqFg981z0IYoFmcmP7RBJ+rhKmp20/ZsWl34lOPnr+cOfwuEfPdjCH85o8dGnbqyl2
         wfuZqzk1/C9/ub8ieJW2JH3WwnOnuQvf6pwP58Rmbi9JgV8Qe85rmj4MW81PqY3wgCyO
         DhXmVVuRjLyjPDn290uMwq2nuYqvGpjz8XMlndSxcLvroofBj6kQw7ppaeDwPmN2r9vP
         B5nhcmmg6MA4/hpWOBFqb/luTpaN8Tx0w1HZfyxZ20q2VMoXk1cUk9D20r+oeo0VoemN
         reCw==
X-Gm-Message-State: APjAAAWEvq13CMIxyPKRQswepxyIEmyyf4W4yavXdyKbpM5vuuDEUkFl
        6ouBuknkfgfnEHM+CVWJ/w==
X-Google-Smtp-Source: APXvYqy0h6z6zxkOcLW5ZpqwVf1OvcOGoME5M5x/yDLACyFfWRITn+hHLzeNT4JN34tyFwI1ahQ6+w==
X-Received: by 2002:a05:6808:55:: with SMTP id v21mr2033546oic.14.1582058760055;
        Tue, 18 Feb 2020 12:46:00 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j24sm1733196otk.7.2020.02.18.12.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 12:45:59 -0800 (PST)
Received: (nullmailer pid 7607 invoked by uid 1000);
        Tue, 18 Feb 2020 20:45:58 -0000
Date:   Tue, 18 Feb 2020 14:45:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 04/18] dt-bindings: Add Qualcomm USB SuperSpeed PHY
 bindings
Message-ID: <20200218204558.GA5022@bogus>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
 <20200210120723.91794-5-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210120723.91794-5-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 10, 2020 at 12:07:09PM +0000, Bryan O'Donoghue wrote:
> From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> 
> Binding description for Qualcomm's Synopsys 1.0.0 SuperSpeed PHY. This PHY
> appears in a number of SoCs on various flavors of 20nm and 28nm nodes.
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
>  .../devicetree/bindings/phy/qcom,usb-ss.yaml  | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
> new file mode 100644
> index 000000000000..377b9e1e39d3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
> @@ -0,0 +1,83 @@
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

Pretty generic... Only 1 SS USB PHY in all of QCom forever?

IOW, this needs an SoC specific compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: rpmcc clock
> +      - description: PHY AHB clock
> +      - description: SuperSpeed pipe clock
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: ahb
> +      - const: pipe
> +
> +  vdd-supply:
> +    description: phandle to the regulator VDD supply node.
> +
> +  vdda1p8-supply:
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
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - vdd-supply
> +  - vdda1p8-supply
> +
> +additionalProperties: false
> +
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
> +        clock-names = "ref", "ahb", "pipe";
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
