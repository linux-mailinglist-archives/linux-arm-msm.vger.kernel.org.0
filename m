Return-Path: <linux-arm-msm+bounces-10117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E345F84D24E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 20:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB12B1C21D6B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 19:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BA586158;
	Wed,  7 Feb 2024 19:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dc8fJZdo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37F684FBD
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Feb 2024 19:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707334817; cv=none; b=uZAEm4yJuac2IZPi8RsX2iPzjmDOvmNx0+4CjsaEWTcdhiehVZZx3Du4N63fRzTnwdz26E8Frgbtg2AHOuHWg9IN9bHZskjVAZRUixeslVmgZD8BIjJBkTCEUesCtGgfTpSOlkk7Bf411/ONwsgZfdM6KvjRcNZ2st+E8AeG42E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707334817; c=relaxed/simple;
	bh=9tXbofwBqW80u5WmZLT5URlqRhTGXA+/m4ZLfh56TD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoaNzGqMG3ly41OGVvPXzv+BLKEqVQt5oifL1eSXwzdnXMz8WicZ31spTb0DjJVIoqdEfOowo+G1F5PLjojST5dhZVesNbr2y5ftszeWflWs4sqoS0H1eTCUfHhneaS0Fmoisk4e+milNJ9HJwxFhRNWDlk6f1cwGDI4m+itRAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dc8fJZdo; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60485382886so12086967b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Feb 2024 11:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707334814; x=1707939614; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v+xXbucLH0Z71gEzcP04jhL2BdIsPsj4klmuhvkUi5Q=;
        b=Dc8fJZdoIPQZdf+crUWqs8z9dhLLz/62ZKL7FNwLmxXm6rErFNzQgQQPBPTuO59FM/
         QrgA3U2Md2gwExwa3D6vgUfw6A0ZBDaIKqQOenEvvJoY71vo72DiHwxbz56KEJqnOddV
         A8SHpPj2KheCRPGcXP7uQsdjT/wTwsixUJMFttet8wWmwGzlo3RucddsRNJbE3F+F1mh
         OJ671MEE/OUgmUh2vITyMmVicxQe/n2cgzJMUi5Ae77Kg0QYIaGWodb6MKkrCDVHcMjt
         invPuIdM81eh89h96Pbi5mWKeTIPgZLdXPdNOnACcPZ/i2r9KyoAnJBuHtLlz/oKw+/r
         fRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707334814; x=1707939614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+xXbucLH0Z71gEzcP04jhL2BdIsPsj4klmuhvkUi5Q=;
        b=KWfzLBXvbH4us9t/6ZzXG2iwiTUFJT08TiPDESwhap7l5Kd+q8B/4U2VwQpdtbNNDp
         WvN9V6aVs/OW3BPtyIR1YK+5zEjIUCL1oHUn8p/S4NVoA1sHatMMgh34CZ+98EvC9QRc
         jUigNkzPJioUojC3U35mVtSeZlKKwsoPzKXRZjn+xoOJOYhrBFHvSsHsEkFud4tb6qcx
         6RRhj1Uu6oAc9dzZ/FarL6/mHJtGLBqAU5FPpMhBvqroH2XFv5RHQPnu+7Sz2ENijyVU
         GcEbGvz8747GkT4a9QV+qW+WsZ5yfyzneH1StMswpuQd+oyAGcippu5ALIyjJm2xtYgd
         z4zA==
X-Forwarded-Encrypted: i=1; AJvYcCVC++8QWTldU4yg1nAFeFhDcvDoEYR8lXAijZxfvJhbPaSZ5qzJ9Tvo+v1BJZfvnnXo8qU6JKpqodtbukdCgX+eCw4xoSG+glUVSpmgWA==
X-Gm-Message-State: AOJu0YzU7j0/C9VXzBcUeGMHBLmL3/RDH0W1Bp3GAD3E9dKjRXsKEs3N
	Lwr/wQIN02DMETS1pUzPiUzVPSZ5DfxDLO7u/NcurQiYAhgzmBuhYpVCPbknK888p6j9sUqHUqV
	gYwdgCgynEPKoM47vjCp4njnq0rQOyqBE8r7ibA==
X-Google-Smtp-Source: AGHT+IGTjDmYUCOs2coNnv2X5cc5vHEE21Ju1bQ8ebfh38NDN39/GMQRSQ0FSwxV/+izQWFIDpklv+ogC5CLyT4+AOM=
X-Received: by 2002:a0d:d411:0:b0:604:85cc:ecc9 with SMTP id
 w17-20020a0dd411000000b0060485ccecc9mr4770709ywd.49.1707334813985; Wed, 07
 Feb 2024 11:40:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231005220659.2404199-1-dmitry.baryshkov@linaro.org> <f2e146a3-0825-3e92-a694-b2b947b92b66@quicinc.com>
