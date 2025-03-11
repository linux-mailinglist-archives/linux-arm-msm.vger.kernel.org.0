Return-Path: <linux-arm-msm+bounces-50984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3184AA5C8CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 16:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46CC77A9439
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 15:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7591C25D20B;
	Tue, 11 Mar 2025 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3Vm6QEJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5211E1A32;
	Tue, 11 Mar 2025 15:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741708217; cv=none; b=MdZhjt9BsS+Hsgqx4MEQTyM3bD8eR9LS0tTuJYLH+q1mtTXpVQp02r+cc0ocAGwAdU7Bd1uKiVEGJfbSbzxutLS/IZT9lAKkr837HXzqSUpGfMfsf3IPubQCMgr9BVsaKikc3moEjGPKBw0T/v0oCls1X4SKXHe8QFPvmJQIOYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741708217; c=relaxed/simple;
	bh=JpaGSzuLaPN8LlclQw05IDw5QrD3AEuV12+5A/4Ya1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIqUrC8FT6/4xYJmWJE301+G9RGxzTEEl2tJzs5UY4m2KNpa4d34/ut5wOimFZgSoQBPXpqIQHjfOOpqP785WMeCu9umv8h+2+OKCa0nFgreBe7kxGBjcAoM3ef1hY5UAVF6WqxZSVL2ccCbKHsxGriq6qBKPGs7VWU6GpiZms8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3Vm6QEJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62245C4CEE9;
	Tue, 11 Mar 2025 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741708215;
	bh=JpaGSzuLaPN8LlclQw05IDw5QrD3AEuV12+5A/4Ya1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3Vm6QEJUt3YKTsIB7HuE2zfSqBAWl3oJpp/m1Trh9RhsBuZxcHMbrFCyX+JQUfif
	 HVJRdtUUu1WrDUzoyNSaeylftHQ47b9Ej4pY1I+/CiyOa0OVndb+fwlfKrb8UDwsyk
	 Gi5JHZgh9oxKksosXP8rugD2//rETKAEQ/aanlNfedyUmKsZu35qmz8WhQ74a3sJ9F
	 /BlhhnYPMKF4WkcDLNmp8d6SyFRdeJeZotlh7X9ILLdg/nwzx/7arGQF4johSU4guM
	 crh15pwBkV4R/+OLu507bcNMfbArbGxiv1OSHX7ibDihhPFM91ElV9nmrwbuFzV6E4
	 dGdCfraaUfFdQ==
Date: Tue, 11 Mar 2025 17:50:09 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Hermes Wu <Hermes.wu@ite.com.tw>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 1/2] drm/bridge: split HDMI Audio from
 DRM_BRIDGE_OP_HDMI
Message-ID: <nx67lft5x4ytsxsd4mpxfocig5dfaolsurlwqzvkrniwzv3huz@hmwucvqykaid>
References: <20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org>
 <20250307-dp-hdmi-audio-v5-1-f3be215fdb78@linaro.org>
 <20250310-unnatural-puffin-of-revolution-59d726@houat>
 <CALT56yPKe8+tSyChAo6ypHR8EWUpqeJDNM6mcOBUnFwFE7rg4w@mail.gmail.com>
 <20250311-quizzical-warthog-of-leadership-53d224@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-quizzical-warthog-of-leadership-53d224@houat>

