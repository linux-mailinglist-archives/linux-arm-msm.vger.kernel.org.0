Return-Path: <linux-arm-msm+bounces-4051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0812680AE31
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 21:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A00E1F21032
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 20:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DEB34567;
	Fri,  8 Dec 2023 20:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w7Htd6Gx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21C2198A
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 12:45:53 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5d8d2b5d1b5so21421287b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 12:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702068353; x=1702673153; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0vKUbaBuRmyEZ773mcKn2p9EzX3Yq0lLGYLN8opfog=;
        b=w7Htd6GxrzyCIPBKGq4PhMcGEgdIgHiWhQr6X6TnitwQdYVF6qTqgVO5YP3Sz/MZ4t
         taAYSyUTJtknGGMZo8/kvRfqtEy4ZOXRNYSw2dpT2U5RP9wX6OqPL+Wls1+QnjI2hl9a
         YGzsl/ib1FHhePMMo8cH8ndceDNzeoFWqD2esUuPeUXVXUxn1O+Zfy6KYrJMmhVnqJ2g
         lI3CL00soWAXhU8nB0wYkjWKddQ5l81BI7b+Y2Le51+cfWoXdKGY4DmYmh2FBUuWf1bO
         Sw37PCOz0s50vZw7fLfRFrxbhpSN9WdSjCnWUyw37poiL4ZG7VZzLRoOwDXn4J+tGTIa
         0JSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702068353; x=1702673153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0vKUbaBuRmyEZ773mcKn2p9EzX3Yq0lLGYLN8opfog=;
        b=L9+DZpptZ5z/md4fBhTxce5FHnOtKpw8cu0ZqFTagdrEpZkOa+v8QpZt7AoZ6obA5P
         4d+f0OICKCMVCPIUNz3kI4o6LEZy3eKNu8ZIO1dkiCnd6Vh4WSClhQLx0+xv+QDBor2C
         8ujXtByRAzsDHqS3rROHdZlalDpUoD/iG5bYKmkon0+Mo7W6p5so9BChe1n7Yb/ldkXI
         1SWk4cGaYpGGhR7vWhfDxGjS7TcstFRvhsRMCZu6ePc4mygUxMfslj71ZXNQMtmeUxHP
         rF3vx36BaC6FwJx8TVqoAFMPzEa7YwnhcojyD38k1/VJeoD/oWU0DbsJP710rDXOPMA2
         Vbcw==
X-Gm-Message-State: AOJu0Yyp+Yg0CtsOs3J2ZRE7rnqagYBhnCTeNrAd+Ks5ExslzVj4nsUL
	h81TYATIGB+98PWfk0TAH3piyPbW7aHJaWvh8xoFEeaqqDFiOl/i
X-Google-Smtp-Source: AGHT+IEIQblZWTzMCWqcghSl3cFYqUecZebO2V/3JbaZH3qcjo1rV4JCU0VusILo05pJOvruajlDCmwxIrxoY0Ic7BY=
X-Received: by 2002:a81:650a:0:b0:5d6:8d41:669c with SMTP id
 z10-20020a81650a000000b005d68d41669cmr489953ywb.6.1702068352774; Fri, 08 Dec
 2023 12:45:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-16-quic_abhinavk@quicinc.com> <CAA8EJpqfCfETawp1up76S6gryO+Q4KxPB3ThwZCe7DCkp=GkBQ@mail.gmail.com>
 <8eea4a8e-0c70-3768-79f0-1a2bfe083ed7@quicinc.com>
In-Reply-To: <8eea4a8e-0c70-3768-79f0-1a2bfe083ed7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 22:45:41 +0200
Message-ID: <CAA8EJpoLzgwEYRcSKZUY1W9KUE9s3WR_bzpA3hmf5X9JGDGutA@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] drm/msm/dpu: introduce separate wb2_format
 arrays for rgb and yuv
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, quic_jesszhan@quicinc.com, 
	quic_parellan@quicinc.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 19:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 12/8/2023 3:44 AM, Dmitry Baryshkov wrote:
