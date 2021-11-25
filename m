Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B832245DC89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 15:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347969AbhKYOqc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 09:46:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355802AbhKYOoc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 09:44:32 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99406C06173E
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 06:41:20 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id o13so12097869wrs.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 06:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u7oR5jSLi6x2xK4T6TK107bv1l+Sd3I4M38y7DRQ3wc=;
        b=ka5tYq7FeV/AbEgYRPjJqEqHPiQiiFDSgR1Wc5fhKVKXpjta+J+3erBGBOnI8V2ykt
         mHnJP2I7jBSXe/KOTWuPxbQB2bfcearbBfH+jjNHSdC+bdA1EIo9/rBAYa2XKFRXuf5n
         MsTl6oxC/c0jx6G2YJKx06BYO5z3xU0QtWEXOyJ6kCvfnGJ+2OI7GvlCUNr25KRL+NRo
         3vfmZsgjCvfUakkGwr2jT5LwEGMlEPvhmZSxW+7ui32+aoKgycbDm+GaY6RFHQYeuAKy
         b3hbIRW/8GzWk1d7b43DOXWVjQnxc+c1IKYJngbVMOWIb9JcIDy/F9lGnx9Vs9rNK6sW
         BgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u7oR5jSLi6x2xK4T6TK107bv1l+Sd3I4M38y7DRQ3wc=;
        b=VbBSvmjfgAGBgYb5GYuTSvrDWmuD/X4WF2Q6Qk1k33uARlj7K6+M/zWjJiqxI30iKz
         FqQ9CHLlrmZnkhPlA83JGTybVyIs73DsOqSbKgk4VgL7cPXIeiJGvU8vMcVznEV+e2T/
         eON0JysVI0CO3os2XWq4dyN1UEFcts5Re7H4iqpHtDdhbuT2iqR8/FS32Lj2AKZ9PwYg
         kXR1hkTcvwvn37yXtd/llcB8WAilSZftPKg2nr2qsGCl78ad+x2UgXIfDh4vZO7vWgcM
         +o8wWFGAhwuRF6dThvBjbRm/zIZiGwWIQrQiMQHB3AiUYq+0+al8/gbT71/tq/jdruvY
         Z85g==
X-Gm-Message-State: AOAM531gYsqrjMRwJ185pDC0zwQ3APRfntjxugnMIClpdt9+40u/U53v
        CL5xK/v8Ml0bQ3p5HG3Qr4zQFQ==
X-Google-Smtp-Source: ABdhPJzmoBIhl6HTpdl7Jt3V0QxF7y+UhYnVHW1MZia45q3ylfVZNPYwGsq7gF5kXmRuBOzOIIjfaQ==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr7260698wrd.346.1637851279185;
        Thu, 25 Nov 2021 06:41:19 -0800 (PST)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id p2sm9225163wmq.23.2021.11.25.06.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 06:41:18 -0800 (PST)
Subject: Re: [PATCH 1/5] dt-bindings: misc: convert fastrpc bindings to yaml
 and add property
To:     Jeya R <jeyr@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        fastrpc.upstream@qti.qualcomm.com
References: <1637849744-24844-1-git-send-email-jeyr@codeaurora.org>
 <1637849744-24844-2-git-send-email-jeyr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <be50fe57-e109-370d-621b-66bff479b46e@linaro.org>
Date:   Thu, 25 Nov 2021 14:41:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637849744-24844-2-git-send-email-jeyr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeya,

You should retain the original patch ownership while sending the patches.

