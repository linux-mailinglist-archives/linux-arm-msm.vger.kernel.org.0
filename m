Return-Path: <linux-arm-msm+bounces-13705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F628763F3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 13:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E612B1F2136E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 12:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201B95645C;
	Fri,  8 Mar 2024 12:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BXjc/oeo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1553A55E78
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Mar 2024 12:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709899540; cv=none; b=IQvbOlhdbQflYyKTeZNVuFsooYmqNrBt58RsSiW31kJakY6fq9SETb6GMMQcQOU9bPqungbqadYFojQ3akcftZ7y1oQcaFt11XbgSEpxJLvfoje51dmqcsQNQ1we/9Fi+wvQFdAQWC+0QMvrmpAk/iAqsP1jhJLU/MfECSSbB/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709899540; c=relaxed/simple;
	bh=EBduavO/y8IL1lFLUtRm7RnQ57FhB9nRnL8ApUSOjkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBaCZF5nNjkzvUFMWvD+n3E7uasO6Ttt6TPFkSiGBJqFKeiWKZmT04HPY9gPDnVMJi4/560K73MDrGwznuG22zD/g+jarkgXvkeFGCFTpUB59xBOy5kj+vUcJQGCd1F7DqO2THoEvC3sHygxZevONXi8cLYp5NJOlucmbty7HeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BXjc/oeo; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-609f1b77728so17972397b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Mar 2024 04:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709899537; x=1710504337; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1os8AGfFSxSMjfqnxyyLyIeABXM68AdhP9zn6W+WShw=;
        b=BXjc/oeoNJWgk/TiLtefWd7MGplbAmX00rRxPkJGvCAH/4aFA36KHDR76B4rJFu3wH
         y4s4XT32jBskOXbQA31wvXEpHEZQAokaFmbOM0dHYQazC6VOe6OxobnW/WVDuuSj0HXE
         lVPZJm9wP1uP+/77WO4qfjytIqaJjx0Dyw4qRgNGYHT7Kvh95yK9UuHhGvf9Mem1asLz
         XJKu46JlblRdv3iEcLne+r8wX63pytt6X2FMIvoqOVSaU1HlVeCfWpdXbxCzIh2HDriK
         1dCSFSzHoLzY2LYnviXJ6el/5qquRVMzPY9hmvdq5NqvZMn/pg5gfiD7vyPK8TFIKMUw
         RQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709899537; x=1710504337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1os8AGfFSxSMjfqnxyyLyIeABXM68AdhP9zn6W+WShw=;
        b=TOSKHxd+MEsNsr+rauOJxlxCCrN+acOHCC/m3wIElopG3LCYNIBmT9MwITXSEDw5Wy
         skTqi68Umu7FSG1COJ0RXRYxufrVO62utC8nWApy0UScXeCfwfw/NDrLehQD/jmY5dd4
         mW9mdA5XkUbqkHO3ti37f5PYvI1Iq65qi0fgYgmQY4VQJ/+SVAASygOC4n5+t5tpgP/O
         TE0LbAm1uLfxkBNj+d8DjUrML3EbIAsiIYw/clynOm7DLqO2zYv4jEQQjLunZNmBq0WL
         8pj+h8A67daiVikUxmlBU72d9nrByZRONizP7CfMvkh6ew4HsV3MveXxfUacsFZoH81q
         6jJg==
X-Forwarded-Encrypted: i=1; AJvYcCUbU+t8x6u4LhbdwydfALm+kEvF2lmPGWeVZe1c1rYX6o1S2jpeWupM3gKbo/CL/4/07SZacy/YwSHLY89GYvXBV3LBWfpg5GR0idoKUA==
X-Gm-Message-State: AOJu0YzVgzwrPY9HelOjKOiQt/ONzfTtjkOzwI6ar3VF2bobX6CEMGOH
	O1AG+aVZyCmM7K585E6QSSD0Ua0Lo9IitSvWodbe3R//jcddjt8Q42mjzhFxs/AnOjSN3mcoNci
	uroabBX71kDOfTGPuE4Ps0pIeKxdWMmXwJI6VcQ==
