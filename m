Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96F9665A62D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Dec 2022 20:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbiLaTDc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Dec 2022 14:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbiLaTDb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Dec 2022 14:03:31 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E4E55B7
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 11:03:30 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bq39so28433517lfb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 11:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bXRZijDcjoH+uldBX7sS2vNjmgesa7nEhF2//QogPBI=;
        b=hOOQgNkF/ksiRYF+elJZ5WMJb8Ns3Wq0Wo1IPB93A0JRpBDT1JQQ+Fj7OupjdHFNaZ
         T2WY0kD4rDG0gT9T7eBIHq/rLw6tEoo5GJUJXSLo6YnrgjjMHewMfzMsTPngwoiC3xvI
         2oxlyN8Qd4uO8I1cO/nFHazKmjAZUUuzvb7f/wdJ82Qk2o1xq0dETO+wfryo+xdbU6XG
         ITIdDR9nkh+FT9ZVGv7JEkDd4IsiXR8GtOZYtYjIMFF+yUaFAfBMCLlWICl/yAwoLhxw
         2cbitHgVHEuYZR0Y2OZjOLtZ8lF38e8ZtPYeSuCeglgiMnxtpw9r402ESS7cuifgkpah
         VM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXRZijDcjoH+uldBX7sS2vNjmgesa7nEhF2//QogPBI=;
        b=M9XYbK+yjbv06CBkBpC9scD838XqV/Pt+4Q8cLx1lKKgUClim2xeYAl2SSRxYrLe3f
         xR/WrLXaSKSKk/aVET+tC2Znk6L7dhyySijpt6lsNO7C7qx8/mSrpX7N6/mSV7Gjivvi
         NtUNsRy6XbjBMJZpGWVH5JGEHLJCZrLa3hCKyXaBrcSeXFA8QTmPs7eETa5k9xT6w3TG
         JNbhmpryWkprsV7JosiSxw8jO45PSL9pG44vCUpPfxPIYwQb7Frg0jW+Bz1mPnWGdVxJ
         Q2EvFmoIBfitOED+KARZjNIRFwwWlbowMnnldLjSqIviX+58TTnI3Wa2aqF4fFFCo1/T
         glvg==
X-Gm-Message-State: AFqh2kqO0lBubnDKnXfPkrrlU/a32Ld7Oon9qMJYcTlzNIg5iBuOGx5P
        pmOfdJwqg1UfTV1ljfEAnmLdTw==
X-Google-Smtp-Source: AMrXdXsAskDxbBvi/VCHrnOSdLy2IOUsuGnH+f6JrS7wy8rffyRijpsIWrjsZuKr9qHDSkqCejX8tg==
X-Received: by 2002:a05:6512:3051:b0:4b5:79ca:e62d with SMTP id b17-20020a056512305100b004b579cae62dmr16099806lfb.16.1672513408544;
        Sat, 31 Dec 2022 11:03:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v10-20020ac258ea000000b004b501497b6fsm3929233lfo.148.2022.12.31.11.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Dec 2022 11:03:27 -0800 (PST)
Message-ID: <0ac9d15b-4872-c2c0-da9a-b160c0b44053@linaro.org>
Date:   Sat, 31 Dec 2022 20:03:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/18] arm64: dts: qcom: ipq6018: Pad addresses to 8 hex
 digits
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221231125911.437599-1-konrad.dybcio@linaro.org>
 <20221231125911.437599-2-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231125911.437599-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/12/2022 13:58, Konrad Dybcio wrote:
> Some addresses were 7-hex-digits long, or less. Fix that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 67 ++++++++++++++++++++++-----
>  1 file changed, 55 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 2ceae73a6069..17e15a06254f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -146,7 +146,7 @@ reserved-memory {
>  		ranges;
>  
>  		rpm_msg_ram: memory@60000 {
> -			reg = <0x0 0x60000 0x0 0x6000>;
> +			reg = <0x0 0x00060000 0x0 0x6000>;
>  			no-map;
>  		};
>  
> @@ -181,7 +181,7 @@ soc: soc {
>  
>  		prng: qrng@e1000 {
>  			compatible = "qcom,prng-ee";
> -			reg = <0x0 0xe3000 0x0 0x1000>;
> +			reg = <0x0 0x000e3000 0x0 0x1000>;
>  			clocks = <&gcc GCC_PRNG_AHB_CLK>;
>  			clock-names = "core";
>  		};
> @@ -366,6 +366,49 @@ qpic_nand: nand-controller@79b0000 {
>  			status = "disabled";
>  		};
>  
> +		usb3: usb@8af8800 {
> +			compatible = "qcom,ipq6018-dwc3", "qcom,dwc3";

This hunk seems unrelated.

Best regards,
Krzysztof

