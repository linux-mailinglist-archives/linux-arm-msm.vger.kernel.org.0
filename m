Return-Path: <linux-arm-msm+bounces-25125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D77A925C48
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 13:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A02E42856B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB2C17A589;
	Wed,  3 Jul 2024 11:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oFAdw+/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D87D179954
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 11:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004582; cv=none; b=SV0GZXX1gQ+28qRBGW7AJ4RZYZm4h5uhfc43nokcUTQPo2gDS07GXIjl7vecfsq/VDjZ61v4sdRiywdO4yAjyJ5fuc5w0Xdie9E3Z27CCSuJBIt4Gdsd6uhoaQZzLu4AkUziUSdOx6/ZE8QYC+Qe7Br0LSxEq5CBcx71sC8hOnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004582; c=relaxed/simple;
	bh=LvSBtxEWxuVYS7CxvKWKkwY51EhpTRzSAwu7h7K0Wqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgGr/K4mKRkXwVAlG0DtiTgjIMZ2Dzrt4d7kO6fgL5gUjLfkq7ljY5++5wAeiSzpqWAVqZ80j4yEk9PD+1UKc+Ou/WQaiLgrbjrP9mhy9je9+sZUbKnly2J+WADTw1qx2dMZ3NFYC+g8U/7zbif9c+HOwsz4iE6OHQ11pUZhtB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oFAdw+/f; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52e98087e32so604532e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 04:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720004579; x=1720609379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=im1b/RxdrHSt8wujFjtbUuQ9aPQyW+sjarxKVIwXx4I=;
        b=oFAdw+/f1idHUvfxWukDmGGg4gwyh24US0VfGO7j+l48Wsciwtpcyl9gfIT+oY4XZi
         bNfuqTtLMMklH42qRUkw175u8tCjZ+qv0WN4m2iGcg+fx2Af8B/WxryD4WlgBV8S5KN1
         lWR5YPfAFYpWaFJCbnkXERJsdyB+aIVNjqYbi3NM0F7vy0XfYm1V6mYIYemiI6Ib8Apw
         GGoTCGXt02+6bwwZ/kivtH/GbK1dPnvpSfHD/OssU33PPb0eUMjkD2moPb2rxBUV/s6M
         /GnyGww6hSz87qNLZ8dogFRUMUYEpl43XbYUvIstrpUEclVB+/VkrC1WOaOwmxvK8imX
         RM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004579; x=1720609379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=im1b/RxdrHSt8wujFjtbUuQ9aPQyW+sjarxKVIwXx4I=;
        b=rEKwB7qCeKQwbR1x/EP0RSouSZEXqTFRuQ2xdMjycKsMTKKdBPfjowehGH92492t8r
         z/we4yUIbYw6Or+VXt0POr2qH9E1q2i4OhWQYdnFGf8MNI8eBnTthleOBfILD1D8P1Rg
         JzN219hGENm46NrsPTL/Bjz1LSLqs21QapLdPOxe6lGXqDhgYiit+zQihq5qp44dm1O8
         943O5Y60m4N80haZfAo5ZVjpBQ4BZm4/6sHT3yfm2hLAOB7aSTxlxzMwoSlkWQHFKhXB
         9OdFhtVc8DPq+vdQCud3uQI2sMGO6ui6QrO4nySR7HJNpzm+7KCXEdYRj5qZ7PWILm1e
         grYQ==
X-Forwarded-Encrypted: i=1; AJvYcCURkuTZmfhnCnJo0rPbgJRnGQ95Gzo09J/d+7nbHKlIk3huhTKQhQNvmfyU6aHWD0hjv74BvDGh3hCzSzI6Q3+vcDIoA4OCwM3uqilzMA==
X-Gm-Message-State: AOJu0YyTQEWJ9IBZOu18NNZ9zifrKtqXVdT7KXEHD4AR3fG5cDwHXcgD
	aR+RKotUGVmMu4Wb4VzO4MX8+W7MAisKkRXbnFod544494u+VNyojPoBZCtGQqM=
