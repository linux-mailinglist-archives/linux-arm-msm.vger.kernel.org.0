Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD70462BC0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238857AbiKPLeG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:34:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbiKPLda (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:33:30 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C5910C8
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:23:24 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id t10so21446602ljj.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z80N1MN+DJ0w1x0gytSNJr+zpxsy35ouxjbvW3wZtUY=;
        b=FCfavUCYrW5GvwkFFrSStsQtaVLYT75J/zvkhAbbcp4UIKWbSKsqVRtSDPF+fwMIT+
         gUU/Y0GIQwc2j0Rzi+iW3rmrjsD2l742l05hLXQDyPV2sKtCHoPqx9bH9BapR5OofR6n
         opnMhRF7EhovX7Q4Ka/F5j3tQnwWNPU0h5vB2b6JW2CpgMcZDeRiYE523k12I4lr4sN4
         qZerIAlOGVUPkSQtrEVaNenuGIcymRO+9NV7n8HIhJUQsJVHN0/e93e9hsl70Ejoviq3
         ZHUfW1sWU9SCd/rgFliMRClZ4CVfvAA9hKfXfbH2qAnz1kIiZn87M2kZDDn52Syk1ZKh
         LkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z80N1MN+DJ0w1x0gytSNJr+zpxsy35ouxjbvW3wZtUY=;
        b=DOgXl1RsaVVwXBnHAROQGo1L5ZbLgk0DCxAlDgSTcp89OqvKFzg59oBK/zFK0aa5a6
         Ys9rNFAtQCa4cX8oUiEkyy8xw9lC62iTP9VCv8eH1J/+B8XqnnPMOLLBdg/KTcLUqjr/
         t+0UycpK3K+n/pvnd3OWDHIeQK/osrsNlFRgc73cMaU9Ioy2bEjieiqqhTq77SUbbG9M
         FNSL0gKAWHUWiglCCZSQTDPPjuRLGXOENG1n6KAI+Zr9xCJt5EZ57UwAstq1GVz1S7yH
         1Aovq1hdN4fPU7Zvf4jFUhkxlCzedpJJ9MyRpi5HaWjuN4d8JriUufXGjXdHAw4Ba/c/
         Dbbw==
X-Gm-Message-State: ANoB5plOTBK+U0uqnk3rABNCGKtNH23olySGCTalCNHzeDhlxqJDtEL/
        1PwWgSXofws4TXXwLISYg8BhrFqBOi5E2iny
X-Google-Smtp-Source: AA0mqf7NW8wksS2W+W1SQhw+zlOv6qZ4oZYrhhIVAte8i5T2Yycpt/LVUyv7BscSN0Rlsj0iNUw88Q==
X-Received: by 2002:a05:651c:1a26:b0:277:309:f1ad with SMTP id by38-20020a05651c1a2600b002770309f1admr7639631ljb.244.1668597802604;
        Wed, 16 Nov 2022 03:23:22 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n12-20020a05651203ec00b0049480c8e7bcsm2571411lfq.176.2022.11.16.03.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 03:23:22 -0800 (PST)
Message-ID: <5c5a77c8-1f67-e423-d4b6-93bf8837cdc9@linaro.org>
Date:   Wed, 16 Nov 2022 12:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] regulator: qcom,rpmh: Add compatible for PM8550
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20221116110515.2612515-1-abel.vesa@linaro.org>
 <20221116110515.2612515-2-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116110515.2612515-2-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2022 12:05, Abel Vesa wrote:
> Add compatible string for PM8550 used in SM8550 boards.

Use subject prefixes matching the subsystem (git log --oneline -- ...).

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../regulator/qcom,rpmh-regulator.yaml        | 29 +++++++++++++++++--
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> index 90c3bda31c23..66e6bda923cf 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> @@ -47,6 +47,7 @@ description: |
>        For PM8350, smps1 - smps12, ldo1 - ldo10
>        For PM8350C, smps1 - smps10, ldo1 - ldo13, bob
>        For PM8450, smps1 - smps6, ldo1 - ldo4
> +      For PM8550, smps1 - smps6, ldo1 - ldo17, bob1 - bob2
>        For PM8998, smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
>        For PMI8998, bob
>        For PMR735A, smps1 - smps3, ldo1 - ldo7
> @@ -70,6 +71,9 @@ properties:
>        - qcom,pm8350-rpmh-regulators
>        - qcom,pm8350c-rpmh-regulators
>        - qcom,pm8450-rpmh-regulators
> +      - qcom,pm8550-rpmh-regulators
> +      - qcom,pm8550ve-rpmh-regulators
> +      - qcom,pm8550vs-rpmh-regulators
>        - qcom,pm8998-rpmh-regulators
>        - qcom,pmg1110-rpmh-regulators
>        - qcom,pmi8998-rpmh-regulators
> @@ -83,7 +87,7 @@ properties:
>          RPMh resource name suffix used for the regulators found
>          on this PMIC.
>      $ref: /schemas/types.yaml#/definitions/string
> -    enum: [a, b, c, d, e, f, h, k]
> +    enum: [a, b, c, d, e, f, g, h, k]
>  
>    qcom,always-wait-for-ack:
>      description: |
> @@ -107,7 +111,7 @@ properties:
>        regulator-allow-set-load: ["regulator-allowed-modes"]
>  
>  patternProperties:
> -  "^(smps|ldo|lvs)[0-9]+$":
> +  "^(smps|ldo|lvs|bob)[0-9]+$":
>      type: object
>      $ref: "regulator.yaml#"
>      description: smps/ldo regulator nodes(s).
> @@ -296,8 +300,27 @@ allOf:
>              - qcom,pm8450-rpmh-regulators
>      then:
>        patternProperties:
> -        "^vdd-l[1-4]-supply$": true
> +        "^vdd-l[1-9]-supply$": true

Does not look related to this patch - aren't you changing some other
variant?

>          "^vdd-s[1-6]-supply$": true
> +        "^vdd-bob[1-2]-supply$": true

Does not look related to this patch.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,pm8550-rpmh-regulators
> +            - qcom,pm8550ve-rpmh-regulators
> +            - qcom,pm8550vs-rpmh-regulators
> +    then:
> +      properties:
> +        vdd-l2-l13-l14-supply: true
> +        vdd-l5-l16-supply: true
> +        vdd-l6-l7-supply: true
> +        vdd-l8-l9-supply: true
> +      patternProperties:
> +        "^vdd-l([1-4]|1[0-7])-supply$": true
> +        "^vdd-s[1-6]-supply$": true
> +        "^vdd-bob[1-2]-supply$": true
>  
>    - if:
>        properties:

Best regards,
Krzysztof

