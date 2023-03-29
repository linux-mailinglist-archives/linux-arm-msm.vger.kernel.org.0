Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 097A96CCEBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 02:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjC2AWz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 20:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjC2AWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 20:22:46 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12392137
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:22:42 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id c9so7608839lfb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680049361;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w3anGdaJUi49xU3JqeEYf+y4FnAPwYW4TYS/GUxiZ7o=;
        b=CbTDLXx0YDLkSbarknnAA+WX/acIkq/3Fxb9eX9C4DELMVl+rw6dW/NKwY2QPeq+9N
         cYdKqELc5FIH/Xk0tikF0lbAhAsLutshYd81AxNlwAnfz9TcPoM/wJVHtKxkgLdhRgqR
         p27hf6PUW9Q9OOkLlZXZ6xTT0+NfLHGRupuU5Z+kZZpvBJnHUsAiaUPWEYccg3rcZpCq
         V0bC6sOYb+joywyJIjIaqgAFZmUOW15I/rg8jOFFkXj5hSarq9SYfGD+Siknp0TJGIxY
         ZDwF4UqHL1XYL1YOr8qPVMG/3O/XQlLot71Tfaaz0BwPlonW2gpXBES56YUSrJsytZYu
         b8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680049361;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w3anGdaJUi49xU3JqeEYf+y4FnAPwYW4TYS/GUxiZ7o=;
        b=GVmORigyzL0nhyBQB+IzW6tzPBI82oqHiZkGU/B9dVVcCQwO0lR724Y7BThHBJ0mS7
         WXeJ3nGNf+FaghXpla30Qg7e1uM70WXbrf/RRts3N6o8NBdF9WCdWhqtCOBxgMDpTRB9
         YN3VOqbt6t49/DfuITEF7Cjl9lzFLOS5B2/ThdeI5RoZNKWu4xN9y+eAL3kWh/U9dOjz
         VLsHfEvS4dP/LmYOldH6Y3encCHwxock0597ps0ocQzWODclHxrwB6O7bFj7IUeUHX2j
         hmoZq2ih6u1n698Wrc4BlX6Hp2Xp38EChkKkHi7bdjgG7592tCZ/nXLYh2TOHdZxEig6
         N9CA==
X-Gm-Message-State: AAQBX9cXdunkb0EB7A49YXfUilt5PbGtT5jI12OX9NTO1ZDLReD5iVLm
        QYtmLgH47FRlISagQz9YIz2SAw==
X-Google-Smtp-Source: AKy350bESc9SQPqyVtu1pIvVB4moGUReCuVjvLDJmJFwXp9xLPoFlWRzr1R4lOMTH0tnq3DxmNwQ7g==
X-Received: by 2002:ac2:5591:0:b0:4e8:41fc:b37 with SMTP id v17-20020ac25591000000b004e841fc0b37mr5066521lfg.10.1680049361052;
        Tue, 28 Mar 2023 17:22:41 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id c3-20020ac244a3000000b004e792045b3dsm5244264lfm.106.2023.03.28.17.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 17:22:40 -0700 (PDT)
Message-ID: <096b9906-355c-bf53-e5e3-ac151ff61bf6@linaro.org>
Date:   Wed, 29 Mar 2023 02:22:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/6] arm64: dts: qcom: pmk8350: rename pon label
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
References: <20230329000833.2507594-1-dmitry.baryshkov@linaro.org>
 <20230329000833.2507594-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230329000833.2507594-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29.03.2023 02:08, Dmitry Baryshkov wrote:
> To reduce a possibility of the conflicts, rename pmk8350's pon_pwrkey
> and pon_resin to contain the PMIC name too.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/pmk8350.dtsi                   | 4 ++--
>  arch/arm64/boot/dts/qcom/sm8350-mtp.dts                 | 8 ++++----
>  arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi | 8 ++++----
>  arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi | 4 ++--
>  4 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> index f26fb7d32faf..455ffffb5f5c 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> @@ -25,14 +25,14 @@ pmk8350_pon: pon@1300 {
>  			reg = <0x1300>, <0x800>;
>  			reg-names = "hlos", "pbs";
>  
> -			pon_pwrkey: pwrkey {
> +			pmk8350_pon_pwrkey: pwrkey {
>  				compatible = "qcom,pmk8350-pwrkey";
>  				interrupts = <PMK8350_SID 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
>  				linux,code = <KEY_POWER>;
>  				status = "disabled";
>  			};
>  
> -			pon_resin: resin {
> +			pmk8350_pon_resin: resin {
>  				compatible = "qcom,pmk8350-resin";
>  				interrupts = <PMK8350_SID 0x13 0x6 IRQ_TYPE_EDGE_BOTH>;
>  				status = "disabled";
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
> index d21d2aacf201..152601832cbc 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
> @@ -285,17 +285,17 @@ &mpss {
>  	firmware-name = "qcom/sm8350/modem.mbn";
>  };
>  
> -&pmk8350_rtc {
> +&pmk8350_pon_pwrkey {
>  	status = "okay";
>  };
>  
> -&pon_pwrkey {
> +&pmk8350_pon_resin {
>  	status = "okay";
> +	linux,code = <KEY_VOLUMEDOWN>;
>  };
>  
> -&pon_resin {
> +&pmk8350_rtc {
>  	status = "okay";
> -	linux,code = <KEY_VOLUMEDOWN>;
>  };
>  
>  &qupv3_id_0 {
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> index 89382ad73133..e28f49e31b9f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> @@ -618,17 +618,17 @@ vol_down_n: vol-down-n-state {
>  	};
>  };
>  
> -&pmk8350_rtc {
> +&pmk8350_pon_pwrkey {
>  	status = "okay";
>  };
>  
> -&pon_pwrkey {
> +&pmk8350_pon_resin {
>  	status = "okay";
> +	linux,code = <KEY_VOLUMEUP>;
>  };
>  
> -&pon_resin {
> +&pmk8350_rtc {
>  	status = "okay";
> -	linux,code = <KEY_VOLUMEUP>;
>  };
>  
>  &qupv3_id_0 {
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
> index 67538b5a557e..99e9b776b93d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
> @@ -684,11 +684,11 @@ &pmk8350_gpios {
>  			  "PMK8350_OPTION";
>  };
>  
> -&pon_pwrkey {
> +&pmk8350_pon_pwrkey {
>  	status = "okay";
>  };
>  
> -&pon_resin {
> +&pmk8350_pon_resin {
>  	linux,code = <KEY_VOLUMEUP>;
>  	status = "okay";
>  };
