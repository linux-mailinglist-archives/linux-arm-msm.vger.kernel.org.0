Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B10646E9BC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 20:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231744AbjDTSh0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 14:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbjDTShK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 14:37:10 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1DF4226
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 11:36:55 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-54fa9da5e5bso55008037b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 11:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682015814; x=1684607814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gMLQXffioKdqdlsr10PWmOvpByjdykaFy3D5eTNoMlo=;
        b=UERqT/RD61tAVcXvxQTe85SRbYFu4ngEuUICQX4Y5sD7hmRgWTc99YQOVvoZogS+qC
         Y6o34oMCiitrfPJCPl+QzL/TXiZdYJucKfDvIogx4SB+4nAfqidqqRs/pyloVDKlxj21
         /o4NGtRWOKRe7owbFq42zCP1/KYfUZoB9q5TsxaFYevsqJXLqJ6H1yK7rZ3UQJhQ3T7L
         dnn7xakdcr64Uh/wPhfXSP+GR4WaZjF0siFh2UzTdWFmX4qpWOokcVl1+KLWWvXB77zC
         rebXgZBRStZl0jNmSX6WQc9oBLs22cYuqqHOiPu5tRkJRvjzSZrCHNswX2gTxHI8vp91
         0JaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682015814; x=1684607814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMLQXffioKdqdlsr10PWmOvpByjdykaFy3D5eTNoMlo=;
        b=jpgjC5gqaHSEwzSJ75Plm9jTKf6pGk/Tl6mEBzAT2N9GS+PYi+wrukWITEHyh7wFRt
         VGJdWri88vWeJoTMgEkvuovjmyKM3fGHfln1Z4YsEJ//vpOXOWFy9O8Q6Hi+FMQ1cpsV
         oiI7ydYGWaHt1diNdSqK4HKOUymFAwJQMgE3bDt2EGRy1knMXUoswnA/J4DdTL61U4Mx
         Oviac4c1gdamCFuMuI4BSxieclCnDykoW5ik25BWH4zaXKAQozpg1UWJPtStmJ8fHdvJ
         iwbL/lemg13a7Qx775GADg5uYTUTuQHTXonSCb2AM9s42/8+GbAuyOe9eWXgX04cgaQe
         20Xg==
X-Gm-Message-State: AAQBX9f9aGkF0h6pTYXBkR1uweWKZL5ecp8t3VKGCR3dECCdvI1SlZ6C
        kmXOlrP2deqgBIHPgY+vklDoEabAsoI8d3N6MgPzWQ==
X-Google-Smtp-Source: AKy350bagNtr1E5AIAszLAho9LJNC15qc7f6rE3UdxQ7izmuhhry0i5iy1Hp2n5QhNSJJ9tLYC41/NcOEMQUU0iyT0g=
X-Received: by 2002:a81:8342:0:b0:541:85e1:3a87 with SMTP id
 t63-20020a818342000000b0054185e13a87mr1630041ywf.33.1682015814438; Thu, 20
 Apr 2023 11:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-3-d1bac46db075@freebox.fr> <09477ba6-52e0-f4de-fa8c-5afb66145b58@quicinc.com>
In-Reply-To: <09477ba6-52e0-f4de-fa8c-5afb66145b58@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 20 Apr 2023 21:36:43 +0300
Message-ID: <CAA8EJppALF2wZ6QPsHUDWsThHyKMELfwmJbh3neEnN8AHkzDwQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 03/11] drm/msm/dpu: use hsync/vsync polarity
 set by the encoder
To:     Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Cc:     Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 20 Apr 2023 at 21:01, Jeykumar Sankaran
<quic_jeykumar@quicinc.com> wrote:
>
>
>
> On 4/19/2023 7:41 AM, Arnaud Vrac wrote:
> > Do not override the hsync/vsync polarity passed by the encoder when
> > setting up intf timings. The same logic was used in both the encoder and
> > intf code to set the DP and DSI polarities, so those interfaces are not
> > impacted. However for HDMI, the polarities were overriden to static
> > values based on the vertical resolution, instead of using the actual
> > mode polarities.
> >
> Any idea why vres based static polarity override was in place? Hope you
> had tested HDMI resolutions with yres > and < than 720.

I think it migrated from the old fbdev, see [1].
Tthis easily causes issues with the DVI monitors, which have different
rules for hsync/vsync. I have observed this on other platforms.
In practice it was observed that EDID provides correct sync polarity,
so it is better to follow the EDID data. If for some reason EDID is
incorrect, DRM provides a way to override it.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/29c3d616bf3f89f13bbab46c58151ae7a3a79b98

>
> Jeykumar S.
>
> > Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 16 +++-------------
> >   1 file changed, 3 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > index 84ee2efa9c664..9f05417eb1213 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > @@ -104,7 +104,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> >       u32 active_h_start, active_h_end;
> >       u32 active_v_start, active_v_end;
> >       u32 active_hctl, display_hctl, hsync_ctl;
> > -     u32 polarity_ctl, den_polarity, hsync_polarity, vsync_polarity;
> > +     u32 polarity_ctl, den_polarity;
> >       u32 panel_format;
> >       u32 intf_cfg, intf_cfg2 = 0;
> >       u32 display_data_hctl = 0, active_data_hctl = 0;
> > @@ -191,19 +191,9 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> >       }
> >
> >       den_polarity = 0;
> > -     if (ctx->cap->type == INTF_HDMI) {
> > -             hsync_polarity = p->yres >= 720 ? 0 : 1;
> > -             vsync_polarity = p->yres >= 720 ? 0 : 1;
> > -     } else if (ctx->cap->type == INTF_DP) {
> > -             hsync_polarity = p->hsync_polarity;
> > -             vsync_polarity = p->vsync_polarity;
> > -     } else {
> > -             hsync_polarity = 0;
> > -             vsync_polarity = 0;
> > -     }
> >       polarity_ctl = (den_polarity << 2) | /*  DEN Polarity  */
> > -             (vsync_polarity << 1) | /* VSYNC Polarity */
> > -             (hsync_polarity << 0);  /* HSYNC Polarity */
> > +             (p->vsync_polarity << 1) | /* VSYNC Polarity */
> > +             (p->hsync_polarity << 0);  /* HSYNC Polarity */
> >
> >       if (!DPU_FORMAT_IS_YUV(fmt))
> >               panel_format = (fmt->bits[C0_G_Y] |
> >



-- 
With best wishes
Dmitry
