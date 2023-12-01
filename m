Return-Path: <linux-arm-msm+bounces-2841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1C28005C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 09:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0C61281985
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 08:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB58F1C2AC;
	Fri,  1 Dec 2023 08:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xSwQCRC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34461131
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 00:36:13 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5d2c6c1ab66so20205467b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 00:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701419772; x=1702024572; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MtZ5IdIBvkCmVfZiZm9xTlVCWifoa/NZ8bzDIOX3Xng=;
        b=xSwQCRC7PH8wFmk/UNhjZkE8PNx2np2UEe7CzCaKnnAfOoQehaiA/Hk8V1XWWlV0Du
         TnRWR4jRf+FHaqr+dAajnJRiTdMNwoR9uFayO2gOZSLfp8bIm4z7dCU+uVEsN1VbHsIT
         FOFenQgaj8H2u/EmyhopciloKEPqm10zGWc3SwUCpg068xb3slTHjf+6oxM1/D+8o9fo
         EUE5bAeYmqukUj0IDnvjrNUHioFBs/AKO1QYwkKppsBR8fW67KHdTpQbeExu/8gZvLvU
         xXvIOWQ/VIy0P71mZmdcZAq7JDCgDWCqt1cYGqoor+NzMOJaM+4aNbl0hr7PeYAxG0Wd
         M91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701419772; x=1702024572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MtZ5IdIBvkCmVfZiZm9xTlVCWifoa/NZ8bzDIOX3Xng=;
        b=Qt36aUy0AaRnu3h80mHjhAZACQXwnhAFPoadaOLpmNmG6+XhPWdRJ7rZDyVmbGmcMF
         k+hf2toz6LckxlvE16B8+C2dElmIC+PRlHjSZhovfQ6lADk0TeF56KJv2l1qZAJp8VKa
         PENChSMip/ZxMgXHjv2+3IgSYri4xn58G/tzXNfUE9gkqIB/mBFqVz+jI5gj6SK5tjtG
         tbjr4zgUNpw69zDE3N2CQxMcq8X0+IArXMVHu4BzXXOomHExYW5rWvX/PlcSY6Jk7wDN
         sW4ZoJUG8W3gul9jIs/IQRq8kdEFSZ8LPIgW/VWEjxe1asxVpMVo84SgloZKQ4EpVk6e
         OYXA==
X-Gm-Message-State: AOJu0YxUbiAGUbcwS1zuWjlbjVTHhcWoUnGizefjMvE9RS3RfzvVS9m8
	6ZNJNdhX99f127rLnVqOhdsV0hkUirA8yghqrAMIpg==
X-Google-Smtp-Source: AGHT+IFMKwL0EhOV6pMJyoqRG37zW+mNZpW1h9u5bFubBHrQFVO1YAmlDYEKlF7TviFe0+hAEAjElbTHB1G3GbvZyuA=
X-Received: by 2002:a81:4e86:0:b0:5d3:ba75:758d with SMTP id
 c128-20020a814e86000000b005d3ba75758dmr3335760ywb.2.1701419772391; Fri, 01
 Dec 2023 00:36:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-11-quic_abhinavk@quicinc.com> <CAA8EJpoUDjTEytGnx0NUKD_grY=azoXgm_sqwNBJVTD7LwCe0g@mail.gmail.com>
 <5c16e398-4010-718b-d91d-5fc3781b9c0a@quicinc.com>
In-Reply-To: <5c16e398-4010-718b-d91d-5fc3781b9c0a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 10:36:01 +0200
Message-ID: <CAA8EJpob=mmo1LsyOydMV8RTChYA5P41s1H4xfxkqjRLBWscwQ@mail.gmail.com>
Subject: Re: [PATCH 10/16] drm/msm/dpu: add support to disable CDM block
 during encoder cleanup
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, quic_khsieh@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Dec 2023 at 01:58, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 8/30/2023 5:14 PM, Dmitry Baryshkov wrote:
> > On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> In preparation of setting up CDM block, add the logic to disable it
> >> properly during encoder cleanup.
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 8 ++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h | 2 ++
> >>   2 files changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 582680804016..1b1e07292a9e 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -26,6 +26,7 @@
> >>   #include "dpu_hw_dspp.h"
> >>   #include "dpu_hw_dsc.h"
> >>   #include "dpu_hw_merge3d.h"
> >> +#include "dpu_hw_cdm.h"
> >>   #include "dpu_formats.h"
> >>   #include "dpu_encoder_phys.h"
> >>   #include "dpu_crtc.h"
> >> @@ -2097,6 +2098,13 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
> >>                                          phys_enc->hw_pp->merge_3d->idx);
> >>          }
> >>
> >> +       if (phys_enc->hw_cdm && phys_enc->hw_cdm->ops.bind_pingpong_blk && phys_enc->hw_pp) {
> >> +               phys_enc->hw_cdm->ops.bind_pingpong_blk(phys_enc->hw_cdm,
> >> +                                                       false, phys_enc->hw_pp->idx);
> >
> > But it was already bound in the cdm->enable, wasn't it?

Yes :-(

> >
>
> This is disable. I think you missed the "false" parameter.
>
> > Also the update_pending_flush_cdm should be called even for DPU < 5.0,
> > where there should be no bind_pingpong_blk callback.
> >
>
> Ack. This is a good catch!
>
> >> +               if (phys_enc->hw_ctl->ops.update_pending_flush_cdm)
> >> +                       phys_enc->hw_ctl->ops.update_pending_flush_cdm(phys_enc->hw_ctl);
> >> +       }
> >> +
> >>          if (dpu_enc->dsc) {
> >>                  dpu_encoder_unprep_dsc(dpu_enc);
> >>                  dpu_enc->dsc = NULL;
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> index 24dbc28be4f8..510c1c41ddbc 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> @@ -150,6 +150,7 @@ enum dpu_intr_idx {
> >>    * @hw_pp:             Hardware interface to the ping pong registers
> >>    * @hw_intf:           Hardware interface to the intf registers
> >>    * @hw_wb:             Hardware interface to the wb registers
> >> + * @hw_cdm:            Hardware interface to the CDM registers
> >>    * @dpu_kms:           Pointer to the dpu_kms top level
> >>    * @cached_mode:       DRM mode cached at mode_set time, acted on in enable
> >>    * @enabled:           Whether the encoder has enabled and running a mode
> >> @@ -178,6 +179,7 @@ struct dpu_encoder_phys {
> >>          struct dpu_hw_pingpong *hw_pp;
> >>          struct dpu_hw_intf *hw_intf;
> >>          struct dpu_hw_wb *hw_wb;
> >> +       struct dpu_hw_cdm *hw_cdm;
> >>          struct dpu_kms *dpu_kms;
> >>          struct drm_display_mode cached_mode;
> >>          enum dpu_enc_split_role split_role;
> >> --
> >> 2.40.1
> >>
> >
> >



-- 
With best wishes
Dmitry

