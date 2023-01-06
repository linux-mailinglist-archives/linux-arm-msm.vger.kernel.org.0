Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 123C06608EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 22:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjAFVts (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 16:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjAFVts (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 16:49:48 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED0A7CBC7
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 13:49:47 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id p188so3259222yba.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 13:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=daORM5azLSvNqEbm20aAyWdSOeJFRbH238ckKtg/tu0=;
        b=kbjLsiELG9KMAFBdCircvd1SwQx+ZLcbxd7GMJkn7ow3OkRoohiVtiWzt5xWPc8305
         hm3+Af2MOsrJC5YI8I2VbyRZjB6U/iavEUc38y0StRkKvvI4HgDsvfo5rkM3yn5Cw1Y1
         tenf6pITishRwZDyiQ5lEvtlUGgkkCHoXRYABNUNOBbWkwLLqJc+jkkGQ93WnZrF2Odb
         GbESVWI4lXdDqJ3YfI44HiXxSgtE1WVn67+Xl02CUuIixmhvYFI9Dmx2WIvq+I0dCSeR
         2wFieLsjf0QI9l6oq4cZy1xeGVmgxt8QnjDACV2l67Uqahgu3R9ymTgDH9SacWs0mmLx
         tJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=daORM5azLSvNqEbm20aAyWdSOeJFRbH238ckKtg/tu0=;
        b=phhd1J2zllMV47t5cdddfZRLhBaLMTV20ImExd4UO1n2UZrinGIXMEDgPB/0V1CEi4
         tNAZwCx8o3FK49WyRC1p8kc+hzhAQhcdwDVJYC1wzWIFE/FLBobsmcK1h37gRadJfH2T
         EfzaQWlAFYZnujIlesQR9t1JSJJe46BbwDf6gMwc4P3qDpjDlfbmxNPQD5Y23CJ2zOlm
         iGi3XvcMMv+ewgMJBNTJ31Of6UkR1NsBuJGIH6+jQssuvf4MgSkPgbUXICbucWl5Vh6B
         ejq6kcD6psFrHWuN3tF5GWv/hE3izIkgtrkRlzT+Wclk4geNO+l1v4hmvt5S3Frhg/LO
         X6Dg==
X-Gm-Message-State: AFqh2kop11bth5ZEqlbZaZprovFunYy/9dCEm5kEvJMCUb0SL4rTutr0
        lDcuw8906X6bq6GPAYPK50Pi2nbigDPUBEsROz142w==
X-Google-Smtp-Source: AMrXdXtTexTtbAdJnEAEoI95xNx4TvEDUwzxuwS70gRNai2lJrRrVcq78GJmRo8MkM/VWZXSoGPXx0JzLcctElTuWzs=
X-Received: by 2002:a25:b794:0:b0:723:5b57:cde9 with SMTP id
 n20-20020a25b794000000b007235b57cde9mr6884900ybh.194.1673041786342; Fri, 06
 Jan 2023 13:49:46 -0800 (PST)
MIME-Version: 1.0
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local> <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com> <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
In-Reply-To: <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 6 Jan 2023 23:49:34 +0200
Message-ID: <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
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

On Fri, 6 Jan 2023 at 20:41, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Jan 06, 2023 at 05:43:23AM +0200, Dmitry Baryshkov wrote:
> > On Fri, 6 Jan 2023 at 02:38, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> > >
> > >
> > >
> > > On 1/5/2023 3:33 AM, Daniel Vetter wrote:
> > > > On Wed, Jan 04, 2023 at 03:40:33PM -0800, Jessica Zhang wrote:
> > > >> Introduce and add support for a solid_fill property. When the solid_fill
> > > >> property is set, and the framebuffer is set to NULL, memory fetch will be
> > > >> disabled.
> > > >>
> > > >> In addition, loosen the NULL FB checks within the atomic commit callstack
> > > >> to allow a NULL FB when the solid_fill property is set and add FB checks
> > > >> in methods where the FB was previously assumed to be non-NULL.
> > > >>
> > > >> Finally, have the DPU driver use drm_plane_state.solid_fill and instead of
> > > >> dpu_plane_state.color_fill, and add extra checks in the DPU atomic commit
> > > >> callstack to account for a NULL FB in cases where solid_fill is set.
> > > >>
> > > >> Some drivers support hardware that have optimizations for solid fill
> > > >> planes. This series aims to expose these capabilities to userspace as
> > > >> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> > > >> hardware composer HAL) that can be set by apps like the Android Gears
> > > >> app.
> > > >>
> > > >> Userspace can set the solid_fill property to a blob containing the
> > > >> appropriate version number and solid fill color (in RGB323232 format) and
> > > >> setting the framebuffer to NULL.
> > > >>
> > > >> Note: Currently, there's only one version of the solid_fill blob property.
> > > >> However if other drivers want to support a similar feature, but require
> > > >> more than just the solid fill color, they can extend this feature by
> > > >> creating additional versions of the drm_solid_fill struct.
> > > >>
> > > >> Changes in V2:
> > > >> - Dropped SOLID_FILL_FORMAT property (Simon)
> > > >> - Switched to implementing solid_fill property as a blob (Simon, Dmitry)
> > > >> - Changed to checks for if solid_fill_blob is set (Dmitry)
> > > >> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
> > > >>    (Dmitry)
> > > >> - Removed DPU_PLANE_COLOR_FILL_FLAG
> > > >> - Fixed whitespace and indentation issues (Dmitry)
> > > >
> > > > Now that this is a blob, I do wonder again whether it's not cleaner to set
> > > > the blob as the FB pointer. Or create some kind other kind of special data
> > > > source objects (because solid fill is by far not the only such thing).
> > > >
> > > > We'd still end up in special cases like when userspace that doesn't
> > > > understand solid fill tries to read out such a framebuffer, but these
> > > > cases already exist anyway for lack of priviledges.
> > > >
> > > > So I still think that feels like the more consistent way to integrate this
> > > > feature. Which doesn't mean it has to happen like that, but the
> > > > patches/cover letter should at least explain why we don't do it like this.
> > >
> > > Hi Daniel,
> > >
> > > IIRC we were facing some issues with this check [1] when trying to set
> > > FB to a PROP_BLOB instead. Which is why we went with making it a
> > > separate property instead. Will mention this in the cover letter.
> >
> > What kind of issues? Could you please describe them?
>
> We switched from bitmask to enum style for prop types, which means it's
> not possible to express with the current uapi a property which accepts
> both an object or a blob.
>
> Which yeah sucks a bit ...
>
> But!
>
> blob properties are kms objects (like framebuffers), so it should be
> possible to stuff a blob into an object property as-is. Of course you need
> to update the validation code to make sure we accept either an fb or a
> blob for the internal representation. But that kind of split internally is
> required no matter what I think.

I checked your idea and notes from Jessica. So while we can pass blobs
to property objects, the prop_fb_id is created as an object property
with the type DRM_MODE_OBJECT_FB. Passing DRM_MODE_OBJECT_BLOB would
fail a check in drm_property_change_valid_get() ->
__drm_mode_object_find(). And I don't think that we should break the
existing validation code for this special case.

If you insist on using FB_ID for passing solid_fill information, I'd
ask you to reconsider using a 1x1 framebuffer. It would be fully
compatible with the existing userspace, which can then treat it
seamlessly.

> -Daniel
>
> >
> > >
> > > [1]
> > > https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_property.c#L71

-- 
With best wishes
Dmitry
