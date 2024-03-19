Return-Path: <linux-arm-msm+bounces-14610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B21880743
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 23:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2B9EB2225F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 22:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E27E4F88A;
	Tue, 19 Mar 2024 22:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YbIOzeGy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255224F606
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 22:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710887172; cv=none; b=q0GnAyaP8eNR4e2sPvvA8uZUtmjs+v+IEtohWzpB75oBEIPDCoqvXQhOwBbp/erGVKuaFyUVFRDJYJtjcs5pZPRJGF+0qoPTT8LSlVg0heAyOpS+RXUkqhTt2hyXm9keK8bLxVTlnOW1Pj5P/GSxvy3QMLJ+Pq7xFgA06/5V784=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710887172; c=relaxed/simple;
	bh=uMXbcQPf4y5+qopmuy6rHunHddbJYo8HrxLr1124ba0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fhao7HXiOZ6Z5HIVpkKcZ5KdUrH8nLsIFfhrTPg1SQQxix3f886vWO6t8xEK6SoMK4aWKb9rCgWT7FWaPCJV4Isc+aqgJWGPztR8piiZL/lQUYzY+h84UliycIuZJw7mJOirKVeOxD7eWypOJL2BZ+hYmG/2HyAzeTI0fNt0OC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YbIOzeGy; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-607c5679842so65005937b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 15:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710887168; x=1711491968; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yXTlJKil58FLSsQmNZkGCIWPoB5207eTAoC7ZhI4KLQ=;
        b=YbIOzeGyfCFwn8FvyryRSB9lxkaXQW1/HUcTuzNbnaqrpfF/fSzVm45ox8zTn/rk43
         KI+NKh//Y13lZL7k4G8IMJrIiTwhYdCLPGc3yzYkJwzySWcllUM6Fjx8Zplh9R/iR8SC
         b9IdKbl8GnWlaqPAvMnuaw1TlC5msKZBJMQvrj/g9xk19nZcTMMOL+mfMHDVnU38DYiK
         /DoDSCIX0TBgqR0kSy8xGdvLyLSfUBWFAegXmy/6SpdqPdTxRWakDzm/+kxJD9j/WzhY
         PeXD829+gS1Onvx4Kvi7gQ3z9DSFToqQlR6fzd2YSKiGu3nD3qAe6ch5zDmLk2TIerqF
         Riag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710887168; x=1711491968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXTlJKil58FLSsQmNZkGCIWPoB5207eTAoC7ZhI4KLQ=;
        b=EQBzhK9CDOMSKjdGOItAjjQfdvXMZXM88oppVDd1Vrgz5IqHNFs1NQvttavzuQpxlA
         5/0gHKPW5ZkESyYhgFM2GxPCjhf/MTN+SKd5xfHF5Ae0umsiOb4NaTnT1YFvVQZFztnW
         YoVjng4hXTu8YD9Ugop59ug/1Ccj7Hqf01+s2yPHyM20gp2nKte2A8BUYk5WTWh4H53J
         q6W//vtCxqch1Jkm+5h0xPnoB6l+GZ0GIjslmmXjxx2F/FszxQECLcogHPNck0ceGUSy
         EUL/otLhysXmcPY6mEgwWnk52ocyZy7hH5haJySdH8JaBA/igRNCKLBakJuh2KHlGb7c
         VMbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXcVWiR/vmpi2lP6YhIk3HQlkZGuDnHaoWj4MnWndKOTnToH9H7vwP3SIocXrFhW9wSIsJZGRdD7S+U3oXo9VOL8mwJckoDRh86ArV5Q==
X-Gm-Message-State: AOJu0YyvMlFP8vFCI+cs9d+YDWAxccBd44v+fH7k6c9NaM9yxu1A3aal
	9uegwLMqis7+Tz9K10Rqg+apscTMF6HfJOrTMAG+B7FFzabhWC/hnnuaHLLG2nEYlMEU0FE0jNX
	DLeIAa7TR2Evzak4vLYbOz7mCNVoAakpXKAwUhg==
X-Google-Smtp-Source: AGHT+IFyemvcLV2eFXzf6A6bMavLU7dQAVLvAK++1A5yltvDjNRHmXVwK08p4b/edHFxvTO+wQKEMbnd38lt4KQ6gxs=
X-Received: by 2002:a0d:d84f:0:b0:60a:35f:e92a with SMTP id
 a76-20020a0dd84f000000b0060a035fe92amr406778ywe.10.1710887168137; Tue, 19 Mar
 2024 15:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
 <20240314-dpu-perf-rework-v3-3-79fa4e065574@linaro.org> <ebf0ca9b-6e9d-4387-8628-a6ccaca11215@quicinc.com>
 <CAA8EJprhgPheFq-xhAh54NkTTh5_BJk=bL1f94=hvsio6VUSQQ@mail.gmail.com> <949d04c1-910d-04e0-14f2-1373c1312daf@quicinc.com>
