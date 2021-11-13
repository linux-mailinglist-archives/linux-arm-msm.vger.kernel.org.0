Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C142144F4F7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Nov 2021 20:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236034AbhKMToA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 14:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233692AbhKMTn6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 14:43:58 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F68FC061766
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Nov 2021 11:41:06 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id q25so19671690oiw.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Nov 2021 11:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2vHg1qqtqXiJliidTPs49bmuTlWKsi3vywbe6cy1tIQ=;
        b=TtQx3VTFvdLy5GIJBjtYMFGwehCKC7foHrjRgofkbomGsPnJBQC+kO0DQTZeGFrtFF
         V/x+Ua7Yy4UlC4Ykf9NTDe6qBx40LSCj9tExGwDcUY8hVhsXu5FBHAaWGdSb0WN/K8xt
         /a86KARbTk4FBQBRo6s/PFqacMA8zYhSL1aiK4GbQUKdEIJybr9leCW8nZeghXQYSUt2
         Uyx/ijKPYMYK7VKcGKccs1Sk9jzaadQufx5c9K/BX2BmTXjQAzhACws5u9ZQ/KLk9nPz
         yYcvdPb6UujTJult2igMHAqogO6A7WOBxZ/jdmsaLnLnnV4Tc3kV4t9EOrFM1g5AwgLu
         /now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2vHg1qqtqXiJliidTPs49bmuTlWKsi3vywbe6cy1tIQ=;
        b=0spt+7N66jKw7uYWYuMhjKDjSWSK4bmkx9Uk6SQGIVKiT/l68YZ6+5mr8T7OmXeOWf
         Q4p1CpzChUoS/wj/1Sysn1gN54rk1NMkL+LF1bSOeB29tkKN9WLOwTbOkjWbJm3hFQAF
         Bfpiqlzo3YSv9uUa0FVtpAc4azE2lsb0Jtl2SzCxIGnGsHu4hpSCBcKRs46zf02v4CiU
         938XZVNA5fepvRVdiSHl6MOM69wqnMwFrhRGIdmPgMUadN9jLgcHludin9GMByJPXTY1
         lUzq66vyQi6zdQ+xYKY0FSTlukwAG7ftktSoh1wBrtlV0YuxcSSvIm6GLWlz4A+TNl+k
         vecg==
X-Gm-Message-State: AOAM532nwJ/euxNZyL6lRPSu0HtlmIFbMC2LNTIEe5+m6LQ0MWBGURew
        C298SGcW5A4WPI96FwGmhuQz3w==
X-Google-Smtp-Source: ABdhPJz9bIrPeJAgKdWsvJn5eQOMm01HZefPIyj3Szp7PnTntnt9OlkFeERffhY5blO5wxbcTimofw==
X-Received: by 2002:aca:5c82:: with SMTP id q124mr36550445oib.113.1636832465603;
        Sat, 13 Nov 2021 11:41:05 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p14sm1707175oov.0.2021.11.13.11.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 11:41:05 -0800 (PST)
Date:   Sat, 13 Nov 2021 13:41:00 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        stephan@gerhold.net, Thara Gopinath <thara.gopinath@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 07/22] dt-bindings: qcom-qce: Convert bindings to yaml
Message-ID: <YZAUzEGavOyhBcVm@builder.lan>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-8-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110105922.217895-8-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Nov 04:59 CST 2021, Bhupesh Sharma wrote:

> Convert Qualcomm QCE crypto devicetree binding to YAML.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../devicetree/bindings/crypto/qcom-qce.txt   | 25 -------
>  .../devicetree/bindings/crypto/qcom-qce.yaml  | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.txt
>  create mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.txt b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
> deleted file mode 100644
> index fdd53b184ba8..000000000000
> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -Qualcomm crypto engine driver
> -
> -Required properties:
> -
> -- compatible  : should be "qcom,crypto-v5.1"
> -- reg         : specifies base physical address and size of the registers map
> -- clocks      : phandle to clock-controller plus clock-specifier pair
> -- clock-names : "iface" clocks register interface
> -                "bus" clocks data transfer interface
> -                "core" clocks rest of the crypto block
> -- dmas        : DMA specifiers for tx and rx dma channels. For more see
> -                Documentation/devicetree/bindings/dma/dma.txt
> -- dma-names   : DMA request names should be "rx" and "tx"
> -
> -Example:
> -	crypto@fd45a000 {
> -		compatible = "qcom,crypto-v5.1";
> -		reg = <0xfd45a000 0x6000>;
> -		clocks = <&gcc GCC_CE2_AHB_CLK>,
> -			 <&gcc GCC_CE2_AXI_CLK>,
> -			 <&gcc GCC_CE2_CLK>;
> -		clock-names = "iface", "bus", "core";
> -		dmas = <&cryptobam 2>, <&cryptobam 3>;
> -		dma-names = "rx", "tx";
> -	};
> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> new file mode 100644
> index 000000000000..3a839c159d92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm crypto engine driver
> +
> +maintainers:
> +  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
> +
> +description: |

Nit. The '|' retains the formatting of the description, there's no need
for that.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +  This document defines the binding for the QCE crypto
> +  controller found on Qualcomm parts.
> +
> +properties:
> +  compatible:
> +    const: qcom,crypto-v5.1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: iface clocks register interface.
> +      - description: bus clocks data transfer interface.
> +      - description: core clocks rest of the crypto block.
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: core
> +
> +  dmas:
> +    items:
> +      - description: DMA specifiers for rx dma channel.
> +      - description: DMA specifiers for tx dma channel.
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - dmas
> +  - dma-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-apq8084.h>
> +    crypto-engine@fd45a000 {
> +        compatible = "qcom,crypto-v5.1";
> +        reg = <0xfd45a000 0x6000>;
> +        clocks = <&gcc GCC_CE2_AHB_CLK>,
> +                 <&gcc GCC_CE2_AXI_CLK>,
> +                 <&gcc GCC_CE2_CLK>;
> +        clock-names = "iface", "bus", "core";
> +        dmas = <&cryptobam 2>, <&cryptobam 3>;
> +        dma-names = "rx", "tx";
> +    };
> -- 
> 2.31.1
> 
