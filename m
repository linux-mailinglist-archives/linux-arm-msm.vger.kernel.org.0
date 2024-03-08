Return-Path: <linux-arm-msm+bounces-13693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 342B6876273
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 11:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57C6C1C2090B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 10:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1BCA54BF1;
	Fri,  8 Mar 2024 10:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GBW6Hgid"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D523355772
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Mar 2024 10:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709895138; cv=none; b=oDRCi8BTXceiiHJRr3IB+jSVU9o5wLNYx7alRsEDRIp3T658fTuqDEocN7TVv+cESDQm0Ny0+Ess1nU+jpVZ7UDbJKaxjiE44KQeGSKinJChi3lIqdsPwlIE5M0s4WnAPXthg8/1kktCnb8HHGnL44z7NJiOxFSLTX1X7sfa45U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709895138; c=relaxed/simple;
	bh=HGmURrjC3uscL7tVq+ZSLJZQWYEXEeUt4aIhfmSOQss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsdllAfz58mNzd6dbJxFQQcIOCQ/uRMLOtgoyAn4Eom9u0gv6NznFdEcVQOTV6cOEKSwWJS4sJWVWiycvrCB1tAXMlfwTLJi8ljXQBIA5dxbszmOA916fnYnG/4p+4aXVfF84DTJBqwnzh1RVLVrIjtAfe0MJKlS8xmWOGcoqsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GBW6Hgid; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-60a0579a968so3989277b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Mar 2024 02:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709895136; x=1710499936; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=osicK+Lc37n5xGtCEzMFa5fG9t5AvZEPqN0hs8cNnSc=;
        b=GBW6HgidmyrRfBGHEqAjjbXfRdvevzDDLxFcx5VEZAivzFu7tUV/P55eZDjFzC4Fjy
         AJ14IXAvVOMZuOiPQKNx5gRJ5jzGCjOBOc45mxOYFJwyeVlkyna9WX2dWhYRTIg1rUxB
         VjMh8mwjNBsZEgcCa8iFW5a/eQSTYyQtzBQOSkoiUwG1LJbihqfhBxEuQSqpGdK0LLlR
         /wlAfG1ngnYtuTmA7c+I6rNPlTc1h2CiOf+FnW7nt2OhAs5knPYVP2SU/zZ5m59CuQsP
         UwF+1XRrKGoseC5H66blYLJCPkYmN82zE89KBvO1p8j1c+/zPqgb4YU5LsL+rBB1JszW
         hIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709895136; x=1710499936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=osicK+Lc37n5xGtCEzMFa5fG9t5AvZEPqN0hs8cNnSc=;
        b=rLYlHnbtZkW9ecgLOD/56HLhpKlIyScyFcBwa2VfN8l7Bat+lf+7amL/iXr8Gq32Y2
         i3sd34afwGMD4h/YvIkmRWTOaXEvyyZY0VAs177+YTHLOOkSXkXdl1A8hay5AmjSVDXh
         LOE9xRq/Bg/bI2rA5JzuNNWp3etfdyYQpXGnJML63N6mGA/6rYZ3BtxkS66FTCAoENwo
         lIzxbWTQYwo4C0QSLCuqnah4IvyKiqgwbgfUyS0OakZIidfhDD89Tar75/1F5/qcNPbC
         087WMreI0J81yzBj0HIZW+JkPzuyFV7XroGJzxoZZ1sMDMu3i9yYBJPBQ02SJRKcXnaU
         pVdw==
X-Forwarded-Encrypted: i=1; AJvYcCU2zHONM79doanKyHvewoXNr/NEsN4+hU5ZC1o+lLPcbhmO5fLMNZXaDzSlUxxGsmGKDM3H7l731HQ9LDJm3fcf8MKAxpZIKcgYXGNZpw==
X-Gm-Message-State: AOJu0YwNrSOp9AgfkV06XcmgzeyYJSkEqduwLqYNTF0iAvWphOAPp+p4
	obt8gjRanD5F5JjWJJPqvbt+wqc3z5rZPpRgSZjTjNXPdXLU5m7/cffSvD+uR28znWr+3wFrXKd
	eycmCa6mksSOpNQOvMk2a93NP0/wNkdS+6xtWFA==
