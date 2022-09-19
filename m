Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 900335BC292
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Sep 2022 07:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiISFj3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 01:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiISFj2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 01:39:28 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D32315
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Sep 2022 22:39:27 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 102-20020a9d0bef000000b0065a08449ab3so1472717oth.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Sep 2022 22:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=h/Xb/SjYamgmuc9/HYs1Qw6eqp+XJYnyCWos19UVYB0=;
        b=VEkWfkD3ATJfU/KZ3Oxle4h+ibuvGu0iZqsZfrYqoR/Iwjss0azt7JxK/2SzpOdLS+
         ag5J2ABI1cOJmr04RehmeUM4M+MPQDdz3eQjS0KBWEICrBjGMsHE1agiMSCuMZdk5rE3
         06EU8dTuSKKL/cQFVr5xNVDpwFBqpaHpdOpaczgURpb/r9hpghUMUMr31azFENXogTpa
         ys2NFVcaMok49VIf1gxZ5EYOAzj4eYASsEk9EcpHWPiYwvbBwNUF6VKCOIHmgq2vO7Om
         aSyQoQ3ceQZ3WllJiaNMviA+4M9+9qKCyOBaYt4Cjj7gageVXP8YXCdVCdJMN4zuZQeA
         noBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=h/Xb/SjYamgmuc9/HYs1Qw6eqp+XJYnyCWos19UVYB0=;
        b=SSI3aFeuQ/0sOyJpJEYybMKY/NP3WPr1yw2gOiQkPritF+A9zUsQHSjp9Z4o9sNcKG
         ieKeLDvvcUKTumMbq7fIXtMMnbYesMVz9eepHJ4egXGK7Qx9bik108Q4hCTJ89DiU2fe
         26nXH+2Xu4K0m+Nyh8F+HFZVTUn6KkJnyrvLk12GHpOwBHMAGHLScY1HF9km3q37m6rr
         96Ch+I1m9Z51/0/SkW/Azj8yyuW1wHoIXTfcmUIYlmQhmJFtI+wsvqq9Srck7RZL7dWH
         v5M732zjOwbBRPy2JtkRV8gvHCpPosijPMQGNIn/xwU2FidLN4TOjvedh6mBB3w9DXu/
         AA4A==
X-Gm-Message-State: ACrzQf3zBLdUGDJLVej31+eQw8iSk5kSf3FZ5LB8LmXghyl2AUgULZ7C
        vGijUNwZCNQ2O2ty5r8YnyylEw==
X-Google-Smtp-Source: AMsMyM7c6Wq7dVJsckwWzncTWMzNjEu0CySl4tV3+56YB6m8BHU0872QtvxHLaR6m4wcFLgtBiNLDw==
X-Received: by 2002:a9d:2dc2:0:b0:637:3176:cf00 with SMTP id g60-20020a9d2dc2000000b006373176cf00mr7100352otb.296.1663565966538;
        Sun, 18 Sep 2022 22:39:26 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id c10-20020a4ab18a000000b00432ac97ad09sm11976660ooo.26.2022.09.18.22.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 22:39:26 -0700 (PDT)
Message-ID: <3b0dbd06-da56-53f7-9918-91cc602f105f@kali.org>
Date:   Mon, 19 Sep 2022 00:39:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 1/7] arm64: qcom: dts: c630: correct firmware paths
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220915152630.133528-1-dmitry.baryshkov@linaro.org>
 <20220915152630.133528-2-dmitry.baryshkov@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220915152630.133528-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On 9/15/22 10:26 AM, Dmitry Baryshkov wrote:
> Correct firmware paths for the Lenovo Yoga C630 to include the SoC name.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index be59a8ba9c1f..35d367bf97a4 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -94,7 +94,7 @@ backlight: backlight {
>   };
>   
>   &adsp_pas {
> -	firmware-name = "qcom/LENOVO/81JL/qcadsp850.mbn";
> +	firmware-name = "qcom/sdm850/LENOVO/81JL/qcadsp850.mbn";
>   	status = "okay";
>   };
>   
> @@ -306,7 +306,7 @@ vreg_lvs2a_1p8: lvs2 {
>   };
>   
>   &cdsp_pas {
> -	firmware-name = "qcom/LENOVO/81JL/qccdsp850.mbn";
> +	firmware-name = "qcom/sdm850/LENOVO/81JL/qccdsp850.mbn";
>   	status = "okay";
>   };
>   
> @@ -345,7 +345,7 @@ &gpu {
>   	status = "okay";
>   	zap-shader {
>   		memory-region = <&gpu_mem>;
> -		firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn";
> +		firmware-name = "qcom/sdm850/LENOVO/81JL/qcdxkmsuc850.mbn";
>   	};
>   };
>   
> @@ -475,7 +475,7 @@ &mdss {
>   
>   &mss_pil {
>   	status = "okay";
> -	firmware-name = "qcom/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/LENOVO/81JL/qcdsp2850.mbn";
> +	firmware-name = "qcom/sdm850/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/sdm850/LENOVO/81JL/qcdsp2850.mbn";
>   };
>   
>   &qup_i2c10_default {

Since this firmware comes from the Windows partitions for these 
machines, and I know there are a few installations out in the wild, this 
might break things for others - unlike the Thinkpad X13s which works 
"fine" (the battery won't charge if the adsp firmware isn't in place), 
iirc, the c630 doesn't boot properly without it?

That said, I've moved the firmware to the location above manually, and 
it does work so

Tested-by: Steev Klimaszewski <steev@kali.org>