X-Google-Smtp-Source: AGHT+IEDg1CPm96hk7pBzbU18xhMMyXjzJowHnqih7mx71cOA9L6GtsgW5xU8ZTdE5oORxO75UsBvw==
X-Received: by 2002:a05:6512:b14:b0:52c:db80:d694 with SMTP id 2adb3069b0e04-52e82679565mr7964235e87.20.1720004578743;
        Wed, 03 Jul 2024 04:02:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab101c5sm2110487e87.79.2024.07.03.04.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 04:02:58 -0700 (PDT)
Date: Wed, 3 Jul 2024 14:02:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, angelogioacchino.delregno@collabora.com, 
	andersson@kernel.org, konrad.dybcio@linaro.org, mturquette@baylibre.com, 
	ilia.lin@kernel.org, rafael@kernel.org, ulf.hansson@linaro.org, 
	quic_sibis@quicinc.com, quic_rjendra@quicinc.com, quic_rohiagar@quicinc.com, 
	abel.vesa@linaro.org, otto.pflueger@abscue.de, danila@jiaxyga.com, 
	quic_ipkumar@quicinc.com, luca@z3ntu.xyz, stephan.gerhold@kernkonzept.com, nks@flawful.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 02/10] cpufreq: qcom-nvmem: Add support for IPQ9574
Message-ID: <lhpdxlbmjsfgmsr5edjg4io3bwb6rkp7xz6ztvphdb4cme264e@j7mr6wp7bmnq>
References: <20240703091651.2820236-1-quic_varada@quicinc.com>
 <20240703091651.2820236-3-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703091651.2820236-3-quic_varada@quicinc.com>

On Wed, Jul 03, 2024 at 02:46:43PM GMT, Varadarajan Narayanan wrote:
> Add qcom_cpufreq_match_data for IPQ9574. This is used for tying
> up the cpu@N nodes with the power domains. match_data_kryo is not
> used since it doesn't set genpd_names. If genpd_names is not set,
> 'cat /sys/kernel/debug/qcom_cpr3/thread0' causes cpr3_debug_info_show()
> to crash while trying to read thread->corner->last_uV as
> thread->corner is NULL.
> 
> 	Call trace:
> 		cpr3_debug_info_show
> 		seq_read_iter
> 		seq_read

I'd say, the commit message might be simpler:

IPQ9574 uses CPR4 power domain to manage core supplies. Use
device-specific match data for this platform that includes genpd_names
configuration.

Anyway:

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v4: Update commit log to include stack trace
>     Introduce qcom_cpufreq_match_data for IPQ9574
> ---
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index 939702dfa73f..95558586c2e6 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -428,6 +428,11 @@ static const struct qcom_cpufreq_match_data match_data_ipq8074 = {
>  	.get_version = qcom_cpufreq_ipq8074_name_version,
>  };
>  
> +static const struct qcom_cpufreq_match_data match_data_ipq9574 = {
> +	.get_version = qcom_cpufreq_kryo_name_version,
> +	.genpd_names = generic_genpd_names,
> +};
> +
>  static void qcom_cpufreq_suspend_virt_devs(struct qcom_cpufreq_drv *drv, unsigned int cpu)
>  {
>  	const char * const *name = drv->data->genpd_names;
> @@ -621,7 +626,7 @@ static const struct of_device_id qcom_cpufreq_match_list[] __initconst = {
>  	{ .compatible = "qcom,ipq8064", .data = &match_data_ipq8064 },
>  	{ .compatible = "qcom,ipq8074", .data = &match_data_ipq8074 },
>  	{ .compatible = "qcom,apq8064", .data = &match_data_krait },
> -	{ .compatible = "qcom,ipq9574", .data = &match_data_kryo },
> +	{ .compatible = "qcom,ipq9574", .data = &match_data_ipq9574 },
>  	{ .compatible = "qcom,msm8974", .data = &match_data_krait },
>  	{ .compatible = "qcom,msm8960", .data = &match_data_krait },
>  	{},
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

