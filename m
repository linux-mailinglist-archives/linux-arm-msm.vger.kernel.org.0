Return-Path: <linux-arm-msm+bounces-38535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C009D3F31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 16:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D597A284FF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 15:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B03446A1;
	Wed, 20 Nov 2024 15:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AphLD000"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32BD74068
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 15:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732117030; cv=none; b=Rada5bwNMG12jJi5eJ0stZO+W3GoKyeebaoK5vWdH17h0laYlhrNH6tck9e+IL1vUGjMm2FM1w9D/3ahl9S/xVS8JA0170v1EF8S/1JaCEuoWG6B0RncYtl9x7Q0yqbVwjihaaYLHIxZrYfezuVxxKOmU8OHmhde75HDjpscVxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732117030; c=relaxed/simple;
	bh=EcXi0j0dyA+723R0e2qo31o2LqdNEMzIDmlxXSbydek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9hfmt2X2QH1A7HaSw0+UAEq/hKBLLBZ4Le0Pg/VyJ8S/MN4PNYgePgJ584S+uWs+XvHR0uncnhPx74M6wmb6NuiLh5ozKjhXYICL7vnjIC9bxgv2LZOpB92CxYJ/XEEjf415q45aZ7ZO7kfvJIVuW/zMZAtkOaAJqyLqGO4LvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AphLD000; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa4b439c5e8so607458766b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 07:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732117027; x=1732721827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=67gpAYk5z0mqfy8QmFGv1/nDGqkvdtf3oWA7Ix8VZOk=;
        b=AphLD000NGpFwtTDAbn8GsGrBveDXl74FTVcYP1v9z8S23yyKRJWaAF2vFdiDn1zAk
         cGCCEwONEvrkRUTPxSXw2dOxLTAQQ8O4CHY9FvJO7wlrxdXiXUlZ6NzLpE5GN5C+e3On
         6T6VlYp7teNjJyOEGREZSktxCw8IPkrgyV+mfeq1INWAUEYjUtchAJSZ60PaM3IK4A9I
         1Bk9JbFlrePRB8dWo3GUi8ki04vM+yQ09i6NYNEBMl9MZCxHiRfC5fZDMEQSrzu3xVkx
         aoHc4bEIlRv9j5I8dEp0p5yD2iUiZip3FCvRF5jJfOyAm6AM4BMitrBN4v4tXqa7WENS
         xanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732117027; x=1732721827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67gpAYk5z0mqfy8QmFGv1/nDGqkvdtf3oWA7Ix8VZOk=;
        b=bYZWdyI28nabRAgrB3s2WVhDZu5Ym9IscNqCr8cLwivRH7rQmJulriFED1B4xcdFvS
         VfEXQcf3hgkPIOCf/q3DGKieUjxf8K58Pv7vXq0GFprGDQBePHeztoIPrjlimBY2LDU6
         NOVcktPXS9Doof4CDYmHdUiJ1Toi4gF8by9AoLpQaCqv/bASCbLX8/j5jV8wl6BbjzK2
         DY7tPlpds4Oe8aQ3T0gmNRN6ujoYySnOdQnf6HYh/8Q1aeQqp082ijdcXnXAGsAS9w14
         2esPmnVEAtzwdaXog92xWssEjsJXgsOcgeVfstST0QduBvDz3o0tdl9xGE8AHMAWsqbx
         7tvw==
X-Forwarded-Encrypted: i=1; AJvYcCUSNmdXdtc4luZ5tzdoGP3Dj/UUaa877kHCaQW19T55wXWvR7lCi+S/QHsB+LAzhTg/vgbqpjaP0xquqOVm@vger.kernel.org
X-Gm-Message-State: AOJu0YzWAhoZspITbA+HO8Q8Y02N2W1hI/sX3j3TauEqdg4GSDs8jEB9
	7iFS7B515V0DQ5zXmzIlPZ5ZR7N6QRFuVBWxwkByDJoiWpZpqgWZwSZRBd/H48M=
X-Google-Smtp-Source: AGHT+IHUI2K5i329FaSUXy0rNiKWm6wYziPIfg5nfS28GcWB94CU0e2vWJ8HxSmwmazLe+EJPjLcCw==
X-Received: by 2002:a17:907:3fa0:b0:aa1:e0ac:db5 with SMTP id a640c23a62f3a-aa4dd57a96bmr286085566b.26.1732117026990;
        Wed, 20 Nov 2024 07:37:06 -0800 (PST)