X-Google-Smtp-Source: AGHT+IGySOi1QnZwIZY3/qke2c7hoM1tIq6jeI/mM00Y4E3wdeA798JoU7EqgtfwiPGdeGop1DYtk3/kzzb2vOawKZQ=
X-Received: by 2002:a0d:e254:0:b0:60a:1f3:5960 with SMTP id
 l81-20020a0de254000000b0060a01f35960mr2039524ywe.8.1709899536807; Fri, 08 Mar
 2024 04:05:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
 <20240308-bridge-hdmi-connector-v1-3-90b693550260@linaro.org>
 <20240308-provocative-pumpkin-hoatzin-f9f31e@houat> <CAA8EJpp2XwZfG4SuNFqVMmr5hvWZoOq+zCutpgzdNpZM3EwjBA@mail.gmail.com>
 <20240308-economic-sambar-of-prosperity-6aed71@houat>
In-Reply-To: <20240308-economic-sambar-of-prosperity-6aed71@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Mar 2024 14:05:25 +0200
Message-ID: <CAA8EJpq6DvnrearGHy=HcmqErzqc80_g4xgay5VCr4EBbG+pHQ@mail.gmail.com>
Subject: Re: [PATCH RFC 3/6] drm/connector: hdmi: split setup code of the HDMI connector
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Mar 2024 at 13:53, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Fri, Mar 08, 2024 at 12:52:04PM +0200, Dmitry Baryshkov wrote:
> > On Fri, 8 Mar 2024 at 11:44, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > Hi Dmitry,
> > >
> > > Thanks a lot for working on that, it's greatly appreciated :)
> > >
> > > On Fri, Mar 08, 2024 at 01:57:02AM +0200, Dmitry Baryshkov wrote:
> > > > In order to use HDMI connector extensions from the bridge drivers, carve
> > > > out the drm_connector_hdmi_setup() from drmm_connector_hdmi_init(). This
> > > > way the drm_bridge drivers can call new function from their
> > > > setup_connector callbacks.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_connector.c | 67 ++++++++++++++++++++++++++++++-----------
> > > >  include/drm/drm_connector.h     |  5 +++
> > > >  2 files changed, 54 insertions(+), 18 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > > index 427816239038..ba953eb45557 100644
> > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > @@ -454,15 +454,11 @@ int drmm_connector_init(struct drm_device *dev,
> > > >  EXPORT_SYMBOL(drmm_connector_init);
> > > >
> > > >  /**
> > > > - * drmm_connector_hdmi_init - Init a preallocated HDMI connector
> > > > - * @dev: DRM device
> > > > + * drm_connector_hdmi_setup - Init a preallocated HDMI connector
> > > >   * @connector: A pointer to the HDMI connector to init
> > > >   * @vendor: HDMI Controller Vendor name
> > > >   * @product: HDMI Controller Product name
> > > > - * @funcs: callbacks for this connector
> > > >   * @hdmi_funcs: HDMI-related callbacks for this connector
> > > > - * @connector_type: user visible type of the connector
> > > > - * @ddc: optional pointer to the associated ddc adapter
> > > >   * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
> > > >   * @max_bpc: Maximum bits per char the HDMI connector supports
> > > >   *
> > > > @@ -477,18 +473,12 @@ EXPORT_SYMBOL(drmm_connector_init);
> > > >   * Returns:
> > > >   * Zero on success, error code on failure.
> > > >   */
> > > > -int drmm_connector_hdmi_init(struct drm_device *dev,
> > > > -                          struct drm_connector *connector,
> > > > +int drm_connector_hdmi_setup(struct drm_connector *connector,
> > > >                            const char *vendor, const char *product,
> > > > -                          const struct drm_connector_funcs *funcs,
> > > >                            const struct drm_connector_hdmi_funcs *hdmi_funcs,
> > > > -                          int connector_type,
> > > > -                          struct i2c_adapter *ddc,
> > > >                            unsigned long supported_formats,
> > > >                            unsigned int max_bpc)
> > > >  {
> > > > -     int ret;
> > > > -
> > > >       if (!vendor || !product)
> > > >               return -EINVAL;
> > > >
> > > > @@ -496,8 +486,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> > > >           (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
> > > >               return -EINVAL;
> > > >
> > > > -     if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> > > > -           connector_type == DRM_MODE_CONNECTOR_HDMIB))
> > > > +     if (connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
> > > > +         connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
> > > >               return -EINVAL;
> > > >
> > > >       if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB)))
> > > > @@ -506,10 +496,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> > > >       if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
> > > >               return -EINVAL;
> > > >
> > > > -     ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
> > > > -     if (ret)
> > > > -             return ret;
> > > > -
> > > >       connector->hdmi.supported_formats = supported_formats;
> > > >       strtomem_pad(connector->hdmi.vendor, vendor, 0);
> > > >       strtomem_pad(connector->hdmi.product, product, 0);
> > > > @@ -531,6 +517,51 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> > > >
> > > >       return 0;
> > > >  }
> > > > +EXPORT_SYMBOL(drm_connector_hdmi_setup);
> > >
> > > I guess it's more of a general comment on the whole design of things,
> > > but this is the starting point I think.
> > >
> > > None of the other DRM entities have the split between init and setup,
> > > connectors included. So this creates a bit of oddity in the API which I
> > > think we should avoid at all cost. API consistency is the most
> > > important.
> > >
> > > If I got the rest of your series properly, this all stems from the fact
> > > that since connectors are disconnected from bridges nowadays, there's no
> > > way to implement drm_connector_hdmi_funcs on an HDMI bridge, and
> > > especially to get those hooks called with some sort of pointer to the
> > > bridge private instance.
> > >
> > > And so I assume this is why you split init in two here, and added a data
> > > field to the HDMI part of drm_connector, so that you can init the
> > > connector in drm_bridge_connector, and then call setup with your
> > > drm_connector_hdmi_funcs and the private data pointer in setup so it all
> > > works out. Right?
> >
> > Yes.
> >
> > >
> > > If so, I believe this doesn't only create an inconsistency at the KMS
> > > core API level, but also in the bridge API. To me, bridges are meant to
> > > fill the encoder gap, so we shouldn't special-case the core API to
> > > accomodate the bridge design. And the bridge framework has been designed
> > > that way too.
> >
> > My feeling about the drm_connector_hdmi was closer to helpers, rather
> > than just init. In case of helpers we set them after initializing the
> > object rather than setting them at the init time.
> >
> > >
> > > If you look at the way EDID or HPD handling, we fundamentally have the
> > > same problem: the connector is supposed to implement it, but it really
> > > is handled by the bridge driver that wants to operate with its private
> > > instance data.
> >
> > Yes.
> >
> > >
> > > So I think we should go for a similar approach:
> > >
> > >   - We keep the drm_hdmi_connector_init function only
> > >
> > >   - If the drm_bridge_connector has an HDMI type, we can
> > >     drm_hdmi_connector_init and call
> > >     drm_atomic_helper_connector_hdmi_check() at atomic_check time.
> >
> > This is slightly problematic. First of all, it breaks layering. What
> > if the HDMI stream gets wrapped? E.g. into the MyDP (think of
> > anx7808)? Then the drm_bridge_connector will have connector_type field
> > equal to DRM_CONNECTOR_DisplayPort (MyDP). I have not looked into the
> > dual-mode DP connectors or USB-C MHL mode, but they might also cause
> > some wraparounds. Or changes to the connector_type.
>
> I guess there's several aspects here:
>
> - For me, it's something for the bridge framework to solve. The format
>   negociation is already there, we would probably need more logic to
>   deal with the rest of the setup, but it doesn't look like it's
>   impossible.
>
> - AFAIK, we don't solve that at the moment either in the anx7808 driver,
>   so it doesn't seem to be an important use case.
>
> - Another solution to this would be to make the automatic logic
>   opt-in/opt-out (through a bridge OP flag?) so drivers like this can
>   always handle it themselves if they want to. And we could make the
>   logic available through helpers if they still want to benefit from it
>   without using the connector state.
>
> But yeah, I think we should try to remain at feature parity here until
> we have more advanced use-cases, and it looks to me that the solution
> above would fit that bill.
>
> > So, I think it is incorrect to call
> > drm_atomic_helper_connector_hdmi_check() from the drm_bridge_connector
> > itself.
> >
> > Likewise, to setup HDMI connector parts from drm_bridge_connector we
> > will have to pass vendor/product/max_bpc/formats between layers.
> > Setting up HDMI connector from the bridge itself saves us from such
> > issues.
>
> We could also add two char string to drm_bridge and that would just
> work, without making the main API inconsistent.

Last question, is it fine to call
drm_atomic_helper_connector_hdmi_update_infoframes() from the bridge
driver? Or would you prefer to have this call in the
drm_bridge_connector code?

> > The only possible case I have in my mind is that setting up HDMI
> > connector from the end of the chain would allow us to override some of
> > the properties. E.g. I can think of hdmi-connector overriding vendor /
> > product strings.
> >
> > >
> > >   - We create a drm_bridge_* set of functions and associated hooks to
> > >     handle HDMI TMDS char rate filtering and infoframes setup that gets
> > >     called by drm_bridge_connector, and pass the bridge, connector and
> > >     all the extra arguments we need.
> > >
> > > Once we've done that, we're probably in a good position to support what
> > > we want to support. The drm_connector_state is passed to the atomic set
> > > of bridges hooks so they can just read the content from there and we
> > > should be good?
> >
> > This might save us from the drm_connector.hdmi.data hassle.
>
> Ultimately, it looks like it's about design goals and trade-offs. The
> initial point of my series was about making sure the easiest path
> forward for drivers was the correct one: you get all the stuff you need
> from the connector state. And only by supplementing the framework.
>
> The drm_bridge framework (and especially drm_bridge_connector) chose to
> take the connector out of the bridge control. That's fine, it solves
> some real use cases, but also has a bunch of drawbacks, one of them
> being the one we're seeing right now.

Yes. I think it's the price of flexibility. I can not think of a sane
way to express DSI->HDMI->connector or DSI->eDP->panel in a sane way
if bridges were tightly controlling the connector.

>
> Still, I think we should follow the same general principles: remain
> consistent with the KMS and drm_bridge framework and to make it as easy
> as possible for drivers without breaking the existing ones.
>
> So yeah, I don't think we need to support all the possible use-cases
> right now. We can start small and support only the trivial use-cases
> with only an HDMI bridge being last for example at first for example,
> and then we'll grow from there.

What about a typical usecase of a HDMI bridge which is followed by the
hdmi-connector brudge? I think in this case the HDMI connector can be
mostly opaque, except maybe the vendor/product strings. Does that
sound good? But that means that we really need an OP for HDMI stuff.

If that's fine with you, I'll try updating the patchset along the
lines of our discussion and send v2 later on.

>
> > Last, but not least. Your proposal means that we have to use
> > drm_bridge_connector. Some platforms still use bridge-created
> > connector. What is the status of the migration? Should we start
> > pushing drivers towards drm_bridge_connector in a more aggressive way?
>
> That's fine, if the bridge creates the connector itself, it's in control
> of the connector structure, its state, and can retrieve its private
> data. So we would support both. So I don't think there's a need to push
> for anything.

Ack.

-- 
With best wishes
Dmitry

