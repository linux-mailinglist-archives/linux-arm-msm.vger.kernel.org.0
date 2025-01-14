Return-Path: <linux-arm-msm+bounces-45001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6346A1050F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 12:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABEF2165A08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 11:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EEB22DC2C;
	Tue, 14 Jan 2025 11:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X9iEnLfs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D2E20F97E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736853040; cv=none; b=H7lkL3iVHzEIi74vXQFiIJptJjo30ClQznktqGrkBATx4icVfSF+coy+XbZhUU5+DBo1i4LQQQGnYYogCAkL+eO3YRWsxA2FemKC9eL4mfikcStUqKLmGVVlJsV05YHWIUKl8ojbwGi/C48dOiaLA6t9c8YbWGJDlpuDnHLw9SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736853040; c=relaxed/simple;
	bh=4KL4l7ODHAlcwlZHO7+5385DxhKBPURrOkI/fQMNUpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyrzctKRgtii1T4rB6w2WnDV1RHY7RcHrpNnOUAbNh7K0bBTlT2ns1uyXPPrzIC2XuKMfvTVNrItkgmmX9N39AQuExvDC7n3DU7VBDKjmYFNgcx3UviopRUiZbGjyo5Jiy5Juari59otKHj8zkLjIi1S0gImWcgxC/JER6qIVu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X9iEnLfs; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401c68b89eso5786143e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 03:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736853036; x=1737457836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LcbWpbmmbJ2bnU2WDhOtIaUm7QnK525Rc7UTLeMZn7M=;
        b=X9iEnLfsveHmolwuznJ370jcOVmpI6RCLty5jFWWRJMY7yW6OSjQYvG0P7exo6kRCm
         RlMZ/yye1QDst/lg+Ify9vD6eVzMIbPbQk3bK0KQA9maKYmUHWNn3kbgLbWZS12KXeXq
         455NPQX+zFq7ZK6fOHmNqGfkRMuUC0KWeNdtgbED0+/NFT8Rzmepy9BKiJ7uJ3pDqM6z
         dWNilvqTOQx5XMGV7mR/Lu2aIdzR82NwGimfJlwRZ7YkreI3TWdRk2TW3Xnp9on5OxQi
         i4ANYhCtKAlCsHvdc19aIB9SKGzXwLUqe43ROPWBclpktoqe62bnFIajL4gsNFjwiRS+
         L8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736853036; x=1737457836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcbWpbmmbJ2bnU2WDhOtIaUm7QnK525Rc7UTLeMZn7M=;
        b=KuQK3ofhawBLxzbL7nV/q0XVQSrU9rRIDSsp+3hpAnbq16rXxGRLNoK8bvSYlujQl8
         G4NJVE5Pcd1r8KFprGChyuwCG9LDqXj3Ivnb0O4LAW8oJXDN9d/cYmIIpDfxZckJbAhU
         OGofkom3EyV537XVwXoeZiytnixdNGYo71/klbJuS6lncZWbdlv4w7V3+8PgCPTv5TO+
         jsfy+/SGc6vW/nINGtcxiNx55fqmEUtoDwL+Dl7s8I5fQPJUHkHCMk6dAGs+OqwyP7Xq
         enI5AxoBbn0icr28Vnzz5zE32slF54EMqJqHZBzwb0wJZWo7c0Bm/FtMlPShFGe6xQI6
         Lk5Q==
X-Forwarded-Encrypted: i=1; AJvYcCURB/LaJsxBvqQTj/x3WaY+dZZWFrtqDwsOe3aX42rC/U+I51Vw7vrvpcUnI8mjzpobgRwwrd2HEZB3/NBq@vger.kernel.org
X-Gm-Message-State: AOJu0YwwVV5wTYzS8hPf7TmIMGCy/P6kQZdHx3evYuy3dyYveUaZmTeD
	L/aYeSHfZKCEVpaSDGMl1zHMdO+R4Doq/qyWgX0lF3Epjp7ed2dhgj7jA8XLC9g=