Received: from ?IPV6:2a02:8109:888d:ff00:ca7f:54ff:fe52:4519? ([2a02:8109:888d:ff00:ca7f:54ff:fe52:4519])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df26c47sm778868166b.13.2024.11.20.07.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 07:37:06 -0800 (PST)
Message-ID: <ab1f91bd-8b6d-4825-90e3-b6a995e346f0@linaro.org>
Date: Wed, 20 Nov 2024 16:37:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] arm64: dts: qcom: sdm845-oneplus-common: enable
 resin/volume down
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>, linux-arm-msm@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>,
 Joel Selvaraj <joelselvaraj.oss@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dylan Van Assche <me@dylanvanassche.be>, Gergo Koteles <soyer@irl.hu>
References: <20241120145317.31406-1-pvorel@suse.cz>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20241120145317.31406-1-pvorel@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Petr,

On 20/11/2024 15:53, Petr Vorel wrote:
> OnePlus 6T (fajita) downstream device tree contains volume down GPIO key
> and resin. I suppose it is also in OnePlus 6 (enchilada).

The volume down key is already enabled under the gpio-keys node in
sdm845-oneplus-common.dtsi does it not work for you for some reason?

I don't believe the resin node is used on this board, it's ignosed on
the schematics at any rate.

Kind regards,
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi
> 
> reason for RFC:
> * Unfortunately untested on the real device.
> * OnePlus 6 (enchilada) is nearly identical, but I haven't compared it's
>   device tree.
> * Other sdm845 based devices just enable resin/volume down key the same
>   way. But what confuses me is "gpios = <0xe7 0x05 0x01>;", does it need
>   to enable gpios like sm6375-sony-xperia-murray-pdx225.dts in
>   795ee50e55f4 ("arm64: dts: qcom: sm6375-pdx225: Add volume down GPIO key") ?
> 
> Below is snipped of the OnePlus 6T (fajita) downstream device tree.
> 
> Kind regards,
> Petr
> 
> gpio_keys {
> 		compatible = "gpio-keys";
> 		label = "gpio-keys";
> 		pinctrl-0 = <0x2f7>;
> 		pinctrl-names = "default";
> 
> 		vol_down {
> 				gpios = <0xe7 0x05 0x01>;
> 				linux,can-disable;
> 				debounce-interval = <0x0f>;
> 				label = "volume_down";
> 				linux,input-type = <0x01>;
> 				linux,code = <0x72>;
> 		};
> 
> 		vol_up {
> 				gpios = <0xe7 0x06 0x01>;
> 				linux,can-disable;
> 				debounce-interval = <0x0f>;
> 				label = "volume_up";
> 				linux,input-type = <0x01>;
> 				gpio-key,wakeup;
> 				linux,code = <0x73>;
> 		};
> 
> 		cam_focus {
> 				status = "disabled";
> 		};
> 
> 		hallsensor_key {
> 				gpios = <0x34 0x7c 0x01>;
> 				debounce-interval = <0x0f>;
> 				interrupt-parent = <0x34>;
> 				interrupts = <0x7c 0x00>;
> 				label = "hallsensor_key";
> 				linux,input-type = <0x05>;
> 				gpio-key,wakeup;
> 				linux,code = <0x00>;
> 		};
> 
> 		cam_snapshot {
> 				status = "disabled";
> 		};
> };
> 
> ...
> qcom,power-on@800 {
> 		qcom,system-reset;
> 		compatible = "qcom,qpnp-power-on";
> 		qcom,pon-dbc-delay = <0x3d09>;
> 		interrupts = <0x00 0x08 0x00 0x00 0x00 0x08 0x01 0x00 0x00 0x08 0x04 0x00 0x00 0x08 0x05 0x00>;
> 		qcom,kpdpwr-sw-debounce;
> 		reg = <0x800 0x100>;
> 		interrupt-names = "kpdpwr\0resin\0resin-bark\0kpdpwr-resin-bark";
> 		qcom,store-hard-reset-reason;
> 
> 		qcom,pon_1 {
> 				qcom,support-reset = <0x00>;
> 				qcom,pull-up = <0x01>;
> 				qcom,pon-type = <0x00>;
> 				linux,code = <0x74>;
> 		};
> 
> 		qcom,pon_2 {
> 				qcom,pull-up = <0x01>;
> 				qcom,pon-type = <0x01>;
> 				linux,code = <0x72>;
> 		};
> 
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 46e25c53829a..6cb074de7696 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -847,6 +847,11 @@ speaker_default: speaker-default-state {
>  	};
>  };
>  
> +&pm8998_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";
> +};
> +
>  &venus {
>  	status = "okay";
>  	firmware-name = "qcom/sdm845/oneplus6/venus.mbn";

-- 
// Caleb (they/them)


