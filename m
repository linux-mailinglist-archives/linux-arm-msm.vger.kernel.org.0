Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99DFA74ED30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 13:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjGKLtO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 07:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbjGKLtN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 07:49:13 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF3BE5C
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 04:49:12 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b6ff1ada5dso88801981fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 04:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689076150; x=1691668150;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=syIX5f3BVplskvsPj2jqIH8Yzy7BC8OkHkFGG82RJ/w=;
        b=koGH/spMREVvPSOADIGliABI0/jUQmqUi2xVTQaOZHmwCn8DcsEmNa6zK3YAV1Sx5o
         ccjW1egfchB3GbYkCuEfiowAaHvqAD6jNeMornYuh6r+HfUMUuT0MsvkbdzEQCTATupi
         +vixRXoDNV2h7cnFvTzMe7nHWxAdpH78HG3flVMpueVFh4Bln5gkFK7XNrUwQ0qporeu
         BuZ7NDV3PQLfLP5ABgs9Ul9+KoO6WDBONCPkfET6g67oPZS/K4QhRsudmWAIenV0rssc
         n/nQKSgZIwh1Yfe/t55+EFSkqbHQgcIBnMRoAz6+xw6PNNgwRv6yeXfPlUxyd3Ibnus1
         N0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689076150; x=1691668150;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=syIX5f3BVplskvsPj2jqIH8Yzy7BC8OkHkFGG82RJ/w=;
        b=AKyGXzyIaYT4PvkymLUozBvTFFV9qdEiTIw/Jk0Q9iWu2zwwwhT1hRWwzPP0aKl5+3
         s7ZLe50xN32bZSBDCPOO3lDT7KeS+Lc1jWTfu09IiJhmrzwpWSZWxwBHrAt/rWKPu73a
         J3by0zPCpWKfCtovtTMnDr8rNUo2CeP+RBG19o5De+si/4HuJrxm0fpdPftgi5ZvxV+v
         ayJsNiuGfz3LIQZ4PyU7MGyNHswGlQK7twEITcIYpWo7Y5bGFSFotJ9H+kh2Ry+aK7VT
         MpeAgZItB159qKUEun5z5nEyWsqyWaAAcSmkbaWPxVfzrzAQ/+ukGafPq6n2DAlfrFe2
         NR9w==
X-Gm-Message-State: ABy/qLZeu7E+ED/2pJmR7hjCAIshcc38LUuXv06rj/sV1YvtMQycLcmI
        lKp/dCpfDwXyf4H3yzyMY1UZ/w==
X-Google-Smtp-Source: APBJJlGrZarNyQ0bfbOBxKSRI1o5UGsXz+/5i/jS3Wsvlq23VlMMaZsOEkXx7H0ZYJWGj9E9P0Mrlg==
X-Received: by 2002:a2e:9e58:0:b0:2b6:e12f:267 with SMTP id g24-20020a2e9e58000000b002b6e12f0267mr3092406ljk.5.1689076150497;
        Tue, 11 Jul 2023 04:49:10 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id j9-20020a2e8249000000b002b69f44646bsm425540ljh.17.2023.07.11.04.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 04:49:10 -0700 (PDT)
Message-ID: <fd262c97-29fe-ecd3-52d4-9fcf1d9b63f2@linaro.org>
Date:   Tue, 11 Jul 2023 13:49:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8250-sony-xperia: correct GPIO keys
 wakeup again
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230711063011.16222-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230711063011.16222-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11.07.2023 08:30, Krzysztof Kozlowski wrote:
> gpio-keys,wakeup is a deprecated property:
> 
>   m8250-sony-xperia-edo-pdx206.dtb: gpio-keys: key-camera-focus: Unevaluated properties are not allowed ('gpio-key,wakeup' was unexpected)
> 
> Fixes: a422c6a91a66 ("arm64: dts: qcom: sm8250-edo: Rectify gpio-keys")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> It's a damn Groundhog day. I already fixed all the occurences in
> 77a7e3942871 ("arm64: dts: qcom: sm8250-sony-xperia: correct GPIO keys
> wakeup")!
> ---
Sorry.. this was an old lingering patch that I failed to retest.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> index cd27794739a5..ecdc20bc10f5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> @@ -60,7 +60,7 @@ key-camera-focus {
>  			gpios = <&pm8150b_gpios 2 GPIO_ACTIVE_LOW>;
>  			debounce-interval = <15>;
>  			linux,can-disable;
> -			gpio-key,wakeup;
> +			wakeup-source;
>  		};
>  
>  		key-camera-snapshot {
> @@ -69,7 +69,7 @@ key-camera-snapshot {
>  			gpios = <&pm8150b_gpios 1 GPIO_ACTIVE_LOW>;
>  			debounce-interval = <15>;
>  			linux,can-disable;
> -			gpio-key,wakeup;
> +			wakeup-source;
>  		};
>  
>  		key-vol-down {
