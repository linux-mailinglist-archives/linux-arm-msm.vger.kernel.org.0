Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B64FF743DC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 16:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjF3Ooq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 10:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbjF3Oon (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 10:44:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6513C2D
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 07:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688136223;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yvZD4FQLUnlXxffhuKkS+r9MjsWil0X++YtKAb3nCcE=;
        b=W3HPAfHUq+DX1yTzXTetu+/fKocj1Balwym1ycmPBSWaSFnQTSJE6W56lA/8FSOkcZY+Dh
        usldBVrivZhrdvMhqI9BoFXtu0MnWAIVqgDbU6MSHVW92C2ObTQWoOXALkCWN7M768L6uh
        gnE71zzp5+zmOSGpOeEMYzlFUoPtPPE=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-m7HEs2VmOtSbFfdN-qm-gA-1; Fri, 30 Jun 2023 10:43:41 -0400
X-MC-Unique: m7HEs2VmOtSbFfdN-qm-gA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2b6a443a179so19684231fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 07:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688136220; x=1690728220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvZD4FQLUnlXxffhuKkS+r9MjsWil0X++YtKAb3nCcE=;
        b=conkO+lgMtn/bAxAE33zTxBiZg8o84tfVaiE4GmvuzCuePJAdmiyGLmvs5A9EyOh/A
         rRkv7Rp3iI9RQv7dNhtgUkX7Dywrc1OORpdzL1BILPcC9Y5fCGE26VZm7Qm7jEQSpR49
         g2TG6qmyd/RH219qgXbP8HzdPqBl4kFCU86LCbHaPyAraCYnb/pyvWlEhOXV+/CTU6F7
         v9wsxy2AkPebRzeG+Q2suCihGdN4RGdqLjtlKhsXtXUQHnUIwrfRYjIH0J8BX30v0gFQ
         um2ehi/pPr4/vCeiUlnOfZz5AkQMnVzdQTTnHa/a+47O5CAY4KyqJWwsURtsZrSONyPG
         v8Yg==
X-Gm-Message-State: ABy/qLYc9wGSZcn0pi1CLYNrj9AnEOf+hIFuvN6HbIWFhdnV56mRjE0m
        Efe5LStQOoegvu0A5Oe04TZikhAnrZY2xVOSkdjvpqXDuRZNvgZXY2rZ0lR40u22SOjFq1s5fyT
        +RVCS3CKoub1h15nbbKPyH0I+gnfpxEVuuhW0HI1FZg==
X-Received: by 2002:a2e:9d85:0:b0:2b4:491d:8d53 with SMTP id c5-20020a2e9d85000000b002b4491d8d53mr2367320ljj.45.1688136220019;
        Fri, 30 Jun 2023 07:43:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEgavJUdH7duXmcvQQov4AnuZ/xKAK8K78lXzmvT3PMlaUqpytORSrTrORhmgww+lELxLy86zIdAbtBvvgepic=
X-Received: by 2002:a2e:9d85:0:b0:2b4:491d:8d53 with SMTP id
 c5-20020a2e9d85000000b002b4491d8d53mr2367287ljj.45.1688136219566; Fri, 30 Jun
 2023 07:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com> <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com>
In-Reply-To: <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com>
From:   Sebastian Wick <sebastian.wick@redhat.com>
Date:   Fri, 30 Jun 2023 16:43:28 +0200
Message-ID: <CA+hFU4zQFkbi8BjFdWDBDMPR7cC8UqJg0udu7MJYOFac1J8XsQ@mail.gmail.com>
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
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 30, 2023 at 2:26=E2=80=AFAM Jessica Zhang <quic_jesszhan@quicin=
c.com> wrote:
>
> Add support for pixel_source property to drm_plane and related
> documentation.
>
> This enum property will allow user to specify a pixel source for the
> plane. Possible pixel sources will be defined in the
> drm_plane_pixel_source enum.
>
> The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_FB and
> DRM_PLANE_PIXEL_SOURCE_COLOR. The default value is *_SOURCE_FB.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>  drivers/gpu/drm/drm_blend.c               | 81 +++++++++++++++++++++++++=
++++++
>  include/drm/drm_blend.h                   |  2 +
>  include/drm/drm_plane.h                   | 21 ++++++++
>  5 files changed, 109 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/=
drm_atomic_state_helper.c
> index fe14be2bd2b2..86fb876efbe6 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -252,6 +252,7 @@ void __drm_atomic_helper_plane_state_reset(struct drm=
_plane_state *plane_state,
>
>         plane_state->alpha =3D DRM_BLEND_ALPHA_OPAQUE;
>         plane_state->pixel_blend_mode =3D DRM_MODE_BLEND_PREMULTI;
> +       plane_state->pixel_source =3D DRM_PLANE_PIXEL_SOURCE_FB;
>
>         if (plane_state->solid_fill_blob) {
>                 drm_property_blob_put(plane_state->solid_fill_blob);
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index a28b4ee79444..6e59c21af66b 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -596,6 +596,8 @@ static int drm_atomic_plane_set_property(struct drm_p=
lane *plane,
>                 drm_property_blob_put(solid_fill);
>
>                 return ret;
> +       } else if (property =3D=3D plane->pixel_source_property) {
> +               state->pixel_source =3D val;
>         } else if (property =3D=3D plane->alpha_property) {
>                 state->alpha =3D val;
>         } else if (property =3D=3D plane->blend_mode_property) {
> @@ -671,6 +673,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane=
,
>         } else if (property =3D=3D plane->solid_fill_property) {
>                 *val =3D state->solid_fill_blob ?
>                         state->solid_fill_blob->base.id : 0;
> +       } else if (property =3D=3D plane->pixel_source_property) {
> +               *val =3D state->pixel_source;
>         } else if (property =3D=3D plane->alpha_property) {
>                 *val =3D state->alpha;
>         } else if (property =3D=3D plane->blend_mode_property) {
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 38c3c5d6453a..8c100a957ee2 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -189,6 +189,18 @@
>   *     solid_fill is set up with drm_plane_create_solid_fill_property().=
 It
>   *     contains pixel data that drivers can use to fill a plane.
>   *
> + * pixel_source:
> + *     pixel_source is set up with drm_plane_create_pixel_source_propert=
y().
> + *     It is used to toggle the source of pixel data for the plane.
> + *
> + *     Possible values:
> + *
> + *     "FB":
> + *             Framebuffer source
> + *
> + *     "COLOR":
> + *             solid_fill source
> + *
>   * Note that all the property extensions described here apply either to =
the
>   * plane or the CRTC (e.g. for the background color, which currently is =
not
>   * exposed and assumed to be black).
> @@ -648,3 +660,72 @@ int drm_plane_create_solid_fill_property(struct drm_=
plane *plane)
>         return 0;
>  }
>  EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
> +
> +/**
> + * drm_plane_create_pixel_source_property - create a new pixel source pr=
operty
> + * @plane: drm plane
> + * @supported_sources: bitmask of supported pixel_sources for the driver=
 (NOT
> + *                     including DRM_PLANE_PIXEL_SOURCE_FB, as it will b=
e supported
> + *                     by default).
> + *
> + * This creates a new property describing the current source of pixel da=
ta for the
> + * plane.
> + *
> + * The property is exposed to userspace as an enumeration property calle=
d
> + * "pixel_source" and has the following enumeration values:
> + *
> + * "FB":
> + *     Framebuffer pixel source
> + *
> + * "COLOR":
> + *     Solid fill color pixel source

Can we add a "NONE" value?

I know it has been discussed earlier if we *need*  this and I don't
think we do. I just think it would be better API design to disable
planes this way than having to know that a framebuffer pixel source
with a NULL framebuffer disables the plane. Obviously also keep the
old behavior for backwards compatibility.

> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> +                                          unsigned int supported_sources=
)
> +{
> +       struct drm_device *dev =3D plane->dev;
> +       struct drm_property *prop;
> +       const struct drm_prop_enum_list enum_list[] =3D {
> +               { DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
> +               { DRM_PLANE_PIXEL_SOURCE_COLOR, "COLOR" },
> +       };
> +       unsigned int valid_source_mask =3D BIT(DRM_PLANE_PIXEL_SOURCE_FB)=
 |
> +                                      BIT(DRM_PLANE_PIXEL_SOURCE_COLOR);
> +       int i;
> +
> +       /* FB is supported by default */
> +       supported_sources |=3D BIT(DRM_PLANE_PIXEL_SOURCE_FB);
> +
> +       if (WARN_ON(supported_sources & ~valid_source_mask))
> +               return -EINVAL;
> +
> +       prop =3D drm_property_create(dev, DRM_MODE_PROP_ENUM, "pixel_sour=
ce",
> +                       hweight32(supported_sources));
> +
> +       if (!prop)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(enum_list); i++) {
> +               int ret;
> +
> +               if (!(BIT(enum_list[i].type) & supported_sources))
> +                       continue;
> +
> +               ret =3D drm_property_add_enum(prop, enum_list[i].type, en=
um_list[i].name);
> +
> +               if (ret) {
> +                       drm_property_destroy(dev, prop);
> +
> +                       return ret;
> +               }
> +       }
> +
> +       drm_object_attach_property(&plane->base, prop, DRM_PLANE_PIXEL_SO=
URCE_FB);
> +       plane->pixel_source_property =3D prop;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index 0338a860b9c8..31af7cfa5b1b 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -59,4 +59,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>  int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>                                          unsigned int supported_modes);
>  int drm_plane_create_solid_fill_property(struct drm_plane *plane);
> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> +                                          unsigned int supported_sources=
);
>  #endif
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index f6ab313cb83e..73fb6cf8a5d9 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -59,6 +59,12 @@ struct drm_solid_fill {
>         uint32_t b;
>  };
>
> +enum drm_plane_pixel_source {
> +       DRM_PLANE_PIXEL_SOURCE_FB,
> +       DRM_PLANE_PIXEL_SOURCE_COLOR,
> +       DRM_PLANE_PIXEL_SOURCE_MAX
> +};
> +
>  /**
>   * struct drm_plane_state - mutable plane state
>   *
> @@ -152,6 +158,14 @@ struct drm_plane_state {
>          */
>         struct drm_solid_fill solid_fill;
>
> +       /*
> +        * @pixel_source:
> +        *
> +        * Source of pixel information for the plane. See
> +        * drm_plane_create_pixel_source_property() for more details.
> +        */
> +       enum drm_plane_pixel_source pixel_source;
> +
>         /**
>          * @alpha:
>          * Opacity of the plane with 0 as completely transparent and 0xff=
ff as
> @@ -742,6 +756,13 @@ struct drm_plane {
>          */
>         struct drm_property *solid_fill_property;
>
> +       /*
> +        * @pixel_source_property:
> +        * Optional pixel_source property for this plane. See
> +        * drm_plane_create_pixel_source_property().
> +        */
> +       struct drm_property *pixel_source_property;
> +
>         /**
>          * @alpha_property:
>          * Optional alpha property for this plane. See
>
> --
> 2.41.0
>

