Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB646887B9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 20:45:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbjBBTpx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 14:45:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbjBBTpw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 14:45:52 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6258D61BF
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 11:45:50 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-520dad0a7d2so40730207b3.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 11:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7+D3VuHhE0GLQM94j3huvE8BMstAn428Idt0uwUFfaI=;
        b=SkHmtKrtY/Al/KXJIy3g3NBArnlesGj6rZAq9497R9RfCz0a+ht5enEXR+nHvzoZIp
         gSot5XBSiIT75mU3Cmb1xQ0sMljVCjP/uePL5ezIAqm1Ue6Fmh/KCrTkvwsB2ssYa5BZ
         pFWbqtODqdnZPZIW2yE93AvdOd3E66FYGc0TCA57wGlVYy3tgDk2jVaoJoj0coWzrNaU
         XdvCOmyyF1kY9gnbHgRWzBtVadZxY5i04F3mSoV7XpzZegwp1BQTftuja4gKQbqYayMx
         YOFqevy428Bb5zbS+9JcOcZzFhM6kZRgNyJl+tmvU0LP1xn/cJiMpnZoShZIWpxYWxhS
         KShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+D3VuHhE0GLQM94j3huvE8BMstAn428Idt0uwUFfaI=;
        b=1wEakcaTOBjh0udqkU8mZN3IFvWy3dFDLdbraZgGL/MuDxJa1xBgNRhisOLKbxIncW
         IxnWd3e/VYqxT8S0HD+tvTq7w/JmfXgTYmlTOcbpAqxd33+SfAbxM1Ong9siKtuPBWlz
         4rO4HRQHu5BkoZDkSMMneZDn7+3TNuFpCd5ag5n5gT/ZjSvKtfbyai+6+zYXw/0LN2DS
         uZEhg2jlp83j8DLpDA1k1vV5XEttgmpLrpsBzDk3pAV0jZBLqAqpV3JBipVEqPQX3w6A
         enJTxeDMubhBbL2/ZbM916xQocSjwLM1NcODNrM/iW5PzyAzdR01V3GaZsefjpfRqToz
         /VVQ==
X-Gm-Message-State: AO0yUKX6Xx4BeXQDqyvJ/7VS50KNSbIrV/IXUnZ8Ew2AdjAQeT0VMPYb
        jjm0XkwAWgffrYllEZ5tUYzHQsEdzOBocJUVtxjgkw==
X-Google-Smtp-Source: AK7set8dN9lZasfRqZHVZHhgUP5sDRWxfDRVHHnmPo8uW+yjl5MBxOAY46+bTs1BCofVnzRNGDMlaNaiwjQUoXcvroA=
X-Received: by 2002:a0d:dfd6:0:b0:51b:1df9:ebac with SMTP id
 i205-20020a0ddfd6000000b0051b1df9ebacmr857906ywe.138.1675367149530; Thu, 02
 Feb 2023 11:45:49 -0800 (PST)
MIME-Version: 1.0
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-13-dmitry.baryshkov@linaro.org> <77764494-8a74-8450-ac75-33d6de0b2f8d@quicinc.com>
In-Reply-To: <77764494-8a74-8450-ac75-33d6de0b2f8d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 2 Feb 2023 21:45:38 +0200
Message-ID: <CAA8EJpq4ybOQg-Mb5RM+dcrBbR+3WrWSgvd4d20C6NKa90C15Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/27] drm/msm/dpu: remove dpu_hw_fmt_layout from
 struct dpu_hw_pipe_cfg
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

On Thu, 2 Feb 2023 at 21:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
> > Remove dpu_hw_fmt_layout instance from struct dpu_hw_pipe_cfg, leaving
> > only src_rect and dst_rect. This way right and left pipes will have
> > separate dpu_hw_pipe_cfg isntances, while the layout is common to both
> > of them.
> >
>
> Sorry for not responding to this comment earlier.
>
> https://patchwork.freedesktop.org/patch/473168/?series=99909&rev=1#comment_875370
>
>  From the perspective of wide planes you are right that the layout is
> common but not true from smart DMA point of view.
>
> For wide planes, yes, its usually the same buffer with just the src_x
> being different but conceptually and even HW wise each rectangle of the
> smart DMA is capable of fetching from a different buffer.
>
>  From the pov, this decision of not having the dpu_hw_fmt_layout as part
> of dpu_hw_pipe_cfg seems incorrect to me.

