Return-Path: <linux-arm-msm+bounces-95566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPp+K61RqWmd4gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:49:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF7220EED8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A77DF305D25A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 09:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE6237AA79;
	Thu,  5 Mar 2026 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eLCMqKDy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA4D377EBD
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 09:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704079; cv=none; b=R2K0QWPzUqjz4+s60jEOgmWbibdOvB/d88/JQDdxRnzGUkE4sWIyGs7e8esimO+mSiRDlNo7DIs9FJcncA5IR6PaflCWQTYNEY2R4nK174HlKhZyyOrOS0Zy9E7uL3w0mw8tv5BC4MrEKlP5Mv/dpYM8ccskA66BBBvd0gW6o38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704079; c=relaxed/simple;
	bh=yNJ+g0kgFl4rN2nV1qDYDztAf8zpw/3rgT6jdQgfIak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSqa9BazhqRtXCyIULSjMqvLfKJ3krpx1FA7gqg7MX8tTPDmxpIvhRAE/8TSWPnVMP3IFDFMG3Y7K9JA66bfS4c3CQ9q3HmJJjh1jbk96UVKpqrxKEEksi6JzNEsyrpqISEIY+k6ygUnnE9L9tAB6XEgpEEMWuWI7HZl6962ieI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eLCMqKDy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so89091045e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 01:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772704076; x=1773308876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=obqyQWFp1H53oLqwIlaLvRj7pbSd+nYq4rGayxVQqL4=;
        b=eLCMqKDymWtpwAUnQYoKNKqKiLoWlQxH/p4LQR614Ji1m2oo6S4ecYxpAFss6bgzfM
         TgCaWir/AHpvUMW5hTLr6jycQUyOTcQ7i5DVXtDPubkJP6PvayZbBU1eiv/+TrD6SCfO
         I548MehQoziFRYJo+wtgiERDzmxlO7PE7Zayui51vrMZhUKY+8pyUz4QsraYDc9eLULY
         d0OKgVX7VgrQxf8gjyynfLut3tGSovKCED+Mrx4OlNIDPYs9oRUhI0VFhkRyHPIPxS9Q
         bTz8Yt33f+Owoaz2gFxQSiZZJKZJvXaYmfeC/+vkPDwFGQcDi652pTLaRs6h5zmg9jDD
         pgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704076; x=1773308876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obqyQWFp1H53oLqwIlaLvRj7pbSd+nYq4rGayxVQqL4=;
        b=fg48qmEOAevIs8gO247iBh8esirRBWwbzbqTu7UjpnI3+QwymI7+m+x8btTSq48PGB
         tovkmdfFslCPKZ1KE9PBXRoMPcx8R8ZALTLJnnQ6KLaR9c+07tetTn0xL4vUfwBuGZMe
         YB204MAWW0YKQ9Mu2hCsx/jZ15AZV+TIwQDaIRh3Hoj29u/XC8pKVV2xAxDCbqRsbr2m
         kb7GKcmYsR1gLnxJxR5XXCOBHTkG/vxpNYRJzmY/KN4p14RTSIVZHSvThMimvs7s5UGA
         c20WwN6uMpp1R3B31k9DdfG8mHxZIMBapTIr6R95UIjn+LMazouL4RTQsuhuPHrQggC7
         3z8Q==
X-Forwarded-Encrypted: i=1; AJvYcCURiA4xPAm9fKV1nJtIlQasChSKuX2FbiHOWGYDtB15u41i1ZrI+1MJ9HSxOZLbEW0CtFyNdoiWSH37b6Xc@vger.kernel.org
X-Gm-Message-State: AOJu0YwA2w/UDnHiCQSiDDP7GglXb5RG+Xt+kQxUHdAc7H0Qj3eE2COq
	T8xgbgWT+83DaeM9zmGf5cz2kYl7Iv4qHoj94GoDa08YBHEAww3yzAOJnxa0jHbBTiE=