On Tue, Mar 11, 2025 at 09:36:37AM +0100, Maxime Ripard wrote:
> On Mon, Mar 10, 2025 at 08:42:29PM +0200, Dmitry Baryshkov wrote:
> > On Mon, 10 Mar 2025 at 16:55, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > On Fri, Mar 07, 2025 at 07:55:52AM +0200, Dmitry Baryshkov wrote:
> > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >
> > > > As pointed out by Laurent, OP bits are supposed to describe operations.
> > > > Split DRM_BRIDGE_OP_HDMI_AUDIO from DRM_BRIDGE_OP_HDMI instead of
> > > > overloading DRM_BRIDGE_OP_HDMI.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/bridge/lontium-lt9611.c        |  2 +-
> > > >  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |  1 +
> > > >  drivers/gpu/drm/display/drm_bridge_connector.c | 59 +++++++++++++++++---------
> > > >  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         |  1 +
> > > >  include/drm/drm_bridge.h                       | 23 ++++++++--
> > > >  5 files changed, 61 insertions(+), 25 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > > > index 026803034231f78c17f619dc04119bdd9b2b6679..3b93c17e25c18ae0d13e9bb74553cf21dcc39f9d 100644
> > > > --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> > > > +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > > > @@ -1130,7 +1130,7 @@ static int lt9611_probe(struct i2c_client *client)
> > > >       lt9611->bridge.of_node = client->dev.of_node;
> > > >       lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> > > >                            DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES |
> > > > -                          DRM_BRIDGE_OP_HDMI;
> > > > +                          DRM_BRIDGE_OP_HDMI | DRM_BRIDGE_OP_HDMI_AUDIO;
> > > >       lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> > > >       lt9611->bridge.vendor = "Lontium";
> > > >       lt9611->bridge.product = "LT9611";
> > > > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > > > index 6166f197e37b552cb8a52b7b0d23ffc632f54557..5e5f8c2f95be1f5c4633f1093b17a00f9425bb37 100644
> > > > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > > > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > > > @@ -1077,6 +1077,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
> > > >       hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
> > > >                          DRM_BRIDGE_OP_EDID |
> > > >                          DRM_BRIDGE_OP_HDMI |
> > > > +                        DRM_BRIDGE_OP_HDMI_AUDIO |
> > > >                          DRM_BRIDGE_OP_HPD;
> > > >       hdmi->bridge.of_node = pdev->dev.of_node;
> > > >       hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> > > > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > > index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..030f98d454608a63154827c65d4822d378df3b4c 100644
> > > > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > > > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > > @@ -98,6 +98,13 @@ struct drm_bridge_connector {
> > > >        * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
> > > >        */
> > > >       struct drm_bridge *bridge_hdmi;
> > > > +     /**
> > > > +      * @bridge_hdmi_audio:
> > > > +      *
> > > > +      * The bridge in the chain that implements necessary support for the
> > > > +      * HDMI Audio infrastructure, if any (see &DRM_BRIDGE_OP_HDMI_AUDIO).
> > > > +      */
> > > > +     struct drm_bridge *bridge_hdmi_audio;
> > > >  };
> > > >
> > > >  #define to_drm_bridge_connector(x) \
> > > > @@ -433,7 +440,7 @@ static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
> > > >               to_drm_bridge_connector(connector);
> > > >       struct drm_bridge *bridge;
> > > >
> > > > -     bridge = bridge_connector->bridge_hdmi;
> > > > +     bridge = bridge_connector->bridge_hdmi_audio;
> > > >       if (!bridge)
> > > >               return -EINVAL;
> > > >
> > > > @@ -451,7 +458,7 @@ static int drm_bridge_connector_audio_prepare(struct drm_connector *connector,
> > > >               to_drm_bridge_connector(connector);
> > > >       struct drm_bridge *bridge;
> > > >
> > > > -     bridge = bridge_connector->bridge_hdmi;
> > > > +     bridge = bridge_connector->bridge_hdmi_audio;
> > > >       if (!bridge)
> > > >               return -EINVAL;
> > > >
> > > > @@ -464,7 +471,7 @@ static void drm_bridge_connector_audio_shutdown(struct drm_connector *connector)
> > > >               to_drm_bridge_connector(connector);
> > > >       struct drm_bridge *bridge;
> > > >
> > > > -     bridge = bridge_connector->bridge_hdmi;
> > > > +     bridge = bridge_connector->bridge_hdmi_audio;
> > > >       if (!bridge)
> > > >               return;
> > > >
> > > > @@ -478,7 +485,7 @@ static int drm_bridge_connector_audio_mute_stream(struct drm_connector *connecto
> > > >               to_drm_bridge_connector(connector);
> > > >       struct drm_bridge *bridge;
> > > >
> > > > -     bridge = bridge_connector->bridge_hdmi;
> > > > +     bridge = bridge_connector->bridge_hdmi_audio;
> > > >       if (!bridge)
> > > >               return -EINVAL;
> > > >
> > > > @@ -576,6 +583,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > > >                               max_bpc = bridge->max_bpc;
> > > >               }
> > > >
> > > > +             if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO) {
> > > > +                     if (bridge_connector->bridge_hdmi_audio)
> > > > +                             return ERR_PTR(-EBUSY);
> > > > +
> > > > +                     if (!bridge->hdmi_audio_max_i2s_playback_channels &&
> > > > +                         !bridge->hdmi_audio_spdif_playback)
> > > > +                             return ERR_PTR(-EINVAL);
> > > > +
> > > > +                     if (!bridge->funcs->hdmi_audio_prepare ||
> > > > +                         !bridge->funcs->hdmi_audio_shutdown)
> > > > +                             return ERR_PTR(-EINVAL);
> > > > +
> > > > +                     bridge_connector->bridge_hdmi_audio = bridge;
> > > > +             }
> > > > +
> > > >               if (!drm_bridge_get_next_bridge(bridge))
> > > >                       connector_type = bridge->type;
> > > >
> > > > @@ -611,22 +633,6 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > > >                                              max_bpc);
> > > >               if (ret)
> > > >                       return ERR_PTR(ret);
> > > > -
> > > > -             if (bridge->hdmi_audio_max_i2s_playback_channels ||
> > > > -                 bridge->hdmi_audio_spdif_playback) {
> > > > -                     if (!bridge->funcs->hdmi_audio_prepare ||
> > > > -                         !bridge->funcs->hdmi_audio_shutdown)
> > > > -                             return ERR_PTR(-EINVAL);
> > > > -
> > > > -                     ret = drm_connector_hdmi_audio_init(connector,
> > > > -                                                         bridge->hdmi_audio_dev,
> > > > -                                                         &drm_bridge_connector_hdmi_audio_funcs,
> > > > -                                                         bridge->hdmi_audio_max_i2s_playback_channels,
> > > > -                                                         bridge->hdmi_audio_spdif_playback,
> > > > -                                                         bridge->hdmi_audio_dai_port);
> > > > -                     if (ret)
> > > > -                             return ERR_PTR(ret);
> > > > -             }
> > > >       } else {
> > > >               ret = drmm_connector_init(drm, connector,
> > > >                                         &drm_bridge_connector_funcs,
> > > > @@ -635,6 +641,19 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > > >                       return ERR_PTR(ret);
> > > >       }
> > > >
> > > > +     if (bridge_connector->bridge_hdmi_audio) {
> > > > +             bridge = bridge_connector->bridge_hdmi_audio;
> > > > +
> > > > +             ret = drm_connector_hdmi_audio_init(connector,
> > > > +                                                 bridge->hdmi_audio_dev,
> > > > +                                                 &drm_bridge_connector_hdmi_audio_funcs,
> > > > +                                                 bridge->hdmi_audio_max_i2s_playback_channels,
> > > > +                                                 bridge->hdmi_audio_spdif_playback,
> > > > +                                                 bridge->hdmi_audio_dai_port);
> > > > +             if (ret)
> > > > +                     return ERR_PTR(ret);
> > > > +     }
> > > > +
> > > >       drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
> > > >
> > > >       if (bridge_connector->bridge_hpd)
> > > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > index 1456354c8af4bc7f655e8a47e958e9e0b99b7d29..ab6c8bc4a30b681f7de8ca7031f833795d1f7d94 100644
> > > > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > @@ -515,6 +515,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
> > > >       bridge->ops = DRM_BRIDGE_OP_HPD |
> > > >               DRM_BRIDGE_OP_DETECT |
> > > >               DRM_BRIDGE_OP_HDMI |
> > > > +             DRM_BRIDGE_OP_HDMI_AUDIO |
> > > >               DRM_BRIDGE_OP_EDID;
> > > >       bridge->hdmi_audio_max_i2s_playback_channels = 8;
> > > >       bridge->hdmi_audio_dev = &hdmi->pdev->dev;
> > > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > > index d4c75d59fa12be1bd7375ce3ea56415235781b28..dff8cf035b30d5c7e00bfdf5d6e12802559823ba 100644
> > > > --- a/include/drm/drm_bridge.h
> > > > +++ b/include/drm/drm_bridge.h
> > > > @@ -693,8 +693,10 @@ struct drm_bridge_funcs {
> > > >       /**
> > > >        * @hdmi_audio_prepare:
> > > >        * Configures HDMI-encoder for audio stream. Can be called multiple
> > > > -      * times for each setup. Mandatory if HDMI audio is enabled in the
> > > > -      * bridge's configuration.
> > > > +      * times for each setup.
> > > > +      *
> > > > +      * This callback is optional but it must be implemented by bridges that
> > > > +      * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
> > > >        *
> > > >        * Returns:
> > > >        * 0 on success, a negative error code otherwise
> > > > @@ -707,8 +709,10 @@ struct drm_bridge_funcs {
> > > >       /**
> > > >        * @hdmi_audio_shutdown:
> > > >        *
> > > > -      * Shut down the audio stream. Mandatory if HDMI audio is enabled in
> > > > -      * the bridge's configuration.
> > > > +      * Shut down the audio stream.
> > > > +      *
> > > > +      * This callback is optional but it must be implemented by bridges that
> > > > +      * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
> > > >        *
> > > >        * Returns:
> > > >        * 0 on success, a negative error code otherwise
> > > > @@ -814,6 +818,17 @@ enum drm_bridge_ops {
> > > >        * drivers.
> > > >        */
> > > >       DRM_BRIDGE_OP_HDMI = BIT(4),
> > > > +     /**
> > > > +      * @DRM_BRIDGE_OP_HDMI_AUDIO: The bridge provides HDMI audio operations.
> > > > +      * Bridges that set this flag must implement the
> > > > +      * &drm_bridge_funcs->hdmi_audio_prepare and
> > > > +      * &drm_bridge_funcs->hdmi_audio_shutdown callbacks.
> > > > +      *
> > > > +      * Note: currently there can be at most one bridge in a chain that sets
> > > > +      * this bit. This is to simplify corresponding glue code in connector
> > > > +      * drivers.
> > > > +      */
> > > > +     DRM_BRIDGE_OP_HDMI_AUDIO = BIT(5),
> > >
> > > We should make this conditional on HDMI being set. It doesn't make sense
> > > to have OP_HDMI_AUDIO enabled when OP_HDMI isn't.
> > 
> > It totally does.
> 
> I'm sure it works properly. I meant on a conceptual level. In our
> codebase, as it is today, the HDMI audio support is part of the HDMI
> infrastructure, and thus implementing audio without the main part
> doesn't make sense. IIRC, the spec also mandates video support, but
> audio is optional.

I can imagine a HDMI bridge using OP_HDMI_AUDIO, but not OP_HDMI. For
example, lontium-lt9611uxc.c. It is a 'smart' chip, which handles nearly
everything on its own. I even don't know if there is a way to program
the InfoFrames, etc., so I'm very skeptical about setting OP_HDMI.
However at the same time, it would defeinitely benefit from using
OP_HDMI_AUDIO.

> 
> > In the second patch I'm using OP_HDMI_AUDIO for the DisplayPort
> > driver.
> 
> Let's discuss that part in your second patch.
> 
> Maxime



-- 
With best wishes
Dmitry

