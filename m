Return-Path: <linux-arm-msm+bounces-45084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A5AA11C3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 09:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A7E47A2228
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 08:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B861E7C16;
	Wed, 15 Jan 2025 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uom+qddv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110D41DB145
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736930518; cv=none; b=mqAYiYOTyuXRnEM28IFsRwv014KVVuFqwzmplwqUHkNODfBHGxZOK8lEV6mrSkOQk6tnkHfHJE5YXJx3sYQJLANOQRp6g31Kxkfr52jz3sOID0qkKuB3G4cOmqRR4cSZcVNz5K7/vz9QT6obxDQ01lHl0G2WM8t18/P1+0SHyhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736930518; c=relaxed/simple;
	bh=GwCSp43xpSIHSoOGobQRkNpMWg2cTAZxds53+NVko3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCiSnzrE3uV7nl4qWzuSGcoAgB4oQwKcpxEmAf6p2kIuJ3LD9PMm7nb2MijW7OinShIosuhZVoPLtjdSSt9uSipHTeiyKC1Ll3xfYhTcgG1R89covTHYd8vvvoaYCobfr7K9VXUr5qBSkTOdQ6R4HomxAekgoNOahUII8hrFpr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uom+qddv; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3061f1e534bso28367501fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 00:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736930514; x=1737535314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TdXKX+DElTWdQSe1iA/sdCzGpS4cDFP9391dO93DZTs=;
        b=Uom+qddvLML2qdDWzh4R4iMS6l5rxFI1P/9HBWfCjsrlO6hC0h06GJOrs0G0/DZOwl
         KZa6U4qd6y1A7973N0Wc/AXTCIi3QYpNdmpvRVECV8QJI4Qhc/nKzy3M3j3c5CYr/Z2J
         GS4npjriImgesV9kwZxSZaqZiiHmQz+uA8902mLtncpGjiRI+JgUQigQYKD/eui/Xlba
         JXmEcwfShPx2Fh2RAAA6SWyHNRrRlTjh2XHclM35ign9slHZexdAY8MSXajP5I9fi9z/
         jkSTSwNYucLQayi101vvDxWQZ465XdTxOaZWQ4NW8ea4qSFVYmK5nuDjPdINf9hRreYT
         K3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736930514; x=1737535314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdXKX+DElTWdQSe1iA/sdCzGpS4cDFP9391dO93DZTs=;
        b=O0K9y3EKyHe0mDKijxPBHPSRIQqe2qGXAA0aDUo8zqEr2T7U6KkCHZiQUbSCqZ7Y0Q
         aw4iUnrDZiWQyMSB5E7bdA571Vtvw2BplZbKy065t4swF5y50ogh9yUehg+/F+ngFMXc
         8xg2aowcR0dEuvtP5rDLtGgG6dCgEMignEkP4HYsiokxQYjpERhIWMDvMHivrPCmikLU
         sW/qmpHIuIaAVXgvPoo5V2l72cK8qLOwxg5VQ+HmkSc5iUPRBNIiQp2+yfeRQyqDdGNh
         kFtN/9O/8pSkeYefcu4KvJuYy0iN8WVRxARrL/MLF77E5FMeyEIgx1bNaFiZQFfFpQjq
         wxDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAmDHlr2BUXX6nLZXsOYWBmiZnKVqjQzEo/JyYK6cMAA4Z5fAWJeT8JqWIzHHwCIR+mauiOepqs66ak2N7@vger.kernel.org
X-Gm-Message-State: AOJu0YzBEyyU8HKHeevD/QSDjMWzmanvXtADZUm6qx0JAJTnq8Mki9Qy
	faPaCeG+t3+ZyZSgLqXqd9ciS8Bkz0l90Cp6sCOU2yE8M51iFaxjbD9bgWpBVtA=
X-Gm-Gg: ASbGnctnEtHVhXTWX+zchrZVhPL77NPp5ZcAJ1mgvtWWSKX4rWo6ZudqggZDSyeZPQI
	T1/PkrA7lc1OA8NM0HbHFd4DGtpVXXSyI7cLgfFGXpe/5NFrwUYkIrsYOSuGNRlsuHfkyj9ujsc
	ryPkATaYMYpwc61Mmg2rR/fQbIy4M6qrSYgA5YOXwzaX1M9bOPUOpjbw4LGkFIpa2N7oIHUKOqo
	6VJUlfjxt7OPvCr2uCJmrZFluZmiKVuqcevEDBMnGxZn4JyQp5yQijn6vOjVqcUdzH5IhMqviAP
	PruMjzBiDbQ2a0RE5UVQV3/aa9c4ny4aM+PG
