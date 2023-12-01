Return-Path: <linux-arm-msm+bounces-2844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D7F8005E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 09:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 252FC28186C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 08:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B383C1C2B7;
	Fri,  1 Dec 2023 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w/SbIx7R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4160710D7
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 00:39:34 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5d3efc071e2so7101377b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 00:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701419973; x=1702024773; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QM9xhtSWl8bZod+heLo+OxtwiUVff2dCtOs0sAGegx4=;
        b=w/SbIx7Rri7db/tA1bsHTWwhsiN5T4Yfo+Sc2AcnWLv7+4fXgOGTJmC4+4GJGbmRXd
         w7VN7jIiqU9v/uPHcBcrPy9YmGM82LHldXxVV5IzYXCS9NVI79WuKwpu2D+yj5ZkfMSH
         z2309llgI4MmRR18bJVwwHdSbb6hYn1JMqWPzrVhrS3Gc/7gA9UtcdDiRG3x19MvtacM
         /PlNrfFq5BplyAK1vnf+hhljvlNbhdUmU4fLDA7ofuwgumpFmJ1lkL1c1S7tkIoACssx
         8kBrsekfupaZcGBlwfcnhAcZLFiLS3YXZTJxqtpfTntZk/ggpni5ws3tWTfjh+9nxbdA
         gEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701419973; x=1702024773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QM9xhtSWl8bZod+heLo+OxtwiUVff2dCtOs0sAGegx4=;
        b=W8eqZRogwzHpxQGLNqVdLq9os9L5DyytTcygF8bD46saSbaMlt8jLV+qJfVC9WQAgh
         pXSi9zrI5HUnFyJw83SUk6+imlZlpyIRupggF5N9sBJOGOhH5/bujB/ysjDqnRNUb7zI
         0AUAPNMmj08lKyBVoZ62ZOktjL/vATOx26/UEqEh3+JX6PPduk8OKtqPqE6Or5v1dpie
         UWFNjT+eKq6PU8iu+J6rPg8pUm6Yg5vIYgaklQ0Ny0HRJycx9vwsIT4PPva7Oif/mLYa
         Bn6+lHYW+/aL5cu7KYN3tCEqn0jCQUMJapm5Gg5lGi17l8HK9jikag2Ye5AAV1uBg6XM
         heYQ==
X-Gm-Message-State: AOJu0YzIYtGrXcuLRcwh3Ap0x7Ofrllif2q5g+eyUc/01/tG0TrhF/V2
	8ZRLff5eHRR70/ywUCuw3LNBl96bJBT9PTWBlSQQ2w==
X-Google-Smtp-Source: AGHT+IFmyIRr/gCqW6f+UW7j7jp8SM1NhNjkR32wOxNjKbwQ4wkSgwoud6Vt7F9+XZwH/86mmn+tBWKoGO57Bl+YGDU=
X-Received: by 2002:a81:b71b:0:b0:5ca:da4c:306a with SMTP id
 v27-20020a81b71b000000b005cada4c306amr296205ywh.51.1701419973356; Fri, 01 Dec
 2023 00:39:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-9-quic_abhinavk@quicinc.com> <CAA8EJporcrBikTob9xJe8_96AJSP1vDJNYPkt1za73PAcg1+Bw@mail.gmail.com>
 <396724e1-2c51-090e-cfa5-e516a0eea861@quicinc.com>
In-Reply-To: <396724e1-2c51-090e-cfa5-e516a0eea861@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 10:39:22 +0200
Message-ID: <CAA8EJpqTYcPw0DqBqydZRbNZ7Mex_Q4Kkxnjni7XxKtqLomkPQ@mail.gmail.com>
Subject: Re: [PATCH 08/16] drm/msm/dpu: add support to allocate CDM from RM
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, quic_khsieh@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Dec 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 8/30/2023 5:06 PM, Dmitry Baryshkov wrote:
> > On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> Even though there is usually only one CDM block, it can be
> >> used by either HDMI, DisplayPort OR Writeback interfaces.
> >>
> >> Hence its allocation needs to be tracked properly by the
> >> resource manager to ensure appropriate availability of the
> >> block.
> >
> > It almost feels like an overkill, as up to now there is at most one CDM block.
> >
>
> Yes but even that one CDM block can be used by any connector. So as we
> discussed on IRC, this just implements the FCFS and we need RM to be the
> manager of that one block.

