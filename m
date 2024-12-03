Return-Path: <linux-arm-msm+bounces-40090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E619E1E34
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8D9428520A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 13:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190C31F426E;
	Tue,  3 Dec 2024 13:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g3+WJsFb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3139B1F1304
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733233825; cv=none; b=OQHVEp3l07oHeRjHHkBx2g9iWZ/qr3nDRLrura2plP8ipd5HA3uAhCFEmTMGwa0aYlSdII64TGD4BhCGX13TiZ2wWEBJfxReDDCNwG6WI6+MrA6KuHxLzGhk3dTHLnli8Wja1kGlMGtTufNrjQJt2X+cWvfAlM1bhB0wepW/th8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733233825; c=relaxed/simple;
	bh=+vpj7csOjAsYv2tnprQleup/9ZpUJUTJ2p+KrNNa7a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3/eUBJ8KpU5DplRtofRI/Bh4FG1zHK3h+R0qfq1+71cLqncZb5McCiy15T7RYd3lL275+8fnHoBgXqB25fUQvNYa6G6vwR+60W9DllrAooScknp/UJw4ojmSSc1acmpLkfFtGc2me0S48tTCJxQ6NDCsBYzcl1pSj0gDdEgp8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g3+WJsFb; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e1b955ec2so122341e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 05:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733233821; x=1733838621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i5bRAEVBnLCWLf2N/lte8AbWq1y/ZyDLk/58hb1dzyY=;
        b=g3+WJsFbX+czeutAC+lKLpe4fhfJ5Wc6Wswt1dE01SCOlSJCaZTT0CQW1zfymslgWJ
         SgBVyQ+GCVOpPZt67sQvuY/BL7BDX6D1kZoiByy8+hKlZK33ARtRMdHg+nqxERZPkahX
         itRZTzJfR0E/6FgEV3LwJh6iBN1NPoaME2Vj5KdBNnc+cDDReM995Xm7oxjeNMUcujm5
         14tP6ytftgftz+Jfsm0MGcYqB1/cnR8m6IS8X/S051DWEYy37SxuqG8SPQcKzPEeGw2V
         gzLiyxWcm1AO1d6FUH6ek4+KGmD+NKObN/kboCvP14EhOX6IJnLhoZdsN69X5VkjWOnR
         dXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233821; x=1733838621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5bRAEVBnLCWLf2N/lte8AbWq1y/ZyDLk/58hb1dzyY=;
        b=MZCVwREXhaixk59HzrRDQno+6sRjFm9He63HVx2qtfIVnY2OcBSWlgRJ6wtyguo9VX
         HLjnHfqz0biXoTPINB1q4Krj8IdG88DyMmhPMxRB4GYHVpPlhq3TWccvmC8VgLvhF90E
         slwt/8OkiIDVdJOYte2EWFqhBIxbrhEVvN5XDsKnecnzYRvJtYccCxHhvCg3Zj9pCnfO
         iz9yUkE0U2+fMs1uXpS++iJV0vZdo5eKTM7RqafvSXV4QWFS1j8GYzw3pCd9DY8X1JKg
         U8+HSNg9jaPk9NPlUHKrcLV3HUYx4rLc17BbrIzn7HzKddRyLCr69Q60SclI9aTsg6/+
         8uJw==
X-Forwarded-Encrypted: i=1; AJvYcCWPKfBY+SHs7spz7+4u7fe5PxHsvdhsdQHMr5VNBzHn4AztUO/iCBPZb8kSb5C5FLcjj+5s5KbVIj6btzIc@vger.kernel.org
X-Gm-Message-State: AOJu0YyT/Gp/RU4hnTw5nYYJMVovlCo2odjFmGl1QD9s67NnM2S7buJq
	FbyI7U27ctmej8YGcXv5T9RLx55DkR5cqrhZpv/4Lpc/pTHU4a8Qe11YqBhfBNY=
X-Gm-Gg: ASbGncvQcUxFt+b5eVaDu0AlR5EN4qJdP3S+diQNvwBM4nX/KneHo2DQ67o8Y4jqOJz
	A+lmT4k53BlKkwUsqcq/0n4wjXPiB9cW+Hv2J396IJgj1oHc8jScXzEmWn1K6gxgDluXolhRZVS
	SqSuO/XZGQhmyydy6f2jeQWcFLGZb9d2edmWLv3uCMmozm9RpMEJFe8Nr454qPCfqCf/y+9YWDx
	VARobzGsbP2wXqTH3z26fMyGa55efmAy/M9qsp/e4AZGFk/BBXH3b5fFZE/d3pel4NtNe5qAf7+
	/6IzndGpZ75z2EJTrb751HWpmgO2PA==
X-Google-Smtp-Source: AGHT+IE9N/OcxHC2ukSRbkQj4jXmTNc0VQUObxjzYPEdTf0i7Xv2g8tPoaKlRXy71a7L1/Z26oJOwQ==
X-Received: by 2002:a05:6512:104f:b0:53d:e780:3ff7 with SMTP id 2adb3069b0e04-53e12a210f0mr1503999e87.39.1733233821319;
        Tue, 03 Dec 2024 05:50:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1b625009sm48584e87.119.2024.12.03.05.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:50:20 -0800 (PST)
Date: Tue, 3 Dec 2024 15:50:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
	Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 1/4] drm/msm/dp: remove redundant checks related to
 ST_DISPLAY_OFF in plug/irq_ipd handlers
Message-ID: <pa3jwxpnipj7lcusioqnjesz4cpgc2oyqgspqqvk2i5kb6ud4k@fi4grx6w5k7d>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-1-8d0551847753@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-hpd_display_off-v1-1-8d0551847753@quicinc.com>

On Mon, Dec 02, 2024 at 04:39:00PM -0800, Abhinav Kumar wrote:
> In commit 8ede2ecc3e5ee ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets"),
> checks were introduced to avoid handling any plug or irq hpd events in
> ST_DISPLAY_OFF state.
> 
> Even if we do get hpd events, after the bridge was disabled,
> it should get handled. Moreover, its unclear under what circumstances
> these events will fire because ST_DISPLAY_OFF means that the link was
> still connected but only the bridge was disabled. If the link was untouched,
> then interrupts shouldn't fire.

What about the link being untouched, but the monitor being toggled
somehow, which might generate HPD / attention events?

> 
> Even in the case of the DP compliance equipment, it should be raising these
> interrupts during the start of the test which is usually accompanied with either
> a HPD pulse or a IRQ HPD but after the bridge is disabled it should be fine
> to handle these anyway. In the absence of a better reason to keep these checks,
> drop these and if any other issues do arise, it should be handled in a different
> way.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index aba925aab7ad..992184cc17e4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -562,11 +562,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
>  	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>  			dp->msm_dp_display.connector_type, state);
>  
> -	if (state == ST_DISPLAY_OFF) {
> -		mutex_unlock(&dp->event_mutex);
> -		return 0;
> -	}
> -
>  	if (state == ST_MAINLINK_READY || state == ST_CONNECTED) {
>  		mutex_unlock(&dp->event_mutex);
>  		return 0;
> @@ -689,11 +684,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
>  	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>  			dp->msm_dp_display.connector_type, state);
>  
> -	if (state == ST_DISPLAY_OFF) {
> -		mutex_unlock(&dp->event_mutex);
> -		return 0;
> -	}
> -
>  	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
>  		/* wait until ST_CONNECTED */
>  		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

