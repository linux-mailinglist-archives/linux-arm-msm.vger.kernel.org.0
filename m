Return-Path: <linux-arm-msm+bounces-45120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F6DA1222D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 12:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F07053A85B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 11:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525A71E9915;
	Wed, 15 Jan 2025 11:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tvx5DCax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447691E98EF
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 11:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736939555; cv=none; b=cOpKCMvkv6wOhZ9VoWlXWpOaMzqRM4Fh//YB/H+V+QZ+EmW6zQwnP4a1oZBKX/dDkFsE3VUJX7NvWuI29ulUKN4ubfiFUBMJli3CMvMbfgU0XrgiiX8ZoT43kKZQaLrFG5jsSeeMIugtACgCTm2uCXtF16vWcICmhAOPOGDBogs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736939555; c=relaxed/simple;
	bh=vhImzVV58kYyHYIUkFdZkPsDkULuYsk1Gi6Hl4W7mpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQxbANVzOlIjmt15VCW7BbmlUzskOW3PAH2pfi/S90JJHCI7UTsWlscBe90OJ+gosk7PPOYXxtIoNFbhLutmEcCL/34lhpkugszxA3ThkVqhtwRhzl93a3JrGYCmrJxn/XyarPfdNOpZbAmx62bSWPgujml7rYf4G2n93uxGu6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tvx5DCax; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54025432becso6362305e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 03:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736939551; x=1737544351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+tHz1lZDZJu/vrJ3APOR11aoNkytAh6ESFiCZtI/0bQ=;
        b=Tvx5DCaxi9sFYB99VvHE/gSoUoPfRuQQcNWKpka3gX0ljdDTA3c3sIIOwqrwgl9g7E
         9lXWVVz9fVVae50zqz2xaMCb18CgQcg2KFXqjf/HunhVTNcIZW58VJAWA1nmVL880G0S
         9uxNdVZ6jgd1Mmj8kICk9omNd5XWbuJyWxigM7xjdUMSeZM+qibTLz6pnn4lnlV75MKd
         RLM0v829N/RL1RcVHDqEeU0W5uIuF6N2cA/gawQQKAgDqB9mY0GG0aqygPStpLuVb/Hc
         oCpPQRwH060I4fMQpEtHvNIsiJYqcg5i+M1S8KZsVEaZZ/s8ueF6ZZBZ+jna/aPyY4ZF
         RRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736939551; x=1737544351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tHz1lZDZJu/vrJ3APOR11aoNkytAh6ESFiCZtI/0bQ=;
        b=kJV+8hisbr06Kriw5EGx6b6QQZk9bo+wqehEMODc3NVSkqR/dS8CEJAleSufF108Sh
         GzVH5DXIp85hjOIff+KtuipegCL4JAadSFTVSLjB8QcIKIiSVci/TOOj2BHjGYojN+Ur
         C5imu6JSK0Usu1J/e9OSQ9iPrQORDdu6BRCAbh2L/IocIZcz8a4Iry9na7NePY5tui7u
         PEO1GFlbe7tD9bus59YNOhDDMS/GG6aFlCBDQS9O6Alew3AFp0wt4fqtfUP56e5ipMQw
         YB7SYf4ZPWb5YHqM9wCLp8J/L2rXzj1fHoH4s5yiaD0i/jGyqamWKJtNJDV8MV3Pwnzn
         8B/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVr5X3a3WhC2aBs7ceJJzMeYIAawWz6Ys9D1Vvxbj4wj6fege22SvbK2PDjwpCLdzGSjjOU4pRUWQgc6WOz@vger.kernel.org
X-Gm-Message-State: AOJu0YxsgD8eoKtaOmm2tIMpCPXELTBiXRKBaOsXNIKcrCi60dNwoQ71
	oJMY8BLKp1U1ar8qCg7B0s3acOcY69xHwVRN1U3pypF3Z5de6eexJEfO/IvSxII=
X-Gm-Gg: ASbGncsQJIloOnPg0hn12ZUqLqXb8pz2qPbtUrBvpTJ0N2u/Clt8J7EMRxUgCmhL7Lb
	BHkIEgrnVAx/KP5o35Lc7lUyeDSpIOlGwZ7VqvXximZA2tP+fnkNoGmez4f7mvXrZWp/ZUmHlmH
	rWr4zRlCSPNSOIqpSdnBzNr0wEeVkDpQ5pyp7+xmXwparPaH2TmPiFE9/Tvy8H1IHmq/pSBbzlH
	MMwr4l9wVW38CVH9vIMxCmjlVlGut0PMyWk9jEMWes47OW4L1QvCR+c75dkriwcOdIQgekkXCtS
	24oxu5ukhyguuXSAkKnALXYyi0lqXJC4xNXa
X-Google-Smtp-Source: AGHT+IGPnv+1mKebX/XJMc+HfyjNtFhAovM40dVLzkyMzoPPf30juxdLxbc2XPEGSlUqvqfQMtNdig==
X-Received: by 2002:a05:6512:1281:b0:540:5b5c:c18d with SMTP id 2adb3069b0e04-542844f6d6emr8173447e87.7.1736939551222;
        Wed, 15 Jan 2025 03:12:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6691sm1995380e87.132.2025.01.15.03.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:12:29 -0800 (PST)
Date: Wed, 15 Jan 2025 13:12:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_srichara@quicinc.com, 
	quic_varada@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: enable fast mode for i2c3
Message-ID: <qq47sv4wylmwtsx6r46lmyxypv7t2q5jx7wcahv2tzwu4wkd7n@qg76zy26ruco>
References: <20250115110142.3501140-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115110142.3501140-1-quic_mmanikan@quicinc.com>

On Wed, Jan 15, 2025 at 04:31:42PM +0530, Manikanta Mylavarapu wrote:
> Configure the blsp1 i2c3 bus to operate at 400 kHz
> for fast mode.

This is usually a board property rather than an SoC one.

> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 942290028972..b35df590a794 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -621,6 +621,7 @@ blsp1_i2c3: i2c@78b8000 {
>  			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "core", "iface";
> +			clock-frequency = <400000>;
>  			assigned-clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
>  			assigned-clock-rates = <50000000>;
>  			dmas = <&blsp_dma 18>, <&blsp_dma 19>;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

