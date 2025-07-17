Return-Path: <linux-arm-msm+bounces-65531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB8DB091FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 18:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDA11189F7CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8005A2FA643;
	Thu, 17 Jul 2025 16:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cIIwaBCE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E351DA62E
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770281; cv=none; b=XmozbUMPxrz4+AJJF2/o1HWm/Nb7yk87HS5BLIL9gPMoovUpyASFhKP60pCrl86V9uYHwvvd4/QSdoYXFyxKDU4+jVsNDttKjYHgFp4O+dmMQm1SjyVcWbZ8gz+j6k9NnZC4d56kZu1VvlDgv7OjtIjE5FwPzZvFvsNm/FWB1uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770281; c=relaxed/simple;
	bh=ZGdCrhfuQwNlpZugbUeh+YvGN4hJmVbFRWO2l5ySunQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdcyDyXt5OvwnoJmvf074tLmSkotl/c4YzqDv56eFGKB8PqMa8jtNH5r6h5DRaS/JWpGWUeO6EyuVa0r6ox2PKNwInvWeAATBNBm0pclMiaGFeHOIuyzuiNDij/3GYdMepPkmScVEEE56L44eVvs0VQd0Yk7jLpFjL+N6vMtr9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cIIwaBCE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a588da60dfso743828f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 09:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752770277; x=1753375077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ixdz2azUt5m+0HQygOUjX6ao2OrLdLt2TO2+338NjZ8=;
        b=cIIwaBCEF8Ngm0fNIppa1WuN34MWTo0soJa7hGJGieTiKsuwk8uAcq/434VA8A36bu
         cqMV07NGxLSbatMAlnLn6aDbpCsZhP3O/a82KDHNpPKqOyOwFIKxu+OFoMFS7a7vwwv5
         V7B3pANEaP5BgwX/fFmhYo4KkrMHOb2SSOJSnzhdQuQCrsCg3IZeH6NiIKnTArIf61HH
         NgIFEKJov2qLWfCgjQayNGkKQfsP/Lk+6uLa3KzIxZGkmxLEP5VKGGbXsyONEv5G0CRH
         HVU2STFoNCffPxhvg10uBbXzwmW3aIq6l0N6lUrBHQURAz0jUhpzJcASthPYowMfhBF3
         sv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770277; x=1753375077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ixdz2azUt5m+0HQygOUjX6ao2OrLdLt2TO2+338NjZ8=;
        b=gyYnM3aYCmmzjgvwunAGlghsj5LvbsGaQxyKHxsuTVcJC8YErGPRsJi7PmlqCWXMdT
         Me96e07LcU8k+IrqeSJRuLrgSXGsX+/5bkYcZC6eXeVuecm92PcZV0gpulJnOYqqElzV
         /Y2lZsBYQr9oo67EX4zPxcBj8+vGJcJmPM5xcJXOVbV+c3UU1fHKnyIx6SuGT7UDS53D
         0B3K+K/c0MGlOqmzhpTY5egCw3MF/ZgHOT6inBfBFMwbw0YZ+jR/jzeM7PaLPbs++VWo
         j0hCuGkFIMnZO4RPFWabBxyWG85ublSSfWqiWysQn42tllP6rbLwfvc/F2JO4KGmnaqs
         QODA==
X-Forwarded-Encrypted: i=1; AJvYcCX7wr5zdxkCPoT/1q6MxVVOy0ZKkkHFzYGaLqtjoqrW7sJfCoMcP2+WVRPN8mGU1ADBZ+UdAo1JGYyDxL9c@vger.kernel.org
X-Gm-Message-State: AOJu0YysViEHQKuD9vAd91pGbffnWvr3SCddokEf70OBUreVpSkTW5gg
	hRulM1av8vjdrWMazm+qakCUof5W73/p+BhT8cg8O2I75NOMugTdb7aN/JPCp4MMnYo=
