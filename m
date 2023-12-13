Return-Path: <linux-arm-msm+bounces-4539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1159A8119F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 17:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E66FB2102C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 16:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34DC35F1A;
	Wed, 13 Dec 2023 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G1IPRTt3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4732FDD
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 08:46:04 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-336356d9092so1111025f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 08:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702485963; x=1703090763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+XXQ2ehWpDm3x0hzvGJwTzxoHhkRmFBd0RUpa4EeOwc=;
        b=G1IPRTt3WIg3eyDLl3hgoHWyIaKyG1BNIHdCjLeYPNg+OcUWgGsQJW9OSbR31sWkzt
         8319UIBhm3JU/Em1qHgG+IhBimrNEGuxQyWEmtNmH+ZVqfPrK9cZJeqgv9TExHTPEBmC
         exqrFh1UbMdoigIzSox6wsIgasC2wfLchq7F95MK2kQVegob+uz4hEBiVIBemte5Z9gP
         lsDLOh3dY8MHeEew1DOvGVXA0wwe2UFkxiPLvczmpqLhhjt7aznZi6WTnHvHqWije2Tn
         AzYhGKk24fosxv18sOs/nYr5vluJ7zk4lIEP5j9PSQgWc/u/6w6xcvYK+Si2/py6xHxy
         9qFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702485963; x=1703090763;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XXQ2ehWpDm3x0hzvGJwTzxoHhkRmFBd0RUpa4EeOwc=;
        b=ZDPrffZHSDA3CU6K09JhU4wWDmIgG4DeT32v9ZhPbkXCYNhgYSyGsVodKE2UiLzzwa
         A3NYdLRUMsQN/fZ7/FYRDUWnbbkV6kLJGvRJlGcpsaQZCk7iLbKFo9BFi2kkuccFM5WA
         c3vTyHgWK0UKR/1eJ9Ui8e1giaToOVvNOQOWBvA2WwZCoLwsZRicA1wcCl9SKpPn8O+m
         yP5ly7dVY58pC8vcvN1sXuYkDS6QZiw+IT9OFMava5JX0o1WPPvjnTsdVnt0APvKeLnq
         Ug4feg59mzuL5r5m/t8VrxQ4aGu3Evg/qI0zEzZJkOwFvRhixsYLeIZcmdwXAX5pOlMs
         zS/g==
X-Gm-Message-State: AOJu0Yzmt+tP9vihH6q4ZFsE+dKSqlUiy4v882jy+P94ZhT6opseF7F8
	eBGrOTws+p0S/nl21coO0Tjyrg==
X-Google-Smtp-Source: AGHT+IEB5rAi61NLHuaUfyijf9GcZGeT9vnyc9jfXHPcxAAOH4Oda+qVcK+pbIg1ntAsTaoKdPM2HQ==
X-Received: by 2002:adf:a3d5:0:b0:336:4372:748d with SMTP id m21-20020adfa3d5000000b003364372748dmr345981wrb.121.1702485962593;
        Wed, 13 Dec 2023 08:46:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ac4e:a5fe:7f71:8d59? ([2a01:e0a:982:cbb0:ac4e:a5fe:7f71:8d59])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm13767115wrf.107.2023.12.13.08.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 08:46:02 -0800 (PST)
Message-ID: <c21ace70-12c0-4fdc-9316-341876b871a6@linaro.org>
Date: Wed, 13 Dec 2023 17:46:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8550: move Soundwire pinctrl
 to its nodes
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231213162856.188566-1-krzysztof.kozlowski@linaro.org>
 <20231213162856.188566-4-krzysztof.kozlowski@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20231213162856.188566-4-krzysztof.kozlowski@linaro.org>
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
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 1f06fd33d1ce..d8f79b5895f5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2050,8 +2050,6 @@ lpass_wsa2macro: codec@6aa0000 {
>   
>   			#clock-cells = <0>;
>   			clock-output-names = "wsa2-mclk";
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&wsa2_swr_active>;
>   			#sound-dai-cells = <1>;
>   		};
>   
> @@ -2063,6 +2061,9 @@ swr3: soundwire-controller@6ab0000 {
>   			clock-names = "iface";
>   			label = "WSA2";
>   
> +			pinctrl-0 = <&wsa2_swr_active>;
> +			pinctrl-names = "default";
> +
>   			qcom,din-ports = <4>;
>   			qcom,dout-ports = <9>;
>   
> @@ -2096,8 +2097,6 @@ lpass_rxmacro: codec@6ac0000 {
>   
>   			#clock-cells = <0>;
>   			clock-output-names = "mclk";
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&rx_swr_active>;
>   			#sound-dai-cells = <1>;
>   		};
>   
> @@ -2109,6 +2108,9 @@ swr1: soundwire-controller@6ad0000 {
>   			clock-names = "iface";
>   			label = "RX";
>   
> +			pinctrl-0 = <&rx_swr_active>;
> +			pinctrl-names = "default";
> +
>   			qcom,din-ports = <1>;
>   			qcom,dout-ports = <11>;
>   
> @@ -2142,8 +2144,6 @@ lpass_txmacro: codec@6ae0000 {
>   
>   			#clock-cells = <0>;
>   			clock-output-names = "mclk";
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&tx_swr_active>;
>   			#sound-dai-cells = <1>;
>   		};
>   
> @@ -2161,8 +2161,6 @@ lpass_wsamacro: codec@6b00000 {
>   
>   			#clock-cells = <0>;
>   			clock-output-names = "mclk";
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&wsa_swr_active>;
>   			#sound-dai-cells = <1>;
>   		};
>   
> @@ -2174,6 +2172,9 @@ swr0: soundwire-controller@6b10000 {
>   			clock-names = "iface";
>   			label = "WSA";
>   
> +			pinctrl-0 = <&wsa_swr_active>;
> +			pinctrl-names = "default";
> +
>   			qcom,din-ports = <4>;
>   			qcom,dout-ports = <9>;
>   
> @@ -2203,6 +2204,9 @@ swr2: soundwire-controller@6d30000 {
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

