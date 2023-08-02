Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE6D76D6F6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 20:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjHBSjx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 14:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbjHBSjw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 14:39:52 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3E51BF0
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 11:39:50 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-56c96982829so47133eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 11:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691001590; x=1691606390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=haU7i7v25ac1CcQqTdM2/jDIKeY/5oFZ+LnWdM9648E=;
        b=lnFvofE/wYHei35mFlKi8Xf//VbtJKBGdqzrnyN9KaPWhwHqn1VK6tEyPQR1JqzGjo
         QHge13v5S/t1xw+ddkZGNOE34iaJ1EnHH2Sh5S/J7IxMyZlhLb3pj6xeo//daa5wkoSX
         Dv+NZPh2px1Q/fklxY+OagWSeCviVmnvp6BRnR3vbJz5KsCMSTv7SdOYR6A2U6HhS0ca
         N3YBLPnQA9el3v7MUY5FbR2Eqfp1r6QSfQgu7Sl/lkMYH6Hla/0EKpERAJQy5cCNhKdG
         DL3J6clr1Jdkx2zZO6xF8ry07fNhKX71OeB1lyIk+PxWeWqrbJ44Rd9s0r0encDhFP2T
         n/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691001590; x=1691606390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haU7i7v25ac1CcQqTdM2/jDIKeY/5oFZ+LnWdM9648E=;
        b=K1EDPADu+1VZOv5QFRfCIvE+WR+kV56YQpY3tPwvgIZoninR3MJdGySOL3EDYddOPM
         SoDcOI5KEfUPAO/30BL0+MtyiGyglVoTV290W11A/rjCgA24j/6nqrnZ3AL82yWYdoC5
         QOHVpU7AXjDIZgn9AY1/clSUXW+SI6b8FCPCbUmd/aIaBDu7uoZh1lLKkdLkxQY3qB0X
         /40glQAT4ytt1NInwjPl6PMW6bCze8gMFBjgvBWckWwe6vnQSXjC6jDorKBGbj1z5Gga
         1jOQU4orSnhY3sS7hCXuxroGSqHQcIRA6sJbxVXzVdM5AcqtbUdRG5szD3kg6lQyEF+R
         EinA==
X-Gm-Message-State: ABy/qLa//focEU+sr2YgAbgoPABcDlbF/b1mHxqMVq0c7ig+U/AdvnEX
        bB8Y9CowUkt7ShFfo1Ip06tbfLcStbudOEj1cj1KxQ==
X-Google-Smtp-Source: APBJJlFZV7qFYrarT7AAvLTE6+iQLBZszrYCKxyA/UNyRG6vAJP43Ba+1dHGGSlaT6+6Nu+eFuhIDK498fYoxPbhpyc=
X-Received: by 2002:a05:6358:6f8a:b0:134:ce27:223c with SMTP id
 s10-20020a0563586f8a00b00134ce27223cmr7027612rwn.27.1691001590159; Wed, 02
 Aug 2023 11:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 2 Aug 2023 21:39:39 +0300
Message-ID: <CAA8EJprY-MzO4S130VRqSavxOuB8d5tG-0yghEeY60niQysdMQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ryan McCann <quic_rmccann@quicinc.com>
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

On Wed, 2 Aug 2023 at 21:36, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block length.
> This includes the common block itself, enc subblocks and some empty
> space around. Change that to pass 0x4 instead, the length of common
> register block itself.
>
> Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
> Reported-by: Ryan McCann <quic_rmccann@quicinc.com>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Of course, it should have been v3, with the v2 having been sent on
July 8th. Confusion is the price of sending a series with no cover
letter. Please excuse me.

