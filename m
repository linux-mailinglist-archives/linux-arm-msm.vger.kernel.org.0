Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C21F77021B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 15:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbjHDNom (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 09:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbjHDNol (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 09:44:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74159CC
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 06:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691156639;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tpOIG5n3MxbFIH92Jg66Rf7F45WxAwd2M2vqn7RHptk=;
        b=DS55RchhPxNSdQwefm6uk27Ny3JBuP3r+iwhzXeH1U5bydgqG7Nf4yIS6mxLHSuh/CM8TL
        mqJl3vkH2z+kJwRrn4MJotgJCxJlrZone5yg2ZVHlCDwPLcFyd2YLb30E5Ra8Dtrch6cqk
        1ezorQn+69rayH6n4Fa0anoxVO6O77c=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-uoRCuK8OM0O1za9Di1TgXw-1; Fri, 04 Aug 2023 09:43:58 -0400
X-MC-Unique: uoRCuK8OM0O1za9Di1TgXw-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-4fe32cab9b7so2510004e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 06:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691156637; x=1691761437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpOIG5n3MxbFIH92Jg66Rf7F45WxAwd2M2vqn7RHptk=;
        b=k6VCERIme/8/QaqV22SSdj5yDYujrWlc4d8Y6kmoA7ci0rDtWS+1E3SKKROjjW9LOW
         Att37nfBsPFUjOlG9eMyk1LtGk6AwnvkROo3VaTcjg87zyE6pzBkB9cZiZmrNNsNr9p6
         wnrg2B1NBjdMh9NAiji6xasGmM+yFH4GlruTC5bkF+wN4t7l92iC96WxghY5FSrogb8N
         UAV7ElNOsmuNCxmImQh7hVMFmG4Uk2gyJ2yJ73bkfqVj+isQs3bhIUgvARF37w7Goni7
         +DMt347+O50VS57/EE6c8BnlNB0htHTZFhZqZnrIwDASyHLacuftG7/G+NuL05WFoTeV
         yl6Q==
X-Gm-Message-State: AOJu0YxhTBjUUWbfojUPCz92uf94WHpjTX6Krs6lvTVwOGrQARuz6W3W
        cSbcVH2Gdsroicqylwrv+IBtuJ9UAFiTHkZAM3Swrtp23hQiRK7TKUDgX8ZYjpkwxVCY6FgazDU
        CmwLrImjA64G3a9eM3NNJVaSYhLw60W5dPHPHvU9IRg==
X-Received: by 2002:a05:6512:2821:b0:4fb:bef0:948e with SMTP id cf33-20020a056512282100b004fbbef0948emr1624365lfb.5.1691156636883;
        Fri, 04 Aug 2023 06:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4TC7gMZF2ei8j5FBv3RQrBOVNN/MDvRv3kcEy9bNjf6yT6T+EyfwKjB1EnVg7s3ShGDE6vL7iyVUjtK3tb6k=
X-Received: by 2002:a05:6512:2821:b0:4fb:bef0:948e with SMTP id
 cf33-20020a056512282100b004fbbef0948emr1624343lfb.5.1691156636477; Fri, 04
 Aug 2023 06:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-2-053dbefa909c@quicinc.com> <CAA8EJpq=pbDoYc9wqKKrX+RahXp8zWTPFqVqA=S-0TkWXXJUjQ@mail.gmail.com>
In-Reply-To: <CAA8EJpq=pbDoYc9wqKKrX+RahXp8zWTPFqVqA=S-0TkWXXJUjQ@mail.gmail.com>
From:   Sebastian Wick <sebastian.wick@redhat.com>
Date:   Fri, 4 Aug 2023 15:43:45 +0200
Message-ID: <CA+hFU4y38MTTUsbri1jy=n4Vyp7xx2CosD9Nmk97z_au6NHCdQ@mail.gmail.com>
Subject: Re: [PATCH RFC v5 02/10] drm: Introduce solid fill DRM plane property
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        quic_abhinavk@quicinc.com, ppaalanen@gmail.com,
        contact@emersion.fr, laurent.pinchart@ideasonboard.com,
        ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 4, 2023 at 3:27=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 28 Jul 2023 at 20:03, Jessica Zhang <quic_jesszhan@quicinc.com> w=
rote:
> >
> > Document and add support for solid_fill property to drm_plane. In
> > addition, add support for setting and getting the values for solid_fill=
.
> >
> > To enable solid fill planes, userspace must assign a property blob to
> > the "solid_fill" plane property containing the following information:
> >
> > struct drm_mode_solid_fill {
> >         u32 version;
> >         u32 r, g, b;
> > };
> >
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
> >  drivers/gpu/drm/drm_atomic_uapi.c         | 55 +++++++++++++++++++++++=
++++++++
> >  drivers/gpu/drm/drm_blend.c               | 30 +++++++++++++++++
> >  include/drm/drm_blend.h                   |  1 +
> >  include/drm/drm_plane.h                   | 35 ++++++++++++++++++++
> >  include/uapi/drm/drm_mode.h               | 24 ++++++++++++++
> >  6 files changed, 154 insertions(+)
> >
>
> [skipped most of the patch]
>
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index 43691058d28f..53c8efa5ad7f 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -259,6 +259,30 @@ struct drm_mode_modeinfo {
> >         char name[DRM_DISPLAY_MODE_LEN];
> >  };
> >
> > +/**
> > + * struct drm_mode_solid_fill - User info for solid fill planes
> > + *
> > + * This is the userspace API solid fill information structure.
> > + *
> > + * Userspace can enable solid fill planes by assigning the plane "soli=
d_fill"
> > + * property to a blob containing a single drm_mode_solid_fill struct p=
opulated with an RGB323232
> > + * color and setting the pixel source to "SOLID_FILL".
> > + *
> > + * For information on the plane property, see drm_plane_create_solid_f=
ill_property()
> > + *
> > + * @version: Version of the blob. Currently, there is only support for=
 version =3D=3D 1
> > + * @r: Red color value of single pixel
> > + * @g: Green color value of single pixel
> > + * @b: Blue color value of single pixel
> > + */
> > +struct drm_mode_solid_fill {
> > +       __u32 version;
> > +       __u32 r;
> > +       __u32 g;
> > +       __u32 b;
>
> Another thought about the drm_mode_solid_fill uABI. I still think we
> should add alpha here. The reason is the following:
>
> It is true that we have  drm_plane_state::alpha and the plane's
> "alpha" property. However it is documented as "the plane-wide opacity
> [...] It can be combined with pixel alpha. The pixel values in the
> framebuffers are expected to not be pre-multiplied by the global alpha
> associated to the plane.".
>
> I can imagine a use case, when a user might want to enable plane-wide
> opacity, set "pixel blend mode" to "Coverage" and then switch between
> partially opaque framebuffer and partially opaque solid-fill without
> touching the plane's alpha value.

The only reason I see against this is that there might be some
hardware which supports only RGB but not alpha on planes and they
could then not use this property. Maybe another COLOR_FILL enum value
with alpha might be better? Maybe just doing the alpha via the alpha
property is good enough.

>
> --
> With best wishes
> Dmitry
>

