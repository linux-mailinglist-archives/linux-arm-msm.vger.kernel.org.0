Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAB46EB903
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Apr 2023 14:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjDVMGH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Apr 2023 08:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjDVMGG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Apr 2023 08:06:06 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 394F21BFF
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Apr 2023 05:06:05 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4edb26f762dso2738361e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Apr 2023 05:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682165163; x=1684757163;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8xysbB7X/7A4n/D8hoYzoSsechy/AMNA5gr6X9cM5A=;
        b=s/2FOzpY8njzNnG01Ka5k8qMmzCnFrvFUqkUlGZyWPq2Orv+7mi7xeieovU8TGK37e
         tEzZi2WbK1/My/xgqtLm5SRFUfo2vSJfnigJIIMmgCwxWuhi/Zla1o9OPHsZkDjbZGwP
         fEQFkfXiiQoeETXGSGEQXoQE30KDtTnQ6yUVcTALy8LFZCSdgLtfhpcOMU6HxM/7y+zG
         aabbxrsHjQocTxDgKRZLIrGCj23kqU7UvcGtjpOMr6dwJy6wPri8M30u5QVgdkVxcSIt
         oJgLZsqBfK/bANJ2SelwPUgeNhx6arq39LuQThqb5DhN7cQ8IMc8362IsRE89sulPQJ/
         /x7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682165163; x=1684757163;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8xysbB7X/7A4n/D8hoYzoSsechy/AMNA5gr6X9cM5A=;
        b=Rc3Y452Cjx5u2jW7jwdsQnCAQ4Ht1rOaRGnhH/5L6G4JLi88UgIHkMFMmQmObfg6df
         VjrbpRsty+of3vnOt2QepGDqhGvuERsCVJ3p991KTZPqr06T/TzgYhjAnsKkSqufNF6W
         6MemyiYN0PLDy/MFO73KWVB5gPgmx0XIEaXTyIWMCTy9NRHMkzTjh9/qajHgwM1j5eXD
         rIGcnCfbbMrwbyTnSSLLH3aEYT7H2JqZcyeSa5GnalgXpu+gN/3q0uayzDnzBn+vffTq
         lumhErdVymFxHqhg+RKtTycpf5GAN5MjvQHbffPKJb4+jywJPB75Gde3z76J6DwZkJUx
         8MVg==
X-Gm-Message-State: AAQBX9eT/xWwR1f5JnggAAY7Ufgl4thlJhsNzAhj7a3NLvCwrFcsR2WL
        SGLZY24OlcQcFpet/VSqkt1QXA==
X-Google-Smtp-Source: AKy350bipweNDmu8aBHDiKdbJuJowLsE0ToVDrHVVUoJphkdNedyPHdcn0hyhQNWsgexdEQuix8voA==
X-Received: by 2002:a2e:b0d3:0:b0:2a7:80f6:e503 with SMTP id g19-20020a2eb0d3000000b002a780f6e503mr1473364ljl.1.1682165163398;
        Sat, 22 Apr 2023 05:06:03 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id y10-20020ac2420a000000b004e811e3554dsm876346lfh.185.2023.04.22.05.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Apr 2023 05:06:02 -0700 (PDT)
Message-ID: <62ae510f-428a-78e5-75db-e32d4039db0f@linaro.org>
Date:   Sat, 22 Apr 2023 14:06:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFT RFC PATCH] arm64: dts: qcom: sdm630-nile: correct duplicated
 reserved memory node
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230419211921.79871-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230419211921.79871-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19.04.2023 23:19, Krzysztof Kozlowski wrote:
> SoC DTSI already comes with 85800000 reserved memory node, so assume the
> author wanted to update its length.  This fixes dtbs W=1 warning:
> 
>   Warning (unique_unit_address_if_enabled): /reserved-memory/qhee-code@85800000: duplicate unit-address (also used in node /reserved-memory/reserved@85800000)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> What was the original code intention?
Hm, perhaps the original introduction had the common definition
wrong.. I see a downstream sdm630.dtsi and sdm660.dtsi having
the qhee_code sized at 0x37...

I'm fine with either resolution, I think..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> index 2ca713a3902a..3033723fc6ff 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> @@ -138,11 +138,6 @@ debug@ffb00000 {
>  			no-map;
>  		};
>  
> -		reserved@85800000 {
> -			reg = <0x00 0x85800000 0x00 0x3700000>;
> -			no-map;
> -		};
> -
>  		cont_splash_mem: splash@9d400000 {
>  			reg = <0 0x9d400000 0 (1920 * 1080 * 4)>;
>  			no-map;
> @@ -256,6 +251,10 @@ &pon_resin {
>  	linux,code = <KEY_VOLUMEUP>;
>  };
>  
> +&qhee_code {
> +	reg = <0x00 0x85800000 0x00 0x3700000>;
> +};
> +
>  &qusb2phy0 {
>  	status = "okay";
>  
