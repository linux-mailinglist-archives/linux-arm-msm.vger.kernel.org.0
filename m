Return-Path: <linux-arm-msm+bounces-25928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8327E92E2C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 341EF2857EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 08:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50910152179;
	Thu, 11 Jul 2024 08:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zdc7Cnco"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604A6154449
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720687974; cv=none; b=alBC8v57EABy7Lb2U5C+TfQVsRe11a23NA55zBa20ZnnoQxWHN8l+A84qF0UC1jHdC8GCxcGHB0wohWtHsLfTurkUKFp3uRyfeopRYh4c/GrJexJLUQJenOrUQlk7EVagxxDXGooCL9kcit6ZoPhacdKmOdDFuTHZfE7znWNO6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720687974; c=relaxed/simple;
	bh=p1gBR2YDlbtgNoZ+9MIiMetvHkvd9I0dh0JqfEScIZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JoIAgcNLLN+oZkPJcvN+80K8g68AdmlzGSF7aVDIEH1vziZ8uofdhUQrxiB6M4egN9qvvrpWJ+UY271eng6oLqgLNKzjqoXo2Wp9gzATwc1riRkIDj3crYP4TP/ByJC+kNOtRWyw31zL0KOKQWn7bxkxalHs8lc3hl2UtLKzrrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zdc7Cnco; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eeb1ba0481so6983531fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 01:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720687970; x=1721292770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kHwdkGnmoSLKM2hxNJvFbgQPNEfR5gLkDeEBWIa6jwY=;
        b=Zdc7CncoTktrV2JOrKpyse+mrNdvE0YW9W6RGNzAjf1HGsAM1gqEhctz7eAH107Ts2
         j3JeoMXm3g6F+grMaEYR+uk+aYiEiUOh/VInfwU34TmQhKYe9UevJ9EM29PuK802Pe1z
         MgEUSgkyeeYCjYGfAJxg/TjWJRPwKhi30aINvOB93HvpSKblIdgRIe4+jffyVg20aNYe
         GPAWpDdpChrnejUWJjRDAM4+PrNVov96qXTnp8NHMW10hON0YIYwl+GLfbR7AgDq2TuG
         2ojH7VvKkhwHUC/rR4XqjS2uqVW0NAixtQhQKo7LI8x2UZLXHgbCF3cXUDFEPLMayMVU
         zSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720687970; x=1721292770;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHwdkGnmoSLKM2hxNJvFbgQPNEfR5gLkDeEBWIa6jwY=;
        b=VjHtttDyE2JrffqS6O7uTFhHayTPd2ADrmyXbw/c053aydETgFXiWIBDf+WFB4rg2r
         eMTf2OdJBp8TMXJO8Magx3dcZBED/WsjeFaPcj07x+2WxrXm2EfhOdBk1R2CMK3Kjd3d
         /HCe+9W4rM+T5d49kJdZ9jHAFWde0cb2DgDfy+QROd9cTEsOnK0xZSDRXTVTTqes0k9K
         CfXN/8PSFVrdghFUxlyK0/EMgicdxYgxw0G1bofuIEMOnQe1ODNnouCroaa5h6cu5ueS
         szWOGjt7Fx1LnaHgIV5uzKphmJ3n9gPZiQJ7fiANpxS9rPnm4nOsqA36kzkMbSnK6uv4
         9nnA==
X-Forwarded-Encrypted: i=1; AJvYcCVxlqW6oT27Wk+wneWnENds+JNigCtkzK/n/kjEDYh9wprG1inEWjTbirODsYG76GXxKYJUlGJToY2xpsSPgGMM6ofxKYEB3GoTkAHfEA==
X-Gm-Message-State: AOJu0YzjQojMxYr5IlzXd46IVoiWm4/daWGHQlcOF5vQh3AQCGxdau+M
	5dP9mhqd1iX0WvP6bvpllxzclyTWXKx4aUr8N7ieFFavZyt0p7QZJZWiSwGbVQg=
X-Google-Smtp-Source: AGHT+IHf9VA36pmAnVlhE9yS1zdg4WgxvTnaeXHCQiQAocTKqb/oAIUth3RBZilvGx0iR6/2N3hrlQ==
X-Received: by 2002:a2e:9845:0:b0:2ee:7740:aa74 with SMTP id 38308e7fff4ca-2eeb30bbf36mr45663571fa.3.1720687970121;
        Thu, 11 Jul 2024 01:52:50 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bda308d7sm3168392a12.91.2024.07.11.01.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 01:52:49 -0700 (PDT)