Yes, each rectangle/pipe can fetch from a different buffer. However in
our use case the layout is not defined for each pipe. It is defined
for a plane, no matter how many pipes are used for the plane, since
the buffer is also defined per plane.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 30 ++++++++++-----------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 10 +++----
> >   3 files changed, 22 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > index 2bd39c13d54d..400d043f37fa 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > @@ -486,7 +486,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
> >   }
> >
> >   static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
> > -             struct dpu_hw_pipe_cfg *cfg)
> > +             struct dpu_hw_fmt_layout *layout)
> >   {
> >       struct dpu_hw_sspp *ctx = pipe->sspp;
> >       u32 ystride0, ystride1;
> > @@ -497,41 +497,41 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
> >               return;
> >
> >       if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> > -             for (i = 0; i < ARRAY_SIZE(cfg->layout.plane_addr); i++)
> > +             for (i = 0; i < ARRAY_SIZE(layout->plane_addr); i++)
> >                       DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx + i * 0x4,
> > -                                     cfg->layout.plane_addr[i]);
> > +                                     layout->plane_addr[i]);
> >       } else if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> >               DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx,
> > -                             cfg->layout.plane_addr[0]);
> > +                             layout->plane_addr[0]);
> >               DPU_REG_WRITE(&ctx->hw, SSPP_SRC2_ADDR + idx,
> > -                             cfg->layout.plane_addr[2]);
> > +                             layout->plane_addr[2]);
> >       } else {
> >               DPU_REG_WRITE(&ctx->hw, SSPP_SRC1_ADDR + idx,
> > -                             cfg->layout.plane_addr[0]);
> > +                             layout->plane_addr[0]);
> >               DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
> > -                             cfg->layout.plane_addr[2]);
> > +                             layout->plane_addr[2]);
> >       }
> >
> >       if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> > -             ystride0 = (cfg->layout.plane_pitch[0]) |
> > -                     (cfg->layout.plane_pitch[1] << 16);
> > -             ystride1 = (cfg->layout.plane_pitch[2]) |
> > -                     (cfg->layout.plane_pitch[3] << 16);
> > +             ystride0 = (layout->plane_pitch[0]) |
> > +                     (layout->plane_pitch[1] << 16);
> > +             ystride1 = (layout->plane_pitch[2]) |
> > +                     (layout->plane_pitch[3] << 16);
> >       } else {
> >               ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
> >               ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
> >
> >               if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> >                       ystride0 = (ystride0 & 0xFFFF0000) |
> > -                             (cfg->layout.plane_pitch[0] & 0x0000FFFF);
> > +                             (layout->plane_pitch[0] & 0x0000FFFF);
> >                       ystride1 = (ystride1 & 0xFFFF0000)|
> > -                             (cfg->layout.plane_pitch[2] & 0x0000FFFF);
> > +                             (layout->plane_pitch[2] & 0x0000FFFF);
> >               } else {
> >                       ystride0 = (ystride0 & 0x0000FFFF) |
> > -                             ((cfg->layout.plane_pitch[0] << 16) &
> > +                             ((layout->plane_pitch[0] << 16) &
> >                                0xFFFF0000);
> >                       ystride1 = (ystride1 & 0x0000FFFF) |
> > -                             ((cfg->layout.plane_pitch[2] << 16) &
> > +                             ((layout->plane_pitch[2] << 16) &
> >                                0xFFFF0000);
> >               }
> >       }
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > index c713343378aa..8dad52eb2a90 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > @@ -154,13 +154,11 @@ struct dpu_hw_pixel_ext {
> >
> >   /**
> >    * struct dpu_hw_pipe_cfg : Pipe description
> > - * @layout:    format layout information for programming buffer to hardware
> >    * @src_rect:  src ROI, caller takes into account the different operations
> >    *             such as decimation, flip etc to program this field
> >    * @dest_rect: destination ROI.
> >    */
> >   struct dpu_hw_pipe_cfg {
> > -     struct dpu_hw_fmt_layout layout;
> >       struct drm_rect src_rect;
> >       struct drm_rect dst_rect;
> >   };
> > @@ -243,10 +241,10 @@ struct dpu_hw_sspp_ops {
> >       /**
> >        * setup_sourceaddress - setup pipe source addresses
> >        * @pipe: Pointer to software pipe context
> > -      * @cfg: Pointer to pipe config structure
> > +      * @layout: format layout information for programming buffer to hardware
> >        */
> >       void (*setup_sourceaddress)(struct dpu_sw_pipe *ctx,
> > -                                 struct dpu_hw_pipe_cfg *cfg);
> > +                                 struct dpu_hw_fmt_layout *layout);
> >
> >       /**
> >        * setup_csc - setup color space coversion
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index cbff4dea8662..0d2a7170e0ab 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -471,21 +471,21 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
> >
> >   static void _dpu_plane_set_scanout(struct drm_plane *plane,
> >               struct dpu_plane_state *pstate,
> > -             struct dpu_hw_pipe_cfg *pipe_cfg,
> >               struct drm_framebuffer *fb)
> >   {
> >       struct dpu_plane *pdpu = to_dpu_plane(plane);
> >       struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
> >       struct msm_gem_address_space *aspace = kms->base.aspace;
> > +     struct dpu_hw_fmt_layout layout;
> >       int ret;
> >
> > -     ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
> > +     ret = dpu_format_populate_layout(aspace, fb, &layout);
> >       if (ret)
> >               DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
> >       else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
> >               trace_dpu_plane_set_scanout(&pstate->pipe,
> > -                                         &pipe_cfg->layout);
> > -             pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, pipe_cfg);
> > +                                         &layout);
> > +             pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, &layout);
> >       }
> >   }
> >
> > @@ -1134,7 +1134,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
> >
> >       memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
> >
> > -     _dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
> > +     _dpu_plane_set_scanout(plane, pstate, fb);
> >
> >       pstate->pending = true;
> >



-- 
With best wishes
Dmitry
