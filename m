Return-Path: <linux-arm-msm+bounces-50738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAD4A58195
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 09:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC8ED16C0FA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 08:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEE5191F72;
	Sun,  9 Mar 2025 08:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vhd5b55N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF041BF24
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Mar 2025 08:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741508201; cv=none; b=oAlvjoeedF/BgL+Sfk6Rp/7q7lHPPI2wyDaf/b3w2ZN0z07C+xTn8UPYQll4eX69oXd5s22sbu2qvgNa73+aRhPYIdd6BdjbVfvEfSy5aKyMRaw0hAJ1BdUtwxRFc2bICoFasfQq1Y6COiTBQbvmSiJcMqo3NckM05imvEuXgqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741508201; c=relaxed/simple;
	bh=lWZOKRJ5HqRDVKNcGDOhOGnuQdNGoBUNycSoUvRSUlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaZE6oSRDy27gFBNnzJ0rfofglSFMrDtngdNVh7lgGHlYaVNTbVKbPsR6pNeTi6Fbr+SCKkZzEu22GFgdzs0hL5WhhBjqzVYUywCpwa4NGexeKOiuUhzO3OqSRjs8BE1ipyRxFZjtt05iA4UUtT3BAsbExDk9PADJqN71k7P1WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vhd5b55N; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5499614d3d2so2008934e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Mar 2025 00:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741508195; x=1742112995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=89SfYDl9Q5QnukNfbtuYibaaCHpU8JBYjMuTQ2U+dPA=;
        b=Vhd5b55NIZ044+9p6uUaM+/d3EOHEcXvHMWjDd0upR/uG6JVwfLeX3HrjGZY8ylmo0
         4ZtpCKij8URix8lBy+kPA7VtvVT1v9LD/UgtTjySX8ahDH6n1cTIhZD1g4Voppzt6Ys7
         ZcKdCLEig5ATglkztFJEq5qIOhnE0lMtUmBFgS4t+c/gFv1w9iovEyIjvazi7EiOy+dt
         sRz2lhGDDF5JeVk5ykeEpi1lj+1IldlmUAU7BOTNFZHo1aOkzhPFyXfURB6SmaskfAe5
         Zj0PeclEmHe6Q4q0wCfXO1zd1jFJOct8bzOp+weIzPi+9M1qqkqFpU819uRMU2a8ETMh
         CwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741508195; x=1742112995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89SfYDl9Q5QnukNfbtuYibaaCHpU8JBYjMuTQ2U+dPA=;
        b=hVOYiWnlVxbVVIYysQRcLNZHvkIHBDZ/vTIlGXEThRJBn6kWq4GgoviVpRLdC+K9fb
         n+27Pg16cOV0C6Qstr8Wg9DalEq/5Cb4/bYEL0L54UWept8xaHANMQ8BotaN/NiCWPTT
         ZC6HwasMUTdRQsRHM8qiPj0u9QhgghMhk2YSNe566X/TBw/N2z5WqC5vmXrG8zsyesG5
         esE16XifuUtg7gk9XlhvBy6r2/N6MS5Aggv35b2B752BSeAoadRQsLFbK2vAeNIB6SMO
         dkom+7OFtGq4R1PqIOSU37zhSjLDH2T8fOCstEWvhZ+hatN+9JGiKPJAU9EJBztNwccs
         Np9w==
X-Forwarded-Encrypted: i=1; AJvYcCWyjUov3z5IMu2XewnkrjLCjPTUs2wJmbAhwHmcHriFitQ63SVviiZ7OcquXLf91eJKzrCdiU7tAalmOUOx@vger.kernel.org
X-Gm-Message-State: AOJu0YzyUYWOLLM1WWju5elp7Q6+N4zfQwdoG/pZrlVQdRYAVk20VWEU
	c9iN6MlldcsKJh/m3lGj5F6nBKjMRijtY45Yh0n/dODG6u2o9eF4KRyP6UBw8Rk=
X-Gm-Gg: ASbGncvuUmII/hLzaeYF8cIIMaiI9pBDUrHzG97HxOL8rZHcGN0yOLSpFMhGr8Kih0Y
	iIsOf2DsVHZQ3vrUAm9YRn8kP71iiavnZLBWUhQfOzr/fFQEJ/nqlp/FqLjPC5CuXKzOcO8EOOi
	BRpvaZkc/7Ab8x2h/+E5THicuYM/w0dIwbMM8lpnUG4UxFNWTV+a704Ih10GXrXO8CgvWQhBFH4
	C5gE34hi5qHEF5aCcew7nPq8XNtUiKUfF8Ii8lxlOMAKT8ujC6iQbM4oyKMa30dRTM/I36ST9mm
	NXormIZM3BotCy9WbJHPUexBB9oN6hv63V4eFZLboth0nbP+jkzk9w7MdqDqw+SwVMocZV+LUOY
	e1L0VxlH6rUSMKxB0nwQJ3xpg
X-Google-Smtp-Source: AGHT+IHonFYRVCOD3hc2ZLZ2k0nh0AnV9X63OZNmrpqQRQXGzg2TI3GANig2LQlLgV4Hue3Yp7RGkw==
X-Received: by 2002:a05:6512:1112:b0:548:9786:c18a with SMTP id 2adb3069b0e04-54990e5da6emr3725516e87.19.1741508195235;
        Sun, 09 Mar 2025 00:16:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae46199sm1054491e87.39.2025.03.09.00.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:16:33 -0800 (PST)
Date: Sun, 9 Mar 2025 10:16:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: reorder pointer operations after sanity
 checks to avoid NULL deref
Message-ID: <5x4bmy52gxc6y3m6qswqxoxvjsk52zz7lvjpudqgr4d2hwaz4b@bdf2dzgji7gf>
References: <20250308144839.33849-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308144839.33849-1-qasdev00@gmail.com>

On Sat, Mar 08, 2025 at 02:48:39PM +0000, Qasim Ijaz wrote:
> _dpu_encoder_trigger_start dereferences "struct dpu_encoder_phys *phys" 
> before the sanity checks which can lead to a NULL pointer dereference if 
> phys is NULL. 
> 
> Fix this by reordering the dereference after the sanity checks.
> 
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> Fixes: 8144d17a81d9 ("drm/msm/dpu: Skip trigger flush and start for CWB")

Your SoB should be the last tag. Fixes comes before it.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 0eed93a4d056..ba8b2a163232 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1667,8 +1667,6 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
>   */
>  static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
>  {
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
> -
>  	if (!phys) {
>  		DPU_ERROR("invalid argument(s)\n");
>  		return;
> @@ -1679,6 +1677,8 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
>  		return;
>  	}
>  
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
> +

I'm not a fan of having variable defs in the middle of the code. Please
keep the def at the top and assign it here.

>  	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
>  	    dpu_enc->cwb_mask) {
>  		DPU_DEBUG("encoder %d CWB enabled, skipping\n", DRMID(phys->parent));
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry

