Return-Path: <linux-arm-msm+bounces-68826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2ECB22BF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 17:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55885620402
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 15:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC419302CBF;
	Tue, 12 Aug 2025 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhqohvny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF932D3EFB
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755013530; cv=none; b=H7znM1dFcQEF+qkDrbwHt8PFdh6emXoe4XPOFZLT9tAl+Kul3QZp+YEqSuoPAgot4/b1yvb0sfpawaH2AJ5t3muE3JOSaFnIqJjuhyujIR3vHkE1Gj9Tz81p+L9P49oxjKIiVAKTqrhqKQM/tOx0/W1GsRs0msF25XxS8oToK2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755013530; c=relaxed/simple;
	bh=5Se+F+1EMlhc69tsHduseJG4sR0ixpFpMm5/AlgsW7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J95A4mslVsoIMhLrJH/XEV2miHHUQpIGpTOvvuEZRTt8X+TCCMbDtSj0KLjo4LL/pDVATSmcgPJptGzULaOk90ghnGlC1M8YOzhz0MOXLLtB7A4wLMmLN4zIMH9PjGh1uA7azV8d4IAJ5llVRsSmc1BFHIF7gxmKxcMa5iFTZ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hhqohvny; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so9890259a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755013526; x=1755618326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w7CnICIdbhtr4UaouZj4YBT6fSBX0mSxz7ag9u7Kuww=;
        b=hhqohvnyDtrWigVBbztXbpu8l5A/E9ddO7x6hj2u6h+FGbe9xI9Qp93uXswdQ1znG5
         kaeB1/qlTlHDozUsqHjAYHViBI7Ix6BUepCamdBpWMi029STnXLmLnzOc2BVPOC6+VA9
         7eJEIr5roYWq8QsEf0fOCHVdoshjMCUpDZNcde0o6HJTNVXoEp/XXdrnvul3YuzmZFxV
         YQh1EPdScywB1jgCQIC3pVIgcKjKDF6VZ79H27aJUmrzZWcJxUmR+ZX/JY/F9Tbx3ubv
         JJB5FuJ7V5rFJwkzkUTfPq/4k3EcFuaQsYuCUp2fDGkTk4z4Ulij69ViMvLvrZ1OicdL
         GCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755013526; x=1755618326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7CnICIdbhtr4UaouZj4YBT6fSBX0mSxz7ag9u7Kuww=;
        b=WdgCmMdTsf6vi70XK6JiN9PgMZb5N+0Km9DsJF4MlkZ91k3tJSfC+ohWGXIP7XpmCq
         brixXTu9xOo+Zlh3w4BcL7Ai8ED0weMCTZZKpCWYOQEGhdLoWIpy06lGbKKp+TsGIHcV
         bPhJyMz5bSp3UjUK7RNXUyyTgyM1W4vwSvouSIbuQmTGUMR96u0OkGzL4keg2zeFvlc+
         zTo4iaPfu+N7vrTh7jX0IgIaMmaygFNZcv+mgmglxkBiDtM1qP0Y17AEwNegfvhuDBEJ
         R93z13TPSoT37z5BwSrnDWsJ8p98z0tbjcYGdwGKsKV/RUoRBKZm7+W/SCfZvFFjxgRT
         u98Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJdTC2bimDjDXIJHrzeuY2XuhIM/4s47D2Eu9iLaMBljYRIvG5WPiJgYhjO4cJqVGkCOSTZzAmlwqDr971@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/d67g+eXqNSD5Ukh82DkSnZRj9KoV23ge5Ul2P/0avSazwlo7
	8vLR9iC3t9j4z2a0/sgUKWunurnPZdqUOC64jqLwCnDpA/KBdLozCVloChwet/nqT1s=
X-Gm-Gg: ASbGncvnw3GBVC49sYIENSF3HgZNOMVPJ8x1ug7LnR5/anebBVEs1AuIDir3V3G2VZf
	RZk9xWzRi8ev8sQTci5hNJeQZzi7qZfBFGGDC2aGxOZeey+5eKsQYsenFC+UxfMW5ftxi1QB19W
	ZBAWWMBoAxQCEWRxYJcccoxrdGa40d5H1jYqh847Xabpi0X1UmPfAr5yCnNEeCRjV4LBnblukPp
	ksxL0HRW2Vyi/zy4SOUlKPzMO0SQW63zv+yrbzLcCnkwsKQ9E8Y1IDhrU4yHWsb8MPKy9nceAik
	pVipiFWUyh+CZXILVtR+NZ3yclZStupWfIGG1w363ZRaJLypOtdXq4fvg+TtaC4C6qrKwNe7lE7
	uFFOmpoaW7nCKEgVjGJrccWqlNsmI+FcWcCI84S64WYH34A==