X-Google-Smtp-Source: AGHT+IEpvSnPWvbgQcOAWWbL40tauyfSYiTiSr3NsbMugXhUOm7Sk754wH8CBuh/OC/BMReLxH0Hf5sL6vDR6tJG6Ro=
X-Received: by 2002:a05:690c:ed4:b0:607:ca2e:f23e with SMTP id
 cs20-20020a05690c0ed400b00607ca2ef23emr29080999ywb.30.1709895135715; Fri, 08
 Mar 2024 02:52:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
 <20240308-bridge-hdmi-connector-v1-3-90b693550260@linaro.org> <20240308-provocative-pumpkin-hoatzin-f9f31e@houat>
In-Reply-To: <20240308-provocative-pumpkin-hoatzin-f9f31e@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Mar 2024 12:52:04 +0200
Message-ID: <CAA8EJpp2XwZfG4SuNFqVMmr5hvWZoOq+zCutpgzdNpZM3EwjBA@mail.gmail.com>
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

On Fri, 8 Mar 2024 at 11:44, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi Dmitry,
>
> Thanks a lot for working on that, it's greatly appreciated :)
>
> On Fri, Mar 08, 2024 at 01:57:02AM +0200, Dmitry Baryshkov wrote:
> > In order to use HDMI connector extensions from the bridge drivers, carve
> > out the drm_connector_hdmi_setup() from drmm_connector_hdmi_init(). This
> > way the drm_bridge drivers can call new function from their
> > setup_connector callbacks.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_connector.c | 67 ++++++++++++++++++++++++++++++-----------
> >  include/drm/drm_connector.h     |  5 +++
> >  2 files changed, 54 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 427816239038..ba953eb45557 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -454,15 +454,11 @@ int drmm_connector_init(struct drm_device *dev,
> >  EXPORT_SYMBOL(drmm_connector_init);
> >
> >  /**
> > - * drmm_connector_hdmi_init - Init a preallocated HDMI connector
> > - * @dev: DRM device
> > + * drm_connector_hdmi_setup - Init a preallocated HDMI connector
> >   * @connector: A pointer to the HDMI connector to init
> >   * @vendor: HDMI Controller Vendor name
> >   * @product: HDMI Controller Product name
> > - * @funcs: callbacks for this connector
> >   * @hdmi_funcs: HDMI-related callbacks for this connector
> > - * @connector_type: user visible type of the connector
> > - * @ddc: optional pointer to the associated ddc adapter
> >   * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
> >   * @max_bpc: Maximum bits per char the HDMI connector supports
> >   *
> > @@ -477,18 +473,12 @@ EXPORT_SYMBOL(drmm_connector_init);
> >   * Returns:
> >   * Zero on success, error code on failure.
> >   */
> > -int drmm_connector_hdmi_init(struct drm_device *dev,
> > -                          struct drm_connector *connector,
> > +int drm_connector_hdmi_setup(struct drm_connector *connector,
> >                            const char *vendor, const char *product,
> > -                          const struct drm_connector_funcs *funcs,
> >                            const struct drm_connector_hdmi_funcs *hdmi_funcs,
> > -                          int connector_type,
> > -                          struct i2c_adapter *ddc,
> >                            unsigned long supported_formats,
> >                            unsigned int max_bpc)
> >  {
> > -     int ret;
> > -
> >       if (!vendor || !product)
> >               return -EINVAL;
> >
> > @@ -496,8 +486,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> >           (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
> >               return -EINVAL;
> >
> > -     if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> > -           connector_type == DRM_MODE_CONNECTOR_HDMIB))
> > +     if (connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
> > +         connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
> >               return -EINVAL;
> >
> >       if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB)))
> > @@ -506,10 +496,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> >       if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
> >               return -EINVAL;
> >
> > -     ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
> > -     if (ret)
> > -             return ret;
> > -
> >       connector->hdmi.supported_formats = supported_formats;
> >       strtomem_pad(connector->hdmi.vendor, vendor, 0);
> >       strtomem_pad(connector->hdmi.product, product, 0);
> > @@ -531,6 +517,51 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> >
> >       return 0;
> >  }
> > +EXPORT_SYMBOL(drm_connector_hdmi_setup);
>
> I guess it's more of a general comment on the whole design of things,
> but this is the starting point I think.
>
> None of the other DRM entities have the split between init and setup,
> connectors included. So this creates a bit of oddity in the API which I
> think we should avoid at all cost. API consistency is the most
> important.
>
> If I got the rest of your series properly, this all stems from the fact
> that since connectors are disconnected from bridges nowadays, there's no
> way to implement drm_connector_hdmi_funcs on an HDMI bridge, and
> especially to get those hooks called with some sort of pointer to the
> bridge private instance.
>
> And so I assume this is why you split init in two here, and added a data
> field to the HDMI part of drm_connector, so that you can init the
> connector in drm_bridge_connector, and then call setup with your
> drm_connector_hdmi_funcs and the private data pointer in setup so it all
> works out. Right?