Yes. "almost"

>
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 45 +++++++++++++++++++--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  4 +-
> >>   5 files changed, 48 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 6cf6597148fd..582680804016 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -663,7 +663,7 @@ static int dpu_encoder_virt_atomic_check(
> >>
> >>                  if (!crtc_state->active_changed || crtc_state->enable)
> >>                          ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> >> -                                       drm_enc, crtc_state, topology);
> >> +                                       drm_enc, crtc_state, topology, false);
> >>          }
> >>
> >>          trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> index 34f943102499..07f75f295844 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> @@ -98,6 +98,7 @@ enum dpu_hw_blk_type {
> >>          DPU_HW_BLK_DSPP,
> >>          DPU_HW_BLK_MERGE_3D,
> >>          DPU_HW_BLK_DSC,
> >> +       DPU_HW_BLK_CDM,
> >>          DPU_HW_BLK_MAX,
> >>   };
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> >> index b6f53ca6e962..61aa58643fda 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> >> @@ -136,6 +136,7 @@ struct dpu_global_state {
> >>          uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
> >>          uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
> >>          uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
> >> +       uint32_t cdm_to_enc_id;
> >>   };
> >>
> >>   struct dpu_global_state
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> index 7b6444a3fcb1..e7d4beb4661e 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> @@ -29,10 +29,12 @@ static inline bool reserved_by_other(uint32_t *res_map, int idx,
> >>   /**
> >>    * struct dpu_rm_requirements - Reservation requirements parameter bundle
> >>    * @topology:  selected topology for the display
> >> + * @needs_cdm: whether the display needs a CDM block for the current mode
> >>    * @hw_res:       Hardware resources required as reported by the encoders
> >>    */
> >>   struct dpu_rm_requirements {
> >>          struct msm_display_topology topology;
> >> +       bool needs_cdm;
> >>   };
> >>
> >>   int dpu_rm_destroy(struct dpu_rm *rm)
> >> @@ -505,6 +507,26 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> >>          return 0;
> >>   }
> >>
> >> +static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
> >> +                              struct dpu_global_state *global_state,
> >> +                              struct drm_encoder *enc)
> >> +{
> >> +       /* try allocating only one CDM block */
> >> +       if (!rm->cdm_blk) {
> >> +               DPU_ERROR("CDM block does not exist\n");
> >> +               return -EIO;
> >> +       }
> >> +
> >> +       if (global_state->cdm_to_enc_id) {
> >> +               DPU_ERROR("CDM_0 is already allocated\n");
> >> +               return -EIO;
> >> +       }
> >> +
> >> +       global_state->cdm_to_enc_id = enc->base.id;
> >> +
> >> +       return 0;
> >> +}
> >> +
> >>   static int _dpu_rm_make_reservation(
> >>                  struct dpu_rm *rm,
> >>                  struct dpu_global_state *global_state,
> >> @@ -530,15 +552,25 @@ static int _dpu_rm_make_reservation(
> >>          if (ret)
> >>                  return ret;
> >>
> >> +       if (reqs->needs_cdm) {
> >> +               ret = _dpu_rm_reserve_cdm(rm, global_state, enc);
> >> +               if (ret) {
> >> +                       DPU_ERROR("unable to find CDM blk\n");
> >> +                       return ret;
> >> +               }
> >> +       }
> >> +
> >>          return ret;
> >>   }
> >>
> >>   static int _dpu_rm_populate_requirements(
> >>                  struct drm_encoder *enc,
> >>                  struct dpu_rm_requirements *reqs,
> >> -               struct msm_display_topology req_topology)
> >> +               struct msm_display_topology req_topology,
> >> +               bool needs_cdm)
> >
> > Push it to the topology, please. It is a part of the topology at some
> > point of view.
> >
>
> hmmm ... ok with a pinch of salt as we somewhat deviate from the true
> topology definition that topology is just how lm, dsc and intf blocks
> are used. it was not intended to hold cdm.