X-Gm-Gg: ASbGncvX+6kRTm1gO2CwmRG6UlHq5peKQBrh6ozZMt5EQZyr6Pdl+gGbedKd3McIuj0
	duU4qfq7C03aVQzA0JgKEdZh6/IjF5BC3xC26AD5SVPBp+Lm6s2b7k4fa1lFEWTn4BA0X1BjTQ6
	qwDT4KTjoNZX4+PIsdNgcgWtAIf6OdfxGMzyEdO9cRLAD9LDWQQNdxG63D7sNc/WzM8vvCaQgdh
	YmUzYQkvqjzbpsX4j9DWFSMFfG/4Usbs1aY4SHIil4iMn5Tjj04eSHwbpdk97B1Sqdy5UZrB6t8
	W9C+Qcemh8V26TZJizJwT2LTuusJvKA+BfUjQjV4Y5xY1p7l3v8f6xwCN6YasZmwhDGsKG3YpMz
	AawbeaPlDokT2n1kWsnAp+AjrIhhNtcC8UvIBIQvV4gly
X-Google-Smtp-Source: AGHT+IHHFts0Aarz6/qK5tPczZMXGwvgojI2uqI+Zt7jBxut+q77lCloBtFOMIkhLT1YgDmMw+oO/w==
X-Received: by 2002:a05:6000:1a8d:b0:3a4:f6b7:8b07 with SMTP id ffacd0b85a97d-3b60e51c9efmr6883618f8f.48.1752770276833;
        Thu, 17 Jul 2025 09:37:56 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:79a0:386f:8c5a:9506])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0dbddsm21408946f8f.63.2025.07.17.09.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 09:37:56 -0700 (PDT)
Date: Thu, 17 Jul 2025 18:37:54 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
Message-ID: <aHkm4qjgSaklHGp0@linaro.org>
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
 <20250716-hamoa_initial-v1-4-f6f5d0f9a163@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716-hamoa_initial-v1-4-f6f5d0f9a163@oss.qualcomm.com>

On Wed, Jul 16, 2025 at 05:08:42PM +0800, Yijie Yang wrote:
> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
> the Hamoa IoT SoM and a carrier board. Together, they form a complete
> embedded system capable of booting to UART.
> 
> This change enables and overlays the following peripherals on the carrier
> board:
> - UART
> - On-board regulators
> - USB Type-C mux
> - Pinctrl
> - Embedded USB (EUSB) repeaters
> - NVMe
> - pmic-glink
> 
> Written with contributions from Shuai Zhang (added Bluetooth).
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile          |   1 +
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 835 +++++++++++++++++++++++++++++
>  2 files changed, 836 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4bfa926b6a0850c3c459bcba28129c559d50a7cf..c5994b75d3e56e74ffb64b2389ee1bcc086f3065 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..843f39c9d59286a9303a545411b2518d7649a059
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> [...]
> +	vreg_wcn_3p3: regulator-wcn-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&wcn_sw_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	/*
> +	 * TODO: These two regulators are actually part of the removable M.2
> +	 * card and not the CRD mainboard. Need to describe this differently.
> +	 * Functionally it works correctly, because all we need to do is to
> +	 * turn on the actual 3.3V supply above.
> +	 */
> +	vreg_wcn_0p95: regulator-wcn-0p95 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_0P95";
> +		regulator-min-microvolt = <950000>;
> +		regulator-max-microvolt = <950000>;
> +
> +		vin-supply = <&vreg_wcn_3p3>;
> +	};
> +
> +	vreg_wcn_1p9: regulator-wcn-1p9 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_1P9";
> +		regulator-min-microvolt = <1900000>;
> +		regulator-max-microvolt = <1900000>;
> +
> +		vin-supply = <&vreg_wcn_3p3>;
> +	};

Like the TODO comment already says, regulators located on a M.2 card
shouldn't be described as part of the device DT. We need a proper
solution for modelling the M.2 slots together with the standard power
supplies (3.3V and 1.8V) and hook this up to the pwrseq subsystem. This
is also the reason why the CRD does not have Bluetooth enabled upstream
yet, this needs to be solved first.

As far as I know, there is no one actively working on addressing this at
the moment. Perhaps you can assign someone at QC to work on solving this
upstream.

Thanks,
Stephan

