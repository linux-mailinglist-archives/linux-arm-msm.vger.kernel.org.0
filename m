Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C385862BE5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbiKPMkk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:40:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiKPMki (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:40:38 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B93926C
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:40:37 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id b9so21671866ljr.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sMjAMULuhwmDIgOqqM6Vxh3iSZko0vN2QO1sVbdLZnY=;
        b=NexxzSeDuKbt0dBCKsAH4EWx2N6qgaOdGHpylos+4JEYagbKQR1elSGsqbnb98Sfm/
         hRRefVKhjQEe6sIpSVHIty4vvJ8QiBgyBT/va8/k/SiywVrLO+UAmtPwHf0CC83VheQn
         edcscXtI8HYxm1DJ82CSdTCWNXwA+GjzQc661J2/T5ke6CyChb9utMUIlbdvyC6uoVDm
         LTF1Kc7YH7plOXwNli2oj/143LSv2h8lqv0ukyBjCnxWXizP6OO00+7x9MxN8JFEivt9
         sM7mMKVElpePl6K/TRk5L+YKyvbAD232eAd+VQcXKAK2RQNYwQCXtTHsGTXyjED+YNSH
         6EEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMjAMULuhwmDIgOqqM6Vxh3iSZko0vN2QO1sVbdLZnY=;
        b=Y7KOh6K95s03gZ7Oj1uwU4ryMZfpeOJQSYytQ2tKJdunwi9J5k4dvSkzujtlEOJ2lT
         BfqG9435oQwOpBS1QTMSKOClYqzMLVFpZ8LRE6x7T5nWpXgQ9wsT9eRCPm2f0W2PUTHq
         HnyG4BGU37VeQz0l95iqJUzSfXPMYycUvYRHW11HovrsvBLlUhZZFeVfOYMPvE75nlwL
         xqZrdLqy1RJ4GXCnoIQcPPuodJ2Pre5kUCTijgT2F3SwcDoohOMnW4GTH7NGvDDAUR0A
         WfA7rYFxBXqDP/2xnexfKwKZe9htzQbSF8q5mj+2Rhp4oiOf0fMhcCuQh1HTb3sBSk85
         fVig==
X-Gm-Message-State: ANoB5pmhCtkZPMyoaBZ0qJYPI/NTgrqTvjKf4I+1esWwTBlKMNYDc23C
        yX5fn2zhfjk1MQRWDcJbdnQ9qw==
X-Google-Smtp-Source: AA0mqf6OQIkDD7uLzdcLyX23N1wL0jBRn9QYH4+ABWy3AdhumuX5CFlmGxNSu0QxK39eGh2K/ihMwQ==
X-Received: by 2002:a2e:920e:0:b0:26f:c0f4:2360 with SMTP id k14-20020a2e920e000000b0026fc0f42360mr7291571ljg.374.1668602435603;
        Wed, 16 Nov 2022 04:40:35 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b13-20020ac25e8d000000b00497ac6b2b15sm2569769lfq.157.2022.11.16.04.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 04:40:34 -0800 (PST)
Message-ID: <d73e2390-1449-a355-72c0-0184fb87d864@linaro.org>
Date:   Wed, 16 Nov 2022 13:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/8] dt-bindings: PCI: qcom: Add sm8350 to bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
References: <20221110183158.856242-1-dmitry.baryshkov@linaro.org>
 <20221110183158.856242-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221110183158.856242-2-dmitry.baryshkov@linaro.org>
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

On 10/11/2022 19:31, Dmitry Baryshkov wrote:
> Add bindings for two PCIe hosts on SM8350 platform. The only difference
> between them is in the aggre0 clock, which warrants the oneOf clause for
> the clocks properties.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/pci/qcom,pcie.yaml    | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> index 54f07852d279..502c15f7dd96 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -32,6 +32,7 @@ properties:
>        - qcom,pcie-sdm845
>        - qcom,pcie-sm8150
>        - qcom,pcie-sm8250
> +      - qcom,pcie-sm8350
>        - qcom,pcie-sm8450-pcie0
>        - qcom,pcie-sm8450-pcie1
>        - qcom,pcie-ipq6018
> @@ -185,6 +186,7 @@ allOf:
>                - qcom,pcie-sc8180x
>                - qcom,pcie-sc8280xp
>                - qcom,pcie-sm8250
> +              - qcom,pcie-sm8350
>                - qcom,pcie-sm8450-pcie0
>                - qcom,pcie-sm8450-pcie1
>      then:
> @@ -540,6 +542,49 @@ allOf:
>            items:
>              - const: pci # PCIe core reset
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,pcie-sm8350
> +    then:
> +      oneOf:
> +          # Unfortunately the "optional" aggre0 clock is used in the middle of the list

It's a new device, new support, so you can put it everywhere you wish,
can't you? Just put at the and and add minItems:8

Best regards,
Krzysztof

