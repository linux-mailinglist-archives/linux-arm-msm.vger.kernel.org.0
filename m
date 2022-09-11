Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1716E5B4F1F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 15:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbiIKNh0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 09:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbiIKNhZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 09:37:25 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533AF2E6BD
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:37:24 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a8so10628356lff.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ae3obZ6xNwy7r5xGyrjRqVjIzsAgTF+V8+8P3DQs4ck=;
        b=tEI1Vb3SiFQt1nVT79g4fTkhzFwPN9946CF/OeoCGSN9UpKje900PJE8wgeKBTThrT
         O8YnrkKKbqhPPom9F+C6MQHKNHj1s5N71q/b4IfxSRPIGDLj6Olu2uXPgT5qbw6cRhDR
         KKiLFho0ROSXJDcCl/xyjA9leXK2OElJMVpPQ/K6SjcMAC6fei3AmY/RnKMpNKPXffPF
         PcoanndnxTTWf1TZXwYmO8wwQSNzurVFWQZ/3SQN2RZL38KmvU7j+FxQylaNe+4SMzip
         6/gOiuzUjQupf7OlSseD1CSyFVFw6IxvkLZCDcx+O0pOolr4bzVYQfat0r0m2zE4Uzub
         9h2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ae3obZ6xNwy7r5xGyrjRqVjIzsAgTF+V8+8P3DQs4ck=;
        b=GFaIrkqYz4wiXV29uVAc0vmayDdQa89wZ/JtDvcDTmowNAHp+egOU4kJ0Xc95tFLFy
         Fm+SBYjm8c3WnrxEqwNw4bXjyrSdutOvzDA958MgcHOUdTAr5dL7AKnWFzN1HagZG4Gz
         7I6mZJsfjoRFjrcMO6j3cotnTp+k7iteAiCRvoeJO55d+YN5oJBdHR8IAalcu1dMFvCB
         EJEAbM+G3rPVpDJaJX4B0d4tIP7Rtk01qWJ0mmZ2ofcmEgx58nEnS+saUJ9UN9omYN5z
         h+/M5TSQUEa9AlqeeLz0ytw4mmMdXFokAtzmFEB1b4E3Y5onng5IHSgk5UH0XhmJvyjF
         bAiQ==
X-Gm-Message-State: ACgBeo1ADZ8KD8WRWwZpFhkRTVY27rtKPtf3sR6H3tT+iNY/JgiwBMpC
        9n8bVKHvj5Bpt32+j50QODBVUQ==
X-Google-Smtp-Source: AA6agR6uGBP6sA6xiTk67d6e5N6CPYKgmdLRbR9Iasd8iydXnoRVaZa1bUt07RKUKqCJzenAxNbF/g==
X-Received: by 2002:a05:6512:2255:b0:492:ebbb:5f0d with SMTP id i21-20020a056512225500b00492ebbb5f0dmr7027817lfu.304.1662903442721;
        Sun, 11 Sep 2022 06:37:22 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y24-20020a199158000000b004947984b385sm616645lfj.87.2022.09.11.06.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 06:37:22 -0700 (PDT)
Message-ID: <c53ad0ba-7a0c-4f5b-e31d-ab63e2e9b6b7@linaro.org>
Date:   Sun, 11 Sep 2022 15:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 01/10] dt-bindings: thermal: tsens: support per-sensor
 calibration cells
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220910124701.4060321-1-dmitry.baryshkov@linaro.org>
 <20220910124701.4060321-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220910124701.4060321-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/09/2022 14:46, Dmitry Baryshkov wrote:
> Allow specifing the exact calibration mode and calibration data as nvmem
> cells, rather than specifying just a single calibration data blob.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/thermal/qcom-tsens.yaml          | 64 ++++++++++++++++---
>  1 file changed, 54 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 038d81338fcf..b813f6f19c1d 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -77,18 +77,62 @@ properties:
>        - const: critical
>  
>    nvmem-cells:
> -    minItems: 1
> -    maxItems: 2
> -    description:
> -      Reference to an nvmem node for the calibration data
> +    oneOf:
> +      - minItems: 1
> +        maxItems: 2
> +        description:
> +          Reference to an nvmem node for the calibration data
> +      - minItems: 5
> +        maxItems: 35
> +        description: |
> +          Reference to an nvmem cells for the calibration mode, two calibration

s/an nvmem/nvmem/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
