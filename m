Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 283A2730F4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 08:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbjFOG2h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 02:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjFOG2f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 02:28:35 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79945C7
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 23:28:34 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-bd0a359ca35so1410715276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 23:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686810513; x=1689402513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sl1LNkel2Jey/Q+VPNL7my6PAtZgOtyvxavcL0DTR4Y=;
        b=EygD5j0QlxcIGYupF35Vj1wtDKts5LDzLPDn5WDh9l6m+UlHM6cmB6bRcxjiCKro51
         RjdJaQiEUB+EdJjCtnhRvEVxyI7ClH6pEzI9YOxrfaAsNLDwj16sdqYxsUnDV99H4aaU
         ZJyZ6sFGAfNt0y1ekhXQNFZjigYPyD8mL0hZxZzxBkD2NBmAA1d1gm3As1xZKv42fxbv
         XnsOea/gFF7t+hy0RLiIbG9bwvuxHAgANu9ORtUe4jly0fsQQAIDc6IQQjgwvGBrKVVH
         qwaRPT35uNgdZN3aoMBr9Ys7C+0FBm3hV3MnQunimazRPsRle2qTonvW1gcNdzlNRJtC
         XouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686810513; x=1689402513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sl1LNkel2Jey/Q+VPNL7my6PAtZgOtyvxavcL0DTR4Y=;
        b=VaVxUsoQ7XQYaimzSfYp1LVijcBU+OSPNLGZVd8kODsYX0VlcCiZ2+k7CPsUXEutDL
         ZGQhNgJZUMjAqEpDe4xkM6VqzhvrDM86rSXXhRyrEV2Ti6QTWtIbjzoKltOl0URiPfpB
         V+I5jquH8QndPiabw3nbM/5AIY9jqngisEtNPXUdoUoa9DBVbdDiUEqjalQwR5B8x5+m
         AMI2Iy5xWczmUTXDjOTnuXG+uDgNd435z9+DYhNQqoGnXV0VG7sfvK5TngEK1pN6nv7F
         exXPqfzUzIByxAoJC/cCfBa0zz+UG2uTJsrCx5oUzfTrjePzxvhMi/iRI9mbakcPAa2r
         6IJA==
X-Gm-Message-State: AC+VfDxJ2L6VuCDVTfB67OVZ5FnmRXYG+h3VPD0rUxcKO/ylytyPQUqi
        nlEpuDiDr+kMlueI14i666kTruWGiWbqB0e0hGztqQ==
X-Google-Smtp-Source: ACHHUZ5QQ7NM8OdLRY2rhKKn0eJJKrToeLatwb0wJspABwcTXVGkWpuDYwEgYMm7GhA+ErIn3CcSdu5DqMV6YDMP9G8=
X-Received: by 2002:a25:2601:0:b0:b9e:712f:4a17 with SMTP id
 m1-20020a252601000000b00b9e712f4a17mr3583179ybm.6.1686810513685; Wed, 14 Jun
 2023 23:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
From:   Yongqin Liu <yongqin.liu@linaro.org>
Date:   Thu, 15 Jun 2023 14:28:22 +0800
Message-ID: <CAMSo37UVzFyigaTvKjxV-4Gvit8H4n8DtwC=2PYWGTr6L555Rg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: do not enable color-management if DSPPs
 are not available
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 13 Jun 2023 at 02:25, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> We can not support color management without DSPP blocks being provided
> in the HW catalog. Do not enable color management for CRTCs if num_dspps
> is 0.
>
> Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
> Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Thanks for this fix!
With it applied to the ACK android-mainline branch,
the "dpu error" problem reported here:
    https://lore.kernel.org/lkml/CAMSo37VmhB1-PUp1qu8gaxOXtu98eEYmWd71FOai+cwLb-JvSg@mail.gmail.com/
is not reproduced.

Tested-by: Yongqin Liu <yongqin.liu@linaro.org>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 6e684a7b49a1..1edf2b6b0a26 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1463,6 +1463,8 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
>  struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>                                 struct drm_plane *cursor)
>  {
> +       struct msm_drm_private *priv = dev->dev_private;
> +       struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>         struct drm_crtc *crtc = NULL;
>         struct dpu_crtc *dpu_crtc = NULL;
>         int i, ret;
> @@ -1494,7 +1496,8 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>
>         drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
>
> -       drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> +       if (dpu_kms->catalog->dspp_count)
> +               drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
>
>         /* save user friendly CRTC name for later */
>         snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
> --
> 2.39.2
>

-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
