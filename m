Return-Path: <linux-arm-msm+bounces-44673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2B7A082A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 23:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E5C53A72C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 22:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC3A204F66;
	Thu,  9 Jan 2025 22:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c5ZViUjG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCB61EBA0C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 22:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736460821; cv=none; b=OGT1CcOyB3wakHgj9dMiDr0TDBJXZF9QN6zppOpCzBh35k8Nr1VZgt08UzX264nmkcP0y3QS5HSEPTL/WnNxXkjr4V10U44duI+91T4mBl7THsaEY+GGyTp9Hi5as4XaOdFxeZ2Ut2EVJjP73zk0fPmTcBW+5OdWqT2OoJFBa/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736460821; c=relaxed/simple;
	bh=fkYxMiwpmWlEYf33zQEcimp9N/8qu5aCl5tKnxaOIzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SG5VLYaNunTIRdmPUI3o7kBPq8tb+pEqUgAtCABUxBVE1fDKdqglIdlPGJbPx/3katyCnWYKZ1ik1mq9O7n72b5rUHndKAvUupTfK6oIvKSR8b6NBBhMYG65hC8mECjgZNCikRwMsrTzEp8d7GEdYsKbt45FSoTinoa8p6DOmqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c5ZViUjG; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e4a6b978283so4137604276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 14:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736460819; x=1737065619; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xUUwMDuxFk7iXxFAzMUrfuguSSCdIGpu1yVZMh9bBNA=;
        b=c5ZViUjGoHB1WurQxuWYDjEw/mTiqhzF7IczowHbQp221btdhG+nkdwa1U2xLOSEez
         4TZSZKlO/suZb5/mSc1G5dsaEcz03RYgD1vH/+oANd7v//gaLY0uf7wHrqwddv4KRSfk
         7NgcMwI5wZMMXii23XBE7wG0/VqIBX1SH10pOUH8EDm/SWP1orXaigjYQlLWkqumgAj+
         vGFvz3xbPt2ZVkY3QBMBn4D9c8GX15Cg7BtZn3krHovWzI389x2Ql3PjzXoLHmXeOlEH
         qn8hEByK735AdtK3ww09HN71X4vodcedro2qy6DGnlT7bkArFesgUCR4sNSy7AhcbIyM
         aE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736460819; x=1737065619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUUwMDuxFk7iXxFAzMUrfuguSSCdIGpu1yVZMh9bBNA=;
        b=A7+ZaUhvRtjLyZ8Xh5/c7/8gQG2khFGuFE30+xN2K/5B0U6j55A/OgPPe5KsaGawl7
         g5ftmQ6PfeDNtxuGf0P4yA6HD0eQs1YvmDqGLxpNzlslN7ntRaSQ3g/tRF2Sn5Pm8Y+s
         D8fYxTsB7+gIwXKc0YZgXv4ni5C5Y4OvYavoNCR5sdaCIpbjhcobp064rIc3BbAKVjJ7
         4fyFQh2mXPJ2uMegLDWTG5irO4NZFTr6PHYkAfMbTfY+TyYk03Xwa8HKZ8x2cuEIOQpW
         m0gFbJDdoLWyVmDht1axOWwSBo/TZv1+PHu6CWKGJ/drFmeeYgEIDsb8kWN8iACoMoKS
         cG/A==
X-Forwarded-Encrypted: i=1; AJvYcCUoSZlyKg4vIA70HesGagR0jItyNTJDcQ8elOnuBk9Cw5JmJkHJmvxBOLeZqYfdkgb1Gv9TpjxCI29gqjeE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8v9EmCkTbyRxb97CVZtx5q+GDfZ/7hIUdIbzoH5lPXy8BBGkO
	Jdi3lh6u5SFR6RG0PWuy4bj/DY98siIPvwhFQ0M4PiQzVXVVNXtqDj8O2tNoI80bbc/T4Hl/DMl
	aH9uaK3FuFz8wzDWLv9zd3Z7H47x2bYkI9CSDw4wDewSeWq6M
X-Gm-Gg: ASbGncv1ONYTGbj3clF8athnH25I9Nu0of1jFSPlprx51nE03nE9K91LXR55zfu27O+
	ajpipoId6MZAl9rQgPRcgW/acu7DfRveAqcLj