X-Gm-Gg: ASbGnctqAD1DO0IARvL2Qr76jVmqTzobKk/qACgqNkGwy94UzmkmA6rQ9n8Fxtjws3g
	TJgFFYhDeUXuz4AY1+esTb9hGR9RrGDMw9iCEWuliGJ8bvUvojLSOA/AfLavfe/aDP9jkCXHBSB
	+ZM6ywtVXZIsyqwDAQlPpLKzXGwSg8lK0eWfMdYBDz7JyROHrpGWkigUVlypzGDjdUGMAsEibVB
	Gf+qG+O7w0QXlRvd3mTRLt5Z+XOG7Lrd141QkkV16mbtuH0S4nnMnP5VbkwCUA0NDqGZ/Yws3UE
	ao7UwqzpxBFdrr+E9Ooz3gXPEKzqc6kuBGqx
X-Google-Smtp-Source: AGHT+IGvCkkJqD6qSUoUh+xwHvMJ01rnl6B7Sa+qT153PtEezacOoKnOV9KdyQAKOj7uQ/LiGgjBPQ==
X-Received: by 2002:a05:6512:2391:b0:540:2fe6:6a3c with SMTP id 2adb3069b0e04-5428a5775dcmr7566905e87.0.1736853036185;
        Tue, 14 Jan 2025 03:10:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea68aesm1648501e87.149.2025.01.14.03.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 03:10:34 -0800 (PST)
Date: Tue, 14 Jan 2025 13:10:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Stephen Boyd <swboyd@chromium.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 7/9] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
Message-ID: <ab4wkauem3xb65wh3h22bcyzlpx26rrmsicrdlewomn55ykpqi@tggrsmb6qcmf>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-7-00b248349476@linaro.org>
 <459422c9-c272-4389-9b05-487a0148a082@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <459422c9-c272-4389-9b05-487a0148a082@quicinc.com>

On Mon, Jan 13, 2025 at 07:38:16PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> > Move perf mode handling for the bandwidth to
> > _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> > and then aggregating known values.
> > 
> > Note, this changes the fix_core_ab_vote. Previously it would be
> > multiplied per the CRTC number, now it will be used directly for
> > interconnect voting. This better reflects user requirements in the case
> > of different resolutions being set on different CRTCs: instead of using
> > the same bandwidth for each CRTC (which is incorrect) user can now
> > calculate overall bandwidth required by all outputs and use that value.
> > 
> 
> There are two things this change is doing:
> 
> 1) Dropping the core_clk_rate setting because its already handled inside
> _dpu_core_perf_get_core_clk_rate() and hence dpu_core_perf_crtc_update()
> will still work.
> 
> and
> 
> 2) Then this part of moving the ab/ib setting to
> _dpu_core_perf_crtc_update_bus().
> 
> Can we split this into two changes so that its clear that dropping
> core_clk_rate setting in this change will not cause an issue.

Ack

> 
> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 40 +++++++++++++--------------
> >   1 file changed, 19 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 70f43e8359caee2082f2ca9944a17a6a20aa3d49..7ff3405c6867556a8dc776783b91f1da6c86ef3f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -118,22 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> >   		return;
> >   	}
> > -	memset(perf, 0, sizeof(struct dpu_core_perf_params));
> > -
> > -	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > -		perf->bw_ctl = 0;
> > -		perf->max_per_pipe_ib = 0;
> > -		perf->core_clk_rate = 0;
> > -	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > -		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
> > -		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> > -		perf->core_clk_rate = core_perf->fix_core_clk_rate;
> > -	} else {
> > -		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > -		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > -		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> > -	}
> > -
> > +	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > +	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > +	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> >   	DRM_DEBUG_ATOMIC(
> >   		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
> >   			crtc->base.id, perf->core_clk_rate,
> > @@ -222,18 +209,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> >   {
> >   	struct dpu_core_perf_params perf = { 0 };
> >   	int i, ret = 0;
> > -	u64 avg_bw;
> > +	u32 avg_bw;
> > +	u32 peak_bw;
> >   	if (!kms->num_paths)
> >   		return 0;
> > -	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > +	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > +		avg_bw = 0;
> > +		peak_bw = 0;
> > +	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > +		avg_bw = kms->perf.fix_core_ab_vote;
> > +		peak_bw = kms->perf.fix_core_ib_vote;
> > +	} else {
> > +		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > +
> > +		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > +		peak_bw = perf.max_per_pipe_ib;
> > +	}
> > -	avg_bw = perf.bw_ctl;
> > -	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> > +	avg_bw /= kms->num_paths;
> >   	for (i = 0; i < kms->num_paths; i++)
> > -		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> > +		icc_set_bw(kms->path[i], avg_bw, peak_bw);
> >   	return ret;
> >   }
> > 

-- 
With best wishes
Dmitry

