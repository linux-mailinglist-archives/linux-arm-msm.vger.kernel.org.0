Return-Path: <linux-arm-msm+bounces-43010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A119F993B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 19:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A15E3189E94A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 18:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F455229B27;
	Fri, 20 Dec 2024 17:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q7Tsgw82"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9E021D004
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 17:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734717052; cv=none; b=ufO5M226OQlVW/Y7mw0h9UUx1MHyqLLL7wUwnhlXNVQyBBFAl7wLVvNBdVlTlfI5KKGGOP0luJBi2pz1MQGAUCgS5pkOOD8Z4+JHNg5Gv3vOi/QDXeob6ViEBTNUiAFqpd7skEDD6RyvY3/YfPk9JirQCGaXpozvMaYjvDc8oAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734717052; c=relaxed/simple;
	bh=g+oA4lZy7Z9uEfshTPFqUG9rQSZq8pffg8GsEGaP10I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmqPuAaa+NeTGoDn+TkqQcvORI3tocy85IQXTsW+ct6vtKohoqG0WzFFarQD6brYi/gnWXL5NWvNgJXN0yhV3F1nCaM1d9gkE1V4ySTrYPPOsSzjrQd16/tr8OJGARJIMuaUZ8fj1mCyx2CI5utA+uj9l+OHVAcfCMqINepl1cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q7Tsgw82; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso2990701a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734717047; x=1735321847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=skWg29qb61yYIk3EkJUYELMdbMMItE1lZwAy9NtBhR8=;
        b=q7Tsgw82Lb4U/ZzE8ZxaW9ybifZOVhRAvZ9bV3TeB9uudrPjtC8MxtqmAoq9pLPNg1
         p04aT9fxeqi0aVlcRa0T8dQhc3M5dXjPOygbo/WEFnZJpfQAlS1TokWP8U2X25i5vT9h
         RcwRjdHdx8UIh6VUdnBHAnoX9Vlo1dmC8deDAGXnql+QwC1I7bBdImJOsXyrPU2tNlUv
         IPqdAz033BrGO99upFVvBgMxqTd74tnAdi5WxhJYdQF6+yU0BqxBqszL0rjCxIk9tmaq
         ktrAkddYuMvj3f7KFdtN4Ywyh5LI7wo18xIw6GF2Hzxh2cVQU3cbejsl0Ph/H5AhBm4d
         B9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734717047; x=1735321847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skWg29qb61yYIk3EkJUYELMdbMMItE1lZwAy9NtBhR8=;
        b=iLQHZg/ncE+n+jD9g+SE1blGQgKOFS4MhFY+Cac+SRHcKChi/nVegInu0L/Lq6F+53
         /v1/1YwAiU84kklnjtCW+wsGh7HwyTJ4I8q+BOm2WrGGXOPmAFdowe48/t1BUgNAw4LW
         eV9k680jg7toCQxR2Ryvn2HrgUacYtg230DbG/54teia4al3vw4VtKuPISJD9NE7H/B3
         bjzHczHwHPGHjCDMF/nxZR/kM26aehC1s8Xn/SD3RnE67WRQSoSXxPaKigtWepT9c/5H
         lrzTkvPZ48KnYRx547IvdiGOraVDy4S2W2MQHGb4sZL72AEIHggSrgC2pwJsWL83O0m/
         sJtA==
X-Forwarded-Encrypted: i=1; AJvYcCWqwpy4rLud907YAxpsDacej3Mv3g6/Xzuw0ZKEgi7NLCLM5RWe49J9lgpb2pn2JLfdl76K+B3lf6TlhAcr@vger.kernel.org
X-Gm-Message-State: AOJu0YzhR8XlfI26gjQTMzqMTDL0H4t4Mccc89waHuV7LLdVaBzx2cRT
	tmbWAdLqXZ2hukKvfsVj5wIj4QYPWUXBfL7WlWIhY+n6lgN+25XyptvCBicrGFc=
X-Gm-Gg: ASbGncvP8nslGwC/en3GGQmqHuLfNPzfcDt6EpZKhIUGMb3hhF/6YAU46lnnwlDOTF0
	YD2siRKrcz2HCN5e11oMNSyNku+DhS+wZTyiL6S+QDJWyNn0G6sUW5WqSvS6wOvoS0NXrSIgjpC
	HcAY1xlz+RKC2wo9CWGnGy2kMN2pYvEftDuS4qQM/H1jV5GWWuM8QZdFkKHwjIAKkmm5DrICLBO
	pKNwRUTy3A+4Rco8IlKJuriJcr9ZjyGflzopHy4bZCwnWnR/MqI17aT7Yat6dZPVXhG
X-Google-Smtp-Source: AGHT+IHvA6F8csyZbEnJh0AwsIg4HgqcuFT7xr7OmR5oK1AEVmNJyA8I4rh95bT8dg665NoN1rus3w==
X-Received: by 2002:a05:6402:1588:b0:5d3:ba42:e9e3 with SMTP id 4fb4d7f45d1cf-5d81dd9ce81mr8433085a12.13.1734717047139;
        Fri, 20 Dec 2024 09:50:47 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:6d2c:6f87:64ef:2237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e89598csm197034866b.56.2024.12.20.09.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:50:46 -0800 (PST)
Date: Fri, 20 Dec 2024 18:50:41 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: maud_spierings@hotmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: x1e80100-vivobook-s15: Add
 bluetooth
Message-ID: <Z2WucXuxJ5bKzifa@linaro.org>
References: <20241204-asus_qcom_display-v6-0-91079cd8234e@hotmail.com>
 <20241204-asus_qcom_display-v6-3-91079cd8234e@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-asus_qcom_display-v6-3-91079cd8234e@hotmail.com>

On Wed, Dec 04, 2024 at 01:26:39PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Add bluetooth for the asus vivobook s15
> Describe wlan configuration
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 161 +++++++++++++++++++++
>  1 file changed, 161 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> index ba52c0eef4e32019f6eb7c7ae3c4cd727df23490..6564386e92e5c8c08ae2807ba512f83537358cf5 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> @@ -19,6 +19,10 @@ / {
>  	compatible = "asus,vivobook-s15", "qcom,x1e80100";
>  	chassis-type = "laptop";
>  
> +	aliases {
> +		serial1 = &uart14;
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  		pinctrl-0 = <&hall_int_n_default>;
> @@ -153,6 +157,101 @@ vph_pwr: regulator-vph-pwr {
>  		regulator-always-on;
>  		regulator-boot-on;
>  	};
> +
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

The reason we haven't pushed these patches for CRD, T14s etc is that
unlike for QCP these two regulators are not actually present on the
mainboard, they are part of a soldered or removable M.2 card. You can
find this TODO in the commit message/patch on Johan's kernel tree:

https://github.com/jhovold/linux/commit/32cfeff737b0f9a2f8787d21a875e549a22e9e8b
https://github.com/jhovold/linux/commit/2a7fee4007670e2f0f7696eb9e992e74d3be460f

We haven't come to a conclusion yet how to model these M.2 cards
properly. Perhaps we should stop blocking this and merge this for all
the laptops as temporary solution to get Bluetooth running, but then we
should at least preserve the TODO comment block to make that clear:

	/*
	 * TODO: These two regulators are actually part of the removable M.2
	 * card and not the CRD mainboard. Need to describe this differently.
	 * Functionally it works correctly, because all we need to do is to
	 * turn on the actual 3.3V supply above.
	 */

@Konrad: Given that you acked this patch, do you have any opinion if we
should merge these with this open question?

Thanks,
Stephan

