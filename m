Return-Path: <linux-arm-msm+bounces-33749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 778EA997843
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 00:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 169981F22F5B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 22:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496B71E285E;
	Wed,  9 Oct 2024 22:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QZnvb9Tk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085F6178CCA
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 22:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728511846; cv=none; b=N6QJIEaEKB3KMxiM1sNkbeCv9XvXr+7JPWcpWE6Ko8Zu3z+THbdESWrB4VA/bjzK9vz8lnKMpsAho++pRlzJ6IT6VTgDq4KlFyJ3/82tR+d46YdoGiLdV4a4ssEnX1k8x70j2dY0485xyciQovj1oeFxm5v58sO8QfLddibdMjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728511846; c=relaxed/simple;
	bh=wQi52X6WZagGJCx18yn+boHo0qE8h/XlSBqFngBmz0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NrPWqbrk5jRktsub7eFllIxTscH4bO+SJDVU92sa9xMTmDAvrA4HjGI/LzxoyWDRXYnPeE01LbWFwSRB4wl3zLl+pVhF+DbE2bPGv2xxKeLMIsGECoxyuPMxbQ+sHUtGoeSfR+/0duqLQ7hjlbGHx+Moq6y7iEkwTlvHfBRjzLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QZnvb9Tk; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e28fc40fdccso266830276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 15:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728511843; x=1729116643; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xtAgb4fDwR8y044wOUqsOfoIaUs5RpregpF0Vbg17ec=;
        b=QZnvb9TkdzTol79msgKx7KiXiPL5PATFDBwjbgyp0fQSp2X9RHKAql41KclCNIHe6H
         EcsurT9Pa9YbHNWlMAQG1kRsFqIG2CZKjmdj1c7/3PcYYSVp6Nh33OpOEN/5Ig5+aYxb
         79Z/isGSBWhl6YxiD6isZm+DIvlVZFo6F+z6UFyghoDplfXJTKRWZcngjAyqbJowEJgV
         qmFNNWJ1xfJSTJr8nMwgADgu+L6RuxjuA6TwwcKAoRqsbJ71fXpZ3zQ1uQBEDDbDOrPf
         qhGzTMtNSpe4+1SdzIiRJ0ATKgH7m1AIm+XYQe+aH5zrP/I2t2J7Ne/IV2SLdywEbLt6
         8ViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728511843; x=1729116643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtAgb4fDwR8y044wOUqsOfoIaUs5RpregpF0Vbg17ec=;
        b=r3ab93QjDn4cgeuIRWV0S6WIr9vovCSFiG1MZ78WubVihqxRCaO72Ptrt5Ri+SzT3B
         631BPcpsJADU8Zj7mzSavyezGPTFTgk3Vt0c1Opuiwe0TMv26LKdLd/RBXXcTUx4lo4T
         Fg+L4rFoanvRoMVc38c7ZOivCckoAANjycHO0lbl5FPC229lqtpu4ffuewVm0x6PPuPE
         OSYdLlyM24hYwfaLHgQQnR0K2KKgzKNTtw2rCsYU5BmUy5cCzLVIIbwZrrxPl6f9QWFi
         nBvug6p93Z7waMMAELTxZXqWO2DNBcuSki6lLqq1BjWJqPHsHn6HqHKb+oVBTM6SW2kg
         k62g==
X-Forwarded-Encrypted: i=1; AJvYcCXZizYshug1JjkT3Rk2YfcjaRk5+ZGVcssTyGEiTfhkmEo4HP7ferqwDD7eF69YmG4km56xu0otj9Pk+lfW@vger.kernel.org
X-Gm-Message-State: AOJu0YzuJuZkL1lsXLOfQS7lyJzv0EhxrS50ot4xJ93mzbLOuRAIoG86
	M6GLumUOmqyiGcpcjvLu/sUvDXog/CykyBkb5SRbfs6DyAqzx91iXcbTWGfuo6olq3yI5ZEjI12
	x2E53jIhR2U0xaSxhQrEVXouXc8QAPHF39si9sA==
X-Google-Smtp-Source: AGHT+IHACXmWe3jpzlY9m/ZYdvlB2E4eJi+KdXxEERqoyLJzG9ZNpE57951BZflPz6EbH6Z4ysSQYB+i+QLWebrYgNo=
X-Received: by 2002:a05:6902:18d3:b0:e1a:72e9:b243 with SMTP id
 3f1490d57ef6-e28fe33b965mr4050297276.9.1728511842970; Wed, 09 Oct 2024
 15:10:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-2-139511076a9f@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-2-139511076a9f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 01:10:31 +0300
Message-ID: <CAA8EJpr-B2OZbn5_6dUnojf9ZTXkVcE2nUL1QHohTmk0Qa+bPg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: configure DSC per number in use
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Oct 2024 at 09:39, Jun Nie <jun.nie@linaro.org> wrote:
>
> Only 2 DSC engines are allowed, or no DSC is involved currently.

Can't parse this phrase.

> We need 4 DSC in quad-pipe topology in future. So let's only configure
> DSC engines in use, instread of maximum number of DSC engines.

Nit: instead

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 39700b13e92f3..e8400b494687c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1871,10 +1871,13 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
>                 ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
>  }
>
> -static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> -                                struct drm_dsc_config *dsc)
> +static void dpu_encoder_prep_dsc(struct drm_encoder *drm_enc)
>  {
>         /* coding only for 2LM, 2enc, 1 dsc config */
> +       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +       struct dpu_crtc_state *cstate = to_dpu_crtc_state(drm_enc->crtc->state);
> +       struct drm_dsc_config *dsc = dpu_enc->dsc;

Why? This doesn't seem to be related to num_dscs introduction.

> +       int num_dsc = cstate->num_dscs;
>         struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>         struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>         struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];

[...]

> @@ -1953,7 +1956,7 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
>         }
>
>         if (dpu_enc->dsc)
> -               dpu_encoder_prep_dsc(dpu_enc, dpu_enc->dsc);
> +               dpu_encoder_prep_dsc(drm_enc);
>  }
>
>  bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

