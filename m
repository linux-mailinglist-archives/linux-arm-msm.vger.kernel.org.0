Return-Path: <linux-arm-msm+bounces-41578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E2B9ED996
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72878164F0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286BD1F0E42;
	Wed, 11 Dec 2024 22:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yPLatFto"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A8A1EC4F9
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 22:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733955863; cv=none; b=bHSGOKfRXcy1X66483o/pQ/l38z03mDkyMrcHq6kgxrErS349LzHIYaGnAGCfcNTXI5TjkY2/XrYWjiNEpPX4BNq9ilVIXFtIL+dLgp1Tw4II7vvXZlmH/jV6WZUXuimbEY/06X7xkGYiHbAwxndTMLBvK+T4BV/nbGX0vDH4vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733955863; c=relaxed/simple;
	bh=/5rTDPj4eG5P/dMMZ3UaadXwQgo5sue2mf716YTlQyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcuBz840eX8nzKny1kNwqM0mNSjv7ZmdwCs1LEh6pXAkQS+B7zunEJ6pmM162GpXr5SXra+HcvnF3Ij6OGbfyiGTcarr71KaSxUVcdDLzZ1dJjgIrLZ6/4chxt1aDztnxe8oebT2lsiQzN21Ng0eXaEhys3X4YmuMPtM2kccijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yPLatFto; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so3882332e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733955859; x=1734560659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQt0c/B79tzZ92JCkmXyGPgoiCeeT1lFWyXxnDRmJf0=;
        b=yPLatFtoMKuH4FXESGbbTvaGZ+10m/VvbZBti7LIVYQtJAm9YzNizCgVm30urLp1TO
         oxZNLfzVszBTJjWGn4r3ME7LuP7oDN/owZQHPeaEHuiBNf62zgUaS+niDFjHH4OMM+FE
         7anw1O8AQ2zPxGmKlSaG4wYQGpVXjXO4KpgCG79YF4CHxvrhFL4gFFhgI9DA8FZyOx+F
         JRN67TWDRrtmhKHiKfcowV7W/RMq4q3pPPrB/sW65xzJ9aSpUnuHlpf62gu46aA2UHWY
         5wHDQNO+i1EyosLB5ndgR8ldafJXWLKexH6tsrX+RQZb5YnFpstzggWmY8GbKiW5JB2X
         Easw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733955859; x=1734560659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQt0c/B79tzZ92JCkmXyGPgoiCeeT1lFWyXxnDRmJf0=;
        b=gZcJpkd+KEz4Cf3jY/solHWnpw/3Da6Zy/DOSWqx4yugi/mRrxqFZ1PnPpPJhnYdI2
         wtP5RI8GNf/V1Hv2TxLXEdrCKMGJ8slyyWlpYl6COk/d09eDhGftg64C9JmdA5nah+mv
         Ospaxy4DEpuh4iWQEEbzHWHbaXIO770EN+Ls8Toyi74aAB96fgzkFjw0jRWOx3FZ8cWt
         lsNOW3G+aML/QMg6qo89LnfqYq+JmteBjmVz3Y5wG9pK97uaHz7OqgvTJIOuGwAr7g6s
         AmyoSavvXvTlCRvISXWQ279Ai/T/Hm4RtksaceoLB2OyyUeYnMBQ49X9yGPpnOuy8AGU
         WiBw==
X-Forwarded-Encrypted: i=1; AJvYcCVALRKVJhiZ846awHN4Zby2cY+w+nKat9SC6P9qxH0w0fcHJG/zntZD49RryiuTbiou5slFu2ARHBrMzdCP@vger.kernel.org
X-Gm-Message-State: AOJu0YyDxuIEqoqW1f47HWvglMPV0WAh6f760VP46tISDOLUKIFYcui1
	RT4YSmvq8F3wpU1mS72vjywsHiag/sH+mIrRxnij0Aiccrn+i48jWRYHvsiTiW4=
