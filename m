Return-Path: <linux-arm-msm+bounces-4275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 455BE80DD20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 22:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3D4A1F21BCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 21:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3555454BFB;
	Mon, 11 Dec 2023 21:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZTj4En5g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390BBB8
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 13:31:20 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-db632fef2dcso4854173276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 13:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702330279; x=1702935079; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YuklrYjWcOTs+XkpZrSUZD3XCm59iUhB/fuyZPiMpJ8=;
        b=ZTj4En5gF8duPenVe+BgUDKAA/uQYdMLjW/6w+dszAu1ksB8iu1sliOvuIfpVAdtfo
         tFFg94w7nG8/yvDJKDMJzamQ2S8/WxPI5jdrVZr9yrafCWCjsLvlQYGzUd0xMDkndl5R
         yy4+ohNxmMg29Ndqgr3tjDxlZ2KPKd8W9BHIdtdm5AOFvVDUrNQ01PA9E7XI1b/9IHsR
         m/iSKOQFAiukUHAPUcqtEYg6nH4OiYHqWL0ejgnb1YCs4mnMnvUf2hfRe5qrMEhXECKR
         v6RIMe0JDG41L7Fxhm2cTaPFSc9JgtSbVq8CXyl0SJ7VHF/+/z3eysBpb9u3EZHI370Y
         ybnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702330279; x=1702935079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YuklrYjWcOTs+XkpZrSUZD3XCm59iUhB/fuyZPiMpJ8=;
        b=dsUvZz5dsIk+TFIYwweYQJM1J2fH8TSK/8lKEt2BBppt1KE+/8cqGEvDtLkH5ZoFLX
         FqTsnBaELcqJEH3v4iVNtVN7uZDPaeHOJ7+NyJjpZE3BnHyirxgk2laMp6BH4IbRhNZ9
         iwfU+k8XKO63eox44aTd2HXuyE1k3RYyrtIzNBFTkbpxO88FonfqIaEXWIhpkTqq9bPQ
         MpH9teJ6TmjALUH4quAMMExueJkuRFxM4SnBrZVPrjC1HyayGEogjQaCFsF9KkRAjZPN
         89yXxm1ui1Hr4ePLJsyb/Mi2i4HfL48Wboeh7UJuO0G0uEsMl6Eu0z7vx0SXuxowUWLF
         au7w==
X-Gm-Message-State: AOJu0Yw+iglsqnVlFHS37sYnvE0IhBD0h/iOL7DpZsD36qyfUORpoFbE
	IgeY8fUAdZQEKzwWT4t1H+f678ZvqwkaZNaMGXHw7CzmOvr1fhDf5O6CaA==
X-Google-Smtp-Source: AGHT+IGQqhoI+KxGOe25sYIXnHw1HWBewU71k6nhxZZTP0O4IrPw0vYC5vm+Op22lSoK+zDeIAzJkpFzKVZAcsm7KNU=
X-Received: by 2002:a25:5f45:0:b0:dbc:b2e1:43e1 with SMTP id
 h5-20020a255f45000000b00dbcb2e143e1mr670824ybm.91.1702330279400; Mon, 11 Dec
 2023 13:31:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-6-quic_abhinavk@quicinc.com> <CAA8EJprR92=TRvYNu1dSTUcphUu3v-cD326AK2+80Ex8ppYBBw@mail.gmail.com>
 <4966bfa0-ef50-a02d-a917-86d82429e45e@quicinc.com>
In-Reply-To: <4966bfa0-ef50-a02d-a917-86d82429e45e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 23:31:08 +0200
Message-ID: <CAA8EJpqu42b0AP8Ar2LoFcrS51iKTUM1Qr++j7MYjv4WCx=tCg@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 23:16, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/8/2023 3:19 AM, Dmitry Baryshkov wrote:
> > On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> Add CDM blocks to the sc7280 dpu_hw_catalog to support
> >> YUV format output from writeback block.
> >>
> >> changes in v2:
> >>          - remove explicit zero assignment for features
> >>          - move sc7280_cdm to dpu_hw_catalog from the sc7280
> >>            catalog file as its definition can be re-used
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 10 ++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h         |  5 +++++
> >>   4 files changed, 29 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >> index 209675de6742..19c2b7454796 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >> @@ -248,6 +248,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
> >>          .mdss_ver = &sc7280_mdss_ver,
> >>          .caps = &sc7280_dpu_caps,
> >>          .mdp = &sc7280_mdp,
> >> +       .cdm = &sc7280_cdm,
> >>          .ctl_count = ARRAY_SIZE(sc7280_ctl),
> >>          .ctl = sc7280_ctl,
> >>          .sspp_count = ARRAY_SIZE(sc7280_sspp),
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> index d52aae54bbd5..1be3156cde05 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> @@ -426,6 +426,16 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
> >>          .ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
> >>   };
> >>
> >> +/*************************************************************
> >> + * CDM sub block config
> >
> > Nit: it is not a subblock config.
> >
>
> Ack.
>
> >> + *************************************************************/
> >> +static const struct dpu_cdm_cfg sc7280_cdm = {
> >
> > I know that I have r-b'ed this patch. But then one thing occurred to
> > me. If this definition is common to all (or almost all) platforms, can
> > we just call it dpu_cdm or dpu_common_cdm?
> >
> >> +       .name = "cdm_0",
> >> +       .id = CDM_0,
> >> +       .len = 0x228,
> >> +       .base = 0x79200,
> >> +};
>
> hmmm .... almost common but not entirely ... msm8998's CDM has a shorter
> len of 0x224 :(

Then sdm845_cdm?

>
> >> +
> >>   /*************************************************************
> >>    * VBIF sub blocks config
> >>    *************************************************************/
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> index e3c0d007481b..ba82ef4560a6 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> @@ -682,6 +682,17 @@ struct dpu_vbif_cfg {
> >>          u32 memtype[MAX_XIN_COUNT];
> >>   };
> >>
> >> +/**
> >> + * struct dpu_cdm_cfg - information of chroma down blocks
> >> + * @name               string name for debug purposes
> >> + * @id                 enum identifying this block
> >> + * @base               register offset of this block
> >> + * @features           bit mask identifying sub-blocks/features
> >> + */
> >> +struct dpu_cdm_cfg {
> >> +       DPU_HW_BLK_INFO;
> >> +};
> >> +
> >>   /**
> >>    * Define CDP use cases
> >>    * @DPU_PERF_CDP_UDAGE_RT: real-time use cases
> >> @@ -805,6 +816,8 @@ struct dpu_mdss_cfg {
> >>          u32 wb_count;
> >>          const struct dpu_wb_cfg *wb;
> >>
> >> +       const struct dpu_cdm_cfg *cdm;
> >> +
> >>          u32 ad_count;
> >>
> >>          u32 dspp_count;
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> index a6702b2bfc68..f319c8232ea5 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> @@ -185,6 +185,11 @@ enum dpu_dsc {
> >>          DSC_MAX
> >>   };
> >>
> >> +enum dpu_cdm {
> >> +       CDM_0 = 1,
> >> +       CDM_MAX
> >> +};
> >> +
> >>   enum dpu_pingpong {
> >>          PINGPONG_NONE,
> >>          PINGPONG_0,
> >> --
> >> 2.40.1
> >>
> >
> >



-- 
With best wishes
Dmitry

