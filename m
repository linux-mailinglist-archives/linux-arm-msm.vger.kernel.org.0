Return-Path: <linux-arm-msm+bounces-20783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB958D1F66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 17:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F6891C22B9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 15:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100F31E868;
	Tue, 28 May 2024 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yswwuHIz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE6D1E891
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 15:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716908433; cv=none; b=UyU0XNlkV1kVXq9ku0eSWOd5xUC8U574uRCYC91ofpMeJ2MBfb7MqZIxJNpprYtUgRKsvby7jr5rAbMEh8WFVhketfrb0IEubFC6ZP2db8Ay8j/PaX/lwtpdI5/38nJG1ZX98rs0RezAc2ZnqcHekEiJq4+LpZgi/yYIpy/heH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716908433; c=relaxed/simple;
	bh=sFflAMdjoQiTbx603wKm7ggKrOJxx87UdHmFwYGLBA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmBcJ/ZFssxkOAcErUJ/ZuXUEZ43p0VZ0Vfl27Gzg7viZ5iMvUZaDjk7er6as/Nw9MVTlMO4oyJIAOFIbDIXbj4RnV1bCexRcwtudTlBPZMpbxEW2vU+pqlwQjgtVxg1EXK888mi9hFHtIm8zfTrFdImihBFEyiVIXtu8toe4lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yswwuHIz; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5238fe0cfc9so855286e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716908429; x=1717513229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQLDNg8O6+hQgxFwT/fnrp+FvryuIO9RpOZ2Sw+T6pE=;
        b=yswwuHIzaE0IFWlD7DPy1QCalRyKXFAfZIuea937DT26ssIgQrPzkw1+IhPY0ct5fc
         tGTIN5mgT3kudWhjvSTKtf6awJSiTtvS+1vL5N/UpAiCQcTKNrsjirKbTiNEkAobyqhL
         ioi0IIODAk7f9hAPFP2cfKmjUbp/UbaEGJPO+NnevrAb1aIN239w9L86w6fg94l12vSV
         BOYMjugu0hmkfTi728UvsNFXzO73RsGcoWDFhAKRSZKiWqItFXFA4M9Fd0DRbkJ1ChLl
         +WuunQ9GcXMHh2tB08x8OZaoscBB2ExeIola9jjf9tjB4SuN0b8OtVmrib2HVqfSokkz
         fRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716908429; x=1717513229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQLDNg8O6+hQgxFwT/fnrp+FvryuIO9RpOZ2Sw+T6pE=;
        b=RVARwBrK+3z/zSgMUUJlrL326fm2VBfhBGyv0yq9NjIMLNwbqf6lEFu+2tQhEnoD2v
         6JLDMfeCrEasrltLudlZ7ecBb/F1Z/xvUbD2IOZiRb3ZhxF6/6PGe1l/rbgTzI9HCZbw
         2boqquL1lAWkyfBRiupM0FAD3pCoMgsj6sv+de6yF3kwj1yXrcp5mWjx1LPruAUh6qFq
         f7+bhYRDuAYSeP7caOzFEb41kSeTfEitWtFq1bT0kgDKa9PEDn9If0DxtrFYUgSN2/xF
         3B85QkyOsiqd1H11/GMKqEBiGWHHYVJf/T6hiZW2yKcrUukkYWu/t8RjwVer4GpH+Mtd
         00lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK8f0QBeY2EjZ3/T847DXQ6x6SYVqdpgOTAj86x5UZzAKFitTfZLunFEhUrAvrBhbSpJbMutyY8A5kdU8eLX2lvJSRhDPLwvhwdSXjcg==
X-Gm-Message-State: AOJu0YxUYy+RUKQjIUezuiCaQRzJEMUaXdk3Ydloecz8bp79ivFqFLWh
	w2C92q7juYncC79DDRZaAySIffmkF2mHtj2Fe4EWtmeF2lwjjq0EJJUVDR7gatE=
