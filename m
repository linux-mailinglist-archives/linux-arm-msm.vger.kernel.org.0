Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA0CE14A946
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 18:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgA0Rxh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 12:53:37 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46964 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgA0Rxg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 12:53:36 -0500
Received: by mail-ot1-f66.google.com with SMTP id g64so9228083otb.13;
        Mon, 27 Jan 2020 09:53:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZwdeJdNohgFWX1mFD2UjbBw/HXmaaN29rT20q0J8HBI=;
        b=o7j6tNstDjVdxALJYsnH829D1SY/1ZujhSjShSls0By67cFDORF72V233vGpe0KGnc
         1dS1EM+OdQJ0v2dG1AGYAZcfFdJbsvaLGTagtCoBGmTMvr/CmRsezXuEAywfckMRcjZ8
         yhkwkWiIPRS6qmu0pFb4nXSxMZkh5of+HCIXBfY+pKb2vMjMgES+/y9xHukxI2ADOM7R
         BwvE85tbvy6KoFn74oPf3u9CSPVTZrYeNK1rA3PF2yHH43zyPmyKzVymlJfqd4gVfRPT
         8PJfw1SI5eQptPK+KQO02v4eq6/3O5UfYsuN6kieOA5vWXzAac0FcnX61Ev6adFoHVWR
         g4mw==
X-Gm-Message-State: APjAAAWErxZASChI2BlTdkuLPtz3kxihB/7j3VyXuPKq507h83vy3PNo
        nfK7XHvoRz1qhv9Ao736PBoaCns=
X-Google-Smtp-Source: APXvYqwdUCJv6mpkyNlq5MZ9t+xypOOB3E8o5xFdi8iB2ko7UaxiRDFXUY5FgcV40zfXH9dcLvJ12Q==
X-Received: by 2002:a9d:53c2:: with SMTP id i2mr12346342oth.43.1580147616069;
        Mon, 27 Jan 2020 09:53:36 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n64sm4379460otn.35.2020.01.27.09.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 09:53:35 -0800 (PST)
Received: (nullmailer pid 30258 invoked by uid 1000);
        Mon, 27 Jan 2020 17:53:34 -0000
Date:   Mon, 27 Jan 2020 11:53:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Sriharsha Allenki <sallenki@codeaurora.org>,
        Anu Ramanathan <anur@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 02/19] dt-bindings: phy: Add Qualcomm Synopsys
 Hi-Speed USB PHY binding
Message-ID: <20200127175334.GA12315@bogus>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
 <20200122185610.131930-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122185610.131930-3-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 22, 2020 at 06:55:53PM +0000, Bryan O'Donoghue wrote:
> From: Sriharsha Allenki <sallenki@codeaurora.org>
> 
> Adds bindings for QCS404 USB PHY supporting Low-Speed, Full-Speed and
> Hi-Speed USB connectivity on Qualcomm chipsets.
> 
> [bod: Converted to YAML. Changed name dropping snps, 28nm components]
> 
> Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
> Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/phy/qcom,qcs404-usb-hs.yaml      | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qcs404-usb-hs.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs404-usb-hs.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs404-usb-hs.yaml
> new file mode 100644
> index 000000000000..d71beb822ae2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs404-usb-hs.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom,qcs404-usb-hs.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Synopsys QCS-404 High-Speed PHY
> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |
> +  Qualcomm QCS-404 Low-Speed, Full-Speed, Hi-Speed USB PHY
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qcs404-usb-hsphy
> +
> +  reg:
> +    maxItems: 1
> +    description: USB PHY base address and length of the register map.
> +
> +  "#phy-cells":
> +    const: 0
> +    description: Should be 0. See phy/phy-bindings.txt for details.
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3
> +    description: phandles to rpmcc ref clock, PHY AHB clock, rentention clock.
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: phy
> +      - const: sleep
> +
> +  resets:
> +    items:
> +      - description: PHY core reset
> +      - description: POR reset
> +
> +  reset-names:
> +    items:
> +      - const: phy
> +      - const: por
> +
> +  vdd-supply:
> +    maxItems: 1

Supplies are always 1 entry, so drop this.

> +    description: phandle to the regulator VDD supply node.
> +
> +  vdda1p8-supply:
> +    maxItems: 1
> +    description: phandle to the regulator 1.8V supply node.
> +
> +  vdda3p3-supply:
> +    maxItems: 1
> +    description: phandle to the regulator 3.3V supply node.

No required properties?

Add:

additionalProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-qcs404.h>
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +    usb2_phy_prim: phy@7a000 {
> +        compatible = "qcom,qcs404-usb-hsphy";
> +        reg = <0x0007a000 0x200>;
> +        #phy-cells = <0>;
> +        clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
> +                 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
> +                 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
> +        clock-names = "ref", "phy", "sleep";
> +        resets = <&gcc GCC_USB_HS_PHY_CFG_AHB_BCR>,
> +                 <&gcc GCC_USB2A_PHY_BCR>;
> +        reset-names = "phy", "por";
> +    };
> +...
> -- 
> 2.25.0
> 