In-Reply-To: <f2e146a3-0825-3e92-a694-b2b947b92b66@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 21:40:01 +0200
Message-ID: <CAA8EJpoihsOeA8BPn0oq9oGxARZawAGszYp3XW38WJodXPYBMg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: remove CRTC frame event callback registration
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Feb 2024 at 19:52, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/5/2023 3:06 PM, Dmitry Baryshkov wrote:
> > The frame event callback is always set to dpu_crtc_frame_event_cb() (or
> > to NULL) and the data is always either the CRTC itself or NULL
> > (correpondingly). Thus drop the event callback registration, call the
> > dpu_crtc_frame_event_cb() directly and gate on the dpu_enc->crtc
> > assigned using dpu_encoder_assign_crtc().
> >
>
> The idea behind the registration was for CRTC to register for events if
> it wants to and perhaps have different callbacks for different events
> through a common registration mechanism and encoder need not know each
> dpu_crtc calls as most of the time we dont want encoder to go back to
> crtc to look up what its APIs are.
>
> But, we are always registering today and have only one callback, so it
> kind of makes it an additional redundant wrapper. So I guess, once again
> one of those things which , seems not necessary with the current code
> but nothing really wrong with it.
>
> Anyway, couple of comments below.
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > This patch was previously posted as a part of the [1]
> >
> > Changes since v1:
> > - Rebased on top of linux-next
> >
> > [1] https://patchwork.freedesktop.org/series/112353/
> >
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 17 +--------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    | 14 +++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 +++------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 10 -----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 --
> >   5 files changed, 21 insertions(+), 65 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 8ce7586e2ddf..dec5417b69d8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -669,18 +669,8 @@ static void dpu_crtc_frame_event_work(struct kthread_work *work)
> >       DPU_ATRACE_END("crtc_frame_event");
> >   }
> >
> > -/*
> > - * dpu_crtc_frame_event_cb - crtc frame event callback API. CRTC module
> > - * registers this API to encoder for all frame event callbacks like
> > - * frame_error, frame_done, idle_timeout, etc. Encoder may call different events
> > - * from different context - IRQ, user thread, commit_thread, etc. Each event
> > - * should be carefully reviewed and should be processed in proper task context
> > - * to avoid schedulin delay or properly manage the irq context's bottom half
> > - * processing.
> > - */
> > -static void dpu_crtc_frame_event_cb(void *data, u32 event)
> > +void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event)
> >   {
> > -     struct drm_crtc *crtc = (struct drm_crtc *)data;
> >       struct dpu_crtc *dpu_crtc;
> >       struct msm_drm_private *priv;
> >       struct dpu_crtc_frame_event *fevent;
> > @@ -1102,9 +1092,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
> >
> >       dpu_core_perf_crtc_update(crtc, 0);
> >
> > -     drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> > -             dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
> > -
> >       memset(cstate->mixers, 0, sizeof(cstate->mixers));
> >       cstate->num_mixers = 0;
> >
> > @@ -1143,8 +1130,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
> >                */
> >               if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
> >                       request_bandwidth = true;
> > -             dpu_encoder_register_frame_event_callback(encoder,
> > -                             dpu_crtc_frame_event_cb, (void *)crtc);
> >       }
> >
> >       if (request_bandwidth)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > index 539b68b1626a..3aa536d95721 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -300,4 +300,18 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
> >       return crtc && crtc->state ? RT_CLIENT : NRT_CLIENT;
> >   }
> >
> > +/**
> > + * dpu_crtc_frame_event_cb - crtc frame event callback API
> > + * @crtc: Pointer to crtc
> > + * @event: Event to process
> > + *
> > + * CRTC module registers this API to encoder for all frame event callbacks like
> > + * frame_error, frame_done, idle_timeout, etc. Encoder may call different events
> > + * from different context - IRQ, user thread, commit_thread, etc. Each event
> > + * should be carefully reviewed and should be processed in proper task context
> > + * to avoid schedulin delay or properly manage the irq context's bottom half
> > + * processing.
> > + */
>
> This doc is no longer correct.
>
> CRTC module no longer registers anything.

Ack. I should have fixed this c&p.

