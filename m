Return-Path: <linux-arm-msm+bounces-4026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F16B80A95D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 17:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5071B1C209D9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9500D38DF6;
	Fri,  8 Dec 2023 16:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y2Xplz8c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60D710D8
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 08:38:41 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5cd81e76164so21593167b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 08:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702053521; x=1702658321; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ji4v7G4p0p7zJuYWPDTvhXpo4RLr1EyE104kr2B7NEU=;
        b=Y2Xplz8cGAvN3xVfCf5cifvpXOe3rliMAXwYIXSwxTcCopavONuRthbP3iqw9XRXdq
         IXkpf2PdlQ7QNWJOZiNYDsdkv4JcoH/KrFfCHkSCIGdLsdg24S9WEif0cKd7UYfhTyFo
         ryMZ6361dcF84nMTxHfS9MEHf7xCS9i+ZThwfZEHbk/znhCRVZbsFp33ykwvazYveM7T
         7XvesMASbeXoKyO6TYAnXZR9WC06hQ/PR40NO6uXJAQFaYnU2V/yZbelzXv6KqJ48WEY
         rx3f+vQ7pl1Q/lOL7+or6jQreTM/rOIE1UXO/iBCA7fiqpR799xDfPdsSMsWzxEU9xIm
         Z7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702053521; x=1702658321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ji4v7G4p0p7zJuYWPDTvhXpo4RLr1EyE104kr2B7NEU=;
        b=Imfi6R6GvhT6Ct4aNf/WPzoirAM+iMCRaZ4oOiIGJhNGFwxyL6mlwDPcGt0K+iCHby
         xKnJs9c5DgT3a02GqHSZgBo5MzHzvXv1o9fRkV5/NpogMZfi/MxvpGt8AY5QtufJf+nl
         ilI189lwLb7+yst8tRkJRPthhC5z/i4V/Jpan+hD0lHdfAW49HZiBwhvYJ2Diz5WKHs+
         lAeH3U0vVgt5pMn/1GD38vNIAst65b21NiF0kA1ROV61b+qCERj2WnCl0jLTf/dZQeqQ
         252l0GVH+hTkyKyfPtk6IV+anSKG7LXFyKfpyyY9+zJMJ6iUn3zMMRVkrOLDRW2/+QeM
         aG3A==
X-Gm-Message-State: AOJu0YyH6rYvMwjMQrIiZBdENdoEYddsSuVOlFQIGJotIzymndfv2xpV
	Q0qHBWbDWccPPG8TuXYOEZyxTWSgPaccbwzY4QbzyQ==
X-Google-Smtp-Source: AGHT+IEvYbq7K1eeqmyuZnnDkuzmbkh66toRMLSzb8ok2h+sAB1ZVWMOBC1b8B8acmgDXqymCAogc6DISZj4odbbYrc=
X-Received: by 2002:a25:b904:0:b0:d9b:2ca7:4cd8 with SMTP id
 x4-20020a25b904000000b00d9b2ca74cd8mr257694ybj.31.1702053520888; Fri, 08 Dec
 2023 08:38:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-15-quic_abhinavk@quicinc.com> <CAA8EJpo4XVMJ7RqsZZ6Eh_PjoPeWiMmAW3P1a4dkZ_EHqz7GkQ@mail.gmail.com>
 <188e0168-a45b-6e38-ac49-8b0fd41e9110@quicinc.com>
In-Reply-To: <188e0168-a45b-6e38-ac49-8b0fd41e9110@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 18:38:30 +0200
Message-ID: <CAA8EJpoVfuybVPddKy2Sn-YsovkbiWmoNa48jKjdpKg4HiJaAg@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] drm/msm/dpu: reserve cdm blocks for writeback in
 case of YUV output
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 18:34, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/8/2023 3:54 AM, Dmitry Baryshkov wrote:
> > On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> Reserve CDM blocks for writeback if the format of the output fb
> >> is YUV. At the moment, the reservation is done only for writeback
> >> but can easily be extended by relaxing the checks once other
> >> interfaces are ready to output YUV.
> >>
> >> changes in v2:
> >>          - use needs_cdm from topology struct
> >>          - drop fb related checks from atomic_mode_set()
> >
> > It looks like this should be squashed with the patch 11. The 'unbind
> > CDM' doesn't really make sense without this patch. We need to allocate
> > it first,  before touching it.
> >
>
> The way I was thinking was that patch just completes the
> dpu_encoder_phys_cleanup() and yes it was intentionally kept ahead
> because that will not kick in till hw_cdm is assigned.
>
> Then, this patch only handles reserving/assignment of hw_cdm when needed.
>
> That was the motivation behind this split.

It leaves a leaf code that is not used at all. There is no need to
cleanup anything if it was not allocated. Please remove the split and
squash it with allocation.

>
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 +++++++++++++++++++++
> >>   1 file changed, 27 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 862912727925..a576e3e62429 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -16,6 +16,7 @@
> >>   #include <drm/drm_crtc.h>
> >>   #include <drm/drm_file.h>
> >>   #include <drm/drm_probe_helper.h>
> >> +#include <drm/drm_framebuffer.h>
> >>
> >>   #include "msm_drv.h"
> >>   #include "dpu_kms.h"
> >> @@ -583,6 +584,7 @@ static int dpu_encoder_virt_atomic_check(
> >>          struct drm_display_mode *adj_mode;
> >>          struct msm_display_topology topology;
> >>          struct dpu_global_state *global_state;
> >> +       struct drm_framebuffer *fb;
> >>          struct drm_dsc_config *dsc;
> >>          int i = 0;
> >>          int ret = 0;
> >> @@ -623,6 +625,22 @@ static int dpu_encoder_virt_atomic_check(
> >>
> >>          topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
> >>
> >> +       /*
> >> +        * Use CDM only for writeback at the moment as other interfaces cannot handle it.
> >> +        * if writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> >> +        * earlier.
> >> +        */
> >> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> >> +               fb = conn_state->writeback_job->fb;
> >> +
> >> +               if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))))
> >> +                       topology.needs_cdm = true;
> >> +               if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> >> +                       crtc_state->mode_changed = true;
> >> +               else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> >> +                       crtc_state->mode_changed = true;
> >> +       }
> >> +
> >>          /*
> >>           * Release and Allocate resources on every modeset
> >>           * Dont allocate when active is false.
> >> @@ -1063,6 +1081,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>
> >>          dpu_enc->dsc_mask = dsc_mask;
> >>
> >> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> >> +               struct dpu_hw_blk *hw_cdm = NULL;
> >> +
> >> +               dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >> +                                             drm_enc->base.id, DPU_HW_BLK_CDM,
> >> +                                             &hw_cdm, 1);
> >> +               dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
> >> +       }
> >> +
> >>          cstate = to_dpu_crtc_state(crtc_state);
> >>
> >>          for (i = 0; i < num_lm; i++) {
> >> --
> >> 2.40.1
> >>
> >
> >
> > --
> > With best wishes
> >
> > Dmitry



-- 
With best wishes
Dmitry

