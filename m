Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70B5F50CD42
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 21:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236928AbiDWT63 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 15:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236896AbiDWT60 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 15:58:26 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A656C1848C3
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 12:55:25 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id y3so2037480ejo.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 12:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=812ATgqJqVuXrzSX7vqc6tXClwcvzSLGkWrw1b5I++8=;
        b=hvkwQ6TKOCtfYkBltK1BhkfyjhB4cxmA4bGFAS909ho+2AGRQVxSYKV4RY7432BtpV
         zhOesIbNq3AdPKPRCxnWF99pASa1rd5Wiy3VCdaGtYWJzkcYW/oG+kCd1g8IjqY/Knxl
         VZEeIe6bhUtH91ZLUpJ/yNhfsTEcTUG1sro7/rAOuwpN1zrCp07BEnNtZfruYXejR6GP
         YdPeF9eycUOrdusmErs21cNki1EZ5g1VQGadAODaLYa7z1QYM8/sWCezyjt1WvtAPn/k
         W5PbeHlJHU8YkY5k2zWc/ISxRwoM5+sKZBEf7YNBmoiGkmxqbssxlfovHhJKVHRUqafF
         ha9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=812ATgqJqVuXrzSX7vqc6tXClwcvzSLGkWrw1b5I++8=;
        b=il/q0L0Yfqc5GK1eVMpAiTLKUn0ZPV0IozQ7I8OGvwLnoGYG5Rs/IOj/rXEF0ozhlu
         y3pGyEONWTXzDXCwRPpQ0SNbE0BFYSfW35rk6+btYa+1yn5EAiLvXMEoqvbR4ZQDBDbp
         wtSwLqgnDMoHWhfTsD3+Eh3eq0xET/sbK2HEws2dIIaVA5La6RwpC46vO7YNRafzxG2K
         LH/aHnD5Aw9N3wozP+ujkVKBjKuKK5VlzNs4Il1DUybJn5lo0lyU6i37mz7gsWacL4ic
         PItoPYfzxrn9DILmJmfQXCzYPF2bpM4oxjkEXJeAB2p0q7D7re9XIBGtVIeFnzlpC90E
         RbXQ==
X-Gm-Message-State: AOAM533zs/5YHQ6GZjYLyUDzDElm3JkIVzlyOBTRJI92Y3QltTBxZF+K
        ExCXRbHpO3LTwBjhLFzI/8llWg==
X-Google-Smtp-Source: ABdhPJxHNVQT5odGBiwpouPQw1RWXyaubyvA4orHuRY0Lnu1VdOEQRtBSgC3uOZ2TIIvLwqJtxQG9w==
X-Received: by 2002:a17:906:c152:b0:6f0:1fb3:4e0b with SMTP id dp18-20020a170906c15200b006f01fb34e0bmr9626504ejc.547.1650743724201;
        Sat, 23 Apr 2022 12:55:24 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906128e00b006e4b67514a1sm1980657ejb.179.2022.04.23.12.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 12:55:23 -0700 (PDT)
Message-ID: <6e91cf76-bb2d-5f4c-6648-59e666a71e9d@linaro.org>
Date:   Sat, 23 Apr 2022 21:55:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/4] dt-bindings: interconnect: Add Qualcomm SM6350 NoC
 support
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220422144021.232993-1-luca.weiss@fairphone.com>
 <20220422144021.232993-3-luca.weiss@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422144021.232993-3-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/04/2022 16:40, Luca Weiss wrote:
> Add bindings for Qualcomm SM6350 Network-On-Chip interconnect devices.
> 
> As SM6350 has two pairs of NoCs sharing the same reg, allow this in the
> binding documentation, as was done for qcm2290.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/interconnect/qcom,rpmh.yaml      |  44 ++++++
>  .../dt-bindings/interconnect/qcom,sm6350.h    | 148 ++++++++++++++++++
>  2 files changed, 192 insertions(+)
>  create mode 100644 include/dt-bindings/interconnect/qcom,sm6350.h
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
> index 5a911be0c2ea..797107212a42 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
> @@ -72,6 +72,14 @@ properties:
>        - qcom,sdx55-mc-virt
>        - qcom,sdx55-mem-noc
>        - qcom,sdx55-system-noc
> +      - qcom,sm6350-aggre1-noc
> +      - qcom,sm6350-aggre2-noc
> +      - qcom,sm6350-config-noc
> +      - qcom,sm6350-dc-noc
> +      - qcom,sm6350-gem-noc
> +      - qcom,sm6350-mmss-noc
> +      - qcom,sm6350-npu-noc
> +      - qcom,sm6350-system-noc
>        - qcom,sm8150-aggre1-noc
>        - qcom,sm8150-aggre2-noc
>        - qcom,sm8150-camnoc-noc
> @@ -131,6 +139,42 @@ properties:
>      description: |
>        Names for each of the qcom,bcm-voters specified.
>  
> +# Child node's properties
> +patternProperties:
> +  '^interconnect-[a-z0-9\-]+$':
> +    type: object
> +    description:
> +      The interconnect providers do not have a separate QoS register space,
> +      but share parent's space.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,sm6350-clk-virt
> +          - qcom,sm6350-compute-noc
> +
> +      '#interconnect-cells':
> +        const: 1
> +
> +      qcom,bcm-voters:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array

You need maxItems for the entire list, so how many phandles could be
here. You only defined how the each phandle looks like.

> +        items:
> +          maxItems: 1
> +        description: |
> +          List of phandles to qcom,bcm-voter nodes that are required by
> +          this interconnect to send RPMh commands.
> +
> +      qcom,bcm-voter-names:
> +        description: |
> +          Names for each of the qcom,bcm-voters specified.
> +
> +    required:
> +      - compatible
> +      - '#interconnect-cells'
> +      - qcom,bcm-voters
> +
> +    additionalProperties: false

You need to add allOf:if:then constraints where these children can
appear. If we want to be strict with bindings, this could be a new
binding, only for SM6350, using common qcom-interconnect binding.

The problem is that you allow now any other variant to have
qcom,sm6350-clk-virt|qcom,sm6350-compute-noc children which obviously is
wrong, but someone might want to re-use your compatibles.

Probably we hit the limitation of this Qcom bindings here - they are
just too big, too many compatibles.

Instead maybe let's define:
1. Common Qcom interconnect rpmh part.
2. Reference it from qcom,rpmh.yaml.
3. Reference it from SM6350 rpmh and customize the children.

> +
>  required:
>    - compatible
>    - reg
> diff --git a/include/dt-bindings/interconnect/qcom,sm6350.h b/include/dt-bindings/interconnect/qcom,sm6350.h
> new file mode 100644
> index 000000000000..c6eab5b42858
> --- /dev/null
> +++ b/include/dt-bindings/interconnect/qcom,sm6350.h
> @@ -0,0 +1,148 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Same license as bindings, so GPL-2.0 or BSD-2-clause


Best regards,
Krzysztof
