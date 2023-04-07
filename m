Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3A8C6DAA6C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 10:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232724AbjDGIs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 04:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240562AbjDGIsI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 04:48:08 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982CC1B3
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 01:47:57 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id g18so6998993ejx.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680857276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=isknrhl7Ozvk9X2AHSK4BNf2Ami8lH42t6zYtaIblto=;
        b=X1I0/H6UGHdKgeMaP/rmuueGasci7yEZbHv1ElHhgQm6C+DxyLztboqN+eMnJMv9zs
         bRHSr4EkyHysK/fLOQsRJpCpVeFJYSmudkD2oNEQ6UGTfR5dA9QcBrJhfLJv3240lXoY
         qV8kuT+B6WbKLMJ7/tEKkTXh81qMJxxeCvX9L7meBE+HimWc8n6kZ93u0hh+fER7yDxu
         VfpJz7vGB4Erdh5nqTZI7+pl7DjPj/o/86KJBrqPV3xAq6tX6ZoVzxIIjtoULC1qkGoS
         GthZTMKntifN3XObhsHWHixeQyIcJy5IdAcuHphYrCD6n/pO9mwhm0Tbp0bJs6grnhS4
         kbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680857276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=isknrhl7Ozvk9X2AHSK4BNf2Ami8lH42t6zYtaIblto=;
        b=DIXsf5MrckDTkbGgNDppk6HKx2ddTE8eoRnGiivIF7qO9MNaJsHLFil5wkhdf+Ffy1
         9nUKHt4yUIvty8xoCbioaRvU+qk+B+rzHHTnVp1FR5pV88Knb8ZhmOevWX2rkQM7a3BG
         f10MCuf3T5rzeDuC42v17MmFzMVW7vjAG+PoYWuh/sro7JEhSEkFGu1F4AnxU/+6ZuR8
         xGrWG4GzLICb36I6xViYscyZyhMd/2o9JHJjVmnkb6spGWxqecJOkTUmHsW4kDkA/OrN
         zEjNwlS1/SpllIUWfHg7WVYNBTUsObQScs1MeGK0EzHemgFbqGM1vmF/tlrHsDuDuquN
         EDyw==
X-Gm-Message-State: AAQBX9crfKZR72F8S1yMKSoT51Q9jEG/hU68o+o7ernJgDhikfLg1tv4
        CNf9Fxxm9VfYDlZ5Zlfalm73GQ==
X-Google-Smtp-Source: AKy350aVBNxf/rWJt3ZqXMKvTuUvnSB1Lreq8iG8swX1X8Q+ImyfVs42UjDFFR5LihOTseZ8WSogbQ==
X-Received: by 2002:a17:906:6da:b0:93a:f977:e0fe with SMTP id v26-20020a17090606da00b0093af977e0femr1404701ejb.20.1680857276039;
        Fri, 07 Apr 2023 01:47:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:14a3:366:3172:3c37? ([2a02:810d:15c0:828:14a3:366:3172:3c37])
        by smtp.gmail.com with ESMTPSA id fy36-20020a1709069f2400b00927f6c799e6sm1794361ejc.132.2023.04.07.01.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 01:47:55 -0700 (PDT)
Message-ID: <4b972e89-8023-8ed7-cd18-fb935be50c64@linaro.org>
Date:   Fri, 7 Apr 2023 10:47:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/5] dt-bindings: phy: qmp-ufs: describe the UFS PHY
 for sa8775p
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230406194703.495836-1-brgl@bgdev.pl>
 <20230406194703.495836-3-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406194703.495836-3-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/04/2023 21:47, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a new compatible for the QMP UFS PHY found on sa8775p platforms and
> update the clocks property to accommodate three clocks.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> index cd0fbbd3593d..5bc93acccbad 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -16,6 +16,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,sa8775p-qmp-ufs-phy
>        - qcom,sc8280xp-qmp-ufs-phy
>        - qcom,sm6125-qmp-ufs-phy
>        - qcom,sm7150-qmp-ufs-phy
> @@ -25,12 +26,15 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: ref
>        - const: ref_aux
> +      - const: qref
>  
>    power-domains:
>      maxItems: 1
> @@ -52,6 +56,26 @@ properties:
>    "#phy-cells":
>      const: 0
>  
> +allOf:

I should notice wrong different placement before.
allOf: blocks goes just like in example-schema, so after required:.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sa8775p-qmp-ufs-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          maxItems: 3
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          maxItems: 2
> +
>  required:
>    - compatible
>    - reg

Best regards,
Krzysztof

