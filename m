Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E46867A2C8D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Sep 2023 02:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238494AbjIPAhE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 20:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239013AbjIPAgr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 20:36:47 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2142130DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 17:35:00 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-76de9c23e5cso174189885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 17:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694824498; x=1695429298; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HFOJ8pdAeD8MTBy9n9Ge0MvARanNoOSWMjdOjkGv6BY=;
        b=JSE81EaxQ6+yn+4hrqNcu/2h9TJ6dJnbxjXbCoaqyOdBOthX3NfJqly6dZRsIlptOO
         jXyv10W508a7bhFjonvoodpHWa5ipiR8xn5Kn+D9r6fQ1R+JkCjJ4eKYDrH2Vgx7JqXJ
         PgFCQjqG1d80oXGqjc3c//oWPLWg5jIGg9u8LpIEyg7QqpN4WcI34mavZJdJP/+FsBO9
         Q/sjajnnn1JOFxcpLZbZZWekSrjUQCDA7nwqV9s3mxySIJLTqxyr5k8pD9f6Q3jyKo1F
         HJPld0SoygJMzQ8N1FzYJ3a9gRWdQwLFgwHZYin24gGjajHkPpcAaB30iE0RNuetqD5c
         w8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824498; x=1695429298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFOJ8pdAeD8MTBy9n9Ge0MvARanNoOSWMjdOjkGv6BY=;
        b=w0S+sqDKQjoJPkSsEe96WmZWy7XUEVLzq07hPCBMxz1432nay6CoFX+/uBRKByTRz2
         aaEU3DfoM0Iarorb+bCG50ajelTQH3vqHFZ92aByjtUiwSvzM45JHBqdn+Iv8oVB/IOS
         oFZtI4fX31AGRcj6CCrpdHRcS7J94t4ei4w5HgQ1VwOwBmHDAmDdYaEIHErnJ69nZI83
         aw6F0YcYxDHLw8UwuwUdC/Kk8P/1MMi3yRvaHMTl0Pbt0Ac7K+4u4RZIuJpW3DSxLxCr
         0WnSLEXbIgTJdyFmNgjV+9YawTM26mlfTI60UbsazrcJFsRs30lXPD9aVvL6uUnJG1B1
         2kzQ==
X-Gm-Message-State: AOJu0Yx4rQtIS8XJpqhmt+rFYS3LRMAWB42CZKYnXc29t9ISFm+PEiQM
        /9LCtWnJTtBd8O6JSJOFG1xHFRghTIJ2jkr+8da+IXyReDGdsBmNTyHDMw7+
X-Google-Smtp-Source: AGHT+IEffMgx6tFl+GWPowmxEmTCgzRrov0K94NeZPVtL4UsaAvUY3zio7SwuEpYeOraMrnruj7Y2d64KYv3eHc4A3w=
X-Received: by 2002:a25:d08c:0:b0:d81:8507:dc51 with SMTP id
 h134-20020a25d08c000000b00d818507dc51mr3836354ybg.17.1694824031671; Fri, 15
 Sep 2023 17:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
 <20230911214521.787453-9-dmitry.baryshkov@linaro.org> <a2c778b0-43c4-3485-e7c6-e40484e451dc@quicinc.com>
In-Reply-To: <a2c778b0-43c4-3485-e7c6-e40484e451dc@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 16 Sep 2023 03:27:00 +0300
Message-ID: <CAA8EJpoi=XbbMUmnCcjiAWvSMoyNMOpGCQH94rQOxknL06c2KQ@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3,
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
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 16 Sept 2023 at 02:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 9/11/2023 2:45 PM, Dmitry Baryshkov wrote:
> > Three different features, DPU_SSPP_SCALER_QSEED3, QSEED3LITE and QSEED4
> > are all related to different versions of the same HW scaling block.
> > Corresponding driver parts use scaler_blk.version to identify the
> > correct way to program the hardware. In order to simplify the driver
> > codepath, merge these three feature bits.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> I am okay with some parts of this change but not all.
>
> Please see below.
>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 +-----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 9 ++-------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 4 +---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 3 +--
> >   5 files changed, 7 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index b37b4076e53a..67d66319a825 100644
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
> This is like a half-n-half solution. This is telling that SC7180 and
> SM6125 have a scaler blk version of 3.1 but are still qseed3. That gives
> a misleading picture.

I had the impression that unlike QSEED2 (which was an actual thing)
the the names qseed3 / qseed3lite / qseed4 are more related to the
userspace lib. From the hardware point of view there are different
scaler versions (of course), but they do not correspond to the
3/3lite/4 names. I might be wrong here.
Can you please recommend a better name for this block?

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
> >
> any reason we cannot replace this with sblk->scaler_blk.version >= 1.2?

Is there a scaler version for the QSEED2 and/or RGB scalers? I was not
sure, so I preferred to be explicit here.
Another option might be to use core revision here, limiting it to MDP >= 3.0

But we still need to distinguish QSEED3-and-later, QSEED2 and RGB scalers.

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
> >               dpu_debugfs_create_regset32("scaler_blk", 0400,
> >                               debugfs_root,
> >                               sblk->scaler_blk.base + cfg->base,
>
> This part LGTM.
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > index ca02f86c94ed..b157ed7da065 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > @@ -26,9 +26,7 @@ struct dpu_hw_sspp;
> >    */
> >   #define DPU_SSPP_SCALER (BIT(DPU_SSPP_SCALER_RGB) | \
> >                        BIT(DPU_SSPP_SCALER_QSEED2) | \
> > -                      BIT(DPU_SSPP_SCALER_QSEED3) | \
> > -                      BIT(DPU_SSPP_SCALER_QSEED3LITE) | \
> > -                      BIT(DPU_SSPP_SCALER_QSEED4))
> > +                      BIT(DPU_SSPP_SCALER_QSEED3))
> >
>
> I am not seeing DPU_SSPP_SCALER_RGB being set by any chipset in the
> catalog? So we can drop it in a separate change and then just use
> sblk->scaler_blk.len in the place of this macro and drop this macro.

It is a part of MSM8996 DPU support, see [1]

[1] https://patchwork.freedesktop.org/patch/555846/?series=123294&rev=1

>
> >   /*
> >    * Define all CSC feature bits in catalog
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index c2aaaded07ed..109355275ec5 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -438,8 +438,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
> >                       scale_cfg->src_height[i] /= chroma_subsmpl_v;
> >               }
> >
> > -             if (pipe_hw->cap->features &
> > -                     BIT(DPU_SSPP_SCALER_QSEED4)) {
> > +             if (pipe_hw->cap->sblk->scaler_blk.version >= 0x3000) {
> >                       scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
> >                       scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
> >               } else {
>
> This part LGTM.



-- 
With best wishes
Dmitry
