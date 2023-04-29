Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC30E6F25E8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Apr 2023 20:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbjD2Sss (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Apr 2023 14:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjD2Ssr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Apr 2023 14:48:47 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 734311FCA
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Apr 2023 11:48:46 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-54fe25c2765so19025897b3.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Apr 2023 11:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682794125; x=1685386125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9WfKV3S+55vdcT7DtgnFzqVHeEOhgU77sHHynaR2lMs=;
        b=hCwQ/F5YCZSPVvIc1Cr7d0P8mi8lj8uXLyxqj2mL/vW/vTIYSqH66Pzk+nnmmDBGK4
         w5yTwl5VorpSq0brQinYfkrdFWrrg3MGI/WFvJhAJSo+gpROozaAeSQy4GPiMXFTGjBF
         7ZPhGP5tforZ8IbKV15oziqYFX1WfXk75KJBV6fMArXDEW57XpG45xV5mSY3N31ewtk0
         iP/OyZOMiNwmdj8EYMqCFcdl5pJ3m8C4yI+WIuSFHeUx0wYAzUdZBLxBIy+nPH49dzor
         GUglBd57/c61nukLWJeuH3894myn5fc1r4Peds0cw8ohbr/bR2uTqpwFdhwmiIgcyT2b
         g0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682794125; x=1685386125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9WfKV3S+55vdcT7DtgnFzqVHeEOhgU77sHHynaR2lMs=;
        b=jSzf5ah9axkRN32ljV90ym3fmi42q9g9dirsuVlxcJvcpXvjJwjoGrZrzwVumwqB9P
         ZGiNKyh1E5Hz6/S4hVcoVzXNsP3AZOU9+TZwQkGX7I7UQ8BE3/gQEciyPeXlXw3ggiUm
         1YnptcClig5+avy925LCvoyqid4y8Nxz7+unO95luy+1/gsMuIhZR6H/YclyR7QSLypi
         hREMWcoAsN4G/VGNQLr5E9YvjOXhsSSbEZ/vUduQekICIoVJkNX58dTJ8OsrQNiVWxVd
         CfzbAS4hD2l9K3u1Bxf8f+nSOKph4YkTFnSC6omgYey7AHBrW+yD9pYCZd0wOMy54RWk
         hl4Q==
X-Gm-Message-State: AC+VfDwQka5QemFkvOB/cyXL5fswx/6u57koaoRaLXXPK6p4LqtIm2Ng
        sBUmdAvNNJbRef0BkOS3zTXdP0aI6/iwuJoTyiGI/w==
X-Google-Smtp-Source: ACHHUZ7Ni3R6uBUZ2y7fEdCQYDJn5tDjdGp4SbVgrHBV3wvqVSFqfxcMe3nbhO8E/PHsJrmtcrw7zdS1ToHqUBKn3ZI=
X-Received: by 2002:a81:8357:0:b0:54f:bb34:1a0 with SMTP id
 t84-20020a818357000000b0054fbb3401a0mr8510109ywf.33.1682794125676; Sat, 29
 Apr 2023 11:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230429024242.2613957-1-dmitry.baryshkov@linaro.org>
 <085c3b3a-1a29-7082-934d-497be5b050fd@quicinc.com> <5fbf2ba1-f8fd-1373-55f2-4eb3789bc5e7@linaro.org>
 <1c0f5c9d-f38e-a008-b950-e85a5eb94633@quicinc.com>
In-Reply-To: <1c0f5c9d-f38e-a008-b950-e85a5eb94633@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 29 Apr 2023 21:48:34 +0300
Message-ID: <CAA8EJpotuzEOWsrJcyjn+tFTed7KSamwbRm0JnQWqrAwXmr_LQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: drop unused SSPP sub-block information
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 29 Apr 2023 at 11:46, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/28/2023 9:30 PM, Dmitry Baryshkov wrote:
> > On 29/04/2023 07:29, Abhinav Kumar wrote:
> >>
> >>
> >> On 4/28/2023 7:42 PM, Dmitry Baryshkov wrote:
> >>> The driver  doesn't support hsic/memcolor, pcc and igc SSPP subblocks.
> >>> Drop corresponding definitions.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 --------
> >>>   1 file changed, 8 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>> index 3e92c2c66716..db6488a6929d 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>> @@ -384,10 +384,6 @@ struct dpu_caps {
> >>>    * @qseed_ver: qseed version
> >>>    * @scaler_blk:
> >>>    * @csc_blk:
> >>> - * @hsic:
> >>> - * @memcolor:
> >>> - * @pcc_blk:
> >>> - * @igc_blk:
> >>>    * @format_list: Pointer to list of supported formats
> >>>    * @num_formats: Number of supported formats
> >>>    * @virt_format_list: Pointer to list of supported formats for
> >>> virtual planes
> >>> @@ -404,10 +400,6 @@ struct dpu_sspp_sub_blks {
> >>>       u32 qseed_ver;
> >>>       struct dpu_scaler_blk scaler_blk;
> >>>       struct dpu_pp_blk csc_blk;
> >>> -    struct dpu_pp_blk hsic_blk;
> >>> -    struct dpu_pp_blk memcolor_blk;
> >>> -    struct dpu_pp_blk pcc_blk;
> >>> -    struct dpu_pp_blk igc_blk;
> >>
> >> I have included IGC in this patch
> >> https://patchwork.freedesktop.org/patch/534725/?series=117130&rev=1
> >>
> >> So that one can be dropped from this patch?
> >
> > It will get dropped while applying because of the conflict.
> >
>
> Knowing that its going to conflict, why not fix one of the patches now,
> preferably this one since I was handling GC/IGC together in that series.

Because it requires me to pull in additional patches into the dev
branch. No problem, I'll do it.

>
> >>
> >> Rest is fine.
> >>
> >>>       const u32 *format_list;
> >>>       u32 num_formats;
> >



-- 
With best wishes
Dmitry
