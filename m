Return-Path: <linux-arm-msm+bounces-41162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D54819EA0CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 22:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91F241886494
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 21:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9338198851;
	Mon,  9 Dec 2024 21:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="il33/JAi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD79085C5E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 21:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733778337; cv=none; b=aEGw4+zb1/0shC0gometWU9sz5zs0hTVEE51KEkladpOBMFVk+conDC6EKY8lW0X2Mrmawz/Cwb9dBSjm+aGpD4DSgGOOyJ8WZb/kCDbwNBrEzC6BXHB72bTSzThH74xUXBKSL9o75YZCNc4aM8Kzobu7Qkid70koDSIALhjxzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733778337; c=relaxed/simple;
	bh=TBswGVD+CfWmrxrKKYXLTAhV9LG8fntfIViLPloSU1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvqOKqdOJaaYfp0kHRxmjJurIdMmxiVCBZbOvX9qamAMzlFR5Xs17NOSBSmcNE1wWIon1ExW7QRQeNocSDQU56qSqPXPXvH9nSRmv6dmTvRbvNHIvF4br2Vnzt0DfeW89Ho2la1xQvh/7IsOm4tOO0qiMR52Ju1+iXSjHHd1S2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=il33/JAi; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3003943288bso30776341fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 13:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733778334; x=1734383134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hbwD0xdtFeO2X81Q2PXEiGy5cSfyM0/IvSDcuNaHUrA=;
        b=il33/JAiNz+duOvu0bSughq1KYxo+i45GOJ3M5X8jtYcOF99g6P7x1ITKV6v860ivI
         9ef594+KqFIojcTlPKWZfXioOEdWYTYfKiQtxDCT+/PId4noYB+RI1VM+NnSsZluKb6j
         ufEdR+LCJzoti2X2JRz24kieP3PV+u34IoGwOW4YEI8BGIikwkLyFM3UYfOdMU1KuOQO
         DYpMMmAnMJgmRe90QkOh7aCZOrWefC37Nuui+hNyfaj0/TM02/0j9ntE3U0Gu+OUIXLa
         rme3BofuVqcrZDYa65PWvdex9gqRMaja3HVYHcf4MZtuxej5Ra9PX9Jg9dskGPK7YRGh
         ypKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733778334; x=1734383134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbwD0xdtFeO2X81Q2PXEiGy5cSfyM0/IvSDcuNaHUrA=;
        b=AiTjSqP5kTJYJl5FdQ7BVIfVvkx5Pvn8bMAquZnGPOXiRGLsAlwoNhM9Utk8lobEYl
         1lbzC+HgKqwo5sDsu8+TEgh8w3cqgZmmun9ZVjDk/G8rMjrRG+aSwMaeHtX95AzDfiAZ
         OOKPiYg4q5J9KNW9A5g9xX8NF11RODtZGI3+W+5GPOQlbcIl3g1RalkEMlZCNJcEyluM
         dGGsCAgI7v/AH/jmi27yR7kxK5BJes/Z+KToaeQtDJsAs/fFoVcZ90fzFSaENKYb8E9e
         kefcm6E7AmOAIQLtkrCJO7yWQG6o0gE+8lX+W3VpAIN4cRNs8ClU0pOEIhipYuOE1qsA
         V/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSfOEeb23ay3KcRbhvNSuuOzMTs7tC/n9KsvOrDrCLQoJoFU/PSwXiEUe0M4KM1WJoSNazyLLnQa5vWbVf@vger.kernel.org
X-Gm-Message-State: AOJu0YwvxHeEsoFu16oF47pVVHeO/835JCG7ajeUjLjCupMr+vMu6Qkj
	fysLvmXgdRQI8qnrdX+kgYbBTtjqWbhFgA75z3JOF59OX0ZtCcouW5gDtS0cSLU=
X-Gm-Gg: ASbGncs6knUMc5vWR20tHYFeqFr/3p4f03te0NhzE4Ovi/twF9Hy42qp/14ABW/huYh
	0T8A50Dho11OhbcDDyrbiXvvh11hdYcXbOySXbnzBuNSChvownpcXvS86j6FVgfqKE/9R5Z0lzX
	bQPnoKe88A1b/MmwtymINGqX85iV3iWvPuQM+2a2pMhGkhF399Fai/h6pFSH0SKk+xAgooSqIZg
	8tGuZzi6+HL7ilwAlBHjB3qZ/RMi1XPA7rhafg+qeLKdtOTa2zdwxcZ1unT3wP6tAh+NaQwVsG0
	Lclxzy/bIYipjK4/885BosTvDK6QRw==
X-Google-Smtp-Source: AGHT+IE63q6tbZgiYfnAuYiETrebmlUHAEwKw2EoVr6nHG3mwSFQhamy8uW4P5FHyhiMyHhSRBOR9g==
X-Received: by 2002:a05:6512:ad0:b0:53f:8c46:42c7 with SMTP id 2adb3069b0e04-53f8c4643dbmr3412654e87.14.1733778334011;
        Mon, 09 Dec 2024 13:05:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e34916befsm1095574e87.120.2024.12.09.13.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 13:05:32 -0800 (PST)
Date: Mon, 9 Dec 2024 23:05:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: filter out too wide modes if no 3dmux is
 present
Message-ID: <jzbqtrhiebtb6oveg35b4cdu57epqattu5lqhtfhbzctomzhrl@vnl3vklpnvd3>
References: <20241209-no_3dmux-v2-1-fcad057eb92e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209-no_3dmux-v2-1-fcad057eb92e@quicinc.com>

On Mon, Dec 09, 2024 at 12:15:57PM -0800, Abhinav Kumar wrote:
> On chipsets such as QCS615, there is no 3dmux present. In such
> a case, a layer exceeding the max_mixer_width cannot be split,
> hence cannot be supported.
> 
> Filter out the modes which exceed the max_mixer_width when there
> is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
> to return failure for such modes.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Note: this was only compile tested, so its pending validation on QCS615
> ---
> Changes in v2:
> - replace MODE_BAD with MODE_BAD_HVALUE to indicate the failure better
> - Link to v1: https://lore.kernel.org/r/20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9f6ffd344693ecfb633095772a31ada5613345dc..87d76f388bef48c880ae70ddcdb76ccb0336ad32 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -732,6 +732,13 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>  	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>  	int i;
>  
> +	/* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
> +	 * before even checking the width after the split
> +	 */
> +	if (!dpu_kms->catalog->caps->has_3d_merge
> +	    && adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)

Excuse me that I didn't notice that earlier. && should go to the
previous line, not to the next line.

> +		return -E2BIG;
> +
>  	for (i = 0; i < cstate->num_mixers; i++) {
>  		struct drm_rect *r = &cstate->lm_bounds[i];
>  		r->x1 = crtc_split_width * i;
> @@ -1251,6 +1258,12 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>  {
>  	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>  
> +	/* if there is no 3d_mux block we cannot merge LMs so we cannot
> +	 * split the large layer into 2 LMs, filter out such modes
> +	 */
> +	if (!dpu_kms->catalog->caps->has_3d_merge
> +	    && mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> +		return MODE_BAD_HVALUE;
>  	/*
>  	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
>  	 */
> 
> ---
> base-commit: af2ea8ab7a546b430726183458da0a173d331272
> change-id: 20241206-no_3dmux-521a55ea0669
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

-- 
With best wishes
Dmitry

