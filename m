Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFCFE44E361
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 09:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234614AbhKLIo2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 03:44:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbhKLIo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 03:44:28 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCBFC0613F5
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 00:41:37 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id t11so17191872ljh.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 00:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KSvh8KHURgcTWBUPLFGeUVbHkUcifiQEm231yb6rUOY=;
        b=NleVtWuk62GXAJjJrUq02jk+Gr5WmM1bLmjYP7c7/TX6pJBdt+sqQopvdBupkmRg/D
         1QfudTRXchnCaWeTiOlulJMZ8INr10wm/6wlhkjbcGTH4WEvx3zBtD1hQB9gBtRK+hoO
         D90hzxybgEEwuo7muw76g7xx5KH9giphB57ClH0SCgDpGQPbUvAzs2OFTXm3XehKQWP0
         FOJJmhjuYy4MdJfKABz65098e1DlZbUPz+jJ7tT2cL0pgwgZM6pGS21cE6Ys0Rp3YH3t
         6wid9ZoOKIwKD+uB73bPSFIWVMz1hIYYidWIGZ1yTRP1vEpfMHG32sVqiIOUJd8CkVRx
         4uKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KSvh8KHURgcTWBUPLFGeUVbHkUcifiQEm231yb6rUOY=;
        b=nngJjmT9aPQTwE7ZFn2w84VDIqIA5yx+14XXKLF7ncD0Lb9meSWFIj6zSz4hGHFB4+
         o/OHDY1nV9ZHhBOW/YbBVey+dZPqOe6wj6Hgl/rwhGQBgwfQ6Ece+GEWwLhbf42RqOdT
         sIiePt5tHhDWeNStLRGgO9AL9WpvF1zdf32JPWG4MpUJ+G6IEikTFiZMRMj2s1Yil/As
         TBb4Zpb9YeVzOy/GElPB5F6hkexaixSqiooaMc3RJPykDRylE9ROQ92q6cw6qUHjCvuM
         Xn5Hubr/frPHkkolVRkCVRPTys80+N3OScvoI6AX3gUCpUw+EAPjSkRVJpR/dLSzTgwY
         jSpA==
X-Gm-Message-State: AOAM530Gf7oMN6WsG9JWBcwTohBHGFoP2lUBeWYIuVOr8Bu2zSiBCqSj
        zrQHPY7VYsjOB5ft776yk+lWwA==
X-Google-Smtp-Source: ABdhPJwYIYHt0nETzLe2m5+mUUUYLsl1K/l9nQR6iRE2rIUsmmq137aFYlqk6RVONXzULw7w/aL9Sw==
X-Received: by 2002:a2e:8895:: with SMTP id k21mr13833225lji.331.1636706495681;
        Fri, 12 Nov 2021 00:41:35 -0800 (PST)
