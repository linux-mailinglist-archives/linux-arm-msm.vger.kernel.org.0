Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6424327EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 21:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhJRTvL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 15:51:11 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:34661 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbhJRTvL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 15:51:11 -0400
Received: by mail-ot1-f48.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so152951otb.1;
        Mon, 18 Oct 2021 12:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AAoBj4y4weGMfJE/H2YUzE461Zo+UYbwtItvsEO1Bq0=;
        b=EHVWgI716m7OkjJMCLZVqV+EVYnqSs//3UYE5dWyyIQFUJwGBDVXj6NGzvinyB4oXf
         GgUzMKlDG1iryJ38SOlTPVx8t2seZ1tmquc9RD2e7CO9newyugeAMdaoHe1HoZEEgVv9
         IFNz2f2vRbL0y4ri5GadjurgK7lPJ8WxX7zyh/FFYKAECal2jwxwo6gWDOPETH5/fy8T
         9SD/yO3+kjFdNjbAv3RGc+Z8p1SYJNuEkEziZ3D7poFvhZWL2xPw6QNUvTpgkHW0zTfZ
         EbEd+/wY9Fkq+wrHB2xMnV0rjttSiY5neoeJXYz5IR0RFVJB8XDJwq7uXjxgeNfm7Fu9
         IBgA==
X-Gm-Message-State: AOAM531FnTU/VxY/QwsvN1e3iobgcryTKPhQQ7LZ4u+0BwV9WqPFX7sW
        +e86rfe97cHwqQGVurGAhw==
X-Google-Smtp-Source: ABdhPJzO339HRKj4AW98yudKu8l33V+dVFUqkR3/vATJbubDlMODK604QfCtHQumP/dOc5zpMWb41g==
X-Received: by 2002:a05:6830:1e08:: with SMTP id s8mr1515560otr.305.1634586539491;
        Mon, 18 Oct 2021 12:48:59 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e59sm3222734ote.14.2021.10.18.12.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 12:48:59 -0700 (PDT)
Received: (nullmailer pid 2836064 invoked by uid 1000);
        Mon, 18 Oct 2021 19:48:58 -0000
Date:   Mon, 18 Oct 2021 14:48:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        abhinavk@codeaurora.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Introduce Qualcomm eDP/DP PHY
 binding
Message-ID: <YW3PqhQHauDYRlwN@robh.at.kernel.org>
References: <20211016232128.2341395-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211016232128.2341395-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 16, 2021 at 04:21:27PM -0700, Bjorn Andersson wrote:
> Introduce a binding for the eDP/DP PHY hardware block found in several
> different Qualcomm platforms.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - None
> 
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> new file mode 100644
> index 000000000000..c258e4f7e332
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm DP/eDP PHY
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  The Qualcomm DP/eDP PHY is found in a number of Qualcomm platform and
> +  provides the physical interface for DisplayPort and Embedded Display Port.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc8180x-dp-phy
> +      - qcom,sc8180x-edp-phy

Is there a difference between DP and eDP?

Perhaps note what that is if so.

> +
> +  reg:
> +    items:
> +      - description: PHY base register block
> +      - description: tx0 register block
> +      - description: tx1 register block
> +      - description: PLL register block
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: aux
> +      - const: cfg_ahb
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@aec2a00 {
> +      compatible = "qcom,sc8180x-edp-phy";
> +      reg = <0x0aec2a00 0x1c0>,
> +            <0x0aec2200 0xa0>,
> +            <0x0aec2600 0xa0>,
> +            <0x0aec2000 0x19c>;
> +
> +      clocks = <&dispcc 0>, <&dispcc 1>;
> +      clock-names = "aux", "cfg_ahb";
> +
> +      #clock-cells = <1>;
> +      #phy-cells = <0>;
> +    };
> +...
> -- 
> 2.29.2
> 
> 
