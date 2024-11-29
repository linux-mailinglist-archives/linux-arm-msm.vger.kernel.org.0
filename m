Return-Path: <linux-arm-msm+bounces-39629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3AC9DEC3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 19:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84772281D70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 18:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF85F1A0AE1;
	Fri, 29 Nov 2024 18:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TjoxUx7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094EF1A01B8
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 18:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732906506; cv=none; b=iBB4JIFYSiSabvoev6YuUXdqv0PouDMzh8GWD0WBQm5TgWAT1JbC2LqYiEBDDAcIS3Q9ITVzzr3fCswYq8rIPowXGkLoXkUGktiPKj3VwrqYsj4fc3r5YO7ulUz/TdWq1GRvoZDrIXtZCndfOAif+qSePV4fLLYQkQ+E0vSFo8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732906506; c=relaxed/simple;
	bh=E7RMchv4y+AntKAlNoeAS7PUC1xG4c0PvSI9uNkW/VY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfYEvM5eZ3S60XHmg0a6sBrox5C2H67ZJf78NJh+E4eg40MLN97KBb/wyXOQHcrcpa0o31Tn4C9dGLtEzcoHhAFLyIDylteWPzegFJs9DZnch9gF+sHjOx+XG6jgzMuB1Gi6sBpX/0qL4oJhJIT6KYVlxsZ4g79JmL1VA93bBI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TjoxUx7v; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53de84e4005so2654103e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 10:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732906503; x=1733511303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wVpqKF5HDzWaD9sXJQFFkWoO/IvzFlRLrdhxrF/ucgg=;
        b=TjoxUx7vdGZuQaZGe2A78MiChrQocNyS1t5jOTf+7efCA/VNSQJVBnQYDv9HiSy7No
         2LDsU+hlcGDuFx/lnveWQ+v223wrt7+q/WqJkafXhL4Rx9mNo7MuEdM6hZrPH7bysNvr
         CqOlQt94xSHuL1D38tYHgkxwqPCl7kQUlA+uWSbh6tjr7amQGRc4/7tdyRVerCVIIY8T
         +/ZmkcjivmeiGhoWaSE38cweH2KBLDJp7rgFtk8V9v749KWym6/aXWpq2DgbKb+GsWUi
         J0mUT3r7f3j0vDuOSwdZRbRmRBLjgiAR8AlZb/RFriFP8UmKp4VY+f+eM+gg7aB2ct89
         Y8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732906503; x=1733511303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVpqKF5HDzWaD9sXJQFFkWoO/IvzFlRLrdhxrF/ucgg=;
        b=rgzZcuOyE9oDIRu/q6SJIzntIyWMvtrvFIzkQ4R19qpKlITrs5qRKrCSKIRjMJCDmi
         GYjlDlFRS2mops08MTaBGZpEXwVM3zBpGHETwO4O9syw3JKffAz3DRDCYa82/kYDpZyE
         O0WzCO8tzW5a7TcQ2Mqxd3cLkOQUlEdrxk5OhZ9Kzf1xzseaTU9n65MdG6dqUWcTLIqM
         MEVkgXoEzqwmRnW3ROipyNKn3AuMCg6NhgrKk9HMqxULiTk8gx5rovnuzyWYdIMk3DIV
         gTcP2EgcrT/0plV+dOVqQB5S03iVX4fKQ1CC3P/AMukL7hASju2Ae7XroK4oCiUPM11l
         veCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6QKdtq6vzQw5OycU0AdMTO3mLu/+VpZ0zSKHd4zOxHGTmhHTwSH4UeB1Gnu4l/cWDUQjtxQV/zh07EQFE@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+g/XZ1/DXxV8rgdK/J8gfTXApt5/ZsXYmcN1BhnoA2Q2mMRu
	+hPoNaL6ZBTqZhewdVWqrLUBT+PrycSIeiXqG1RDFqHqo7HVXkh04ixOaFaCWR0=
X-Gm-Gg: ASbGncu0Cb7ci8vhgkwU9PcSF8K2XsxaRh1rLCmv2HIiM8StcSJ2hP5wTxYRqrYT/IX
	Qy9DMXMQ0ntnFCyaBXNuNfsdsU18WdN4JITgYUZtCNOUNIa0MgUhTkyDNUMlIPy+vA3E4BCI2K8
	CafdT+jWrG+rQYp6m2EKwUdr518Kp6s0ipIALYJUXS8TelR2WC4dTpKEwr5DAeZg8xDmw4FG6Lq
	NMdTlqGerNz4KJZCRAPBXrDkKuarRjMP9XzHLqx+HbjKQ/qSqejPSoTGPNWyvBfRsSHWwtJlOmP
	dK5zSxztqqKEzjQtmDry0MNNcsDdkw==
X-Google-Smtp-Source: AGHT+IHl0rMozF8fyncgtwJnZuDNJR8Pa97HnX5NDJ1ulE+L6RXtTTJfzmFUESI9fNeMlRvrFf1Ojw==
X-Received: by 2002:a05:6512:400f:b0:53d:a93c:649e with SMTP id 2adb3069b0e04-53df0109024mr9144690e87.35.1732906503152;
        Fri, 29 Nov 2024 10:55:03 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6496a43sm552760e87.213.2024.11.29.10.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 10:55:01 -0800 (PST)
Date: Fri, 29 Nov 2024 20:55:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add QCS8300 support
Message-ID: <wbw7ftf7ogcylxbeav3vegyfgz32sc2h5plneo2w7djsy2kaeo@enkcbukosern>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-3-29b2c3ee95b8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127-mdss_qcs8300-v1-3-29b2c3ee95b8@quicinc.com>

On Wed, Nov 27, 2024 at 03:05:03PM +0800, Yongxing Mou wrote:
> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Once rebased on top of [1]:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[1] https://lore.kernel.org/dri-devel/20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/

> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index b7bd899ead44bf86998e7295bccb31a334fa6811..90d8fe469d3134ec73f386153509ac257d75930a 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -568,6 +568,16 @@ static const struct msm_mdss_data qcm2290_data = {
>  	.reg_bus_bw = 76800,
>  };
>  
> +static const struct msm_mdss_data qcs8300_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_static = 1,
> +	.highest_bank_bit = 3,
> +	.macrotile_mode = 1,
> +	.reg_bus_bw = 74000,
> +};
> +
>  static const struct msm_mdss_data sa8775p_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> @@ -715,6 +725,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,mdss" },
>  	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
>  	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
> +	{ .compatible = "qcom,qcs8300-mdss", .data = &qcs8300_data },
>  	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
>  	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
>  	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

