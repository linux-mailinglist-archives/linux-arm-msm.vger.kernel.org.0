Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1412C7676
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:55:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgK1WzA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 17:55:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgK1Wy7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 17:54:59 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56836C0613D1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 14:54:19 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id q13so12092298lfr.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 14:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QVjB0GYpsZykXJNuNG+vc3BKHm9myKIUXqbv+Ho4VBg=;
        b=Pm4Yx3zVPzVqqkOwrEuSQrZUeexmzBGZJJNjrerONys/QQpCrXh4kw2jh1mFcAg+Qh
         fC1q9yqbQ2og2ZsIQfctmdElSsQQdiS+phMTBoDIN4cUxZJVcnXsa8IBlEN6EzIzZWj3
         CxpK1YwrHdQJBOUWIMGotS4hIKKfXPsUuGJA75wtSoc9adIng/ACXpF9o6cnU+mW2xuf
         Q4QRzBn4WZtG+Nh+TuOIj9zTptDOqCLzLCr8OJqzFsbcKAdMeU8tVuiLdkbNi6nL8MTJ
         q+QtH3MtSTQXFcartXiBevNf29c/IyP1pBaEYc4NDZfKpibo66W7YUpj1FGaeS0K7RT7
         N6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QVjB0GYpsZykXJNuNG+vc3BKHm9myKIUXqbv+Ho4VBg=;
        b=tdLJzzBRUnzT6nNHENux2x+LSu8O1EKaLe9jmypPo7KpCJqGFFNxGHJU0nHMOLIjlR
         2Zl7iICJHFkRJo00jOKudk/xthSgAVxUpqYmuDDMBrW+Gcyp+zHFADV/kdc63wqdEJfb
         FAkPUKeKXLveB2MPWS6CD2k8+YX6ce3nfvzC4/0dqd1kTwldYoQq1LJx3j5QwSaPBiXT
         iVkMX4tBZka3gI/UvVSiZ1zRQMqnCTgbe4+3B/WAA5ep7siG3XS7VzbA7tfFmOsYFYDq
         wpcEvzBazvUneYrNYh4E4KukNl1Kqwdx68stiR4IScE5cZawU9DofxHkzY3zzHLHOSKh
         9dLA==
X-Gm-Message-State: AOAM530FcUJ2Nqx1QgsdZTBTDnQ2dCxwKmMUgmPi7FemOFXaO/Iqin9B
        YFXeiqP3O9DPTx88GbkZ31jkGg==
X-Google-Smtp-Source: ABdhPJzhcKwAzLqOw5WqyHHZNqWzTqpijls8JFJOS+lLOKEEhDS1upbtLNhVp6TEYGO4IqNlDY85cA==
X-Received: by 2002:a19:ac9:: with SMTP id 192mr5855671lfk.342.1606604057874;
        Sat, 28 Nov 2020 14:54:17 -0800 (PST)
Received: from [192.168.0.150] ([188.162.65.76])
        by smtp.gmail.com with ESMTPSA id j23sm1213823lfh.88.2020.11.28.14.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2020 14:54:17 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: qcom: qrb5165-rb5: Add support for MCP2518FD
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201127173044.55144-1-manivannan.sadhasivam@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <50c384f5-5557-d0e3-5ab0-31ad7d14632d@linaro.org>
Date:   Sun, 29 Nov 2020 01:54:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201127173044.55144-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/11/2020 20:30, Manivannan Sadhasivam wrote:
> Add support for onboard MCP2518FD SPI CAN transceiver attached to SPI0
> of RB5.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index d9f52703ba2a..ce22d4fa383e 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -25,6 +25,13 @@ chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
>   
> +	/* Fixed crystal oscillator dedicated to MCP2518FD */
> +	clk40M: can_clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <40000000>;
> +	};
> +
>   	dc12v: dc12v-regulator {
>   		compatible = "regulator-fixed";
>   		regulator-name = "DC12V";
> @@ -493,6 +500,16 @@ &sdhc_2 {
>   /* CAN */
>   &spi0 {
>   	status = "okay";
> +
> +	can@0 {
> +		compatible = "microchip,mcp2518fd";
> +		reg = <0>;
> +		clocks = <&clk40M>;
> +		interrupts-extended = <&tlmm 15 IRQ_TYPE_LEVEL_LOW>;
> +		spi-max-frequency = <10000000>;
> +		vdd-supply = <&vdc_5v>;
> +		xceiver-supply = <&vdc_5v>;
> +	};
>   };
>   
>   &tlmm {
> 


-- 
With best wishes
Dmitry
