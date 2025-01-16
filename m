Return-Path: <linux-arm-msm+bounces-45182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC12A1308C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 02:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4475218888C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 01:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F428BA53;
	Thu, 16 Jan 2025 01:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vgx2Zc1N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B9B15A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 01:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736990061; cv=none; b=kIkUCJ1C1B+MKc5KE63gIrwW1hd+KcCiP1OXxA6T1mgK6o5efDkAXVT2/O9n4+FV2bEdx64gTOeYor0taDeiKDiaxVvSpNJhO5X9nqLQQOKeKtQG2ac9kUAOmkrpEc7wWDziW+AGz4hytN0XdKD22yFjetkbNTYG1xEPXftJRcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736990061; c=relaxed/simple;
	bh=0wW0EfK0bU5MFEgsBUMq7m5nzcAbfaefswgWsxzOWNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mja+mirqDYZpj+cIjTuFi73DyDkJAzI5cphR7bzCELi/NZJ/Rra2HwYmCtR+8VNwIPT3yvw3xbxt4wvLqz8xL3B/8F0RbSrUzkKTtXviz1Idm2EOyQywamUIPrIoXJvYzC7jVmuR393WmlfaQEZfg3cII5q1IixEqrRyL7JNOUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vgx2Zc1N; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5426fcb3c69so324484e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 17:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736990057; x=1737594857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r4e0IudMnukUFWD7viyoe0eoxw+YDzAgC6X7Oe6+VlY=;
        b=vgx2Zc1Nvocx/POGzgc4qc++2lmN3zh5/5w1xcJyTiVN3ykUTm5Pug/w934u3nGvk9
         v8+Q4Mz/wAal/dmAFSpzJWEf19zXA4bwRGW4n5qhNnrLaa2wHHuNYLNkK2Uz/VKPrRzi
         txTbUnFi2+eFfYDNnOJ3C6qSZxEqx0xF6A6pP6VxkBOQiSEUfJxzcnjOkUkXi0Yw5TRK
         tad+d7mAab2hwXG5UZLGGAUo8ccebDNtorDoFvo/trlbpLDeSc26DfoBSwEsuJ7392j5
         4ewaQSdA8a8g+S3rAHvNuY30jtVER5G8TMPCo3S4qvqpsDLY1Jl3ub6nvlu2V07liLkf
         7Wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736990057; x=1737594857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4e0IudMnukUFWD7viyoe0eoxw+YDzAgC6X7Oe6+VlY=;
        b=WJ+e5sC0bm1r2mKUuQW2S27Ui/OXNJovFSN3Um7NU/pr8862HbbZheqOL2yJ6nU/Tp
         htG0SqvsZkFxWPA2BIg7Vp9/ORrl/anz16fvyddk2L10OugLWrWkzNZ005sPi7GhGVKG
         n9fu3xQC62pxmQBtH/4rUxC8ipZUWDCU3LyawH74wTEfpaapYyVZMQNflmBTOCFi+CWj
         E0I/FM7ERDSaNBaEUwU0gW/HxEgorAMPMJNNoHdcR9HsPRoyVe+Iq5ddVbE2Yb4VsGFm
         kQUIYct8HISRv30Vr84SqhMQ9Wj80lL9JXVgArB0zhV0p4xohRcOSNNvI129P1oJMYeH
         YJgw==
X-Forwarded-Encrypted: i=1; AJvYcCUTtpEkIIYSgPIGmcz9yzSiDQTAzbMMqI+oFBttDpPAa912vXQ66wnaDBD3ZEh+lBw1PpEYB+gQoYYp+mca@vger.kernel.org
X-Gm-Message-State: AOJu0YxVZme5ZKzkvehPFC8uOsQkB+8O/zGCKxH8dVxYJ4vw4F9uMdRR
	7myaUw9B/EjVFIMXIAuNOgJ0ZVxdiwRalg7wYXMve+ajhCMgn8yP3Hu96o3FY3U=
X-Gm-Gg: ASbGncv/UeqKcgCVkj2yDkRfZWtExWia915v/X70LNwTLNRrtL0nnRAmpP4gqwD4TAq
	4gS751gzFbNb+Eg4XuD8OLl9ucqXn5DEu1Ds+g8s/Ox54zHCNGnHhsJ+HFOK29qjtzGigyJZ/z2
	hVnyI9FWwgSGD1Cm1NyNlB48nG7AYsz+dDPGvl6Qfoh7l1RcZaq4RPgbVk1g9it8DI4yu1wY1kr
	6D89My5YrIdcgtjSt4iW6izOUI87pDW8uWsCgtB0pqO/b/0ppLVXNTCkVVrh55Io67fYzZBTDT+
	p3rF+17mdZ5yY1Kp/GBhSvDiYkaQJfmuycF5
