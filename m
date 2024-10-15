Return-Path: <linux-arm-msm+bounces-34460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E69199F080
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 17:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4821F1C232B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 15:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDD61CB9F8;
	Tue, 15 Oct 2024 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fvpjX7ln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CCF1CBA09
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729004247; cv=none; b=cgDVN5ORttXy5yh1exeBgN23TA4N9jDpDkVdPM1jWdGtbyMK412GkCBLBc6mdKOC3gs+XpRFX75PCrD18JnBIkbj1msXsqLVai9j2s4HaAjSncF54EHbEq4oY1Ayrogzc8PIYTiYzqv7uFCnnMgp8UcQvic9huAgUH4MmEDs87M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729004247; c=relaxed/simple;
	bh=SlICqBZXrQRrlbYBRBFsm9lw6h24q5u37vave91lLI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuHT7Q20O1Wn4Q14CrAq6v0+K8EN3VifmKYj+s4kdKezcdnDOa382giJ8+SS3Alxp60Fy3R2XkZzkTBVs+RLyT/bhTpAiK2i2BK4rLTLsZqRaYINanCsAMXxR5rh2Rs0a730HSv6crB9WYNmMnRciOmkZOXDamIRwFavbWx7/wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fvpjX7ln; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43057f4a16eso47856865e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 07:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729004244; x=1729609044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dd/y4e5VLsv45xhA5HVGa4kwa+DBg+30cli4MtlNzRs=;
        b=fvpjX7lni4jFERnsxFhJLjlaA2tYfaisIdv2ofeLfwqm1FZ3u8xxSqHOkrTbjjdRNe
         vJCw502B0oTuVIltcLp0T/cSWSWjnZecR3f9TJhFwGnXhxiuPDI3syE5NpLvyasgKCEJ
         DGM7hWFSWCcWiWL9RiHpCVR99PyWf17grU+jAC65DpyP+JAiXrlduh2dXfrdeFvHZobF
         tZdHyt1RdI1Upmu2ImdZJfHzsu8hCGOGVgvNrMqVhoZC3qaKN/9lblSwm6zmPiqgHJ/w
         YYjfQL7tyPATZgXogZpGfRK0QLFN/OerkPE0yyxK4bxtAZsqb7sLzwJCca1dlsPMhkyd
         y5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729004244; x=1729609044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dd/y4e5VLsv45xhA5HVGa4kwa+DBg+30cli4MtlNzRs=;
        b=TRxCdcItnjMpcSNiQvF43JB+zhT1KbR3e7OnGOAQxx1Pc9bHhIBDD3K3V9Ea9IHJZF
         yiYNcq2jp9RQ/4b+xF/Y1TklmcmdacOh6WKmKXFTz/H6eCw9stIPlX46UHjXRyL6Me+3
         CoVDfCVgeVdGbxJYVG+J3Z7nR032/JsWVpbQQO7gKSCwMNYzL5VPsHR1B3niw0624NaX
         kV83GuVY2Dnh6uhHws2TCtEg+fksLdeOELFumu5Nfso5j/MeTdswJKBa2qgf/dtTPDIq
         JQ16ZG3Ia0xXkPCM44M7VrWiJn24CpEUIq1JI/2n+Mmbg1h8tFNa6Q6Ele4FUuLZcFtz
         GM6g==
X-Forwarded-Encrypted: i=1; AJvYcCU4kJ7uffi+K9PD4RoOWipcALvyvLiX8x1SQOFrUKryBbfxvnPnIu+DYXBRqL7CfLcvqvS5WoAmALTKgx5a@vger.kernel.org
X-Gm-Message-State: AOJu0YwLyt9S6k6tqb0VHR+/EmztmHQkJ7OQHDn5RFZFJAugbFCXkbHN
	h1ZL5lAcKCUIQl7B7RitbAP3dQs45h2j5GbY5XE/PwxM9r6E41RjyYFLMYD9JjU=
