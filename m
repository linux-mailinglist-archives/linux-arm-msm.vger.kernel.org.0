Return-Path: <linux-arm-msm+bounces-45302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F14A1403E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 18:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 494C13ABFC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 17:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7B422FACD;
	Thu, 16 Jan 2025 17:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CdeE0d38"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8DC22C9F7
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 17:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737047130; cv=none; b=CmdZ5tEamDXryUwFKGlha1RRPuXMmyLCL7qJ9tgVomfuw2+HNZ0qhaSroZ/xCZNrcBkmPbpzvlCNA335pjGkf/4K8Lpg5ZMYewNVgwbGcdNRfPwtAnN4tYzBJ9SByFE+dxy9nhr9BgYy9egfqB7cp4uDGXinPE4d72x1zRtjH64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737047130; c=relaxed/simple;
	bh=fM5I9GHoHMCA0Lg4ON7OCXeTs1Wova5Z+8bR/0rTTQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASDGXcnJBWhbLNwvOR0sjcsIF/v1U1dMCp5g1tzT2M/smirKq8eIB+RbcXzMz8TJQAQYV2CPmCY0+ALmV3UYtbaXiDZ0/2RITZtoDQAijMM4O3m2E1KcLuKZYCcQHsMtq9glfJj6vLLwlm6Nu+pv8yPUFb6WEzh9+kV9dLJEFM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CdeE0d38; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5db6921ad3dso1396735a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 09:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737047126; x=1737651926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WtqkGBz5EldVcum4M1/PkK69H6/PIvSUrlZUqRXKsUI=;
        b=CdeE0d386JNYN7wRlqYQ80JsxGvM1ocPdcd8PfXO20g2sjMWek1QtNACM9yDZ3mDKM
         N0X44TRO8a2mIZAsbiyRyJm8HcIb3aW1WbqdWy9GUwUBeHb2du6tvlUek4QsmFUIeaqW
         caWVpzQtbkSpU4K3nuDp7W5H5CgfzZoeUBxyK7iXielJm+vHXpaP+gcoKepX9ziNU5cL
         MmIOjOyI6z+Tlk0vHQTWyO6mdJhcygU9FxmsI+EYZUl9eaL0/jr+Lq0eYblN46flsNpx
         F2zfCzO9iLPVawSOE+2OSKHIzK+zGXtSWuf/MuxLzfRgRNMKC+hBt+CwtQwAzS4DlZcB
         UIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737047126; x=1737651926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtqkGBz5EldVcum4M1/PkK69H6/PIvSUrlZUqRXKsUI=;
        b=BL7kAiR/ywWgsGu2YlfBlvPihN6kGx4EfzpLCpnwsKLMizsuZBPvnkNwFpLXcJSn8L
         uuz3E9cJc8PtjvBr4nvtJMeJ1Qp/4IMDNW9fQS3Igge/XlLVPvQIkQear8Yj8Gy1X8ik
         lCe8ayTEgcQSIAg9ttvJKXYOOln/FlJmgB7Go74Z5v8FudIndx9EEoKlYeYixkhnDzMB
         pjKyQELS4dqAnz7bs92mfNMLIR2CYLQi/zG7GJmKJWI6rXNzKInyWV+heE+zDsQ3GsMZ
         WJY6g3i+aJqRfLkzVyq7QsakV7QDBQK5gY8MeWjjuuZL4PZD+yuXGp0V/2U5WFs4t+pf
         nWpg==
X-Forwarded-Encrypted: i=1; AJvYcCXCzCZyboZtyxwlZS79cN7tx5s5FDaxlByaJlrblbzMuKVnI6IJ1d97Mq3dP4XRJJgLfRKY7fqVeYOpUE7f@vger.kernel.org
X-Gm-Message-State: AOJu0YyBr9Oe0Ih07mckFdeGa5Qc4ggKE8r+unEkK8kk8BY1BNY3JLhO
	S0xksau5HioLRoDKCR6L1fF1ZxoB/D9U9U9tGCGLPsIDNB5kTlg/7hAqUWR8ddU=
X-Gm-Gg: ASbGncvR69gcDwhGSNtKDCJiXNjkptxuSKxzcVySmGx5aNP7HSVzU6CKXA5CYwIRvJd
	VZEIRdy1s6PAh82xo8El2AIUMGzOadMQBBNtZcI98HijnxXm265XUx8Ly0V3AsWZFiLeOIho6j0
	mKzPnrhx84POgGyTOKmrls3CcvqizYGD7lMVSOa7HPKBICPTYl88jt1F334mqGMsU5OG9Z83LqQ
	gKgNSbuEG4cT0r1egblo5ClUwqKIzRmpgAlzQaV9MYxXAXkXyGDjvI4bOasz/CthCXZ
X-Google-Smtp-Source: AGHT+IGQwH9VK+ITSXPqiXT+6WmJreamVlwpYOx5oDkYfmjm8Bdo+i6oCALmzIKHRXzb/M/vletJrg==
X-Received: by 2002:a17:907:3d89:b0:aac:1ff1:d33d with SMTP id a640c23a62f3a-ab2ab740dd9mr3087672666b.30.1737047125884;
        Thu, 16 Jan 2025 09:05:25 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:d082:eaaf:227f:16cd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73670ddesm195646a12.21.2025.01.16.09.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 09:05:25 -0800 (PST)
Date: Thu, 16 Jan 2025 18:05:19 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750: Add BWMONs
Message-ID: <Z4k8T31cw_CxHFLC@linaro.org>
References: <20250113-sm8750_bwmon_master-v1-0-f082da3a3308@quicinc.com>
 <20250113-sm8750_bwmon_master-v1-2-f082da3a3308@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_bwmon_master-v1-2-f082da3a3308@quicinc.com>

On Mon, Jan 13, 2025 at 01:08:18PM -0800, Melody Olvera wrote:
> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> 
> Add the CPU BWMONs for SM8750 SoCs.
> 
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 74 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..09fe3149da1926b74a98280fe209ae7f423db864 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2802,6 +2802,80 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
>  			};
>  		};
>  
> +		/* cluster0 */
> +		pmu@240b3400 {
> +			compatible = "qcom,sm8750-cpu-bwmon", "qcom,sdm845-bwmon";
> +			reg = <0x0 0x240b3400 0x0 0x600>;
> +
> +			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;

The start of the interconnect path is QCOM_ICC_TAG_ACTIVE_ONLY, but the
destination is QCOM_ICC_TAG_ALWAYS? This is strange. Interconnect used
by the CPU should be QCOM_ICC_TAG_ACTIVE_ONLY.

Stephan

