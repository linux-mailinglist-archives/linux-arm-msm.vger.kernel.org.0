Return-Path: <linux-arm-msm+bounces-20025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 633078C9407
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 10:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18872281860
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 08:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B944122313;
	Sun, 19 May 2024 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O9ojyfYg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D992637719
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 May 2024 08:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716107944; cv=none; b=IBUSOoRHZSnsGXrLvd7GqlEE9WwR/Xpe4si4wsFSGnRGOX89KOc4cWHWxYid4ayA/Efyo8jQ2Jsv6A5iAIjlcV00EemiJziKfw+QbcX011whmRpR/sLLNcJYORMY+uTVSTvp7hvqzLcJEhT+2ucXFmyXOeCGyB9SPbZQeC4+WwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716107944; c=relaxed/simple;
	bh=d6wZm7CpReGz2e6DaYDwfVBX+QA1br65OiBfkL/khl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQ83JZLXzhzWpThqQSdK10XvJcNIaOjH0Su+HNWujyYB5YfV/Qp59nHqDZLeZxDJQ8Iz/qU18VFKVRDAzkChH2JNKj6CqV9BDnqhhQTRZkXaiQLt37iJwca5HOuTyA2z2T8w3jA0a6PG+DRGpppEn+8PyHk8UgstFx4rmb5lW48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O9ojyfYg; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51f60817e34so3893187e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 May 2024 01:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716107941; x=1716712741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0cb4fPfYgzOYuW1pgv7CvKiZmFOMdUrHUL+6WZbiuXk=;
        b=O9ojyfYgafqvhiBtOWgQ+p+9NV4/KhEoZyB1PI1TxkSxVDUwfQLZCImV/wXr0AydKH
         rK+v3X45/KjyTxeJDiW3LcDS0+X53NKoFCz4EGZ0h2h0Uj1t5+nM7lDdJUA+HGsZfWbq
         KCaLafAdqMdkciqIV8OwLWxfXqJvo2OIEdhx1IULIPGPq2l+a0qU9i9pA75o1ocTcyoo
         /nlLINr4bOG9sSlpRpV6WqKvM4VhB2Ggr2a3qK8IhQUxzdn9EluKJqkPtYFjQPsPamD4
         HSewPQtOc2tVPsedxYNT0O7o42z5f17qwXqUzCcVWFk89Nq7/2FvUkzpr53Fyn/ww9bI
         kBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716107941; x=1716712741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cb4fPfYgzOYuW1pgv7CvKiZmFOMdUrHUL+6WZbiuXk=;
        b=QmAaAL90yM0GO4kGX7jmBlDuUJNNR8HMSZaVZc9BBTufMHU6oepxFMJnAi0CHg5Rvh
         dh3TNLtaxjOXjb6iWCbDU1BbU+E6a4derA0I1+FtsWBqxMhx8MhuNesirGM7g8fgUqRw
         ZOi55Dwm/Q3K8XOrmfZ0o1mNKEZroXYieX1T8wWyOMjjUP1srQkPtR6a+x8kpFs31UoI
         Jtcx0awWBccPI07IDcBkrJRPrb6miR4nvGgGDpP37Fwlv8X2GguZDEE0aqhutQwXRcc8
         k6x7H21wwiKJE77rf9MXpoDOo//GWFRS1yVnToDNB6msqp+WhfjZDqQB7oJ9yY7/4vJt
         J6aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA08PZu/KrxXOknS4LLLB78B/HeNuFS8qou09UZ2MKkr6bIjE4syztM+Qb4Qme9bttu1u/VidlPYWkybrfAhDpfoeMmtIyt6AR1LUr1w==
X-Gm-Message-State: AOJu0YznB317jRFSEP2CS9QyaYrb7INrTUZAos0MS3T9s0TYnsAA/zgT
	5nJuF9hj+1CmWZeGdMm20wKxZDwRWi4cZjheImmm06mFluaPE8VORGWx3+grfKY=
X-Google-Smtp-Source: AGHT+IHYefh+mQmjGIqwtgVnBkjoxCYLHGVhRTDgsf8KtbzOLp5gK7ayorEtx6Nc/vIW66BM9/XciQ==
X-Received: by 2002:ac2:446c:0:b0:523:5dcc:c72 with SMTP id 2adb3069b0e04-5235dcc0ea3mr9528424e87.57.1716107941093;
        Sun, 19 May 2024 01:39:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ba912sm3790508e87.75.2024.05.19.01.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:39:00 -0700 (PDT)
Date: Sun, 19 May 2024 11:38:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	seanpaul@chromium.org, swboyd@chromium.org, dianders@chromium.org, 
	quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/4] drm/msm: register a fault handler for display
 mmu faults
Message-ID: <uywsmpko7ttzqxtlw6i4n5y7zvny5xgdoxc66azbts7cx6vi5d@myrilzxtu7le>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
 <20240517233801.4071868-2-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517233801.4071868-2-quic_abhinavk@quicinc.com>

On Fri, May 17, 2024 at 04:37:56PM -0700, Abhinav Kumar wrote:
> In preparation to register a iommu fault handler for display
> related modules, register a fault handler for the backing
> mmu object of msm_kms.
> 
> Currently, the fault handler only captures the display snapshot
> but we can expand this later if more information needs to be
> added to debug display mmu faults.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index af6a6fcb1173..62c8e6163e81 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -200,6 +200,28 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>  	return aspace;
>  }
>  
> +static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void *data)
> +{
> +	struct msm_kms *kms = arg;
> +	struct msm_disp_state *state;
> +	int ret;
> +
> +	ret = mutex_lock_interruptible(&kms->dump_mutex);
> +	if (ret)
> +		return ret;
> +
> +	state = msm_disp_snapshot_state_sync(kms);
> +
> +	mutex_unlock(&kms->dump_mutex);
> +
> +	if (IS_ERR(state)) {
> +		DRM_DEV_ERROR(kms->dev->dev, "failed to capture snapshot\n");
> +		return PTR_ERR(state);
> +	}
> +
> +	return 0;

Hmm, after reading the rest of the code, this means that we won't get
the error on the console. Could you please change this to -ENOSYS?

> +}
> +
>  void msm_drm_kms_uninit(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> @@ -261,6 +283,9 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>  		goto err_msm_uninit;
>  	}
>  
> +	if (kms->aspace)
> +		msm_mmu_set_fault_handler(kms->aspace->mmu, kms, msm_kms_fault_handler);
> +
>  	drm_helper_move_panel_connectors_to_head(ddev);
>  
>  	drm_for_each_crtc(crtc, ddev) {
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry

