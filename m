Return-Path: <linux-arm-msm+bounces-1981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B567F8BE9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 16:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84C222815AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 15:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD7F28DD2;
	Sat, 25 Nov 2023 15:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sqy2gTGp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F180DF7
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 07:04:33 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4083f61312eso22435205e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 07:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700924672; x=1701529472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ScKfY09ekk9iyTG+1Y3vImjdJv6TZqfXKZB9Xfb5+7c=;
        b=sqy2gTGpD2fI9gUeN2IWDhKaE67kiOQdaPPy7Z1J9naTkwMfu1SsrLudPxOl+T2RsC
         70Xx906fHoqb04mqlgSUI41Gt2BrKatdVHprt4mf6hA4md9BTiJQxqhuk+O1FbXjxmRb
         xGzgMhI4Rz1HCLQ5GyvtG4oucs7luTtI0NQNcVzwW+4yienhVZUrKKMd3NVLxkZn5lh8
         arQAnVYPfr3ignG3L2VpSO7lPpA2mkdZakjV+BLEROXuTmBr7/B5cyCrZ6EGrxNBtwkQ
         uKsv3IETkBtTLA5jn+OBpSVNrrrC9x1UA35Si+Smefp9TMbW1+wry/8+CDw53gS6H9Vg
         5DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700924672; x=1701529472;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ScKfY09ekk9iyTG+1Y3vImjdJv6TZqfXKZB9Xfb5+7c=;
        b=u7/DQmMIRyEFJwSiUxpMWKeAxr5OPfWnEc7ItY76BJJ32Xd13MxRJeoQc+ZRgxZp/C
         UYG5fW9l3Djf+ISZRxBNO15EFdXhuU5sbqeGLAwZ6DmgAiKUHA9Ll/ot00jn/LGLC6pr
         QnJkbDkimuHia0aZlKwqHv/czlAhSVE3CVejXu68dRBnDyQxDHXoPDgMYgM5VJfMrXbj
         6Aa7y08/w0jxk+fdpieaCKTvQW1wrLNFCNOC8fbaX1Qa61RKXdx0B/pcZp5J6BrGHHyV
         HEbRDc1vf1gTHRXdHJEEpIbbUp350UaUgd8NLkB9kSnPs1w+I/WpugeE4K0//cTAhqGK
         lnRg==
X-Gm-Message-State: AOJu0YyoL/i6GqrgUDyaQ+DWQMGj++Ojom2eSATEhhxWHbmju1ULhDNe
	pPbS5GZcRuuxGit0/YZ7uuCQug==
X-Google-Smtp-Source: AGHT+IFoPTyLpDwlGytHlyDJns+285CNXDsFuYADSsEvWPkUn3TL99C5LbOY9PrRsWyP/d1TcYx/fA==
X-Received: by 2002:a05:600c:314f:b0:40b:2a18:f1be with SMTP id h15-20020a05600c314f00b0040b2a18f1bemr4857156wmo.1.1700924672282;
        Sat, 25 Nov 2023 07:04:32 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id f9-20020a0560001b0900b003143867d2ebsm6896206wrz.63.2023.11.25.07.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 07:04:31 -0800 (PST)
Message-ID: <d8cd02e7-7e85-4b75-b48c-e9544d03c197@linaro.org>
Date: Sat, 25 Nov 2023 15:04:30 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb4210-rb2: Enable bluetooth
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231120-topic-rb2_bt-v1-0-509db2e28e70@linaro.org>
 <20231120-topic-rb2_bt-v1-2-509db2e28e70@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231120-topic-rb2_bt-v1-2-509db2e28e70@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2023 13:04, Konrad Dybcio wrote:
