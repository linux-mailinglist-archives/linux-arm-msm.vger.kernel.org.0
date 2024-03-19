Return-Path: <linux-arm-msm+bounces-14605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA1F88062C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 21:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33D811F22C37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 20:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CE73F9D4;
	Tue, 19 Mar 2024 20:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TPrO4yZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCC23F9C6
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 20:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710881039; cv=none; b=YqDQ9PxFjmB4uxKJStkztMmmo1KBkQcNldmarl3JDZJn1WYeN22+NLipBg1IW5vh8KepruHxVJ2Aur1UPsdL1RMlVldsXZq1nVRnwzd0Yqj6DEy5nJbdsmqHs1RiSPZ7/ShjXFcVz7usPDk5NPKISabNKUMPvtrSorxny08MvIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710881039; c=relaxed/simple;
	bh=DXTZx1OTVG22giXe5Qhpdo2Jxyata1VToELP6znPcLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h282Tty/1nApuRt16YIU50h9v9wU+5XK5JTmFYKLOvjfIVFxnWt+My3yPFeKTY5vR803A8iM05Pgp05h9Q7X8us/lmTsVCnV0dKueQA+7qrUicIeQAuPpkxoI3Uf0R2N9vOt8GSJI143thtxc2XOSKWYPEGJzinvpGhlLTwo0ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TPrO4yZm; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60a0599f647so55259167b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 13:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710881036; x=1711485836; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OeXdd6BoIpGck+XAlpFKofkTnIc6zBqulWBdd+v07Ic=;
        b=TPrO4yZmVn2R+0u4jR+r0xzWhDbC48+kucUSEObFxv9GFjtX8+siBebckhOWA/Hl4D
         c4+KuVvTlWNSInLTdjaCWZojPaYbq1byZVDXE53/e/FOQ3PM7dG/VlVGcc1H1VoceeIk
         8QRUH+Y/qcuVLrM5CCokZnChR6yGE/qov/wUMArgq3mhzenZ74CKcEg6FLeOZvEB4ZGU
         E90YFOmntZnt3Znt4oxHOSuAl4R/IZ5YjmDhocaM8w06JuGuoiIVwgDJPcAI+uOjPdpT
         gl2xlRnKYo8chRfhqGkFWEs955r/3MNHUgl3elygXPeV4cCu+CFcgVWLvKFdZmOPvO/X
         VWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710881036; x=1711485836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeXdd6BoIpGck+XAlpFKofkTnIc6zBqulWBdd+v07Ic=;
        b=PnM1zPDRR1unJHIJrXoRBPHmUqc/nihxD/qHl/eWtvITz3ZSb7dxShDhuqjsAMndXE
         SA0fjGQROGos2QwKpm3OFyFIUa6ml+RMcTGYhQicha/e1RUDaq/r/pfj2n6eV57yRF5C
         Mdj7tLn9fQx86beQmgjQE2PooKgrIR7eUhbKB4dYh4D0RxPHX8NFFyqhey3/zdhAZzT0
         klNzOVorN7BRZpQUXe0YROnf5oxga9a9HTZDi2FXcBWcPtH6hbqgesyXuh4pATTmm6vC
         c3AjEjq7Me8TgThhWXJ5742PUduY9AifFBDHtwnt03W4sB71G5Pa9/P094U4LgaWNPAQ
         CwTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn1aMwaTJ+f2K8uNVM3fLFz21ysW8QU4lzDpFzehDsmDWSmKyWEwzWZq3tmARGV+mknARABOAqsM8uEE3oNfc6fDnvayu0srB9JL8PoQ==
X-Gm-Message-State: AOJu0Yzy53NNtkm1IBmsIWNmze1C9rFfEE/ZKQL5pgx+GR5MiGMwIPDF
	FEQwW/d6AVNW8grNleWwG8MBDZWk9k7rrozJuZ6F0VCXk4p78w4ewZQrxTGPCCoEgffP6hZJNd7
	E4M1DTWBJ0aRTqhFN/Dl8d0Zc9KK8OeFugbTnp/US0Kpz4P4D
X-Google-Smtp-Source: AGHT+IEGB9smWzSs4kyVjf1ngJ0sHXwF85dqOAOilm7NUBGQFDjvo6qUc1UKfbV7DzP5s2uNDsumhOKr73aIWIBS4y8=
X-Received: by 2002:a5b:c08:0:b0:dcb:e82c:f7f with SMTP id f8-20020a5b0c08000000b00dcbe82c0f7fmr13872142ybq.12.1710881036276;
 Tue, 19 Mar 2024 13:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
 <20240314-dpu-perf-rework-v3-3-79fa4e065574@linaro.org> <ebf0ca9b-6e9d-4387-8628-a6ccaca11215@quicinc.com>
In-Reply-To: <ebf0ca9b-6e9d-4387-8628-a6ccaca11215@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 22:43:44 +0200
Message-ID: <CAA8EJprhgPheFq-xhAh54NkTTh5_BJk=bL1f94=hvsio6VUSQQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 22:34, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/13/2024 6:10 PM, Dmitry Baryshkov wrote:
> > Move perf mode handling for the bandwidth to
> > _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> > and then aggregating known values.
> >
> > Note, this changes the fix_core_ab_vote. Previously it would be
> > multiplied per the CRTC number, now it will be used directly for
> > interconnect voting.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 39 +++++++++++++--------------
> >   1 file changed, 19 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 87b892069526..ff2942a6a678 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -118,21 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> >               return;
> >       }
> >
> > -     memset(perf, 0, sizeof(struct dpu_core_perf_params));
> > -
> > -     if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > -             perf->bw_ctl = 0;
> > -             perf->max_per_pipe_ib = 0;
> > -             perf->core_clk_rate = 0;
> > -     } else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > -             perf->bw_ctl = core_perf->fix_core_ab_vote;
> > -             perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> > -             perf->core_clk_rate = core_perf->fix_core_clk_rate;
> > -     } else {
> > -             perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > -             perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > -             perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> > -     }
> > +     perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > +     perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > +     perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> >
> >       DRM_DEBUG_ATOMIC(
> >               "crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
> > @@ -233,18 +221,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> >   {
> >       struct dpu_core_perf_params perf = { 0 };
> >       int i, ret = 0;
> > -     u64 avg_bw;
> > +     u32 avg_bw;
> > +     u32 peak_bw;
> >
> >       if (!kms->num_paths)
> >               return 0;
> >
> > -     dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > +     if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > +             avg_bw = 0;
> > +             peak_bw = 0;
> > +     } else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > +             avg_bw = kms->perf.fix_core_ab_vote;
> > +             peak_bw = kms->perf.fix_core_ib_vote;
> > +     } else {
> > +             dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
>
> Where is this function dpu_core_perf_aggregate() defined? I dont see it
> in msm-next

In the previous patch.

>
> > +
> > +             avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > +             peak_bw = perf.max_per_pipe_ib;
> > +     }
> >
> > -     avg_bw = perf.bw_ctl;
> > -     do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> > +     avg_bw /= kms->num_paths;
> >
> >       for (i = 0; i < kms->num_paths; i++)
> > -             icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> > +             icc_set_bw(kms->path[i], avg_bw, peak_bw);
> >
> >       return ret;
> >   }
> >



-- 
With best wishes
Dmitry

