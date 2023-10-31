Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C90E87DC809
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Oct 2023 09:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbjJaITi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Oct 2023 04:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbjJaITh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Oct 2023 04:19:37 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ACBDC1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Oct 2023 01:19:30 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a822f96aedso51513937b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Oct 2023 01:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698740369; x=1699345169; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xr08QYldhmln2QjJdXVDVvMGXlegG4AyHEpzWJW2wkk=;
        b=KEfCLvmEdaj0DFdzlpqbsKhpAQqYejo47QvXKDab16rE2HE8W1MeeNwgMz51lao9+G
         kSrHMMx/ED30P5J5rBCT3bmV8Y52ItQ/b0gwBZ6wriopuVtv/ot5z7zXgDqIppMIx1SH
         4O1fZxRwSxncp6yH75x34sgZ/EEEKnIhYK8f5+s5+WgMFzZvHbbJ+F82jTExGkNaOfTn
         9hoSiuG7X4hW0usH6ETIocD6Kx+UFkVMlg4T8d5MJk9qzawFKobXxaVd7fINgljgU+rn
         bMuj1S+Nl5wveSPWi2ibWd1l0hjlXKFUJ0dZhNpXnbbGcXMr6pFUPoIWElcUg0RM7dgE
         jFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698740369; x=1699345169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xr08QYldhmln2QjJdXVDVvMGXlegG4AyHEpzWJW2wkk=;
        b=FF3SGm6/NpYA481fFI1K5/Lpa+u4rEsf5y4FBBASr34L9qvvcgjuWDRoImeuiBc8NT
         J0IOqP75UVaKlw4OB5TwXrmTVkq1ZVhvVqGJU0fwc67YLy9W2QVcoP2cGpRHpg0RboSC
         t4NZl7Fd4ZPLBgOflrTf0BK3PqmZ+alG6hzYmlw2trflu8dsHQLeXxsucoHlpNC9D7Sg
         swK3XmuXpKx/LO/lUf2Vuj+r1cpsni97tupD5dia78Qg98aK2Bf1fsZS0oETR2+sUjy8
         LW4nSP4Xq3lp7P6XtUj/aVmPnCptJHYhNRvN0pWbkEACTMJb32LDuYjgSYVHQw/fPsYv
         WKJA==
X-Gm-Message-State: AOJu0Yz9aGC7J1jULGhHKbZ4GUt1MQnB+97hKRzuNkCqI+X7nKv0VSLL
        qGn7L25S6PzFhIPWh+r0fFOWQLPHfxPMededLo86Pg==
X-Google-Smtp-Source: AGHT+IH54Yf5q/xYgf4X4l3uKpmKCgK109l5WL/rQxro+ikkC/pb0jUJJxePZZgXlMEHG9DbwAI9boC+Jrf9KbHWBMc=
X-Received: by 2002:a81:ae62:0:b0:5a8:8f0d:db2d with SMTP id
 g34-20020a81ae62000000b005a88f0ddb2dmr12038746ywk.2.1698740369585; Tue, 31
 Oct 2023 01:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
 <20231006131450.2436688-10-dmitry.baryshkov@linaro.org> <c2f7733b-bfa3-a8a6-6909-5da26cd513af@quicinc.com>
In-Reply-To: <c2f7733b-bfa3-a8a6-6909-5da26cd513af@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 31 Oct 2023 10:19:18 +0200
Message-ID: <CAA8EJpr35LgyfNOcwiE0FgGR-CfS6b996HZk0tnQrVpOX99aRg@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3,
 QSEED3LITE, QSEED4
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 30 Oct 2023 at 22:24, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/6/2023 6:14 AM, Dmitry Baryshkov wrote:
> > Three different features, DPU_SSPP_SCALER_QSEED3, QSEED3LITE and QSEED4
> > are all related to different versions of the same HW scaling block.
> > Corresponding driver parts use scaler_blk.version to identify the
> > correct way to program the hardware. In order to simplify the driver
> > codepath, merge these three feature bits.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 +-----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 9 ++-------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 3 +--
> >   4 files changed, 6 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index 32c396abf877..eb867c8123d7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -31,10 +31,10 @@
> >       (VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
> >
> >   #define VIG_SC7180_MASK \
> > -     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
> > +     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
> >
> >   #define VIG_SM6125_MASK \
> > -     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
> > +     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
> >
>
> This merging is coming at a cost of inaccuracy. We are marking sc7180
> and sm6125 as scaler_qseed3. But they are not. Let me know what you
> think of below idea instead.
>
> >   #define VIG_SC7180_MASK_SDMA \
> >       (VIG_SC7180_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index fc5027b0123a..ba262b3f0bdc 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -51,9 +51,7 @@ enum {
> >   /**
> >    * SSPP sub-blocks/features
> >    * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support
> > - * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support
> > - * @DPU_SSPP_SCALER_QSEED3LITE,  QSEED3 Lite alogorithm support
> > - * @DPU_SSPP_SCALER_QSEED4,  QSEED4 algorithm support
> > + * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support (also QSEED3LITE and QSEED4)
> >    * @DPU_SSPP_SCALER_RGB,     RGB Scaler, supported by RGB pipes
> >    * @DPU_SSPP_CSC,            Support of Color space converion
> >    * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
> > @@ -72,8 +70,6 @@ enum {
> >   enum {
> >       DPU_SSPP_SCALER_QSEED2 = 0x1,
> >       DPU_SSPP_SCALER_QSEED3,
> > -     DPU_SSPP_SCALER_QSEED3LITE,
> > -     DPU_SSPP_SCALER_QSEED4,
> >       DPU_SSPP_SCALER_RGB,
> >       DPU_SSPP_CSC,
> >       DPU_SSPP_CSC_10BIT,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > index 7e9c87088e17..d1b70cf72eef 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > @@ -594,9 +594,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
> >               test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
> >               c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
> >
> > -     if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
> > -                     test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
> > -                     test_bit(DPU_SSPP_SCALER_QSEED4, &features))
> > +     if (test_bit(DPU_SSPP_SCALER_QSEED3, &features))
> >               c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
>
> Can we just do sblk->scaler_blk.version >= 0x3000 instead of this
> merging? That way you can still drop those enums without inaccuracy.

No. QSEED3 from sdm845 has version 1.3, msm8998, sdm660 and sdm630
have version 1.2.

>
> >
> >       if (test_bit(DPU_SSPP_CDP, &features))
> > @@ -629,10 +627,7 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
> >                       cfg->len,
> >                       kms);
> >
> > -     if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
> > -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
> > -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
> > -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
> > +     if (sblk->scaler_blk.len)
>
> This part seems fine.
>
> >               dpu_debugfs_create_regset32("scaler_blk", 0400,
> >                               debugfs_root,
> >                               sblk->scaler_blk.base + cfg->base,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 43135894263c..ba3ee4ba25b3 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -438,8 +438,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
> >                       scale_cfg->src_height[i] /= chroma_subsmpl_v;
> >               }
> >
> > -             if (pipe_hw->cap->features &
> > -                     BIT(DPU_SSPP_SCALER_QSEED4)) {
> > +             if (pipe_hw->cap->sblk->scaler_blk.version >= 0x3000) {
> This is fine too.
> >                       scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
> >                       scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
> >               } else {



-- 
With best wishes
Dmitry
