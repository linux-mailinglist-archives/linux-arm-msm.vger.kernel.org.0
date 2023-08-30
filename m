Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E034478E35C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Aug 2023 01:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238611AbjH3XkP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 19:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239394AbjH3XkO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 19:40:14 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76F811F
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 16:40:10 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d7820f9449bso94363276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 16:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693438810; x=1694043610; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NazOzKPkx7AjojgQQ4WRVyoU6M4Mb5zkgyFuSk7fqSA=;
        b=PlhQBYfe1RMnCfx3VMoPubbrntFLRzgsN+OG14i+spPiCG3VWH922WnZsn78VRlsv4
         xGYhXx9iE2qDj5Rp3Js/AHSi3jPfIiu9OjbkfVzxBB0WoYERA6eR14CPdw7Xb6eAB0/g
         K2sRofKeCZYj0gWrRSPGjtyAZylZioWnwfkqFttfHd4HbyAJx0SVmtgKY3c6HApGoNwj
         wkT0KWBJlSc6Hea09uucpkesvcD5ICqNTIfjbIWNe0juGuaGnXavvvxBvsGO5JsEn/vE
         k7VJgdQ+n0wShb4ZPj/9GCUoF9PG2GO7m8Dpa/LiZ0Fu5bjZ3orgHcgL+IYX3qN5uGml
         lPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693438810; x=1694043610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NazOzKPkx7AjojgQQ4WRVyoU6M4Mb5zkgyFuSk7fqSA=;
        b=kF+bkgxJWRIMRnOZErARX/+Fra5K7/2fkxEBAndnv9C6Lksx8Wiz1E8c/YWd9kpyu/
         IfwXV6enpC0+s5zrQqjY1nwsNxrrxayM/xdJtjNK7h016PVWxEAeofPJChx3kOIsY0cQ
         795Ois3Zq1/e+pweNcEa87x5DmI41vkdjsrHvMMYNXuKxavbi2cheike1TQ++7aWugXO
         0oiKJdrhNxxuLPit4h4QzMHddzCJ991U4vTtXewy7Oy8TjfIyrCph/H/H3Qik38HGB3w
         9a+gacqgUG8tKZ6oeEl4cRxjSZgeJXC07EMyyD9kroKOm4ujPTWB7e6mIT/KTSVgciKI
         zzGA==
X-Gm-Message-State: AOJu0Yx127TGYkZfTuwplkNo2seV9qjhwtb4Fn1GKNHfg6vXd3e2vOXL
        +Tyxqc+9oCxurVHGnhPtP4OlbHoeRmAtkZ4BDBfbLg==
X-Google-Smtp-Source: AGHT+IFejm9Q+Ex9Nv89RkmnYcqWsShM6TIShSIoUZ/+RLO6C9oKn0Gw/p6tqXp2c+X6rIN0NlKUrtFa8py8qS1XbDM=
X-Received: by 2002:a25:2e47:0:b0:d72:a54d:4b7 with SMTP id
 b7-20020a252e47000000b00d72a54d04b7mr3334092ybn.1.1693438809917; Wed, 30 Aug
 2023 16:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com> <20230830224910.8091-3-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-3-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 31 Aug 2023 02:39:59 +0300
Message-ID: <CAA8EJpoNqWTspHADS6PKKMLcfHCKhgbZTXO39tueSZE+a64MwQ@mail.gmail.com>
Subject: Re: [PATCH 02/16] drm/msm/dpu: add formats check for writeback encoder
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        quic_parellan@quicinc.com, quic_khsieh@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Aug 2023 at 01:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> In preparation of adding more formats to dpu writeback add

I think it is `preparation to'

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> format validation to it to fail any unsupported formats.
>
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 284a88060221..6a1f8e34f18a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -238,6 +238,7 @@ static int dpu_encoder_phys_wb_atomic_check(
>  {
>         struct drm_framebuffer *fb;
>         const struct drm_display_mode *mode = &crtc_state->mode;
> +       int ret;
>
>         DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
>                         phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
> @@ -274,6 +275,12 @@ static int dpu_encoder_phys_wb_atomic_check(
>                 return -EINVAL;
>         }
>
> +       ret = drm_atomic_helper_check_wb_encoder_state(phys_enc->parent, conn_state);
> +       if (ret < 0) {
> +               DPU_ERROR("invalid pixel format %p4cc\n", &fb->format->format);
> +               return ret;
> +       }
> +
>         return 0;
>  }
>
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
