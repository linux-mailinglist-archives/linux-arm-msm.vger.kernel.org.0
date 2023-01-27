Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0EA67DD48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 06:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjA0F5N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 00:57:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjA0F5J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 00:57:09 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 936881E9E7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 21:57:08 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id b1so4737322ybn.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 21:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IAByUKUjpWIuJxw2ypNqi7acKeTB9rtbuLvK9M641Ts=;
        b=gjB0CNiJN2fEeLl2MltmMIYjX53sj8sN3FcRQsN09/gFGocOFS/B4QXUIQSSfE3wFI
         4aWDSth9GWVLu3+HARjaWSSMSk5rZkXUaEbNiQmsF+ols5Wbt1r/8PoYfXWWsq87w8PK
         8gDqKxBOUg0Em4fmNvLg/rXh9SR+o0BVcrVRObSyCwReLNCXCY5q574tRgitm+Z5b/tU
         eliN5722UopHIlfgwvbkX4OnerC4a4ZkYde8AzChoB7WSSZPk+t870P5K3doK2+DG+5Q
         mgTVnFCG+ahaAYADstC3KudbHO/ma2PgXUcq+xuhbkDZITtQKkaJGR3Fr7XRdsfogowu
         bqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAByUKUjpWIuJxw2ypNqi7acKeTB9rtbuLvK9M641Ts=;
        b=GItKKNBvO77AkVOfBNDvHyE5SdTe5DkjWX2lG4Ka5/BU831jk6sFwotIyDFK9zYk5j
         SisHjJ9fdougkY6Ce3G2L46egARLcdbGZNLiXlKYzv677yTsd4JzETPS1AcfbVPk5jwe
         L0fjVKICF2upXhCm1yFMr/de3C1gGECjq76op2Wj9CHAWAs7sJM/RRyjwneS+umJsNjp
         zNxrrP+pjTZrZBt9s4rBJTxY9wkokU1Isbup86h/VtNFZ+4U4lv7xELb5ogxvXThDa/J
         OhjTwtzs6zC/NsWY1AkF+40gRGPky5S1/+lSZ+qX0MgaKxdUDPPT4H+NzI7huSoGp48T
         mGjg==
X-Gm-Message-State: AFqh2kqmTUx5HnbtgVgmpsEF/OAHwmZ6OXJcITVkunySy4e6g2J7rah3
        tMS4PwmhlL8Ryot66HNi/eA2D+gPvJac8s8LmW+UXA==
X-Google-Smtp-Source: AMrXdXs3UIazZ5Tyf8HSmShgEkuet/MtA5ZelrqoXQur4I8425FoJWlG4R56lYnGUwuaQFYT+BpBM5zBXvsMZD/LV6o=
X-Received: by 2002:a5b:305:0:b0:709:9335:236e with SMTP id
 j5-20020a5b0305000000b007099335236emr3605309ybp.288.1674799027768; Thu, 26
 Jan 2023 21:57:07 -0800 (PST)
MIME-Version: 1.0
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-4-dmitry.baryshkov@linaro.org> <b72dabe3-4de2-7d9a-1fca-01edfc588529@quicinc.com>
In-Reply-To: <b72dabe3-4de2-7d9a-1fca-01edfc588529@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 27 Jan 2023 07:56:56 +0200
Message-ID: <CAA8EJpra7UOWeB=YK8Xy5+Ro3EqShOe3HJtavqU8FSPywoukdQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/27] drm/msm/dpu: move SSPP allocation to the RM
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 27 Jan 2023 at 01:29, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
> > Follow the example of all other hw blocks and initialize SSPP blocks in
> > Resource Manager.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 17 ++++-------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    | 22 ++++++++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h    | 12 ++++++++++++
> >   3 files changed, 38 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index e1cdd71716f0..e443799de2c1 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1275,8 +1275,6 @@ static void dpu_plane_destroy(struct drm_plane *plane)
> >               /* this will destroy the states as well */
> >               drm_plane_cleanup(plane);
> >
> > -             dpu_hw_sspp_destroy(pdpu->pipe_hw);
> > -
> We removed from here so the flow will be msm_drm_uninit calls
> drm_mode_config_cleanup() which will call kms->destroy() which shall
> call dpu_rm_destroy() where this will be released now right?

Yes. _dpu_kms_hw_destroy() calls dpu_rm_destroy(), which destroys all
RM-allocated objects.

