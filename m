Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E1E42C0BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 14:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234555AbhJMM7C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 08:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234300AbhJMM66 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 08:58:58 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747C3C061570
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 05:56:55 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x27so11418602lfa.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 05:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p33QOHvQ95RnptXn6dj3IzSbxw6szXttwK/+SnkkIak=;
        b=mIbAm11hhRBoasT9fywxO7RHj8bVvziNhtA54PTIM3r/GBfiSV9iOwKoFCzblhjncG
         /ThqehyPFsRUNwKSkHrCR1Eha/5qR9mFfCPvTGN6pWPPxblLxNAKoP9Srb40+DjERUKE
         VUs4t4VB+5Q00RlHAOwJyLKe2Ad7wo9Va8hRKCoz+EFucHq32gqZTpmQqCj/MqCq4dD+
         HLqnv/GvDuj2NVVPclGcW5mOlLMHdAld0AFnm/10KFMcIY4OtOXYooW1ZZau4y4asYsf
         5ztIBzQ2bOPq61SLEKBzNOCMSElESRq6Y7uhmTebLsymWwz+fXPPiSSDDR4LIzznQ7Gk
         fITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p33QOHvQ95RnptXn6dj3IzSbxw6szXttwK/+SnkkIak=;
        b=Zchf39olIF3qnKGNUUE9EWIRBPd6QiD8/qJ9aNy4MmLAG8Q18zosfdng2jd7KDARE4
         HIem/bruMSYlD70eZtHAJq51VFKcvyaBJqzWNoidF8w3bTlA90mmM7/p3glkTi40ClTZ
         zP5lkm32u1x3wzi4WyTWVeWN2FSOXvjdpy1ahIbijmu9JBpzfcuCx8KluGOjF6i/9Y7A
         p1l2SCiMI9DOKBetys60QBX3Vr7NyLgpJ9/MvbawIG7Tj6OpEHL4vKpJKqz+YScpzhxq
         KQq+W4paN2aqsGLLi8X0HB6MeeV6nmr3jRqPfpgz2DflA6ctLTrSyJanZ8S9rSwl86Sj
         7nrQ==
X-Gm-Message-State: AOAM530AAnCAn+3GoXhnYsZni0pCx+7zuDS/hmIheCTz05fUXz5q2QWH
        muHTgRGTylafPAGn63aMLhcteQ==
X-Google-Smtp-Source: ABdhPJwfLCh+TS+/g9bV7W8np89O1BSQLOQf/9AWEOondje7XbOuqOvzrxSw++S1Hwz3WMjyoWqyGA==
X-Received: by 2002:ac2:5dd4:: with SMTP id x20mr18170982lfq.313.1634129813780;
        Wed, 13 Oct 2021 05:56:53 -0700 (PDT)
Received: from [192.168.1.102] (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id y24sm385688lfh.62.2021.10.13.05.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 05:56:53 -0700 (PDT)
Subject: Re: [PATCH v4 04/20] dt-bindings: qcom-bam: Convert binding to YAML
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-5-bhupesh.sharma@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <b41ba845-5f28-8405-0cd0-2342e4b6b372@linaro.org>
Date:   Wed, 13 Oct 2021 15:56:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211013105541.68045-5-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhupesh,

On 10/13/21 1:55 PM, Bhupesh Sharma wrote:
> Convert Qualcomm BAM DMA devicetree binding to YAML.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>   .../devicetree/bindings/dma/qcom_bam_dma.txt  | 50 -----------
>   .../devicetree/bindings/dma/qcom_bam_dma.yaml | 89 +++++++++++++++++++
>   2 files changed, 89 insertions(+), 50 deletions(-)
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
> index 000000000000..32b47e3b7769
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
> @@ -0,0 +1,89 @@
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
> +      - qcom,bam-v1.4.0 # for MSM8974, APQ8074 and APQ8084
> +      - qcom,bam-v1.3.0 # for APQ8064, IPQ8064 and MSM8960
> +      - qcom,bam-v1.7.0 # for MSM8916

would it be better to sort the list above by IP version?

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
> +    description: |
> +      Indicates supported number of DMA channels in a remotely controlled bam.

A comment about YAML specifics, I'm not sure, if it makes sense to set a control
to enable literal style of the given multiline description, since it is a one-liner.

My main observation though is that all actually multi-line descriptions in the
schema are different and of the folded style ("pipe" symbol is not set).

Probably it's good enough just to remove the "pipe" above.

> +
> +  "#dma-cells":
> +    const: 1
> +    description: The single cell represents the channel index.
> +
> +  qcom,ee:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Indicates the active Execution Environment identifier (0-7)
> +      used in the secure world.

Would it make sense to add here

   minimum: 0
   maximum: 7

?

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

--
Best wishes,
Vladimir
