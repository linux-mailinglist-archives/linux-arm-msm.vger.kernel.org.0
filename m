Return-Path: <linux-arm-msm+bounces-44700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A311AA0851B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 03:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 135AB3A932E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 02:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4F313EFE3;
	Fri, 10 Jan 2025 02:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eemy4Au4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24BB18027
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 02:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736474550; cv=none; b=sfiFpsWw0pv5GTMQ/nJJfy8R15tfRHmtFi3zLhY8j4WsRObQ7fU3vmlNBEvdKCd2s8OJqQX13BEiUbaiLHyFNLwZbXS6wAkW9XDEjL6aVKI8wQSXfAyWFEpq7heGizP2AqhxnpDHq61gtCuQIdmSYU8dYokZtrH9FCw8GYjePTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736474550; c=relaxed/simple;
	bh=jKu93aQYdJzVANSF3LzEoaTM4YDPLRwgHAmTdhVXvZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETx988PoPBNT194+8EfTVz6PCN8lK6Zey0da9Q0PK/9jYQkFghLjdkhFo7LbwbgfNKE5TFtG08mtMQZ2Dz9le57akVpaoDmSBWDW5yf7dsVdq5dbEgMS7KIvPrFTgkLUbbwzqFrT/RQeaxUUhMjFPgrRs2iTG2nQwkbIQs8d9JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eemy4Au4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so1570839e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 18:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736474545; x=1737079345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IistZR9U1Esc/jSmKmQKS5mSqzf1yAZIWNOXNclkVNI=;
        b=eemy4Au4Ui78XVT9hbAs+nw1+o66k0/PpPcyFYZOf4YFL5C/K37ZgW6mXl0/BP5UsQ
         yWW98UMgBJxjWnBeKzU0EFqz3HlsWXqadYJ9DWVt70empzLMaPWIJ1vQ4HcLo39qBYkm
         uRDnMjRq8TlvvvJG2AEmjhURODFBpKq7UFFsEzjkPnUqKw+siElvPB9E/imLxIbYrK8O
         1m6Hm29MmiHNGP/HiyzL9Bev2EML7wx3OUGflww4xjVozbc/JUWAM2TpwLTn/aqy1rMr
         zzaGomH9gEeGoiAYkB4wd3hcrwFPbCZXvtHMwqArkngmu7eFb25oOPqdv3fqAMX3Ziiy
         F84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736474545; x=1737079345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IistZR9U1Esc/jSmKmQKS5mSqzf1yAZIWNOXNclkVNI=;
        b=E1ifN1WEFj2VQHkCla4jhCJrlW+Lb4QH5jN16FZa78S8TdD1+LIZtjsBYDEFjnxT4k
         UpS5H5jKnF3eHIOgntLkWbgRpPSykmbHl5GhnoVDIwvVQ4FXlQZ2uan/i7zBR9xmu1l0
         xXfJQBrRc0qrU/RV7g4eppxnOOoljuVheEv6ZieLAZL16paS9Z5LujTxDRt0ej3smIH2
         wZ8C4Bq2y0vCLDwA9SZTS4vwKZOA0y6YJH4KOmhV3oIafw0NwxNEoz/n7ffh/mPNWTRJ
         9hJ9LpNSsU3MQg64zlMbKEzUN+CY6EcyGuADFEb34V6w2JlmGiAzD9EYZpo35poC7LxF
         LTAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlRfFjGRKxaOljl3S9e427rdDYXNVRMZ7t9o44c+/N+xGKjzcV4xv1lb/tGflGQiocrW2lTltMRSde2Vlm@vger.kernel.org
X-Gm-Message-State: AOJu0Yybjf2h18mjvVK13XXiwabyfiGI8RauYoYwcMTMTIsZ8mQAPueN
	IGXeNPEEqEIrZd5MUHG9c467NsPmB8aujdN7QTDSrXGViVdq6luDQah6oheLClNHClM4Wb5d4uO
	v