On 25/11/2021 14:15, Jeya R wrote:
> Convert Qualcomm FastRPC bindings to yaml format and add a property
> to set dsp domain as non-secure.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Jeya R <jeyr@codeaurora.org>
> ---
>   .../devicetree/bindings/misc/qcom,fastrpc.txt      | 78 -----------------
>   .../devicetree/bindings/misc/qcom,fastrpc.yaml     | 97 ++++++++++++++++++++++
>   2 files changed, 97 insertions(+), 78 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
>   create mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
> deleted file mode 100644
> index 2a1827a..0000000
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -Qualcomm Technologies, Inc. FastRPC Driver
> -
> -The FastRPC implements an IPC (Inter-Processor Communication)
> -mechanism that allows for clients to transparently make remote method
> -invocations across DSP and APPS boundaries. This enables developers
> -to offload tasks to the DSP and free up the application processor for
> -other tasks.
> -
> -- compatible:
> -	Usage: required
> -	Value type: <stringlist>
> -	Definition: must be "qcom,fastrpc"
> -
> -- label
> -	Usage: required
> -	Value type: <string>
> -	Definition: should specify the dsp domain name this fastrpc
> -	corresponds to. must be one of this: "adsp", "mdsp", "sdsp", "cdsp"
> -
> -- #address-cells
> -	Usage: required
> -	Value type: <u32>
> -	Definition: Must be 1
> -
> -- #size-cells
> -	Usage: required
> -	Value type: <u32>
> -	Definition: Must be 0
> -
> -= COMPUTE BANKS
> -Each subnode of the Fastrpc represents compute context banks available
> -on the dsp.
> -- All Compute context banks MUST contain the following properties:
> -
> -- compatible:
> -	Usage: required
> -	Value type: <stringlist>
> -	Definition: must be "qcom,fastrpc-compute-cb"
> -
> -- reg
> -	Usage: required
> -	Value type: <u32>
> -	Definition: Context Bank ID.
> -
> -- qcom,nsessions:
> -	Usage: Optional
> -	Value type: <u32>
> -	Defination: A value indicating how many sessions can share this
> -		    context bank. Defaults to 1 when this property
> -		    is not specified.
> -
> -Example:
> -
> -adsp-pil {
> -	compatible = "qcom,msm8996-adsp-pil";
> -	...
> -	smd-edge {
> -		label = "lpass";
> -		fastrpc {
> -			compatible = "qcom,fastrpc";
> -			qcom,smd-channels = "fastrpcsmd-apps-dsp";
> -			label = "adsp";
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			cb@1 {
> -				compatible = "qcom,fastrpc-compute-cb";
> -				reg = <1>;
> -			};
> -
> -			cb@2 {
> -				compatible = "qcom,fastrpc-compute-cb";
> -				reg = <2>;
> -			};
> -			...
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> new file mode 100644
> index 0000000..c3fe39b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Technologies, Inc. FastRPC Driver
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  This binding describes Qualcomm FastRPC an IPC (Inter-Processor Communication)
> +  mechanism that allows for clients to transparently make remote method
> +  invocations across DSP and APPS boundaries. This enables developers
> +  to offload tasks to the DSP and free up the application processor for
> +  other tasks.
> +
> +properties:
> +  compatible:
> +    const: qcom,fastrpc
> +
> +  label:
> +    enum:
> +      - adsp
> +      - mdsp
> +      - sdsp
> +      - cdsp
> +
> +  qcom,non-secure-domain: true
> +    # Specify that dsp domain is non-secure.
> +

This change was not there in the original patch that I shared, you 
should add this change in a separate patch, as first patch converts to 
yaml and next one adds new bindings.

This is also not following yaml style bindings.
Please take some time to look at 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/example-schema.yaml?h=v5.16-rc2
to add new binding.



--srini

> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^cb@[0-9a-f]$":
> +    type: object
> +    description: |
> +      Compute context bank
> +
> +    properties:
> +      compatible:
> +        const: qcom,fastrpc-compute-cb
> +
> +      reg:
> +        maxItems: 1
> +        description: Context Bank ID
> +
> +      qcom,nsessions:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: How many sessions can share this context bank.
> +                     Defaults to 1 when this property is not specified.
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - label
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    adsp-pil {
> +        compatible = "qqcom,msm8996-adsp-pil";
> +
> +        smd-edge {
> +            label = "lpass";
> +
> +            fastrpc {
> +                compatible = "qcom,fastrpc";
> +                label = "adsp";
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                cb@1 {
> +                    compatible = "qcom,fastrpc-compute-cb";
> +                    reg = <1>;
> +                };
> +
> +                cb@2 {
> +                    compatible = "qcom,fastrpc-compute-cb";
> +                    reg = <2>;
> +                };
> +            };
> +        };
> +    };
> +
> +
> 
