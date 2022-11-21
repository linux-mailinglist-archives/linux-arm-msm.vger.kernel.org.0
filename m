Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE98632039
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 12:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbiKULSs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 06:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbiKULS0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 06:18:26 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8851DBE878
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 03:13:47 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id a29so18253162lfj.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 03:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KyIZntu8KvsJCS2yaTq1/+UlX2o8vrPqHuwnWpawZaM=;
        b=lwd0U6a/+TY0wH3trHyg0RiR2UeNMXrdC/ErrtlUAAqLPaBWkjmMOvQWePwu3BGBq+
         2QgY+2Exouia7t6QaiHixfdwBwwByr8msPNsrugwwNKXpUZKvyMH+8lHldI0IecNn61Z
         nkgDBubB2WytZUfgpgpAQYygX1hv3M5nzyFMFyrRQ30sbvegBwSSuq1Z6MHbUeKrOH8V
         lA5myOCd5Z8s/hG0jTooO0PUlQ8xZBlGPE+YPKu48VV5jfsKPSGUnrxhbVLhdUq3bZLx
         WavSiHw0ygbMD/eDfRymUPPQnSpVYKWPECUjM2skDOzAG+EbDb8Qm8L3x09rttwSPGMB
         4vyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KyIZntu8KvsJCS2yaTq1/+UlX2o8vrPqHuwnWpawZaM=;
        b=hVBpY+KmgKDnGOIkYPf5qBSOQlrq7uQ0uOjzDBwqBzPNlfi1/+pxaXX1/hmhshXKS7
         cvbpqzFcK3mCkJmHkITSVaa9qtD8gOzQJpnsZPzKwIxomdaqBCqB0Qp6oc5p4q4dg6bX
         /iaEPn835gaZJWIBo22wcFQmkaZZTEEHoqHBUajHdura7b495seS1WGWFsC4QC0XsCMC
         OPJ3PIFTlFrCszVMmsY65e2EKzPt4ExkouFTw9+fdBgk8U+ekvyVisQ1VGp3bA/B0kjt
         Le0zO2+jOLsBoPsFaEpY6LF3FptaIrFEondH9HeuNwAx5yNygYTKTVBrdjhjXMYUHVxf
         yITQ==
X-Gm-Message-State: ANoB5pmrGyTYDNZbQ6WfmC65iuwSaDx/0Le9g2LFrTIyEyppOzTGGUUe
        GPTYCcvmYX9bSfkwUIPD9k6XrQ==
X-Google-Smtp-Source: AA0mqf4oMtOQ0xWZiTIqNKoB5DhqyCkCZl2tAYz8yFXHwsKBrDTVIuMF0zau8Fls1q9U9dNOtU+rnQ==
X-Received: by 2002:ac2:4c42:0:b0:4a5:bf09:a700 with SMTP id o2-20020ac24c42000000b004a5bf09a700mr5553203lfk.656.1669029224617;
        Mon, 21 Nov 2022 03:13:44 -0800 (PST)
Received: from [192.168.1.101] (95.49.32.48.neoplus.adsl.tpnet.pl. [95.49.32.48])
        by smtp.gmail.com with ESMTPSA id p19-20020a2e9ad3000000b0026c2d2a9b92sm1410486ljj.101.2022.11.21.03.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 03:13:44 -0800 (PST)
Message-ID: <6e0ee9a9-7d6c-6fda-270e-183d63667375@linaro.org>
Date:   Mon, 21 Nov 2022 12:13:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8916-acer-a1-724: Add
 accelerometer/magnetometer
Content-Language: en-US
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20221121004116.3458-1-linmengbo0689@protonmail.com>
 <20221121004559.3778-1-linmengbo0689@protonmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221121004559.3778-1-linmengbo0689@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21.11.2022 01:47, Lin, Meng-Bo wrote:
> Iconia Talk S uses a Bosch BMC150 accelerometer/magnetometer combo.
> The chip provides two separate I2C devices for the accelerometer
> and magnetometer that are already supported by the bmc150-accel
> and bmc150-magn driver.
> 
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../boot/dts/qcom/msm8916-acer-a1-724.dts     | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
> index 67187673364c..a87de8af9f15 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
> @@ -6,6 +6,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>  
>  /*
>   * NOTE: The original firmware from Acer can only boot 32-bit kernels.
> @@ -51,6 +52,35 @@ usb_id: usb-id {
>  	};
>  };
>  
> +&blsp_i2c2 {
> +	status = "okay";
> +
> +	accelerometer@10 {
> +		compatible = "bosch,bmc150_accel";
> +		reg = <0x10>;
> +		interrupt-parent = <&msmgpio>;
> +		interrupts = <115 IRQ_TYPE_EDGE_RISING>;
> +
> +		vdd-supply = <&pm8916_l17>;
> +		vddio-supply = <&pm8916_l6>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&accel_int_default>;
> +
> +		mount-matrix = "0", "-1", "0",
> +			       "-1", "0", "0",
> +			       "0", "0", "1";
> +	};
> +
> +	magnetometer@12 {
> +		compatible = "bosch,bmc150_magn";
> +		reg = <0x12>;
> +
> +		vdd-supply = <&pm8916_l17>;
> +		vddio-supply = <&pm8916_l6>;
> +	};
> +};
> +
>  &blsp1_uart2 {
>  	status = "okay";
>  };
> @@ -199,6 +229,14 @@ l18 {
>  };
>  
>  &msmgpio {
> +	accel_int_default: accel-int-default-state {
> +		pins = "gpio115";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	gpio_keys_default: gpio-keys-default-state {
>  		pins = "gpio107";
>  		function = "gpio";
