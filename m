Return-Path: <linux-arm-msm+bounces-24831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8558291E8C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 21:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B677F1C2130C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 19:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FEF16F8E9;
	Mon,  1 Jul 2024 19:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NG2H7pzO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5DA16F84F
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 19:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719863002; cv=none; b=kmpHXC3OikpZUOyFSJoTfhVCp3cx9pp5mQzFO/lgpriKtxp0YeFAc5kP/wxcigMJ6ShRtrLsGu75tQr3+/L4GGylLnBEYjP9qnY3A9qWtCWRYaOVgORPVtLLTWizRC1T076fqwVRgub3V0r7oSQqMafQ7R+JHTCbcoK6o6xrCzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719863002; c=relaxed/simple;
	bh=shrbWN/CrXwZygomd4aysklY0BHpRI/Lqzag+3eHk6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZGhanGK2Qvd8XgJyErIXWu8bH9xNgQpDj8UE781a31dXTHZsoF48iUVZFE2U8VVolie/+k60SDxXBKKIC2KGQUuBSS2991s3QooJX9YLM1jsoXfRDgykoSH+lUztgffjxJpKwFTbPDW9tTNqiRrTjpgw/ShLHj85B2WxSEb5Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NG2H7pzO; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so45027251fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 12:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719862998; x=1720467798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oscpSDO7CeUkkgmCfEkVvaRyN/meIA6JpS1dhxrIHl0=;
        b=NG2H7pzOxe/yfDqhIzNt+v71y7p7iGdRqk3n6WIBxAXU0lP5TRSfJN+WiVxW1kfluj
         8G6HxfVHKhNOq5GjPp4xJDwe2kFNG2v+ZSKzB1pOORKMp6hcCnPk4seBC4afsmc5CxQ8
         lPxAmH+TlPIjFFu7EjThCDYVq40pa00ox8UBpiQHgW6bIA+JYJDuE03uu45uNtUbvPUN
         EkNd4ax1mKmkG2mWqWOP8MqRfgHrPMkEtLX3JjvHoMUQsSyWIOGFmTf55yiF3TElCCMe
         BciwQq9isVqB2ltl3o/NukauCYAKOvaAVGGKuAuapbSHDURhL9l6INCx5tdG+ys0+6Aj
         5mZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719862998; x=1720467798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oscpSDO7CeUkkgmCfEkVvaRyN/meIA6JpS1dhxrIHl0=;
        b=B96deTZfKZLV+hhaid3Iux1z9P/pxESlJD/2czPtor4gZ81gAMoiELR9XPhk+zaA2U
         x0ADiD+ulldwspLN+tXCmbNpyMbqEykthx2mPFnGyeWvSLWoX5rimjai8SEi2P0d3SL2
         0sDCQzvW/efYrJTUQWwJaYorBN2nlzuarUsaaV8WYCdzQvIVQ9SY9p4gUU+rIXTa6nt9
         q5TVO0hX2CiAMH20cjblmwtHM6iS1jCJZmueVAfZF9BmKxClPaTgzgxz4EyhaFrKuxmr
         r6Of5+NCcbhD7jy5a8zD6Z2bFtJzIN6fIMdCItU9/zwmLREZQQfl3IMF9NuQEpfRVdDc
         3Pfg==
X-Forwarded-Encrypted: i=1; AJvYcCXrclmJNr7wT+CVxCObR+sAGWESwS2PNjcxaH10VAFGtdO7zBdoSmEs4ixy6/rUkxK7YKKqOznA43+4Ddmc0U8Wegtoxx0BYjzk+H3qhA==
X-Gm-Message-State: AOJu0YyjyJ5V+cNKqn52+X2l5G8Odl06kxvauuDb9W2nKuN8HaYDXj2s
	xcijZi4BNlPJqiomTd2ZKbtT2NmtJd9MBVX6tlxM8kfX/xi2yqEe6QeELBu1dmw=
X-Google-Smtp-Source: AGHT+IFJ7WfUoSw0//3UtLKEzdeD18XEuk93La1NkOaUbrCL4a3tDiQ5T8y7FR/KCltxgwltD2/Zqg==
X-Received: by 2002:a2e:bc88:0:b0:2ee:4c6c:5874 with SMTP id 38308e7fff4ca-2ee5e37ff02mr73446291fa.10.1719862997936;
        Mon, 01 Jul 2024 12:43:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee5160d26dsm14817021fa.25.2024.07.01.12.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 12:43:17 -0700 (PDT)
Date: Mon, 1 Jul 2024 22:43:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
Message-ID: <5isw7c5kkef4kql4qcous3gmwhvgwc53ntgjm4staymqr67ktm@iw3cr2gr2iko>
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-6-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628214848.4075651-6-quic_abhinavk@quicinc.com>

On Fri, Jun 28, 2024 at 02:48:47PM GMT, Abhinav Kumar wrote:
> There is no recovery mechanism in place yet to recover from mmu
> faults for DPU. We can only prevent the faults by making sure there
> is no misconfiguration.
> 
> Rate-limit the snapshot capture for mmu faults to once per
> msm_kms_init_aspace() as that should be sufficient to capture
> the snapshot for debugging otherwise there will be a lot of
> dpu snapshots getting captured for the same fault which is
> redundant and also might affect capturing even one snapshot
> accurately.

Please squash this into the first patch. There is no need to add code
with a known defficiency.

Also, is there a reason why you haven't used <linux/ratelimit.h> ?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 6 +++++-
>  drivers/gpu/drm/msm/msm_kms.h | 3 +++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index d5d3117259cf..90a333920c01 100644
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

When is it decremented?

> +	}
>  
>  	return -ENOSYS;
>  }
> @@ -208,6 +211,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>  		mmu->funcs->destroy(mmu);
>  	}
>  
> +	kms->fault_snapshot_capture = 0;
>  	msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_handler);
>  
>  	return aspace;
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 1e0c54de3716..240b39e60828 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -134,6 +134,9 @@ struct msm_kms {
>  	int irq;
>  	bool irq_requested;
>  
> +	/* rate limit the snapshot capture to once per attach */
> +	int fault_snapshot_capture;
> +
>  	/* mapper-id used to request GEM buffer mapped for scanout: */
>  	struct msm_gem_address_space *aspace;
>  
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry

