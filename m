Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50210688724
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 19:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbjBBSzc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 13:55:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbjBBSzc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 13:55:32 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D94C513D51
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 10:55:29 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id x139so3404772ybe.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 10:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2EWI+WBg5KY/9eCi61QYIZBem7bGrhAfYnGlEtJpAFI=;
        b=Dw7qrEWGpFp15mBZLZs6C86qx6GFsCQXU6WAvtfQYS7UK2xhXEAc2rT+x44cL/N6yd
         HYoLqlB8Zr8WoVrP04o5PnyzD0eKurd2s5vwrvgI1Ewa/GNdyXx90q9TqMbEkKR+NdZ1
         mji3M9qDakBri3GqYzsHKRzaPOvAjxZT4VASoV7YI8M6HJ1DpUC0idY81nL73H0n0L99
         YI2lm0qyvml/yYYS0AgFNSCCglwKvSbf+hy0HOIHBulKdKZFXcwBitvoC17D+QIywxPp
         HOL64wsh9+SEMfB0t3LtshJfAKyvnIV/1kAO7xaEAofyuUIZhB3a/dB//yBH+S/1oBIT
         36fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2EWI+WBg5KY/9eCi61QYIZBem7bGrhAfYnGlEtJpAFI=;
        b=Qh8bL5fdhTnP0JzPOWwl6VkZw5Ba+f0ddtS2G2eAONAYHBaccg7Vss6+gGFoKQ+u0r
         sT4921nAMnYyx+5N9a1AAozi2OO7ozrKRTF3djGlt4IKMg5vd3ykig9B6fTCJprGCsoB
         ulBlWxNOVvK80kjZC8CMPmiAoQAL0i1X42ZwvOtO7avCVefUtl1pVEG0FTkimnQHBE6t
         gbjE6mzl3G8WIq7A3Uh/Z9YnJ/OGBDlfY5Cat8tpu+e71dv0x6eB9M6t0fZcAhzVzNXB
         4ivxo2mm9HyBfqOf8Jo7wq7jgQBV4H2mXMvxfXCcY3GeLPkZZEnKP6EYcfalr5EGuOyU
         V2TA==
X-Gm-Message-State: AO0yUKWv/lXeG/aabf5bNkYAkxy4XtIZBYlW2uKXpW8G+PoDy0oDIKQQ
        qnbd60NjG9rzM84XcQaft9S0tk8gfzG2fuUz/cna0A==
X-Google-Smtp-Source: AK7set/NY/z6X5KSWcjD8qAD4d34Gvpc9VnyL15tUDULIyIUAqJLu8OzHj/CCiS5VbcQYWkKDiF4Ls92dsymeYB/j8k=
X-Received: by 2002:a25:b214:0:b0:709:9335:236e with SMTP id
 i20-20020a25b214000000b007099335236emr847700ybj.288.1675364129113; Thu, 02
 Feb 2023 10:55:29 -0800 (PST)
MIME-Version: 1.0
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-12-dmitry.baryshkov@linaro.org> <8a9ae8b1-dc2b-896e-353d-bb237fa0663e@quicinc.com>
In-Reply-To: <8a9ae8b1-dc2b-896e-353d-bb237fa0663e@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 2 Feb 2023 20:55:18 +0200
Message-ID: <CAA8EJpooKAiZfJqz3nYsHbJfNkqxGikNb7U5P3907+nUwoLiNA@mail.gmail.com>
Subject: Re: [PATCH v2 11/27] drm/msm/dpu: move stride programming to dpu_hw_sspp_setup_sourceaddress
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

Hi Abhinav,

On Thu, 2 Feb 2023 at 20:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
> > Move stride programming to dpu_hw_sspp_setup_sourceaddress(), so that
> > dpu_hw_sspp_setup_rects() programs only source and destination
> > rectangles.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Sorry but once again, I dont see a response to my comment
>
> https://patchwork.freedesktop.org/patch/473166/?series=99909&rev=1#comment_875313
>
> So let me repeat that here:
>
> "This separation is logically correct, but there is another codepath
> using this.
>
> _dpu_plane_color_fill() calls pdpu->pipe_hw->ops.setup_rects.
>
> So for solid fill, I presume that stride getting programmed is 0 as
> there is no buffer to fetch from.

Could you please verify with the HW team what should be the correct
stride programming for the solid fill? I'll have to check what is
being programmed ATM.

