Return-Path: <linux-arm-msm+bounces-4336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 573D680E4C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 08:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 919EB1C21ECD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 07:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320F31642B;
	Tue, 12 Dec 2023 07:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uHcnGbjU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05BBCAB
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 23:21:45 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5d3c7ef7b31so51864607b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 23:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702365704; x=1702970504; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+hNGSAL4RNt6mo4iqM3CGVKIw9oVYy2WifrU+6CWjMM=;
        b=uHcnGbjUjA9b701VrskapEt+UVKfiPS8i2XJAIgTgDqs4BYXs6stOMxN23BlNavIEm
         1ikPrwTuHLPVhokJSRZaT+RPwvIXbwTJiUHbmnTsQS1Ck4UsIDNUuzO9jiQIhHpk4QqV
         +2uAW6EmmFKCUAXWUdnFUxiwT2YRSgf3fQWNYNPlP+KJ7OdeVrVBB+GoG0aieqkONa/b
         ThxcINqpTOT+EmQzi8boqii1bFmAPEhbsJH3cqTgD2FrB2bAUF6tGVQFXndFmR8WX1GS
         LJ7O7Ss+mIgHX5qVVYEMdioWZcf54f6zxgpAiExAOY96nq6eMm3Uw/CH836dkM1JudNG
         GXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702365704; x=1702970504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hNGSAL4RNt6mo4iqM3CGVKIw9oVYy2WifrU+6CWjMM=;
        b=nq6NZB8B5CAxF7QAQAswNTkoYFNrW5KwVZiosN2Q9eLOXOnR1VXwcx8v3wICITSzFO
         HTtdKDLG56bte6uIW8zKLqsXTiiOjUUm7SkOppmeJBh2Kt86CICFJfJx6qaPLd/HOisr
         9YLX1nRbPniqsbeo3Nc8AhMxX+76abNN1QhxVlrydB1aa1LGq1k5qdPfOfbHnFOwQCu/
         Q8jTxIC0PcOaz6HbACAhdV/2voqZwbZVs0jA64PNFWRtt/1Qv3pcJcDKUIo3Y0nXBWyd
         ZSQjIkPBhSjLoygbiY/aQpXdvWQYPNuWMyM73WUf+ViZkRrMVvG4ItUteLA99KRfkC6J
         Z36g==
X-Gm-Message-State: AOJu0Yy1KRJiV0EPWWhN64qbCgwP9iXv2OncCoBP0btuWAhymWdEDTxP
	2Im9V3HTrES/b7/sutdFkgTK4D6MN9UQXC8m+WcDOg==
X-Google-Smtp-Source: AGHT+IFa6zjT3OqIwi1hdiZ+G3kxAzDemjxb1B5hXWZ5mNcVTg3D2puvnshMyfcmW7JoTMA7CchGxUvXJa7nWrEfYqI=
X-Received: by 2002:a0d:d7cc:0:b0:5e1:9e32:2ab3 with SMTP id
 z195-20020a0dd7cc000000b005e19e322ab3mr1108823ywd.38.1702365704154; Mon, 11
 Dec 2023 23:21:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com> <20231212002245.23715-14-quic_abhinavk@quicinc.com>
In-Reply-To: <20231212002245.23715-14-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 09:21:33 +0200
Message-ID: <CAA8EJprpMR20itGZU4Uu4j92UuWW+=X+pOj73YSpedn8kB7qSw@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] drm/msm/dpu: reserve cdm blocks for writeback in
 case of YUV output
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	seanpaul@chromium.org, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Dec 2023 at 02:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Reserve CDM blocks for writeback if the format of the output fb
> is YUV. At the moment, the reservation is done only for writeback
> but can easily be extended by relaxing the checks once other
> interfaces are ready to output YUV.
>
> changes in v3:
>         - squash CDM disable during encoder cleanup into this change
>
> changes in v2:
>         - use needs_cdm from topology struct
>         - drop fb related checks from atomic_mode_set()
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below which I should probably handle while applying the patch.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 37 +++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 889e9bb42715..989ee8c0e5b4 100644
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
> @@ -26,6 +27,7 @@
>  #include "dpu_hw_dspp.h"
>  #include "dpu_hw_dsc.h"
>  #include "dpu_hw_merge3d.h"
> +#include "dpu_hw_cdm.h"
>  #include "dpu_formats.h"
>  #include "dpu_encoder_phys.h"
>  #include "dpu_crtc.h"
> @@ -582,6 +584,7 @@ static int dpu_encoder_virt_atomic_check(
>         struct drm_display_mode *adj_mode;
>         struct msm_display_topology topology;
>         struct dpu_global_state *global_state;
> +       struct drm_framebuffer *fb;
>         struct drm_dsc_config *dsc;
>         int i = 0;
>         int ret = 0;
> @@ -622,6 +625,22 @@ static int dpu_encoder_virt_atomic_check(
>
>         topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
>
> +       /*
> +        * Use CDM only for writeback at the moment as other interfaces cannot handle it.
> +        * if writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> +        * earlier.

What about s/handle/use/ ?

> +        */
> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> +               fb = conn_state->writeback_job->fb;
> +
> +               if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))))
> +                       topology.needs_cdm = true;
> +               if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> +                       crtc_state->mode_changed = true;
> +               else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> +                       crtc_state->mode_changed = true;
> +       }
> +
>         /*
>          * Release and Allocate resources on every modeset
>          * Dont allocate when active is false.
> @@ -1062,6 +1081,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>
>         dpu_enc->dsc_mask = dsc_mask;
>
> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> +               struct dpu_hw_blk *hw_cdm = NULL;
> +
> +               dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +                                             drm_enc->base.id, DPU_HW_BLK_CDM,
> +                                             &hw_cdm, 1);
> +               dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
> +       }
> +
>         cstate = to_dpu_crtc_state(crtc_state);
>
>         for (i = 0; i < num_lm; i++) {
> @@ -2050,6 +2078,15 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>                                         phys_enc->hw_pp->merge_3d->idx);
>         }
>
> +       if (phys_enc->hw_cdm) {
> +               if (phys_enc->hw_cdm->ops.bind_pingpong_blk && phys_enc->hw_pp)
> +                       phys_enc->hw_cdm->ops.bind_pingpong_blk(phys_enc->hw_cdm,
> +                                                               PINGPONG_NONE);
> +               if (phys_enc->hw_ctl->ops.update_pending_flush_cdm)
> +                       phys_enc->hw_ctl->ops.update_pending_flush_cdm(phys_enc->hw_ctl,
> +                                                                      phys_enc->hw_cdm->idx);
> +       }
> +
>         if (dpu_enc->dsc) {
>                 dpu_encoder_unprep_dsc(dpu_enc);
>                 dpu_enc->dsc = NULL;
> --
> 2.40.1
>


-- 
With best wishes
Dmitry