>
> Changes since v1:
>  - Rebased on top of the catalog changes
>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  8 ++++----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  8 ++++----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  8 ++++----
>  5 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index c906b6864b5e..f8d16f9bf528 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -283,22 +283,22 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
>  static const struct dpu_dsc_cfg sm8350_dsc[] = {
>         {
>                 .name = "dce_0_0", .id = DSC_0,
> -               .base = 0x80000, .len = 0x29c,
> +               .base = 0x80000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2),
>                 .sblk = &dsc_sblk_0,
>         }, {
>                 .name = "dce_0_1", .id = DSC_1,
> -               .base = 0x80000, .len = 0x29c,
> +               .base = 0x80000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2),
>                 .sblk = &dsc_sblk_1,
>         }, {
>                 .name = "dce_1_0", .id = DSC_2,
> -               .base = 0x81000, .len = 0x29c,
> +               .base = 0x81000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>                 .sblk = &dsc_sblk_0,
>         }, {
>                 .name = "dce_1_1", .id = DSC_3,
> -               .base = 0x81000, .len = 0x29c,
> +               .base = 0x81000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>                 .sblk = &dsc_sblk_1,
>         },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 2bf9f34e54c6..3b5061c4402a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -163,7 +163,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>  static const struct dpu_dsc_cfg sc7280_dsc[] = {
>         {
>                 .name = "dce_0_0", .id = DSC_0,
> -               .base = 0x80000, .len = 0x29c,
> +               .base = 0x80000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>                 .sblk = &dsc_sblk_0,
>         },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index ccd0477f4877..58f5e25679b1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -286,32 +286,32 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
>  static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
>         {
>                 .name = "dce_0_0", .id = DSC_0,
> -               .base = 0x80000, .len = 0x29c,
> +               .base = 0x80000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2),
>                 .sblk = &dsc_sblk_0,
>         }, {
>                 .name = "dce_0_1", .id = DSC_1,
> -               .base = 0x80000, .len = 0x29c,
> +               .base = 0x80000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2),
>                 .sblk = &dsc_sblk_1,
>         }, {
>                 .name = "dce_1_0", .id = DSC_2,
> -               .base = 0x81000, .len = 0x29c,
> +               .base = 0x81000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>                 .sblk = &dsc_sblk_0,
>         }, {
>                 .name = "dce_1_1", .id = DSC_3,
> -               .base = 0x81000, .len = 0x29c,
> +               .base = 0x81000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>                 .sblk = &dsc_sblk_1,
>         }, {
>                 .name = "dce_2_0", .id = DSC_4,
> -               .base = 0x82000, .len = 0x29c,
> +               .base = 0x82000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2),
>                 .sblk = &dsc_sblk_0,
>         }, {
>                 .name = "dce_2_1", .id = DSC_5,
> -               .base = 0x82000, .len = 0x29c,
> +               .base = 0x82000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2),
>                 .sblk = &dsc_sblk_1,
>         },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 2b2e9d4800f8..1b12178dfbca 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -305,22 +305,22 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
>  static const struct dpu_dsc_cfg sm8450_dsc[] = {
>         {
>                 .name = "dce_0_0", .id = DSC_0,
> -               .base = 0x80000, .len = 0x29c,
> +               .base = 0x80000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2),
>                 .sblk = &dsc_sblk_0,
>         }, {
>                 .name = "dce_0_1", .id = DSC_1,
> -               .base = 0x80000, .len = 0x29c,
> +               .base = 0x80000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2),
>                 .sblk = &dsc_sblk_1,
>         }, {
>                 .name = "dce_1_0", .id = DSC_2,
> -               .base = 0x81000, .len = 0x29c,
> +               .base = 0x81000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>                 .sblk = &dsc_sblk_0,
>         }, {
>                 .name = "dce_1_1", .id = DSC_3,
> -               .base = 0x81000, .len = 0x29c,
> +               .base = 0x81000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>                 .sblk = &dsc_sblk_1,
>         },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 833be1167499..f2ab02d04440 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -320,22 +320,22 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
>  static const struct dpu_dsc_cfg sm8550_dsc[] = {
>         {
>                 .name = "dce_0_0", .id = DSC_0,
> -               .base = 0x80000, .len = 0x29c,
> +               .base = 0x80000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2),
>                 .sblk = &dsc_sblk_0,
>         }, {
>                 .name = "dce_0_1", .id = DSC_1,
> -               .base = 0x80000, .len = 0x29c,
> +               .base = 0x80000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2),
>                 .sblk = &dsc_sblk_1,
>         }, {
>                 .name = "dce_1_0", .id = DSC_2,
> -               .base = 0x81000, .len = 0x29c,
> +               .base = 0x81000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>                 .sblk = &dsc_sblk_0,
>         }, {
>                 .name = "dce_1_1", .id = DSC_3,
> -               .base = 0x81000, .len = 0x29c,
> +               .base = 0x81000, .len = 0x4,
>                 .features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>                 .sblk = &dsc_sblk_1,
>         },
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