X-Gm-Gg: ATEYQzzCxymSm6h9LaFbihMwrPJNAPNe9iStfICueGEa3oYo2mtuvMKeMsh1iPm/QEO
	ljXPOa/27nx5D9pCJLJI1tiTtEL8D+EsIYwAeYblDdrobZEtYIqwEFIV4paOlrumVsUlPJlAEDQ
	C707NLI4Yz0U3T33Uw0FiPW0KhsWXTGNgiiSTHN0d0T8oYPA+OH+VCTvHkDjM2YgXBbjYiTykBV
	yPjlumCNouyMj7D55RAc1Yj6FYUlwj8bUZCp+AQoKmkwhjh2zVcwhoyzD8irh5awZpBuyx7uQ6L
	RYM8sQm4y5OT/12BUA5RrKU/cnRBk8su8d+HNQBXqDp9YZIPz8ImXL5KoJZsSfdwCJf0GYVg87q
	LNhq5W7HqDJHdq3d2U9NxoT9oMs5ZMPXjhHdU7rFmUjgOlFanHDYoiy9/en8kqYNCPmG8EqTQxT
	R3jYjPMBNsoWJhG68elQfguqZFmrW6oLgX1gsG8zE=
X-Received: by 2002:a05:600c:46d2:b0:483:b505:9db4 with SMTP id 5b1f17b1804b1-485198a3d0emr89895795e9.31.1772704076395;
        Thu, 05 Mar 2026 01:47:56 -0800 (PST)
