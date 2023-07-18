Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D870758445
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 20:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbjGRSMP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 14:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbjGRSMO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 14:12:14 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29994B6
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 11:12:11 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-992b27e1c55so777104866b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 11:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689703929; x=1692295929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G6/8N7r9NBloAE8WS8tLLSB/dGe92+uxsdAAiPO77KA=;
        b=oSI5k08opg8zIeSQxaPflm1lUXIVvEVqYOhxD5tQkyFBV9gAnPEVEtqCR7dFYvDnic
         FKVy0HWkhEdYW+u5H1UtrjyeUd8iz6aKE9BaZ4L+cACl/hpOFCPK+8sPFWdVpJBLV+CL
         59rLvRBit9BkPeXWDCpWH7hbAJnmN6A1RJBEU5IHrbcZAH2KFldaHd6v7Zh3FknlJRzF
         eZeruZcmHuJoH0lrGlXVGIqtGXXbsi+mhxw+r11eMPH2QPMay8CHMTq6VpP1Jp3upmoi
         Qao4AkWOxolfnm2BsSJ9jivCxGsCEjwHObpF4aoxWctu44LdrK7ZYJw8wqQoy2rH7x33
         R3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689703929; x=1692295929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6/8N7r9NBloAE8WS8tLLSB/dGe92+uxsdAAiPO77KA=;
        b=Nwn1kj8X0nlH4oElemPO6sylK3/GoFWlLzugujcRfKsnds40FeHYrUxtAQ9fidH6iM
         /A2O2E+bqI9A1REE/y06mlRAgKwgqeeTlIgzypPqF/FnQnMDnrr6tMRmU3RZ80l973P9
         EgerOrMpBf5dlzYEufa1Y+VMbj6n4kLXfzNRyjPNdzG9cL7/LvrYPw8OJUR85Ml8QhPJ
         6SFa/O3T2x07Gu0Cckljv0snzM2sabhYR50kCVYPFJ35ugbl79qZzhIOINHGDtYV3cts
         zyx+p5F+LNK9sTFEEqw+8TPzw/6JMJMGnO2E/+wJmMQExWEldpVF8AUXNqRiyCzTxQ1H
         wgCQ==
X-Gm-Message-State: ABy/qLa+99RQftDdW4IQkFJNKAELpqML2yDE09dXWN0Fgw8gMZEqoKrX
        lc3Xbr3wwq3m7h0JR4o43joMIg==
X-Google-Smtp-Source: APBJJlHUEk+vIobvihIcsA3RE38Sv2dNpXe0EbyH+S5eZL1H+p8M7mY2hqQI/VxXI2DspF2gjXgJTA==
X-Received: by 2002:a17:907:a48:b0:98a:29ca:c58e with SMTP id be8-20020a1709070a4800b0098a29cac58emr599294ejc.27.1689703929650;
        Tue, 18 Jul 2023 11:12:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id sb6-20020a170906edc600b009888aa1da11sm1272105ejb.188.2023.07.18.11.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 11:12:09 -0700 (PDT)
Message-ID: <d05fcac3-1054-6b52-e9d8-15baba424863@linaro.org>
Date:   Tue, 18 Jul 2023 20:12:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: Add qcom specific hvc transport for
 SCMI
Content-Language: en-US
To:     Nikunj Kela <quic_nkela@quicinc.com>, sudeep.holla@arm.com
Cc:     cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230718160833.36397-1-quic_nkela@quicinc.com>
 <20230718160833.36397-2-quic_nkela@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718160833.36397-2-quic_nkela@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/07/2023 18:08, Nikunj Kela wrote:
> Introduce compatible "qcom,scmi-hvc-shmem" for SCMI
> transport channel for Qualcomm virtual platforms.
> The compatible mandates a shared memory channel.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  .../bindings/firmware/arm,scmi.yaml           | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index b138f3d23df8..605b1e997a85 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -45,6 +45,9 @@ properties:
>        - description: SCMI compliant firmware with OP-TEE transport
>          items:
>            - const: linaro,scmi-optee
> +      - description: SCMI compliant firmware with Qualcomm hvc/shmem transport
> +        items:
> +          - const: qcom,scmi-hvc-shmem
>  
>    interrupts:
>      description:
> @@ -321,6 +324,16 @@ else:
>        required:
>          - linaro,optee-channel-id
>  
> +    else:
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              const: qcom,scmi-hvc-shmem
> +      then:
> +        required:
> +          - shmem

Unfortunately this pattern if-else-if-else-if-else does not scale well.
Please convert all entries first to allOf:if:then,if:then,if:then (in
new patch), and then add new if:then:

> +
>  examples:
>    - |
>      firmware {
> @@ -444,6 +457,62 @@ examples:
>          };
>      };
>  
> +  - |
> +    firmware {
> +        scmi_dpu {

No underscores in node names.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



> +            compatible = "qcom,scmi-hvc-shmem";
> +            shmem = <&shmem_dpu>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            scmi_pd_dpu: protocol@11 {
> +                reg = <0x11>;
> +                #power-domain-cells = <1>;
> +            };
> +        };
> +

Add only one example, but then only if it differs significantly. I see
no differences - except compatible - so maybe no point of examples.


> +        scmi_gpu {
> +            compatible = "qcom,scmi-hvc-shmem";
> +            shmem = <&shmem_gpu>;

This example for sure is not needed - you duplicate above.

> +
> +            interrupts = <GIC_SPI 931 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "a2p";
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            scmi_pd_gpu: protocol@11 {
> +                reg = <0x11>;
> +                #power-domain-cells = <1>;
> +            };
> +        };
> +    };
> +
> +    soc {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        sram@95c00000 {
> +            compatible = "mmio-sram";
> +            reg = <0x95c00000 0x10000>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            ranges;
> +
> +            shmem_dpu: scmi-sram-dpu@95c00000 {
> +                compatible = "arm,scmi-shmem";
> +                reg = <0x95c00000 0x3f0>;
> +            };

How does these differ from existing example?

Best regards,
Krzysztof

