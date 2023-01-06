Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99BD866067F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 19:41:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjAFSlf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 13:41:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbjAFSle (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 13:41:34 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECBA058833
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 10:41:32 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso4167211wmb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 10:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c07bHaLSKmBiOqJY8rgwXLQ5WTN3Pxi4bzCJ/GSn/gM=;
        b=QLPcCaDJq5/uEvmqB7qDUmoRPmaWLCOHw0HWAxKcqFfQdDIAWb/8ZjmEj/AfsJaAmV
         WsI9cb64kgzlxx7zrNFZ6Tos6h998azqjfLDjLegWXcq/bnASQ4tJqrKpBgWSIW4JLnh
         BiovGNQBb89ZokWPrC7+AMdKB//UrselhKH3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c07bHaLSKmBiOqJY8rgwXLQ5WTN3Pxi4bzCJ/GSn/gM=;
        b=YsRm8qMxedyfj19gNEyHGd3tevcI3asrI2sZGh8jixTJ63UTOw49fyNqQrCqcmNW/p
         qA+aNGzeDnIByuQioCU219Czo2f0t+AFgdS8YZYxFsYi8bFXPJglI4Tv8o7BqZ1SAnou
         OqR9uHnboe/KeMAT+xS5WBUcgYbgjX02lMEc2GJyI7l05jCP4drwnpQbOxGkBKl56e6P
         EFSVkjWE/RtdVH6N5Hh462Rsfh8vLra51PNn0EVJhg3fH8BcSemfmhHRixt3HIx0dinu
         woRqQqNHvJ3qVdTPtRoyqYJGxUv44uysfY3CRvPpZWxo2sXBwNqzTDl8C/oCHXo20mHE
         O0/w==
X-Gm-Message-State: AFqh2kpYQ0vNLAX35AfvS3TQZzzTUjjMvp7N9M9Wuwj3jm+JpETjfpyu
        aSuEJIT6itBp186y+LAegZYO3w==
X-Google-Smtp-Source: AMrXdXtER5plfyMNb7JNmJyudQYH8E45d2Fn30YgM+7oylC5086tPOdmOMDT1j3tU5wMs+o2prheLQ==
X-Received: by 2002:a05:600c:a0f:b0:3cf:7704:50ce with SMTP id z15-20020a05600c0a0f00b003cf770450cemr41156452wmp.38.1673030491541;
        Fri, 06 Jan 2023 10:41:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id az28-20020a05600c601c00b003cf57329221sm7100927wmb.14.2023.01.06.10.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 10:41:30 -0800 (PST)
Date:   Fri, 6 Jan 2023 19:41:28 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, contact@emersion.fr,
        daniel.vetter@ffwll.ch, laurent.pinchart@ideasonboard.com,
        ppaalanen@gmail.com, sebastian.wick@redhat.com,
        wayland-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
Message-ID: <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
 <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 06, 2023 at 05:43:23AM +0200, Dmitry Baryshkov wrote:
> On Fri, 6 Jan 2023 at 02:38, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >
> >
> >
> > On 1/5/2023 3:33 AM, Daniel Vetter wrote:
> > > On Wed, Jan 04, 2023 at 03:40:33PM -0800, Jessica Zhang wrote:
> > >> Introduce and add support for a solid_fill property. When the solid_fill
> > >> property is set, and the framebuffer is set to NULL, memory fetch will be
> > >> disabled.
> > >>
> > >> In addition, loosen the NULL FB checks within the atomic commit callstack
> > >> to allow a NULL FB when the solid_fill property is set and add FB checks
> > >> in methods where the FB was previously assumed to be non-NULL.
> > >>
> > >> Finally, have the DPU driver use drm_plane_state.solid_fill and instead of
> > >> dpu_plane_state.color_fill, and add extra checks in the DPU atomic commit
> > >> callstack to account for a NULL FB in cases where solid_fill is set.
> > >>
> > >> Some drivers support hardware that have optimizations for solid fill
> > >> planes. This series aims to expose these capabilities to userspace as
> > >> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> > >> hardware composer HAL) that can be set by apps like the Android Gears
> > >> app.
> > >>
> > >> Userspace can set the solid_fill property to a blob containing the
> > >> appropriate version number and solid fill color (in RGB323232 format) and
> > >> setting the framebuffer to NULL.
> > >>
> > >> Note: Currently, there's only one version of the solid_fill blob property.
> > >> However if other drivers want to support a similar feature, but require
> > >> more than just the solid fill color, they can extend this feature by
> > >> creating additional versions of the drm_solid_fill struct.
> > >>
> > >> Changes in V2:
> > >> - Dropped SOLID_FILL_FORMAT property (Simon)
> > >> - Switched to implementing solid_fill property as a blob (Simon, Dmitry)
> > >> - Changed to checks for if solid_fill_blob is set (Dmitry)
> > >> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
> > >>    (Dmitry)
> > >> - Removed DPU_PLANE_COLOR_FILL_FLAG
> > >> - Fixed whitespace and indentation issues (Dmitry)
> > >
> > > Now that this is a blob, I do wonder again whether it's not cleaner to set
> > > the blob as the FB pointer. Or create some kind other kind of special data
> > > source objects (because solid fill is by far not the only such thing).
> > >
> > > We'd still end up in special cases like when userspace that doesn't
> > > understand solid fill tries to read out such a framebuffer, but these
> > > cases already exist anyway for lack of priviledges.
> > >
> > > So I still think that feels like the more consistent way to integrate this
> > > feature. Which doesn't mean it has to happen like that, but the
> > > patches/cover letter should at least explain why we don't do it like this.
> >
> > Hi Daniel,
> >
> > IIRC we were facing some issues with this check [1] when trying to set
> > FB to a PROP_BLOB instead. Which is why we went with making it a
> > separate property instead. Will mention this in the cover letter.
> 
> What kind of issues? Could you please describe them?

