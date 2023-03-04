Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7C46AA99D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 13:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjCDM5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 07:57:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbjCDM5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 07:57:00 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD6B1C33B
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 04:56:58 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id s20so6924507lfb.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 04:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677934617;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ilmTdHidtUxx7fznlKwOL72F3IrCYo0tPai7caU62YA=;
        b=chZwV3gEVk5DTSx3pzkjUmyfoFDmw6RtHWHcLDw2wVBI8VBU6ApjQqnybQ4gQvoBcn
         8fdRFcHQ79gU08prk+tX7rkecHJTLlT5dZJ7rgUGX0aoVUs4XIYU7KHOe2J2+8Cvtems
         gl9JgQY5qFI3C76XNhqgocbgS5S2sQX1Mb3R2V/sk51GC+BHZSfzNol1decPGkzJ7SfG
         pRSVK1L9Fzojj7SJQ/UH8/SbAFIsVSFFWaJoK4sFZZKNo8CKHfOLG6/S6fnDiMI22q5o
         klpOLDXoHZ/TaLnIsDm5tAfywFTWe44K9RsLI1/QU5kINRemyYV2c1kl2CoyJhju4X4A
         Em5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677934617;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ilmTdHidtUxx7fznlKwOL72F3IrCYo0tPai7caU62YA=;
        b=x8xO/4fjUp4K/7JQTNbeyxaw5fPXDOLdMNqyjYtiCK00CtUUEoW6KzroMq2mQNA5xE
         kHzQy1OOqVlRoD/hZdy7FRK2gWMP+mz9l/Z+QGmOXiDurS3Xl+wMmJtb4xsE82INn0ys
         6rfZzyfyoyliGxu2IsDM3200x6w6F3+1vLhto4ROoQ4bmhLe2/Pj9+yIcj0K3lu4e6AF
         CTOMS0CCLnL2C8yW0CydL+CdG9SByryRP9d602SUqYbh72+K2Eu63tBsdWpKRU7Eoyae
         KdO/CLBoI85vg3aDo2Sa+ls2EbBr8T31uScwjUSa3gxhT2BDlwVwOD02z+2TkAQSxf+z
         z9oA==
X-Gm-Message-State: AO0yUKXkMFIKeesFXAqp2PtEg83XfZ79466AuDQ2mebBFvmClrs1JYLu
        gTccayIFiqVdz0sQdVnNzPhB+Q==
X-Google-Smtp-Source: AK7set/UpITZa9Wk9j86ulOrCcxuND+ZgLmY7X4dPXQjQICH1Rcgk8xVIUcTsoXLeoQaMD5FAcVrbg==
X-Received: by 2002:ac2:522e:0:b0:4db:56e:427c with SMTP id i14-20020ac2522e000000b004db056e427cmr1249874lfl.56.1677934617157;
        Sat, 04 Mar 2023 04:56:57 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id f25-20020ac25339000000b004b567e1f8e5sm815969lfh.125.2023.03.04.04.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 04:56:56 -0800 (PST)
Message-ID: <43db5593-354b-4332-e0dc-74b849eb0834@linaro.org>
Date:   Sat, 4 Mar 2023 13:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/8] arm64: dts: qcom: msm8998-fxtec: correct GPIO keys
 wakeup
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230304123358.34274-1-krzysztof.kozlowski@linaro.org>
 <20230304123358.34274-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230304123358.34274-2-krzysztof.kozlowski@linaro.org>
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



On 4.03.2023 13:33, Krzysztof Kozlowski wrote:
> gpio-keys,wakeup is a deprecated property:
> 
>   msm8998-fxtec-pro1.dtb: gpio-hall-sensors: event-hall-sensor1: Unevaluated properties are not allowed ('gpio-key,wakeup' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
> index 5aad9f05780a..8b71b1f8f300 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
> @@ -44,7 +44,7 @@ event-hall-sensor1 {
>  			label = "Keyboard Hall Sensor";
>  			gpios = <&tlmm 124 GPIO_ACTIVE_HIGH>;
>  			debounce-interval = <15>;
> -			gpio-key,wakeup;
> +			wakeup-source;
>  			linux,input-type = <EV_SW>;
>  			linux,code = <SW_KEYPAD_SLIDE>;
>  		};
> @@ -116,7 +116,7 @@ button-vol-up {
>  			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
>  			linux,input-type = <EV_KEY>;
>  			linux,code = <KEY_VOLUMEUP>;
> -			gpio-key,wakeup;
> +			wakeup-source;
>  			debounce-interval = <15>;
>  		};
>  
