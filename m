Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0216D770176
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 15:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjHDN2G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 09:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbjHDN1u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 09:27:50 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485AE49FE
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 06:27:27 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d3522283441so2125608276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 06:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691155646; x=1691760446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KHLJDOJiwUWkkuzywwWoYlPRzSI59IdgN9uUprOdvS4=;
        b=Z7qvBF+9IToP1e/q3P9hlS+7O0IXRwa0ARz/Io+MFpJjfNDc7FrMMbOotL2DIhd/ap
         9ztcUB2AmlIP19tIK6wdNj8Fm76cgX/HdQL2fk32fogcS10I3f8bUbJ8koCBaJEiNSLx
         poRdXzMtO61sl9mKrxuLijV3ylKjadz3e60/KUWFU2VyAgb5gkuZN5dZZ+3PRoZh1sRr
         WNv5oCC80xRnmIRszdQxqiDaTbZNvonCFk+0K6E/l7yzyCFaP3y6HM43hUzjAKe/3iby
         c6PcYLzXLszErwpOXmrBSX7XUFsnOb7FLCsVNQAsomZ3ePfNgdVljv1BcoLZkfHsgN5H
         kZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691155646; x=1691760446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHLJDOJiwUWkkuzywwWoYlPRzSI59IdgN9uUprOdvS4=;
        b=KsnReBA7DdnjUB5FX32wTxqOSCvkkMqNscjSEjzDUVGYxedlBb2mK6OR/Zz6wLfX2D
         cQFWKWxxudePe0Imr3qQ4wexIUn/K2DAGIegNwwfoPQR1u4ElCog5rPWqY20P4F+izp+
         Rlg4exaI3omj4YTTfH405JRUZbMLaJJ3dvOK5MECnJLjihS2xtypH/3WpqCM/fE0wHcC
         djmThwmfr7pdcFSmcMPvjML5XQhYk39GmnUAXowsC1xqstIvU37JTCt9IKAoMAPO45AF
         qz46CpJNmUBAtCq3BMmG4KHAgXC0kF5EvbtgbTPg228DcwTDgipP0SG/iWY4eFMM78S5
         RarQ==
X-Gm-Message-State: AOJu0Yy+PynEePCnVgN/MH41ABaDgbP/mEUbRTs1ruq9BbztQiIo5xJ2
        EqCRUetXcPCMe4U6S/v9sDeIZQDPX+vLv5c996/chg==
X-Google-Smtp-Source: AGHT+IH/FkCb7HPuSlEj8WY7xZu96aprRMPxL508HzHepMyfCZw3IIVrIuzK2Gg61bdKuYZUdU7C21ajWfrLaeCdtMY=
X-Received: by 2002:a25:ae94:0:b0:d3b:e659:5331 with SMTP id
 b20-20020a25ae94000000b00d3be6595331mr1539504ybj.58.1691155646088; Fri, 04
 Aug 2023 06:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com> <20230728-solid-fill-v5-2-053dbefa909c@quicinc.com>
In-Reply-To: <20230728-solid-fill-v5-2-053dbefa909c@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 4 Aug 2023 16:27:15 +0300
Message-ID: <CAA8EJpq=pbDoYc9wqKKrX+RahXp8zWTPFqVqA=S-0TkWXXJUjQ@mail.gmail.com>
Subject: Re: [PATCH RFC v5 02/10] drm: Introduce solid fill DRM plane property
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        quic_abhinavk@quicinc.com, ppaalanen@gmail.com,
        contact@emersion.fr, laurent.pinchart@ideasonboard.com,
        sebastian.wick@redhat.com, ville.syrjala@linux.intel.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 28 Jul 2023 at 20:03, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Document and add support for solid_fill property to drm_plane. In
> addition, add support for setting and getting the values for solid_fill.
>
> To enable solid fill planes, userspace must assign a property blob to
> the "solid_fill" plane property containing the following information:
>
> struct drm_mode_solid_fill {
>         u32 version;
>         u32 r, g, b;
> };
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 55 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_blend.c               | 30 +++++++++++++++++
>  include/drm/drm_blend.h                   |  1 +
>  include/drm/drm_plane.h                   | 35 ++++++++++++++++++++
>  include/uapi/drm/drm_mode.h               | 24 ++++++++++++++
>  6 files changed, 154 insertions(+)
>

[skipped most of the patch]

> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 43691058d28f..53c8efa5ad7f 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -259,6 +259,30 @@ struct drm_mode_modeinfo {
>         char name[DRM_DISPLAY_MODE_LEN];
>  };
>
> +/**
> + * struct drm_mode_solid_fill - User info for solid fill planes
> + *
> + * This is the userspace API solid fill information structure.
> + *
> + * Userspace can enable solid fill planes by assigning the plane "solid_fill"
> + * property to a blob containing a single drm_mode_solid_fill struct populated with an RGB323232
> + * color and setting the pixel source to "SOLID_FILL".
> + *
> + * For information on the plane property, see drm_plane_create_solid_fill_property()
> + *
> + * @version: Version of the blob. Currently, there is only support for version == 1
> + * @r: Red color value of single pixel
> + * @g: Green color value of single pixel
> + * @b: Blue color value of single pixel
> + */
> +struct drm_mode_solid_fill {
> +       __u32 version;
> +       __u32 r;
> +       __u32 g;
> +       __u32 b;

Another thought about the drm_mode_solid_fill uABI. I still think we
should add alpha here. The reason is the following:

It is true that we have  drm_plane_state::alpha and the plane's
"alpha" property. However it is documented as "the plane-wide opacity
[...] It can be combined with pixel alpha. The pixel values in the
framebuffers are expected to not be pre-multiplied by the global alpha
associated to the plane.".

I can imagine a use case, when a user might want to enable plane-wide
opacity, set "pixel blend mode" to "Coverage" and then switch between
partially opaque framebuffer and partially opaque solid-fill without
touching the plane's alpha value.

-- 
With best wishes
Dmitry
