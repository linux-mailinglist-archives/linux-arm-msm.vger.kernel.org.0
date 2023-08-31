Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A75778E3E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Aug 2023 02:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238782AbjHaAX6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 20:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjHaAX5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 20:23:57 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A202CD6
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 17:23:54 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3a99eeb95aaso126554b6e.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 17:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693441434; x=1694046234; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5BOO2syw+fNhCrXECBXKb4WvH6HIj2S7NLiqitDsR7Q=;
        b=V5SdhLvGVgsbwbnpiWn3aQhkJaBR4w/DWxCOE7rtnCDWhyu9jRSuuwG+Q7OnN5431l
         JWnKFClUIg1LKB4Et7Urk8wDYF++TEUmgTRUnCkClbeyN2lFmiT1J5LnY+P5UekPdmjJ
         Jk3569UzXBXU5epfuXUi+mQZc4Nr0jcW+31PL09rywVVkPDqPFGeNREyDZqp5Uzqnczm
         ajg3l8Lb3bVbub+lGDtpxoO/qxVgZ8/CCIQQrTWWXUndMfVldf7uybl6kAGx+DcI7mVp
         IN9BJAUpXN89ikqGbh+Cwj8BM0jhKhmY5tZ5U/0lZuP8ohi3+wJpN9MCkO86T3UcshRP
         vk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693441434; x=1694046234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BOO2syw+fNhCrXECBXKb4WvH6HIj2S7NLiqitDsR7Q=;
        b=ON50+Ye+ckE32wm7+4c2uQ4K2JE1fLILdbvL0TUfi1SfSL2KpCrYOLZRF8Pp0GNP7c
         CQ9PEUEyAJ98gsbpd/ASyMZLPf2qt/KDBdcGmQ3mbRjdY5j6nMcOAXdIq7DFqNA46bBV
         G/uipZ6d431+mabyL61RVbBUOBV7owcGM126LjLzCdiETWC8x0cjtlTBAxM6MQuUZ0FI
         slEZE0AXM4Sg4KTfaJm/uL1zaHhwzYaa2FFRxxroSlCQLAa1pN4adzsIBx1Cpdupr9Q8
         yuH6Jf+y7QducERs+L79BVoiCgmkEA4GGl+84hsKyXHRr142YqeFp+ILjFvLIyz2lzjh
         DcSQ==
X-Gm-Message-State: AOJu0YxScsVHLpWo7P1VKQrdtvo3epcX00XVKC08ZXiAVuzrOiTo0fq2
        nyoxqkyq+rRNI6herk0PXjB3Zob+8kAX7bkHU0FEIw==
X-Google-Smtp-Source: AGHT+IGnF0dg+8lHMwzar97XASKXcVVXik66Axj2Ag03K7pEFP7DRu1/ixa0m1/hpdcaZN46FRpiDSgtP5bi24UTLe4=
X-Received: by 2002:a05:6358:7e47:b0:134:e631:fd2b with SMTP id
 p7-20020a0563587e4700b00134e631fd2bmr3651336rwm.0.1693441433824; Wed, 30 Aug
 2023 17:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com> <20230830224910.8091-14-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-14-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 31 Aug 2023 03:23:42 +0300
Message-ID: <CAA8EJpr=BJFuyeerO=6G9cz80vtCNsassXskZ+7uC4cSvDBeAw@mail.gmail.com>
Subject: Re: [PATCH 13/16] drm/msm/dpu: reserve cdm blocks for writeback in
 case of YUV output
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Reserve CDM blocks for writeback if the format of the output fb
> is YUV. At the moment, the reservation is done only for writeback
> but can easily be extended by relaxing the checks once other
> interfaces are ready to output YUV.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 35 ++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1b1e07292a9e..7a3d179bdfba 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -16,6 +16,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_framebuffer.h>
>
>  #include "msm_drv.h"
>  #include "dpu_kms.h"
> @@ -615,9 +616,11 @@ static int dpu_encoder_virt_atomic_check(
>         struct drm_display_mode *adj_mode;
>         struct msm_display_topology topology;
>         struct dpu_global_state *global_state;
> +       struct drm_framebuffer *fb;
>         struct drm_dsc_config *dsc;
>         int i = 0;
>         int ret = 0;
> +       bool needs_cdm = false;
>
>         if (!drm_enc || !crtc_state || !conn_state) {
>                 DPU_ERROR("invalid arg(s), drm_enc %d, crtc/conn state %d/%d\n",
> @@ -655,6 +658,22 @@ static int dpu_encoder_virt_atomic_check(
>
>         topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
>
> +       /*
> +        * Use CDM only for writeback at the moment as other interfaces cannot handle it.
> +        * if writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> +        * earlier.
> +        */
> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> +               fb = conn_state->writeback_job->fb;
> +
> +               if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))))
> +                       needs_cdm = true;
> +               if (needs_cdm && !dpu_enc->cur_master->hw_cdm)
> +                       crtc_state->mode_changed = true;
> +               else if (!needs_cdm && dpu_enc->cur_master->hw_cdm)
> +                       crtc_state->mode_changed = true;
> +       }

What would be the (estimated) check for DP?

> +
>         /*
>          * Release and Allocate resources on every modeset
>          * Dont allocate when active is false.
> @@ -664,7 +683,7 @@ static int dpu_encoder_virt_atomic_check(
>
>                 if (!crtc_state->active_changed || crtc_state->enable)
>                         ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> -                                       drm_enc, crtc_state, topology, false);
> +                                       drm_enc, crtc_state, topology, needs_cdm);
>         }
>
>         trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> @@ -1126,6 +1145,20 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>
>         dpu_enc->dsc_mask = dsc_mask;
>
> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> +               struct dpu_hw_blk *hw_cdm = NULL;
> +               struct drm_framebuffer *fb;
> +
> +               fb = conn_state->writeback_job->fb;
> +
> +               if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb)))) {

You can drop all fb-related conditions here. If we have CDM, we know
that we asked for it. If we do not, it's because we do not need it.

> +                       dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +                                                     drm_enc->base.id, DPU_HW_BLK_CDM,
> +                                                     &hw_cdm, 1);
> +               }
> +               dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
> +       }
> +
>         cstate = to_dpu_crtc_state(crtc_state);
>
>         for (i = 0; i < num_lm; i++) {
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