> > On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> Lets rename the existing wb2_formats array wb2_formats_rgb to indicate
> >> that it has only RGB formats and can be used on any chipset having a WB
> >> block.
> >>
> >> Introduce a new wb2_formats_rgb_yuv array to the catalog to
> >> indicate support for YUV formats to writeback in addition to RGB.
> >>
> >> Chipsets which have support for CDM block will use the newly added
> >> wb2_formats_rgb_yuv array.
> >
> > This means that the catalog can go out of sync, if one adds a CDM
> > block but doesn't update wb_formats and vice versa.
> > Can we deduce the format list from the WB code? Is the format list
> > really static or does it change between platforms (please keep msm8996
> > / msm8998 in mind).
> >
>
> Yes this is a valid concern. catalog could potentially go out of sync.
>
> I checked a few chipsets now and the WB formats didnt change among them.
>
> I do need to check more chipsets but downstream does not maintain this
> in devicetree which means we can just move these arrays to WB code
> instead of maintaining them in the catalog.

I think we should be comparing to some of the oldest generations, like
msm8998/sdm660 or ideally even msm8996/37/17/53.

> We will still need to maintain two arrays. One to be used if CDM block
> has been added and the other if not.

Yes.

> I must confess one point though. I have not seen any chipset yet where
> WB block is present but CDM block is not.

I think this was the case for some of mdp5 1.x chips, but according to
my data this is correct for all the platforms that we want to support.

> So at this point, the only purpose of the two arrays will be till the
> point where CDM blk has been added to all the required chipsets in the
> catalog. Then we can drop the RGB only array and maintain the one which
> has all formats.
>
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   .../msm/disp/dpu1/catalog/dpu_10_0_sm8650.h   |  4 +-
> >>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  4 +-
> >>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  4 +-
> >>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  4 +-
> >>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  4 +-
> >>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 37 ++++++++++++++++++-
> >>   6 files changed, 46 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> >> index 04d2a73dd942..eb5dfff2ec4f 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> >> @@ -341,8 +341,8 @@ static const struct dpu_wb_cfg sm8650_wb[] = {
> >>                  .name = "wb_2", .id = WB_2,
> >>                  .base = 0x65000, .len = 0x2c8,
> >>                  .features = WB_SM8250_MASK,
> >> -               .format_list = wb2_formats,
> >> -               .num_formats = ARRAY_SIZE(wb2_formats),
> >> +               .format_list = wb2_formats_rgb,
> >> +               .num_formats = ARRAY_SIZE(wb2_formats_rgb),
> >>                  .xin_id = 6,
> >>                  .vbif_idx = VBIF_RT,
> >>                  .maxlinewidth = 4096,
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> >> index 58b0f50518c8..a57d50b1f028 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> >> @@ -336,8 +336,8 @@ static const struct dpu_wb_cfg sm8250_wb[] = {
> >>                  .name = "wb_2", .id = WB_2,
> >>                  .base = 0x65000, .len = 0x2c8,
> >>                  .features = WB_SM8250_MASK,
> >> -               .format_list = wb2_formats,
> >> -               .num_formats = ARRAY_SIZE(wb2_formats),
> >> +               .format_list = wb2_formats_rgb_yuv,
> >> +               .num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
> >>                  .clk_ctrl = DPU_CLK_CTRL_WB2,
> >>                  .xin_id = 6,
> >>                  .vbif_idx = VBIF_RT,
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> >> index bcfedfc8251a..7382ebb6e5b2 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> >> @@ -157,8 +157,8 @@ static const struct dpu_wb_cfg sc7180_wb[] = {
> >>                  .name = "wb_2", .id = WB_2,
> >>                  .base = 0x65000, .len = 0x2c8,
> >>                  .features = WB_SM8250_MASK,
> >> -               .format_list = wb2_formats,
> >> -               .num_formats = ARRAY_SIZE(wb2_formats),
> >> +               .format_list = wb2_formats_rgb,
> >> +               .num_formats = ARRAY_SIZE(wb2_formats_rgb),
> >>                  .clk_ctrl = DPU_CLK_CTRL_WB2,
> >>                  .xin_id = 6,
> >>                  .vbif_idx = VBIF_RT,
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >> index 19c2b7454796..2f153e0b5c6a 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >> @@ -169,8 +169,8 @@ static const struct dpu_wb_cfg sc7280_wb[] = {
> >>                  .name = "wb_2", .id = WB_2,
> >>                  .base = 0x65000, .len = 0x2c8,
> >>                  .features = WB_SM8250_MASK,
> >> -               .format_list = wb2_formats,
> >> -               .num_formats = ARRAY_SIZE(wb2_formats),
> >> +               .format_list = wb2_formats_rgb_yuv,
> >> +               .num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
> >>                  .clk_ctrl = DPU_CLK_CTRL_WB2,
> >>                  .xin_id = 6,
> >>                  .vbif_idx = VBIF_RT,
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> >> index bf56265967c0..ad48defa154f 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> >> @@ -315,8 +315,8 @@ static const struct dpu_wb_cfg sm8550_wb[] = {
> >>                  .name = "wb_2", .id = WB_2,
> >>                  .base = 0x65000, .len = 0x2c8,
> >>                  .features = WB_SM8250_MASK,
> >> -               .format_list = wb2_formats,
> >> -               .num_formats = ARRAY_SIZE(wb2_formats),
> >> +               .format_list = wb2_formats_rgb,
> >> +               .num_formats = ARRAY_SIZE(wb2_formats_rgb),
> >>                  .xin_id = 6,
> >>                  .vbif_idx = VBIF_RT,
> >>                  .maxlinewidth = 4096,
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> index 1be3156cde05..c52cac7a2288 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> @@ -202,7 +202,7 @@ static const u32 rotation_v2_formats[] = {
> >>          /* TODO add formats after validation */
> >>   };
> >>
> >> -static const uint32_t wb2_formats[] = {
> >> +static const uint32_t wb2_formats_rgb[] = {
> >>          DRM_FORMAT_RGB565,
> >>          DRM_FORMAT_BGR565,
> >>          DRM_FORMAT_RGB888,
> >> @@ -236,6 +236,41 @@ static const uint32_t wb2_formats[] = {
> >>          DRM_FORMAT_XBGR4444,
> >>   };
> >>
> >> +static const uint32_t wb2_formats_rgb_yuv[] = {
> >> +       DRM_FORMAT_RGB565,
> >> +       DRM_FORMAT_BGR565,
> >> +       DRM_FORMAT_RGB888,
> >> +       DRM_FORMAT_ARGB8888,
> >> +       DRM_FORMAT_RGBA8888,
> >> +       DRM_FORMAT_ABGR8888,
> >> +       DRM_FORMAT_XRGB8888,
> >> +       DRM_FORMAT_RGBX8888,
> >> +       DRM_FORMAT_XBGR8888,
> >> +       DRM_FORMAT_ARGB1555,
> >> +       DRM_FORMAT_RGBA5551,
> >> +       DRM_FORMAT_XRGB1555,
> >> +       DRM_FORMAT_RGBX5551,
> >> +       DRM_FORMAT_ARGB4444,
> >> +       DRM_FORMAT_RGBA4444,
> >> +       DRM_FORMAT_RGBX4444,
> >> +       DRM_FORMAT_XRGB4444,
> >> +       DRM_FORMAT_BGR565,
> >> +       DRM_FORMAT_BGR888,
> >> +       DRM_FORMAT_ABGR8888,
> >> +       DRM_FORMAT_BGRA8888,
> >> +       DRM_FORMAT_BGRX8888,
> >> +       DRM_FORMAT_XBGR8888,
> >> +       DRM_FORMAT_ABGR1555,
> >> +       DRM_FORMAT_BGRA5551,
> >> +       DRM_FORMAT_XBGR1555,
> >> +       DRM_FORMAT_BGRX5551,
> >> +       DRM_FORMAT_ABGR4444,
> >> +       DRM_FORMAT_BGRA4444,
> >> +       DRM_FORMAT_BGRX4444,
> >> +       DRM_FORMAT_XBGR4444,
> >> +       DRM_FORMAT_NV12,
> >> +};
> >> +
> >>   /*************************************************************
> >>    * SSPP sub blocks config
> >>    *************************************************************/
> >> --
> >> 2.40.1
> >>
> >
> >



-- 
With best wishes
Dmitry

