Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9776A5B2963
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 00:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiIHWbb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 18:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbiIHWb1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 18:31:27 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA865A2844
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 15:31:10 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id bq23so30172836lfb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 15:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8T4fKvOonid0j3E0r/ArsOfkeoikKqk38EUT6s5grdA=;
        b=O7p2FnJF2IXwOXG9q90yWZqlOpP5Kg/nCQMh9N243NDTZCEeYYqFujSIBAjYUKM3ox
         8dISPwjjoQSAjH+U4sAre1zysed/8u78DTFkO2oitTvZ9WZR8NOrOAgEURQPc7wnW4+S
         g8bRvf+wvpICmmNwoLtWBhoeOX1GQRybnwTZK/Qt/efH842dy4/Vwlvvm8MSRVk749vQ
         mipSpGXXvg6lYnkU82BFDC2WFB3uxTZP+N8TnHOSowftd+cX/jwdXzW/tVjvQEn9AXLO
         PUn+bFL5j4Qmj05N9lJJC2Lo71WjZY6ZSbqg/vEPQgofaYMg+PxuQvn2aAn1SX7l/kar
         Pa8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8T4fKvOonid0j3E0r/ArsOfkeoikKqk38EUT6s5grdA=;
        b=ESCEvBRdpnvUwyI0kzQxnK3yaOFLU5TrLQLVbW45y9wdz3s+XL/VfHSK3s3gEX0Ewh
         0b3+q9RlaRD3onB12aMlN7to9gXy7f/VDYics+n8xzUxKP410YNN+paZUAqNHPhYBb/Q
         NU0WZih0hZiHLDEgczvhsO6TrqYC9BGhxM/sLHKvZeeTlcN6Hkxqr6eO9AjC2gpVln8t
         LMQjA0DWzRkd/sHFXsIvaV/fbJRXcwq3t5gTWPYmd8pQqwEGV7oTtghbKgtNjv43o31f
         Gku/SgIRUa5dOrMsdmFJy+2wUVjQMcbDb4SZpuG+BWoT+YpyyrwkajYw9wRSnQg9B7Ae
         HqwA==
X-Gm-Message-State: ACgBeo21bbIoacRSFCNKI++8hJFyw86Vhjq9PfQc+ctVqmjnJ6dSbSUJ
        tsKvbRCJmaMAT1aNwqyequo72A==
X-Google-Smtp-Source: AA6agR67YkpQrolzfl4/9Dr8NGHEb+7wdMV29e4tx+XpR4M1h3c+ReW8hy8FzAfuWKUudHKtQzAdwA==
X-Received: by 2002:a05:6512:32c6:b0:494:99fe:49b9 with SMTP id f6-20020a05651232c600b0049499fe49b9mr3203063lfg.410.1662676265588;
        Thu, 08 Sep 2022 15:31:05 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 6-20020a2eb946000000b0026ab0087ff3sm5890ljs.54.2022.09.08.15.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 15:31:05 -0700 (PDT)
Message-ID: <78a086ce-4961-9144-9d81-a928ff0bc0ad@linaro.org>
Date:   Fri, 9 Sep 2022 01:31:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 01/11] dt-bindings: msm: dsi-controller-main: Drop
 redundant phy-names
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
 <20220907000105.786265-2-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220907000105.786265-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 03:00, Bryan O'Donoghue wrote:
> Adding in msm8939 which is based msm8916 dtsi I stumbled across a binding
> check complaining about the phy name for msm8916 which we were reusing for
> msm8939.
> 
> The currently inconsistent upstream dtsi naming of "dsi" and "dsi-phy" is
> not captured in the yaml for this driver.
> 
> The driver however doesn't care about the name of DSI phy, hence the yaml
> check is redundant.
> 
> Both Krzysztof and Rob suggested we could drop the phy-names entirely if it
> really isn't a dependency.
> 
> So, drop the inconsistent and unnecessary phy-names field from the yaml.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 880bfe930830c..3742e2ab4fb1d 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -49,6 +49,7 @@ properties:
>       maxItems: 1
>   
>     phy-names:
> +    deprecated: true
>       const: dsi
>   
>     "#address-cells": true
> @@ -133,7 +134,6 @@ required:
>     - clocks
>     - clock-names
>     - phys
> -  - phy-names
>     - assigned-clocks
>     - assigned-clock-parents
>     - power-domains

-- 
With best wishes
Dmitry

