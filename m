Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 769E764BA7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 18:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235492AbiLMRCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 12:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236095AbiLMRBt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 12:01:49 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0242020358
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 08:58:04 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id y25so5890969lfa.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 08:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M4dDB5dN6DMrQu6Vy/E+I6J3WENZ7E9cD8ZDZ3GLB3g=;
        b=i7pcOplKPKGMmwMVp+ENu2AXaZnU2/VqiaNfXMMxKZlOktC7NtEqwjYZGvGchVxA+H
         1qGINNTXjhHauma7BnGzNfVTIlh8MHU15PzGCJFsg71HHBh0SvZ8sPCchhL9PUgS9/Sh
         NCYq0CIXfMe0KDIi065of/FG66bZQPXuVgUO5TpdLMhd7gEjMMak0QmQcpVpLeqOHSIH
         R/DZtraUq+l7ooLKXIjMO74R8q9oKzDiM5DgAdETN5lE/mG9Dfiz3U8FWE0Gn4RhTCo9
         /xfIQ4MPUzTqOXmvMg6SrZT/vK9mKUXYIuv4oBplcmi/yjzXDnT7DhPsR0hWl7JEo0yr
         DOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4dDB5dN6DMrQu6Vy/E+I6J3WENZ7E9cD8ZDZ3GLB3g=;
        b=DqMjCGWve3lgE4d1yGx3OqQZvf6GptDutLcIa/wex+azNt1aaAjA70LpDM+BZcq9Go
         hhISjNH3xHYecsqoL+viDWKyGjcMzE0zjlHGWRx0KKJBitLdakn/Mdzp1y2/ZOm3mDjB
         72NtoEKmM/Ch4opMjHhFLr2SV4fZXsv6mCqTWm46BeRJEggFnoLokr25PMA89qOuO1LL
         koIQWPdUxLwrPmnyWAOqBvrmS/+MQZpr+kG/pvWzf3XvaGOwpL7P1/4SPEB/0fQjjdSw
         ZnTprnS7AMg8VJM9Jp0ks+fAiaZ1xU7zmqqFyH4w8xDDXNSJeh6qiksKikEApkAvTji1
         arDQ==
X-Gm-Message-State: ANoB5pkAK+0Ozu3vx00izFcnONdZzna0SWkAonzrtjtRHSnTGBrBUGQk
        tDEwu0YBT4d1W59weMb0GbYnBA==
X-Google-Smtp-Source: AA0mqf5HpQWulj2W92M8QdF11R5Gok573QQhYv6qEWnSPyebG2p0J2+cMYKEUPW8Nwx/8vJcN65ylg==
X-Received: by 2002:ac2:4c4a:0:b0:4b6:eb36:e73e with SMTP id o10-20020ac24c4a000000b004b6eb36e73emr2860949lfk.17.1670950682407;
        Tue, 13 Dec 2022 08:58:02 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x6-20020a056512046600b00494a603953dsm441669lfd.89.2022.12.13.08.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 08:58:02 -0800 (PST)
Message-ID: <b8be66e0-f987-b3ec-b78e-5be8bf54b05e@linaro.org>
Date:   Tue, 13 Dec 2022 17:58:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/4] dt-bindings: i2c: qcom,i2c-cci: Fall back to common
 compatibles
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221213115628.105149-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213115628.105149-1-konrad.dybcio@linaro.org>
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

On 13/12/2022 12:56, Konrad Dybcio wrote:
> Almost every compatible string in the CCI driver is a duplicate. Adjust
> the bindings to include a common (first-soc-implementing-vX) compatible
> to remove the need to keep adding superfluous compatible strings.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 25 +++++++++++++------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index cf9f8fda595f..65cf7860a9a0 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -12,14 +12,23 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,msm8226-cci
> -      - qcom,msm8916-cci
> -      - qcom,msm8974-cci
> -      - qcom,msm8996-cci
> -      - qcom,sdm845-cci
> -      - qcom,sm8250-cci
> -      - qcom,sm8450-cci
> +    oneOf:

Except missing test, how about also adding a comment to the driver, that
list of compatibles should not grow when not needed?

Best regards,
Krzysztof