>
> But with this separation, we will miss re-programming stride and it will
> remain at the old value even for solid fil cases?
>
> You might want to add setup_sourceaddress call there? But that wont make
> sense either because for solid fill there is nothing to fetch from.
>
> Perhaps, another op for stride programming then?
> "
>
> Also, this is the second patch in the series where the previous comments
> were not resolved/responded to.
>
> Hope that this was not just another rebase without looking at the prior
> comments.

I might have missed some of the comments during the rebase, please
excuse me. There was no intent to ignore them.


>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 57 +++++++++++----------
> >   1 file changed, 29 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > index 176cd6dc9a69..2bd39c13d54d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > @@ -447,7 +447,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
> >   {
> >       struct dpu_hw_sspp *ctx = pipe->sspp;
> >       struct dpu_hw_blk_reg_map *c;
> > -     u32 src_size, src_xy, dst_size, dst_xy, ystride0, ystride1;
> > +     u32 src_size, src_xy, dst_size, dst_xy;
> >       u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
> >       u32 idx;
> >
> > @@ -478,44 +478,18 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
> >       dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
> >               drm_rect_width(&cfg->dst_rect);
> >
> > -     if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> > -             ystride0 = (cfg->layout.plane_pitch[0]) |
> > -                     (cfg->layout.plane_pitch[1] << 16);
> > -             ystride1 = (cfg->layout.plane_pitch[2]) |
> > -                     (cfg->layout.plane_pitch[3] << 16);
> > -     } else {
> > -             ystride0 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE0 + idx);
> > -             ystride1 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE1 + idx);
> > -
> > -             if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> > -                     ystride0 = (ystride0 & 0xFFFF0000) |
> > -                             (cfg->layout.plane_pitch[0] & 0x0000FFFF);
> > -                     ystride1 = (ystride1 & 0xFFFF0000)|
> > -                             (cfg->layout.plane_pitch[2] & 0x0000FFFF);
> > -             } else {
> > -                     ystride0 = (ystride0 & 0x0000FFFF) |
> > -                             ((cfg->layout.plane_pitch[0] << 16) &
> > -                              0xFFFF0000);
> > -                     ystride1 = (ystride1 & 0x0000FFFF) |
> > -                             ((cfg->layout.plane_pitch[2] << 16) &
> > -                              0xFFFF0000);
> > -             }
> > -     }
> > -
> >       /* rectangle register programming */
> >       DPU_REG_WRITE(c, src_size_off + idx, src_size);
> >       DPU_REG_WRITE(c, src_xy_off + idx, src_xy);
> >       DPU_REG_WRITE(c, out_size_off + idx, dst_size);
> >       DPU_REG_WRITE(c, out_xy_off + idx, dst_xy);
> > -
> > -     DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE0 + idx, ystride0);
> > -     DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
> >   }
> >
> >   static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
> >               struct dpu_hw_pipe_cfg *cfg)
> >   {
> >       struct dpu_hw_sspp *ctx = pipe->sspp;
> > +     u32 ystride0, ystride1;
> >       int i;
> >       u32 idx;
> >
> > @@ -537,6 +511,33 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
> >               DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
> >                               cfg->layout.plane_addr[2]);
> >       }
> > +
> > +     if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> > +             ystride0 = (cfg->layout.plane_pitch[0]) |
> > +                     (cfg->layout.plane_pitch[1] << 16);
> > +             ystride1 = (cfg->layout.plane_pitch[2]) |
> > +                     (cfg->layout.plane_pitch[3] << 16);
> > +     } else {
> > +             ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
> > +             ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
> > +
> > +             if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> > +                     ystride0 = (ystride0 & 0xFFFF0000) |
> > +                             (cfg->layout.plane_pitch[0] & 0x0000FFFF);
> > +                     ystride1 = (ystride1 & 0xFFFF0000)|
> > +                             (cfg->layout.plane_pitch[2] & 0x0000FFFF);
> > +             } else {
> > +                     ystride0 = (ystride0 & 0x0000FFFF) |
> > +                             ((cfg->layout.plane_pitch[0] << 16) &
> > +                              0xFFFF0000);
> > +                     ystride1 = (ystride1 & 0x0000FFFF) |
> > +                             ((cfg->layout.plane_pitch[2] << 16) &
> > +                              0xFFFF0000);
> > +             }
> > +     }
> > +
> > +     DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx, ystride0);
> > +     DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx, ystride1);
> >   }
> >
> >   static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,



-- 
With best wishes
Dmitry
