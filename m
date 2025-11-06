Return-Path: <linux-arm-msm+bounces-80539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5E4C399DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 09:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DF311A2363D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 08:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47FB308F2E;
	Thu,  6 Nov 2025 08:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AXbiUoiK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E61308F27
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 08:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762418588; cv=none; b=XpR7pmWjLyQXWus6VLcFa2eqUnA7rbUbupIE5noffPAWZy04jZUmxTkTAA/CNEtOmip8AtssaqcDHitO7uK22/V14G/AIzpHvZuxUlmAFiYHf0knZG4jkeTQPYbIJkN35dtD3RFIUrT+K0OXz/xHB+5BkyHaHXenDQ/ES+e+LZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762418588; c=relaxed/simple;
	bh=v2YRLhXm0HrSxf8BfnjaxENfVrRRGKx6UO6gEm876iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJv74XemvXF9qiwx7h1xf+YvhUhNtLOeDyLfF1sGJRFtPy/OKmmzCJW96/sjg8o7uX6g2pIRHsOXFAxkqw7HKyCsOVKAD6DuVZDto1UQ4WKPmuAU1K/sP35Ms1S2BHke0hTXWnC2GCsLLJ/Z0oMRRe55xBEdbgR0bM85kix/Tso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AXbiUoiK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47754e9cc7fso4290235e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 00:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762418585; x=1763023385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CEZG+cPMJvuhS066wIUvNEiIclF+bAdS7OADAJRzuRM=;
        b=AXbiUoiKwSEwThe20kSTf78zkHpVd/2/3SqzU5MOBRHnhqE3mTEYqd6hpTPEoNxDE6
         wV+DIqjENsTYICmtrViu/MW8NXB9VhXDDR+Omye/uT961VCM5awgSu/kQdQG4w4jYxVA
         q2frONyxUILlcJlJ1t6RAKpamMxhg5rzysN6A4CgxSLMeJTpGeMiVCmWzP183xK7Ckw+
         HMbF+q0OJibWGZYzBY8wfLHmBHV+BvWbH4XO34JPYJyRzHuJIkBTEyhO2bScg6F9ZmyT
         J2p9pfOrFikyVs3tXlLJpH9zziKb1q0HayI1Y2Bs7+/xrsG+Ju189ERklaZBJXEu5+m3
         fQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762418585; x=1763023385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEZG+cPMJvuhS066wIUvNEiIclF+bAdS7OADAJRzuRM=;
        b=BvkveB0hsG26uEYrka66rQVEloCBdec6D5WRumtomv5mdeFn4gGxlP2JUWT06PAXp3
         kmH9G8/cTipd8B1gldrNet+lwt/3UkkS8jNnsj5BvSPw5JNZuRpI5QHrCThuuIkVeSes
         uw0tJmzHXJHgK2SuYqV8QAuhN39hdtfMGZli8b2sk4RTsW3NHVp29CsA7VhLb8SH8f4S
         Jzx750657goGSJky1YMRBJiEWzJbxa6tvPWaV8M3zfQ5lZIlZRoJ0EXLrhyA5ATkdhsn
         RB+dD7PPCsY+9TazIVaLa6QwtxmC1fG1pKklPqzdiQ+PWXFWQ3Eq2teE1uSAheBF4hMl
         qwyw==
X-Forwarded-Encrypted: i=1; AJvYcCWfZiV5GOozD5ndhIRX6FIDwidnqT9rh+rmOlH1YAoOVD1wA3NJS43/CTvd/Ove0V7CbIsQUIePb3IG1pFk@vger.kernel.org
X-Gm-Message-State: AOJu0YxSnIzLSU2rBtRI+IvyUAAaP7sqnew659fcZD9JMQixc2o+G9qM
	OsjCwdl1QsAjA7ypAffVU0XL88D6+IRyaypuTTMB5QYgdpz2rEKY57iWeyzeHc5auMg=