X-Google-Smtp-Source: AGHT+IHQ7R4nBExzm5obkauib5uoXD+Q+dcoKzQHxjHFC5ayr61rq+06s4us4vX2nYJ7a6xxImhbzA==
X-Received: by 2002:a05:600c:4e46:b0:42c:b8cc:205a with SMTP id 5b1f17b1804b1-4311df5644amr149049145e9.32.1729004243748;
        Tue, 15 Oct 2024 07:57:23 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef80:d7:7e1e:c886:6f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc11aefsm1765066f8f.93.2024.10.15.07.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 07:57:23 -0700 (PDT)
Date: Tue, 15 Oct 2024 16:57:18 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: x1e80100-crd: describe HID supplies
Message-ID: <Zw6CzgluMauSdl2j@linaro.org>
References: <20241015122427.15995-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015122427.15995-1-johan+linaro@kernel.org>

On Tue, Oct 15, 2024 at 02:24:27PM +0200, Johan Hovold wrote:
> Add the missing HID supplies to avoid relying on other consumers to keep
> them on.
> 
> This also avoids the following warnings on boot:
> 
> 	i2c_hid_of 0-0010: supply vdd not found, using dummy regulator
> 	i2c_hid_of 0-0010: supply vddl not found, using dummy regulator
> 	i2c_hid_of 1-0015: supply vdd not found, using dummy regulator
> 	i2c_hid_of 1-0015: supply vddl not found, using dummy regulator
> 	i2c_hid_of 1-003a: supply vdd not found, using dummy regulator
> 	i2c_hid_of 1-003a: supply vddl not found, using dummy regulator
> 
> Note that VREG_MISC_3P3 is also used for things like the fingerprint
> reader which are not yet fully described so mark the regulator as always
> on for now.
> 
> Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 34 +++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index 10b28d870f08..4ab7078f76e0 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -288,6 +288,23 @@ vreg_edp_3p3: regulator-edp-3p3 {
>  		regulator-boot-on;
>  	};
>  
> +	vreg_misc_3p3: regulator-misc-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_MISC_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pm8550ve_8_gpios 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&misc_3p3_reg_en>;
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>  	vreg_nvme: regulator-nvme {
>  		compatible = "regulator-fixed";
>  
> @@ -689,6 +706,9 @@ touchpad@15 {
>  		hid-descr-addr = <0x1>;
>  		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
>  
> +		vdd-supply = <&vreg_misc_3p3>;
> +		vddl-supply = <&vreg_l12b_1p2>;
> +
>  		pinctrl-0 = <&tpad_default>;
>  		pinctrl-names = "default";
>  
> @@ -702,6 +722,9 @@ keyboard@3a {
>  		hid-descr-addr = <0x1>;
>  		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
>  
> +		vdd-supply = <&vreg_misc_3p3>;
> +		vddl-supply = <&vreg_l12b_1p2>;
> +
>  		pinctrl-0 = <&kybd_default>;
>  		pinctrl-names = "default";
>  
> @@ -721,6 +744,9 @@ touchscreen@10 {
>  		hid-descr-addr = <0x1>;
>  		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
>  
> +		vdd-supply = <&vreg_misc_3p3>;
> +		vddl-supply = <&vreg_l15b_1p8>;
> +
>  		pinctrl-0 = <&ts0_default>;
>  		pinctrl-names = "default";
>  	};
> @@ -854,6 +880,14 @@ &pcie6a_phy {
>  	status = "okay";
>  };
>  
> +&pm8550ve_8_gpios {
> +	misc_3p3_reg_en: misc-3p3-reg-en-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		bias-disable;

Can we add a "power-source" here? PMIC GPIOs can be either ~3.7V
(VPH_PWR) or 1.8V, depending on which power-source is selected. Without
that, we rely on the firmware to set the voltage level for the GPIO
during boot.

I'm not sure which one would be suitable here. I guess we can just
replicate what the firmware configures during boot.

Thanks,
Stephan

