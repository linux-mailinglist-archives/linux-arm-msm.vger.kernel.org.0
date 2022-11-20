Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10DCB631376
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Nov 2022 11:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbiKTKvF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Nov 2022 05:51:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbiKTKvE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Nov 2022 05:51:04 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C428B866
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Nov 2022 02:51:03 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id d3so11728071ljl.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Nov 2022 02:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MD/aDEMiTsY3yltE9lY/nF7UISvnsQa9yhMUv8ugeGo=;
        b=aPviQmrOAW3eIY8m7OB92kUFi22k3BdcvMicsL9ZMqPs+nWdu0V3U2ZRnOkVh5PT6m
         W/Z6pVeOQPA6t1floLF+z7X3K8I2QQW80CEsOWf3GYfrDyUh7hSiOGtGpu8TEAymfHRZ
         LKDljkvElo62d2NGGx2u/rrOVCV2+uaycjDn8PLxa2o+R4NUMU8jNRn0yw4Br4K4MC8S
         p4c4U3eFwXpFMHYBbbtwoQ8mvJL9CrDRFE9jNNL7Teb24cJHuwU1BfmM/lwlz2hqoDTX
         OujMFKETAFLZQXlP/L60ACV9zHRiaToVqwnQqu+9aZN0IaUyOoWRgRlVEVFMAJPTkkwS
         hZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MD/aDEMiTsY3yltE9lY/nF7UISvnsQa9yhMUv8ugeGo=;
        b=mZ8PLXMfjcZtgupLVN4yvGWzmQHzFb/+lBWc4KmU77x/IhRJChXaNy7NtbpbK5iSiY
         n0y9CrlK8FJKhhil6poy0coTxTEdd4OMaFHUKfKUROJ7RdEW8qaCvAD3KhSEs8b9sR0C
         MU47szD6ugnJETpviTmIY+qLFC0+uLHSenmz0DPhcJpyL7PKWGmUv5eBfWnPNt8ITKgm
         r28pBpIZnXufohYopwJiWCVPotLpBKrmQ2EiFHRbO+TdFQNGb97e2d/FFkg8+oPdhzhM
         0PxyFw7Jr1EyLWFzCh0qWlVCrcmQWnWt6itqqcL767fhF6q2kbqf5ea/zsW4oMIY+05p
         PUlQ==
X-Gm-Message-State: ANoB5pkBc74ARUCd0vyevVpfMldY/UVoM4fWpreMRIqhvuI9buBNMfW7
        CAF5S1ZuJamKrAvxNC3c7yQb4A==
X-Google-Smtp-Source: AA0mqf4S0gZL/5jiqZOE1CraCz/s3w5qTX4gS0hM54SY+oE7urs7KfvUlrBWUVS0Ry0vVjoz//gITg==
X-Received: by 2002:a05:651c:1079:b0:277:3592:c2c0 with SMTP id y25-20020a05651c107900b002773592c2c0mr4779585ljm.81.1668941461690;
        Sun, 20 Nov 2022 02:51:01 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m14-20020a056512358e00b004b01305732bsm1493997lfr.216.2022.11.20.02.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 02:51:01 -0800 (PST)
Message-ID: <7f7a2966-62d1-c1e9-63c9-201881c9a3a6@linaro.org>
Date:   Sun, 20 Nov 2022 11:51:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: msm8916-acer-a1-724: Add initial
 device tree
Content-Language: en-US
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20221119204209.94125-1-linmengbo0689@protonmail.com>
 <20221119204414.94287-1-linmengbo0689@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221119204414.94287-1-linmengbo0689@protonmail.com>
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

On 19/11/2022 21:46, Lin, Meng-Bo wrote:
> Acer Iconia Talk S A1-724 is a tablet using the MSM8916 SoC released
> in 2014.
> 
> Note: The original firmware from Acer can only boot 32-bit kernels.
> To boot arm64 kernels it is necessary to flash 64-bit TZ/HYP firmware
> with EDL, e.g. taken from the DragonBoard 410c. This works because Acer
> didn't set up (firmware) secure boot.
> 
> Add a device tree for with initial support for:

Thank you for your patch. There is something to discuss/improve.

> +
> +/ {
> +	model = "Acer Iconia Talk S A1-724";
> +	compatible = "acer,a1-724", "qcom,msm8916";
> +	chassis-type = "tablet";
> +
> +	aliases {
> +		serial0 = &blsp1_uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys_default>;
> +
> +		label = "GPIO Buttons";
> +
> +		button-volume-up {
> +			label = "Volume Up";
> +			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +	};
> +
> +	usb_id: usb-id {
> +		compatible = "linux,extcon-usb-gpio";
> +		id-gpio = <&msmgpio 110 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_id_default>;
> +	};
> +};
> +
> +&blsp1_uart2 {
> +	status = "okay";
> +};
> +
> +&pm8916_resin {
> +	status = "okay";

status is the last property

> +	linux,code = <KEY_VOLUMEDOWN>;
> +};
> +
> +&pm8916_vib {
> +	status = "okay";
> +};
> +
> +&pronto {
> +	status = "okay";
> +};
> +
> +&sdhc_1 {
> +	status = "okay";

Here as well and in all other places.


Best regards,
Krzysztof

