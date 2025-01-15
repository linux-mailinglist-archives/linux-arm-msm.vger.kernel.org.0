Return-Path: <linux-arm-msm+bounces-45085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BDFA11C3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 09:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 762317A0438
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 08:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7F723F297;
	Wed, 15 Jan 2025 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPG4pm7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFA123F262
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 08:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736930552; cv=none; b=EIqujmplNgTk+vW9e/lMWaFECzykkc6CgExUeMjtdVXmXELI+v7WgLyRAAgMH08qtqRlw3g8tjfP/Of2VTYs3J0qL/dc5adBXzenq7uON2eDsjQNfQY+Ng0USKE21X+tJpqa+NCrUzsj45ve+M2kUfJlYAX1PL738oXiUDEaOoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736930552; c=relaxed/simple;
	bh=LclZrWRJenNNv52ubs9UlI7rdXzGRPQkSJAuUsFUrKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOSGgaHN54z9X7bs6n21kqvP8PxLlCpor4wnrOcBi5aRaWjsw58cPkM4Y9RNSwQW7HAAtmq7OuwKMNa3NFKgQn6mAKSA1TyEMF2fT/cy3KoHOUpVb7JqD3PS/3H0VEn+xigCu9jWL6pi7SsXd9G055NWKU07MTMaiflW2MoCoqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tPG4pm7f; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e3c47434eso6039037e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 00:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736930548; x=1737535348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lZk/iR/++ahrsJFkMAeCydXncYIA/yDJCJs2b060X04=;
        b=tPG4pm7flO2BuAkGWPQyUubR4eU4RwfQClkbr+fw2XtgwzW8W6gwNGKPVvSOp4XxxZ
         af8X02C1WHAUw0yzn8zfUwqIQc75uOy8AtalYsv6LNAMQCLCezeka6aXvA+6Bq2jO/Mq
         ltD6wWFLGrnaMBiPIWozt0tzPCsUO6Aak7MK5mXzy6hOvFECkhQNztzsD6hSeBbCAbO/
         ra1OtaqgL6PReBV3MRpj991S+FAkghVNEUK9xS6Rn7e7y9ObcckYKPx/Wx4K+G4iBQI0
         EV10v2U5Aztw+ItDCGduFOAjM3IrGIaDOnfBRFiP1okHf8lndetgDzQDJOcsSIJ1Y5/B
         UtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736930548; x=1737535348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZk/iR/++ahrsJFkMAeCydXncYIA/yDJCJs2b060X04=;
        b=OLX14ZDIi2JylQvnhX7C9hOH/sNjxAZdHD5F0CTj5gw71iw5c0dYKgxEw9pRPGc/zl
         hfJDZ1awO+SnSrX50tnahzjjfiVrTR3C/RgcJuE1yZSIanNr0ae9hhZDOWYNdUBC4UPE
         OZmf7/6lV5c4j+2S7EQWwJioLn7S4BnfoexVuwkVZm2FE9uiVLX88LA4g2q3yD3NAUZT
         0JoTt67kWHi3fD1pT0/vbOOyZpTOUE/TFkpmYY0WKAPajrhryvfQCeZ8WxCKwBLWjoG6
         GBGS/fXgy9LFJvaQMOnTM8RLpnucgNViwNJx4XFtjxDqs23lvl5p4abN4EGPAdnYJyFb
         /+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVoZgSmkx40DjzTfdOuMkkM4wZ8W52FeRsXIXxi5y3h8CqMty+f5V0MPmgiphyosP2Yh2g35TggWOxlyyu0@vger.kernel.org
X-Gm-Message-State: AOJu0YyVK0CiYAHyYgRZw622DPXJZsh4A6Wvpjgypnv+nwEDuI1LGY0U
	IKmPFF2Pp5LgL9iB39BGmwk8B98xpXcvl2qapXlr+RkJwxiFZt1NiSAbY/iW9iI=
X-Gm-Gg: ASbGncvELWjQrAKfbbhRMnbakeARjPye54WW/vRFu6GtybxARPLtlws6njBKfFLuW8a
	YYAeF8IMFdXnTaogSZk4z5Dsrj5ZS2d2zTsfWHG3B1zuzybR8FhD/XR7NqZ2il5pr9Ub5pSAQh4
	7n9HNw9w2q/63LX0Zodw7dUItSAN+d9jcTYf0ZBhb6RBdRB5L7+Zjpr5WsR8cwdVvv3Of5OOBDO
	960IKuzIvnhS/N6L48DO4bCmUsCeLzGVVqs0nylIIDWKe7LDhVwLqOdiMNEk0Yh+7Dhl7zEZR70
	iVQ+S8JxOnXm+jyEhBYijirDdHWhUhaXRRsz
X-Google-Smtp-Source: AGHT+IHxu2bWsq5LOpgqWeFg+x5QNIImak2VP0xFnPhyWJs6nSmCqpRMYEK49XiKqJfZCWCXlCW9lw==
X-Received: by 2002:a05:6512:a8e:b0:542:2990:722e with SMTP id 2adb3069b0e04-542845ba7b6mr9152754e87.15.1736930548306;
        Wed, 15 Jan 2025 00:42:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1c7bd4sm20361321fa.80.2025.01.15.00.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:42:27 -0800 (PST)
