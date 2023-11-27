Return-Path: <linux-arm-msm+bounces-2167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 414017FAE39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 00:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF384281C1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 23:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F90B46441;
	Mon, 27 Nov 2023 23:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kanUhuTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54DB9BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 15:17:47 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5cce5075bd6so37738427b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 15:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701127066; x=1701731866; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8iD+osMJH4miMmYt9ABPXwXzud5eZygTeF+Khzq6tJ8=;
        b=kanUhuTpH8VeAdgf/BC8NvBDs3axw1G5OcI3Bf/l7GEqaqrrNzgvf962dcCf7RR66J
         W/PZofinG7i8MwLXmDPEzR/EF8tSHceoCT1T+tZYgOW+0eXtWvZ+/97Uvm3WyMDtpLTa
         t+07M/sGpsw4trULjvfEFtGvMh523os3jjOPzrxRpMnkyTz4zZUoQnb6T6klJZkbLQHG
         MpiotGXyyskAKZcZ+n8uPeSQuni+JciB5vCFDZhF6J5ag5AfMUV96LIa+lz0wtS94dFp
         tmmJutnexOoOfc8tKBUU/mQRX+xk51E7gMQaNACRiltCToVXPd/Kld0VKcsNkpW3rtA8
         CgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701127066; x=1701731866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8iD+osMJH4miMmYt9ABPXwXzud5eZygTeF+Khzq6tJ8=;
        b=cq8i1xZT5HiPBkP74M/F6uli37sAnzQwrbSiqA74tlM6TzplNNz9BjlC/FI3xh1xsp
         H+YGLTR4vNHEY6gnOKy4SeR+sXnWaiDvmBIwmaKgQBX6sla19VIu4w0qltpe/Sk9Knji
         Wz1udGvmEjGHu4rr9ZTkqn9AO40/tqwqmZjiAMXxZHawfA9DtHBzdGQyEpjuayt/uEng
         oTVpSqbqivpVqwAp5cNKCQj7Rib4OXlyoc0Ma8PKm+d/3psudmT8TpxaHkM+TvpR3BUr
         9h8lsIR/SdUWOW/y4orfrBvHU2ykmuCa5OwwqVGfrhq3n4/XkNXZ0jLCOKtt4cp9XDFM
         LewQ==
X-Gm-Message-State: AOJu0Yx+cdDmF7D604JwafEEIZ0bw1qKG7AwiHNhMAexTZktodG/0fLG
	hKSWAi+BPhgBpZ52kWCQgs74vM9Tc8hkQFDVGNZaUQ==
X-Google-Smtp-Source: AGHT+IGt0klIWrzaFcrbKa/sHaNCkRqwr4aenl7fiamwe5np9aLxr58NKslxaAawBwEHn9aDhfp9afP2HS3lr6Ny8yM=
X-Received: by 2002:a05:690c:2886:b0:5d0:11b:e9c3 with SMTP id
 ee6-20020a05690c288600b005d0011be9c3mr4765613ywb.7.1701127066496; Mon, 27 Nov
 2023 15:17:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127215401.4064128-1-dmitry.baryshkov@linaro.org> <60dc2b72-188f-7b6e-4e14-b90f10997a44@quicinc.com>
In-Reply-To: <60dc2b72-188f-7b6e-4e14-b90f10997a44@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Nov 2023 01:17:35 +0200
Message-ID: <CAA8EJpoKOPVLC9n_2MC2Es7XssEs5G5O4ESJ_-krA8aGG_fb0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp4: flush vblank event on disable
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Nov 2023 at 00:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/27/2023 1:54 PM, Dmitry Baryshkov wrote:
> > Flush queued events when disabling the crtc. This avoids timeouts when
> > we come back and wait for dependencies (like the previous frame's
> > flip_done).
> >
> > Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> > index 169f9de4a12a..3100957225a7 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> > @@ -269,6 +269,7 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
> >   {
> >       struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
> >       struct mdp4_kms *mdp4_kms = get_kms(crtc);
> > +     unsigned long flags;
> >
> >       DBG("%s", mdp4_crtc->name);
> >
> > @@ -281,6 +282,14 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
> >       mdp_irq_unregister(&mdp4_kms->base, &mdp4_crtc->err);
> >       mdp4_disable(mdp4_kms);
> >
> > +     if (crtc->state->event && !crtc->state->active) {
> > +             WARN_ON(mdp4_crtc->event);
>
> Do you need a WARN_ON() here? Just wondering how often this might happen
> and spam.

Well, it is atomic_disable(), so it happens only on modesets or output
disable. Also, this is a port of mdp5 code, see commit e765ea77b0fd
("drm/msm: Issue queued events when disabling crtc"). We don't have
reports from MDP5 code, so there should be no comparable reports for
MDP4.

> otherwise LGTM.
>
> > +             spin_lock_irqsave(&mdp4_kms->dev->event_lock, flags);
> > +             drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +             crtc->state->event = NULL;
> > +             spin_unlock_irqrestore(&mdp4_kms->dev->event_lock, flags);
> > +     }
> > +
> >       mdp4_crtc->enabled = false;
> >   }
> >



-- 
With best wishes
Dmitry

