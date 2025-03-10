Return-Path: <linux-arm-msm+bounces-50869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FDBA5A358
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 19:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 777C83A88A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 18:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF50235BE1;
	Mon, 10 Mar 2025 18:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KadxguxH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360B3235354;
	Mon, 10 Mar 2025 18:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741632166; cv=none; b=dNMGqhoPk4puCiUnrRaYTE4Z8gIMEOxJWEn0oPpmi5arIjtX5xGbdW5LenUgmvyx6G/zHCOuAmhBhohil54kypYV/9F5DDIUhmKhrmBDDHdB3c922fe4BPysFTqwbLVqICUa4kELpFs6GdfSVuSUb3rLvLzMEMG0JOBHSqp6hh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741632166; c=relaxed/simple;
	bh=jFXAO371GmdXTIbUAI5Lw+bN7hY1Tsip5KDQwkkA4s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7ZuvdiJTFsad7boxSqBMiu1857aMHIFIwllw9aazgaxKhUluw1ZHXndm+txHoSU13lVi9J4TbfbdIye5zXRfYPSDgJ432fJTSYug719uwY6X7j0J4ECm+IRQ0zqhrQpW7GNOAvMGcyIj6ZfsIrqlAGi77aMnDrQjc84aH19P+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KadxguxH; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab771575040so1034409866b.1;
        Mon, 10 Mar 2025 11:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741632162; x=1742236962; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XgJCvzIPEwf8mUYv4Q3MVNUs9y7jwf3bddf8AuCY4hU=;
        b=KadxguxHgmhbYPFmZUJDHdt4YAy/7uR3O4LF8n8/CFvxgWjeV+p9jjIPuvqXROuawW
         nxWVzSlXBwAFQs8X0/EdX2Z5bqyfX2E1RSXs7mHWacvhkX/GIW7T58/RFtIPcG/NS8Lr
         q6CjfjKRdPAkCOooiUtaQNbwbezsm1A0Nnb1LeZvNEp+HDjVjB8efF1rcMxtSj24hK1n
         EGn9glSbJ11CbVATE/qQpvGbF2GpJzPw9YDvpLhYHosq17n4tlDRLWjHAPI1F4wZFPNq
         V4ljmPvSOjDHNiJ+TA0AyYNICxqRemooPfiXL2pDhvwSUYkspDS0wbszDpO5mZ0XfAAq
         Wj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741632162; x=1742236962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgJCvzIPEwf8mUYv4Q3MVNUs9y7jwf3bddf8AuCY4hU=;
        b=dhm99PZ5M8UDQbEUo7PPu2++l4gRHr0wUCXHWNhqPyOl74bA744vV00otLwbVx5K/E
         C6gxWW+t2Nd1LPY9QbVdLDtoFBBvz9Nxc+fY4rDwuTAxDMcwUyiSUSJw/4J+cEVgVzmI
         ta91jnFv2TePv5apbXbjdwJE2sM8ZoNQ+9DXdJIWCTdhas0/a8lG4iLIEia6J6Q1cgFt
         Tbkf/HJo3p9d2sdEdT+ZgWZntUyW2jOm9iJIi4h7TpeqChScDYZ5rY/PB9ZLXEdoc7WV
         gHMwYDTh1hOGib6vhLS2KbRH9YIm+RM9+FltU5HDD/qZafuDrH6+Urtrkc1INpoy1sm1
         HnLg==
X-Forwarded-Encrypted: i=1; AJvYcCV5GfhBbDkxWceRXpLkK+xZPvC+Ut6hLqgH+saGvkw8fQl83oUEj0WqWHFCj+U5SSUqy5c2FIA6XleKxZIX@vger.kernel.org, AJvYcCV6zGhK7f7+6VSTgeDrR3dySQ2UfxydHW2dvg9czHLgOQuv8Gi8bFhFgCridIGUMHt6gPC+Sz6dKqdp9wwo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9fkWbzI6JcxMSrUhKYQaABWZ7+RYss3qZLITsKBcHNfpCdi1R
	APCuaC3ACXXM2dXUrCel9BMvktGQ1ngOTFmvAloTIagPfGft4kAiVi63cw3e1qYuKGcRwvPWtml
	a4JMf2RjWdlNYtpOlffGfAqvQInM=
