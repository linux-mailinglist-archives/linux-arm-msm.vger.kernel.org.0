Return-Path: <linux-arm-msm+bounces-45082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBDBA11BEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 09:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51C263A56DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 08:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8841EEA36;
	Wed, 15 Jan 2025 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EPXEt5Rk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C2B1EEA4A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 08:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736929629; cv=none; b=gi0uyexVcIds2eFdy7wy1wPw3j1KBDXY6AU0tCp/a2EH7UWoKecHgtlOlBZ1Go92wcrcp0yPWdRh/iVRu146lAyzhfJ8rRxlb2X2UBklpms/eMeCbOOYoOWX0NoLR7/uMLrNsJMJOHn5LlWdaXj39P7DWzDraplanCu1HDZt3M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736929629; c=relaxed/simple;
	bh=91z0eTHdxpwKjSdcUwY9wm/rjZ3XvXBLWMkkElq/2nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlmae7WYiEjf0h7W5HyfFnHxXmfj8B5+R7NvzeVeR5orQOv7Rgdt76ebUmjtOLFyMPRlyb/us9HiUNHYT3LS/va8E1L7I530Qd0PFLxbHvDQnCK2SSVapb3rT9/1ONys+vH71Z/f5KCVCUTdAvuL4a9F6rC7QZQSgWWCTKVDcCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EPXEt5Rk; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30613037309so38090151fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 00:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736929625; x=1737534425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pZ4HRx7SsZZko5M+0b/vJqN2qjluOm4gJzYYS2wUfjU=;
        b=EPXEt5RkPXykmUkl0YV9h+BERTpNxaiGp+pNKUsu2WFvR8tRXTmQ5bp7RbJ4RKszPt
         oVmZWD8F65RclLNx7aTnJRek33gfZXmtlV4Di+o5d9aJ+Zq4XtRbj3Gmg1nvqvihm5cc
         RPWd0VWbCymYSIhjQXn4MaIJm3UTEmCCsOHJ0DdUw0tPnIQ+YsvlWzqbc/wr5ZeAOx69
         T2qydzjG/1voZKnwSl0f7twBsvHZMaNZje3iGi9pazqLzLlv2lUANbnaRYaoPRIJsvZ8
         FtZkNbSUEfADSKSRb+gazEpYNod1Ze8Tf5dawqkeiOqMXIiwfiNTGpE/9OtCISq4PXUi
         +TOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736929625; x=1737534425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZ4HRx7SsZZko5M+0b/vJqN2qjluOm4gJzYYS2wUfjU=;
        b=tcteJBjLU2zQKPrgFAELb5a1Sn0RJc8Ajgo1MYwcl9UEuxy4TR4q2PTrbOU4HJcnb+
         ajuB7dYeZiN/c79hgDHfEvz3AXQlKLECIyNC84IMmF0QEVrggq9vwswsfeYYQ9QPDrAN
         Y4soIgu3RsZU4QqlRE+pv8zfS0+/v5haSQu9/dKz1cRvc0LvTg3bBEoHeDh4VTTgyDVS
         DlT9feLX618rcpH2Crv4eO7Md3wi3m3yNFrw1lFQgxG9tQq+x72ZFbNs44Ra5hgWfwTT
         VMs8u/WSeX1nFTmkYGkuN4SHJVqSgvs3gn0ujpAzoRmeguGr+VNrDaDliRg1i4PlnNpC
         83AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ONC1YvVmJZ2OYROn33HuZWcuPF6Ekqf8Raz2MyCjRXrUwshUsKweH5WugK+fhOj+5Hk/8IaIARwKYk08@vger.kernel.org
X-Gm-Message-State: AOJu0YxrBctDnDI322TByq5BSYQN4l4G3SaCo4+Oy5gJuYh9hOyK+WwH
	nAJ+Bm+8rVIpZiKfmd2PPBtfsz84loT09ipQLxBFJF1h4DbAtlNJ0+AwPNKBokw=
X-Gm-Gg: ASbGncuCBYiIEBuO7A3W/vMfY217WQuFhI5CMS60yqj4TI9MrEreV84yqgVb1XKHbJI
	ZGtQcvkNVIa8DWsRDALagaN4s1DFhbNWwHf74BBp8J22kH2zeOsu/EJb7gc04BTP9WKa7lgVBis
	6jGZx4RHyNVaFWJjGtA71X4mN0/8i74/wfa5v9z8rH+YkkhtBIdPttZLUGUC9/JFKiNK0SRcrjT
	gCz+w3J4bF7q395RMlYZgyxq0ve/tTu1AtT48y+FeBX8z7pPHpE14zBmTvWRQhHZoDuWO937/CX
	LCf1zN9apIriHB6wsaRO9xIDoEu6KsGCBqI4
X-Google-Smtp-Source: AGHT+IEa4wTdMIRF+GsL7h99ddXXaeUlR6bj66KVo6XSmN4DdnMNkhI7iraI/KfJn24NcdFDQUy/Zw==
X-Received: by 2002:a2e:bc1b:0:b0:302:2320:dc81 with SMTP id 38308e7fff4ca-305f4626035mr86805911fa.29.1736929625271;
        Wed, 15 Jan 2025 00:27:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0cf1f8sm21006251fa.27.2025.01.15.00.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:27:04 -0800 (PST)
Date: Wed, 15 Jan 2025 10:27:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Stephen Boyd <swboyd@chromium.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 7/9] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
Message-ID: <4quxgv6n35np7fm7iqx5bw5xnkz7gxabh3ix5rexcq5nir5k7i@xi33w2wyj7om>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-7-00b248349476@linaro.org>
 <459422c9-c272-4389-9b05-487a0148a082@quicinc.com>
 <ab4wkauem3xb65wh3h22bcyzlpx26rrmsicrdlewomn55ykpqi@tggrsmb6qcmf>
 <8e6b6940-d155-4ab7-bdd6-a67e9506218a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e6b6940-d155-4ab7-bdd6-a67e9506218a@quicinc.com>

On Tue, Jan 14, 2025 at 01:18:26PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/14/2025 3:10 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 07:38:16PM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> > > > Move perf mode handling for the bandwidth to
> > > > _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> > > > and then aggregating known values.
> > > > 
> > > > Note, this changes the fix_core_ab_vote. Previously it would be
> > > > multiplied per the CRTC number, now it will be used directly for
> > > > interconnect voting. This better reflects user requirements in the case
> > > > of different resolutions being set on different CRTCs: instead of using
> > > > the same bandwidth for each CRTC (which is incorrect) user can now
> > > > calculate overall bandwidth required by all outputs and use that value.
> > > > 
> > > 
> > > There are two things this change is doing:
> > > 
> > > 1) Dropping the core_clk_rate setting because its already handled inside
> > > _dpu_core_perf_get_core_clk_rate() and hence dpu_core_perf_crtc_update()
> > > will still work.
> > > 
> > > and
> > > 
> > > 2) Then this part of moving the ab/ib setting to
> > > _dpu_core_perf_crtc_update_bus().
> > > 
> > > Can we split this into two changes so that its clear that dropping
> > > core_clk_rate setting in this change will not cause an issue.
> > 
> > Ack
> > 
> 
> Actually I think this is incorrect.
> 
> If the user puts in an incorrect value beyond the bounds, earlier the code
> will reject that by failing the in _dpu_core_perf_calc_crtc().

This function doesn't perform any validation nor returns an error code.
Probably you've meant some other function.

> 
> Now, if we move it to _dpu_core_perf_crtc_update_bus(), this is beyond the
> check phase so incorrect values cannot be rejected.
> 
> So we will still need to preserve overriding the values in
> _dpu_core_perf_calc_crtc().
> 
> > > 
> > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 40 +++++++++++++--------------
> > > >    1 file changed, 19 insertions(+), 21 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > index 70f43e8359caee2082f2ca9944a17a6a20aa3d49..7ff3405c6867556a8dc776783b91f1da6c86ef3f 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > @@ -118,22 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> > > >    		return;
> > > >    	}
> > > > -	memset(perf, 0, sizeof(struct dpu_core_perf_params));
> > > > -
> > > > -	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > > > -		perf->bw_ctl = 0;
> > > > -		perf->max_per_pipe_ib = 0;
> > > > -		perf->core_clk_rate = 0;
> > > > -	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > > > -		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
> > > > -		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> > > > -		perf->core_clk_rate = core_perf->fix_core_clk_rate;
> > > > -	} else {
> > > > -		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > > > -		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > > > -		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> > > > -	}
> > > > -
> > > > +	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > > > +	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > > > +	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> > > >    	DRM_DEBUG_ATOMIC(
> > > >    		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
> > > >    			crtc->base.id, perf->core_clk_rate,
> > > > @@ -222,18 +209,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> > > >    {
> > > >    	struct dpu_core_perf_params perf = { 0 };
> > > >    	int i, ret = 0;
> > > > -	u64 avg_bw;
> > > > +	u32 avg_bw;
> > > > +	u32 peak_bw;
> > > >    	if (!kms->num_paths)
> > > >    		return 0;
> > > > -	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > > > +	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > > > +		avg_bw = 0;
> > > > +		peak_bw = 0;
> > > > +	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > > > +		avg_bw = kms->perf.fix_core_ab_vote;
> > > > +		peak_bw = kms->perf.fix_core_ib_vote;
> > > > +	} else {
> > > > +		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > > > +
> > > > +		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > > > +		peak_bw = perf.max_per_pipe_ib;
> > > > +	}
> > > > -	avg_bw = perf.bw_ctl;
> > > > -	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> > > > +	avg_bw /= kms->num_paths;
> > > >    	for (i = 0; i < kms->num_paths; i++)
> > > > -		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> > > > +		icc_set_bw(kms->path[i], avg_bw, peak_bw);
> > > >    	return ret;
> > > >    }
> > > > 
> > 

-- 
With best wishes
Dmitry

