Return-Path: <linux-arm-msm+bounces-78017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C76BF1A57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 15:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E24C24F8C5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 13:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAD031B10F;
	Mon, 20 Oct 2025 13:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iDUw3PpE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5193331B11F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 13:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760967963; cv=none; b=QjotjEMhmcWMQK0XmL4lRRuDcAIGX7i2CTzGY9A4hJR2TOdQ/xEy0rqp3u9JY5naMTJjlB3YzZwpQgnF4CHBbfMbdfLvzxRLfyzZJTF5EfPrIHq4HjZK4AJ4dFr3EsU2sW1ddyIJk5fG2YnIGa+7fzPP8Gm3LBVVYpj7BmO1vZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760967963; c=relaxed/simple;
	bh=tqmAXFIUqMJJYe2TezHGEYoHz+RbiIgC7MYcdc7oCuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YgBKjjhRIL7a6u6RYCybecKCAVnGqHpLXePPc+lhtjRjTs2ktjO3hhY3Ldsr4QrQzxManBRKxeP1EAoLFT2jgRdVgivW+SDpoIX7kCuv/avHDDYv7AMh3XPzGA/hTD9dADuvg14uDXfvW8ZtE228Fgf2O26eEaPdtW3ANw6VD1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iDUw3PpE; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-63c09141cabso6515391a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 06:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760967959; x=1761572759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UsdSXxtK2e/jSRjlYL+PvN4ai9sNqYnnc+D+KNBqw4s=;
        b=iDUw3PpENFEx3AmLQ1yCUtH2UCmmfLLQbvPqCMlz46mJahrCoVcXVEJ8832IV/VO+R
         Gu0RqmwcE7oTAy8szJyHe0SnzqpLsE9e/T8Vn8PhxuW0NivSzZWCX360SM1lbGaXiG/N
         DQ3M0q06//rJXwKPLKpCpDmFCFZwqDtlmNxSgsj44kAqeHAXklte2mKVpoQDFAp9p5Eq
         NFkVWjAtlByiJxFCljdJpkZk2xVFs+gAdj9G50G03IX4qmi6VTYT8i0Now1sfnnAib+z
         on/908xS8lHrsreV2CQwWOWMnQedbmEEmTzIkPP8Msd4y7rEDX7EXRv6uEI6HhGlBwQd
         t/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760967959; x=1761572759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UsdSXxtK2e/jSRjlYL+PvN4ai9sNqYnnc+D+KNBqw4s=;
        b=MaWb+URvhVLRHdyvq9WxZzjtfUDtKY/0PohPtBnOIdelGjYjy4yE5dYEDbOnL/t5vO
         coWeKpbNQthFxBq0Qt6Xcv42wbZQobYHRKXHCMzlFRiIDIhVbiM1QcdFDD2VVK2G6NxN
         WUBoNulpv8D4O42YWBhDlHgEnrlGJQfzes6UXb7jhZxJqlguN7t1g2Y4CJjzBJ/Q9OKP
         rRz66jPKjtqPeKBlg0vFRiSncDzpZtALziDXE+iwICXSWacUyVMwVi30mzn+ufdYpZJG
         BkHJA340whMpV6bkAR0AFsfViOcBYky3A9Xz9zN4JnUMgCUlsh/lKrt75qJzcyFI3myL
         lRrA==
X-Forwarded-Encrypted: i=1; AJvYcCVOM0VnKgfFEQXBvs2vy+6pLcWGYD6XG2VcwLS7QBGPQymqUjDen2xjRm2PstGnusIytkD6uWZk1GFrvFI5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp02oERXVfOeG6gsyIdYwedlm55jUi3ZJdVsMxkEhQKTRvr5+r
	CNo5COsZcnXNgOzerjpHyICGsSMFFTF1iBHGX6bOtGT8r013Yk/Sdlg9K5xTbBDOkmQ=
