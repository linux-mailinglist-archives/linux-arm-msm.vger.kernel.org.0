Return-Path: <linux-arm-msm+bounces-3934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D891180A259
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92EAD2818CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8D61B27E;
	Fri,  8 Dec 2023 11:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ubq3gEE+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9322B171D
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 03:36:37 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5d6b9143782so17189477b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 03:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702035396; x=1702640196; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9vphCG37O8eMkMC8HIffZ3tk8WXWBglaXiyl76vCMdg=;
        b=ubq3gEE+AgwBI6bjU06Wb2mRjd/gHe5qeF8EBkQkfKHAJ+6kN27qTGOt04lfobQEuO
         tO7nCmg1rBrA94N2fOnCIFlRTgkHysaHGEIC+8VvSxV5h1PFuSTk8PcP3OdO/w6F+JaY
         lNAeLHp4pXUB/ffJ9/kCUSFfMw0Fum/EvWibtLni3yfZmWeejc8OaTIxrvdzA3rT0aj0
         LbztLsD7wpI/lipz69Xi8uDc9doz+Q4thK1grem3RM6Pm6sQTVKIFuI3JkU9XlmIXo6Z
         hMCqedB6KsFEK3+zriPKk4ia1kCklWlsjophydx2k1i/1yRcJbu+NdfHceAkMxzmrRY8
         CCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702035396; x=1702640196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vphCG37O8eMkMC8HIffZ3tk8WXWBglaXiyl76vCMdg=;
        b=QPiuQcrhmdJUPj15KiW7ItucXc+xhafCn2yFFqLZU0V41tCkKKeDXBb4CC+AJZ8457
         rf2cHwGPQTNWjHvEl4wk8SA/fhuRnFGt9vOlzRhBcH9fc2qfR4FGRa8/3oo+Zfl+YVL6
         Oj4urS/T9WT/I7i1KTtzJpwScfkPdPm6ydoLgufIjvN4+2HOAWWbmF8FjOq4oyC4AG0p
         SL7sKjzF8J0AtFDwjPfa1nlSUfIvGMrMF7P9Hx5/682+rP45uZoHrYrA1Xxp/iIogwyw
         1UFprDr5lOC6RorG5rXbxxu82Ur5egR/OsB3UjLIDEZljO3QmJ6qLCFC773Ti9yLwnvv
         j51g==
X-Gm-Message-State: AOJu0YyGvGbNgGb/O2fznyojaYLF5zbpByC5XqtbHimbWKgpsYCoz1JP
	6vD+o81N3lQ4vOVyqcjLaPRdB+DEEHmspQWhK1J+nA==
X-Google-Smtp-Source: AGHT+IGNbm4h8qNGjXg60DMzqF5TvBlaPsJbNi3hCXSZ1UuSvxxiPwgPotz2EPuscLJPFJRKdrmJugMk2E/Rs8uOkp4=
X-Received: by 2002:a0d:ea0b:0:b0:5d7:1940:7d79 with SMTP id
 t11-20020a0dea0b000000b005d719407d79mr3847704ywe.80.1702035396669; Fri, 08
 Dec 2023 03:36:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com> <20231208050641.32582-12-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-12-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:36:25 +0200
Message-ID: <CAA8EJpo6=5mq8zCoBvdr73TsEFH96JS-mUo3Ks9go4VjBCm8uA@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] drm/msm/dpu: add support to disable CDM block
 during encoder cleanup
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> In preparation of setting up CDM block, add the logic to disable it
> properly during encoder cleanup.
>
> changes in v2:
>         - call update_pending_flush_cdm even when bind_pingpong_blk
>           is not present
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 10 ++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 ++
>  2 files changed, 12 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below

>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index aa1a1646b322..862912727925 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -26,6 +26,7 @@
>  #include "dpu_hw_dspp.h"
>  #include "dpu_hw_dsc.h"
>  #include "dpu_hw_merge3d.h"
> +#include "dpu_hw_cdm.h"
>  #include "dpu_formats.h"
>  #include "dpu_encoder_phys.h"
>  #include "dpu_crtc.h"
> @@ -2050,6 +2051,15 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>                                         phys_enc->hw_pp->merge_3d->idx);
>         }
>
> +       if (phys_enc->hw_cdm) {
> +               if (phys_enc->hw_cdm->ops.bind_pingpong_blk && phys_enc->hw_pp)
> +                       phys_enc->hw_cdm->ops.bind_pingpong_blk(phys_enc->hw_cdm,
> +                                                               false, phys_enc->hw_pp->idx);

PINGPONG_NONE

> +               if (phys_enc->hw_ctl->ops.update_pending_flush_cdm)
> +                       phys_enc->hw_ctl->ops.update_pending_flush_cdm(phys_enc->hw_ctl,
> +                                                                      phys_enc->hw_cdm->idx);
> +       }
> +
>         if (dpu_enc->dsc) {
>                 dpu_encoder_unprep_dsc(dpu_enc);
>                 dpu_enc->dsc = NULL;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index b6b48e2c63ef..410f6225789c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -151,6 +151,7 @@ enum dpu_intr_idx {
>   * @hw_pp:             Hardware interface to the ping pong registers
>   * @hw_intf:           Hardware interface to the intf registers
>   * @hw_wb:             Hardware interface to the wb registers
> + * @hw_cdm:            Hardware interface to the CDM registers
>   * @dpu_kms:           Pointer to the dpu_kms top level
>   * @cached_mode:       DRM mode cached at mode_set time, acted on in enable
>   * @enabled:           Whether the encoder has enabled and running a mode
> @@ -179,6 +180,7 @@ struct dpu_encoder_phys {
>         struct dpu_hw_pingpong *hw_pp;
>         struct dpu_hw_intf *hw_intf;
>         struct dpu_hw_wb *hw_wb;
> +       struct dpu_hw_cdm *hw_cdm;
>         struct dpu_kms *dpu_kms;
>         struct drm_display_mode cached_mode;
>         enum dpu_enc_split_role split_role;
> --
> 2.40.1
>


-- 
With best wishes
Dmitry