X-Google-Smtp-Source: AGHT+IHcUh58pDRs3Rqutw/pYV92Q2PDhu6MhAiCX/8p7DwTj7+go5vUgCSXOd/KKHur5P9mxQJjeQ==
X-Received: by 2002:a05:6512:ac7:b0:540:3572:170c with SMTP id 2adb3069b0e04-542845af111mr8135121e87.2.1736990056825;
        Wed, 15 Jan 2025 17:14:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec0664sm2190106e87.193.2025.01.15.17.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 17:14:15 -0800 (PST)
Date: Thu, 16 Jan 2025 03:14:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Stephen Boyd <swboyd@chromium.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 7/9] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
Message-ID: <2fnrfaafg5shswb2p6tsw3ua7y4ll43qzmbrgc4qo6oou3mvwt@5kxr7vifb62m>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-7-00b248349476@linaro.org>
 <459422c9-c272-4389-9b05-487a0148a082@quicinc.com>
 <ab4wkauem3xb65wh3h22bcyzlpx26rrmsicrdlewomn55ykpqi@tggrsmb6qcmf>
 <8e6b6940-d155-4ab7-bdd6-a67e9506218a@quicinc.com>
 <4quxgv6n35np7fm7iqx5bw5xnkz7gxabh3ix5rexcq5nir5k7i@xi33w2wyj7om>
 <72c50442-5624-44ca-a954-64f7ddfa16f9@quicinc.com>
 <mvw34ny5en3dzt5ro6556daiktk6dc2azjotq26755dqscbu3b@fq7rxjqf7fg2>
 <b5a49ad8-02df-4418-911c-91bc57c4d05a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5a49ad8-02df-4418-911c-91bc57c4d05a@quicinc.com>

On Wed, Jan 15, 2025 at 04:40:39PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/15/2025 4:32 PM, Dmitry Baryshkov wrote:
> > On Wed, Jan 15, 2025 at 11:41:27AM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 1/15/2025 12:27 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Jan 14, 2025 at 01:18:26PM -0800, Abhinav Kumar wrote:
> > > > > 
> > > > > 
> > > > > On 1/14/2025 3:10 AM, Dmitry Baryshkov wrote:
> > > > > > On Mon, Jan 13, 2025 at 07:38:16PM -0800, Abhinav Kumar wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> > > > > > > > Move perf mode handling for the bandwidth to
> > > > > > > > _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> > > > > > > > and then aggregating known values.
> > > > > > > > 
> > > > > > > > Note, this changes the fix_core_ab_vote. Previously it would be
> > > > > > > > multiplied per the CRTC number, now it will be used directly for
> > > > > > > > interconnect voting. This better reflects user requirements in the case
> > > > > > > > of different resolutions being set on different CRTCs: instead of using
> > > > > > > > the same bandwidth for each CRTC (which is incorrect) user can now
> > > > > > > > calculate overall bandwidth required by all outputs and use that value.
> > > > > > > > 
> > > > > > > 
> > > > > > > There are two things this change is doing:
> > > > > > > 
> > > > > > > 1) Dropping the core_clk_rate setting because its already handled inside
> > > > > > > _dpu_core_perf_get_core_clk_rate() and hence dpu_core_perf_crtc_update()
> > > > > > > will still work.
> > > > > > > 
> > > > > > > and
> > > > > > > 
> > > > > > > 2) Then this part of moving the ab/ib setting to
> > > > > > > _dpu_core_perf_crtc_update_bus().
> > > > > > > 
> > > > > > > Can we split this into two changes so that its clear that dropping
> > > > > > > core_clk_rate setting in this change will not cause an issue.
> > > > > > 
> > > > > > Ack
> > > > > > 
> > > > > 
> > > > > Actually I think this is incorrect.
> > > > > 
> > > > > If the user puts in an incorrect value beyond the bounds, earlier the code
> > > > > will reject that by failing the in _dpu_core_perf_calc_crtc().
> > > > 
> > > > This function doesn't perform any validation nor returns an error code.
> > > > Probably you've meant some other function.
> > > > 
> > > 
> > > Sorry, let me explain a little more to complete the flow I am seeing.
> > > 
> > > _dpu_core_perf_calc_crtc() gets called by dpu_core_perf_crtc_check().
> > > 
> > > That one checks against erroneous values.
> > > 
> > >                  if (!threshold) {
> > >                          DPU_ERROR("no bandwidth limits specified\n");
> > >                          return -E2BIG;
> > >                  } else if (bw > threshold) {
> > >                          DPU_ERROR("exceeds bandwidth: %ukb > %ukb\n", bw,
> > >                                          threshold);
> > >                          return -E2BIG;
> > >                  }
> > 
> > Here we are checking that the selected set of modes doesn't overload
> > defined platform requirements. However I think that it should be
> > possible for the user to attempt to overcome predefined bandwidth
> > limitations in attempt to debug the issue. ICC framework handles that
> > perfectly (and if you check, until the sync_state is reached all BW's
> > are assumed to be UINT_MAX). Maybe I should document it in the commit
> > message that after this commit forced BWs are not a subject to the
> > catalog limitations.
> > 
> 
> hmmm, yes this was the validation I was referring to.
> 
> I didnt get why a user should be allowed to go beyond the platform limits,
> what purpose does that serve , its not leading to any conclusion or towards
> the resolution of the issue. With the platform validation not only we are
> enforcing the limits but also making sure that random values given by the
> user dont cause more harm than good.

