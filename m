Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7210A7AF3AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 21:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbjIZTD2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Sep 2023 15:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235700AbjIZTD1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Sep 2023 15:03:27 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4028192
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 12:03:18 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50435a9f800so14258143e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 12:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695754997; x=1696359797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxJQc034WDcSqNBqoYSITMTmMpTGhsYBcX8ds6NBz4Q=;
        b=cy2G18FNASu10k2npAZLdJ0I1Tk8GNuV+FRZDsU5H4S23G6QwBuBm7n5OwcfRmJGQJ
         fCkkiiPIheR9YdffreMfK6FNx63rEEDHW67h4LcKy+wmfjni8lTlrMIsUfHSs3bAoOqI
         hSnIuxRrMEOdvlVbH3V8LuhefM8NNSoBeWl7GzJmsUxVYqT9w0xbmg/Wnu1AWei+g3Y5
         Uf0OR9Bgbehj9A5ywPXU0WVXyMAsc4yLFsEn/GcrCIXX3byl2wQSlPT8h8vvDYG5iVsY
         6F4SvIznRPtpsZndABVpongysdYJ1Sgjt3AxRwR5tvLUFOlv8z+ap9pfOpzqIYC1ooZU
         tnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695754997; x=1696359797;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxJQc034WDcSqNBqoYSITMTmMpTGhsYBcX8ds6NBz4Q=;
        b=pU6WvkJ7f4A2wxiEFAeKdlJZfNlC11BSJ6gGLvxHMwOG6VS3nD/vMOqoaC+Ky5yEAs
         HoUzuwYpamEocc/KQr3B9P6fWYcAvnWAHUYpLVMPxh8MnugnqeR43LdaeKfN4vRReHm5
         gP11c0P2alp2l7Z2MNTpdFZnoRwWqt++RUDW2Fr70V7h86S4NIe4M2QmWaGLFZpA07kM
         Ra5e9WuPB+0jZ3hXKSF2c2F7hlXxgTrCDdk9D/y6e2mcP9uxePXalJZZiy6cpShKZdbZ
         qYBmu5NqvYPwXrXL9uz8fuJcyAOojT/2TIb+plBl7a2+M13JzoClPYIBSzxmwqNOOx1c
         RrRg==
X-Gm-Message-State: AOJu0YwuQmN1gfg2dyearKRwGEExWqpc+4t9rpixJMqcdfy3i8Z0Yvy7
        4sPm1iMxlOTm43sW7wolP715pw==
X-Google-Smtp-Source: AGHT+IGCwK+Rbp8PFZ/F3XqasIh5Fe0lVCMUHcZWjTqvqVgGegfEFFZk0Il3anNXJyal/aCOgKLJAg==
X-Received: by 2002:ac2:484a:0:b0:502:d743:9fc4 with SMTP id 10-20020ac2484a000000b00502d7439fc4mr8389415lfy.37.1695754996938;
        Tue, 26 Sep 2023 12:03:16 -0700 (PDT)
Received: from [192.168.33.189] (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
        by smtp.gmail.com with ESMTPSA id h19-20020ac25973000000b00500cfb168a3sm2283303lfp.139.2023.09.26.12.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 12:03:16 -0700 (PDT)
Message-ID: <8b4de316-123f-455d-933a-c727daef918b@linaro.org>
Date:   Tue, 26 Sep 2023 21:03:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] arm64: dts: qcom: msm8916-samsung-gt5: Add sound
 and modem
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jasper Korten <jja2000@gmail.com>,
        Siddharth Manthan <siddharth.manthan@gmail.com>,
        Nikita Travkin <nikita@trvn.ru>
References: <20230926-msm8916-modem-v1-0-398eec74bac9@gerhold.net>
 <20230926-msm8916-modem-v1-11-398eec74bac9@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230926-msm8916-modem-v1-11-398eec74bac9@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26.09.2023 18:51, Stephan Gerhold wrote:
> From: Jasper Korten <jja2000@gmail.com>
> 
> Enable sound and modem for the Samsung Galaxy Tab A 2015 tablets.
> The setup is similar to most MSM8916 devices, i.e.:
> 
>  - QDSP6 audio
>  - Headphones/microphones via digital/analog codec in
>    MSM8916/PM8916. Earpiece exists on samsung-gt58 only.
>  - WWAN Internet via BAM-DMUX
> 
> except:
> 
>  - gt510: Stereo Maxim MAX98357A codecs for speaker on Quaternary MI2S
>  - gt58: Mono NXP TFA9895 codec for speaker on Quaternary MI2S
>    - For some reason connected to GPIOs where no hardware I2C
>      controller is available -> need to use i2c-gpio
> - Samsung-specific audio jack detection (not supported yet)
> 
> Signed-off-by: Jasper Korten <jja2000@gmail.com>
> Co-developed-by: Siddharth Manthan <siddharth.manthan@gmail.com>
> Signed-off-by: Siddharth Manthan <siddharth.manthan@gmail.com>
> Co-developed-by: Nikita Travkin <nikita@trvn.ru>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> [Stephan: Add consistent commit message]
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../boot/dts/qcom/msm8916-samsung-gt5-common.dtsi  | 36 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts | 23 ++++++++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts  | 43 ++++++++++++++++++++++
>  3 files changed, 102 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
> index 6a16eb5ce07b..396853fcece5 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
> @@ -3,9 +3,12 @@
>  /dts-v1/;
>  
>  #include "msm8916-pm8916.dtsi"
> +#include "msm8916-modem-qdsp6.dtsi"
> +
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/sound/apq8016-lpass.h>
>  
>  / {
>  	aliases {
> @@ -116,6 +119,17 @@ &blsp_uart2 {
>  	status = "okay";
>  };
>  
> +&lpass {
> +	dai-link@3 {
> +		reg = <MI2S_QUATERNARY>;
> +		qcom,playback-sd-lines = <1>;
> +	};
> +};
status = reserved?

[...]
>  
> +	i2c-amplifier {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm 55 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm 56 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
non-msm8916 files have a space around the OR operator, hm

Konrad