Yes.

>
> If so, I believe this doesn't only create an inconsistency at the KMS
> core API level, but also in the bridge API. To me, bridges are meant to
> fill the encoder gap, so we shouldn't special-case the core API to
> accomodate the bridge design. And the bridge framework has been designed
> that way too.

My feeling about the drm_connector_hdmi was closer to helpers, rather
than just init. In case of helpers we set them after initializing the
object rather than setting them at the init time.

>
> If you look at the way EDID or HPD handling, we fundamentally have the
> same problem: the connector is supposed to implement it, but it really
> is handled by the bridge driver that wants to operate with its private
> instance data.

Yes.

>
> So I think we should go for a similar approach:
>
>   - We keep the drm_hdmi_connector_init function only
>
>   - If the drm_bridge_connector has an HDMI type, we can
>     drm_hdmi_connector_init and call
>     drm_atomic_helper_connector_hdmi_check() at atomic_check time.

This is slightly problematic. First of all, it breaks layering. What
if the HDMI stream gets wrapped? E.g. into the MyDP (think of
anx7808)? Then the drm_bridge_connector will have connector_type field
equal to DRM_CONNECTOR_DisplayPort (MyDP). I have not looked into the
dual-mode DP connectors or USB-C MHL mode, but they might also cause
some wraparounds. Or changes to the connector_type.

So, I think it is incorrect to call
drm_atomic_helper_connector_hdmi_check() from the drm_bridge_connector
itself.

Likewise, to setup HDMI connector parts from drm_bridge_connector we
will have to pass vendor/product/max_bpc/formats between layers.
Setting up HDMI connector from the bridge itself saves us from such
issues.

The only possible case I have in my mind is that setting up HDMI
connector from the end of the chain would allow us to override some of
the properties. E.g. I can think of hdmi-connector overriding vendor /
product strings.

>
>   - We create a drm_bridge_* set of functions and associated hooks to
>     handle HDMI TMDS char rate filtering and infoframes setup that gets
>     called by drm_bridge_connector, and pass the bridge, connector and
>     all the extra arguments we need.
>
> Once we've done that, we're probably in a good position to support what
> we want to support. The drm_connector_state is passed to the atomic set
> of bridges hooks so they can just read the content from there and we
> should be good?

This might save us from the drm_connector.hdmi.data hassle.

Last, but not least. Your proposal means that we have to use
drm_bridge_connector. Some platforms still use bridge-created
connector. What is the status of the migration? Should we start
pushing drivers towards drm_bridge_connector in a more aggressive way?

-- 
With best wishes
Dmitry

