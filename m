Return-Path: <linux-arm-msm+bounces-38053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 352769CF0FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 17:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE54928C44D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 16:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D654D1D5148;
	Fri, 15 Nov 2024 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qmovczre"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE21813BC0C
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731686729; cv=none; b=iWJ9EI8PROg0VSkH9p7NoLMZNjGMCMNKG6OK0xu6zIptBwUaaGRjmIpTylO1O85BBy3F/duS4EZhlI2mxBVpw8z4luMpSlDr2HJXI9OUHSDFm/bVnt4N6by+kS2u9XXUXvQdfexPL/VWGL9Mtywdb07NuTMrI2hT4kdGZJyrOj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731686729; c=relaxed/simple;
	bh=AiCrCdtxoEFEeIFaKHGzaI8DqsRzxsiTrVhWRGf7Wxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YpL3xYUGeSwTfvDJIgPHXBJsj/6alyehw4LaCF7zIP3+2r9mrp4XO2fCq8ENjcPSV1CltcdN+9lA5mXwvPbPxkllyVgN+4lOMp42V8Rncdte0GuMZZL7ZgtntCH5C1LcWPFLKSVmBqdBVkb9bFwBUQt3hG3m2b2P1+1fWSyEDsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qmovczre; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e59dadebso2312071e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 08:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731686724; x=1732291524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qv0WPXRPIqQqwTh/ogUFCfsKiGp9/hWbSnGnwEUev20=;
        b=Qmovczre8pQMW1M5dTdjcSEa7fB85Uw2wheDEe+uOkmKhdncPK4pUDMtowgsBteJYz
         qlg5qT0wVb7e7Bc2J7/RHzJYhaiSG/0MGWnZkSbj1+DKwe0AMpQ2YWynW8aSeskgxFr/
         Zt6GHpuA6cuo7j3N2FdPm5ULGj//JGYRwo+SqwNrRUnE3zNG5+TmmeW/bmYjFaMwZ0XO
         WbsKVSKPqLFt2zjMuQ9GDMMOuNeDB+pxCWeijfC9MMREEjlFYS0oSVPZs/ZZYPMmrL1g
         wThp9ssexpOGzouEjuMSUhyzGlmXqCkeH7QKoAsjiJYaSdd09RnYe/5yiQD9yJXZTyOO
         pfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731686724; x=1732291524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qv0WPXRPIqQqwTh/ogUFCfsKiGp9/hWbSnGnwEUev20=;
        b=nvnX9qNN5TpEtnxqoYqWnm2zeQoDB7qz/ifxNx/4emVph7IJOGTHFqGTmpd6rKvSH4
         lQ1awlWwqWRiTvxDMHIzXz+tPQICSromGyM/4gI1AhgS4ET1ogfjBtBlNqY+Q9ytHB/x
         In+ifQQrhOYp+capRVSYvssYB2FWYpPdRNaCyhYnwZuHTZCoM6ySJsi4+p0IS2mNSmZC
         KWUQlnN6UVEBiH2Lfycj6Lctmber5GehknJs9MPH16qyyB6saXvWV2chrtUM4/6jBdVx
         BqMPr+UKAysFzJ/36dmDCMyafJNkZfWlev3kZ06TC3UmM6z0jC1qrEvS6YzFimqPGpoi
         g0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Q95DOvrU3xIFfHEKvR6jlll+aM/06AsydhYZZAj7Afd5ARk9HXlaZgwTJ0IRxe7D/jOxTQgqPd/VwowS@vger.kernel.org
X-Gm-Message-State: AOJu0YwHL859sCJxU9622QpphP08HJ6NtuXVGYgvHyYzQOwEk5dRlylc
	DufxQfpc+8ryYQHmwpt88L52iY+We3EKEfZUfEU34fmS8l1tbmxHRpNGFfvClxw=
X-Google-Smtp-Source: AGHT+IHrBECP4OjSU34WVOJhQG9Udf7rrAPtjXGsGS2ldnGooEzSZ30zGQ8cCWs4Gi4JIBh8DsTSxA==
X-Received: by 2002:a05:6512:128a:b0:539:e8c6:7c1c with SMTP id 2adb3069b0e04-53dab29dc5dmr1918279e87.20.1731686723590;
        Fri, 15 Nov 2024 08:05:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da64f2b97sm612157e87.53.2024.11.15.08.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 08:05:23 -0800 (PST)
Date: Fri, 15 Nov 2024 18:05:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add support for QCS9075 RB8
Message-ID: <glvtcxuaniuzxg46rr2a6nvem2ruxxmvidafcn33xpeskjkqal@fyehlwys43vc>
References: <20241110145339.3635437-1-quic_wasimn@quicinc.com>
 <20241110145339.3635437-5-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241110145339.3635437-5-quic_wasimn@quicinc.com>

On Sun, Nov 10, 2024 at 08:23:38PM +0530, Wasim Nazir wrote:
> Add device tree support for the QCS9075-RB8 board.
> 
> Basic changes are supported for boot to shell.
> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |   1 +
>  arch/arm64/boot/dts/qcom/qcs9075-rb8.dts | 287 +++++++++++++++++++++++
>  2 files changed, 288 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 9bb8b191aeb5..5d9847119f2e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -115,6 +115,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> new file mode 100644
> index 000000000000..8d4a27a8f371
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> +
> +&tlmm {
> +	/* FIXME: mdss0_dp0 is dependent on this so adding a dummy node for now */
> +	dp_hot_plug_det: dp-hot-plug-det-state {};
> +
> +	/* FIXME: mdss0_dp1 is dependent on this so adding a dummy node for now */
> +	dp1_hot_plug_det: dp1-hot-plug-det-state {};

I don't see these two being used in the MDSS node. Please drop.

LGTM otherwise.

> +
> +	qup_uart10_default: qup-uart10-state {
> +		pins = "gpio46", "gpio47";
> +		function = "qup1_se3";
> +	};
> +};

-- 
With best wishes
Dmitry

