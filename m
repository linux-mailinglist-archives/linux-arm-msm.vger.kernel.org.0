Return-Path: <linux-arm-msm+bounces-3940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF180A2B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 001D3281776
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4811B27E;
	Fri,  8 Dec 2023 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZWD0I1xh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F92FA
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 03:54:26 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5d34f8f211fso19037277b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 03:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702036465; x=1702641265; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Y3Se1GcDGIbYUefqj6qyxR6DT7anpk4KRXh007rVt4=;
        b=ZWD0I1xhda3bgZeVhO5DkHJ5fqoBhorwYw8teZeGTVGf8DGUCY7PBUVyWDpLisb25k
         LJOrH3AbWyl7pv/lGDh+flelvSFCZfeReD718R4JRafpb0KWun+FIJ1r/eypXJn1mWz5
         MmKbMoxrG5+TVVqtDqj9kVACIk6FbYDELkWytL/Qibb0ymO1Pt/W6HN3o6Lpj47oRkv3
         wstfMLvYa+16dlSnmAh2r0HD8m7IwpWSUzpd38GYeUJfStynRcjbnu/ebeQ/9tgWIxAi
         5WvefV1W9IplrW+xuHyCwadTZYMhCzFYffzZtxUdhwq23fDy2Z2FGGNUMwAME52Vjlzq
         eVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702036465; x=1702641265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Y3Se1GcDGIbYUefqj6qyxR6DT7anpk4KRXh007rVt4=;
        b=O2G5eVAjOsyN7+PlypbJGPh+igDwSs/pMAh5c/xNINGsOd1IKgbdHyK9gVOb1ccJQj
         1u0Cv55/+Z8fd6yWpbCAOQtPf/JP+1pK0vtEdsgjC9JYaP4OcnVn43/8opRmjvGMfOsv
         qD3Eh1/yWib2npi2i16F/rLOUwlwbTBQONHWjQms+VFxLaDQDuXp5UFadKlwzyCUvcQP
         qNNMk+kiBn0e3hyMsN4yNMOsnWjM3X5h6yQrQm+7qYTUDVKDcYIAvONrZ+gfHs2NKH4m
         Od/QufWxIB5kHd9Ulw/lmp0OtoP0t1PZl+cPDSbAmD2zEG65m8uZlXC6cIDbBNGA9gOQ
         PfEA==
X-Gm-Message-State: AOJu0YwBoB9c6rQ6SQOqSHatyvrsM57sdS7fEHTGn2OpHw31Da21tkKQ
	A/uQtjYhnhyCagFPqyTzZFqrhdEwiaucrzI2MKjAEA==
X-Google-Smtp-Source: AGHT+IEho6li6mBQtcvkKv7dl+SZrnSSWaZwoy9kNhdxT/+JJRDfIAUab3CIjuSQnHHcGRdbsl9H5uqFhk2EHSNzRws=
X-Received: by 2002:a81:4c86:0:b0:5d6:c21a:de9e with SMTP id
 z128-20020a814c86000000b005d6c21ade9emr3630952ywa.37.1702036465703; Fri, 08
 Dec 2023 03:54:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com> <20231208050641.32582-15-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-15-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:54:13 +0200
Message-ID: <CAA8EJpo4XVMJ7RqsZZ6Eh_PjoPeWiMmAW3P1a4dkZ_EHqz7GkQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] drm/msm/dpu: reserve cdm blocks for writeback in
 case of YUV output
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Reserve CDM blocks for writeback if the format of the output fb
> is YUV. At the moment, the reservation is done only for writeback
> but can easily be extended by relaxing the checks once other
> interfaces are ready to output YUV.
>
> changes in v2:
>         - use needs_cdm from topology struct
>         - drop fb related checks from atomic_mode_set()

It looks like this should be squashed with the patch 11. The 'unbind
CDM' doesn't really make sense without this patch. We need to allocate
it first,  before touching it.

>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 +++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 862912727925..a576e3e62429 100644
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
> @@ -583,6 +584,7 @@ static int dpu_encoder_virt_atomic_check(
>         struct drm_display_mode *adj_mode;
>         struct msm_display_topology topology;
>         struct dpu_global_state *global_state;
> +       struct drm_framebuffer *fb;
>         struct drm_dsc_config *dsc;
>         int i = 0;
>         int ret = 0;
> @@ -623,6 +625,22 @@ static int dpu_encoder_virt_atomic_check(
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
> @@ -1063,6 +1081,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
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
> --
> 2.40.1
>


--
With best wishes

Dmitry

