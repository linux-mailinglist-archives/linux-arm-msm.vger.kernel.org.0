Return-Path: <linux-arm-msm+bounces-42664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAEC9F64B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 12:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E09FD7A2FEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2579F1A4F2B;
	Wed, 18 Dec 2024 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/cQCzWO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDEC19E7D1
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 11:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734520815; cv=none; b=OvQxuRkHe6RzIK9pFq8k5JUuOyjGu/BF5rKatMtPQCwJqzA9cDeCFMKZkneMN9DDgsSPvsF5zV7jcrEcKlqf0PFW49/LGGrp6uBeEhc1WwsaKPLj7SUM1NuoZdpWeQiAxFufIbmDYYvLXIHX5O3Z2WaB/RXdQccc2M9KeGxRj28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734520815; c=relaxed/simple;
	bh=sueglUAFyw8Oo4U+mZ6RQ6wPmCtfoe9hICnRaNf+znA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZkPIzHI4LwGJL2VUBTCaKv7KVLJfiGXv1neM2VS+EAs/CEXlCvpMZkp88vhfNc4iPefbKQs75+T4y0yoNwcqucDpsDb6klfdTKSir6t55AvQui+tGwmLoFqTk/xMKtKjXNPJnh88u5ocjqmyT23qXLzp9z9OqKBV/zoLELc8X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/cQCzWO; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3022484d4e4so71029971fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 03:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734520811; x=1735125611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qjj+KlXAewunzNPcgO1iCpfTnrF5Imc7Y+KKQVgYXa0=;
        b=h/cQCzWOvlgGm1HgDdS/K+bETtN2kWljDtY8Eh5KQlE08Nj62B0wjFNyPqnjA2XF9L
         cl/w4b+r9zEo+PEHb+HIq2g5DUwP3FRpO9Iq76ul4vwBQUtte7gMWTjAaPJQindba+pg
         R8cSr69+o7qJjqZnT0JtjbjHBD+HEn1aA2IYmqxC/bOTUI5CdWC7LfkBqyubfIAB6VVS
         TN/eIcl0kg+Ibdo1CBdnmH/toe7gqLHM3qWTXzUA7oBd58GijQRLqkE0OTm0u2EgXURz
         phBuE/5vyZMefpTx1xj5nJspZSs7DOzXTNEDc0GiO0jEWDKy/6Wm0VizlgwKYZzJXZlP
         0JBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734520811; x=1735125611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qjj+KlXAewunzNPcgO1iCpfTnrF5Imc7Y+KKQVgYXa0=;
        b=wdqIecu88xos9R8oX63c+WH9u947SJzPj6jq/rfJhsQlBkU6lARKv2LP4WxYkDvuIE
         UNThxw6TqE3qjup0ylfh5UiIhIWaxMq0N3/nZ96o0LtYyzjpXZ7Wp1Zreb0ZDQb6PpGf
         6hRNS8YCJTQk8vTV3ixiDCXuNV5dfdLRuhdRxVBSSnI2IHTYYzf+BS0Sk/7FwlewFj6D
         TiUTqnqNv1BgXzoKnT1t2ypoenFFKZzshwnWcwxqHH/i/nLalNak693d7CodeVnvLImG
         SimRWvn+Qxk2C/NVXQZu3Ld02ryZGf5ihEFYbCEPRMlWOSWltZ4xQg2y/Ef69C4ztvW0
         giuA==
X-Forwarded-Encrypted: i=1; AJvYcCVrtMNSWB9wiCA9C0Senr0HZ4tGXeirBd5Zqemjfc39E6pljfSom2z4H3Fb6egnWfZX5JptdJi2SMvFAbuy@vger.kernel.org
X-Gm-Message-State: AOJu0YxrkatvtaeuvIwkTSR8rvv0isVCHK1GbU7DBLOCZBc2fiYkUPOP
	Lg78QxJxfCmTF20mN3yf+1Gh8k1of4fmrEyM2kPiwuc1CoqrvJDVMt7+okE9elo=
