Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8417E6AC1F5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 14:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbjCFN4L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 08:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjCFN4I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 08:56:08 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821AF303F7
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 05:55:57 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id f18so12849530lfa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 05:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678110955;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngLxvSIAvONF6WOdrdM2VpLAABKGp5XbAz/1VEXv7UI=;
        b=DuzOXx+2PU+yi4NafIp3h1DOw8OGn6hM1j8Afk6HkgD5qTAzbTmpSNsdXXtz0eWrmO
         Gt1asCvUwWCQGoma0z4queZySxFgJ5qvH+8BQL8b+P8mW86m6FQl+tU1QvCrgpwXB0EA
         D1tFil+E0pG8CM48tYhNz5Aqx0FcE/99185lyLISt/U8GsWc0ijocb6UeK1fKT5liKvN
         XQc0iObI7aRRha7zGCcjYVW56DrY42f0jI6H/Aw2yK+fHEMfeUBBbzUqnHqc0UsNoZn5
         lJv6ZgZaJTh76taWucTFCNJLcuGREWIfT94w9hMrupRJFbXJ6EWxF1t29fWOlmVdEBS5
         i1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110955;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngLxvSIAvONF6WOdrdM2VpLAABKGp5XbAz/1VEXv7UI=;
        b=g5ZmQ5dhxncpbCiQnTMIezy/U3qvKcuzWCrhAbUzb9AjsquCF7O55ONLlBNpPLcsS3
         +G8GFG7RRMlMFO9g+OTxhvqh2ZdnIu4s8dYMWDmZ/3b3fIt/e4RJIu+5Q063cYc5RmHx
         1iGmGQjfLk27ye9t1ZPlBbtbMXwDNXdY2lxLLLn72mnb2a2SgGyEEduQ+dlEOloL0uaL
         Bi3pOvwUfhIeoUuTvdhzPvUXGB7thIHWQgLoxXZeJ+P0JC1Xxqv4kB7rlxTwU3Fnuw9s
         r2WBJaiU4yK6NZDKzyLI1J8GJ+ScvuXH8sglc7zgNkzf2xTnmBsLppIlyELXnQrTYsk+
         Rqqg==
X-Gm-Message-State: AO0yUKWwnFasE33DLLodz9BKB16XJUHqnOiqezUk/YcwkWEQKKb9NeJp
        hU1RAIwLlz2Y/fkwtRdmVi5gwg==
X-Google-Smtp-Source: AK7set8X9Oj2y+EmC/9XV8V5YtmCYY2YKdC6wqLGYMthkx1COOvR9lkWd7zVV9JldVT2JBSzMFXLhw==
X-Received: by 2002:a05:6512:3ca1:b0:4d8:86c1:4786 with SMTP id h33-20020a0565123ca100b004d886c14786mr4328933lfv.27.1678110955662;
        Mon, 06 Mar 2023 05:55:55 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id w5-20020a19c505000000b004d8729d4150sm1661652lfe.145.2023.03.06.05.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 05:55:55 -0800 (PST)
Message-ID: <4667f133-8084-3358-f230-5e7ddd76ee0e@linaro.org>
Date:   Mon, 6 Mar 2023 14:55:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 11/11] arm64: dts: qcom: msm8996-oneplus: do not enable
 incomplete nodes
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harry Austen <hpausten@protonmail.com>
References: <20230305125954.209559-1-krzysztof.kozlowski@linaro.org>
 <20230305125954.209559-11-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230305125954.209559-11-krzysztof.kozlowski@linaro.org>
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



On 5.03.2023 13:59, Krzysztof Kozlowski wrote:
> status=okay should appear in final place where all required properties
> are provided, because that makes the code the easiest to read.  Move the
> status from common OnePlus DTSI to board DTS.  No functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
+CC Harry

Are all of these firmwares actually different on 3/3T?

My educated guess would be that at least ZAP and Venus could
be shared. Could you doublecheck?