X-Gm-Gg: ASbGncsCfbNOihYkJTECnShHVixWOaSfngmUZ/tKYJn0OJRCVkIqvBmbgTlb3j+U3jQ
	9nYfupHW89uaJRRyhW+YlaSiL7SADse9ru4hL1UwMcp2BGiY8qtak+EKkIzfRDak2A0ETSJ/Roh
	BCCODx0NmrZKT0XZ/nf4TOZb/V3TnVMCDMYnNYN1KJJl2PMumwEmEO19mOv46+rIlgnsMGHcf0u
	ls9ArppyquNtc94ymYHNwFIVnmTzDc/Ld7a3LVnhloY/BU/RKkeB7Cl/qw10Dk1CldLqqoKizfp
	FrAYUnpAKBwj/PYfFcGV2HgH1prtJPODTGtO
X-Google-Smtp-Source: AGHT+IGZaXEzsNU48TlmzwrK1r4jXywYY4XA2tgLFhAYXAdj17LoYLX0rPRCpKNsxJKPndLhECZQug==
X-Received: by 2002:a05:6512:3994:b0:542:29a6:a063 with SMTP id 2adb3069b0e04-542847f9de7mr2929382e87.43.1736474544784;
        Thu, 09 Jan 2025 18:02:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6ab4sm360947e87.145.2025.01.09.18.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 18:02:23 -0800 (PST)
Date: Fri, 10 Jan 2025 04:02:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Stephen Boyd <swboyd@chromium.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 4/9] drm/msm/dpu: make fix_core_ab_vote consistent
 with fix_core_ib_vote
Message-ID: <sklr3ryu35xmoejkmbu35d3jxsg2clk3whmzslxtzcbcb3gjy4@bmcivlzkxqa3>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-4-00b248349476@linaro.org>
 <35a22251-c348-4bb7-905c-e24032100a00@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35a22251-c348-4bb7-905c-e24032100a00@quicinc.com>

On Thu, Jan 09, 2025 at 05:40:23PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> > The fix_core_ab_vote is an average bandwidth value, used for bandwidth
> > overrides in several cases. However there is an internal inconsistency:
> > fix_core_ib_vote is defined in KBps, while fix_core_ab_vote is defined
> > in Bps.
> > 
> > Fix that by changing the type of the variable to u32 and using * 1000ULL
> > multiplier when setting up the dpu_core_perf_params::bw_ctl value.
> > 
> 
> Actually after looking at this, I have another question.
> 
> How did you conclude that fix_core_ib_vote is in KBps?
> 
> min_dram_ib is in KBps in the catalog but how is fix_core_ib_vote?
> 
> It depends on the interpretation perhaps. If the debugfs was supposed to
> operate under the expectation that the provided value will be pre-multiplied
> by 1000 and given then that explains why it was not multiplied again.
> 
> And I cross-checked some of the internal usages of the debugfs, the values
> provided to it were in Bps and not KBps.

Well... As you wrote min_dram_ib is in KBps. So, by comparing the next
two lines, fix_core_ib_vote should also be in kBps, as there is no
premultiplier:

                perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
[...]
                perf->max_per_pipe_ib = perf_cfg->min_dram_ib;

And then, as a proof, perf->max_per_pipe_ib is passed to icc_set_bw()
without any modifications:

                icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);


> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 2 +-
> >   2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 7263ab63a692554cd51a7fd91bd6250330179240..7cabc8f26908cfd2dbbffebd7c70fc37d9159733 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -125,7 +125,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> >   		perf->max_per_pipe_ib = 0;
> >   		perf->core_clk_rate = 0;
> >   	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > -		perf->bw_ctl = core_perf->fix_core_ab_vote;
> > +		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
> >   		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> >   		perf->core_clk_rate = core_perf->fix_core_clk_rate;
> >   	} else {
> > @@ -479,7 +479,7 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
> >   			&perf->fix_core_clk_rate);
> >   	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
> >   			&perf->fix_core_ib_vote);
> > -	debugfs_create_u64("fix_core_ab_vote", 0600, entry,
> > +	debugfs_create_u32("fix_core_ab_vote", 0600, entry,
> >   			&perf->fix_core_ab_vote);
> >   	return 0;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > index ca4595b4ec217697849af02446b23ed0857a0295..5e07119c14c6a9ed3413d0eaddbd93df5cc3f79d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > @@ -51,7 +51,7 @@ struct dpu_core_perf {
> >   	u32 enable_bw_release;
> >   	u64 fix_core_clk_rate;
> >   	u32 fix_core_ib_vote;
> > -	u64 fix_core_ab_vote;
> > +	u32 fix_core_ab_vote;
> >   };
> >   int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
> > 

-- 
With best wishes
Dmitry

