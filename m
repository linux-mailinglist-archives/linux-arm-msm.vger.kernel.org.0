Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 643DD2C8941
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 17:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgK3QUC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 11:20:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728078AbgK3QUC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 11:20:02 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38866C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:19:16 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id h39so11801928otb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NAXqn3wiWOLDdiiwYM2Bc0lRxae5wIfPccf3YRKoOzc=;
        b=FgOT31HYKzEOBcnM05EtBOT85TO+Qlmpm7XpzP6CdVDDoLKjT1Z1t96cdVZhTdKzOq
         ev8JsUZUWpCj8FoDEldbcp/M+batYXAJ53A6WzUza6DQWSJRqwGaOHAyVrjKmdJyKnXg
         1YQHZ5YWInShdj13oCywsz+DfXuqv7rqVHdUlJ8+YIRM77zrJKBmk7NgglP7RTWpz4ys
         FL2kSigGxu8hqYXtn/9oAtVXDjygSYjZgQxcPPExlORZOU9ofh1RlYjeziWB2MLxCf3i
         hTb63HhGKC58xgtPb28wvoV7qcdkICgNHK0Mlmpm/rdKxO/kML75Kd/8w+6Fkc9S9pCB
         vYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NAXqn3wiWOLDdiiwYM2Bc0lRxae5wIfPccf3YRKoOzc=;
        b=ASL07g0SXhhOZ1cksENP1xrcy4/94+tylzQydzNcD52gPNiTIg6vNPmTYCom7uLZB6
         45b7Fnm2RjucOLV89OlIuD8ocYkCtOxctSvhwnSOCu7I/NuNcc1vMSo7gJhoODMsNdk+
         rZ9qceA8MHpmq0iZCUP8ga/29S6i3mmT7bTIPKYq2kql+Ll1oLtQAFcuYWAt8slPsPL7
         fn82FTxqe4n2Fs/wo1gt9E1HIa8kp2ADjJ9alfC9AxJlpETK9AxqcmhWoQkO/Kzp03yD
         lvy/VYGIfVVnytLxv5SCzcVlwErNWjnIWb/8j0/A4RKJ8giRrpCOmzCjEpO9RSdjd1Bs
         JWCA==
X-Gm-Message-State: AOAM533/FZtnGSFCubEXzFQm+a5NUpeWG2FGaWr4CT5652VOLq7llM7t
        DpYDWt3fiTs11NSuOW1VWfbG8A==
X-Google-Smtp-Source: ABdhPJxFqwllOtXl2uPWh132MCqhGj/glevm+Aci0s6Gt86894+q5smdWJqpMV5zlfyMhQP39pvMvw==
X-Received: by 2002:a05:6830:104f:: with SMTP id b15mr17136663otp.20.1606753154183;
        Mon, 30 Nov 2020 08:19:14 -0800 (PST)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id o6sm9952595oon.7.2020.11.30.08.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 08:19:13 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: qcom: c630: Expose LID events
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201125060838.165576-1-bjorn.andersson@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <1d525088-7527-38ac-9397-7711414fd4ad@kali.org>
Date:   Mon, 30 Nov 2020 10:19:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201125060838.165576-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/25/20 12:08 AM, Bjorn Andersson wrote:
> The LID state can be read from GPIO 124 and the "tablet mode" from GPIO
> 95, expose these to the system using gpio-keys and mark the falling edge
> of the LID state as a wakeup-source - to wake the system from suspend.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index bb314973eb0c..f956dbf664c1 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -8,6 +8,8 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/sound/qcom,q6asm.h>
> @@ -21,6 +23,27 @@ / {
>  	aliases {
>  		hsuart0 = &uart6;
>  	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lid_pin_active>, <&mode_pin_active>;
> +
> +		lid {
> +			gpios = <&tlmm 124 GPIO_ACTIVE_HIGH>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			wakeup-source;
> +			wakeup-event-action = <EV_ACT_DEASSERTED>;
> +		};
> +
> +		mode {
> +			gpios = <&tlmm 95 GPIO_ACTIVE_HIGH>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_TABLET_MODE>;
> +		};
> +	};
>  };
>  
>  &adsp_pas {
> @@ -466,6 +489,22 @@ wcd_intr_default: wcd_intr_default {
>  		bias-pull-down;
>  		drive-strength = <2>;
>  	};
> +
> +	lid_pin_active: lid-pin {
> +		pins = "gpio124";
> +		function = "gpio";
> +
> +		input-enable;
> +		bias-disable;
> +	};
> +
> +	mode_pin_active: mode-pin {
> +		pins = "gpio95";
> +		function = "gpio";
> +
> +		input-enable;
> +		bias-disable;
> +	};
>  };
>  
>  &uart6 {


Tested-by: Steev Klimaszewski <steev@kali.org>