In-Reply-To: <949d04c1-910d-04e0-14f2-1373c1312daf@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 20 Mar 2024 00:25:57 +0200
Message-ID: <CAA8EJppVbnB+P4sYWXJZ4=1_yb2jQhPjC1x6w1zEJQp4Cnj4-A@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 23:35, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/19/2024 1:43 PM, Dmitry Baryshkov wrote:
> > On Tue, 19 Mar 2024 at 22:34, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/13/2024 6:10 PM, Dmitry Baryshkov wrote:
> >>> Move perf mode handling for the bandwidth to
> >>> _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> >>> and then aggregating known values.
> >>>
> >>> Note, this changes the fix_core_ab_vote. Previously it would be
> >>> multiplied per the CRTC number, now it will be used directly for
> >>> interconnect voting.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 39 +++++++++++++--------------
> >>>    1 file changed, 19 insertions(+), 20 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>> index 87b892069526..ff2942a6a678 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>> @@ -118,21 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> >>>                return;
> >>>        }
> >>>
> >>> -     memset(perf, 0, sizeof(struct dpu_core_perf_params));
> >>> -
> >>> -     if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> >>> -             perf->bw_ctl = 0;
> >>> -             perf->max_per_pipe_ib = 0;
> >>> -             perf->core_clk_rate = 0;
> >>> -     } else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> >>> -             perf->bw_ctl = core_perf->fix_core_ab_vote;
> >>> -             perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> >>> -             perf->core_clk_rate = core_perf->fix_core_clk_rate;
> >>> -     } else {
> >>> -             perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> >>> -             perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> >>> -             perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> >>> -     }
> >>> +     perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> >>> +     perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> >>> +     perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> >>>
> >>>        DRM_DEBUG_ATOMIC(
> >>>                "crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
> >>> @@ -233,18 +221,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> >>>    {
> >>>        struct dpu_core_perf_params perf = { 0 };
> >>>        int i, ret = 0;
> >>> -     u64 avg_bw;
> >>> +     u32 avg_bw;
> >>> +     u32 peak_bw;
>
> Why were avg_bw and peak_bw values brought down to u32?
>
> I think we might go higher so u64 was better.

First of all, icc_set_bw takes u32, not u64. The unit is 1000 bps, not
1 bps, so sensible values fit into u32.

>
> >>>
> >>>        if (!kms->num_paths)
> >>>                return 0;
> >>>
> >>> -     dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> >>> +     if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> >>> +             avg_bw = 0;
> >>> +             peak_bw = 0;
> >>> +     } else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> >>> +             avg_bw = kms->perf.fix_core_ab_vote;
> >>> +             peak_bw = kms->perf.fix_core_ib_vote;
>
> Instead of changing the value of avg_bw like mentioned in commit text,
> why cant we do avg_bw = fix_core_ab * (drm_mode_config::num_crtc);
>
> Any reason you want to change it from "per CRTC fixed" to just "fixed"?
>
> Now, the user who wants to hard-code this also needs to first account
> for number of CRTCs from the dri state and then program the fixed value
> using debugfs. Thats not convenient.

Different CRTCs have different bandwidth values, so programming as
value-per-CRTC is not efficient. In the end we care for the overall
bandwidth, so one has to calculate the expected value then divide it
per num_crtc.

>
> >>> +     } else {
> >>> +             dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> >>
> >> Where is this function dpu_core_perf_aggregate() defined? I dont see it
> >> in msm-next
> >
> > In the previous patch.
> >
>
> Sorry, my bad. I thought it had a different name in the prev patch :/

No problems.

>
>
> >>
> >>> +
> >>> +             avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> >>> +             peak_bw = perf.max_per_pipe_ib;
> >>> +     }
> >>>
> >>> -     avg_bw = perf.bw_ctl;
> >>> -     do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> >>> +     avg_bw /= kms->num_paths;
> >>>
>
> >>>        for (i = 0; i < kms->num_paths; i++)
> >>> -             icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> >>> +             icc_set_bw(kms->path[i], avg_bw, peak_bw);
> >>>
> >>>        return ret;
> >>>    }
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