>
>
> >               kfree(pdpu);
> >       }
> >   }
> > @@ -1482,14 +1480,10 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
> >       pdpu->pipe = pipe;
> >
> >       /* initialize underlying h/w driver */
> > -     pdpu->pipe_hw = dpu_hw_sspp_init(pipe, kms->mmio, kms->catalog);
> > -     if (IS_ERR(pdpu->pipe_hw)) {
> > -             DPU_ERROR("[%u]SSPP init failed\n", pipe);
> > -             ret = PTR_ERR(pdpu->pipe_hw);
> > +     pdpu->pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
> > +     if (!pdpu->pipe_hw || !pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
> > +             DPU_ERROR("[%u]SSPP is invalid\n", pipe);
>
> I know this was existing code but can there be a case where pipe_hw->cap
> exists but pipe_hw->cap->sblk doesnt?

There is none up to now, granted that SSPP has a lot of extra data in
sblk. However, as you said, it's an existing code. No need to change
it here. And it's good as a safety net.
Granted that SRC offset is always 0, we can safely drop the src_sblk
and always access it via main register space.

>
> >               goto clean_plane;
> > -     } else if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
> > -             DPU_ERROR("[%u]SSPP init returned invalid cfg\n", pipe);
> > -             goto clean_sspp;
> >       }
> >
> >       format_list = pdpu->pipe_hw->cap->sblk->format_list;
> > @@ -1499,7 +1493,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
> >                               format_list, num_formats,
> >                               supported_format_modifiers, type, NULL);
> >       if (ret)
> > -             goto clean_sspp;
> > +             goto clean_plane;
> >
> >       pdpu->catalog = kms->catalog;
> >
> > @@ -1532,9 +1526,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
> >                                       pipe, plane->base.id);
> >       return plane;
> >
> > -clean_sspp:
> > -     if (pdpu && pdpu->pipe_hw)
> > -             dpu_hw_sspp_destroy(pdpu->pipe_hw);
> >   clean_plane:
> >       kfree(pdpu);
> >       return ERR_PTR(ret);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index 73b3442e7467..0668009cc9ed 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -8,6 +8,7 @@
> >   #include "dpu_hw_lm.h"
> >   #include "dpu_hw_ctl.h"
> >   #include "dpu_hw_pingpong.h"
> > +#include "dpu_hw_sspp.h"
> >   #include "dpu_hw_intf.h"
> >   #include "dpu_hw_wb.h"
> >   #include "dpu_hw_dspp.h"
> > @@ -91,6 +92,9 @@ int dpu_rm_destroy(struct dpu_rm *rm)
> >       for (i = 0; i < ARRAY_SIZE(rm->hw_wb); i++)
> >               dpu_hw_wb_destroy(rm->hw_wb[i]);
> >
> > +     for (i = 0; i < ARRAY_SIZE(rm->hw_sspp); i++)
> > +             dpu_hw_sspp_destroy(rm->hw_sspp[i]);
> > +
> >       return 0;
> >   }
> >
> > @@ -255,6 +259,24 @@ int dpu_rm_init(struct dpu_rm *rm,
> >               rm->dsc_blks[dsc->id - DSC_0] = &hw->base;
> >       }
> >
> > +     for (i = 0; i < cat->sspp_count; i++) {
> > +             struct dpu_hw_sspp *hw;
> > +             const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
> > +
> > +             if (sspp->id < SSPP_NONE || sspp->id >= SSPP_MAX) {
> > +                     DPU_ERROR("skip intf %d with invalid id\n", sspp->id);
> > +                     continue;
> > +             }
> > +
> > +             hw = dpu_hw_sspp_init(sspp->id, mmio, cat);
> > +             if (IS_ERR(hw)) {
> > +                     rc = PTR_ERR(hw);
> > +                     DPU_ERROR("failed sspp object creation: err %d\n", rc);
> > +                     goto fail;
> > +             }
> > +             rm->hw_sspp[sspp->id - SSPP_NONE] = hw;
> > +     }
> > +
> >       return 0;
> >
> >   fail:
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > index 59de72b381f9..d62c2edb2460 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > @@ -21,6 +21,7 @@ struct dpu_global_state;
> >    * @hw_intf: array of intf hardware resources
> >    * @hw_wb: array of wb hardware resources
> >    * @dspp_blks: array of dspp hardware resources
> > + * @hw_sspp: array of sspp hardware resources
> >    */
> >   struct dpu_rm {
> >       struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
> > @@ -31,6 +32,7 @@ struct dpu_rm {
> >       struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
> >       struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
> >       struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
> > +     struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
> >   };
> >
> >   /**
> > @@ -108,5 +110,15 @@ static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum dpu_wb wb_
> >       return rm->hw_wb[wb_idx - WB_0];
> >   }
> >
> > +/**
> > + * dpu_rm_get_sspp - Return a struct dpu_hw_sspp instance given it's index.
> > + * @rm: DPU Resource Manager handle
> > + * @sspp_idx: SSPP index
> > + */
> > +static inline struct dpu_hw_sspp *dpu_rm_get_sspp(struct dpu_rm *rm, enum dpu_sspp sspp_idx)
> > +{
> > +     return rm->hw_sspp[sspp_idx - SSPP_NONE];
> > +}
> > +
> >   #endif /* __DPU_RM_H__ */
> >



-- 
With best wishes
Dmitry
