Return-Path: <linux-arm-msm+bounces-4537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBCB8119EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 17:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B07828271C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 16:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D93E2FC42;
	Wed, 13 Dec 2023 16:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dL48ZN7/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC75D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 08:45:35 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40c39ef63d9so46682005e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 08:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702485934; x=1703090734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3cCBxgQgmHnb3FRuAT0Bjhlc/UFy50sdoklKTPhP0IM=;
        b=dL48ZN7/8D65AVij2/Q/zX5fYY5e1bNs0afXcWkg0UIwRdky47Xs1au69sZ4/NQbrk
         DUwaD31TheYZ80s39yW88x2WuTJPh2yVM9GUsiVPuNUObCtclDEDsmEThotIG4p79eCa
         7hj7bMrUrt8q91YXQ7t+lHSKFsiBE4aE6F+AfByydCCOu2bUwL35t71sQt3T3wR+EtjY
         lSCJv2AXClUiiiLp9YHpMGqf43FLXrvxq9nmrcrX5lijC3hxjWHmRXNXRmbg/YykO39R
         BKD6oN4cApG1sxEodbg+Q8hGYx72QJQWfZkT0wc8HVz9fEaAgPUMGtlpQORUM0aUGIFM
         mWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702485934; x=1703090734;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3cCBxgQgmHnb3FRuAT0Bjhlc/UFy50sdoklKTPhP0IM=;
        b=i684L8lRxZVqgxjAF5ppk2HSDfX8Jgn3boimu900jaSXB9k3Fwyzrq0781FuQrmX1h
         WKkGPK8GFJX5dVatkCgqzK9XZc3+WXc3bcWWfE9Yd7Z7Ij8qwzGTHxJf/c1R9h8iIUBf
         hDJ0GEisWKbWerdXVUazK3mMLv6UGNltkFsDWld0KsF6uzXFqEpfcpmgcaVlomujpeXV
         cz88s7bLGyMOnly6U3n5oecQvPfafMp0SUCA49iGYin87mMdcn6au3qcBlw5Twuy7WIw
         LQuvv7QgFum0nKF1HBUjTtN6gTuq6pE0Jv+OSyvMy0WWgkdQ0sjRZV0YFSWyk56zRom9
         p++w==
X-Gm-Message-State: AOJu0Yw3HCum99Baq/l5qM+iOGq5n4zUMuG91e1uZtuSInQZJPDhpDlL
	AdrGBQOSQks7SLVBijQO2BSfcw==
X-Google-Smtp-Source: AGHT+IGjw8Bq0cGDXDAd7MBP09NT/7yPcTR+FQ1FGC8gDGZUKAgas4EVJLyZ7cZdLM7taOaIlr1C9Q==
X-Received: by 2002:a05:600c:3ba9:b0:40c:20d3:3a0f with SMTP id n41-20020a05600c3ba900b0040c20d33a0fmr955874wms.78.1702485933874;
        Wed, 13 Dec 2023 08:45:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ac4e:a5fe:7f71:8d59? ([2a01:e0a:982:cbb0:ac4e:a5fe:7f71:8d59])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm13767115wrf.107.2023.12.13.08.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 08:45:33 -0800 (PST)
Message-ID: <ce71647f-a21e-4df2-9f62-19de7da09728@linaro.org>
Date: Wed, 13 Dec 2023 17:45:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sm8450: move Soundwire pinctrl
 to its nodes
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231213162856.188566-1-krzysztof.kozlowski@linaro.org>
 <20231213162856.188566-2-krzysztof.kozlowski@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20231213162856.188566-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 13/12/2023 à 17:28, Krzysztof Kozlowski a écrit :
> Pin configuration for Soundwire bus should be set in Soundwire
> controller nodes, not in the associated macro codec node.  This
> placement change should not have big impact in general, because macro
> codec is a clock provider for Soundwire controller, thus its devices is
> probed first.  However it will have impact for disabled Soundwire buses,
> e.g. WSA2, because after this change the pins will be left in default
> state.
> 
> We also follow similar approach in newer SoCs, like Qualcomm SM8650.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Not tested on HW.
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 12e55a0c7417..3b6ea9653d2a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2160,8 +2160,6 @@ wsa2macro: codec@31e0000 {
>   
>   			#clock-cells = <0>;
>   			clock-output-names = "wsa2-mclk";
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&wsa2_swr_active>;
>   			#sound-dai-cells = <1>;
>   		};
>   
> @@ -2173,6 +2171,9 @@ swr4: soundwire-controller@31f0000 {
>   			clock-names = "iface";
>   			label = "WSA2";
>   
> +			pinctrl-0 = <&wsa2_swr_active>;
> +			pinctrl-names = "default";
> +
>   			qcom,din-ports = <2>;
>   			qcom,dout-ports = <6>;
>   
> @@ -2208,8 +2209,6 @@ rxmacro: codec@3200000 {
>   
>   			#clock-cells = <0>;
>   			clock-output-names = "mclk";
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&rx_swr_active>;
>   			#sound-dai-cells = <1>;
>   		};
>   
> @@ -2223,6 +2222,9 @@ swr1: soundwire-controller@3210000 {
>   			qcom,din-ports = <0>;
>   			qcom,dout-ports = <5>;
>   
> +			pinctrl-0 = <&rx_swr_active>;
> +			pinctrl-names = "default";
> +
>   			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
>   			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
>   			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
> @@ -2254,8 +2256,6 @@ txmacro: codec@3220000 {
>   
>   			#clock-cells = <0>;
>   			clock-output-names = "mclk";
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&tx_swr_active>;
>   			#sound-dai-cells = <1>;
>   		};
>   
> @@ -2275,8 +2275,6 @@ wsamacro: codec@3240000 {
>   
>   			#clock-cells = <0>;
>   			clock-output-names = "mclk";
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&wsa_swr_active>;
>   			#sound-dai-cells = <1>;
>   		};
>   
> @@ -2288,6 +2286,9 @@ swr0: soundwire-controller@3250000 {
>   			clock-names = "iface";
>   			label = "WSA";
>   
> +			pinctrl-0 = <&wsa_swr_active>;
> +			pinctrl-names = "default";
> +
>   			qcom,din-ports = <2>;
>   			qcom,dout-ports = <6>;
>   
> @@ -2318,6 +2319,9 @@ swr2: soundwire-controller@33b0000 {
>   			clock-names = "iface";
>   			label = "TX";
>   
> +			pinctrl-0 = <&tx_swr_active>;
> +			pinctrl-names = "default";
> +
>   			qcom,din-ports = <4>;
>   			qcom,dout-ports = <0>;
>   			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