Received: from linaro.org ([77.64.146.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ec74bc7sm25012025e9.0.2026.03.05.01.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:47:55 -0800 (PST)
Date: Thu, 5 Mar 2026 10:47:22 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: adamp@posteo.de
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
Message-ID: <aalRKuqzX48PzyL-@linaro.org>
References: <20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de>
 <20260301-wiko-chuppito-v3-3-9b36a2a7aed5@posteo.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-wiko-chuppito-v3-3-9b36a2a7aed5@posteo.de>
X-Rspamd-Queue-Id: 4CF7220EED8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95566-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.39:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.11:email,bootlin.com:url,0.0.0.68:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.1:email,c:email]
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 11:29:19PM +0100, Paul Adam via B4 Relay wrote:
> From: Paul Adam <adamp@posteo.de>
> 
> Add an initial device tree for Wiko PULP 4G.
> Includes support for:
> - UART
> - USB (no OTG)
> - Internal storage
> - MicroSD
> - Volume keys + Power button
> - Touchscreen
> - Backlight
> - Accelerometer: Invensense MPU6880
> - Magnetometer: Asahi Kasei AK09911
> - Hall sensor: Rohm BU52021HFV
> - Proximity sensor
> - Vibrator
> - Earpiece
> - Microphone 1
> - Headphones
> - Wifi
> - Bluetooth
> - GPU
> 
> Signed-off-by: Paul Adam <adamp@posteo.de>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts | 356 +++++++++++++++++++++
>  2 files changed, 357 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f80b5d9cf1e8..5a3a9a823503 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -75,6 +75,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-rossa.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-serranove.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-thwc-uf896.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-thwc-ufi001c.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wiko-chuppito.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> new file mode 100644
> index 000000000000..dd56e1baeb4b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> @@ -0,0 +1,356 @@
> [...]
> +&blsp_i2c2 {
> +	status = "okay";
> +
> +	magnetometer@c {
> +		compatible = "asahi-kasei,ak09911";
> +		reg = <0x0c>;
> +		vdd-supply = <&pm8916_l17>;
> +		vid-supply = <&pm8916_l6>;
> +		reset-gpios = <&tlmm 120 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&mag_reset_default>;
> +		pinctrl-1 = <&mag_reset_suspend>;
> +		pinctrl-names = "default", "suspend";

Did you mean "sleep" instead of "suspend" here? By default, there is
"default", "init", "idle" and "sleep" [1], although drivers can request
custom pinctrl states as well.

Note that even with "sleep", the pinctrl state will be rarely used on
Linux. Drivers need to explicitly call pinctrl_pm_select_sleep_state()
to trigger these, but only few drivers do that [2]. From a quick look,
I suspect that only the &sdhc_2 sleep pinctrl here is currently used on
Linux.

That doesn't mean that you can't add these pinctrl states (the DT is not
supposed to be specific to one particular operating system), but it does
mean that most of these are effectively untested right now. I would
personally omit them.

[1]: https://elixir.bootlin.com/linux/v7.0-rc1/source/include/linux/pinctrl/pinctrl-state.h#L36
[2]: https://elixir.bootlin.com/linux/v7.0-rc1/A/ident/pinctrl_pm_select_sleep_state

> +		mount-matrix = "1",  "0", "0",
> +			       "0", "1", "0",
> +			       "0",  "0", "1";
> +	};
> +
> +	proximity@48 {
> +		compatible = "sensortek,stk3310";
> +		reg = <0x48>;
> +		interrupts-extended = <&tlmm 113 IRQ_TYPE_EDGE_FALLING>;
> +		pinctrl-0 = <&proximity_int_default>;
> +		pinctrl-1 = <&proximity_int_suspend>;
> +		pinctrl-names = "default", "suspend";

Same here.

> +	};
> +
> +	imu@68 {
> +		compatible = "invensense,mpu6880";
> +		reg = <0x68>;
> +		interrupts-extended = <&tlmm 115 IRQ_TYPE_EDGE_FALLING>;
> +		vdd-supply = <&pm8916_l17>;
> +		vddio-supply = <&pm8916_l6>;
> +		pinctrl-0 = <&imu_int_default>;
> +		pinctrl-1 = <&imu_int_suspend>;
> +		pinctrl-names = "default", "suspend";

And here.

> +		mount-matrix = "0",  "-1", "0",
> +			       "-1", "0", "0",
> +			       "0",  "0", "-1";
> +	};
> +};
> +
> +&blsp_i2c5 {
> +	status = "okay";
> +
> +	touchscreen@39 {
> +		compatible = "syna,rmi4-i2c";
> +		reg = <0x39>;
> +		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
> +		vdd-supply = <&pm8916_l17>;
> +		vio-supply = <&pm8916_l6>;
> +		pinctrl-0 = <&touchscreen_default>;
> +		pinctrl-1 = <&touchscreen_suspend>;
> +		pinctrl-names = "default", "suspend";

And here.

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		syna,startup-delay-ms = <100>;
> +		syna,reset-delay-ms = <160>;
> +
> +		rmi4-f01@1 {
> +			reg = <0x1>;
> +			syna,nosleep-mode = <1>;
> +		};
> +
> +		rmi4-f11@11 {
> +			reg = <0x11>;
> +			syna,sensor-type = <1>;
> +		};
> +	};
> +};
> +
> [...]
> +&pm8916_rpm_regulators {
> +	pm8916_l17: l17 {
> +		regulator-min-microvolt = <2850000>;
> +		regulator-max-microvolt = <2850000>;
> +		regulator-always-on;

Does this need to be always-on?

> +	};
> +};
> +
> [...]
> +&sdhc_2 {
> +	pinctrl-0 = <&sdc2_default>, <&sdc2_cd_default>;
> +	pinctrl-1 = <&sdc2_sleep>, <&sdc2_cd_default>;
> +	pinctrl-names = "default", "sleep";

This is OK, drivers/mmc/host/sdhci-msm.c selects the sleep state.

> +	cd-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
> +
> +	status = "okay";
> +};
> [...]
> +&tlmm {
> [...]
> +	imu_int_default: imu-int-default-state {
> +		pins = "gpio115";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	imu_int_suspend: imu-int-suspend-state {
> +		pins = "gpio115";
> +		function = "gpio";
> +		drive-strength = <2>;
> +	};

imu_int_default has a bias, but imu_int_suspend does not, is this
intended? I would just drop these "suspend" states, as I mentioned
above.

Thanks,
Stephan

