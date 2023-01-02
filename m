Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8D4F65B060
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 12:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232414AbjABLP4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 06:15:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbjABLPy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 06:15:54 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C194C44
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 03:15:53 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id p2so13203655ljn.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 03:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yh/CwGy+ykyw5/odWrqqFD1ozv3E0j8ssCuCBrxKXQY=;
        b=y6vONfLp3LSHnE58z2ybdyZnBEUmRKmHExkYn9TqwRM6P1xJN+CuiJK7Vx8l/D9wov
         M4OeFglLC+JdRpX2dxSWWefBIJ5dm/Byzv3eVGnSD9U52uTIdDL6csXJ9ava42jOHhua
         zRrsB8aD37i2clJLOBt3hKEJPw+SHA5tqU9vUqT7BesoJd1TBLVrNebu0lOxwWCMqfOB
         hLLbu+h+LRNY1llZ1q2B8AcK80D4GjLzQMaEuSM9EicFXEKySdKhET8OHJuWmsLlyO6y
         u/TVdm34X9/DjYiqG5Z5OCMxHEG1oU+HfVHNZ2hVd82tZTXbD7yUXASBLMliTws14Eg+
         L7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yh/CwGy+ykyw5/odWrqqFD1ozv3E0j8ssCuCBrxKXQY=;
        b=RQSo4Jtn3+sBpo1ma4kvIUHkvFGqfS6/jjOjBXi9LmJXCiq+CwRqJrpPGmgVriTuZo
         8KMw7tKLnuMpo9u/nIft5AW5nmaFlSEhuZkwW7gWvFta7uP1ywdeckJuBF7QX8Bb9xUZ
         tiAdrwE2/37ArqOD8X96v801mFZflYWEZldsnl3h3XRZ3q2oNl027MJqLWWTNdHOPcf2
         479dd/uz9KXenQ3PQwVS7x2uquJ7wPwKjivJwST8ivwEwCWmMytwKzD2jD8Xj8fffCHM
         EK6e2XFIdiFU9ZquZ/CmAij0qFTrH6uZVlnxjOJc51d0io2FJhZB2klKl0oxXzSxcXC7
         6l4g==
X-Gm-Message-State: AFqh2kqHsqj3dW4R4RtQEbzcM31aPsMFr9CCbbHbsYUnUUzh4RU8UyH5
        OHig1e5bXN6/9x6Bdch7yAyFd3cSoAXAFdFg
X-Google-Smtp-Source: AMrXdXswnzcEl6Dv0ei17hEqjia6KuCWFl3+7b4U828dXClSFvAFyTsYb9HOaQjAYVu2l6jLyjULQw==
X-Received: by 2002:a05:651c:2c2:b0:27f:c8aa:f839 with SMTP id f2-20020a05651c02c200b0027fc8aaf839mr6430625ljo.40.1672658151752;
        Mon, 02 Jan 2023 03:15:51 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id q9-20020ac25109000000b004cb147c1056sm1810862lfb.94.2023.01.02.03.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 03:15:51 -0800 (PST)
Message-ID: <77bd335a-1989-2d5f-d480-d388e141ec91@linaro.org>
Date:   Mon, 2 Jan 2023 12:15:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8250-mtp: fix wcd938x codec node
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230102105038.8074-1-johan+linaro@kernel.org>
 <20230102105038.8074-6-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230102105038.8074-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2.01.2023 11:50, Johan Hovold wrote:
> The wcd938x codec is not a memory-mapped device and does not belong
> under the soc node.
> 
> Move the node to the root node to avoid DT validation failures.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Could you rename it to audio-codec and separate/sort the properties
like you did for x13s?

Konrad

>  arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 40 ++++++++++++-------------
>  1 file changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> index 3ed8c84e25b8..ea43dbdc3671 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> @@ -23,6 +23,25 @@ aliases {
>  		serial0 = &uart12;
>  	};
>  
> +	wcd938x: codec {
> +		compatible = "qcom,wcd9380-codec";
> +		#sound-dai-cells = <1>;
> +		reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
> +		vdd-buck-supply = <&vreg_s4a_1p8>;
> +		vdd-rxtx-supply = <&vreg_s4a_1p8>;
> +		vdd-io-supply = <&vreg_s4a_1p8>;
> +		vdd-mic-bias-supply = <&vreg_bob>;
> +		qcom,micbias1-microvolt = <1800000>;
> +		qcom,micbias2-microvolt = <1800000>;
> +		qcom,micbias3-microvolt = <1800000>;
> +		qcom,micbias4-microvolt = <1800000>;
> +		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> +		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> +		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> +		qcom,rx-device = <&wcd_rx>;
> +		qcom,tx-device = <&wcd_tx>;
> +	};
> +
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> @@ -631,27 +650,6 @@ &slpi {
>  	firmware-name = "qcom/sm8250/slpi.mbn";
>  };
>  
> -&soc {
> -	wcd938x: codec {
> -		compatible = "qcom,wcd9380-codec";
> -		#sound-dai-cells = <1>;
> -		reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
> -		vdd-buck-supply = <&vreg_s4a_1p8>;
> -		vdd-rxtx-supply = <&vreg_s4a_1p8>;
> -		vdd-io-supply = <&vreg_s4a_1p8>;
> -		vdd-mic-bias-supply = <&vreg_bob>;
> -		qcom,micbias1-microvolt = <1800000>;
> -		qcom,micbias2-microvolt = <1800000>;
> -		qcom,micbias3-microvolt = <1800000>;
> -		qcom,micbias4-microvolt = <1800000>;
> -		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> -		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> -		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> -		qcom,rx-device = <&wcd_rx>;
> -		qcom,tx-device = <&wcd_tx>;
> -	};
> -};
> -
>  &sound {
>  	compatible = "qcom,sm8250-sndcard";
>  	model = "SM8250-MTP-WCD9380-WSA8810-VA-DMIC";