X-Gm-Gg: ASbGncutUiGfAwU1iUnQ8wFvLdW928zre/Uc5czYcXRICJQz1hjsFFVxmFKTgS/snQ4
	mn1wMXOxd5NtTyGjL/VI33+dFuO1wvi0keD5eXLrvTaovpK1waRyrhETByzwhcIasCpaAHxClBK
	xLAbF7D/weG34J8E0uhCopWe87k4y998av10RPcBKZFYMCT3mBTfvWLVMmJD7OYBDFPag6Gt1Uc
	g237F/E5aZ2n13G9oBFN1vSIW8w7Pf+hQ5dhUjvpq5mE8FFIRo2PTvDO7waOVmbQVSEWEP3cvzP
	Tnkg2YHH4lmwByS+E6cGMJXks2B3nCqdJA==
X-Google-Smtp-Source: AGHT+IGUjnHXz8xm14gX4NMTwgGnSmfUk9Frni6oN0Mq2JYlv9txb+UhgRCFjpynV3Xptsxw0hq6Fg==
X-Received: by 2002:a05:6512:238b:b0:53e:39b7:54a3 with SMTP id 2adb3069b0e04-5402a5daa14mr1547884e87.24.1733955859171;
        Wed, 11 Dec 2024 14:24:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e3c48b122sm1519955e87.65.2024.12.11.14.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 14:24:17 -0800 (PST)
Date: Thu, 12 Dec 2024 00:24:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
Message-ID: <hpmxj7tjmvbo55izoxgygqmysbabnpb35mprvn6w53vbtehnwe@yxmiigoeuyf3>
References: <20241130-dpu-virtual-wide-v7-0-991053fcf63c@linaro.org>
 <20241130-dpu-virtual-wide-v7-2-991053fcf63c@linaro.org>
 <160151f0-9cc6-40f6-9f53-466185835e4d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160151f0-9cc6-40f6-9f53-466185835e4d@quicinc.com>

On Wed, Dec 11, 2024 at 01:51:51PM -0800, Abhinav Kumar wrote:
> 
> 
> On 11/29/2024 5:55 PM, Dmitry Baryshkov wrote:
> > Virtual wide planes give high amount of flexibility, but it is not
> > always enough:
> > 
> > In parallel multirect case only the half of the usual width is supported
> > for tiled formats. Thus the whole width of two tiled multirect
> > rectangles can not be greater than max_linewidth, which is not enough
> > for some platforms/compositors.
> > 
> > Another example is as simple as wide YUV plane. YUV planes can not use
> > multirect, so currently they are limited to max_linewidth too.
> > 
> > Now that the planes are fully virtualized, add support for allocating
> > two SSPP blocks to drive a single DRM plane. This fixes both mentioned
> > cases and allows all planes to go up to 2*max_linewidth (at the cost of
> > making some of the planes unavailable to the user).
> > 
> 
> Overall looks so much cleaner after unification!
> 
> One small nit below,
> 
> 
> You can still have,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Note: we have started testing this series with sc7180 CrOS, and will report
> our findings/ give tested-by this week.
> 
> 
> <snip>
> 
> > +static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dpu_sw_pipe_cfg *pipe_cfg,
> > +					     struct dpu_sw_pipe *r_pipe, struct dpu_sw_pipe_cfg *r_pipe_cfg,
> > +					     struct dpu_hw_sspp *sspp, const struct msm_format *fmt,
> > +					     uint32_t max_linewidth)
> > +{
> > +	r_pipe->sspp = NULL;
> > +
> > +	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +
> > +	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +
> 
> 
> There are two places where the multirect_index and multirect_mode are reset.
> Would it be better to just have a small api dpu_plane_reset_multirect() and
> do this there?

I'm not sure, what's the benefit. We can add an API to reset one pipe
(to also be able to use it in _dpu_plane_atomic_disable()), but then
it's just deduplication for the sake of deduplication.


-- 
With best wishes
Dmitry

