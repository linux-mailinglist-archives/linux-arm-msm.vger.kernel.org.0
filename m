Return-Path: <linux-arm-msm+bounces-76598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE999BC860C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF2AA18900CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B3E2D77ED;
	Thu,  9 Oct 2025 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X86EFRVR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F85729ACD8
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760003611; cv=none; b=JVyY0Tx5Hqj2WBza0g9vqQd4zNeQJWRZWaGqWRviT4X2ksFwni4KAyuL3/n/wIiw2xe1wORacx/ZxUIgVD2qN1QNq9339d5JenNHUSnZ8b8gAcSD7HhfFnE22U5mqxBxJg6UW/OSpwnMCVGsmIP/z9lSgyB5FdrVAKQMtQTZpOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760003611; c=relaxed/simple;
	bh=O9cayNh7nyMTio8IwgC75UyGQLN6c3TkWm0LycqPbIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6LvT0ax6RJTblI1h2+2VHYVe4ZRWpczzhK7ERvKvq1jX9U3SlyeifV2ZCxIWO3fLNyq3U+Lns//mSZTPzH+vBD5yQE1uA/uVDH/6UXRcBdOcVpGrjgyKOKJW4yQDmmZ0YtmQ0mKBhTIccJZzOBIbvzUalc5kTWQ9km90RGCIeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X86EFRVR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e326e4e99so9151715e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760003608; x=1760608408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Wkk9wTKAcqHKVQ7Lts2DPXd26laO6sEh4NcRLvzjus=;
        b=X86EFRVRO60y3a5JKk6RytnfUrVgFEoCX+9PfCUaeQRgml0OqiaR8kJUAwl8sDiHH5
         f1fFRORR2lGH+8no5rrWrF834mTzugiiG1VVnOCaVn70b3BOxeF50Vbq5WDMV99Py4NX
         6cNHH8kEl6yVPmGK5jtIUAC9YeE/n4WxpC7pzHfT3uASSXsLvzAW0Qj9ZvRbLM5czvn7
         ericL8ksxEUJK6L2uL78f44+zqmC5Xfrpf+icGcHIa1KWX5up7CpNMSTCKfREs5qcQxf
         8Ost6wWmreKd221/Wmc1+KiGYB5P48qp9dfpFdX4EeIAhjCBlHb6+4HRwMRtkAzSvzi7
         7Ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760003608; x=1760608408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Wkk9wTKAcqHKVQ7Lts2DPXd26laO6sEh4NcRLvzjus=;
        b=Uut/7TjBe4H1AL8Vt/2KytM4uwCxGgBOgMIxZFltFXULhuE8D6L9MFl77Rkg9A+MXv
         o8IB0U5HJQeBvpVYF6RBJooIYW+TrE8dlLEqLsK4hVqUTzKqrkesaFMk2gWJcI6YZPLD
         b6AjfBhniDx3nAnWOF5C8Funk55C8NFycz2Zmd6R+v3eW88W1X9WLtcMbCTHDKtLoeeq
         ZjYDS6dGvkIF/lbnl2Fs+cixg9RItb9hEOx2M4OZhNn6JpKsvCAuJ3Ezv8XtGcVpYfyj
         29/NXKMTxM+uMiqfENc2jNnKmLkCX7KbnrHFN/+hMXepXZsr1gB05k7o1jP+Cw1A2AgZ
         SSdw==
X-Forwarded-Encrypted: i=1; AJvYcCV8z3GR46BuyZoQZRvcewuOHuOQGr2BLnUe6RPIRn+vzRzjPFiiE7oKRYPol7XkyoYhDlGjqUBmt7Y/uLJP@vger.kernel.org
X-Gm-Message-State: AOJu0YwER2sfUnBG/0iF6YcADcmE49st/XnAr/BN46bIre7z5/w/LNpZ
	gw5ZMDmeJpDDlAYneRHpR1IDVT2uyisT3PfaRiVOnOMNwXJ2XqFw9Ja72Cpwt2MjxF0=
X-Gm-Gg: ASbGncuRDzJITsmMLcPgnLM/RFJnoB4ST7edF2YvxCbBr2mMY1OliM9olXioKProKlQ
	oZxrZosUNKIWhKiSxItfSZwz4LrG+XzEaMX7MSldDJTEL1pDMpBeCRilZfMb6sZPeE92F+Uz2WT
	M1RGNKywuf1Q0Q6cdWbe1bAQEJkQZPye3tGHPARUQJ5L3PIj3oq13nxsEkr7xfZlaP3Ay5yom/B
	/RZEaqP+Zaqz4ezfVo23uYxmcUBSDJRg7GD/92ZbbLK8GktM/U7HwwkBsp7f4GvMD/LBYlzXWG7
	o1hKU/91zl+kD0LMBY2IVxqpmzfFXXqZKOo0NlYGNoCW7bsP1v0S1H6thdiBRlLgQlwLbylIFKX
	WSeAL/rgJ9fNtv9QtLwM+vcZ1qN0CVmIC17cJ7Oj8l6PvTupErqgBXEZRMg==
X-Google-Smtp-Source: AGHT+IHXnggF01KMLdLAYb6U3Qm1a/PpNv9gKJjLUmDiaJPWMKlXI5qvZtInlszm2rPCoHaFbQWHkA==
X-Received: by 2002:a05:600c:a105:b0:46d:83e7:45ec with SMTP id 5b1f17b1804b1-46fa29e1e0amr57776085e9.11.1760003607580;
        Thu, 09 Oct 2025 02:53:27 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9c07cbasm77804775e9.7.2025.10.09.02.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:53:26 -0700 (PDT)
Date: Thu, 9 Oct 2025 12:53:24 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH 20/24] arm64: dts: qcom: glymur-crd: Add power supply and
 sideband signal for pcie5
Message-ID: <qudnwwle62rekkuaeriqhvkvk5xukl4fmkhkzjse5zud37vlxl@gek6nmscgvgs>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-20-24b601bbecc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v1-20-24b601bbecc0@oss.qualcomm.com>

On 25-09-25 12:02:28, Pankaj Patil wrote:
> From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> Add perst, wake and clkreq sideband signals and required regulators in
> PCIe5 controller and PHY device tree node.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 68 +++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 3f94bdf8b3ccfdff182005d67b8b3f84f956a430..03aacdb1dd7e2354fe31e63183519e53fa022829 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -107,6 +107,20 @@ port@1 {
>  			};
>  		};
>  	};
> +
> +	vreg_nvme: regulator-nvme {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_NVME_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&nvme_reg_en>;
> +		pinctrl-names = "default";
> +	};
>  };
>  
>  &tlmm {

so tlmm already exists in here, but ...

> @@ -461,3 +475,57 @@ vreg_l4h_e0_1p2: ldo4 {
>  &pmk8850_rtc {
>  	no-alarm;
>  };
> +
> +&pmh0101_gpios {
> +	nvme_reg_en: nvme-reg-en-state {
> +		pins = "gpio14";
> +		function = "normal";
> +		bias-disable;
> +	};
> +};
> +
> +&tlmm {

you add it here again.

> +	pcie5_default: pcie5-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio153";
> +			function = "pcie5_clk_req_n";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +

