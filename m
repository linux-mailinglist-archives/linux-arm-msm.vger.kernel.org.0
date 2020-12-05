Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0FDB2CFC1C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Dec 2020 17:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgLEPgM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Dec 2020 10:36:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgLEPZt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Dec 2020 10:25:49 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7AFC02B8F2
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Dec 2020 07:23:48 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id d17so13063742ejy.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Dec 2020 07:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o6oFhKK6E9ulOA/HQLGC/Cvl0EWnQ7WoWB+KajzZU9M=;
        b=L3nCZcKcPKem4zPyoXK/6Aw/NP2RW0RuNWRGwAPVrPYRmI4GyRwL07kkbt2hNJRJCS
         cyJrrAIjEBqUGqq2pDd81l9uWvA1zqWkYJjV+xxNtNSqwxbFyGuU61XDPHDHV5C/s/lz
         DL7S064GR8r3KZAYLjgzJ65tHbUNcT+Y6izXenEkniSbJ4aQBpsb+bOhA2Xp1UnKLVLJ
         KzdJYBgP3hPilhgpatxFQ5hDU8rCqkPO0WWqtf406oo3sDvO7xoUkIj6NE6CZb41r93Y
         IJNg+7dTI90Dm5XhQX8lBM+6emnNmkMvJzHX1ikWOPD/zpc1B3mnnEsQEcGtARfONiAL
         7ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o6oFhKK6E9ulOA/HQLGC/Cvl0EWnQ7WoWB+KajzZU9M=;
        b=RfFopIIcUNMIgb8kWTjdne9AuiWxkPdt6K8b9cUnNCmY2pcGhxa+9v2Kn0q7VMuzqg
         ttXmwEQpR5bwS8aM/uKbEwNStar4u/7BwJXfZN8hcbg9lPbjCKyHdvnh8dWHbgLOtQbo
         3gaCY8l+UpyTMsYJTq54Zc3Anv5GIZAGfgmLMod+79phKbUGpK5o3UTtZ+Ocsapw+nQJ
         nwNlyEzPTFg8GH4u3utEqanPUuQxzt5VAe7aj6YPS18FmN/C6pYm3OcDdz3oZFpLVbNj
         1cI0ehfnS/zsxtobqVHTL0gv/sBuIpEjZMlZLP8kQTT3972LT/BeUHBrRW0HxTXCiWRh
         9/Cg==
X-Gm-Message-State: AOAM532aZJLZ3sP30xXiooiL0c5gTEQxGfB4rCqrgbHO6LNVXShrelTg
        iJ9s0CQvMRKzKMrWXkZmDapgT+UXrQB+u2bAXzaLNw==
X-Google-Smtp-Source: ABdhPJyzknKZdsiDAAQV4EoRT04aryQWvBfxjjm7spiAdyN2wKXOvto8Yw/lV2QTqPfmNXDuCsx4Gz7Omewa3Br0/LM=
X-Received: by 2002:a17:906:4482:: with SMTP id y2mr11916052ejo.342.1607181827131;
 Sat, 05 Dec 2020 07:23:47 -0800 (PST)
MIME-Version: 1.0
References: <20201103052102.1465314-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201103052102.1465314-1-dmitry.baryshkov@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 5 Dec 2020 18:23:36 +0300
Message-ID: <CAA8EJpor_oizNfYaQydQdNVgROGTGpKJnoHhqXx9O9XcyYWe3g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: enable DSPP support on SM8[12]50
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 3 Nov 2020 at 08:21, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add support for color correction sub block on SM8150 and SM8250.

Gracious ping for this patch

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 26 +++++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |  3 +--
>  2 files changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index bb1add2e49dd..240a21c5e5fe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -466,9 +466,9 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
>
>  static const struct dpu_lm_cfg sm8150_lm[] = {
>         LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
> +               &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
>         LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
> +               &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
>         LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
>                 &sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
>         LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> @@ -487,16 +487,28 @@ static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
>                 .len = 0x90, .version = 0x10000},
>  };
>
> -#define DSPP_BLK(_name, _id, _base) \
> +static const struct dpu_dspp_sub_blks sm8150_dspp_sblk = {
> +       .pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
> +               .len = 0x90, .version = 0x40000},
> +};
> +
> +#define DSPP_BLK(_name, _id, _base, _sblk) \
>                 {\
>                 .name = _name, .id = _id, \
>                 .base = _base, .len = 0x1800, \
>                 .features = DSPP_SC7180_MASK, \
> -               .sblk = &sc7180_dspp_sblk \
> +               .sblk = _sblk \
>                 }
>
>  static const struct dpu_dspp_cfg sc7180_dspp[] = {
> -       DSPP_BLK("dspp_0", DSPP_0, 0x54000),
> +       DSPP_BLK("dspp_0", DSPP_0, 0x54000, &sc7180_dspp_sblk),
> +};
> +
> +static const struct dpu_dspp_cfg sm8150_dspp[] = {
> +       DSPP_BLK("dspp_0", DSPP_0, 0x54000, &sm8150_dspp_sblk),
> +       DSPP_BLK("dspp_1", DSPP_1, 0x56000, &sm8150_dspp_sblk),
> +       DSPP_BLK("dspp_2", DSPP_2, 0x58000, &sm8150_dspp_sblk),
> +       DSPP_BLK("dspp_3", DSPP_3, 0x5a000, &sm8150_dspp_sblk),
>  };
>
>  /*************************************************************
> @@ -888,6 +900,8 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>                 .sspp = sdm845_sspp,
>                 .mixer_count = ARRAY_SIZE(sm8150_lm),
>                 .mixer = sm8150_lm,
> +               .dspp_count = ARRAY_SIZE(sm8150_dspp),
> +               .dspp = sm8150_dspp,
>                 .pingpong_count = ARRAY_SIZE(sm8150_pp),
>                 .pingpong = sm8150_pp,
>                 .merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> @@ -919,6 +933,8 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>                 .sspp = sm8250_sspp,
>                 .mixer_count = ARRAY_SIZE(sm8150_lm),
>                 .mixer = sm8150_lm,
> +               .dspp_count = ARRAY_SIZE(sm8150_dspp),
> +               .dspp = sm8150_dspp,
>                 .pingpong_count = ARRAY_SIZE(sm8150_pp),
>                 .pingpong = sm8150_pp,
>                 .merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> index a7a24539921f..e42f901a7de5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> @@ -57,8 +57,7 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
>  static void _setup_dspp_ops(struct dpu_hw_dspp *c,
>                 unsigned long features)
>  {
> -       if (test_bit(DPU_DSPP_PCC, &features) &&
> -               IS_SC7180_TARGET(c->hw.hwversion))
> +       if (test_bit(DPU_DSPP_PCC, &features))
>                 c->ops.setup_pcc = dpu_setup_dspp_pcc;
>  }
>
> --
> 2.28.0
>


-- 
With best wishes
Dmitry