Message-ID: <b0386995-88be-436a-9398-ddb45d58fd5a@linaro.org>
Date: Thu, 11 Jul 2024 10:52:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: add OnePlus 8T (kebab)
To: Caleb Connolly <caleb@postmarketos.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Frieder Hannenheim <frieder.hannenheim@proton.me>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
 <20240630-oneplus8-v2-8-c4a1f8da74f1@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240630-oneplus8-v2-8-c4a1f8da74f1@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.2024 8:36 PM, Caleb Connolly wrote:
> Initial support for USB, UFS, touchscreen, panel, wifi, and bluetooth.
> 
> Co-developed-by: Frieder Hannenheim <frieder.hannenheim@proton.me>
> Signed-off-by: Frieder Hannenheim <frieder.hannenheim@proton.me>
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---

[...]

> +/delete-node/ &spss_mem;
> +/delete-node/ &cdsp_secure_heap;
> +

odd double newline

> +
> +/ {

[...]

> +
> +		framebuffer@9c000000 {
> +			reg = <0 0x9c000000 0 0x2300000>;

0x0 for consistency


> +			no-map;
> +		};
> +	};
> +
> +	panel_avdd_5p5: regulator-panel-avdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "panel_avdd_5p5";
> +		regulator-min-microvolt = <5500000>;
> +		regulator-max-microvolt = <5500000>;

Please unsqash these properties like in e.g. x1e80100-crd

> +		regulator-enable-ramp-delay = <233>;
> +		gpio = <&tlmm 61 GPIO_ACTIVE_HIGH>;
> +		regulator-boot-on;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_avdd_pins>;

property-n
property-names

(theres more occurences in this patch)

> +		vreg_l11c_3p3: ldo11 {
> +			regulator-name = "vreg_l11c_3p3";
> +			regulator-min-microvolt = <2900000>;
> +			regulator-max-microvolt = <3304000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-boot-on;
> +			/* FIXME: we don't yet support power cycling the panel */
> +			//regulator-always-on;

so should this be in or out?

[...]

> +	/*
> +	 * Pixelworks Iris 5 @ 26 (i3c) or 22 (i2c)
> +	 * This is a co-processor for the display which needs to be
> +	 * initialized along with the panel.
> +	 */

yikes

> +};
> +
> +&i2c15 {
> +	status = "okay";
> +
> +	typec-mux@42 {
> +		compatible = "fcs,fsa4480";
> +		reg = <0x42>;
> +
> +		vcc-supply = <&vreg_s4a_1p8>;
> +
> +		orientation-switch;
> +
> +		/* Currently unsupported */
> +		status = "disabled";

Any particular problems with it?

[...]

> +		/*
> +		 * FIXME: There is a bug somewhere in the display stack and it isn't
> +		 * possible to get the panel to a working state after toggling reset.
> +		 * At best it just shows one or more vertical red lines. So for now
> +		 * let's skip the reset GPIO.
> +		 */
> +		// reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;

c++-style comments used not to be cool.. not sure what's the current policy

> +
> +		pinctrl-0 = <&panel_reset_pins &panel_vsync_pins &panel_vout_pins>;

should panel_vout_pins be modeled as a regulator?

[...]

> +&pm8150_gpios {
> +	/*
> +	 * These are marked as reserved in downstream
> +	 * with no description, without schematics we
> +	 * don't know what the deal is here.
> +	 */
> +	gpio-reserved-ranges = <2 1>, <4 2>, <8 1>;

drivers/pinctrl/qcom/pinctrl-spmi-gpio.c

/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },

[...]

> +&pon_resin {
> +	status = "okay";
> +
> +	linux,code = <KEY_VOLUMEDOWN>;

status should go last

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <28 4>, <40 4>;

Any chance you'd know what they're for?

[...]

> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";

[...]

> +
> +	touchscreen@4b {
> +		compatible = "syna,s3908";
> +		reg = <0x4B>;

lowercase hex

> +
> +		pinctrl-0 = <&touch_irq_active &touch_rst_active>;
> +		pinctrl-names = "default";
> +
> +		interrupts-extended = <&tlmm 39 0x2008>;

https://lore.kernel.org/linux-arm-msm/20240605160032.150587-1-krzysztof.kozlowski@linaro.org/

Konrad

