Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF0AD62BDD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238934AbiKPM3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:29:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238693AbiKPM30 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:29:26 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE8025E1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:28:15 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id g12so29291258lfh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSU2gRCd8deSgp7KhY1hJreNe/Or7nQ7W/OeOaogKOo=;
        b=M5TlC82JDoqLrHT1cFCghs+Xy9DyHtIL0sRR9FgSTAMxak8C9ujXC8JXwERL0Y1b0K
         xYPwxqoApxWSDKN8cVRCDztMT9p2pldTrFnAJ0fmJNSZ71NdqOQSDmj18hadQ2KLiJWu
         YNjDITC6Sc7YFHM+ADjz7WRQeK0paR6C27bJRteX6uLnpl033NYpp5FJD4fSabeK0Kk2
         e6dYd+a7U67N4wuRiexIgv1odhTbFgJPd14HmSWq4DM2PzwCH4Xe7ckCdhUwF2/mmvVA
         JglIfkwqgvjAICnDfIjI7Y8RExxKodKJTYKhlrW6ZvtKRmkzICuFhFK8BVUQXmM/nVZX
         PKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSU2gRCd8deSgp7KhY1hJreNe/Or7nQ7W/OeOaogKOo=;
        b=P84DUASnSHmD2oZAdXIDxHEQiRF77Q47MoaWKYxG1fz+db7kr++xdaQN4JSGrPyPoj
         9YltOw0YTixexHyxckjEoqOQHvB9ZvrVrB4JfJ5fntQlU5/rjrakCB2hz1PZynRN4V/Z
         IbGd0K+YmS2qnHMOH4SQaTQJhVOeeyeVHRqpjCrNyjm6ZHjDqNpbT8kAzZrZsUhvOoJU
         ATro541lZHIyCZ0c/lk2svvSntnkAQ1PKe/TYmE5PpsyIQyi+u03wM6v4GyiCyAeCWjZ
         UlWRVNRlYqT3pHhEECN0yYMY6OS3vVJW5HUn5jbDTAZsrGUetKUwr2i09Mz85j+wKDcV
         QyUg==
X-Gm-Message-State: ANoB5pn8PM/L7pekyirBpKlozSAiZ00TdnC7lWjIZc/AuxZaz8vAp4qv
        vyDp/B5fP5257fgQja7aUD6Y4Q==
X-Google-Smtp-Source: AA0mqf7MzuDwdDE7l56A6qn+5iBCm1QJcyF1YjLB8jglwYR/yRkh/TSAyGYNIcaK8f0EFA2crv9gJQ==
X-Received: by 2002:a19:f704:0:b0:4a7:7d62:2807 with SMTP id z4-20020a19f704000000b004a77d622807mr8180796lfe.77.1668601694033;
        Wed, 16 Nov 2022 04:28:14 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d25-20020a19e619000000b004ab52b0bcf9sm2564149lfh.207.2022.11.16.04.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 04:28:13 -0800 (PST)
Message-ID: <b6eac577-f3a7-d1a4-f492-74782c2e5ff1@linaro.org>
Date:   Wed, 16 Nov 2022 13:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: qcom: adsp: document sm8550
 adsp, cdsp & mpss compatible
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-remoteproc-v1-0-104c34cb3b91@linaro.org>
 <20221114-narmstrong-sm8550-upstream-remoteproc-v1-1-104c34cb3b91@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-remoteproc-v1-1-104c34cb3b91@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2022 11:20, Neil Armstrong wrote:
> This documents the compatible for the component used to boot the
> aDSP, cDSP and MPSS on the SM8550 SoC.
> 
> The SM8550 boot process on SM8550 now requires a secondary "Devicetree"
> firmware to be passed along the main Firmware, and the cDSP a new power
> domain named "NSP".
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 60 +++++++++++++++++++++-
>  1 file changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> index db9e0f0c2bea..678cb73f10de 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> @@ -55,6 +55,9 @@ properties:
>        - qcom,sm8450-cdsp-pas
>        - qcom,sm8450-mpss-pas
>        - qcom,sm8450-slpi-pas
> +      - qcom,sm8550-adsp-pas
> +      - qcom,sm8550-cdsp-pas
> +      - qcom,sm8550-mpss-pas
>  
>    reg:
>      maxItems: 1
> @@ -116,8 +119,13 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/string
>      description: Firmware name for the Hexagon core
>  
> +  qcom,dtb-firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Devicetree Firmware name for the Hexagon core

Not sure about this one.

Rob,
Don't we want rather to have multiple items in firmware-name?


> +
>    memory-region:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>      description: Reference to the reserved-memory for the Hexagon core
>  
>    qcom,qmp:
> @@ -212,6 +220,9 @@ allOf:
>                - qcom,sm8450-cdsp-pas
>                - qcom,sm8450-slpi-pas
>                - qcom,sm8450-mpss-pas
> +              - qcom,sm8550-adsp-pas
> +              - qcom,sm8550-cdsp-pas
> +              - qcom,sm8550-mpss-pas
>      then:
>        properties:
>          clocks:
> @@ -327,6 +338,8 @@ allOf:
>                - qcom,sm8450-adsp-pas
>                - qcom,sm8450-cdsp-pas
>                - qcom,sm8450-slpi-pas
> +              - qcom,sm8550-adsp-pas
> +              - qcom,sm8550-cdsp-pas
>      then:
>        properties:
>          interrupts:
> @@ -347,6 +360,7 @@ allOf:
>                - qcom,sm8150-mpss-pas
>                - qcom,sm8350-mpss-pas
>                - qcom,sm8450-mpss-pas
> +              - qcom,sm8550-mpss-pas
>      then:
>        properties:
>          interrupts:
> @@ -448,6 +462,7 @@ allOf:
>                - qcom,sm8150-mpss-pas
>                - qcom,sm8350-mpss-pas
>                - qcom,sm8450-mpss-pas
> +              - qcom,sm8550-mpss-pas
>      then:
>        properties:
>          power-domains:
> @@ -475,6 +490,7 @@ allOf:
>                - qcom,sm8350-slpi-pas
>                - qcom,sm8450-adsp-pas
>                - qcom,sm8450-slpi-pas
> +              - qcom,sm8550-adsp-pas
>      then:
>        properties:
>          power-domains:
> @@ -504,6 +520,25 @@ allOf:
>              - const: cx
>              - const: mxc
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8550-cdsp-pas
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: CX power domain
> +            - description: MXC power domain
> +            - description: NSP power domain
> +        power-domain-names:
> +          items:
> +            - const: cx
> +            - const: mxc
> +            - const: nsp
> +

You also need to update entry for resets. I think it is missing.

>    - if:
>        properties:
>          compatible:
> @@ -573,6 +608,29 @@ allOf:
>        properties:
>          qcom,qmp: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8550-adsp-pas
> +              - qcom,sm8550-cdsp-pas
> +              - qcom,sm8550-mpss-pas
> +    then:
> +      properties:
> +        memory-region:
> +          minItems: 2
> +          description:
> +            First entry is a phandle for a reserved memory area that holds
> +            the main Firmware for authentication, and second entry a phandle for a
> +            reserved memory area that holds the Devicetree Firmware for authentication.

Instead of minItems and description:
  items:
    - description: Main Firmware for auth....
    - description: Devicetree Firmware....

> +    else:
> +      properties:
> +        qcom,dtb-firmware-name: false
> +
> +        memory-region:
> +          maxItems: 1
> +

Best regards,
Krzysztof