X-Gm-Gg: ASbGncteIPbdI+VPu0XqJLMXTxG6/NYP4xjOb4ZwNMx0yaJoTExSq9tg/RzlOgkxlfP
	oAbhAVvIMK9Q0Ijtq8sjuvLBKgdCPKUg1UIdKpkYzN5zzHw+IeVVtQzB7psCb9C3UjNkGKLDjbR
	7ayeeL7X8vY3DbHTDKRk4gll+13kMrzJC9C+YRxIZ0l8QfzmnWzYGhuWzfvaCUAaczwwJmPD5I3
	CXWkNDb/vGV2csXMgcBh1aOBzq+RDF+KJkf1KJnRQJZ6VUVDZc7KICpaL4jeaEcQZAltaaD45uE
	RPu3eMKPn+0nwl4SWc830JAa2MtrxWkIQf5V
X-Google-Smtp-Source: AGHT+IGoMLpfK0AlU4GXbEuAfh2gfaHTUuRjjC5sL5Ab5KUlHrgJDsb/9UEzt0pS0syIvxRwbaMgOQ==
X-Received: by 2002:a05:6512:15a2:b0:540:c349:a80f with SMTP id 2adb3069b0e04-541ed90142fmr1009563e87.38.1734520811195;
        Wed, 18 Dec 2024 03:20:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c00262sm1412055e87.138.2024.12.18.03.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:20:09 -0800 (PST)
Date: Wed, 18 Dec 2024 13:20:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
Message-ID: <mbtwyyfryvltkeicgmrzrfas3u35ocathehswi4rme5tbs6r37@plcl6gzpl2ld>
References: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
 <20241217-abhinavk-smmu-fault-handler-v2-5-451377666cad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-abhinavk-smmu-fault-handler-v2-5-451377666cad@quicinc.com>

On Tue, Dec 17, 2024 at 04:27:57PM -0800, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> There is no recovery mechanism in place yet to recover from mmu
> faults for DPU. We can only prevent the faults by making sure there
> is no misconfiguration.
> 
> Rate-limit the snapshot capture for mmu faults to once per
> msm_atomic_commit_tail() as that should be sufficient to capture
> the snapshot for debugging otherwise there will be a lot of DPU
> snapshots getting captured for the same fault which is redundant
> and also might affect capturing even one snapshot accurately.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 2 ++
>  drivers/gpu/drm/msm/msm_kms.c    | 5 ++++-
>  drivers/gpu/drm/msm/msm_kms.h    | 3 +++
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 9c45d641b5212c11078ab38c13a519663d85e10a..9ad7eeb14d4336abd9d8a8eb1382bdddce80508a 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -228,6 +228,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  	if (kms->funcs->prepare_commit)
>  		kms->funcs->prepare_commit(kms, state);
>  
> +	kms->fault_snapshot_capture = 0;
> +

- Please move it before the prepare_commit().
- You are accessing the same variable from different threads / cores.
  There should be some kind of a sync barrier.

>  	/*
>  	 * Push atomic updates down to hardware:
>  	 */
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index 78830e446355f77154fa21a5d107635bc88ba3ed..3327caf396d4fc905dc127f09515559c12666dc8 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void
>  {
>  	struct msm_kms *kms = arg;
>  
> -	msm_disp_snapshot_state(kms->dev);
> +	if (!kms->fault_snapshot_capture) {
> +		msm_disp_snapshot_state(kms->dev);
> +		kms->fault_snapshot_capture++;
> +	}
>  
>  	return -ENOSYS;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index e60162744c669773b6e5aef824a173647626ab4e..3ac089e26e14b824567f3cd2c62f82a1b9ea9878 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -128,6 +128,9 @@ struct msm_kms {
>  	int irq;
>  	bool irq_requested;
>  
> +	/* rate limit the snapshot capture to once per attach */
> +	int fault_snapshot_capture;
> +
>  	/* mapper-id used to request GEM buffer mapped for scanout: */
>  	struct msm_gem_address_space *aspace;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