Date: Wed, 15 Jan 2025 10:42:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Stephen Boyd <swboyd@chromium.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 9/9] drm/msm/dpu: drop
 dpu_core_perf_params::max_per_pipe_ib
Message-ID: <5wmq4j2wh4eflsqanfladxh3wnbqcmxfezvxfs6kwmfu4iw5mi@rnemw3o52qkx>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-9-00b248349476@linaro.org>
 <0fcc05ba-a126-4214-8a3d-9586cd5e8d88@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fcc05ba-a126-4214-8a3d-9586cd5e8d88@quicinc.com>

On Tue, Jan 14, 2025 at 04:53:10PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> > The max_per_pipe_ib is a constant across all CRTCs and is read from the
> > catalog. The override value is also applied at the
> > _dpu_core_perf_crtc_update_bus() time. Drop corresponding calculations
> > and read the value directly at icc_set_bw() time.
> > 
> > Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 16 ++++------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  2 --
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 --
> >   3 files changed, 4 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 913eb4c01abe10c1ed84215fbbee50abd69e9317..62dab5883513dc570076da5a64e32e502dd4320b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -105,12 +105,10 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> >   	}
> >   	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > -	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> >   	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> >   	DRM_DEBUG_ATOMIC(
> > -		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
> > +		"crtc=%d clk_rate=%llu core_ab=%u\n",
> >   			crtc->base.id, perf->core_clk_rate,
> > -			perf->max_per_pipe_ib,
> >   			(u32)DIV_ROUND_UP_ULL(perf->bw_ctl, 1000));
> >   }
> > @@ -126,9 +124,6 @@ static void dpu_core_perf_aggregate(struct drm_device *ddev,
> >   		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
> >   			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
> > -			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
> > -						    dpu_cstate->new_perf.max_per_pipe_ib);
> 
> During the enabled cases, this is fine since even if one crtc is enabled,
> its going to use the same value.
> 
> During disable to enable and enable to disable transitions, we do need to
> make it 0 right?

Good point, I will check that later.

> 
> OR if its already being made 0, we need to make sure it gets updated by
> forcing update_bus to true?
> 
> Is this part being handled by this block dpu_core_perf_crtc_update()?
> 
>         } else {
>                 DRM_DEBUG_ATOMIC("crtc=%d disable\n", crtc->base.id);
>                 memset(old, 0, sizeof(*old));
>                 update_bus = true;
>                 update_clk = true;
>         }
> 
> Please confirm this, I am fine with this change otherwise.
> 
> > -
> >   			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
> >   			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
> > @@ -204,7 +199,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> >   	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> >   	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > -	peak_bw = perf.max_per_pipe_ib;
> > +	peak_bw = kms->catalog->perf->min_dram_ib;
> >   	if (kms->perf.fix_core_ab_vote)
> >   		avg_bw = kms->perf.fix_core_ab_vote;
> > @@ -315,15 +310,12 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >   		 * 2. new bandwidth vote - "ab or ib vote" is lower
> >   		 *    than current vote at end of commit or stop.
> >   		 */
> > -		if ((params_changed && ((new->bw_ctl > old->bw_ctl) ||
> > -			(new->max_per_pipe_ib > old->max_per_pipe_ib)))	||
> > -			(!params_changed && ((new->bw_ctl < old->bw_ctl) ||
> > -			(new->max_per_pipe_ib < old->max_per_pipe_ib)))) {
> > +		if ((params_changed && new->bw_ctl > old->bw_ctl) ||
> > +		    (!params_changed && new->bw_ctl < old->bw_ctl)) {
> >   			DRM_DEBUG_ATOMIC("crtc=%d p=%d new_bw=%llu,old_bw=%llu\n",
> >   				crtc->base.id, params_changed,
> >   				new->bw_ctl, old->bw_ctl);
> >   			old->bw_ctl = new->bw_ctl;
> > -			old->max_per_pipe_ib = new->max_per_pipe_ib;
> >   			update_bus = true;
> >   		}
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > index 9d8516ca32d162b1e277ec88067e5c21abeb2017..863a6fc1f30c21cf2030a30be5fe62b024b3b820 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > @@ -14,12 +14,10 @@
> >   /**
> >    * struct dpu_core_perf_params - definition of performance parameters
> > - * @max_per_pipe_ib: maximum instantaneous bandwidth request
> >    * @bw_ctl: arbitrated bandwidth request
> >    * @core_clk_rate: core clock rate request
> >    */
> >   struct dpu_core_perf_params {
> > -	u32 max_per_pipe_ib;
> >   	u64 bw_ctl;
> >   	u64 core_clk_rate;
> >   };
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index ac3c6c5ad1cec3856f0eff2ed71153d3c2dc279e..cc240d3c7faa89254a575237634d0d0fa8f04f73 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1488,8 +1488,6 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
> >   			dpu_crtc->cur_perf.core_clk_rate);
> >   	seq_printf(s, "bw_ctl: %uk\n",
> >   		   (u32)DIV_ROUND_UP_ULL(dpu_crtc->cur_perf.bw_ctl, 1000));
> > -	seq_printf(s, "max_per_pipe_ib: %u\n",
> > -				dpu_crtc->cur_perf.max_per_pipe_ib);
> >   	return 0;
> >   }
> > 

-- 
With best wishes
Dmitry

