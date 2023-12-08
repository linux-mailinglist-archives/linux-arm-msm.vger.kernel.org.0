Return-Path: <linux-arm-msm+bounces-3797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F319E809844
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E90EAB203E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 01:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CEC653;
	Fri,  8 Dec 2023 01:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OsTvjoOF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 612B7D59
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 16:59:59 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5d852ac9bb2so14621847b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 16:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701997198; x=1702601998; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GY6ah2v1DJ22OZgJksNyLoYl664i2yPmbTCon8lG/jA=;
        b=OsTvjoOFnXZ/umw/N9w1L3oHO00uDLv0WfTuRKPRVuH1g0KAR14TdAFEtjoRe/wwBF
         rF+CNk/8L/2DY2cAJvVepX7tVwsev3F0eiLob2z9hJY2ds5p//FciIL4dRLv2JBSmhpk
         dWhu7lSd1kPZp0uiM6eBhoJcUng14jUYMMcz2EBlm3uGPSeE3f4SHJ36+hALf9ZKu4vC
         RZsGEeiMgQjimYToTtkyVm457RoPoMwVv+3kFTmR/v8VuvV/cJp0qFcQl4yhfrB+VW1P
         sYXQy40ybMf4ZTTjdZ5vmOdAg6AT4mi1Z8QSBzDKoqnI598D7j0jbFNaPhLaswGrnWbX
         cLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701997198; x=1702601998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GY6ah2v1DJ22OZgJksNyLoYl664i2yPmbTCon8lG/jA=;
        b=SbQ1KbnbVkPJFqVyZ72/kGBHKpBJ7LKCMq2cz/5egcI0x3giGiyRR1OqxyGIvUumje
         DI8RW6w9nFqMNb1ZNzBMt28E8+pSGOpME9NSMGcEwewd5TKLWtI8bAGZpLtyeVGyeaJC
         Oe7vSY/LmVoHMUpTAG78rLMqZN2h0Y/CjW1MgAt12vO8KpvKE4mm+2WM0Eo93lOJJwan
         FKoARmf0deRdRJQxeXU3Tup8e3LmytM3jSo4oM3UXkO37uCtNZs6MRvtXVGb+RDIUsZb
         Celsd3VY8eodjuTcn9kdxRrWCAEjTLHH2NO5CRyRfbv0IlzpdM67tiqqzoiojKXn6g7U
         ulPA==
X-Gm-Message-State: AOJu0Yx58FVpcqXeDxrLViyByLVFqDkxFSrTcx4t9gYAe/QzyC6wWUH9
	IgqEBh+b4dabTbb+8boyGYV/GbOP4pu3f0R0AZRhNg==
X-Google-Smtp-Source: AGHT+IESqChu1z5Tm6wG16ng1t0Z+gfrx2xuUkUNXdPgQVHwtv0dc2fNKBnWNl4kuzrJVphB3WSStInSVE3A+GRSdI4=
X-Received: by 2002:a81:ae12:0:b0:5d7:2185:b310 with SMTP id
 m18-20020a81ae12000000b005d72185b310mr3040747ywh.10.1701997198559; Thu, 07
 Dec 2023 16:59:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206101455.1664463-1-dmitry.baryshkov@linaro.org>
 <20231206101455.1664463-2-dmitry.baryshkov@linaro.org> <ohka6xa4xf5zo2txpqlyipsjuafcmmvnvnlfci2hvuhvwagr4k@jqx3do2q3ug3>
In-Reply-To: <ohka6xa4xf5zo2txpqlyipsjuafcmmvnvnlfci2hvuhvwagr4k@jqx3do2q3ug3>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 02:59:47 +0200
Message-ID: <CAA8EJpoCdFOK0xF=xFaTWKQWgBQWTW6v3-CdiW2Ovdd-5HbVpw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	Haneen Mohammed <hamohammed.sa@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 12:10, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Wed, Dec 06, 2023 at 01:14:54PM +0300, Dmitry Baryshkov wrote:
> > The drm_atomic_helper_check_wb_encoder_state() function doesn't use
> > encoder for anything other than getting the drm_device instance. The
> > function's description talks about checking the writeback connector
> > state, not the encoder state. Moreover, there is no such thing as an
> > encoder state, encoders generally do not have a state on their own.
> >
> > Rename the function to drm_atomic_helper_check_wb_connector_state()
> > and change arguments to drm_writeback_connector and drm_atomic_state.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c   | 16 +++++++++-------
> >  drivers/gpu/drm/vkms/vkms_writeback.c |  5 ++++-
> >  include/drm/drm_atomic_helper.h       |  5 ++---
> >  3 files changed, 15 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index c3f677130def..c98a766ca3bd 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -795,9 +795,9 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> >  EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
> >
> >  /**
> > - * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder state
> > - * @encoder: encoder state to check
> > - * @conn_state: connector state to check
> > + * drm_atomic_helper_check_wb_connector_state() - Check writeback connector state
> > + * @connector: corresponding connector
> > + * @state: the driver state object
> >   *
> >   * Checks if the writeback connector state is valid, and returns an error if it
> >   * isn't.
> > @@ -806,9 +806,11 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
> >   * Zero for success or -errno
> >   */
> >  int
> > -drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
> > -                                      struct drm_connector_state *conn_state)
> > +drm_atomic_helper_check_wb_connector_state(struct drm_connector *connector,
> > +                                        struct drm_atomic_state *state)
> >  {
> > +     struct drm_connector_state *conn_state =
> > +             drm_atomic_get_new_connector_state(state, connector);
> >       struct drm_writeback_job *wb_job = conn_state->writeback_job;
> >       struct drm_property_blob *pixel_format_blob;
> >       struct drm_framebuffer *fb;
> > @@ -827,11 +829,11 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
> >               if (fb->format->format == formats[i])
> >                       return 0;
> >
> > -     drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
> > +     drm_dbg_kms(connector->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
> >
> >       return -EINVAL;
> >  }
> > -EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
> > +EXPORT_SYMBOL(drm_atomic_helper_check_wb_connector_state);
>
> Thanks for updating the prototype ...
>
> >  /**
> >   * drm_atomic_helper_check_plane_state() - Check plane state for validity
> > diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> > index d7e63aa14663..23c4f7b61cb6 100644
> > --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> > +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> > @@ -34,6 +34,9 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
> >                                       struct drm_crtc_state *crtc_state,
> >                                       struct drm_connector_state *conn_state)
> >  {
> > +     struct drm_connector *connector = conn_state->connector;
> > +     struct drm_writeback_connector *wb_conn =
> > +             drm_connector_to_writeback(connector);
> >       struct drm_framebuffer *fb;
> >       const struct drm_display_mode *mode = &crtc_state->mode;
> >       int ret;
> > @@ -48,7 +51,7 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
> >               return -EINVAL;
> >       }
> >
> > -     ret = drm_atomic_helper_check_wb_encoder_state(encoder, conn_state);
> > +     ret = drm_atomic_helper_check_wb_connector_state(wb_conn, conn_state->state);
>
> ... but it looks like you forgot to update it here

Indeed, I fixed it in the second patch, but forgot to update the first one.

>
> Maxime



-- 
With best wishes
Dmitry

