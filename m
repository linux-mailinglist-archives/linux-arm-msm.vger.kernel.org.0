Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBD5066ADA6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jan 2023 21:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjANUcU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Jan 2023 15:32:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjANUcU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Jan 2023 15:32:20 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96946BB94
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jan 2023 12:32:16 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id f34so37664397lfv.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jan 2023 12:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LV/yNASUEDRBi4ChqyAmhzI/kwdvwtVS9bXaUOhN9u4=;
        b=K/Cm1iNtGGTY78xkvL721WYmTly8kYk32hS5vtp3q2/NVg6ZSamdfCAvNURGhUe76w
         S63Vl+Wp+rGryrU5a8oyxRHK3CtHiTfHX4GoCfGGPOskS5A22vgcSGbiCTpWUAAD1kiP
         +wMAANcv6nHQuq+MFcUH+PdxQK0nZTSmzGUxshNk84Z4mo2vOgSNPr1QtwjcLyEfs94t
         j1hncU9v0vd8u8Bm71vdTfPbIxfVAvB0YMFI9I5dYaAtco4redgbO9Mb4em/kj4bC1qw
         ZM1ljKIGGVk2FiSmfoCcgxw4f/vUFjqoc2gLJcpgu6TK8yRmZfVkDWbU3bHvUD05Yb8i
         kXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LV/yNASUEDRBi4ChqyAmhzI/kwdvwtVS9bXaUOhN9u4=;
        b=RmTsD3vaj0D6b1qoq+J5yHcydzoSGqetXcVP88xu98wMP1danUebeY5dBkOkNiay24
         qkACYfvKR1CYztbaXK/2hvZS0Vb5nb79WW4u9SRNVwN1+7m94aw59Ot8zwts++/8g+E4
         r+oT8ClKeco6qFvzz8+M4YKwhHsLjrmhbhcxuxBUoOsZZhrypq17pqSl2XNcL22lp/fn
         jVJcmAw3pNLIHaG+Rz9iF95VA+55dgqxi+Iy6LGNPpeQ5I+/GyCXzEC1MDlSsweQF3Qv
         2X/8m3Ag4NCsZnky83roi26zFAaY5PFbkp5O5AEvJGJTrK7VRXovJ8IcVXLw8XAOMYlg
         GI9w==
X-Gm-Message-State: AFqh2ko8c8vpYbMHL8v/HbRDw5UjD0CYplWVn5KbfG7Dm7cvzk93Vkd+
        RcWiUGNiZgcdDDiuWIr2B6VaXw==
X-Google-Smtp-Source: AMrXdXvbiyUfdmnYVw0s/siakItL40/c/sdT8Wru7dKmkzuRxe7EXyrgkqZEnq+WC8JKNyWrApCB9A==
X-Received: by 2002:ac2:5230:0:b0:4be:a3c8:dc2 with SMTP id i16-20020ac25230000000b004bea3c80dc2mr21946441lfl.51.1673728334910;
        Sat, 14 Jan 2023 12:32:14 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id m16-20020a2e9350000000b0028b68b3665bsm611476ljh.51.2023.01.14.12.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jan 2023 12:32:14 -0800 (PST)
Message-ID: <c6472217-66b0-c0ad-1e7f-d3fbaaeda173@linaro.org>
Date:   Sat, 14 Jan 2023 21:32:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8250: drop unused clock-frequency
 from rx-macro
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230113162245.117324-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230113162245.117324-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.01.2023 17:22, Krzysztof Kozlowski wrote:
> Neither qcom,sm8250-lpass-rx-macro bindings nor the driver use
> "clock-frequency" property.
> 
>   sm8250-mtp.dtb: rxmacro@3200000: Unevaluated properties are not allowed ('clock-frequency' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index f614992709d2..b22569101314 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2301,7 +2301,6 @@ rxmacro: rxmacro@3200000 {
>  			clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
>  
>  			#clock-cells = <0>;
> -			clock-frequency = <9600000>;
>  			clock-output-names = "mclk";
>  			#sound-dai-cells = <1>;
>  		};