X-Google-Smtp-Source: AGHT+IFepbkE4RMrmQ34QSMlcth3dnNyGKbzaxJER2+6cB4YSdoaV02zFA/hFD1vHxGGwE7iVc6AQQ==
X-Received: by 2002:a2e:be8a:0:b0:302:1b18:2bfa with SMTP id 38308e7fff4ca-305f45b25e8mr98179571fa.23.1736930513860;
        Wed, 15 Jan 2025 00:41:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0f6aa9sm20818371fa.57.2025.01.15.00.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:41:52 -0800 (PST)
Date: Wed, 15 Jan 2025 10:41:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Stephen Boyd <swboyd@chromium.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 8/9] drm/msm/dpu: rework core_perf debugfs overrides
Message-ID: <2qhm7oqpbgyoghpj3txjpmb4q3tmxd23cvrdqxicw3lpmwfcwg@m5mn5flvovmp>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-8-00b248349476@linaro.org>
 <86152d89-cf42-4e2f-a188-c401de9d47df@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86152d89-cf42-4e2f-a188-c401de9d47df@quicinc.com>

On Tue, Jan 14, 2025 at 02:02:54PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> > Currently debugfs provides separate 'modes' to override calculated
> > MDP_CLK rate and interconnect bandwidth votes. Change that to allow
> > overriding individual values (e.g. one can override just clock or just
> > average bandwidth vote). The maximum values allowed for those entries by
> > the platform can be read from the 'max_core_ab' and 'max_core_clk_rate'
> > files in debugfs.
> > 
> 
> Apart from the concern I highlighted in the previous patch, the only issue I
> have with this is that, this went from a one step process of using the
> "mode" this has become a two step one.
> 
> There were essentially two modes we are talking about - "fixed" and
> "minimum"
> 
> With respect to "fixed" this is totally fine because this is preserving that
> functionality because to be able to set the fixed mode the end user must
> know what values they want to try anyway.
> 
> With respect to "minimum" mode, is where this approach is not that great.
> The end users of this can be non-display developers too such as our QA teams
> who might want to perform a first level of triage on the issues and route it
> accordingly. This is especially true for underruns and some performance lags
> as well.
> 
> If you really dont like the term "modes", to preserve the "minimum" mode,
> how about just using a bool debugfs like "max_perf_params" which internally
> maxes out the max MDP clock and ab/ib params.

That's what I'm trying to avoid - having an extra debugfs file which
overrides other files. It is much easier to work if there is no need to
switch modes, it is easy to overlook it. I think it should be fine to
use `cat max_foo > fix_foo` to override each of the params. After
renaming the threshold_high to max_core_ab the names of the debugfs
files match.

> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 87 +++------------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 10 ---
> >   2 files changed, 9 insertions(+), 88 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 7ff3405c6867556a8dc776783b91f1da6c86ef3f..913eb4c01abe10c1ed84215fbbee50abd69e9317 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -17,20 +17,6 @@
> >   #include "dpu_crtc.h"
> >   #include "dpu_core_perf.h"
> > -/**
> > - * enum dpu_perf_mode - performance tuning mode
> > - * @DPU_PERF_MODE_NORMAL: performance controlled by user mode client
> > - * @DPU_PERF_MODE_MINIMUM: performance bounded by minimum setting
> > - * @DPU_PERF_MODE_FIXED: performance bounded by fixed setting
> > - * @DPU_PERF_MODE_MAX: maximum value, used for error checking
> > - */
> > -enum dpu_perf_mode {
> > -	DPU_PERF_MODE_NORMAL,
> > -	DPU_PERF_MODE_MINIMUM,
> > -	DPU_PERF_MODE_FIXED,
> > -	DPU_PERF_MODE_MAX
> > -};
> > -
> >   /**
> >    * _dpu_core_perf_calc_bw() - to calculate BW per crtc
> >    * @perf_cfg: performance configuration
> > @@ -215,18 +201,16 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> >   	if (!kms->num_paths)
> >   		return 0;
> > -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > -		avg_bw = 0;
> > -		peak_bw = 0;
> > -	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > +	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > +
> > +	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > +	peak_bw = perf.max_per_pipe_ib;
> > +
> > +	if (kms->perf.fix_core_ab_vote)
> >   		avg_bw = kms->perf.fix_core_ab_vote;
> > -		peak_bw = kms->perf.fix_core_ib_vote;
> > -	} else {
> > -		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > -		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > -		peak_bw = perf.max_per_pipe_ib;
> > -	}
> > +	if (kms->perf.fix_core_ib_vote)
> > +		peak_bw = kms->perf.fix_core_ib_vote;
> >   	avg_bw /= kms->num_paths;
> > @@ -275,12 +259,9 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
> >   	struct drm_crtc *crtc;
> >   	struct dpu_crtc_state *dpu_cstate;
> > -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
> > +	if (kms->perf.fix_core_clk_rate)
> >   		return kms->perf.fix_core_clk_rate;
> > -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
> > -		return kms->perf.max_core_clk_rate;
> > -
> >   	clk_rate = 0;
> >   	drm_for_each_crtc(crtc, kms->dev) {
> >   		if (crtc->enabled) {
> > @@ -396,54 +377,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >   #ifdef CONFIG_DEBUG_FS
> > -static ssize_t _dpu_core_perf_mode_write(struct file *file,
> > -		    const char __user *user_buf, size_t count, loff_t *ppos)
> > -{
> > -	struct dpu_core_perf *perf = file->private_data;
> > -	u32 perf_mode = 0;
> > -	int ret;
> > -
> > -	ret = kstrtouint_from_user(user_buf, count, 0, &perf_mode);
> > -	if (ret)
> > -		return ret;
> > -
> > -	if (perf_mode >= DPU_PERF_MODE_MAX)
> > -		return -EINVAL;
> > -
> > -	if (perf_mode == DPU_PERF_MODE_FIXED) {
> > -		DRM_INFO("fix performance mode\n");
> > -	} else if (perf_mode == DPU_PERF_MODE_MINIMUM) {
> > -		/* run the driver with max clk and BW vote */
> > -		DRM_INFO("minimum performance mode\n");
> > -	} else if (perf_mode == DPU_PERF_MODE_NORMAL) {
> > -		/* reset the perf tune params to 0 */
> > -		DRM_INFO("normal performance mode\n");
> > -	}
> > -	perf->perf_tune.mode = perf_mode;
> > -
> > -	return count;
> > -}
> > -
> > -static ssize_t _dpu_core_perf_mode_read(struct file *file,
> > -			char __user *buff, size_t count, loff_t *ppos)
> > -{
> > -	struct dpu_core_perf *perf = file->private_data;
> > -	int len;
> > -	char buf[128];
> > -
> > -	len = scnprintf(buf, sizeof(buf),
> > -			"mode %d\n",
> > -			perf->perf_tune.mode);
> > -
> > -	return simple_read_from_buffer(buff, count, ppos, buf, len);
> > -}
> > -
> > -static const struct file_operations dpu_core_perf_mode_fops = {
> > -	.open = simple_open,
> > -	.read = _dpu_core_perf_mode_read,
> > -	.write = _dpu_core_perf_mode_write,
> > -};
> > -
> >   /**
> >    * dpu_core_perf_debugfs_init - initialize debugfs for core performance context
> >    * @dpu_kms: Pointer to the dpu_kms struct
> > @@ -472,8 +405,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
> >   			(u32 *)&perf->perf_cfg->min_llcc_ib);
> >   	debugfs_create_u32("min_dram_ib", 0400, entry,
> >   			(u32 *)&perf->perf_cfg->min_dram_ib);
> > -	debugfs_create_file("perf_mode", 0600, entry,
> > -			(u32 *)perf, &dpu_core_perf_mode_fops);
> >   	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
> >   			&perf->fix_core_clk_rate);
> >   	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > index 5e07119c14c6a9ed3413d0eaddbd93df5cc3f79d..9d8516ca32d162b1e277ec88067e5c21abeb2017 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > @@ -24,20 +24,11 @@ struct dpu_core_perf_params {
> >   	u64 core_clk_rate;
> >   };
> > -/**
> > - * struct dpu_core_perf_tune - definition of performance tuning control
> > - * @mode: performance mode
> > - */
> > -struct dpu_core_perf_tune {
> > -	u32 mode;
> > -};
> > -
> >   /**
> >    * struct dpu_core_perf - definition of core performance context
> >    * @perf_cfg: Platform-specific performance configuration
> >    * @core_clk_rate: current core clock rate
> >    * @max_core_clk_rate: maximum allowable core clock rate
> > - * @perf_tune: debug control for performance tuning
> >    * @enable_bw_release: debug control for bandwidth release
> >    * @fix_core_clk_rate: fixed core clock request in Hz used in mode 2
> >    * @fix_core_ib_vote: fixed core ib vote in bps used in mode 2
> > @@ -47,7 +38,6 @@ struct dpu_core_perf {
> >   	const struct dpu_perf_cfg *perf_cfg;
> >   	u64 core_clk_rate;
> >   	u64 max_core_clk_rate;
> > -	struct dpu_core_perf_tune perf_tune;
> >   	u32 enable_bw_release;
> >   	u64 fix_core_clk_rate;
> >   	u32 fix_core_ib_vote;
> > 

-- 
With best wishes
Dmitry

