Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19BF06B9A0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 16:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjCNPnE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 11:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbjCNPnD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 11:43:03 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D105C1816C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:42:29 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5416949b35aso186749287b3.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r2eydF/1OI43/2Qfy2ViK1gUkj+J848Ww0RP8NZLzkg=;
        b=CRM/UqAq5qfr1H0agZTquPf7F6XZuZziTHQKjqGa2GtNhGUA0uIqR4AonYy3BjkNxR
         Dn2x2pvh2jDuYX0/8HTrQ9QvEP1Bra13gN7RFFv0MO+ybviQOMHeA1t7tlVDaffhlCFb
         fpY6FBaKNbEOpr8FTpOCJTniJVqyBvnou6HfJcc2gGTbn9i1KEymDgKCmKDnAbgIfLAv
         Oo6aiBLVDCOmURKlhw5YBLvM0jZ14ygUriLyY/DytvNkZzhTy+IvSRl4c2fBgN8hrBBl
         iP2NhVkLmhgI2Wgf7iX4M82kSp5oPF/7PBGy/xzE8C6Htuu8pAszxxoN4RBTwbMHMOjB
         OxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2eydF/1OI43/2Qfy2ViK1gUkj+J848Ww0RP8NZLzkg=;
        b=MDRo1UAqhfNNv6mEusp6xUjvfhXGtYGWOZ0QTN2tLDMTcHXl65Mulw7i/0Nz7luBOK
         IivXLjX7BC86bfWQ7MUcoCGJ7LRYWJGaiDOE6bECAhtxGR3d/xDWKHIV+Jh3jG+4slw1
         vms4ReMhCHZFXyn70ZEPi8p0g0z27mC2x0oCONXa9ap413wNVIsOXpboqke6eqEdXwMg
         3E2C6hJeKhn5qT0FulYbKNrzvvuXjsXvjA97x/v5Y9zPTv4pSd+YIQd/c5fYSZX/5joP
         WMJxFkXJsvB4ob1/hx0PNljX03Du0oX/d2JrZt/K8EM3CSrVmfXiAHr+ZR8YEcoOMn9g
         /DLg==
X-Gm-Message-State: AO0yUKXmI7EqxaBHe8XAYj/1NGquYLYgLLnMMhQMVU4Xp59mX8L4G1W0
        TQH+usKXEkQvrmkuA0jwf22WWkYnc2075mEadvkhOQ==
X-Google-Smtp-Source: AK7set9v/eRM4FHR0LXUi+liNzAoAGgf5LamjGr4AG1H13f4k9tvPJTy1x7RYWvaReVp2v+ylEUat+sM+RsbXH7uYuY=
X-Received: by 2002:a81:ac16:0:b0:541:6d4c:9276 with SMTP id
 k22-20020a81ac16000000b005416d4c9276mr7853585ywh.5.1678808513389; Tue, 14 Mar
 2023 08:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org> <20230314153545.3442879-28-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230314153545.3442879-28-dmitry.baryshkov@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 14 Mar 2023 17:41:42 +0200
Message-ID: <CAA8EJpqTT1BK5oDNbL=t8BMwVjK_swDdD-L4o2PZ2Zec09qSnQ@mail.gmail.com>
Subject: Re: [PATCH v6 27/32] drm/msm/dpu: add support for wide planes
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Mar 2023 at 17:36, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> It is possible to use multirect feature and split source to use the SSPP
> to output two consecutive rectangles. This commit brings in this
> capability to support wider screen resolutions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  19 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 127 +++++++++++++++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   4 +
>  3 files changed, 133 insertions(+), 17 deletions(-)
>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index f52120b05b6e..494c1144075a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c

[...]

> @@ -1016,21 +1026,58 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>                 return -E2BIG;
>         }
>
> +       fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> +
>         max_linewidth = pdpu->catalog->caps->max_linewidth;
> +       if (DPU_FORMAT_IS_UBWC(fmt))
> +               max_linewidth /= 2;

I added this check and only after sending it caught my mind that this
check should not be applied in the non-multirec case. Please ignore
the series, I will resend it later.

>
> -       /* check decimated source width */
>         if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
> -               DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> -                               DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> -               return -E2BIG;
> -       }
> +               if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> +                       DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> +                                       DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> +                       return -E2BIG;
> +               }
>

[skipped the rest]

-- 
With best wishes
Dmitry
