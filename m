Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E67DC73FABA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 13:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbjF0LE2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 07:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbjF0LEY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 07:04:24 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C511FFB
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:04:21 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b6adef5c22so9295721fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687863859; x=1690455859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8C0XhmWkn/vY+rpI9BqL4hOnXp6U69Cng47QxDsbgMc=;
        b=YELKQgof2nDdUINt2yp9BMCg6jSKW3ZQNfknmW1cyQXmgKGL9e9q1IXqlhE8Q/L2JN
         wCnTIUpjTRauvAdyKlRe3XJd/dHSh/soHjjXpyQS9438CNFGB1DjOGu5cszeTyvtEBnj
         LfX4JdiZ+BVHk79dU6CN3y6lg+bmwblS9xWrhUxCsinwqBLJaK69wGBC6zKDJskp3xXj
         sSj5JfsCZnwOiSa9t2/Vy4F48PB9+rnFTXJEz+e3sG5YaLjhYf0A469xMnYqEr4Cax1z
         hxfwwmzOC5ChoIFURNALjKxo1gsIA7JXhNdvZo1yIbIVpnCsS8dZdqTAIf1ZyFVAmc8X
         N2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687863859; x=1690455859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8C0XhmWkn/vY+rpI9BqL4hOnXp6U69Cng47QxDsbgMc=;
        b=FT2qb7ZrdlUp4XMaAuKBY9E2OIGGCq7fquvrcSD92XjYUnH+Ru4qH3aO72ajkcXavo
         JuqEos8NTHypzhJl7YdHjaILcownPBTPsg+JeX9jUMOeF1cayfxphJpr1qzS/O9CiwtV
         Uu7S2LnIrlZ4G4o6qQBrcye1/DzlUOIgvwjVigpphwGT/NaDDmevCCfM4GHw59RODzFv
         XCmm7T30ohlXBIkGNCYxq4sswQExeSca0p8GY8zbaC3ExrOlh0NSTrPSizicbYYKaeQY
         G9TD0wX0xjhjaj3EBl4HOpFNg4lBvvIfaXtamCVSQdrpOmSBsxYWCX0u9rzgp79CrR6C
         RJtw==
X-Gm-Message-State: AC+VfDxSLgYPBaFUHtd9F3cmcrIGeSgkVd0B6MdQiheMqfkBUIjGcytg
        ZKxs2xVl5NRSsOt/RW8mRMdOpg==
X-Google-Smtp-Source: ACHHUZ78/GynenxQ7VdzM48CwmE7SGa/UxjdNoO69Q6+j7k+UZmJO/+iCpK1ObaLjnoo7+LD02t30g==
X-Received: by 2002:a19:6409:0:b0:4f8:7781:9875 with SMTP id y9-20020a196409000000b004f877819875mr15506136lfb.60.1687863859726;
        Tue, 27 Jun 2023 04:04:19 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id z8-20020a19f708000000b004f84d7706a7sm1475371lfe.7.2023.06.27.04.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 04:04:19 -0700 (PDT)
Message-ID: <4f451c1c-a167-9aa4-e443-ac9aac34c7f8@linaro.org>
Date:   Tue, 27 Jun 2023 13:04:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 02/15] ARM: dts: qcom: msm8960: introduce label for PMIC
 keypad
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
 <20230627012422.206077-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230627012422.206077-3-dmitry.baryshkov@linaro.org>
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

On 27.06.2023 03:24, Dmitry Baryshkov wrote:
> To simplify MSM8960 CDP board file, add label to PMIC keypad node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 20 +++++++++-----------
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi    |  2 +-
>  2 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
> index 6c1bc3818883..4641b4f2195d 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
> @@ -88,17 +88,15 @@ clk-pins {
>  	};
>  };
>  
> -&pmicintc {
> -	keypad@148 {
> -		linux,keymap = <
> -			MATRIX_KEY(0, 0, KEY_VOLUMEUP)
> -			MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
> -			MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
> -			MATRIX_KEY(0, 3, KEY_CAMERA)
> -			>;
> -		keypad,num-rows = <1>;
> -		keypad,num-columns = <5>;
> -	};
> +&pm8921_keypad {
> +	linux,keymap = <
> +		MATRIX_KEY(0, 0, KEY_VOLUMEUP)
> +		MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
> +		MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
> +		MATRIX_KEY(0, 3, KEY_CAMERA)
> +		>;
> +	keypad,num-rows = <1>;
> +	keypad,num-columns = <5>;
>  };
>  
>  &rpm {
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index fa2013388d99..913bc6afd0a1 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -283,7 +283,7 @@ pwrkey@1c {
>  					pull-up;
>  				};
>  
> -				keypad@148 {
> +				pm8921_keypad: keypad@148 {
>  					compatible = "qcom,pm8921-keypad";
>  					reg = <0x148>;
>  					interrupt-parent = <&pmicintc>;
