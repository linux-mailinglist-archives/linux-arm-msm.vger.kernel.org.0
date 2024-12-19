Return-Path: <linux-arm-msm+bounces-42791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDDF9F7C1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 14:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C48A718929DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 13:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B722248B6;
	Thu, 19 Dec 2024 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jcdX2DiG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF5B21D58E
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 13:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734613971; cv=none; b=MAxf0P1hXA8koxTkbyIUqPU2oI9ZQUeMCCNCcfilrHntb8I/ih0IEvdsUGWbwFv71as/+3j1ed9C6c3D+Zqm2iaIobN9cveYiSckQL2Uy17t5o9Lb7lXcv8TOwxxWFgDHmdvqdVyT4kW/G+tJKRjKV1tKLc/ErE2db9Tkxcki2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734613971; c=relaxed/simple;
	bh=iK05DBAeu0Y3YAscJ8+7IXxgZrL60dLlnGJ2hM2DOTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dj0GyncIZhlldZmtOAPFFfVj3mb7l1/0itVuC2T/taGFc+oMNp4KHeKoC+kYs4tG/k3oErAs7MES0+U5bbYVfE0SiGcfZqAlea4WbusiLkPadTu3fSI02/KcQwlHUdLzVRre9qyTsP4s3IltXAL5IVGlQWB+NJz8/gYA6Y90Qno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jcdX2DiG; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-540201cfedbso625013e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 05:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734613968; x=1735218768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eY6Z0S57em9vHgQR4I6gVcXbF/PuYBYPSAnvDRTKdQM=;
        b=jcdX2DiGHb/JUk4vFR5JtlKpynwrzBr3EnWyivB3S6678gOPuhi9ZnB2rX8nIf4/Fr
         tSrtkcC2R72jlxDdbxji140pRees0/gJ7UaEdDonAe9lqhgJCVdiw8ZPwjnxezxmZMC6
         CgVsGWjypJ8u2H/lGbPILXhArxF6eADyNVTYpXmNAbY8q5hd/BLcuNhlVHdzP8uxNHiz
         0V+0wuxDyICLERIAaL0s9DxESOyB4wk3OXSIE6eHjQZF7CGgUPU15ozLe0Kh+t9ICldx
         cw6wbImb9g9TF2VovZxYRVKcvN8YyDOxlsHznJamVnxjM8YA6HkEf094+dCid0MuUdDQ
         WEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734613968; x=1735218768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eY6Z0S57em9vHgQR4I6gVcXbF/PuYBYPSAnvDRTKdQM=;
        b=AN0L1m+Ml/ri0EdJztlhS6WlQIpMgDA/QGuP72tRUH7liEx62K8zwyPkKQwHFRmtnp
         8P5gk+xROO8avCbu/UItFi+kmK6xQ9KpmEGKk3PfFkiKJ1FGcdF5hdM0FgfVhSAdngE+
         /lBZ8hoctK2m7S5O5q7gMzeuNIA8kc0b98m1aW8M8PRdidiwM5RXCtLHDS2xszhyKRx7
         Kal4ANpuZ5T/K4nB8Rs6egidIedfoZnOHudDLFoSb5AH1mJtZ5PQ9cquSCqXbuuN7GLB
         lvurttGR0VMh0PrQZ6jnbTG+XnMQd9MOYjor80r3d79xcFt8UC2ZyCFmgJPdap2xWQeF
         GvlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLlAqnTTJgME9ukiwQuIAbR49AdR14glitKW8rk8mxc1hqQN68b4zCrq9AH7pmKXkk+1GPJxNSVDId5GGd@vger.kernel.org
X-Gm-Message-State: AOJu0YxWdujU1dtgeAbKFgwz37tdcyzAQwpN9aLaTFh4e/M2W2Q49UZm
	cGCTgbTsdXrZVbcm3qBlbWj5C02ZzAty6ShXFODmPQsMZyUOQRff1NFrBC0eCU0=
X-Gm-Gg: ASbGncvCtn1Rsg2m5COWucgcfyG0f5tjXE3fu/InfYMl9vTYlWnDev6UmyCH/ZLU+7P
	+NdzuWWkgksNKSjTKHg20Lc8ybBZRe2jumrn58KX9dXM0V+dSjL2uJ0CI6TwyFln658x05e3GL0
	G2b/oZMtfBBsjuAwyOOdxvyeCHMAv8Azvxu+PfkPvINv+IS/FGFvTugPDR7xf74XARIBiN2a+RX
	ZTUUdSeqhciq+5F+L8l4yasNyaI5eHZkZ5btJDXuS2ewvF/8TbTBMbfjzgZ5wqaAnx+4Z+Pzrmr
	Guz7t8Yu4M3kMgbY6xBb5nne1Xz6H5++wg5W
X-Google-Smtp-Source: AGHT+IEVea9+vCQvrRgr9ejnNTBStIWfOUMmqzn46gKB6ilihrcG/FQySdfgi2BmIkYFBlgtwj4z7A==
X-Received: by 2002:a05:6512:b97:b0:541:d287:a53b with SMTP id 2adb3069b0e04-541e67473c6mr2166847e87.19.1734613967889;
        Thu, 19 Dec 2024 05:12:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600125sm173459e87.101.2024.12.19.05.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 05:12:46 -0800 (PST)
Date: Thu, 19 Dec 2024 15:12:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCHv2] media: venc: destroy hfi session after m2m_ctx release
Message-ID: <yp3nafi4blvtqmr6vqsso2cwrjwb5gdzakzal7ftr2ty66uh46@n42c4q7m6elm>
References: <20241219033345.559196-1-senozhatsky@chromium.org>
 <20241219053734.588145-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219053734.588145-1-senozhatsky@chromium.org>

On Thu, Dec 19, 2024 at 02:37:08PM +0900, Sergey Senozhatsky wrote:
> This partially reverts commit that made hfi_session_destroy()
> the first step of vdec/venc close().  The reason being is a
> regression report when, supposedly, encode/decoder is closed
> with still active streaming (no ->stop_streaming() call before
> close()) and pending pkts, so isr_thread cannot find instance
> and fails to process those pending pkts.  This was the idea
> behind the original patch - make it impossible to use instance
> under destruction, because this is racy, but apparently there
> are uses cases that depend on that unsafe pattern.  Return to
> the old (unsafe) behaviour for the time being (until a better
> fix is found).

You are describing a regression. Could you please add corresponding
Reported-by and Closes tags (for now you can post them in a reply to
your patch, in future please include them in your commit message).

> 
> Fixes: 45b1a1b348ec ("media: venus: sync with threaded IRQ during inst destruction")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

This is v2, but there is no changelog. Please provide one.

Also please don't post your patches as replies to the previous versions.

> ---
>  drivers/media/platform/qcom/venus/core.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 2d27c5167246..807487a1f536 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -506,18 +506,14 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
>  void venus_close_common(struct venus_inst *inst)
>  {
>  	/*
> -	 * First, remove the inst from the ->instances list, so that
> -	 * to_instance() will return NULL.
> -	 */
> -	hfi_session_destroy(inst);
> -	/*
> -	 * Second, make sure we don't have IRQ/IRQ-thread currently running
> +	 * Make sure we don't have IRQ/IRQ-thread currently running
>  	 * or pending execution, which would race with the inst destruction.
>  	 */
>  	synchronize_irq(inst->core->irq);
>  
>  	v4l2_m2m_ctx_release(inst->m2m_ctx);
>  	v4l2_m2m_release(inst->m2m_dev);
> +	hfi_session_destroy(inst);
>  	v4l2_fh_del(&inst->fh);
>  	v4l2_fh_exit(&inst->fh);
>  	v4l2_ctrl_handler_free(&inst->ctrl_handler);
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 

-- 
With best wishes
Dmitry