For the patch, I suppose this does make sense and it looks like we're
already doing it, so:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../boot/dts/qcom/msm8996-oneplus-common.dtsi   | 17 -----------------
>  arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts   |  6 ++++++
>  arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts  |  6 ++++++
>  3 files changed, 12 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> index 104deaee74e5..2adadc1e5b7c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> @@ -85,10 +85,6 @@ wlan_en: wlan-en-regulator {
>  	};
>  };
>  
> -&adsp_pil {
> -	status = "okay";
> -};
> -
>  &blsp1_i2c3 {
>  	status = "okay";
>  
> @@ -183,10 +179,6 @@ &dsi0_phy {
>  	status = "okay";
>  };
>  
> -&gpu {
> -	status = "okay";
> -};
> -
>  &hsusb_phy1 {
>  	vdd-supply = <&vreg_l28a_0p925>;
>  	vdda-pll-supply = <&vreg_l12a_1p8>;
> @@ -215,7 +207,6 @@ &mmcc {
>  
>  &mss_pil {
>  	pll-supply = <&vreg_l12a_1p8>;
> -	status = "okay";
>  };
>  
>  &pcie0 {
> @@ -548,10 +539,6 @@ wcd9335: codec@1,0 {
>  	};
>  };
>  
> -&slpi_pil {
> -	status = "okay";
> -};
> -
>  &sound {
>  	compatible = "qcom,apq8096-sndcard";
>  	model = "OnePlus3";
> @@ -812,7 +799,3 @@ &usb3_dwc3 {
>  
>  	maximum-speed = "high-speed";
>  };
> -
> -&venus {
> -	status = "okay";
> -};
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts b/arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts
> index 1bdc1b134305..dfe75119b8d2 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts
> @@ -17,6 +17,7 @@ / {
>  
>  &adsp_pil {
>  	firmware-name = "qcom/msm8996/oneplus3/adsp.mbn";
> +	status = "okay";
>  };
>  
>  &battery {
> @@ -25,6 +26,8 @@ &battery {
>  };
>  
>  &gpu {
> +	status = "okay";
> +
>  	zap-shader {
>  		firmware-name = "qcom/msm8996/oneplus3/a530_zap.mbn";
>  	};
> @@ -33,12 +36,15 @@ zap-shader {
>  &mss_pil {
>  	firmware-name = "qcom/msm8996/oneplus3/mba.mbn",
>  			"qcom/msm8996/oneplus3/modem.mbn";
> +	status = "okay";
>  };
>  
>  &slpi_pil {
>  	firmware-name = "qcom/msm8996/oneplus3/slpi.mbn";
> +	status = "okay";
>  };
>  
>  &venus {
>  	firmware-name = "qcom/msm8996/oneplus3/venus.mbn";
> +	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts b/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
> index 34f837dd0c12..51fce65e89f1 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
> @@ -18,6 +18,7 @@ / {
>  
>  &adsp_pil {
>  	firmware-name = "qcom/msm8996/oneplus3t/adsp.mbn";
> +	status = "okay";
>  };
>  
>  &battery {
> @@ -26,6 +27,8 @@ &battery {
>  };
>  
>  &gpu {
> +	status = "okay";
> +
>  	zap-shader {
>  		firmware-name = "qcom/msm8996/oneplus3t/a530_zap.mbn";
>  	};
> @@ -34,12 +37,15 @@ zap-shader {
>  &mss_pil {
>  	firmware-name = "qcom/msm8996/oneplus3t/mba.mbn",
>  			"qcom/msm8996/oneplus3t/modem.mbn";
> +	status = "okay";
>  };
>  
>  &slpi_pil {
>  	firmware-name = "qcom/msm8996/oneplus3t/slpi.mbn";
> +	status = "okay";
>  };
>  
>  &venus {
>  	firmware-name = "qcom/msm8996/oneplus3t/venus.mbn";
> +	status = "okay";
>  };
