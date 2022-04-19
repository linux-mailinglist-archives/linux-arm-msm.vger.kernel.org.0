Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9341C506577
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 09:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240660AbiDSHP7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 03:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239829AbiDSHP6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 03:15:58 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D7E31908
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 00:13:15 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id k23so30984563ejd.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 00:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bu1o0GE00LnPzqAclqepyW4OOFaOcispDubo0hpXdkM=;
        b=Gm2j36zecNJ80R0frxFIXrrmpkRYiAKAPXAZAtiDBdSRHk71ahkpRY7B9IGwEuFhgP
         eAqImQsv+qBiXrWYYgpJWwDAkwP6Qh0qyYPGR6TNmBowbLtkFhXoQwQutIymyN1plXUF
         RqwwrvWhPAUzwTBAOouzEO3AjhmtjCyBv7YVBqCGltZiHTF0Q+A3bW1rRUke7a0kMUKy
         L1FuR+Cn+hvxZmFvMhadp+M7/KRRC7qDi31NChtnVsMl3nAtKMhr3N5OnftdTLFVMdCZ
         EjKDcQNGZNEUFL2tYR8n/DEIMocfzZYYuQCzNFMQp7vHBBKN63tYxUKF/CGC3hrftcFU
         sRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bu1o0GE00LnPzqAclqepyW4OOFaOcispDubo0hpXdkM=;
        b=lSsASfKKj8+ygqojL9jXUi0uPOQO1OlSI4hlbf3Hs54P1/ECU9bErpKIPLWLeBqtcq
         eyD4HAR9OaUBsUFFhZTrJc13+yxabw8QIoRoU78XNlTZ+KW+1vZdieD+PrK5xCqKdps/
         5TdSMhaL3Uz7QsNDIRKAJwJXHA1rYaE1aaTWtK2+sZ/oB22NuFkWTezhnItLnKU9oxF5
         fPoiaXOLrO43RqCfZEehj1MBJcKsevVZkVcmWnw27g180R82t4coqyYZ7ZpjJzDEFW3W
         zdB9sRWjU9WHbayzSzrS3dAvqYwtxRVTZACxn1yTGwdHYgBIZC6rqphneH2tBMoqJv6q
         Kr1Q==
X-Gm-Message-State: AOAM530pVWq7S7kegOSXs/WcWTU1ae5nsMnSMwweSPb8AbB13vO/RNME
        Y8/5bLhp116CDnJGyj0PvfwWew==
X-Google-Smtp-Source: ABdhPJyvqO2VS20WGwDGpNEqRyrYHNOwFe2ge8Bg6NCfZv2Yfy7BJKDCPXcgV3ZxzPHlcGiIcBWnZw==
X-Received: by 2002:a17:907:2a53:b0:6ce:e4fe:3f92 with SMTP id fe19-20020a1709072a5300b006cee4fe3f92mr12151876ejc.389.1650352394405;
        Tue, 19 Apr 2022 00:13:14 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id kw5-20020a170907770500b006db075e5358sm5371270ejc.66.2022.04.19.00.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 00:13:13 -0700 (PDT)
Message-ID: <48f22c37-66e3-15bf-753d-56630ce41970@linaro.org>
Date:   Tue, 19 Apr 2022 09:13:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 1/4] dt-bindings: arm: qcom: Document MSM8939 SoC
 binding
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     shawn.guo@linaro.org, jun.nie@linaro.org, benl@squareup.com,
        jwillcox@squareup.com, jgates@squareup.com, mchen@squareup.com,
        zac@squareup.com
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-2-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220419010903.3109514-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/04/2022 03:09, Bryan O'Donoghue wrote:
> Document the MSM8939 and supported boards in upstream Sony "Tulip" M4 Aqua
> and Square APQ8039 T2.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 129cdd246223..0e4f3a4d1a58 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -34,6 +34,7 @@ description: |
>          mdm9615
>          msm8226
>          msm8916
> +	msm8939

Some indentation mixup.

>          msm8974
>          msm8992
>          msm8994
> @@ -133,6 +134,12 @@ properties:
>                - samsung,s3ve3g
>            - const: qcom,msm8226
>  
> +    - items:

The same

> +          - enum:
> +              - square,apq8039-t2
> +              - sony,kanuti-tulip

Please put them in alphabetical order (so sony, square).

> +          - const: qcom,msm8939
> +
>        - items:
>            - enum:
>                - qcom,msm8960-cdp


Best regards,
Krzysztof
