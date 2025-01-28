Return-Path: <linux-arm-msm+bounces-46338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78350A205BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 09:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B81513A3211
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 08:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3361DED55;
	Tue, 28 Jan 2025 08:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jx02ZFTq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB3D1953AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738051983; cv=none; b=KmbkpCxvNRceHlf6wrcQYDMCuGQiv+e3E0+OU7WH0LJ4ITqdbg8//eSZenFYBA8QAu3xr+/rrUvNeLSP5kCPVjBZ1GzaDEvdSeVY38+EAGqFiNSd4r9LWoSmxdiw/C5y17JYXiYJb5ztdTvBNXsIzcoqtNV68ayt3flbx6YyP7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738051983; c=relaxed/simple;
	bh=7GogWxpPrugJ/fv5zqyxrBchyhiIWbXdp8OfMS2A8Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdCwratXK2pto9OJmxHj3XWE5Noglbt5q95uusxX/af1BfKX5jtWArO0Qk/BZIZ+hqbg/34lfyZ6+BcR0jIUUvn1EX/BS6i1wBjlFjq34SF4oSevLX40Gy/vj9Z4d7sBkNLTDeQzCa3M6gOHwFDxIOrJlvDot8gtncMwfMhijvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jx02ZFTq; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3862a921123so3523296f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 00:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738051979; x=1738656779; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pnBgBrJa4vbsUSe6NrmhzROdgjcuHJqYe6HeWjCBo3k=;
        b=Jx02ZFTqdYJVO6JVsncXn72Q+ncDYQZXkUfJbMuA0zcx81tJyAW76bZucWJ6IgwESP
         ZoYzebV/NRAciq2//W9UucuxuDPPluKHt/ga4FK+Zgo+i5mpTKwt5pnEgxIv1u8lmEwI
         R/RI5X8NODs2gZTUN8m8m+rCNY3pNx7BRWwj+/iYV/W9dp6gfIHTcu7npBoImG2i8YYV
         kWWUfN916huOZ6JySnynHvCnPdlr/SvxencjLBxFJvb2PHgk6az4o9zXesZjgxqsi/h9
         POQyqVodgcZSPMY60lDywGAahosF7G40aacND0Rp8fMMS/QJnQX3+Dyo3s9/Q/jLuXfP
         rL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738051979; x=1738656779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnBgBrJa4vbsUSe6NrmhzROdgjcuHJqYe6HeWjCBo3k=;
        b=ZvBPzU+t0HYOPdOGP0Ja5nx/SEtkTn12Y+1zvrw/BLr4CBsfROf1RzSa9pmB9hjJ3x
         n9ICoBgD8Jkx7Zl8g0TQpINWtT9meyz4RgD0LEpn4j9sB0Sp7cgOMUCWHTlvLBgIRh24
         F26qnHgcyTgEcfaHudxfU0N55kbBxYhNjKrOL4ry8Fdvu/WGwVAcO+Ltd9HR+SE6XL8e
         ACZM0p1K+4eMbcqlndI7+wLKwKHkgNPO4kF8fAHTkh3FIudxcLLFR2RlXgwKmc0+M1b7
         Py2ZrsT7I89NkNVWzjBDGxIsXQZyOA7icZTm5OQQZVedf+GLxd8FDAmmuEqU5WIgSdmS
         ZGJA==
X-Forwarded-Encrypted: i=1; AJvYcCXyrIjWlphf+gZWZfrCRBj+OtEhgjpK+x1UZi5UPeR6wTlhHSiyQdkHJ64RfAfO0FqsXxHNwtrE7Yshj432@vger.kernel.org
X-Gm-Message-State: AOJu0YwHVNGGitHh5zbLvaAQL5prtWVbhK9gV+BuSpRYLHVsyJuq79RM
	pO30DA01grVrFsNqS32byCFP1yyms5hKQ89ns5bxtNq68PJyz17YRi6K9N5ZbR8=
X-Gm-Gg: ASbGncsfRj5fBtMssBr/bvcKnj1CNNcsXdbf/eBE1yES7aTEjWA4DbFNm4FqDwYoSKP
	enAr8pE9ypd2T0yEggdH4JYlHeUyLXu9Zk0i8Nrz92K3Av4VU0Zl/pgC2Bs1IfrzwO3Gh22FBD7
	oJz5xawGYdbjundaEti5fC+FcN6LBj91NajxUd4GDFtCZVmsr0IqEZTV6gXmXte37XYKQis3Xkh
	5ZT3w5Sq4fTcs+Kov99hGUCvuBa+3eExRXoe3IpknNBaRFdyNysw2LBtbtcPNuD2M/336Q4J5S6
	MJjJISfH2So7oMCEG9sGkQI4tjA=
X-Google-Smtp-Source: AGHT+IE9OQRLHmWjothWQ6ZFid7v4K8EL+HHTqLHBN94YDj7mMjt3aARpnqSVQu4cpZZIU0UkaKnYw==
X-Received: by 2002:a5d:47c2:0:b0:385:e8ce:7483 with SMTP id ffacd0b85a97d-38bf56555admr32927261f8f.4.1738051979050;
        Tue, 28 Jan 2025 00:12:59 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:3210:3bfd:4b47:59da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c4a160ba3sm1645445f8f.18.2025.01.28.00.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 00:12:58 -0800 (PST)
Date: Tue, 28 Jan 2025 09:12:56 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/13] ARM: dts: qcom: msm8226-samsung-matisse-common:
 Enable modem
Message-ID: <Z5iRiHGJsDmLfM2_@linaro.org>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-13-67e968787eef@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127-msm8226-modem-v3-13-67e968787eef@lucaweiss.eu>

On Mon, Jan 27, 2025 at 11:45:45PM +0100, Luca Weiss wrote:
> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> 
> Enable modem remoteproc on samsung,matisse-wifi & matisselte.
> 
> The mattisselte - being msm8926 - requires an extra mss-supply, so add
> that as well.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi | 7 +++++++
>  arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts      | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> index 0a3147656f36ca2616e0e3cc7c1dd808b55f3a88..f1544a7e8369c329360e235c48291a5d4c261fdc 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> @@ -229,6 +229,13 @@ &blsp1_uart3 {
>  	status = "okay";
>  };
>  
> +&modem {
> +	mx-supply = <&pm8226_l3>;
> +	pll-supply = <&pm8226_l8>;
> +
> +	status = "okay";
> +};
> +
>  &rpm_requests {
>  	regulators {
>  		compatible = "qcom,rpm-pm8226-regulators";
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
> index 772827cad972ad4ff032cfb9310568c5d2f0170f..73e19176eb97af569d99580c6b28fb2e0ec7f1b3 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
> @@ -28,6 +28,10 @@ reg_tsp_3p3v: regulator-tsp-3p3v {
>  	};
>  };
>  
> +&modem {
> +	mss-supply = <&pm8226_s5>;
> +};
> +
>  &tlmm {
>  	tsp_en1_default_state: tsp-en1-default-state {
>  		pins = "gpio32";
> 
> -- 
> 2.48.1
> 