X-Gm-Gg: ASbGncvOW3X7m+pNu/QX/2lrUb5dEdwk8K3BboQA2TUYW7CwGwg+oYSr0LqX66mC4jx
	tnHPrQUEs+Y63fij5mk79NPnxPl3aWrJbYpJIa2K02zYR8HNBIaIYoj4otQLQcTW+st4RnKhVmc
	u801jFIN44XuKNJW3gZvURnq9zuLnwpUmZyZvkv0+Hm6crHubJW76bJ2KkW7YlL7PKpEd6w8JuL
	7cMtIT3TSZIGcMRmGJiG5/LO3NopCHgQXJKgJS7uvbqCxEFXmsI8aMZqeW22MpehY83m3r0qQxq
	ojvuZ/zBMS9YHY4leqnl5qgulb3RVg3jiQqK4hygPLgIGJ+IZ4Z8IQsdMTPSt9YPBIjEbA+rLzV
	SH2JOzXMyeyqYILt3eZ06O79HmCtMSFM6U1/DxXQ2w+TCUAvO6f/MnzNHdJBOaCnUyYW+OW2HMJ
	shgHBiaH03TQ4c8virLqU6e2LhIkR6p5WYeqhyBXsW5L5L3ncJHu0=
X-Google-Smtp-Source: AGHT+IGtChbu+BFRFgmruupaHMS+YTJq85VdKiOgnQsI1T0cofPdNHTi4Ln+S+OBz5ucIxqGiunGkw==
X-Received: by 2002:a17:907:94c1:b0:b4f:ee15:8ae8 with SMTP id a640c23a62f3a-b647453ff06mr1403971766b.58.1760967958539;
        Mon, 20 Oct 2025 06:45:58 -0700 (PDT)
Received: from [192.168.1.36] (p5b29e551.dip0.t-ipconnect.de. [91.41.229.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb725f3fsm793159666b.68.2025.10.20.06.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 06:45:57 -0700 (PDT)
Message-ID: <aeb9a34a-d9ea-4027-9f61-beae73498266@linaro.org>
Date: Mon, 20 Oct 2025 15:45:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: sdm845-oneplus: Describe panel
 vci and poc supplies
Content-Language: en-US
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-2-ce0f3566b903@ixit.cz>
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20251016-s6e3fc2x01-v3-2-ce0f3566b903@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/10/2025 18:16, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> There are two additional supplies used by the panel, both are GPIO
> controlled and are left enabled by the bootloader for continuous splash.
> 
> Previously these were (incorrectly) modelled as pinctrl. Describe them
> properly so that the panel can control them.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")

This Fixes: is not correct, it should be the commit that first added the
panel to the DT since it was added after the initial DT.

The driver changes also need to be backported and may not apply properly
to stable kernels, so we should be careful with this.
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 46 +++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index dcfffb271fcf3..1cf03047dd7ae 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -162,6 +162,34 @@ ts_1p8_supply: ts-1p8-regulator {
>  		enable-active-high;
>  		regulator-boot-on;
>  	};
> +
> +	panel_vci_3v3: panel-vci-3v3-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LCD_VCI_3V";
> +
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 = <&panel_vci_default>;
> +		pinctrl-names = "default";
> +		regulator-boot-on;
> +	};
> +
> +	panel_vddi_poc_1p8: panel-vddi-poc-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDI_POC";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 25 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 = <&panel_poc_default>;
> +		pinctrl-names = "default";
> +		regulator-boot-on;
> +	};
>  };
>  
>  &adsp_pas {
> @@ -429,6 +457,8 @@ display_panel: panel@0 {
>  		reg = <0>;
>  
>  		vddio-supply = <&vreg_l14a_1p88>;
> +		vci-supply = <&panel_vci_3v3>;
> +		poc-supply = <&panel_vddi_poc_1p8>;
>  
>  		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>  
> @@ -803,6 +833,20 @@ hall_sensor_default: hall-sensor-default-state {
>  		bias-disable;
>  	};
>  
> +	panel_vci_default: vci-state {
> +		pins = "gpio26";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	panel_poc_default: poc-state {
> +		pins = "gpio25";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
>  	tri_state_key_default: tri-state-key-default-state {
>  		pins = "gpio40", "gpio42", "gpio26";
>  		function = "gpio";
> @@ -818,7 +862,7 @@ ts_default_pins: ts-int-state {
>  	};
>  
>  	panel_reset_pins: panel-reset-state {
> -		pins = "gpio6", "gpio25", "gpio26";
> +		pins = "gpio6";
>  		function = "gpio";
>  		drive-strength = <8>;
>  		bias-disable;
> 

-- 
// Casey (she/her)