We switched from bitmask to enum style for prop types, which means it's
not possible to express with the current uapi a property which accepts
both an object or a blob.

Which yeah sucks a bit ...

But!

blob properties are kms objects (like framebuffers), so it should be
possible to stuff a blob into an object property as-is. Of course you need
to update the validation code to make sure we accept either an fb or a
blob for the internal representation. But that kind of split internally is
required no matter what I think.
-Daniel

> 
> >
> > [1]
> > https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_property.c#L71
> >
> > Thanks,
> >
> > Jessica Zhang
> >
> > > -Daniel
> > >
> > >>
> > >> Changes in V3:
> > >> - Fixed some logic errors in atomic checks (Dmitry)
> > >> - Introduced drm_plane_has_visible_data() and drm_atomic_check_fb() helper
> > >>    methods (Dmitry)
> > >>
> > >> Jessica Zhang (3):
> > >>    drm: Introduce solid fill property for drm plane
> > >>    drm: Adjust atomic checks for solid fill color
> > >>    drm/msm/dpu: Use color_fill property for DPU planes
> > >>
> > >>   drivers/gpu/drm/drm_atomic.c              | 136 +++++++++++++---------
> > >>   drivers/gpu/drm/drm_atomic_helper.c       |  34 +++---
> > >>   drivers/gpu/drm/drm_atomic_state_helper.c |   9 ++
> > >>   drivers/gpu/drm/drm_atomic_uapi.c         |  59 ++++++++++
> > >>   drivers/gpu/drm/drm_blend.c               |  17 +++
> > >>   drivers/gpu/drm/drm_plane.c               |   8 +-
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   9 +-
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c |  65 +++++++----
> > >>   include/drm/drm_atomic_helper.h           |   5 +-
> > >>   include/drm/drm_blend.h                   |   1 +
> > >>   include/drm/drm_plane.h                   |  62 ++++++++++
> > >>   11 files changed, 302 insertions(+), 103 deletions(-)
> > >>
> > >> --
> > >> 2.38.1
> > >>
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