Why not? I mean it is more logical compared to adding the 'needs_cdm'
argument which gets passed through together with the topology.

>
> >>   {
> >>          reqs->topology = req_topology;
> >> +       reqs->needs_cdm = needs_cdm;
> >>
> >>          DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
> >>                        reqs->topology.num_lm, reqs->topology.num_dsc,
> >> @@ -571,6 +603,7 @@ void dpu_rm_release(struct dpu_global_state *global_state,
> >>                  ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
> >>          _dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
> >>                  ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
> >> +       _dpu_rm_clear_mapping(&global_state->cdm_to_enc_id, 1, enc->base.id);
> >>   }
> >>
> >>   int dpu_rm_reserve(
> >> @@ -578,7 +611,8 @@ int dpu_rm_reserve(
> >>                  struct dpu_global_state *global_state,
> >>                  struct drm_encoder *enc,
> >>                  struct drm_crtc_state *crtc_state,
> >> -               struct msm_display_topology topology)
> >> +               struct msm_display_topology topology,
> >> +               bool needs_cdm)
> >>   {
> >>          struct dpu_rm_requirements reqs;
> >>          int ret;
> >> @@ -595,7 +629,7 @@ int dpu_rm_reserve(
> >>          DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
> >>                        enc->base.id, crtc_state->crtc->base.id);
> >>
> >> -       ret = _dpu_rm_populate_requirements(enc, &reqs, topology);
> >> +       ret = _dpu_rm_populate_requirements(enc, &reqs, topology, needs_cdm);
> >>          if (ret) {
> >>                  DPU_ERROR("failed to populate hw requirements\n");
> >>                  return ret;
> >> @@ -644,6 +678,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >>                  hw_to_enc_id = global_state->dsc_to_enc_id;
> >>                  max_blks = ARRAY_SIZE(rm->dsc_blks);
> >>                  break;
> >> +       case DPU_HW_BLK_CDM:
> >> +               hw_blks = &rm->cdm_blk;
> >> +               hw_to_enc_id = &global_state->cdm_to_enc_id;
> >> +               max_blks = 1;
> >> +               break;
> >>          default:
> >>                  DPU_ERROR("blk type %d not managed by rm\n", type);
> >>                  return 0;
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >> index 29b221491926..74262d3cb6c3 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >> @@ -69,13 +69,15 @@ int dpu_rm_destroy(struct dpu_rm *rm);
> >>    * @drm_enc: DRM Encoder handle
> >>    * @crtc_state: Proposed Atomic DRM CRTC State handle
> >>    * @topology: Pointer to topology info for the display
> >> + * @needs_cdm: bool to indicate whether current encoder needs CDM
> >>    * @Return: 0 on Success otherwise -ERROR
> >>    */
> >>   int dpu_rm_reserve(struct dpu_rm *rm,
> >>                  struct dpu_global_state *global_state,
> >>                  struct drm_encoder *drm_enc,
> >>                  struct drm_crtc_state *crtc_state,
> >> -               struct msm_display_topology topology);
> >> +               struct msm_display_topology topology,
> >> +               bool needs_cdm);
> >>
> >>   /**
> >>    * dpu_rm_reserve - Given the encoder for the display chain, release any
> >> --
> >> 2.40.1
> >>
> >
> >



-- 
With best wishes
Dmitry