X-Gm-Gg: ASbGncvN/gw39X6MP7KnAKj6r2FyP4jTUL1xlV9zMmhuFVGeYOB6E278IkfrEqWSYIh
	R5tY19oRdYxXkGx6nfiOa0v93YXI57JMNVmBiWeTxjxZpuDtfNmYTSIeKkz8Wtsm+MyJrV7WKL8
	DP6V9gS71AuvkhJMlEPZbhDjjuqca6FodFD9PNseJgGPiH8BXpdclEaRjiGUGzvPIHBMhhTi59a
	xBWPCFfJZcitaxe4QOm0Y7q+CnquLefBP2GXI9LTxefrtvdvUt0ee+iZfpVAPNS56iBSk+5vtqe
	Vo132qwFNr9viV1S8seSBdezLBnHjpUjRXlNumhjfMaedTqbfrIfJQHycndAiOoXktJYkZagQQ1
	jWHHw/quo6da0bJDgN63qIRyDKqqSPoxKgsrvAgd20428X6vqCJ4mDKv5BYBmrGQAwtEyFhZZFg
	fN5O0woyQ=
X-Google-Smtp-Source: AGHT+IHG3bk5k/CAUj7UuEtNvG0FbRc/6YbDxKYe2c7MR76MuFl90nA72JE7FrRjCKkX4v4cMMJrfw==
X-Received: by 2002:a05:600c:5486:b0:477:5a30:1c37 with SMTP id 5b1f17b1804b1-4775ce9de52mr52438205e9.41.1762418584714;
        Thu, 06 Nov 2025 00:43:04 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477625eabf3sm40097725e9.16.2025.11.06.00.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 00:43:03 -0800 (PST)
Date: Thu, 6 Nov 2025 10:43:02 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: Add backlight
 support for eDP panel
Message-ID: <vycaiobp3kpwu5pntzwbbzyp753ugvprkiu5sf45een2mu433m@2rbvtg5y5hw5>
References: <20251106-hamoa_dvt_backlight-v2-1-9f844c8f8110@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-hamoa_dvt_backlight-v2-1-9f844c8f8110@oss.qualcomm.com>

On 25-11-06 15:12:06, Yongxing Mou wrote:
> Previously, the eDP panel backlight was enabled via UEFI. Added backlight
> control node in kernel DTS due to some meta may not enable the backlight.
> 
> Aligned with other x1e80100-based platforms: the PWM signal is controlled
> by PMK8550, and the backlight enable signal is handled by PMC8380.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
> Changes in v2:
> - Add hamoa-iot-evk to the commit subject. [Konrad]
> - Correct the property order in the vreg_edp_bl node. [Konrad]
> - Link to v1: https://lore.kernel.org/r/20251028-hamoa_dvt_backlight-v1-1-97ecb8d0ad01@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 55 ++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 36dd6599402b..454aad40de34 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -17,6 +17,16 @@ aliases {
>  		serial1 = &uart14;
>  	};
>  
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmk8550_pwm 0 5000000>;
> +		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&vreg_edp_bl>;
> +
> +		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> +		pinctrl-names = "default";
> +	};
> +
>  	wcd938x: audio-codec {
>  		compatible = "qcom,wcd9385-codec";
>  
> @@ -183,6 +193,22 @@ vreg_edp_3p3: regulator-edp-3p3 {
>  		regulator-boot-on;
>  	};
>  
> +	vreg_edp_bl: regulator-edp-bl {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VBL9";
> +		regulator-min-microvolt = <3600000>;
> +		regulator-max-microvolt = <3600000>;
> +
> +		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&edp_bl_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
>  	vreg_nvme: regulator-nvme {
>  		compatible = "regulator-fixed";
>  
> @@ -819,6 +845,8 @@ &mdss_dp3 {
>  	aux-bus {
>  		panel {
>  			compatible = "edp-panel";
> +
> +			backlight = <&backlight>;
>  			power-supply = <&vreg_edp_3p3>;
>  
>  			port {
> @@ -879,6 +907,22 @@ usb0_1p8_reg_en: usb0-1p8-reg-en-state {
>  	};
>  };
>  
> +&pmc8380_3_gpios {
> +	edp_bl_en: edp-bl-en-state {
> +		pins = "gpio4";
> +		function = "normal";
> +		power-source = <1>;
> +		input-disable;
> +		output-enable;
> +	};
> +
> +	edp_bl_reg_en: edp-bl-reg-en-state {
> +		pins = "gpio10";
> +		function = "normal";
> +	};
> +

Drop empty line.

With that fixed:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

