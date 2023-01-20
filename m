Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A65F675D38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 19:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjATS6k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 13:58:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjATS6i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 13:58:38 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0513743BC
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 10:58:34 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id vw16so16241567ejc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 10:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBS2NFopPHzfJYrxlHmgujPz1HoeR8ijao605ezME18=;
        b=tEy5zxWMaQki5bCipulkcyrZGhmVLLcl9dq0NUqIqT7PXVAzUHQvLD2PrEtbFAtm5v
         o78K3nm+rG3+WPfayuMIsuI7nmMaZCjJ3RBFx+lcZtQSKYk2zR6586d3zL1pOXgI7RkX
         V8BN+T1Rm0h9T95Om/laAs5XMoWHIx64IvzBBnCF2I+0fpgpZZO+9ZUyNB4dysNX3txC
         YlZFE8jmBhy22lk5du5xp54/1eilTHUFoVYzRptnk3j/7W7AmiGbU++BTMDxEahtI3mr
         eedI318ROB5n/fzQHuG3DSyPz3nZpy2aFzmHZQIUZ5AOkyBVT28Gfasbdmv9+IA5YjNU
         7UpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBS2NFopPHzfJYrxlHmgujPz1HoeR8ijao605ezME18=;
        b=7trh47DF3dixKXj+SiPctSrRmK5nbyAEPhItNHejTphIPeGP9tqNitVFQPGYflhxHr
         AzZzHNsc+QeF5eXaGhKwNdxp52Ocfe91JkrazvCio36yYsVzh2fB1phBQOvAw7aaJ0LF
         20lXmU8BLUFlQ+QwJAMuYsglK1oguXBHF8jt4ee5ZNrslRk0o9df+7c0kWRmdvkjAHgM
         RD+tKynwFwR99xGMqYOCDXlHWmIM10akOzWkQs/wg7Dv6siGAQK7NxRfDeoLXqAmYrVu
         dS/6UIh2VfqS6MjSX6UhBKCvdk7XZX5M3LHp8U7+SwXkfxJlYNyxiQBcwvCriU6scCJn
         w4aw==
X-Gm-Message-State: AFqh2krfK+KDCudPIRAhZRvOYXw0xW0rWIz4C54kws+XMtX4wH/LO+Qu
        iHoPLmduhRCb225BtwDYt2By7cnWOAQ5ipT3
X-Google-Smtp-Source: AMrXdXuyZ0HONVpsPKfKSyqCULU7fXja/Lktvf/niubfVJPS3eXqPcbuMmePQW7ZCblB/WmcojGQrg==
X-Received: by 2002:a17:907:760e:b0:86e:fccc:bc19 with SMTP id jx14-20020a170907760e00b0086efcccbc19mr16440510ejc.43.1674241113525;
        Fri, 20 Jan 2023 10:58:33 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id tk22-20020a170907c29600b00870d3fdceb9sm7462526ejc.89.2023.01.20.10.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 10:58:33 -0800 (PST)
Message-ID: <9821623b-fcca-2a3a-1cd6-9e95c480b1a4@linaro.org>
Date:   Fri, 20 Jan 2023 19:58:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] ARM: dts: qcom: apq8060-dragonboard: align MPP pin node
 names with DT schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230120174036.351937-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230120174036.351937-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.01.2023 18:40, Krzysztof Kozlowski wrote:
> DT schema expects nodes ending with "pins:
> 
>   qcom-apq8060-dragonboard.dtb: mpps@50: cm3605-mpps-state: 'oneOf' conditional failed, one must be fixed:
>     'mpp5' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Warning visible after:
> https://lore.kernel.org/r/20230120165103.1278852-1-robh@kernel.org
> ---
>  arch/arm/boot/dts/qcom-apq8060-dragonboard.dts | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
> index 7a4c59e04af6..8e4b61e4d4b1 100644
> --- a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
> @@ -435,15 +435,13 @@ &pm8058_led133 {
>  
>  &pm8058_mpps {
>  	dragon_cm3605_mpps: cm3605-mpps-state {
> -		mpp5 {
> -			pins = "mpp5";
> -			function = "analog";
> -			input-enable;
> -			bias-high-impedance;
> -			/* Let's use channel 5 */
> -			qcom,amux-route = <PMIC_MPP_AMUX_ROUTE_CH5>;
> -			power-source = <PM8058_GPIO_S3>;
> -		};
> +		pins = "mpp5";
> +		function = "analog";
> +		input-enable;
> +		bias-high-impedance;
> +		/* Let's use channel 5 */
> +		qcom,amux-route = <PMIC_MPP_AMUX_ROUTE_CH5>;
> +		power-source = <PM8058_GPIO_S3>;
>  	};
>  };
>  