X-Google-Smtp-Source: AGHT+IGTwUbfVVwdELwrYas47GuasUjXTmibCnM1l2u0eZlelpwJ2MX8VtiRAXHQyvobssDDWrtlYJxMY1V/9anst7M=
X-Received: by 2002:a05:6902:2309:b0:e38:b399:590b with SMTP id
 3f1490d57ef6-e55013ac8d6mr4118108276.2.1736460818718; Thu, 09 Jan 2025
 14:13:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-18-fe220297a7f0@quicinc.com> <z6pebzm5yxaqqmktu4jjjy4rojkdarrqrwo4ikmv6jzku7foyf@cc325q3dfgif>
 <ddd1db49-39d8-44b6-b658-b30fe8ba4428@quicinc.com> <pp2uifxzgqmg3ske3mmlgznzb76eovxvgv6y6kfafk5wvoq3ou@5x7bwdkipius>
 <5f054c0a-8f1f-4b13-bb5d-505ce4dbfb34@quicinc.com> <jtovhd4zsaumm27gzwlkufqywyr2he36rmo6jjm2vnchkjeugd@fdpws67sjlfx>
 <a8e6be19-06c8-4f95-a31f-2be5f27f2e6a@quicinc.com>
In-Reply-To: <a8e6be19-06c8-4f95-a31f-2be5f27f2e6a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 Jan 2025 00:13:27 +0200
X-Gm-Features: AbW1kvYGTw8Fr2w-PmtPLXVpaTVg0dzAJ-dM7jmq-1kMIK-lcg1rIwXnQ4Ss-cg
Message-ID: <CAA8EJprtbswuxGr3237PAHQY_KqxpfqS5AXRjAQA1sxUkvgumg@mail.gmail.com>
Subject: Re: [PATCH v4 18/25] drm/msm/dpu: Reserve resources for CWB
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, quic_ebharadw@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jan 2025 at 23:26, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 12/28/2024 8:47 PM, Dmitry Baryshkov wrote:
> > On Thu, Dec 26, 2024 at 02:49:28PM -0800, Jessica Zhang wrote:
> >>
> >>
> >> On 12/20/2024 5:07 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Dec 20, 2024 at 04:12:29PM -0800, Jessica Zhang wrote:
> >>>>
> >>>>
> >>>> On 12/19/2024 9:52 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, Dec 16, 2024 at 04:43:29PM -0800, Jessica Zhang wrote:
> >>>>>> Add support for RM to reserve dedicated CWB PINGPONGs and CWB muxes
> >>>>>>
> >>>>>> For concurrent writeback, even-indexed CWB muxes must be assigned to
> >>>>>> even-indexed LMs and odd-indexed CWB muxes for odd-indexed LMs. The same
> >>>>>> even/odd rule applies for dedicated CWB PINGPONGs.
> >>>>>>
> >>>>>> Track the CWB muxes in the global state and add a CWB-specific helper to
> >>>>>> reserve the correct CWB muxes and dedicated PINGPONGs following the
> >>>>>> even/odd rule.
> >>>>>>
> >>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 34 ++++++++++--
> >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +
> >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
> >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 83 +++++++++++++++++++++++++++++
> >>>>>>     4 files changed, 116 insertions(+), 4 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>>>>> index a895d48fe81ccc71d265e089992786e8b6268b1b..a95dc1f0c6a422485c7ba98743e944e1a4f43539 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>>>>> @@ -2,7 +2,7 @@
> >>>>>>     /*
> >>>>>>      * Copyright (C) 2013 Red Hat
> >>>>>>      * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
> >>>>>> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >>>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>>>>>      *
> >>>>>>      * Author: Rob Clark <robdclark@gmail.com>
> >>>>>>      */
> >>>>>> @@ -28,6 +28,7 @@
> >>>>>>     #include "dpu_hw_dsc.h"
> >>>>>>     #include "dpu_hw_merge3d.h"
> >>>>>>     #include "dpu_hw_cdm.h"
> >>>>>> +#include "dpu_hw_cwb.h"
> >>>>>>     #include "dpu_formats.h"
> >>>>>>     #include "dpu_encoder_phys.h"
> >>>>>>     #include "dpu_crtc.h"
> >>>>>> @@ -133,6 +134,9 @@ enum dpu_enc_rc_states {
> >>>>>>      * @cur_slave:               As above but for the slave encoder.
> >>>>>>      * @hw_pp:           Handle to the pingpong blocks used for the display. No.
> >>>>>>      *                   pingpong blocks can be different than num_phys_encs.
> >>>>>> + * @hw_cwb:             Handle to the CWB muxes used for concurrent writeback
> >>>>>> + *                      display. Number of CWB muxes can be different than
> >>>>>> + *                      num_phys_encs.
> >>>>>>      * @hw_dsc:          Handle to the DSC blocks used for the display.
> >>>>>>      * @dsc_mask:                Bitmask of used DSC blocks.
> >>>>>>      * @intfs_swapped:   Whether or not the phys_enc interfaces have been swapped
> >>>>>> @@ -177,6 +181,7 @@ struct dpu_encoder_virt {
> >>>>>>          struct dpu_encoder_phys *cur_master;
> >>>>>>          struct dpu_encoder_phys *cur_slave;
> >>>>>>          struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> >>>>>> +        struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
> >>>>>>          struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> >>>>>>          unsigned int dsc_mask;
> >>>>>> @@ -1138,7 +1143,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>>>>>          struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> >>>>>>          struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> >>>>>>          struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> >>>>>> +        struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
> >>>>>>          int num_pp, num_dsc, num_ctl;
> >>>>>> +        int num_cwb = 0;
> >>>>>> +        bool is_cwb_encoder;
> >>>>>>          unsigned int dsc_mask = 0;
> >>>>>>          int i;
> >>>>>> @@ -1152,6 +1160,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>>>>>          priv = drm_enc->dev->dev_private;
> >>>>>>          dpu_kms = to_dpu_kms(priv->kms);
> >>>>>> +        is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
> >>>>>> +                        dpu_enc->disp_info.intf_type == INTF_WB;
> >>>>>>          global_state = dpu_kms_get_existing_global_state(dpu_kms);
> >>>>>>          if (IS_ERR_OR_NULL(global_state)) {
> >>>>>> @@ -1162,9 +1172,25 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>>>>>          trace_dpu_enc_mode_set(DRMID(drm_enc));
> >>>>>>          /* Query resource that have been reserved in atomic check step. */
> >>>>>> -        num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>>>>> -                drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> >>>>>> -                ARRAY_SIZE(hw_pp));
> >>>>>> +        if (is_cwb_encoder) {
> >>>>>> +                num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>>>>> +                                                       drm_enc->crtc,
> >>>>>> +                                                       DPU_HW_BLK_DCWB_PINGPONG,
> >>>>>> +                                                       hw_pp, ARRAY_SIZE(hw_pp));
> >>>>>> +                num_cwb = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>>>>> +                                                       drm_enc->crtc,
> >>>>>> +                                                       DPU_HW_BLK_CWB,
> >>>>>> +                                                       hw_cwb, ARRAY_SIZE(hw_cwb));
> >>>>>> +        } else {
> >>>>>> +                num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>>>>> +                                                       drm_enc->crtc,
> >>>>>> +                                                       DPU_HW_BLK_PINGPONG, hw_pp,
> >>>>>> +                                                       ARRAY_SIZE(hw_pp));
> >>>>>> +        }
> >>>>>> +
> >>>>>> +        for (i = 0; i < num_cwb; i++)
> >>>>>> +                dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
> >>>>>> +
> >>>>>>          num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>>>>>                          drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >>>>>> index ba7bb05efe9b8cac01a908e53121117e130f91ec..8d820cd1b5545d247515763039b341184e814e32 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >>>>>> @@ -77,12 +77,14 @@ enum dpu_hw_blk_type {
> >>>>>>          DPU_HW_BLK_LM,
> >>>>>>          DPU_HW_BLK_CTL,
> >>>>>>          DPU_HW_BLK_PINGPONG,
> >>>>>> +        DPU_HW_BLK_DCWB_PINGPONG,
> >>>>>>          DPU_HW_BLK_INTF,
> >>>>>>          DPU_HW_BLK_WB,
> >>>>>>          DPU_HW_BLK_DSPP,
> >>>>>>          DPU_HW_BLK_MERGE_3D,
> >>>>>>          DPU_HW_BLK_DSC,
> >>>>>>          DPU_HW_BLK_CDM,
> >>>>>> +        DPU_HW_BLK_CWB,
> >>>>>>          DPU_HW_BLK_MAX,
> >>>>>>     };
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> >>>>>> index 48d756d8f8c6e4ab94b72bac0418320f7dc8cda8..1fc8abda927fc094b369e0d1efc795b71d6a7fcb 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> >>>>>> @@ -128,6 +128,7 @@ struct dpu_global_state {
> >>>>>>          uint32_t dspp_to_crtc_id[DSPP_MAX - DSPP_0];
> >>>>>>          uint32_t dsc_to_crtc_id[DSC_MAX - DSC_0];
> >>>>>>          uint32_t cdm_to_crtc_id;
> >>>>>> +        uint32_t cwb_to_crtc_id[CWB_MAX - CWB_0];
> >>>>>>     };
> >>>>>>     struct dpu_global_state
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>>>>> index 85adaf256b2c705d2d7df378b6ffc0e578f52bc3..ead24bb0ceb5d8ec4705f0d32330294d0b45b216 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>>>>> @@ -234,6 +234,55 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
> >>>>>>          return -EINVAL;
> >>>>>>     }
> >>>>>> +static int _dpu_rm_reserve_cwb_mux_and_pingpongs(struct dpu_rm *rm,
> >>>>>> +                                                 struct dpu_global_state *global_state,
> >>>>>> +                                                 uint32_t crtc_id,
> >>>>>> +                                                 struct msm_display_topology *topology)
> >>>>>> +{
> >>>>>> +        int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
> >>>>>> +        int cwb_pp_start_idx = PINGPONG_CWB_0 - PINGPONG_0;
> >>>>>> +        int cwb_pp_idx[MAX_BLOCKS];
> >>>>>> +        int cwb_mux_idx[MAX_BLOCKS];
> >>>>>> +
> >>>>>> +        /*
> >>>>>> +         * Reserve additional dedicated CWB PINGPONG blocks and muxes for each
> >>>>>> +         * mixer
> >>>>>> +         *
> >>>>>> +         * TODO: add support reserving resources for platforms with no
> >>>>>> +         *       PINGPONG_CWB
> >>>>>
> >>>>> What about doing it other way around: allocate CWBs first as required
> >>>>> (even/odd, proper count, etc). Then for each of CWBs allocate a PP block
> >>>>> (I think it's enough to simply make CWB blocks have a corresponding PP
> >>>>> index as a property). This way the driver can handle both legacy and
> >>>>> current platforms.
> >>>>
> >>>> Hi Dmitry,
> >>>>
> >>>> Sorry if I'm misunderstanding your suggestion, but the main change needed to
> >>>> support platforms with no dedicated PINGPONG_CWB is where in the
> >>>> rm->pingpong_blks list to start assigning pingpong blocks for the CWB mux.
> >>>> I'm not sure how changing the order in which CWBs and the pingpong blocks
> >>>> are assigned will address that.
> >>>>
> >>>> (FWIW, the only change necessary to add support for non-dedicated
> >>>> PINGPONG_CWBs platforms for this function should just be changing the
> >>>> initialization value of cwb_pp_start_idx)
> >>>
> >>> If I remember correctly, we have identified several generations of DPU
> >>> wrt. CWB handling:
> >>> - 8.1+ (or 8.0+?), DCWB, dedicated PP blocks
> >>> - 7.2, dedicated PP_1?
> >>> - 5.0+, shared PP blocks
> >>> - older DPUs, special handling of PP
> >>>
> >>> If the driver allocates PP first and then first it has to allocated PP
> >>> (in a platform-specific way) and then go from PINGPONG to CWB (in a
> >>> platform-specific way). If CWB is allocated first, then you have only
> >>> one platform-specific piece of code that gets PINGPONG for the CWB (and
> >>> as this function is called after the CWB allocation, the major part of
> >>> the CWB / PP allocation is generic).
> >>
> >> The issue with breaking this into separate helpers/functions is that the CWB
> >> mux and PPB indices are dependent on each other. But I agree that we can
> >> reserve CWB mux and the PPBs in 2 separate loops within this helper to
> >> minimize the special platform-specific handling.
> >
> > Doesn't it just PPB depend on CWB?
>
> Sorry, poor wording on my part. Was referring specifically to this part
> of the logic within the code chunk:
>
> ```
> cwb_pp_idx[cwb_pp_count] = j;
> cwb_mux_idx[cwb_pp_count] = j - cwb_pp_start_idx;
> ```
>
> The point I wanted to make was that I think we can keep the CWB-specific
> reservation of the the PPBs and muxes in this function, but I agree with
> your suggestion to reserve the CWBs first and the PPBs second (just in
> separate loops rather than separate functions).

Sounds fine with me. I don't think you even need a second loop, just
simple maths should be fine.

>
>
> >
> >
> >>
> >> Also wanted to note that the comment doc on the PPB odd/even rule is
> >> inaccurate -- technically the odd/even rule applies specifically to the CWB
> >> mux as odd/even LMs are hardwired to their respective CWB muxes. Will
> >> correct the comment doc to be more accurate.
> >
> > Yes, please fix that.
> >
> >>
> >> Thanks,
> >>
> >> Jessica Zhang
> >>
> >
> > --
> > With best wishes
> > Dmitry
>


-- 
With best wishes
Dmitry

