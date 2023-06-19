Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF4FD735863
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 15:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjFSNUU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 09:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbjFSNTl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 09:19:41 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FEB0199A
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:19:30 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f64fb05a8aso4532795e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687180769; x=1689772769;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3EoEsb3mvoyCSftvbdahxzk86GqROCo6siVld3co1E=;
        b=U1DxnNYoAKr0rJgugQcsNej3ZE6nTItJkA6NjvID2UOP58Rg+P4jMpl3Lvdx7hDv49
         rc3kCD6os90h+nh6VtQ8x1Y51SWDAt1m+tN1sxMrTG4jYlAH6d6irsbCR03MkTx7NwgX
         rm+c1FYRzsCE929ZG8lgwAigIxSI4v6HJ0Zgh5Hanr9xbO9upJT5njfYv2ev5jN1/IBA
         HZUr/w1sN/y55cKV848Q2v/HxTJI4UjahWWc6+p+CaFHLKX9gWFoTdSosJFedAm/MV2g
         oltS8AtkGaHMffeSkQQfdWo9yvzjQA1GPEF24MhcqUUi2wNLIlS4DviFdqGs2+5KlVlc
         pl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180769; x=1689772769;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/3EoEsb3mvoyCSftvbdahxzk86GqROCo6siVld3co1E=;
        b=cMHRD7/rLeKFeUyN6VhOJGkWeaX/w/Q57rYTJtplOLeqEetKti1XwxZtQyk0GdTHN4
         kE91y8eOS62DqLLMTJfdyS2W7m9zGYy5lB2PADzJXbU7bsAEVkFImSfrZsiw8AKPuYIb
         z9a9htkmtOAEsIlUKdscj3BNB1ROFI0AJDj91smJy/KogDfayiZ68gc0GuQWeFuDAm+v
         GrwHVtNNz0+rvaB1BIXK+dPz9JM1I/U4ix2Kr1WulGHeh0MxkQYSn6PnlBq2+Zv0pr8L
         B2rUV2cOQ6vvlw4eQhO4CHZ15iuG3MjItOcHBRUqGIF+lGUboK/7lkEo0t8Y7iR3ue4c
         Klyg==
X-Gm-Message-State: AC+VfDwKpHTzX5E6q4hP3ygzyTP9nLSS5pVdbURAhs6uTF/b7KvBXAw7
        nUD79LjFRI/qr33YZyxpC1UbNg==
X-Google-Smtp-Source: ACHHUZ4OBEsa46tcbLLe6tvJJtPTUV1UjT1DnpkBilLRKknGD6H5TG7pYJvyiBmDoEambOk1nqHFYQ==
X-Received: by 2002:ac2:5b4b:0:b0:4f6:1c08:e9ba with SMTP id i11-20020ac25b4b000000b004f61c08e9bamr5675143lfp.65.1687180768665;
        Mon, 19 Jun 2023 06:19:28 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id r15-20020a056512102f00b004f872c8513asm333256lfr.261.2023.06.19.06.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 06:19:28 -0700 (PDT)
Message-ID: <673d5a18-725a-66c2-8576-d84d55defb52@linaro.org>
Date:   Mon, 19 Jun 2023 15:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8350-hdk: add uSD card
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230616190222.2251186-1-krzysztof.kozlowski@linaro.org>
 <20230616190222.2251186-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230616190222.2251186-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16.06.2023 21:02, Krzysztof Kozlowski wrote:
> Add uSD card to HDK8350.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index de67438b3a97..997f892a0f3a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -475,6 +475,18 @@ &qupv3_id_2 {
>  	status = "okay";
>  };
>  
> +&sdhc_2 {
> +	cd-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
> +	pinctrl-1 = <&sdc2_sleep_state &sdc2_card_det_n>;
> +	vmmc-supply = <&vreg_l9c_2p96>;
> +	vqmmc-supply = <&vreg_l6c_1p8>;
> +	no-sdio;
> +	no-mmc;
> +	status = "okay";
> +};
> +
>  &slpi {
>  	status = "okay";
>  	firmware-name = "qcom/sm8350/slpi.mbn";
> @@ -733,6 +745,13 @@ wake-pins {
>  			bias-pull-up;
>  		};
>  	};
> +
> +	sdc2_card_det_n: sd-card-det-n-state {
> +		pins = "gpio92";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
>  };
>  
>  &uart2 {