X-Google-Smtp-Source: AGHT+IE/DFre7Dkj0Kr639ydBYp88P4MCJv/kcPa8lmuCXkFGm+IEWxy7IQ8BXl02A6K0PyH4aL3dw==
X-Received: by 2002:a17:907:3ccc:b0:ad8:87a0:62aa with SMTP id a640c23a62f3a-afca3986331mr19664466b.27.1755013525782;
        Tue, 12 Aug 2025 08:45:25 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:167b:7c8c:a586:8ebd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm2230386566b.86.2025.08.12.08.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 08:45:25 -0700 (PDT)
Date: Tue, 12 Aug 2025 17:45:21 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-romulus: Describe PCIe
 power supplies
Message-ID: <aJthkXa8BZMoW3CQ@linaro.org>
References: <20250812-topic-romulus_wifi_pci-v1-0-2adbed1b1f1d@oss.qualcomm.com>
 <20250812-topic-romulus_wifi_pci-v1-1-2adbed1b1f1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812-topic-romulus_wifi_pci-v1-1-2adbed1b1f1d@oss.qualcomm.com>

On Tue, Aug 12, 2025 at 03:47:23PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe the power plumbing to allow fully suspending the slot and the
> connected SD controller.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Are you sure these supplies really exist on the board? E.g. on the
x1e001de-devkit, Windows toggles all these GPIOs, but there doesn't seem
to be anything connected to two of them, the 12V supply is simply always
on.

Even more importantly, for a laptop I would expect they use some part
that doesn't need a beefy 12V supply. I don't have the datasheet for
RTS5261, but e.g. in [1] this chip is explicitly advertised with 3.3V
power.

I guess it's hard to be sure without schematics and it surely doesn't
hurt to toggle these GPIOs like on Windows, but perhaps a comment that
some of these likely don't exist would be good ...

[1]: https://www.sdcard.org/cms/wp-content/uploads/2023/06/SDA_computex2023_Realtek.pdf

> ---
>  .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> index 0fd8516580b2679ee425438cb73fd4078cb20581..3a4df8f8066ae699eb7d889530f976fce565757e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> @@ -331,6 +331,54 @@ vph_pwr: regulator-vph-pwr {
>  		regulator-boot-on;
>  	};
>  
> +	vreg_pcie_12v: regulator-pcie-12v {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_pcie_12v";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +
> +		gpio = <&pm8550ve_8_gpios 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&vreg_12v_x8_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_pcie_3v3_aux";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pmc8380_3_gpios 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&sde7_aux_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_pcie_3v3_main: regulator-pcie-3v3-main {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_pcie_3v3_main";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pmc8380_3_gpios 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&sde7_main_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
>  	sound {
>  		compatible = "qcom,x1e80100-sndcard";
>  		model = "X1E80100-Romulus";
> @@ -1022,6 +1070,12 @@ &pcie3_phy {
>  	status = "okay";
>  };
>  
> +&pcie3_port {
> +	vpcie12v-supply = <&vreg_pcie_12v>;
> +	vpcie3v3-supply = <&vreg_pcie_3v3_main>;
> +	vpcie3v3aux-supply = <&vreg_pcie_3v3_aux>;
> +};
> +
>  &pcie4 {
>  	status = "okay";
>  };
> @@ -1066,6 +1120,13 @@ rtmr0_3p3_reg_en: rtmr0-3p3-reg-en-state {
>  	};
>  };
>  
> +&pm8550ve_8_gpios {
> +	vreg_12v_x8_en: 12v-x8-reg-en-state {
> +		pins = "gpio8";
> +		function = "normal";
> +	};
> +};
> +
>  &pm8550ve_9_gpios {
>  	rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
>  		pins = "gpio8";
> @@ -1082,6 +1143,16 @@ edp_bl_en: edp-bl-en-state {
>  		input-disable;
>  		output-enable;
>  	};
> +
> +	sde7_main_reg_en: sde7-main-reg-en-state {
> +		pins = "gpio6";
> +		function = "normal";
> +	};
> +
> +	sde7_aux_reg_en: sde7-aux-reg-en-state {
> +		pins = "gpio8";
> +		function = "normal";
> +	};
>  };

I think you should either do a full configuration (include power-source
and everything else essential as well) or omit this entirely, because
like this you will need the proper configuration from the boot firmware
anyway.

Thanks,
Stephan

