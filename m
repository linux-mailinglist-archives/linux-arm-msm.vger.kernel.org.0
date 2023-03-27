Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB936CA2CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 13:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232548AbjC0Lt3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 07:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbjC0Lt2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 07:49:28 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5C222D68
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 04:49:18 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4dd9da1c068so97515e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 04:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679917757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSFETURvKeKlJ69zBNiZIDisEWdoIMslqYt90Emqjk4=;
        b=n5GVJradJsYF48fo16f5GWVhvJlsEGHoexdX4ykmCZOblBK4aNRQzxFXR+DPlgSA4h
         GihrA9TjOKQCmpBmnzMuo2sSpLHjAGO3pqNjQ3pAJ4fqdpa5Rc6q6CDNdl7r7AeI92hw
         xd5KRzdaXCAkHLkGKAXlVeLDOQSaz4Q7UTYlI39UbPqJ/H4j3dfbxN8psY3Pb31seHaY
         8FRy54XH4TKadFbFdhS8Rvw10XpJUCCQPHu2jjz0LxqFtWVYkxJCWCeVJzClVs2Pkj7q
         9MQ8aphVGb5OBnnNvvRjvq2X6nEpszRkGDSMtUMfXQsEfPvEDQACuKcuLRzuvbUBk/DL
         FSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679917757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSFETURvKeKlJ69zBNiZIDisEWdoIMslqYt90Emqjk4=;
        b=jNFU7XgUmF7KlThHxIDYny2lBlOtotSRL1yxzHGdlbhWmQiFiQxQSrhTHgr8Elo+ci
         hZxgPSDifu5Y6fOPu9iKqJmb6XjBPfB+9jZTJYPBU3ipimBLbfK+ja0oFD3hvuZlLtNy
         rEj27hvDso4y9xCd9PYxObSOdV0wq+SfDHWuskAOaXyKDxsi+Y6kfLT7TvvPGg41zuuH
         Ujsyp7q2Tim6y8OU1JIbtlmA2QXsrs9ZzFu/tOHaK65TF1o0bg/jsKdtoV7lFdJxKbSA
         pOVAyVMy2WRM7jSKi9iB+RaLm60MO2/e140y62hdW4RuaMvdSTMtN1Wgu1XBRNvKGWP7
         bgow==
X-Gm-Message-State: AAQBX9ei6j5PQ9iGUFw5zqyvyl4WEgtIexAmW68Yr1bHAq4O2XubBdmJ
        wLEiO9ZzjIvG7np01+a4LJ/XOQ==
X-Google-Smtp-Source: AKy350YJXhj3arGqXXTpc2VgZV6Qr9pWR9vJmoZ6WgNyjGx7wXKME8/6rq0oTj3BTzcWTCBwndVW9A==
X-Received: by 2002:ac2:4a66:0:b0:4e0:2e20:b663 with SMTP id q6-20020ac24a66000000b004e02e20b663mr2515470lfp.6.1679917757081;
        Mon, 27 Mar 2023 04:49:17 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id p16-20020a05651238d000b004e8508899basm4676361lft.86.2023.03.27.04.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 04:49:16 -0700 (PDT)
Message-ID: <333081a2-6b31-3fca-1a95-4273b5a46fb7@linaro.org>
Date:   Mon, 27 Mar 2023 14:49:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v2 03/10] dt-bindings: qcom-qce: Fix compatibles
 combinations for SM8150 and IPQ4019 SoCs
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.linux@gmail.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org, konrad.dybcio@linaro.org, rfoss@kernel.org,
        neil.armstrong@linaro.org
References: <20230322114519.3412469-1-bhupesh.sharma@linaro.org>
 <20230322114519.3412469-4-bhupesh.sharma@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20230322114519.3412469-4-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhupesh,

On 3/22/23 13:45, Bhupesh Sharma wrote:
> Currently the compatible list available in 'qce' dt-bindings does not
> support SM8150 and IPQ4019 SoCs directly, leading to following
> 'dtbs_check' error:
> 
>   arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb:
>    crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['qcom,sm8150-qce', 'qcom,qce'] is too long
> 	['qcom,sm8150-qce', 'qcom,qce'] is too short
> 
> Fix the same.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>   Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> index e375bd981300..90ddf98a6df9 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> @@ -24,6 +24,12 @@ properties:
>           deprecated: true
>           description: Kept only for ABI backward compatibility
>   
> +      - items:
> +          - enum:
> +              - qcom,ipq4019-qce
> +              - qcom,sm8150-qce
> +          - const: qcom,qce
> +

thank you for the fix, the change is correct, please apply the tag:

Fixes: 00f3bc2db351 ("dt-bindings: qcom-qce: Add new SoC compatible strings for Qualcomm QCE IP")

But let me ask you to split the "items" into two:

       - items:
           - const: qcom,ipq4019-qce
           - const: qcom,qce

       - items:
           - const: qcom,sm8150-qce
           - const: qcom,qce

and put each of these two new items below a list of compatible values,
where a family compatible describes the list.

Nevertheless, please also add my tag:

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
