Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D387671BE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 13:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjARMUw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 07:20:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbjARMTD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 07:19:03 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD41958986
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 03:41:55 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id q10so14318949wrs.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 03:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGHFHZvnL2Z0zGaW92z6BFzy5L5MiRfkHohrKv00800=;
        b=TThCXk5vM2PSilElu36exteHNDtCSzm9wLDnot5yTmIgVGoTiYKHshvoe05PJrQcUs
         OSGm9FfT4nUfUQrRMa50p2hiqZNlUbklilbXl7pOOVUw22P5MHoHK/cHHax3hHiD5te6
         xsE5YiYMfsLUN60O99FkjZCLdy5FqsKx5dxz0ciaGdCzk7E/90W902zaoz8CYQSXU1ig
         uy7LiG2En7pwqW4vWfdKeiT3sgDqCUuIgzkiDHa4rNHEjkM2hSh2sAZzSSe/BPBjKrJz
         P8Mc2dR2SohZtEUUIIJO8Cxa8tEWx38tt48FlyvWl4mN2AYww/nEMVagHmDBz4NJAGuo
         Avdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGHFHZvnL2Z0zGaW92z6BFzy5L5MiRfkHohrKv00800=;
        b=K2wNfdw6jWZpQaiq8kdG3n7M3Fu035eJEIA1JZKiRQaC/P510PQkgD9+4RZZKbPkX7
         4elCSK7Yus54FjTcSBGSX4sHx80shNFeY5xFA+Xp6OL6Kyob/htuRX84GSbQSlTocw6B
         U4c+YbXBpX7lnt3JOjj1N+EBFPxlTsMTUx4q9YXgFSYkLqf6yeAKKosHJZZxdI+/jyMs
         xuRCRKo7jDOW1FvuI+PAYE5VMPOgKDA3kSEe/emBPYzxI+cK6IPSENX9Co9Zeq0f/oWy
         VCFsONJ22igZjz2kL8uXZ/7Ey3ciwg5Duzrp4tAqq1bSgZPlEM5dtVBdHBeGRAog3HGi
         g6FQ==
X-Gm-Message-State: AFqh2kqPxV6Eh0diI92CKSw21DwE5sfCF4Fzi/dgjjbNUYpVDEchhUQ3
        oo2QOa/obNQ8SNkB1JTGaebFHA==
X-Google-Smtp-Source: AMrXdXtRbtW9Mi7dMJWowIoYpX5sXYSUY88LmlIid4AVqtsTlKlEEkRjWJhxWrC4dczicm0j5Ner1g==
X-Received: by 2002:a5d:4a0b:0:b0:2be:1645:69b1 with SMTP id m11-20020a5d4a0b000000b002be164569b1mr6141130wrq.63.1674042114345;
        Wed, 18 Jan 2023 03:41:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k18-20020adfb352000000b00241fab5a296sm31782691wrd.40.2023.01.18.03.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 03:41:53 -0800 (PST)
Message-ID: <efd7df12-d94b-4850-728d-416bdbbc295a@linaro.org>
Date:   Wed, 18 Jan 2023 12:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 3/6] dt-bindings: mailbox: qcom: correct the list of
 platforms using clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
 <20230117223013.1545026-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117223013.1545026-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/01/2023 23:30, Dmitry Baryshkov wrote:
> Only three platforms require `pll' and `aux' clocks: msm8916, msm8939
> and qcs404. Correct the list of platforms in the corresponding clause.
> 
> Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../mailbox/qcom,apcs-kpss-global.yaml        | 33 ++++++++++++++-----
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index ecc286ab49ef..7d8de7a16984 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -72,15 +72,8 @@ allOf:
>          compatible:
>            enum:
>              - qcom,msm8916-apcs-kpss-global
> -            - qcom,msm8994-apcs-kpss-global
> -            - qcom,msm8996-apcs-hmss-global
> -            - qcom,msm8998-apcs-hmss-global
> +            - qcom,msm8939-apcs-kpss-global
>              - qcom,qcs404-apcs-apps-global
> -            - qcom,sc7180-apss-shared
> -            - qcom,sdm660-apcs-hmss-global
> -            - qcom,sdm845-apss-shared
> -            - qcom,sm6125-apcs-hmss-global
> -            - qcom,sm8150-apss-shared
>      then:
>        properties:
>          clocks:
> @@ -124,6 +117,30 @@ allOf:
>            items:
>              - const: pll
>              - const: xo
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,msm8953-apcs-kpss-global
> +            - qcom,msm8976-apcs-kpss-global
> +            - qcom,msm8994-apcs-kpss-global
> +            - qcom,msm8996-apcs-hmss-global
> +            - qcom,msm8998-apcs-hmss-global
> +            - qcom,qcm2290-apcs-hmss-global
> +            - qcom,sc7180-apss-shared
> +            - qcom,sc8180x-apss-shared
> +            - qcom,sdm660-apcs-hmss-global
> +            - qcom,sdm845-apss-shared
> +            - qcom,sm4250-apcs-hmss-global
> +            - qcom,sm6115-apcs-hmss-global
> +            - qcom,sm6125-apcs-hmss-global
> +            - qcom,sm8150-apss-shared

Isn't this in multiple places now? This doesn't match what you remove
either.

Best regards,
Krzysztof