Received: from [192.168.1.102] (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id t23sm503290lfg.63.2021.11.12.00.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 00:41:35 -0800 (PST)
Subject: Re: [PATCH v5 03/22] dt-bindings: qcom-bam: Convert binding to YAML
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        stephan@gerhold.net, Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-4-bhupesh.sharma@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <dd8cfa0d-0128-84a9-b2e5-b994a2bbd4cf@linaro.org>
Date:   Fri, 12 Nov 2021 10:41:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211110105922.217895-4-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhupesh,

On 11/10/21 12:59 PM, Bhupesh Sharma wrote:
> Convert Qualcomm BAM DMA devicetree binding to YAML.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>   .../devicetree/bindings/dma/qcom_bam_dma.txt  | 50 ----------
>   .../devicetree/bindings/dma/qcom_bam_dma.yaml | 91 +++++++++++++++++++
>   2 files changed, 91 insertions(+), 50 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
>   create mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> deleted file mode 100644
> index cf5b9e44432c..000000000000
> --- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -QCOM BAM DMA controller
> -
> -Required properties:
> -- compatible: must be one of the following:
> - * "qcom,bam-v1.4.0" for MSM8974, APQ8074 and APQ8084
> - * "qcom,bam-v1.3.0" for APQ8064, IPQ8064 and MSM8960
> - * "qcom,bam-v1.7.0" for MSM8916
> -- reg: Address range for DMA registers
> -- interrupts: Should contain the one interrupt shared by all channels
> -- #dma-cells: must be <1>, the cell in the dmas property of the client device
> -  represents the channel number
> -- clocks: required clock
> -- clock-names: must contain "bam_clk" entry
> -- qcom,ee : indicates the active Execution Environment identifier (0-7) used in
> -  the secure world.
> -- qcom,controlled-remotely : optional, indicates that the bam is controlled by
> -  remote proccessor i.e. execution environment.
> -- num-channels : optional, indicates supported number of DMA channels in a
> -  remotely controlled bam.
> -- qcom,num-ees : optional, indicates supported number of Execution Environments
> -  in a remotely controlled bam.
> -
> -Example:
> -
> -	uart-bam: dma@f9984000 = {
> -		compatible = "qcom,bam-v1.4.0";
> -		reg = <0xf9984000 0x15000>;
> -		interrupts = <0 94 0>;
> -		clocks = <&gcc GCC_BAM_DMA_AHB_CLK>;
> -		clock-names = "bam_clk";
> -		#dma-cells = <1>;
> -		qcom,ee = <0>;
> -	};
> -
> -DMA clients must use the format described in the dma.txt file, using a two cell
> -specifier for each channel.
> -
> -Example:
> -	serial@f991e000 {
> -		compatible = "qcom,msm-uart";
> -		reg = <0xf991e000 0x1000>
> -			<0xf9944000 0x19000>;
> -		interrupts = <0 108 0>;
> -		clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
> -			<&gcc GCC_BLSP1_AHB_CLK>;
> -		clock-names = "core", "iface";
> -
> -		dmas = <&uart-bam 0>, <&uart-bam 1>;
> -		dma-names = "rx", "tx";
> -	};
> diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml b/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
> new file mode 100644
> index 000000000000..3ca222bd10bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/qcom_bam_dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: QCOM BAM DMA controller binding
> +
> +maintainers:
> +  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
> +
> +description: |
> +  This document defines the binding for the BAM DMA controller
> +  found on Qualcomm parts.
> +
> +allOf:
> +  - $ref: "dma-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,bam-v1.3.0 # for APQ8064, IPQ8064 and MSM8960
> +      - qcom,bam-v1.4.0 # for MSM8974, APQ8074 and APQ8084
> +      - qcom,bam-v1.7.0 # for MSM8916
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: bam_clk
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 31
> +
> +  num-channels:
> +    maximum: 31
> +    description:
> +      Indicates supported number of DMA channels in a remotely controlled bam.
> +
> +  "#dma-cells":
> +    const: 1
> +    description: The single cell represents the channel index.
> +
> +  qcom,ee:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7
> +    description:
> +      Indicates the active Execution Environment identifier (0-7)
> +      used in the secure world.
> +
> +  qcom,controlled-remotely:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Indicates that the bam is controlled by remote proccessor i.e.
> +      execution environment.
> +
> +  qcom,num-ees:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 31
> +    default: 2
> +    description:
> +      Indicates supported number of Execution Environments in a
> +      remotely controlled bam.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#dma-cells"
> +  - qcom,ee
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-msm8974.h>
> +    dma-controller@f9984000 {
> +        compatible = "qcom,bam-v1.4.0";
> +        reg = <0xf9984000 0x15000>;
> +        interrupts = <0 94 0>;
> +        clocks = <&gcc GCC_BAM_DMA_AHB_CLK>;
> +        clock-names = "bam_clk";
> +        #dma-cells = <1>;
> +        qcom,ee = <0>;
> +    };
> 

this change should be rebased on top of the upstream commit 37aef53f5cc ("dt-bindings:
dmaengine: bam_dma: Add "powered remotely" mode"), which adds 'qcom,powered-remotely'
property description.

--
Best wishes,
Vladimir
