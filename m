Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E04E37CF597
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 12:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbjJSKqX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 06:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbjJSKqW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 06:46:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE5718A
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 03:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697712331;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ua/yfYpU7+zl1l3SSe5ziWE4vmE5rVSZxbl9iCkPeqA=;
        b=hyDsgoZpV6muSYB/kk3xG4/1q4jo6kVsdnAS2fUioTfiAp+hzbId7Zwuz8rBGZBV6znt2t
        Futqt3aUTRfZofI3ssheh54WXgUb5nC38KDJmKgl5NNeTtJwrsRbUmUcZ8PqJEFY6TuTX4
        1wuUuVK5hEeLQorCFbcDcdOd7lj5CRM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-hJsW-rQ4PsWV56r9agVN8A-1; Thu, 19 Oct 2023 06:45:30 -0400
X-MC-Unique: hJsW-rQ4PsWV56r9agVN8A-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-32172e3679bso4780222f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 03:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697712329; x=1698317129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ua/yfYpU7+zl1l3SSe5ziWE4vmE5rVSZxbl9iCkPeqA=;
        b=UXiMXQ8NXB7UndeE9I69mx2AygO3WgYfyYvCt6ABMiPRUAyeUCf3LTNl4B3XyOlvJc
         jFFgyCtAh6hVPFqhnS0u8lQynXhY41eBpEYxYBQ8UhgFvSiH0M/k/UtFEUYCCKV0iiKa
         /CiZM6F1vuiPq9+tFG6WUswitdVezQQFdf/RLnbxe1L8qEHufMtfCTTLohkeTR0GFPd5
         orHX/y9faSEM8109afButlBY59NCTZQ4pP4QY3ooA+0G5eNJ0IqyCsTwr4gJ9jSUwSzc
         8E/EQwpJrmQkox/exL9OQUsoLsfXN/14riIg1/392oz2tY+urDKNlfyRLwMQFglN95Lg
         o0iw==
X-Gm-Message-State: AOJu0YwJ+CTCKCV+fM0S/8Uz7VCT8ujrRqPju9rK8Sp8PSODtL5hJAxx
        8AqvFqdl4HWWpMpZAvVi6mXNMGPEd3OjQmsT683Ux9AZv6Vo0ataNb1z3kmVoLA2iuLsTy4TeAR
        gHvxwYq/792ssKXH6IygqrURrMA==
X-Received: by 2002:a5d:4f06:0:b0:31f:dc60:13b5 with SMTP id c6-20020a5d4f06000000b0031fdc6013b5mr1137633wru.25.1697712328757;
        Thu, 19 Oct 2023 03:45:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG25/eVk9iv4COKDv+qQlPbnnRO8EIl418/81iMMJYQzOMP8gUFG61SSFa31vdA9nVeHX3V5A==
X-Received: by 2002:a5d:4f06:0:b0:31f:dc60:13b5 with SMTP id c6-20020a5d4f06000000b0031fdc6013b5mr1137614wru.25.1697712328383;
        Thu, 19 Oct 2023 03:45:28 -0700 (PDT)
Received: from toolbox ([2001:9e8:89b6:9600:497b:a355:d2a9:2bb])
        by smtp.gmail.com with ESMTPSA id i11-20020a5d630b000000b00327bf4f2f14sm4172028wru.88.2023.10.19.03.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:45:28 -0700 (PDT)
Date:   Thu, 19 Oct 2023 12:45:26 +0200
From:   Sebastian Wick <sebastian.wick@redhat.com>
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        quic_abhinavk@quicinc.com, contact@emersion.fr,
        laurent.pinchart@ideasonboard.com, ville.syrjala@linux.intel.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH RFC v6 01/10] drm: Introduce pixel_source DRM plane
 property
Message-ID: <20231019104526.GA755220@toolbox>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-1-a820efcce852@quicinc.com>
 <20230829104816.19122c6d@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829104816.19122c6d@eldfell>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 29, 2023 at 10:48:16AM +0300, Pekka Paalanen wrote:
> On Mon, 28 Aug 2023 17:05:07 -0700
> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> 
> > Add support for pixel_source property to drm_plane and related
> > documentation. In addition, force pixel_source to
> > DRM_PLANE_PIXEL_SOURCE_FB in DRM_IOCTL_MODE_SETPLANE as to not break
> > legacy userspace.
> > 
> > This enum property will allow user to specify a pixel source for the
> > plane. Possible pixel sources will be defined in the
> > drm_plane_pixel_source enum.
> > 
> > Currently, the only pixel sources are DRM_PLANE_PIXEL_SOURCE_FB (the
> > default value) and DRM_PLANE_PIXEL_SOURCE_NONE.
> > 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
> >  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
> >  drivers/gpu/drm/drm_blend.c               | 90 +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/drm_plane.c               | 19 +++++--
> >  include/drm/drm_blend.h                   |  2 +
> >  include/drm/drm_plane.h                   | 21 ++++++++
> >  6 files changed, 133 insertions(+), 4 deletions(-)
> 
> ...
> 
> > diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> > index 6e74de833466..c3c57bae06b7 100644
> > --- a/drivers/gpu/drm/drm_blend.c
> > +++ b/drivers/gpu/drm/drm_blend.c
> > @@ -185,6 +185,21 @@
> >   *		 plane does not expose the "alpha" property, then this is
> >   *		 assumed to be 1.0
> >   *
> > + * pixel_source:
> > + *	pixel_source is set up with drm_plane_create_pixel_source_property().
> > + *	It is used to toggle the active source of pixel data for the plane.
> > + *	The plane will only display data from the set pixel_source -- any
> > + *	data from other sources will be ignored.
> > + *
> > + *	Possible values:
> > + *
> > + *	"NONE":
> > + *		No active pixel source.
> > + *		Committing with a NONE pixel source will disable the plane.
> > + *
> > + *	"FB":
> > + *		Framebuffer source set by the "FB_ID" property.
> > + *
> >   * Note that all the property extensions described here apply either to the
> >   * plane or the CRTC (e.g. for the background color, which currently is not
> >   * exposed and assumed to be black).
> 
> This UAPI:
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Thanks Jessica, same for me

Acked-by: Sebastian Wick <sebastian@sebastianwick.net>

> 
> 
> Thanks,
> pq