X-Google-Smtp-Source: AGHT+IEdsa2UN60LrNCMqTsQotHyrgBv9khZry0/8qJNslmQLn76O0THVCU1dFsmQKPJk6FJvjosKg==
X-Received: by 2002:a05:6512:3486:b0:51e:e5cf:9940 with SMTP id 2adb3069b0e04-529448abd40mr3832836e87.4.1716908428598;
        Tue, 28 May 2024 08:00:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529716ddfb9sm970448e87.306.2024.05.28.08.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 08:00:28 -0700 (PDT)
Date: Tue, 28 May 2024 18:00:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, quic_nankam@quicinc.com, 
	robh@kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
Message-ID: <rs7m73yzuvm5rf52tyax57r33iigalplr2z7rrxm7mktdqa3bf@ecapopn7ufho>
References: <CAA8EJpo=Q4_=JU83-9ooSqiSr=xUeHh2awDhzq9q3Xd56h83zw@mail.gmail.com>
 <20240528141954.7567-1-quic_vvalluru@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528141954.7567-1-quic_vvalluru@quicinc.com>

On Tue, May 28, 2024 at 07:49:54PM +0530, Venkata Prahlad Valluru wrote:
> Rb3Gen2 has a lt9611uxc DSI-to-HDMI bridge on i2c0, with
> reset gpio from pm7250b gpio2 and irq gpio from tlmm gpio24.
> Bridge supplies are Vdd connected to input supply directly
> and vcc to L11c. Enable HDMI output, bridge and corresponding
> DSI output.
> 
> Signed-off-by: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
> ---
> v4: added fixed regulator for vdd

Please don't send new iterations as replies to the previous iteration.
It might be ignored or mishandled by the tools.

> 
> v3: - Updated commit text
>     - Arranged nodes in alphabetical order
>     - Fixed signoff
>     - Fixed drive strength for lt9611_irq_pin
>     - Removed 'label' from hdmi-connector, which is optional
> 
> v2: Addressed dtschema errors
> 	- Fixed lt9611-irq
> 	- vdd-supply error to be ignored, as it is connected to
> 	  input supply directly, on rb3gen2
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 94 ++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index a085ff5b5fb2..7f00fca131a2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -52,6 +52,25 @@
>  		};
>  	};
>  
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&lt9611_out>;
> +			};
> +		};
> +	};
> +
> +	lt9611_1v2: lt9611-vdd12-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_1V2";

Is it the regulator / net name in schematics? Or is it also used by any
other consumers?

> +
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +	};
> +
>  	reserved-memory {
>  		xbl_mem: xbl@80700000 {
>  			reg = <0x0 0x80700000 0x0 0x100000>;
> @@ -530,6 +549,46 @@
>  			   <GCC_WPSS_RSCP_CLK>;
>  };
>  
> +&i2c0 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	lt9611_codec: hdmi-bridge@2b {
> +		compatible = "lontium,lt9611uxc";
> +		reg = <0x2b>;
> +
> +		interrupts-extended = <&tlmm 24 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&lt9611_1v2>;
> +		vcc-supply = <&vreg_l11c_2p8>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9611_a: endpoint {
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9611_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &i2c1 {
>  	status = "okay";
>  
> @@ -587,6 +646,21 @@
>  	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>  };
>  
> +&mdss_dsi {
> +	vdda-supply = <&vreg_l6b_1p2>;
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&lt9611_a>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi_phy {
> +	vdds-supply = <&vreg_l10c_0p88>;
> +	status = "okay";
> +};
> +
>  &mdss_edp {
>  	status = "okay";
>  };
> @@ -711,3 +785,23 @@
>  	function = "gpio";
>  	bias-disable;
>  };
> +
> +&pm7250b_gpios {
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins = "gpio2";
> +		function = "normal";
> +
> +		output-high;
> +		input-disable;
> +		power-source = <0>;
> +	};
> +};
> +
> +&tlmm {
> +	lt9611_irq_pin: lt9611-irq-state {
> +		pins = "gpio24";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