>
> > +void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> > +
> >   #endif /* _DPU_CRTC_H_ */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index d34e684a4178..709fffa4dfa7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -148,8 +148,6 @@ enum dpu_enc_rc_states {
> >    * @frame_busy_mask:                Bitmask tracking which phys_enc we are still
> >    *                          busy processing current command.
> >    *                          Bit0 = phys_encs[0] etc.
> > - * @crtc_frame_event_cb:     callback handler for frame event
> > - * @crtc_frame_event_cb_data:        callback handler private data
> >    * @frame_done_timeout_ms:  frame done timeout in ms
> >    * @frame_done_timer:               watchdog timer for frame done event
> >    * @disp_info:                      local copy of msm_display_info struct
> > @@ -187,8 +185,6 @@ struct dpu_encoder_virt {
> >       struct dentry *debugfs_root;
> >       struct mutex enc_lock;
> >       DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
> > -     void (*crtc_frame_event_cb)(void *, u32 event);
> > -     void *crtc_frame_event_cb_data;
> >
> >       atomic_t frame_done_timeout_ms;
> >       struct timer_list frame_done_timer;
> > @@ -1377,28 +1373,6 @@ void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
> >       }
> >   }
> >
> > -void dpu_encoder_register_frame_event_callback(struct drm_encoder *drm_enc,
> > -             void (*frame_event_cb)(void *, u32 event),
> > -             void *frame_event_cb_data)
> > -{
> > -     struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > -     unsigned long lock_flags;
> > -     bool enable;
> > -
> > -     enable = frame_event_cb ? true : false;
> > -
> > -     if (!drm_enc) {
> > -             DPU_ERROR("invalid encoder\n");
> > -             return;
> > -     }
> > -     trace_dpu_enc_frame_event_cb(DRMID(drm_enc), enable);
> > -
> > -     spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> > -     dpu_enc->crtc_frame_event_cb = frame_event_cb;
> > -     dpu_enc->crtc_frame_event_cb_data = frame_event_cb_data;
> > -     spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
> > -}
> > -
> >   void dpu_encoder_frame_done_callback(
> >               struct drm_encoder *drm_enc,
> >               struct dpu_encoder_phys *ready_phys, u32 event)
> > @@ -1438,15 +1412,12 @@ void dpu_encoder_frame_done_callback(
> >                       dpu_encoder_resource_control(drm_enc,
> >                                       DPU_ENC_RC_EVENT_FRAME_DONE);
> >
> > -                     if (dpu_enc->crtc_frame_event_cb)
> > -                             dpu_enc->crtc_frame_event_cb(
> > -                                     dpu_enc->crtc_frame_event_cb_data,
> > -                                     event);
> > +                     if (dpu_enc->crtc)
> > +                             dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
> >               }
> >       } else {
> > -             if (dpu_enc->crtc_frame_event_cb)
> > -                     dpu_enc->crtc_frame_event_cb(
> > -                             dpu_enc->crtc_frame_event_cb_data, event);
> > +             if (dpu_enc->crtc)
> > +                     dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
> >       }
> >   }
> >
> > @@ -2318,7 +2289,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
> >               return;
> >       }
> >
> > -     if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc_frame_event_cb) {
> > +     if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc) {
>
> Why do we need !dpu_enc->crtc check for just printing this error log and
> returning?

This was to keep function semantics: bail out either if there is no
frame_busy_mask or if there is no CRTC for this encoder.

>
> >               DRM_DEBUG_KMS("id:%u invalid timeout frame_busy_mask=%lu\n",
> >                             DRMID(drm_enc), dpu_enc->frame_busy_mask[0]);
> >               return;
> > @@ -2331,7 +2302,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
> >
> >       event = DPU_ENCODER_FRAME_EVENT_ERROR;
> >       trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
> > -     dpu_enc->crtc_frame_event_cb(dpu_enc->crtc_frame_event_cb_data, event);
> > +     dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
> >   }
> >
> >   static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > index 4c05fd5e9ed1..dfa8edeca925 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > @@ -55,16 +55,6 @@ void dpu_encoder_assign_crtc(struct drm_encoder *encoder,
> >   void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *encoder,
> >                                       struct drm_crtc *crtc, bool enable);
> >
> > -/**
> > - * dpu_encoder_register_frame_event_callback - provide callback to encoder that
> > - *   will be called after the request is complete, or other events.
> > - * @encoder: encoder pointer
> > - * @cb:              callback pointer, provide NULL to deregister
> > - * @data:    user data provided to callback
> > - */
> > -void dpu_encoder_register_frame_event_callback(struct drm_encoder *encoder,
> > -             void (*cb)(void *, u32), void *data);
> > -
> >   /**
> >    * dpu_encoder_prepare_for_kickoff - schedule double buffer flip of the ctl
> >    *  path (i.e. ctl flush and start) at next appropriate time.
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > index c74b9be25e68..dc097e109fd2 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > @@ -346,10 +346,6 @@ DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_vblank_cb,
> >       TP_PROTO(uint32_t drm_id, bool enable),
> >       TP_ARGS(drm_id, enable)
> >   );
> > -DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_frame_event_cb,
> > -     TP_PROTO(uint32_t drm_id, bool enable),
> > -     TP_ARGS(drm_id, enable)
> > -);
> >   DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_phys_cmd_connect_te,
> >       TP_PROTO(uint32_t drm_id, bool enable),
> >       TP_ARGS(drm_id, enable)



-- 
With best wishes
Dmitry

