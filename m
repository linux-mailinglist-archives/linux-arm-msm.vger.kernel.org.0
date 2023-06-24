Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 793DD73CB7C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jun 2023 16:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbjFXO5E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jun 2023 10:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232981AbjFXO5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jun 2023 10:57:04 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF9819B
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jun 2023 07:57:03 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3112c11fdc9so1525990f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jun 2023 07:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687618621; x=1690210621;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sy7fPEGEDCMmwEn/3Ug5tuBvNGDyVHoAclBv/BnN2Ig=;
        b=Ndq5blxSplU89R+Avk5O5MvybCqYfI1gw5eIb2obe6Jg3GHZ9JrvtSy+Ihb7hF5On2
         iQ3B4RUJ59OiLZYTpLlGwd5Dx0M67Z/VkvLah5h1Ii8iU9FBCA3x0+eiDFbhsNismofv
         ZKI0eFI27FCwkaTNa8/RTSuLU1KG+mxbkgWvou+obpWoDETsfzd1uHlz3W9K9HbgF7mB
         d3eyIj3tI3vxqiwYRHzZUtW0wc/LiuY9/sLJPRGW6otnSz9+Vwk7VH6Eyw+InG+e3DfS
         E7EiIcpeQ7N0S40LN1MGGOAhAEQsU3xUiEhBNjPECtQzvc6NJ7vXlscsSv1tKvlXVA+p
         dg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687618621; x=1690210621;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sy7fPEGEDCMmwEn/3Ug5tuBvNGDyVHoAclBv/BnN2Ig=;
        b=ILXJUCi+qO6yEBcpDPZqdtjiCg5vIvAjEqyrnaRwf6z8sKBmoiDolj9I1HT9TnsNQQ
         bjf4oDJUHX13ZodFGuy0RXQiwuhA65q35aHc6fgwbSJ3E7wDKkuHWIfqckvac2ZzgbEO
         v4YiLGFd7ariRlS8bQiRL2CC8PREMD1aaxtB4x+tK9uPrxBjmFbxtzldJYZeWMuyy5NU
         RsvgCkg0WpFkHTS8vbr2GDKO0BAY0K9CSIJE7whoxsC2K+mSr55k1yGjZBFXDjkI8Zk0
         bOxjSj1HcJ00/ZwleRW9cQyMLajcY+8J9HLW4QeGuBD641q0fxGDdOxCoeX4ugS0Vz9T
         1owg==
X-Gm-Message-State: AC+VfDy4a0mhKM+P7ViOuUI+iFge7oONdxIo+H9b160NJaOde8xYB1As
        dGkSrv/MfDpcsYDgmaagY/LNZU/bbhzpQ/FH9Do7zQ==
X-Google-Smtp-Source: ACHHUZ7qJnFn5fHS2T2L7g8GNkZHsZjBV7Yl9ZXHxPv+6wQkhJ/pSP9dVB8iDOuC1JzP8YkFz7S9yQ==
X-Received: by 2002:a5d:6506:0:b0:313:e735:6d23 with SMTP id x6-20020a5d6506000000b00313e7356d23mr525786wru.22.1687618621094;
        Sat, 24 Jun 2023 07:57:01 -0700 (PDT)
Received: from [192.168.0.79] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id d10-20020adfe2ca000000b0031272fced4dsm2307084wrj.52.2023.06.24.07.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 07:57:00 -0700 (PDT)
Message-ID: <52dbabb2-8cc1-5579-8c83-adcc7a699222@linaro.org>
Date:   Sat, 24 Jun 2023 14:56:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFT PATCH] arm64: dts: qcom: sdm850-c630: add missing panel
 supply
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230617171512.286795-1-krzysztof.kozlowski@linaro.org>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230617171512.286795-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17/06/2023 17:15, Krzysztof Kozlowski wrote:
> Panel bindings (boe,nv133fhm-n61) require supply which here actually can
> be turned on/off via GPIO control:
> 
>   sdm850-lenovo-yoga-c630.dtb: panel: 'power-supply' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I've been running an equivalent patch for a while, so

Tested-by: Caleb Connolly <caleb.connolly@linaro.org>

The dsi bridge vcc and vcca supplies are also missing, they're powered
from vreg_l2a_1p2 and controlled by pm8998_gpio 9.
> 
> ---
> 
> Not tested on hardware
> ---
>  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index cfbc4fc1eba9..3d871567cf81 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -87,6 +87,25 @@ sn65dsi86_refclk: sn65dsi86-refclk {
>  		clock-frequency = <19200000>;
>  	};
>  
> +	vph_pwr: regulator-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	vlcm_3v3: regulator-vlcm-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vlcm_3v3";
> +
> +		vin-supply = <&vph_pwr>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	backlight: backlight {
>  		compatible = "pwm-backlight";
>  		pwms = <&sn65dsi86 1000000>;
> @@ -419,6 +438,7 @@ aux-bus {
>  			panel: panel {
>  				compatible = "boe,nv133fhm-n61";
>  				backlight = <&backlight>;
> +				power-supply = <&vlcm_3v3>;
>  
>  				port {
>  					panel_in_edp: endpoint {

-- 
// Caleb (they/them)
