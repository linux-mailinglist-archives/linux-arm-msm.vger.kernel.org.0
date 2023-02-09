Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A300F690375
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 10:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjBIJWV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 04:22:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbjBIJWA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 04:22:00 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E887627AA
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 01:20:58 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id d14so1067727wrr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 01:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p4OHHewCXMH/ESw/iOq51Yxy324ZCr/Q6fY+cFJPb9o=;
        b=c4sm3hGpQhJtNqSGg8zl3bmA0K8B2T1VTD2Ekjg/rIvQFAWJxreW7n7y8bAPdN1pbz
         Rc5M9UywHycDJqq2595ikzLwOsbzswDwzgDYqadImQ1ypld3BlbfjmJo1JvzOqBX3hPT
         sbcc/jgjIyuvEHyenfBkct314uq9bFrEkTK7x8vDjFnQANz8pPNqBdgZ5QP+2Ze7hFqV
         yZYCJiaA8rJnnhy5t+hQy/gIksHjLinFtTMemnagal4w3SoZplQagUxCeWfBucqba26f
         V14BK9ssLwDtHF8BCLKZ0pYc3J4M/7R2GOQw7ox6Ti/T4xVUaRW8Ca9m5LfmHe2OP1/y
         fH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p4OHHewCXMH/ESw/iOq51Yxy324ZCr/Q6fY+cFJPb9o=;
        b=dpsPeZHbooUOFMGQO/NkW3ELD9QcmlqiToywwCm5FFIZDYgFudXqrpW+cKEBeeaYBm
         40S2oBKxQqfOoN11qpcxXkyhFEWlniBIOZdm0us43v0/bJNddVB5hdRHV1D+WjyGqLZu
         MGXEQPlD5/NHlhzD4WyPvu3v/B1uDx/xngoO8WwlXHg5LXi5WYSORIhTvOixk4aEz/pf
         nNPkE+w4sUazd7bfe83ZLPTkloqeWEXtjfB/FslTVWR44eS0tgwZUbO36KodIltNG5DE
         eB2xdmebYEqJH1uCx0sZYhhAoBS/rk6vudnboq1DyK0Pdk31odujUPF0DEQxmxhNs9Gu
         zLBQ==
X-Gm-Message-State: AO0yUKVPsF4ONPlbe3EFky/t+9htUiX/8NuL9YIQh39Fz8kCKqjbEBDr
        5U60d/XGD/71ETBU5QaydHR9fQ==
X-Google-Smtp-Source: AK7set/7rSkyXYPTGM0hSVKodADiRAbask66tCwsOHESg3yjYZ0N70LCroNzcPasIlbT43byuK0tmg==
X-Received: by 2002:a05:6000:1803:b0:2bf:afaf:9d71 with SMTP id m3-20020a056000180300b002bfafaf9d71mr9437503wrh.48.1675934453758;
        Thu, 09 Feb 2023 01:20:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h1-20020a056000000100b002c405e19010sm777081wrx.11.2023.02.09.01.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 01:20:53 -0800 (PST)
Message-ID: <b2d75c0a-a9f3-3d28-5e05-25fe3a18dcfb@linaro.org>
Date:   Thu, 9 Feb 2023 10:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v9 06/14] dt-bindings: qcom-qce: document optional clocks
 and clock-names properties
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230208183755.2907771-1-vladimir.zapolskiy@linaro.org>
 <20230208183755.2907771-7-vladimir.zapolskiy@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208183755.2907771-7-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/02/2023 19:37, Vladimir Zapolskiy wrote:
> On newer Qualcomm SoCs the crypto engine clocks are enabled by default
> by security firmware. To drop clocks and clock-names from the list of
> required properties use 'qcom,sm8150-qce' compatible name.
> 
> The change is based on Neil Armstrong's observation and an original change.
> 
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../devicetree/bindings/crypto/qcom-qce.yaml      | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> index f6f1759a2f6e..d0f6b830a5dd 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> @@ -79,11 +79,22 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - clocks
> -  - clock-names
>    - dmas
>    - dma-names
>  
> +if:

This should be in allOf, like I wrote in last discussion.


Best regards,
Krzysztof