X-Gm-Gg: ASbGnctH4AkHQHTdkzqGZwBuS+C8CO6sFWmVc1boWnn/L84WJjcJ5idvyvPcJ1CfirE
	69Ann6TVNJSFeiOQ6jWI48DgAvscKSdO99QnX+3GVjuL8P7KhFnayqmgWW2klD9i9kPasQzYwkL
	l9bBFYKjV5amW5BvVXAt7vRkk=
X-Google-Smtp-Source: AGHT+IHvhXHY7HeoNi8ADifMjcj4l/umqgtrbcmBIb0z1G71TTHxvNq1iGQY0NuQb3PuBVLrfBKn4VoSEs7tmCDu5bA=
X-Received: by 2002:a17:907:c08c:b0:ac2:a1c9:4a98 with SMTP id
 a640c23a62f3a-ac2ba49ba2amr68646066b.9.1741632162272; Mon, 10 Mar 2025
 11:42:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org>
 <20250307-dp-hdmi-audio-v5-1-f3be215fdb78@linaro.org> <20250310-unnatural-puffin-of-revolution-59d726@houat>
In-Reply-To: <20250310-unnatural-puffin-of-revolution-59d726@houat>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Mon, 10 Mar 2025 20:42:29 +0200
X-Gm-Features: AQ5f1JplfZRW_V6D8vq8XsAv5sIxbwbs1c2mxo_HjHGDckih5ta9pgAGYn2lcQE
Message-ID: <CALT56yPKe8+tSyChAo6ypHR8EWUpqeJDNM6mcOBUnFwFE7rg4w@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] drm/bridge: split HDMI Audio from DRM_BRIDGE_OP_HDMI
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Hermes Wu <Hermes.wu@ite.com.tw>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Mar 2025 at 16:55, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Fri, Mar 07, 2025 at 07:55:52AM +0200, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > As pointed out by Laurent, OP bits are supposed to describe operations.
> > Split DRM_BRIDGE_OP_HDMI_AUDIO from DRM_BRIDGE_OP_HDMI instead of
> > overloading DRM_BRIDGE_OP_HDMI.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/lontium-lt9611.c        |  2 +-
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |  1 +
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 59 +++++++++++++++++---------
> >  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         |  1 +
> >  include/drm/drm_bridge.h                       | 23 ++++++++--
> >  5 files changed, 61 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > index 026803034231f78c17f619dc04119bdd9b2b6679..3b93c17e25c18ae0d13e9bb74553cf21dcc39f9d 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > @@ -1130,7 +1130,7 @@ static int lt9611_probe(struct i2c_client *client)
> >       lt9611->bridge.of_node = client->dev.of_node;
> >       lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> >                            DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES |
> > -                          DRM_BRIDGE_OP_HDMI;
> > +                          DRM_BRIDGE_OP_HDMI | DRM_BRIDGE_OP_HDMI_AUDIO;
> >       lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> >       lt9611->bridge.vendor = "Lontium";
> >       lt9611->bridge.product = "LT9611";
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > index 6166f197e37b552cb8a52b7b0d23ffc632f54557..5e5f8c2f95be1f5c4633f1093b17a00f9425bb37 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > @@ -1077,6 +1077,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
> >       hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
> >                          DRM_BRIDGE_OP_EDID |
> >                          DRM_BRIDGE_OP_HDMI |
> > +                        DRM_BRIDGE_OP_HDMI_AUDIO |
> >                          DRM_BRIDGE_OP_HPD;
> >       hdmi->bridge.of_node = pdev->dev.of_node;
> >       hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..030f98d454608a63154827c65d4822d378df3b4c 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -98,6 +98,13 @@ struct drm_bridge_connector {
> >        * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
> >        */
> >       struct drm_bridge *bridge_hdmi;
> > +     /**
> > +      * @bridge_hdmi_audio:
> > +      *
> > +      * The bridge in the chain that implements necessary support for the
> > +      * HDMI Audio infrastructure, if any (see &DRM_BRIDGE_OP_HDMI_AUDIO).
> > +      */
> > +     struct drm_bridge *bridge_hdmi_audio;
> >  };
> >
> >  #define to_drm_bridge_connector(x) \
> > @@ -433,7 +440,7 @@ static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
> >               to_drm_bridge_connector(connector);
> >       struct drm_bridge *bridge;
> >
> > -     bridge = bridge_connector->bridge_hdmi;
> > +     bridge = bridge_connector->bridge_hdmi_audio;
> >       if (!bridge)
> >               return -EINVAL;
> >
> > @@ -451,7 +458,7 @@ static int drm_bridge_connector_audio_prepare(struct drm_connector *connector,
> >               to_drm_bridge_connector(connector);
> >       struct drm_bridge *bridge;
> >
> > -     bridge = bridge_connector->bridge_hdmi;
> > +     bridge = bridge_connector->bridge_hdmi_audio;
> >       if (!bridge)
> >               return -EINVAL;
> >
> > @@ -464,7 +471,7 @@ static void drm_bridge_connector_audio_shutdown(struct drm_connector *connector)
> >               to_drm_bridge_connector(connector);
> >       struct drm_bridge *bridge;
> >
> > -     bridge = bridge_connector->bridge_hdmi;
> > +     bridge = bridge_connector->bridge_hdmi_audio;
> >       if (!bridge)
> >               return;
> >
> > @@ -478,7 +485,7 @@ static int drm_bridge_connector_audio_mute_stream(struct drm_connector *connecto
> >               to_drm_bridge_connector(connector);
> >       struct drm_bridge *bridge;
> >
> > -     bridge = bridge_connector->bridge_hdmi;
> > +     bridge = bridge_connector->bridge_hdmi_audio;
> >       if (!bridge)
> >               return -EINVAL;
> >
> > @@ -576,6 +583,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >                               max_bpc = bridge->max_bpc;
> >               }
> >
> > +             if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO) {
> > +                     if (bridge_connector->bridge_hdmi_audio)
> > +                             return ERR_PTR(-EBUSY);
> > +
> > +                     if (!bridge->hdmi_audio_max_i2s_playback_channels &&
> > +                         !bridge->hdmi_audio_spdif_playback)
> > +                             return ERR_PTR(-EINVAL);
> > +
> > +                     if (!bridge->funcs->hdmi_audio_prepare ||
> > +                         !bridge->funcs->hdmi_audio_shutdown)
> > +                             return ERR_PTR(-EINVAL);
> > +
> > +                     bridge_connector->bridge_hdmi_audio = bridge;
> > +             }
> > +
> >               if (!drm_bridge_get_next_bridge(bridge))
> >                       connector_type = bridge->type;
> >
> > @@ -611,22 +633,6 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >                                              max_bpc);
> >               if (ret)
> >                       return ERR_PTR(ret);
> > -
> > -             if (bridge->hdmi_audio_max_i2s_playback_channels ||
> > -                 bridge->hdmi_audio_spdif_playback) {
> > -                     if (!bridge->funcs->hdmi_audio_prepare ||
> > -                         !bridge->funcs->hdmi_audio_shutdown)
> > -                             return ERR_PTR(-EINVAL);
> > -
> > -                     ret = drm_connector_hdmi_audio_init(connector,
> > -                                                         bridge->hdmi_audio_dev,
> > -                                                         &drm_bridge_connector_hdmi_audio_funcs,
> > -                                                         bridge->hdmi_audio_max_i2s_playback_channels,
> > -                                                         bridge->hdmi_audio_spdif_playback,
> > -                                                         bridge->hdmi_audio_dai_port);
> > -                     if (ret)
> > -                             return ERR_PTR(ret);
> > -             }
> >       } else {
> >               ret = drmm_connector_init(drm, connector,
> >                                         &drm_bridge_connector_funcs,
> > @@ -635,6 +641,19 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >                       return ERR_PTR(ret);
> >       }
> >
> > +     if (bridge_connector->bridge_hdmi_audio) {
> > +             bridge = bridge_connector->bridge_hdmi_audio;
> > +
> > +             ret = drm_connector_hdmi_audio_init(connector,
> > +                                                 bridge->hdmi_audio_dev,
> > +                                                 &drm_bridge_connector_hdmi_audio_funcs,
> > +                                                 bridge->hdmi_audio_max_i2s_playback_channels,
> > +                                                 bridge->hdmi_audio_spdif_playback,
> > +                                                 bridge->hdmi_audio_dai_port);
> > +             if (ret)
> > +                     return ERR_PTR(ret);
> > +     }
> > +
> >       drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
> >
> >       if (bridge_connector->bridge_hpd)
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index 1456354c8af4bc7f655e8a47e958e9e0b99b7d29..ab6c8bc4a30b681f7de8ca7031f833795d1f7d94 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -515,6 +515,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
> >       bridge->ops = DRM_BRIDGE_OP_HPD |
> >               DRM_BRIDGE_OP_DETECT |
> >               DRM_BRIDGE_OP_HDMI |
> > +             DRM_BRIDGE_OP_HDMI_AUDIO |
> >               DRM_BRIDGE_OP_EDID;
> >       bridge->hdmi_audio_max_i2s_playback_channels = 8;
> >       bridge->hdmi_audio_dev = &hdmi->pdev->dev;
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index d4c75d59fa12be1bd7375ce3ea56415235781b28..dff8cf035b30d5c7e00bfdf5d6e12802559823ba 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -693,8 +693,10 @@ struct drm_bridge_funcs {
> >       /**
> >        * @hdmi_audio_prepare:
> >        * Configures HDMI-encoder for audio stream. Can be called multiple
> > -      * times for each setup. Mandatory if HDMI audio is enabled in the
> > -      * bridge's configuration.
> > +      * times for each setup.
> > +      *
> > +      * This callback is optional but it must be implemented by bridges that
> > +      * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
> >        *
> >        * Returns:
> >        * 0 on success, a negative error code otherwise
> > @@ -707,8 +709,10 @@ struct drm_bridge_funcs {
> >       /**
> >        * @hdmi_audio_shutdown:
> >        *
> > -      * Shut down the audio stream. Mandatory if HDMI audio is enabled in
> > -      * the bridge's configuration.
> > +      * Shut down the audio stream.
> > +      *
> > +      * This callback is optional but it must be implemented by bridges that
> > +      * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
> >        *
> >        * Returns:
> >        * 0 on success, a negative error code otherwise
> > @@ -814,6 +818,17 @@ enum drm_bridge_ops {
> >        * drivers.
> >        */
> >       DRM_BRIDGE_OP_HDMI = BIT(4),
> > +     /**
> > +      * @DRM_BRIDGE_OP_HDMI_AUDIO: The bridge provides HDMI audio operations.
> > +      * Bridges that set this flag must implement the
> > +      * &drm_bridge_funcs->hdmi_audio_prepare and
> > +      * &drm_bridge_funcs->hdmi_audio_shutdown callbacks.
> > +      *
> > +      * Note: currently there can be at most one bridge in a chain that sets
> > +      * this bit. This is to simplify corresponding glue code in connector
> > +      * drivers.
> > +      */
> > +     DRM_BRIDGE_OP_HDMI_AUDIO = BIT(5),
>
> We should make this conditional on HDMI being set. It doesn't make sense
> to have OP_HDMI_AUDIO enabled when OP_HDMI isn't.

It totally does. In the second patch I'm using OP_HDMI_AUDIO for the
DisplayPort driver.

>
> This should be mentioned in the documentation, and possibly with a
> sanity check at initialization.



-- 
With best wishes
Dmitry

