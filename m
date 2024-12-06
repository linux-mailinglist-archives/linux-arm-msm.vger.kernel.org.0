Return-Path: <linux-arm-msm+bounces-40737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E73B59E6A09
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A5052826BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770BB1DFE16;
	Fri,  6 Dec 2024 09:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WmJmKkcW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED3C1DC74A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 09:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733477229; cv=none; b=YxaYGRfRUh41MeEfGJ/zrP2g8hrVDdF3K2qKHIPs99yBhrQHAZiv8LoQeU+Fxz/QL8kdof/LeG0DMy1ie9Fg7eI2Q4Vn7Yns5tZfGmCCAw8ezADBNdS53faMG9BlEiDOvKVaAyMrd+d74LYk6bbteGEl9aw7+JneCFv1CEFEHKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733477229; c=relaxed/simple;
	bh=oJo/CpCSdJWkkXic5KnW81eS91w7lC3xh+a+smGHQcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FR9JbdtZL5AQbMZdiP7QRJwnoAmbSUj9goh38J+VFqP8hnFweivukGeqtRPdU2m8J9dh/N30e7ppsVJSlNcty3RmrZW2WC3XxzI2f8MvkKspq9zjG5tuJQmdoUUGNaDLZ8EiI1T5DbFhTi9VH1DO1ioxvVB6iU4vL5nikEuJKgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WmJmKkcW; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53df6322ea7so2155727e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 01:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733477226; x=1734082026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7broW1gZ7NVHflpX84N2WQlsqRcFTPMTUqNg9tqTtk8=;
        b=WmJmKkcW5CODlS/BvXHeX0XLT5AMCIyosDENYK4SqweHaM6Swz4KhorZLMzF/hXXq2
         4TIYgf644pGiM7QpHL3ko1NhK+qrLG4jepSQ7Z2IyW2/jQaGfA4NBJbWK6m4lpPKbLx9
         pSnLzSCqqSE6p4m9RhwlDHGiwYwvrIhLukG5dJmsFCjg/XwAHl8W3cZArH1imuwwfFEM
         UQQk0u8Lr/g47oN4uDu/G2QHmXIk5O823gNOZ0kG2k5vsAf1Xj6lyXHrPX1vaEVSGpzj
         eKX8IhlliEzxRqa78nRQFDS3sLW8OmcD6U2MnCXkQeFmZLLGYbkRiYvjXcTqydAo0+z2
         y1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733477226; x=1734082026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7broW1gZ7NVHflpX84N2WQlsqRcFTPMTUqNg9tqTtk8=;
        b=ckRNgPhLxQ7Uw8VK1IUyEM4gP8oehVSkHtiomdXcEJ1YXIpMqvTLc7II/QGNE54X+7
         nOiOeFyqo1BGcS5bJn7a0+iKaMtU2BbSQvP+ZGaaao4ugKvYl+eGLMm/+n3hTiPLce4+
         m1TW2+ulyt0kbLgPXMVtYKgPhsDVP1tnfzdSj0MqiN2vD5JP2QQVqoyl3PeULHbBK3e5
         XRsmM55tSueNHod6cTdQ3MkXSgbPoQ89Lq3BK6z3P5ES1L0UvVW/CFUoE0gHawtAh4Zf
         8Zv8W5ju9HfVDSpBmAPRhDltBvZOSuJZpimP98ZlSB6c8BjQ/b3YVfmoZwSq/sD5CrOY
         6xSw==
X-Forwarded-Encrypted: i=1; AJvYcCWTPd+ralt28O9sGEr9HlvfMl3MBe9xL9zkQusC2W/AsM+DKOlOY0UAAnDgZqdESMzzGXGtrMurTQdfla+R@vger.kernel.org
X-Gm-Message-State: AOJu0YxZqlvyAtpTflUMtT2H9fOmqHoA9qGiz/jpQFsrXlI5/bFio1ad
	2O3+DbFB7Zsyhvs788HUkAwHJW+Q1S3yoVvI9p41q6JOo+jsKA1v41Fpowojyk4=
X-Gm-Gg: ASbGncsQkSJvt49ifJqlW65qzM1GOuXbaLChFZYdZSmhqePMIPMOge4CAGPy8GchQ1x
	t0H4WFiP6onrJ0Vr4p9QDbMoTVJ9tD5tmWROaM+4q/OsrJXmjrKV0BdUI0ie6ht1wnCV7L7xz9Y
	zDtS9yKjEl7K4687mmbL8QX23IqY4zFF2qDmd6/B8uSRi/tDGpiX6FKsXBVoxqXtUm1FTvU22pe
	AjvR+8wxPSQyMpHIoqn1cLny7uJQ6PgwXlkS2J4k2y1Tikp/W0jgjku1L602yQPZupsZYkcEZk7
	4XztEgiPFmBoMBulazl/lgG7Dca1aQ==
X-Google-Smtp-Source: AGHT+IE19qPwbx3UFDXuLqxlrNLClxfZsWNhadyWFpGu/ahSESOQg+xnLVgzOuZizB2iVY3wNhLDgw==
X-Received: by 2002:a05:6512:3ba3:b0:53e:2751:84fd with SMTP id 2adb3069b0e04-53e2c28e5d1mr584353e87.1.1733477225873;
        Fri, 06 Dec 2024 01:27:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229c23d8sm445851e87.211.2024.12.06.01.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:27:04 -0800 (PST)
Date: Fri, 6 Dec 2024 11:27:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 37/45] drm/msm: add support for non-blocking commits
Message-ID: <odawd4djmpowav7beu76s3m7xtocw7tqsqjjkl7n5xxupn5u66@wpytoudtcizb>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-37-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-37-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:32:08PM -0800, Abhinav Kumar wrote:
> Hook up the mst framework APIs with atomic_commit_setup() and
> atomic_commit_tail() APIs to handle non-blocking commits.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 2 ++
>  drivers/gpu/drm/msm/msm_drv.h    | 1 +
>  drivers/gpu/drm/msm/msm_kms.c    | 1 +
>  3 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 9c45d641b5212c11078ab38c13a519663d85e10a..801399419c3d26f68d9b0a65d41fc4e1706c70be 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -210,6 +210,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  
>  	trace_msm_atomic_commit_tail_start(async, crtc_mask);
>  
> +	drm_dp_mst_atomic_wait_for_dependencies(state);
> +
>  	kms->funcs->enable_commit(kms);
>  
>  	/*
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index d8c9a1b192632d3e29ff125bd7bb2d0bb491275d..1616a4682795f6b9b30cc0bef2baf448ccc62bc0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -30,6 +30,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dp_mst_helper.h>

Please don't bring extra dependencies to the global list. Individual
files can perfectly include the header on their own.

>  #include <drm/msm_drm.h>
>  #include <drm/drm_gem.h>
>  
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index f3326d09bdbce19d40d0b48549c330c2b836476f..343ad9e9988f6c8d99c5867cf8e81ae625aaa90d 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -28,6 +28,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
>  
>  static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
>  	.atomic_commit_tail = msm_atomic_commit_tail,
> +	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,
>  };
>  
>  static irqreturn_t msm_irq(int irq, void *arg)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

