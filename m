Return-Path: <linux-arm-msm+bounces-40885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FA19E83A2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 06:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 728361883C0C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 05:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A471EEE9;
	Sun,  8 Dec 2024 05:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TNSOCCeq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF70442F
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 05:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733635763; cv=none; b=WATBp8YsOcKMieMDT+PSotFYh0+DDAz40ffk4Ldf7q0KTDUyBzneT1qSNV6+SPDMzuicIpZ/ids0q84wyumaDhSHNkiSGF2W7bxq5WGRpWYRBt2Gb1asAsQjPC+vzFIwH3Rl8CYTdFNA8YH0wuciHz5BEPoZluhsUf6gDqfekKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733635763; c=relaxed/simple;
	bh=Wd3Y7R3P9afqvPtxDb/Fjp+QCeKJHKSYfvw1Ti8lhTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvY6TrYxRBW7tXvpsqA9g8H1YRJbN8guFxFl1SlZEW8fH1xyoxbsQfoSPvO/I4X6Cww8pADgllxJgSH/HalqeBX3chcvABELd2X49q7oJIMI23Xg1n0zA5NGbvzJ13ssyL/Nvf8DWdR737xCUYaqvEga3ldFLv8DUzcFyNNYZXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TNSOCCeq; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53f22fd6832so706923e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2024 21:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733635760; x=1734240560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vNGx5T/kut2PnS1TJVU24AmFFsWO3iytxgtvJA9Xvfs=;
        b=TNSOCCeqjFz/jnKJOHO1z4FVr/iCD5JC1Y/BslPTK17MxPsIdKT/LukftpTQG2sBxf
         wSEmBEa6iV+GB2Bvp+rRF+6OPZotKLs0/99RQX3gHIM97W0+i3vX7Vh7/ab9O3v4j/5i
         v2614WVxXuJlxCxOrN0O0M8s1Rc3xQTgws2FDhCMh0tkoj73zNQScA6twKL9Kd6Ve9ew
         Tx7QowvhsonQptbcoM38LoTJdWr+aTp8lMrycXkLnYziopXUPQ/NyInpV6Q/0j5z5i+8
         Rkechkze9XEZWV1h6ZAqw1Qw2kXhqtnDr2xURmBGNdPt6FksDwrQACQ2/nC56UKx3pDy
         1SmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733635760; x=1734240560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNGx5T/kut2PnS1TJVU24AmFFsWO3iytxgtvJA9Xvfs=;
        b=huxkg9VA0HFp9dBpMa2I1e/wkMNWh3CDPPcll5QGYM/3LVCNTcNj0a+mbSEc/4z6cF
         onRQWv1KPRa+ia7BPW+VtFNeD/Mo3iU/efVQGJhgVoyEqMPy8C5LvPQJy5PAnfYrvMWm
         LWWpvG0kYmgKDNpReJQiSKK8/upu47p8U+uEWMWJMx6J+u9ppPdEcHOO8cOzp0EuUhed
         06zvWl/bxNHNZSwr6CUrft3uTikeBvQyjyZQPC0WYbBLOztd7E/kw4Z308tk/PP5hGFq
         SIuYdRZt4CbXOJkJa3rd6bo2mpYT++/Biy6DSVGxwY0so6nKiW/D8R6Kq+zdORT+Uwjp
         nRzA==
X-Forwarded-Encrypted: i=1; AJvYcCVLqyDqLwm4P43i+HUHf8voRm60cOAacY2wTaw6fceWVBIiaLJWbdetaTc1U4zJz5KznGt/Sy4IhTzpqnEj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5yl8RNQe4SnD2+HM81tRqcmmml+zSiFqCNxYbqQv5dettcdOJ
	kdKfyGSW5nb9srKBk76txRXCenSDcy9sE1AgyNBkwYTrmGzNfpgsI4ODitCJqX0=
X-Gm-Gg: ASbGncsTyISslBDr3QjL4PZbsXEKCZLam3uCHJOfRTd0Qfm1yyi3gKdkuPteGVsVaOH
	ApaupgCoeO/VeqyjAyyxBItr6Mcp4BEvpSjsC+yZgvfKJCKQuFDKgYArHVW4z+/IPx5OzQ+4w71
	MzXUBObpSRSfNccedbx40AioCiQquqnY8VpDzc1tyYZLyq/CGaTWaHuDFBm8W8zdWgSCFXMmQww
	4gNPcXnW60z++R6/Zvz8nrbAccptLxqwP168jNd2aEPeJ+e/jy2D4YEskWhc/nBSbwlX7ODfx9U
	4Kwl+4DspqHbJNfgNZl1QALC7nbfRg==
X-Google-Smtp-Source: AGHT+IGOhQSpceSZ9KEm21ZiMJVHBV/c3kQtKDrxqIsT6LPxNRV9WJHBnedhtMHtbPhWJEJ/Z4HNTg==
X-Received: by 2002:ac2:4c4d:0:b0:53f:8c46:42b0 with SMTP id 2adb3069b0e04-53f8c46432cmr719545e87.42.1733635758999;
        Sat, 07 Dec 2024 21:29:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e3a90336fsm420105e87.265.2024.12.07.21.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 21:29:17 -0800 (PST)
Date: Sun, 8 Dec 2024 07:29:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: filter out too wide modes if no 3dmux is
 present
Message-ID: <zae7rlojv5iiq2dx7bxhdsmmzj73o65cwk7kmryxsst36gy2of@k3vcm6omcias>
References: <20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com>

On Fri, Dec 06, 2024 at 12:00:53PM -0800, Abhinav Kumar wrote:
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
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9f6ffd344693ecfb633095772a31ada5613345dc..e6e5540aae83be7c20d8ae29115b8fdd42056e55 100644
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
> +		return -E2BIG;

Is it the same as checking that there are LMs which support
DPU_MIXER_SOURCESPLIT ?

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
> +		return MODE_BAD;

This can be more specific, like MODE_BAD_HVALUE.

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

