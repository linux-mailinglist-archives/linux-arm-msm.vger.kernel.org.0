Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D95B745B98
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 13:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbjGCLu5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 07:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjGCLu5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 07:50:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C927A115
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 04:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688385012;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=46Sracu/D/0a4Yd4cBQRbtvN6kMcQIjjw3Sb/7ByX0U=;
        b=Pe70J71EvFBIO2RSr5J1lXiam28RqVxuzuQwKQXiFDdXl1VS6Qiapn2wf4hIrbGGkQY2nV
        0XxfUi8fj0XzwT6E4At8vfj2s1X2L5w9L5t1JTmLchDDQfFWXrfd6dFhocT8WZZolFEuKY
        y5aTOHWcbC2Dghj0CVksbSbIR6Yitmg=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-eVIE9B8mO3ya9j2n_aNdOw-1; Mon, 03 Jul 2023 07:50:11 -0400
X-MC-Unique: eVIE9B8mO3ya9j2n_aNdOw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-4f956a29f2aso4023300e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 04:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688385010; x=1690977010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46Sracu/D/0a4Yd4cBQRbtvN6kMcQIjjw3Sb/7ByX0U=;
        b=Xi7U3SRsAs82PjWprdrQAqdUGYL+7K/IW6Q1t2VdvmHWMH2vN213mn0hIU1FTiDiss
         Hs+Q3F33DEWGwB0kSF3JOsgzP59wslgAGPaC3Gl4yrVO3tgDRdlCWm/94I4yQaIwhs9f
         wAkuEtci/wBVtk1dZJz1reR2sG1QS2pDdjiPQ0jEtserQxWEunbIZRJ7gZpptZz7OtWw
         ujDWxB97GaUv/49LRR2YxHZEK4wMOJ2v4tNO9XoFmzN2S08FBtGBho2VfbBrF1AkUUZg
         QA1WHXfA0M3XJ+mpVjekzkWfe5TWM9NlaznMMDbphJ7FrDRzg3vrH8+iIXcEMQK9KjMx
         Ws4Q==
X-Gm-Message-State: ABy/qLZK8MpxY+9a+S0IHXvlubnpZeZERNqNkX5c/y3sApnkiDpxy7v6
        tghjhWNfP2l6J+QnRVo5vSIbgJajsmRt/6OYZDCV/OBqOzSujMTyGMN65Xs+0MztTmq6mSXfXVz
        sHc/q80zyP09k/oaVmHP/hPi6Z+fvcB+JUTRTwtO5Eg==
X-Received: by 2002:a05:6512:4013:b0:4fb:8939:d962 with SMTP id br19-20020a056512401300b004fb8939d962mr7931349lfb.19.1688385010205;
        Mon, 03 Jul 2023 04:50:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFnpM2bSBA1XglWdQgvquuyBJkuMOOv1oRAzQrb67XquQwB6pE6yMXwU+4MHi0nmAmGO5Fu7XqqEiBMmqUTJDs=
X-Received: by 2002:a05:6512:4013:b0:4fb:8939:d962 with SMTP id
 br19-20020a056512401300b004fb8939d962mr7931319lfb.19.1688385009760; Mon, 03
 Jul 2023 04:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com> <CA+hFU4zQFkbi8BjFdWDBDMPR7cC8UqJg0udu7MJYOFac1J8XsQ@mail.gmail.com>
 <68629132-b77a-bfbc-20f7-92a76cf24953@quicinc.com>
In-Reply-To: <68629132-b77a-bfbc-20f7-92a76cf24953@quicinc.com>
From:   Sebastian Wick <sebastian.wick@redhat.com>
Date:   Mon, 3 Jul 2023 13:49:58 +0200
Message-ID: <CA+hFU4whcUq_0KEPrgk39tL29vsaW4v9MRXjGrPYBKWcVH7hFw@mail.gmail.com>
Subject: Re: [PATCH RFC v4 2/7] drm: Introduce pixel_source DRM plane property
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ppaalanen@gmail.com,
        laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org,
        wayland-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 30, 2023 at 11:27=E2=80=AFPM Jessica Zhang
<quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 6/30/2023 7:43 AM, Sebastian Wick wrote:
> > On Fri, Jun 30, 2023 at 2:26=E2=80=AFAM Jessica Zhang <quic_jesszhan@qu=
icinc.com> wrote:
> >>
> >> Add support for pixel_source property to drm_plane and related
> >> documentation.
> >>
> >> This enum property will allow user to specify a pixel source for the
> >> plane. Possible pixel sources will be defined in the
> >> drm_plane_pixel_source enum.
> >>
> >> The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_FB and
> >> DRM_PLANE_PIXEL_SOURCE_COLOR. The default value is *_SOURCE_FB.
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
> >>   drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
> >>   drivers/gpu/drm/drm_blend.c               | 81 +++++++++++++++++++++=
++++++++++
> >>   include/drm/drm_blend.h                   |  2 +
> >>   include/drm/drm_plane.h                   | 21 ++++++++
> >>   5 files changed, 109 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/d=
rm/drm_atomic_state_helper.c
> >> index fe14be2bd2b2..86fb876efbe6 100644
> >> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> >> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> >> @@ -252,6 +252,7 @@ void __drm_atomic_helper_plane_state_reset(struct =
drm_plane_state *plane_state,
> >>
> >>          plane_state->alpha =3D DRM_BLEND_ALPHA_OPAQUE;
> >>          plane_state->pixel_blend_mode =3D DRM_MODE_BLEND_PREMULTI;
> >> +       plane_state->pixel_source =3D DRM_PLANE_PIXEL_SOURCE_FB;
> >>
> >>          if (plane_state->solid_fill_blob) {
> >>                  drm_property_blob_put(plane_state->solid_fill_blob);
> >> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_a=
tomic_uapi.c
> >> index a28b4ee79444..6e59c21af66b 100644
> >> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> >> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> >> @@ -596,6 +596,8 @@ static int drm_atomic_plane_set_property(struct dr=
m_plane *plane,
> >>                  drm_property_blob_put(solid_fill);
> >>
> >>                  return ret;
> >> +       } else if (property =3D=3D plane->pixel_source_property) {
> >> +               state->pixel_source =3D val;
> >>          } else if (property =3D=3D plane->alpha_property) {
> >>                  state->alpha =3D val;
> >>          } else if (property =3D=3D plane->blend_mode_property) {
> >> @@ -671,6 +673,8 @@ drm_atomic_plane_get_property(struct drm_plane *pl=
ane,
> >>          } else if (property =3D=3D plane->solid_fill_property) {
> >>                  *val =3D state->solid_fill_blob ?
> >>                          state->solid_fill_blob->base.id : 0;
> >> +       } else if (property =3D=3D plane->pixel_source_property) {
> >> +               *val =3D state->pixel_source;
> >>          } else if (property =3D=3D plane->alpha_property) {
> >>                  *val =3D state->alpha;
> >>          } else if (property =3D=3D plane->blend_mode_property) {
> >> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> >> index 38c3c5d6453a..8c100a957ee2 100644
> >> --- a/drivers/gpu/drm/drm_blend.c
> >> +++ b/drivers/gpu/drm/drm_blend.c
> >> @@ -189,6 +189,18 @@
> >>    *     solid_fill is set up with drm_plane_create_solid_fill_propert=
y(). It
> >>    *     contains pixel data that drivers can use to fill a plane.
> >>    *
> >> + * pixel_source:
> >> + *     pixel_source is set up with drm_plane_create_pixel_source_prop=
erty().
> >> + *     It is used to toggle the source of pixel data for the plane.
> >> + *
> >> + *     Possible values:
> >> + *
> >> + *     "FB":
> >> + *             Framebuffer source
> >> + *
> >> + *     "COLOR":
> >> + *             solid_fill source
> >> + *
> >>    * Note that all the property extensions described here apply either=
 to the
> >>    * plane or the CRTC (e.g. for the background color, which currently=
 is not
> >>    * exposed and assumed to be black).
> >> @@ -648,3 +660,72 @@ int drm_plane_create_solid_fill_property(struct d=
rm_plane *plane)
> >>          return 0;
> >>   }
> >>   EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
> >> +
> >> +/**
> >> + * drm_plane_create_pixel_source_property - create a new pixel source=
 property
> >> + * @plane: drm plane
> >> + * @supported_sources: bitmask of supported pixel_sources for the dri=
ver (NOT
> >> + *                     including DRM_PLANE_PIXEL_SOURCE_FB, as it wil=
l be supported
> >> + *                     by default).
> >> + *
> >> + * This creates a new property describing the current source of pixel=
 data for the
> >> + * plane.
> >> + *
> >> + * The property is exposed to userspace as an enumeration property ca=
lled
> >> + * "pixel_source" and has the following enumeration values:
> >> + *
> >> + * "FB":
> >> + *     Framebuffer pixel source
> >> + *
> >> + * "COLOR":
> >> + *     Solid fill color pixel source
> >
> > Can we add a "NONE" value?
> >
> > I know it has been discussed earlier if we *need*  this and I don't
> > think we do. I just think it would be better API design to disable
> > planes this way than having to know that a framebuffer pixel source
> > with a NULL framebuffer disables the plane. Obviously also keep the
> > old behavior for backwards compatibility.
>
> Hi Sebastian,
>
> Sounds good.
>
> So if pixel_source =3D=3D NONE disables the planes, would that mean cases
> where pixel_source =3D=3D COLOR && solid_fill_blob =3D=3D NULL, the atomi=
c
> commit should throw an error?

I would say so, yes.

> Thanks,
>
> Jessica Zhang
>
> >
> >> + *
> >> + * Returns:
> >> + * Zero on success, negative errno on failure.
> >> + */
> >> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> >> +                                          unsigned int supported_sour=
ces)
> >> +{
> >> +       struct drm_device *dev =3D plane->dev;
> >> +       struct drm_property *prop;
> >> +       const struct drm_prop_enum_list enum_list[] =3D {
> >> +               { DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
> >> +               { DRM_PLANE_PIXEL_SOURCE_COLOR, "COLOR" },
> >> +       };
> >> +       unsigned int valid_source_mask =3D BIT(DRM_PLANE_PIXEL_SOURCE_=
FB) |
> >> +                                      BIT(DRM_PLANE_PIXEL_SOURCE_COLO=
R);
> >> +       int i;
> >> +
> >> +       /* FB is supported by default */
> >> +       supported_sources |=3D BIT(DRM_PLANE_PIXEL_SOURCE_FB);
> >> +
> >> +       if (WARN_ON(supported_sources & ~valid_source_mask))
> >> +               return -EINVAL;
> >> +
> >> +       prop =3D drm_property_create(dev, DRM_MODE_PROP_ENUM, "pixel_s=
ource",
> >> +                       hweight32(supported_sources));
> >> +
> >> +       if (!prop)
> >> +               return -ENOMEM;
> >> +
> >> +       for (i =3D 0; i < ARRAY_SIZE(enum_list); i++) {
> >> +               int ret;
> >> +
> >> +               if (!(BIT(enum_list[i].type) & supported_sources))
> >> +                       continue;
> >> +
> >> +               ret =3D drm_property_add_enum(prop, enum_list[i].type,=
 enum_list[i].name);
> >> +
> >> +               if (ret) {
> >> +                       drm_property_destroy(dev, prop);
> >> +
> >> +                       return ret;
> >> +               }
> >> +       }
> >> +
> >> +       drm_object_attach_property(&plane->base, prop, DRM_PLANE_PIXEL=
_SOURCE_FB);
> >> +       plane->pixel_source_property =3D prop;
> >> +
> >> +       return 0;
> >> +}
> >> +EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
> >> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> >> index 0338a860b9c8..31af7cfa5b1b 100644
> >> --- a/include/drm/drm_blend.h
> >> +++ b/include/drm/drm_blend.h
> >> @@ -59,4 +59,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev=
,
> >>   int drm_plane_create_blend_mode_property(struct drm_plane *plane,
> >>                                           unsigned int supported_modes=
);
> >>   int drm_plane_create_solid_fill_property(struct drm_plane *plane);
> >> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> >> +                                          unsigned int supported_sour=
ces);
> >>   #endif
> >> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> >> index f6ab313cb83e..73fb6cf8a5d9 100644
> >> --- a/include/drm/drm_plane.h
> >> +++ b/include/drm/drm_plane.h
> >> @@ -59,6 +59,12 @@ struct drm_solid_fill {
> >>          uint32_t b;
> >>   };
> >>
> >> +enum drm_plane_pixel_source {
> >> +       DRM_PLANE_PIXEL_SOURCE_FB,
> >> +       DRM_PLANE_PIXEL_SOURCE_COLOR,
> >> +       DRM_PLANE_PIXEL_SOURCE_MAX
> >> +};
> >> +
> >>   /**
> >>    * struct drm_plane_state - mutable plane state
> >>    *
> >> @@ -152,6 +158,14 @@ struct drm_plane_state {
> >>           */
> >>          struct drm_solid_fill solid_fill;
> >>
> >> +       /*
> >> +        * @pixel_source:
> >> +        *
> >> +        * Source of pixel information for the plane. See
> >> +        * drm_plane_create_pixel_source_property() for more details.
> >> +        */
> >> +       enum drm_plane_pixel_source pixel_source;
> >> +
> >>          /**
> >>           * @alpha:
> >>           * Opacity of the plane with 0 as completely transparent and =
0xffff as
> >> @@ -742,6 +756,13 @@ struct drm_plane {
> >>           */
> >>          struct drm_property *solid_fill_property;
> >>
> >> +       /*
> >> +        * @pixel_source_property:
> >> +        * Optional pixel_source property for this plane. See
> >> +        * drm_plane_create_pixel_source_property().
> >> +        */
> >> +       struct drm_property *pixel_source_property;
> >> +
> >>          /**
> >>           * @alpha_property:
> >>           * Optional alpha property for this plane. See
> >>
> >> --
> >> 2.41.0
> >>
> >
>

