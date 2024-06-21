Return-Path: <linux-arm-msm+bounces-23657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31467912F76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 23:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0DFAB21F62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 21:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786D04A3F;
	Fri, 21 Jun 2024 21:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w6/pmwDl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A1A17C7BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 21:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719005006; cv=none; b=BPakDc9urp0ptidPHcaxLwvZKrR2sMoZgs36Sjgi7l+8wUDyIUkEmhuALblWhaNDi59KhCw2hanzLt0hPLLWD/44o2tUrrntWxb1lRm7LvY7GZ5RtoDUoG0nzJgNKf6ozITCJLBTCgrZCHUrRF9YTI/Q/j3E6npdMGK12hlkk3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719005006; c=relaxed/simple;
	bh=ZVeztje9EUQdYpB4LE1FyD1iGFLoRxXhdVQcdodG+ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMuQETuiSVGxtmZRYUzxKnOdK2biAJ53Z1U4syTz98v3WQavZT+N2uxnCZt8KZPY23YGACWMH1AB2njtaPxS/4eLN9qAj8myH1DNr+Zt9+oS/rFyjIK8MZ7CTrLFteOV/DFA32P6pfyvn94JiE/TyxDrqAxTMrz6ApBcEe2uzRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w6/pmwDl; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cdcd26d61so415604e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 14:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719005003; x=1719609803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mh1wRjWN5t1/jKB73EzwYyPfPHKCwEFO5625un8IksA=;
        b=w6/pmwDlIY2hF9rqxlGgTswRk2UDl5WyYIZlkmhKVnp69xvTOH4N6mjxqoI6aRw7uS
         8ud3bfEKmrfi6Te3ADlINGp3MAxlINhA2vnHiqeVGh3llKEiEmksEwVCbrMUEzXho8ZC
         lA70gVrsndGDBmTIIvCBw85/LtxGOzYR9c0yZUPBiqXwfYBOJAbXi51e9NJjuvi9VwRN
         Y/mkOx6goweo1QP8D5P7FT/cezthmulVXb/WjDBQNFda25AoyF/dDzjIZdczWTauc/95
         5sUdL9YDb+dWh+UzgDqwYOXMtO/HjUPzdFDPUzuHDoyElIjcNXsM/fgqHpOVVOXTjDxP
         tsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719005003; x=1719609803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh1wRjWN5t1/jKB73EzwYyPfPHKCwEFO5625un8IksA=;
        b=G7oag1m/i6C6YMeTmN6/DyE432Bd+dWR4alpUWvezNSt6wf2NVX698unSfy9tIb4QP
         /U+a7OmHnQphi90nXC2Q06BdZB8T8NLJwnbYdD7R9u65ZWTxlNeW7vTQ0VTnlB81aMxI
         pLFA0+IVEjRcjcDPSVwB5tdz3nhrB1MN6odS6etX/EkBkV1k0R5TeNosDzScWDt7tenU
         PgwOd7fMs2H1Egz6cPBsrjL9eeJc+qeDhhlbJSJMIArNdYeYFRE57chEwPrDuGAzQqpG
         wKD9Ob5Q2bktV/Jbi30yzOqffLOYGsXJ3/fGUOkIksnZQZIL+VSs5YB9XoTUZrdAj759
         JdDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwYH+1K2FCwFW6Y3axG7JX7Sm57Q1Qcs3NkVDrY/6H6cKQ87Iuzc1IZ0J3TbIKTfCSOspaxZOiwrz7bPM+xGaXf0zM8BjN/hFmYvAPug==
X-Gm-Message-State: AOJu0YxMOooRF1jSVRyIdC1dUiJrOB42fVY2tHr55ntJrfvFP6BDdgDT
	G73Oem5QCCxBse6a8NE9rBM3btODoq/ZP3f5IKbLJTqXwYwdMHDBslWWuO9KUyY=
X-Google-Smtp-Source: AGHT+IEEws3Gu1xymwfcBekyq/pzjX/PeYddoBuwFa0zEsRP4l+K5qUunAwj4KATjHZ6K+N3Ske+RA==
X-Received: by 2002:a05:6512:324f:b0:52b:8ef7:bf1f with SMTP id 2adb3069b0e04-52ccaa33fa2mr5352345e87.17.1719005002922;
        Fri, 21 Jun 2024 14:23:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b4a0bsm309018e87.20.2024.06.21.14.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 14:23:22 -0700 (PDT)
Date: Sat, 22 Jun 2024 00:23:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: sboyd@kernel.org, andersson@kernel.org, bjorn.andersson@linaro.org, 
	david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, 
	robh@kernel.org, sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: Re: [PATCH v9 4/8] remoteproc: qcom: Add ssr subdevice identifier
Message-ID: <zyyh56ohozogcgms73jh2c33i3c5k7cazk5godm5sxxnztddqk@h2xagcardsw3>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-5-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621114659.2958170-5-quic_gokulsri@quicinc.com>

On Fri, Jun 21, 2024 at 05:16:55PM GMT, Gokul Sriram Palanisamy wrote:
> Add name for ssr subdevice on IPQ8074 SoC.

Is it SSR or ssr? Why is it necessary?

> 
> Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>

Three authors for a single-line patch?

> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index d8b79765d5c6..06936ca1d079 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -1170,6 +1170,7 @@ static const struct wcss_data wcss_ipq8074_res_init = {
>  	.crash_reason_smem = WCSS_CRASH_REASON,
>  	.aon_reset_required = true,
>  	.wcss_q6_reset_required = true,
> +	.ssr_name = "q6wcss",
>  	.ops = &q6v5_wcss_ipq8074_ops,
>  	.requires_force_stop = true,
>  	.need_mem_protection = true,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

