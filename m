Return-Path: <linux-arm-msm+bounces-31578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 581FC9763B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 09:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E83E1F24AC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 07:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E928918FDB3;
	Thu, 12 Sep 2024 07:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PiP00cxs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174F418FDCD
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 07:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726127880; cv=none; b=bicef2eDbMKsWBuaHYTVOusujlkDa8SUj0uwe5I4h1Lv3XX2M3/rhCUz2YiRX8vuWE0S/LApQS1s2L3bGLGvuBPabIjnNSy46krikOP15sxlVc9o4iEbsZ6yjmX1Sa+2ow6rgnz3Bs/zMI0n7QQOk/7HfULFoeMKzri4knebBEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726127880; c=relaxed/simple;
	bh=sZk6X7+//cwv/reHFb1+fYSu1dtTTnDz3WHzFmKDqGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BansXKpiX6vJzdLKP6b5ez1jLOuQ3B5VTrtpKMgegpvhvKkLffkiVXxI/GjZnugfnMKm0LVbkIuLVluT0VHq5SyUiCDKwWVWPGyPmmZdaANKoJwJZ9wT0eYzI/N6wCZD0McYq/XCqSgLnJvK5DJqOjhJk9CG6zzsmsYcQPPkSCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PiP00cxs; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53568ffc525so824881e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 00:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726127877; x=1726732677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ox1m01XCLNWbr8nh6dVZJd3HpwbkC9RDWpp/m3khnEc=;
        b=PiP00cxszBkSVR8aWGB8sioB8h4ds02sT4Or5bw72J00BsDTwf+SEB8MbxtXvTDinT
         T1PajXcSzzgb/SloPzb15ykIJYiHSMdUaUkXwXKAC9+OS+GAnZBaTwDV/VsrckjoLBOh
         litBOvER/fcVpMXHVGAeBjFGnBbHEUaJMFzyLnOnoiG1WnMV539jXju6UdgYf/Zd87ZT
         isGv2USKzzEUkMn5tNnhA8//nWgg/0AK7naZncJS8lMz1w72+b49U2R45kanWLhS36D8
         HtR6XLtPDQiIwo24tXArcodmmsQLd2RyBsu2VXr+jMbMbVqfxoAzNcxNmvjTia8TV278
         4qxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726127877; x=1726732677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ox1m01XCLNWbr8nh6dVZJd3HpwbkC9RDWpp/m3khnEc=;
        b=e/QTCQB6xN5s8G0tqR27UFDZDnFDIeSLSeWo8mcrMxKGd4L+Axp6kX1YYUz5pljZTu
         wrzU9x8EaCqcKHTlkPPpo7bF+2GLkOZDT9kZ2vKIUtE951NKTG9xPugpTa/WuRFW7IdX
         fPwjlhW/fk94qO/5fC/YO6mJvX+SDa7zuABzMoplwkS+kNBiAucKo9IiQdrhCD2U/Ce0
         iML2Q9Xgi6VsGGhTDRhTvQGaTi1+syY7QtD+mDK7nidtkFfWVPDsK0JdWeKUo6d36vOF
         2szyW1Wlew0uyvaQ8URjjXFiYhYuIGI/eCK/GljaP59WuBMjg8dpiAYHpZzzY36xRi0n
         XmiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOj4+1d+eGVbQ7ALdlY6kB8X69WGyuScTuKuQwT0IPd5CjmZaRLWV8iSHldTB65G8ZOYzoFcrXd+H+/5EJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0sbcw9RtuH7081frH1kae/njm87QQElfbbfdqQX3+S9mbSTX
	AWLSmqwveZTW4y1o3dLejYdgfWXgJSDaNJBD8t9KLgSsrmE1WwDe9A4aMwbnsAM=
X-Google-Smtp-Source: AGHT+IEMx5McwfR5w48GvyKDso1IkapKp/bxkvo0CGrrFUuAGOcvr7DDSK6O5G6wN5uQdo3VlohPbw==
X-Received: by 2002:a05:6512:39c7:b0:536:545c:bbf6 with SMTP id 2adb3069b0e04-53678fb1dc9mr956157e87.1.1726127876818;
        Thu, 12 Sep 2024 00:57:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f903ca4sm1825185e87.192.2024.09.12.00.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:57:56 -0700 (PDT)
Date: Thu, 12 Sep 2024 10:57:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
	konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
	neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
	andersson@kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add SA8775P support
Message-ID: <5uttdpchtd7wjzppve3e3hby2s4adft2tv7ceshyuarir3ppiq@u2fcdqs4uqr2>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-4-quic_mahap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912071437.1708969-4-quic_mahap@quicinc.com>

On Thu, Sep 12, 2024 at 12:44:35PM GMT, Mahadevan wrote:
> Add support for MDSS on SA8775P.

Patch subject doesn't follow existing practice.

> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index faa88fd6eb4d..272207573dbb 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -684,6 +684,15 @@ static const struct msm_mdss_data sm8350_data = {
>  	.reg_bus_bw = 74000,
>  };
>  
> +static const struct msm_mdss_data sa8775p_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = 4,
> +	.ubwc_static = 1,
> +	.highest_bank_bit = 0,
> +	.macrotile_mode = 1,

Missing .reg_bus_bw

> +};
> +
>  static const struct msm_mdss_data sm8550_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_3,
> @@ -725,6 +734,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
>  	{ .compatible = "qcom,sm8350-mdss", .data = &sm8350_data },
>  	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
> +	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
>  	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
>  	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
>  	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

