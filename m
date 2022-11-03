Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 186F7618B4A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 23:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbiKCWUx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 18:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbiKCWUt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 18:20:49 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7E7220DB
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 15:20:42 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id hh9so2116494qtb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 15:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLQxMqZeSjx3t7d42CWl5RcAbFY//1FJaI4cAmerqIM=;
        b=Y5gxiSNoc0mcvBtK7drkUAI9qNJu8OFLvo7mVi2WzZfGnfvhED0EqpqNAOcccvCY1m
         JENlL6Q3HqYbgyk4QmHDfzGe1jeXmBQ23NWZBxWgyxNVZxfGbyR2dNMybBBaviwKo6lP
         VGl/CaMn6HlzQNvKUJciwHthNg0V/f3bUhy6OrkZxNQn5o6pu1uDBpxH6jyXKr1AKgVa
         oEHqALA+YY5NcJBSFSpTKWjYLAskJOSP2WXL7JYBlDXGWqb2yfL6AtgylOSVmJjFHeU/
         MtKaGx2C2VMEkytnLPuXLZFsnGN1wzOonBU+n0/NEhW4QarjWnF6MQXNdf5OeJpnH97B
         0Bwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jLQxMqZeSjx3t7d42CWl5RcAbFY//1FJaI4cAmerqIM=;
        b=338idIzsYhC8qqq4bxIDf5jQwZXY8EY352NFfeDGGHBB2LmjTOcbwcD234aDAOjfwH
         6Tgq9cTMLWe4vJTnQGbItkfzGkYjg96flzGK0zhIr3o+w/t7zMof1REMKKof/iT9ZGIV
         b/+5ReGLcavumO0OFxnxyNYrSk26ErgwTMpGUgnlt8KaRiUcVrpH0U0L2obd4N/5mq0I
         5hcSh/Z4M1uKHz/SbioNJd+7lNVzENAiq+0GJuHQgTOVEGnXY6HVyFq2HwLmNbffEVRc
         XAJeOnu+qxNLHVovVTW0sxtrnDaG4vhcvDS5XVSw5iPbRCC5zVElKF9c3LqYrQSDvzj+
         WNEQ==
X-Gm-Message-State: ACrzQf0mVLMuRX1y8GBhMgb6UrAsSGTc23kwAFY/HX0ieGDXg6quUd6p
        2jwm4gWjSoU5b+XKnwdQrAzxhDwKaZcrTw==
X-Google-Smtp-Source: AMsMyM4kjXr8XPqH1mcvbytz7yHrxD33ODexAHSYNycgk1HoKAatWrQRdoUJ8cJnr+OczKAfBF3Bsg==
X-Received: by 2002:a05:622a:1d0:b0:39c:fc19:b580 with SMTP id t16-20020a05622a01d000b0039cfc19b580mr27435489qtw.238.1667514041955;
        Thu, 03 Nov 2022 15:20:41 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id p20-20020a05620a15f400b006b953a7929csm1529020qkm.73.2022.11.03.15.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 15:20:41 -0700 (PDT)
Message-ID: <780253cd-960f-ee29-247f-22b9c899c035@linaro.org>
Date:   Thu, 3 Nov 2022 18:20:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: msm8916-alcatel-idol347: add
 GPIO torch LED
Content-Language: en-US
To:     Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221029145557.106920-1-vincent.knecht@mailoo.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221029145557.106920-1-vincent.knecht@mailoo.org>
Content-Type: text/plain; charset=UTF-8
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

On 29/10/2022 10:55, Vincent Knecht wrote:
> Add support for torch LED on GPIO 32.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>  .../boot/dts/qcom/msm8916-alcatel-idol347.dts | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> index 3dc9619fde6e..3a0a593899ae 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> @@ -5,6 +5,7 @@
>  #include "msm8916-pm8916.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  
>  / {
>  	model = "Alcatel OneTouch Idol 3 (4.7)";
> @@ -34,6 +35,19 @@ button-volume-up {
>  		};
>  	};
>  
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_leds_default>;
> +
> +		led-0 {
> +			gpios = <&msmgpio 32 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "torch";
> +			function = LED_FUNCTION_TORCH;
> +		};
> +	};
> +
>  	usb_id: usb-id {
>  		compatible = "linux,extcon-usb-gpio";
>  		id-gpio = <&msmgpio 69 GPIO_ACTIVE_HIGH>;
> @@ -276,6 +290,14 @@ gpio_keys_default: gpio-keys-default {
>  		bias-pull-up;
>  	};
>  
> +	gpio_leds_default: gpio-leds-default {

Node name: gpio-leds-default-state

Best regards,
Krzysztof