> Enable the QCA bluetooth on RB2. It identifies like the following:
> 
> Bluetooth: hci0: QCA Product ID   :0x0000000a
> Bluetooth: hci0: QCA SOC Version  :0x40020150
> Bluetooth: hci0: QCA ROM Version  :0x00000201
> Bluetooth: hci0: QCA Patch Version:0x00000001
> Bluetooth: hci0: QCA controller version 0x01500201
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 81 +++++++++++++++++++++++++++++++-
>   1 file changed, 80 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index 9738c0dacd58..bd751236f983 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -15,6 +15,7 @@ / {
>   
>   	aliases {
>   		serial0 = &uart4;
> +		serial1 = &uart3;
>   	};
>   
>   	chosen {
> @@ -352,7 +353,8 @@ vreg_l8a_0p664: l8 {
>   
>   		vreg_l9a_1p8: l9 {
>   			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <2000000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-allow-set-load;
>   		};
>   
>   		vreg_l10a_1p8: l10 {
> @@ -389,11 +391,13 @@ vreg_l15a_3p128: l15 {
>   		vreg_l16a_1p3: l16 {
>   			regulator-min-microvolt = <1704000>;
>   			regulator-max-microvolt = <1904000>;
> +			regulator-allow-set-load;
>   		};
>   
>   		vreg_l17a_1p3: l17 {
>   			regulator-min-microvolt = <1152000>;
>   			regulator-max-microvolt = <1384000>;
> +			regulator-allow-set-load;
>   		};
>   
>   		vreg_l18a_1p232: l18 {
> @@ -426,6 +430,7 @@ vreg_l22a_2p96: l22 {
>   		vreg_l23a_3p3: l23 {
>   			regulator-min-microvolt = <3200000>;
>   			regulator-max-microvolt = <3400000>;
> +			regulator-allow-set-load;
>   		};
>   
>   		vreg_l24a_2p96: l24 {
> @@ -487,6 +492,60 @@ &tlmm {
>   			       <56 3>, <61 2>, <64 1>,
>   			       <68 1>, <72 8>, <96 1>;
>   
> +	uart3_default: uart3-default-state {
> +		cts-pins {
> +			pins = "gpio8";
> +			function = "qup3";
> +			bias-bus-hold;
> +		};
> +
> +		rts-pins {
> +			pins = "gpio9";
> +			function = "qup3";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		tx-pins {
> +			pins = "gpio10";
> +			function = "qup3";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		rx-pins {
> +			pins = "gpio11";
> +			function = "qup3";
> +			bias-pull-up;
> +		};
> +	};
> +
> +	uart3_sleep: uart3-sleep-state {
> +		cts-pins {
> +			pins = "gpio8";
> +			function = "gpio";
> +			bias-bus-hold;
> +		};
> +
> +		rts-pins {
> +			pins = "gpio9";
> +			function = "gpio";
> +			bias-pull-down;
> +		};
> +
> +		tx-pins {
> +			pins = "gpio10";
> +			function = "gpio";
> +			bias-pull-up;
> +		};
> +
> +		rx-pins {
> +			pins = "gpio11";
> +			function = "gpio";
> +			bias-pull-up;
> +		};
> +	};
> +

My reading of downstream has all of these pins drive-strength = <2>.


>   	lt9611_rst_pin: lt9611-rst-state {
>   		pins = "gpio41";
>   		function = "gpio";
> @@ -508,6 +567,26 @@ sdc2_card_det_n: sd-card-det-n-state {
>   	};
>   };
>   
> +&uart3 {
> +	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
> +	pinctrl-0 = <&uart3_default>;
> +	pinctrl-1 = <&uart3_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn3988-bt";
> +
> +		vddio-supply = <&vreg_l9a_1p8>;
> +		vddxo-supply = <&vreg_l16a_1p3>;
> +		vddrf-supply = <&vreg_l17a_1p3>;
> +		vddch0-supply = <&vreg_l23a_3p3>;
> +		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
> +		max-speed = <3200000>;
> +	};
> +};

Does firmware name not matter here ?

bluetooth {
     compatible = "qcom,wcn3990-bt";
     vddio-supply = <&vreg_s4a_1p8>;
     vddxo-supply = <&vreg_l7a_1p8>;
     vddrf-supply = <&vreg_l17a_1p3>;
     vddch0-supply = <&vreg_l25a_3p3>;
     max-speed = <3200000>;
     firmware-name = "crnv21.bin";
};

> +
>   &uart4 {
>   	status = "okay";
>   };

---
bod

