Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0B1D621C72
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 19:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiKHSu1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 13:50:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiKHSuD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 13:50:03 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D516CA03
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 10:49:36 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id a67so23870359edf.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 10:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=901AouGB9Xg2LgWXbPxYdin3rXeDsm5qAW0ykXSOses=;
        b=ehr2ShxEm9RLIvfr3sNgzoAbvo2A51ZnO0kwCV56E6a1JjYKUBFXTq/3PYdg03dlpF
         uf6FOkBuWOT5IjJgUPcz4eV4QqyTWxZoL2HF+ZrFDNuzu77OHWPKp4rf+G6FDgA0vtpb
         lG1MxqlwxnvnOyHc5iF3MMC6XdTD3HFCexEIao53GW/p6OjWaaV0a/mVZX2lpT7GMO8y
         OryiRfch6g0PNhzsFjnqCQ6xg7eaCTBSzMjlAGVn+e5C6UbmMV8yn0NkDEdzJgq69hD/
         EOCZH6G6ERtz5EB1If+Qu7ldWWvSkKCHwHzzZFiaydOHVyaJZ3XoBDl/ygFNoxaBISFH
         E4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=901AouGB9Xg2LgWXbPxYdin3rXeDsm5qAW0ykXSOses=;
        b=0/N/ygAeACOAyhu6C7BtRQ4NP2xoxub4wQrnt2uFIPpGoQ+HiGi9bqJUE9z2dJf7U4
         niZdLQ1iXdXFYu2f/T6d/tbcJUDBJub3aQAPrsa4KlYxqrRr9k1Q2ySda25qI12eEFS8
         MM6GfjP0UKrLEg55B84J9vCKE1GIl5GfQMITop1KYkvDgT4YbUkdYqB5dfT/KNVr+MEK
         SNKWwb/e6Tcz6da/H+LK/VKn9NGsBLtk4eZeMLyGJbwBetbYzCgTdFzVCdPtQTRp4SmW
         qOtZBBkJkTxOvJ9wgEcua0pmZSaHP/Cw5JwW2PaRlGhekExvmY/tc2QXzDejStj2ljir
         fEXw==
X-Gm-Message-State: ACrzQf1A3G3lc3c2nWzjcIQGAR9RUdYMSYlu21sumMQ/5aWoa4gTNw4p
        1GWzeafR1sUwFd6HbDoPGDPL0g==
X-Google-Smtp-Source: AMsMyM7bPFokM1yFe/uSfDmKd/Qw9LPK6GyYQwK49gEHNuAYyDK/gImACuLE+LaCJDcZi+yrJQZlBQ==
X-Received: by 2002:a05:6402:3896:b0:45c:93c3:3569 with SMTP id fd22-20020a056402389600b0045c93c33569mr26507912edb.37.1667933374572;
        Tue, 08 Nov 2022 10:49:34 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id kz5-20020a17090777c500b0077b523d309asm4930540ejc.185.2022.11.08.10.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 10:49:34 -0800 (PST)
Message-ID: <e858e76a-17d6-9f11-e0f1-90cd3c888689@linaro.org>
Date:   Tue, 8 Nov 2022 19:49:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 3/3] ARM: dts: qcom-msm8960-cdp: align TLMM pin
 configuration with DT schema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221108184529.26857-1-krzysztof.kozlowski@linaro.org>
 <20221108184529.26857-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221108184529.26857-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/11/2022 19:45, Krzysztof Kozlowski wrote:
> DT schema expects TLMM pin configuration nodes to be named with
> '-state' suffix and their optional children with '-pins' suffix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   arch/arm/boot/dts/qcom-msm8960-cdp.dts | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
> index 3a484ac53917..9a3a510f88ca 100644
> --- a/arch/arm/boot/dts/qcom-msm8960-cdp.dts
> +++ b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
> @@ -60,33 +60,32 @@ &gsbi5_serial {
>   };
>   
>   &msmgpio {
> -	spi1_default: spi1_default {
> -		 mux {
> -			pins = "gpio6", "gpio7", "gpio9";
> -			function = "gsbi1";
> -		 };
> -
> -		 mosi {
> +	spi1_default: spi1-default-state {
> +		 mosi-pins {
>   			pins = "gpio6";
> +			function = "gsbi1";
>   			drive-strength = <12>;
>   			bias-disable;
>   		 };
>   
> -		 miso {
> +		 miso-pins {
>   			pins = "gpio7";
> +			function = "gsbi1";
>   			drive-strength = <12>;
>   			bias-disable;
>   		 };
>   
> -		 cs {
> +		 cs-pins {
>   			pins = "gpio8";
> +			function = "gpio";
>   			drive-strength = <12>;
>   			bias-disable;
>   			output-low;
>   		 };
>   
> -		 clk {
> +		 clk-pins {
>   			pins = "gpio9";
> +			function = "gsbi1";
>   			drive-strength = <12>;
>   			bias-disable;
>   		 };
