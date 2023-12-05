Return-Path: <linux-arm-msm+bounces-3450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C806B80538F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 12:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 837F9281256
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 11:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF7356B66;
	Tue,  5 Dec 2023 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zG0q5EIQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44217A8
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 03:54:49 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-db8892a5f96so2613168276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Dec 2023 03:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701777288; x=1702382088; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vsA5gKrCxzLqx2Z8rQ+ATME7jYK1uxeVjWJRCZRRKX0=;
        b=zG0q5EIQKONVodJvVWeYekabqCLGersO6yg9hbUOgUEIkgbVJMPkthczj9nAv8rTBu
         05/6/hMr+mvZcyMiIAE8DVYnHUf7ljxbxf8LxFfRfrNIfSL3WDyf+XMSx4QWZoXcqjMw
         UNK1/J1OOC6zAFe/IsW0ZGfmqD9HiJpFYgorwUUUSg+Qp6v1zXFVBofFy+ad7oJqn14n
         ijPwuji5yQZUs9LL4V3q5xSJQVrCSrhTNdaEKG+VcOn+E3s5SApNgDUWHvZKTgGTRmeq
         kq5i0xEGGJ5/j1beWZAF3xjom+qHOnJ9YbPFV/VuGZHQ86ev0AIgxKCaYKtkzplQxKcq
         vw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701777288; x=1702382088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsA5gKrCxzLqx2Z8rQ+ATME7jYK1uxeVjWJRCZRRKX0=;
        b=mV7fZOEOG57hy7AjxbNe5Ptzy6HeEKm9eAngKisJ9ItWQanWAx+LEn/KUQfIrJEKqV
         VNOKuD58UAFkgisLTighzLlgTKGzIK8up9DVCX2mkUPiGafuQp15PJm+1zeyM0Kj92Tu
         z+QxuU4t9ldROYqs6+e4sOiNIfzrvu+bZGkpiieJNLo2cvNprlgYXJk+PLNxdRXd0Q/1
         gMUjt45/IJPkxcrWxSA0KYmWYbN4r5fJLSXkeYSoT/GitClPNIsflbCkZWjxuivhGtms
         O7AUHqbSZw1q58p6JGVsPvIql+IPWslhjrBQNPvDaegWXlqL6cSL4EQmzmpeyoPzrYty
         xLJA==
X-Gm-Message-State: AOJu0YykCYwFaWw/YVrFEcDRBgyf1iPjDclwZDS1vW69tzbxbPB0eXHo
	+qHtEtunmHRNNncEaT1eW07Bf76AAPz2WuDvESzIrdqQYpxr80kR
X-Google-Smtp-Source: AGHT+IFMwAe9miKrOxVD6uAUhCfufm0lCJxdcuUgHbE3FCiC5QxQrneRoqm3VDEwKO56zsgD+hw9MVkSQgry6YlCdjU=
X-Received: by 2002:a5b:a52:0:b0:db5:d88:d463 with SMTP id z18-20020a5b0a52000000b00db50d88d463mr3881570ybq.51.1701777288460;
 Tue, 05 Dec 2023 03:54:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201220843.2023117-1-dmitry.baryshkov@linaro.org>
 <uqrsl3gehpjybzb6cish7vpub3xznouomn4246b7j4i3qiiumv@enskrm5kpwa5>
 <ff89354d-c9d1-486a-982b-0bb976f6b699@linaro.org> <hfvttbhsztcbagsimvhoeqadwtcrxhcs5gt7ssjipszndqzxeg@co2jxo3smli6>
In-Reply-To: <hfvttbhsztcbagsimvhoeqadwtcrxhcs5gt7ssjipszndqzxeg@co2jxo3smli6>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Dec 2023 13:54:37 +0200
Message-ID: <CAA8EJpoAGN+8smPEWAAGaD80JoCC5RwPEqQYvNa9aSQ355KCwA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
To: Maxime Ripard <mripard@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Dec 2023 at 13:48, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Dec 05, 2023 at 03:37:15AM +0200, Dmitry Baryshkov wrote:
> > On 04/12/2023 10:38, Maxime Ripard wrote:
> > > On Sat, Dec 02, 2023 at 12:07:49AM +0200, Dmitry Baryshkov wrote:
> > > > The drm_atomic_helper_check_wb_encoder_state() function doesn't use
> > > > encoder for anything other than getting the drm_device instance. The
> > > > function's description talks about checking the writeback connector
> > > > state, not the encoder state. Moreover, there is no such thing as an
> > > > encoder state, encoders generally do not have a state on their own.
> > > >
> > > > Drop the first argument and rename the function to
> > > > drm_atomic_helper_check_wb_connector_state().
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >
> > > > Resending, no reaction for two months
> > > >
> > > > ---
> > > >   drivers/gpu/drm/drm_atomic_helper.c   | 10 ++++------
> > > >   drivers/gpu/drm/vkms/vkms_writeback.c |  2 +-
> > > >   include/drm/drm_atomic_helper.h       |  3 +--
> > > >   3 files changed, 6 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > > index 2444fc33dd7c..d69591381f00 100644
> > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > @@ -795,8 +795,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> > > >   EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
> > > >   /**
> > > > - * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder state
> > > > - * @encoder: encoder state to check
> > > > + * drm_atomic_helper_check_wb_connector_state() - Check writeback connector state
> > > >    * @conn_state: connector state to check
> > > >    *
> > > >    * Checks if the writeback connector state is valid, and returns an error if it
> > > > @@ -806,8 +805,7 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
> > > >    * Zero for success or -errno
> > > >    */
> > > >   int
> > > > -drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
> > > > -                                  struct drm_connector_state *conn_state)
> > > > +drm_atomic_helper_check_wb_connector_state(struct drm_connector_state *conn_state)
> > >
> > > AFAIK, all the helpers take the object as first argument, so I'm fine
> > > with the name change but it should take a drm_connector too. And ideally
> > > a drm_atomic_state pointer instead of drm_connector_state too.
> >
> > I think we then might take even further step and pass
> > drm_writeback_connector to this function. I'll send this as a part of v2.
>
> ... Which is still not the usual function prototype for atomic_check
> helpers.

On one hand, you are correct. On the other hand, don't we want to
emphasise that this function is to be called only for
drm_writeback_connector objects?




-- 
With best wishes
Dmitry

