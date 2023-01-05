Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA7AA65E9F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 12:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbjAELdz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 06:33:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233227AbjAELdb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 06:33:31 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99ED611A27
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 03:33:28 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id bn26so16347108wrb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 03:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bmS4PAGHcVbGZlpkKy86Md90VMMV13dwm3OXcRRsgUM=;
        b=CHMVLVNjjjvnLzx8m5710t27TL0/V6f6c0eGy/sp48YPfI+6l7YXfXgbTJNMDbieoa
         76pQhFqmW6V5hQw++IL+fpkdVo398h6ZXSJPKdynoiUhUGQq0rdT4tgAm0cuvauLdWvL
         C2wBCufTvnCMblfNAAdC4jNnvxNQ5YYLiJ1/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmS4PAGHcVbGZlpkKy86Md90VMMV13dwm3OXcRRsgUM=;
        b=YeuBxmNBQ+h57jGNI+mWOG2QP/OTZQ9+ms0/s37GJKETIWsM5JE2b5iwmbcpMF7fn1
         uZBGrtsz6M1W+CowWmPDfRSC6h4mS92c6ipSqtiEZAqaIEGcuppl2cI4u1TAoAOkI7KP
         muwBb72goZE+o5XpjcXvlAKNe694nf2Q67P1mwL3ZWzMtBOF3kKlDDjNrPCFtbXW7iF8
         DwGibgRxxhJJ71yI7kOB+ezL8Bo6aa48alfZjNH3HuBRRn+cm/3Dd/I1O6UXDhuh2DbU
         TG9wREjX3a9pTwLxaJvCK0C1JAHSGfeuReTYySMS9ebf24V8zwAIqCsoP9E4SSZZiTMj
         W12A==
X-Gm-Message-State: AFqh2kodjVM2w4B/1sFAiN5nkV37x57f/a1jmetAxCbHCoW0SOQemriy
        Qq54/qSXjjypf1UvlFTcItCEKA==
X-Google-Smtp-Source: AMrXdXuVRuYY3YBW6EmjwRuOwr6fyV2psCV2g9MIXd0Lo7tdd6J2nfCKHwKAWUoY4YFL2qj9+3O7aw==
X-Received: by 2002:a5d:4e4a:0:b0:2a1:aa5f:8675 with SMTP id r10-20020a5d4e4a000000b002a1aa5f8675mr4901321wrt.31.1672918407211;
        Thu, 05 Jan 2023 03:33:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id e16-20020adfdbd0000000b002362f6fcaf5sm36245365wrj.48.2023.01.05.03.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 03:33:26 -0800 (PST)
Date:   Thu, 5 Jan 2023 12:33:24 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        dmitry.baryshkov@linaro.org, quic_abhinavk@quicinc.com,
        contact@emersion.fr, daniel.vetter@ffwll.ch,
        laurent.pinchart@ideasonboard.com, ppaalanen@gmail.com,
        sebastian.wick@redhat.com, wayland-devel@lists.freedesktop.org,
        ville.syrjala@linux.intel.com
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
Message-ID: <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104234036.636-1-quic_jesszhan@quicinc.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 04, 2023 at 03:40:33PM -0800, Jessica Zhang wrote:
> Introduce and add support for a solid_fill property. When the solid_fill
> property is set, and the framebuffer is set to NULL, memory fetch will be
> disabled.
> 
> In addition, loosen the NULL FB checks within the atomic commit callstack
> to allow a NULL FB when the solid_fill property is set and add FB checks
> in methods where the FB was previously assumed to be non-NULL.
> 
> Finally, have the DPU driver use drm_plane_state.solid_fill and instead of
> dpu_plane_state.color_fill, and add extra checks in the DPU atomic commit
> callstack to account for a NULL FB in cases where solid_fill is set.
> 
> Some drivers support hardware that have optimizations for solid fill
> planes. This series aims to expose these capabilities to userspace as
> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> hardware composer HAL) that can be set by apps like the Android Gears
> app.
> 
> Userspace can set the solid_fill property to a blob containing the
> appropriate version number and solid fill color (in RGB323232 format) and
> setting the framebuffer to NULL.
> 
> Note: Currently, there's only one version of the solid_fill blob property.
> However if other drivers want to support a similar feature, but require
> more than just the solid fill color, they can extend this feature by
> creating additional versions of the drm_solid_fill struct.
> 
> Changes in V2:
> - Dropped SOLID_FILL_FORMAT property (Simon)
> - Switched to implementing solid_fill property as a blob (Simon, Dmitry)
> - Changed to checks for if solid_fill_blob is set (Dmitry)
> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
>   (Dmitry)
> - Removed DPU_PLANE_COLOR_FILL_FLAG
> - Fixed whitespace and indentation issues (Dmitry)

Now that this is a blob, I do wonder again whether it's not cleaner to set
the blob as the FB pointer. Or create some kind other kind of special data
source objects (because solid fill is by far not the only such thing).

We'd still end up in special cases like when userspace that doesn't
understand solid fill tries to read out such a framebuffer, but these
cases already exist anyway for lack of priviledges.

So I still think that feels like the more consistent way to integrate this
feature. Which doesn't mean it has to happen like that, but the
patches/cover letter should at least explain why we don't do it like this.
-Daniel

> 
> Changes in V3:
> - Fixed some logic errors in atomic checks (Dmitry)
> - Introduced drm_plane_has_visible_data() and drm_atomic_check_fb() helper
>   methods (Dmitry)
> 
> Jessica Zhang (3):
>   drm: Introduce solid fill property for drm plane
>   drm: Adjust atomic checks for solid fill color
>   drm/msm/dpu: Use color_fill property for DPU planes
> 
>  drivers/gpu/drm/drm_atomic.c              | 136 +++++++++++++---------
>  drivers/gpu/drm/drm_atomic_helper.c       |  34 +++---
>  drivers/gpu/drm/drm_atomic_state_helper.c |   9 ++
>  drivers/gpu/drm/drm_atomic_uapi.c         |  59 ++++++++++
>  drivers/gpu/drm/drm_blend.c               |  17 +++
>  drivers/gpu/drm/drm_plane.c               |   8 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   9 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c |  65 +++++++----
>  include/drm/drm_atomic_helper.h           |   5 +-
>  include/drm/drm_blend.h                   |   1 +
>  include/drm/drm_plane.h                   |  62 ++++++++++
>  11 files changed, 302 insertions(+), 103 deletions(-)
> 
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
