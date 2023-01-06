Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7D1665FA77
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 04:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbjAFDop (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 22:44:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230457AbjAFDoZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 22:44:25 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266C56E423
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 19:43:36 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-4a0d6cb12c5so7242887b3.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 19:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JEsTjNJVQDsSZ8QOj6qukGfsPbMSwGpsRqPchQGQyPc=;
        b=M7v2+kZrhHVh4TIFfRcuhHCps8bquSoibCqJOIKcsl5fCyT2xCL9ockbu5ZAB68AUn
         X3+cSAWgx2D6h30BIkYZILJuxNUMppOSVLKyxDkVCAkyq7UAn1eNvc+zbSWvZDqQ6/3O
         wW6YU1vbHSKXu9eS3mPC6E6VFxFe11JHX1gzGk7m84LM+6/B3/V2D+8fAhS3HE8Emsbb
         GdjsfNyM1CTEAt1VoNRvOzXQOqZpeb7tquScJpwvpNKhWAlnMAXR0qrw+XtejwU5XrUy
         etx4eFnIeXIe7JI7qKo48qfhHvnPRpgg03ryLCX/y+M+THUfrhdXrS+T7zIvlWTS9SLF
         I5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEsTjNJVQDsSZ8QOj6qukGfsPbMSwGpsRqPchQGQyPc=;
        b=X5Wu/ERGtCPDpi6RufOvise2EITRBObF/rgoST1LdzeM2DzSSAkOeqALuJo3zhgSMN
         Q1MBobw2RoF1fLFS4J2lyqtAuD5+wG4pjMe9WzxZLc+FaFkPCVASnlVkKc3qwcxQfmY0
         tvAvqxn480y6q8wdQD4MRjsifa+9pTZsg15n/n4zuvEu5hspkx6VIvrkjv3PEG65akyp
         eVwUJoNzz+2IbTQbatwL5fVBakAmh7wkFOn5wfDCxca28SVtN+03mYCSg9u/KB4GuOP2
         f2XG1uYFl42O8sdqGjxA7V14PSm2E7xuC9El1AFJG2HlWIhDwbXxLdbQMFbSzcbJ5Syg
         20hQ==
X-Gm-Message-State: AFqh2kppqPbhZ/HlZ1snM2oQ4xUeuPrSlkHwniuUVBrH5PTh0Mmm1yQm
        3vAcaNgHdVj3BAwsEVwNiSc5mUqGWkiTSWzSM2n15bzqN4XgBQ==
X-Google-Smtp-Source: AMrXdXvdTNmOI0wPfuf98BUEjbUDLpvXd/Rvgmo3E1ZTVrjetFxMdyLyO6+OsMPfX+cKZ9SdJm6NYNI59oOY9R4DSyk=
X-Received: by 2002:a05:690c:fd5:b0:4a4:7135:9214 with SMTP id
 dg21-20020a05690c0fd500b004a471359214mr2978765ywb.378.1672976615362; Thu, 05
 Jan 2023 19:43:35 -0800 (PST)
MIME-Version: 1.0
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local> <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
In-Reply-To: <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 6 Jan 2023 05:43:23 +0200
Message-ID: <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, contact@emersion.fr,
        daniel.vetter@ffwll.ch, laurent.pinchart@ideasonboard.com,
        ppaalanen@gmail.com, sebastian.wick@redhat.com,
        wayland-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 6 Jan 2023 at 02:38, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 1/5/2023 3:33 AM, Daniel Vetter wrote:
> > On Wed, Jan 04, 2023 at 03:40:33PM -0800, Jessica Zhang wrote:
> >> Introduce and add support for a solid_fill property. When the solid_fill
> >> property is set, and the framebuffer is set to NULL, memory fetch will be
> >> disabled.
> >>
> >> In addition, loosen the NULL FB checks within the atomic commit callstack
> >> to allow a NULL FB when the solid_fill property is set and add FB checks
> >> in methods where the FB was previously assumed to be non-NULL.
> >>
> >> Finally, have the DPU driver use drm_plane_state.solid_fill and instead of
> >> dpu_plane_state.color_fill, and add extra checks in the DPU atomic commit
> >> callstack to account for a NULL FB in cases where solid_fill is set.
> >>
> >> Some drivers support hardware that have optimizations for solid fill
> >> planes. This series aims to expose these capabilities to userspace as
> >> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> >> hardware composer HAL) that can be set by apps like the Android Gears
> >> app.
> >>
> >> Userspace can set the solid_fill property to a blob containing the
> >> appropriate version number and solid fill color (in RGB323232 format) and
> >> setting the framebuffer to NULL.
> >>
> >> Note: Currently, there's only one version of the solid_fill blob property.
> >> However if other drivers want to support a similar feature, but require
> >> more than just the solid fill color, they can extend this feature by
> >> creating additional versions of the drm_solid_fill struct.
> >>
> >> Changes in V2:
> >> - Dropped SOLID_FILL_FORMAT property (Simon)
> >> - Switched to implementing solid_fill property as a blob (Simon, Dmitry)
> >> - Changed to checks for if solid_fill_blob is set (Dmitry)
> >> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
> >>    (Dmitry)
> >> - Removed DPU_PLANE_COLOR_FILL_FLAG
> >> - Fixed whitespace and indentation issues (Dmitry)
> >
> > Now that this is a blob, I do wonder again whether it's not cleaner to set
> > the blob as the FB pointer. Or create some kind other kind of special data
> > source objects (because solid fill is by far not the only such thing).
> >
> > We'd still end up in special cases like when userspace that doesn't
> > understand solid fill tries to read out such a framebuffer, but these
> > cases already exist anyway for lack of priviledges.
> >
> > So I still think that feels like the more consistent way to integrate this
> > feature. Which doesn't mean it has to happen like that, but the
> > patches/cover letter should at least explain why we don't do it like this.
>
> Hi Daniel,
>
> IIRC we were facing some issues with this check [1] when trying to set
> FB to a PROP_BLOB instead. Which is why we went with making it a
> separate property instead. Will mention this in the cover letter.

What kind of issues? Could you please describe them?

>
> [1]
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_property.c#L71
>
> Thanks,
>
> Jessica Zhang
>
> > -Daniel
> >
> >>
> >> Changes in V3:
> >> - Fixed some logic errors in atomic checks (Dmitry)
> >> - Introduced drm_plane_has_visible_data() and drm_atomic_check_fb() helper
> >>    methods (Dmitry)
> >>
> >> Jessica Zhang (3):
> >>    drm: Introduce solid fill property for drm plane
> >>    drm: Adjust atomic checks for solid fill color
> >>    drm/msm/dpu: Use color_fill property for DPU planes
> >>
> >>   drivers/gpu/drm/drm_atomic.c              | 136 +++++++++++++---------
> >>   drivers/gpu/drm/drm_atomic_helper.c       |  34 +++---
> >>   drivers/gpu/drm/drm_atomic_state_helper.c |   9 ++
> >>   drivers/gpu/drm/drm_atomic_uapi.c         |  59 ++++++++++
> >>   drivers/gpu/drm/drm_blend.c               |  17 +++
> >>   drivers/gpu/drm/drm_plane.c               |   8 +-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   9 +-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c |  65 +++++++----
> >>   include/drm/drm_atomic_helper.h           |   5 +-
> >>   include/drm/drm_blend.h                   |   1 +
> >>   include/drm/drm_plane.h                   |  62 ++++++++++
> >>   11 files changed, 302 insertions(+), 103 deletions(-)
> >>
> >> --
> >> 2.38.1
> >>
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
With best wishes
Dmitry