If debugfs files are being used to overwrite the data, then the user is
an advanced user. Possible usage cases might include explicitly
overclocking the platform, performing validation checks or just
attempting to understand the underfill issues. Thus I belive the
advanced user should be given a power to shoot their leg by specifying
hugher values than specified in the catalog. As I wrote, ICC driver
already uses UINT_MAX for bandwidth values during the system bootup.
RPM(h) will enforce bandwidth limitations on those votes.

> 
> > > 
> > > > > 
> > > > > Now, if we move it to _dpu_core_perf_crtc_update_bus(), this is beyond the
> > > > > check phase so incorrect values cannot be rejected.
> > > > > 
> > > > > So we will still need to preserve overriding the values in
> > > > > _dpu_core_perf_calc_crtc().
> > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > > ---
> > > > > > > >      drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 40 +++++++++++++--------------
> > > > > > > >      1 file changed, 19 insertions(+), 21 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > > > > > index 70f43e8359caee2082f2ca9944a17a6a20aa3d49..7ff3405c6867556a8dc776783b91f1da6c86ef3f 100644
> > > > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > > > > > @@ -118,22 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> > > > > > > >      		return;
> > > > > > > >      	}
> > > > > > > > -	memset(perf, 0, sizeof(struct dpu_core_perf_params));
> > > > > > > > -
> > > > > > > > -	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > > > > > > > -		perf->bw_ctl = 0;
> > > > > > > > -		perf->max_per_pipe_ib = 0;
> > > > > > > > -		perf->core_clk_rate = 0;
> > > > > > > > -	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > > > > > > > -		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
> > > > > > > > -		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> > > > > > > > -		perf->core_clk_rate = core_perf->fix_core_clk_rate;
> > > > > > > > -	} else {
> > > > > > > > -		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > > > > > > > -		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > > > > > > > -		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> > > > > > > > -	}
> > > > > > > > -
> > > > > > > > +	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > > > > > > > +	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > > > > > > > +	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> > > > > > > >      	DRM_DEBUG_ATOMIC(
> > > > > > > >      		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
> > > > > > > >      			crtc->base.id, perf->core_clk_rate,
> > > > > > > > @@ -222,18 +209,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> > > > > > > >      {
> > > > > > > >      	struct dpu_core_perf_params perf = { 0 };
> > > > > > > >      	int i, ret = 0;
> > > > > > > > -	u64 avg_bw;
> > > > > > > > +	u32 avg_bw;
> > > > > > > > +	u32 peak_bw;
> > > > > > > >      	if (!kms->num_paths)
> > > > > > > >      		return 0;
> > > > > > > > -	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > > > > > > > +	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > > > > > > > +		avg_bw = 0;
> > > > > > > > +		peak_bw = 0;
> > > > > > > > +	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > > > > > > > +		avg_bw = kms->perf.fix_core_ab_vote;
> > > > > > > > +		peak_bw = kms->perf.fix_core_ib_vote;
> > > > > > > > +	} else {
> > > > > > > > +		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > > > > > > > +
> > > > > > > > +		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > > > > > > > +		peak_bw = perf.max_per_pipe_ib;
> > > > > > > > +	}
> > > > > > > > -	avg_bw = perf.bw_ctl;
> > > > > > > > -	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> > > > > > > > +	avg_bw /= kms->num_paths;
> > > > > > > >      	for (i = 0; i < kms->num_paths; i++)
> > > > > > > > -		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> > > > > > > > +		icc_set_bw(kms->path[i], avg_bw, peak_bw);
> > > > > > > >      	return ret;
> > > > > > > >      }
> > > > > > > > 
> > > > > > 
> > > > 
> > 

-- 
With best wishes
Dmitry

