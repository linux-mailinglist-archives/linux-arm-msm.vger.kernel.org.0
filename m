Return-Path: <linux-arm-msm+bounces-59175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF990AC1D6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 09:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A047D503666
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 07:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5D61D5CE5;
	Fri, 23 May 2025 07:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHJpvCtl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020E919F11B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 07:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747983729; cv=none; b=PhLuCGIVr+orua+IwX3gYBvgkH3LG3GaA1jEsh+NMh0ZkMOPoGe1P2sK2N8115Srn4vKiaVtzjM+Ag4LTUaus7rYP7DmIxkAnbdWXi/V6T0urcoY7AdIMyIJ7YbW+eDLGZJgoAKcY43xkE1dL4Jf2pbIxtVJSLBCj4yYCpMNVKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747983729; c=relaxed/simple;
	bh=c7jysfuRbmmTUAzBorXcjsX2IBCdoM9L94JM9I+9q8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCmJMKFyby7+go2D2XwyFOeSsuJGsO6RCxig5hvq1pcCyFGwyVHpy9+xIRGljq7q3XCQFuQddesUq+4HK9TcyYcEC+i1Q+c/n7jvpL85zfwJJH+CevAWlBrOhwXPJW5PoDYsZhvf2TbRyci05JeQse7Zfqz8ApDpf35yDz8hIfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHJpvCtl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442fda876a6so63790635e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 00:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747983726; x=1748588526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y3chgsoPjsxPJjeKJHvKUZQo0VoemKGDA7Ek6bDVj68=;
        b=HHJpvCtlXa2x9a/S3RFf0ofBB22Jy+vGXphOTfZ8UE7MdcxZTgulODBAOO24SC+txI
         xMygkZTxiyRslE9sSZMeq1wS6Gjbuutsr7iWWquu2yksqaAB1mKGdLrsNcmQznPpN9wL
         qbRTfhwUhapFsmZy/weuOD0HY6lC+2E2QCQuTI4OlkNRU0/pd9Aja5VToHfqQa9l2qbz
         OWLoXGqQ44K9h8k18zzc3k4/Ot1AOxLEg05i5IusYM2bf+0Pn/cHmZrJQL0NuzRfD98v
         a+XCPhpknVjB0IEf9Bp9iOhZ6doyAi44+ZY+By4J21/7pqruFVBUobUPQ55/6I9O0/3p
         zg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747983726; x=1748588526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3chgsoPjsxPJjeKJHvKUZQo0VoemKGDA7Ek6bDVj68=;
        b=EeM/dPaIe9Bt5pCjUxWrQoQDLEk9iT2H7G5g/gjxucPUy2OvFJgXJQq2rdUbeCf4lD
         wCLNrUbj/iGv2PfsjujhFS9KMvH4ReJf211vzgBFG3sP9u8b59nwVypO/HX/0rIr6KwA
         ADuTkh6JZ+JFFrEJ9xVNIHlT0+h5smcs3TxTzDZgFGNLx9yJYQvFudcc8wgc33ttAGRS
         HYXo3CpQPOIsJpSjNLGwi2vW+509a9Ly3daZ1O9g2Y352+rUrND6K15TI74wMNjuuXdd
         iMWL9/JOWJ8zBS9YLxMoKtBMMZnHEpyO2xWCEFduiFVDerNUeydmQMjuDZQnu+gHyGGy
         6w6g==
X-Forwarded-Encrypted: i=1; AJvYcCX32wadxgfXf5vj5GYMp+I9goZ532tTszvv9egLqL6kA0EdsD8pq7+iP7aPHELLZp442swMRkJtFmADfaOt@vger.kernel.org
X-Gm-Message-State: AOJu0YzP1xI4hmr9iN3tWsuyDjWUVP2oH3fJgVuxWFQSNKAH+M7cn791
	kzeqlR5gCcwu6GxaVAaChRz7EedWqNdsjCBqmidw5oloGOyrcf9c1aDYzSBOFt03oto=
X-Gm-Gg: ASbGncsmXRbOBXPTEg1JhVgUd+3bl9Rqp6GpbC67/WlmKChV+uhfAgtoqWtKxCavrdL
	xT+RpEKpj9fZsMaxg5VF8NbA0cEhBBe8xj2s7zPA/ZRyFr7JNSx5IwF7CoFL2DlA5tZLjTwBhm0
	TYvTt53Pr739eTRtgqJLVKKFXl8WQ8m9Z/+1F6jKRjXRuU5FmS+EIXLF9ObnOgm5eGPqqASjhi7
	rz0ahQ6u5tBMzxs6fVOWRaycf0s22rXd9w5ROhZ7+cH6hK8XsFwcvIKNtB+xUyTWp/ozVInZET3
	wX2f0VFeAzQ7Mil9ek+pJJCZ3uWRN5uVEUBwo3YI9YwBv+NP
X-Google-Smtp-Source: AGHT+IFY4y/ZUB1VKe4lNbsorjCqofEy8Oz5r/Dj6XfZyxk0qjzrM+uoTb7F1fSElFjmjBLoR4SC6w==
X-Received: by 2002:a05:600c:8487:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-44b6d6b1fdbmr13812575e9.17.1747983726219;
        Fri, 23 May 2025 00:02:06 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f18251adsm134886385e9.2.2025.05.23.00.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:02:05 -0700 (PDT)
Date: Fri, 23 May 2025 10:02:03 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Message-ID: <aDAdax7xdeDsvQHB@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
 <aDAbxAnCN1lGGcGH@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDAbxAnCN1lGGcGH@linaro.org>

On 25-05-23 09:55:00, Abel Vesa wrote:
> On 25-04-30 15:00:51, Krzysztof Kozlowski wrote:
> > v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> > differences and new implementations of setup_alpha_out(),
> > setup_border_color() and setup_blend_config().
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > ---
> > 
> > Changes in v4:
> > 1. Lowercase hex, use spaces for define indentation
> > 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> > 
> > Changes in v3:
> > 1. New patch, split from previous big DPU v12.0.
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
> >  2 files changed, 94 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..90f47fc15ee5708795701d78a1380f4ab01c1427 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -320,14 +320,20 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> >  }
> >  
> >  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> > -		struct dpu_plane_state *pstate, const struct msm_format *format)
> > +				      struct dpu_plane_state *pstate,
> > +				      const struct msm_format *format,
> > +				      const struct dpu_mdss_version *mdss_ver)
> >  {
> >  	struct dpu_hw_mixer *lm = mixer->hw_lm;
> >  	uint32_t blend_op;
> > -	uint32_t fg_alpha, bg_alpha;
> > +	uint32_t fg_alpha, bg_alpha, max_alpha;
> >  
> >  	fg_alpha = pstate->base.alpha >> 8;
> 
> For the 10-bit alpha, you need to shift here by 5 instead of 8.

Typo. "6 instead of 8".

I blame the keyboard ...

