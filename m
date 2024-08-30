Return-Path: <linux-arm-msm+bounces-30318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B7E966C52
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 00:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5890C1C20B7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 22:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D7D1C1AA1;
	Fri, 30 Aug 2024 22:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Boud+8qt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63C81BDAB1
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 22:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725056847; cv=none; b=iALD9kzahrXrBO7pwqq5G9Ct7UfRhCAkBBA1LMZ17nfOufP+yBrivEiJms30SUrOaBaHrP8zhs3u/KRW0cmfFlKXGiAW3xhy9SNpsH5y3cSXpi3kj8jq/NDm35i56eO2a+0tSq8fbQY3/zDDku0mXDZZkDIhHJ4Go5yWUSktW2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725056847; c=relaxed/simple;
	bh=PS4qrz7HD24jFDAaKohT3DS0VGv34tiVvYaV/B02vn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ntEu5sU/sgXr+cnWVra2eubFsDiXuMGehPEx4vl+meTlSbSszw0G1tbdO54RBHu93T2e9GgD5MDXYftUoJ0+YjCTKg/1RTxOQmAjq3xPipWpgllVuhNcOl8JRjksxSS5tegZX5osZLz2SdO33AkW02clSy9s8Cjf6/HVdfzEg2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Boud+8qt; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-690ad83d4d7so20158027b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 15:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725056844; x=1725661644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s2YyHYQPYgxsMsPEBmOViYLSp8VfKsvDm7dsGMy40Fw=;
        b=Boud+8qt2FEpV19JJJR2loSasAbaomDODwA+TM/WPI3IQJWP5M2X7XrbOb4tJvm0lV
         zX924+kMU7g07HOFpWybOCOE1EmvFh4RLR2nC7yGDLOU5bfbsJT7TIGFfxXlbB/xjn0Q
         Hcvk0h5/08hZpVVO/iIHwUTnpPmM15+hYDsvYAV1hkwNW+tlzpOgQGeXhTGO3T1WvWi9
         7lUmobeEw9zwjkx8x60o5r0iCpZ3nsQMCeT+k2Si63T2veQKyfYHcdmNmOD8YYTFaiXA
         JZiz64o4ylEsdxFBvNiv1RM3fdMngZru3zli/ULLbuGd8pim0tEO1ABPccVDh3yo2BQk
         YpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725056844; x=1725661644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2YyHYQPYgxsMsPEBmOViYLSp8VfKsvDm7dsGMy40Fw=;
        b=Fhg6AmRdt4RmsKogoENbinnlKdTwtrYpWnHr3DXEfurQbn0e3kBKTwyuF/kK4ztrA/
         0M/dgn/Qrs4eRgU6dBUQ7jS7dFAozKxIF4Ovs7K1ALOaaziBbg2C1gFNOyTNlGize+it
         DELOsejORrARxBxyURw1nt7xn3D3XLJ10ZZusZqWAfvbuq4pmCoWRiyQ3Uh0nbBCLh/p
         WBtDrA6ntq7EFNAPgze/5HYVQ2PCVerLpdLYb92SFm1YXxpXfOCTYLhcK0+vi2HLiASd
         rA1LgFuCRCC9ICHnMOxZif+ChHkMpFiEUEFEGUQGS+AR5l321E4NS4KWdA0SdS1SPUq4
         BtZw==
X-Forwarded-Encrypted: i=1; AJvYcCV7mw5oKvJdHUpXch8nJRJjF/cvC1yNDsV0INxKYqEAYXt4l+XUkprfYHXPETCWpUZZYPjnw+54ILs6d4Hg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb76AENTz0kO4usRU5tYXNLnf8tYOrCuL6SEyU8kV3wRVqJYyH
	9tlv6ffws1jXILP8TJka/irTuqlkd3QErlk0bUieGqbvx9i6tsAk9qZ+D4WdkY1gDhP1/CuyrKn
	70RHoTYp66OI2sDyMQNjFYdJkX6wrnMdOvBHVYQ==
X-Google-Smtp-Source: AGHT+IG5eeD0svxWOfKQwLe6u0kOlsZgvlnrOv/bBgjzxMzWKdezSyNigVWnbhK/aYuDYPPFgPzzOaztniLlErcg8Yk=
X-Received: by 2002:a05:690c:dc1:b0:643:92a8:ba00 with SMTP id
 00721157ae682-6d40b0f7ea3mr46607747b3.0.1725056843655; Fri, 30 Aug 2024
 15:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-14-502b16ae2ebb@quicinc.com> <yohtzxysheoybac24hxil6zzzsqi4inx6oh6x7vaoj5lvtdf3u@vd5nax37ilqd>
 <a73def5c-46f6-4467-958d-20f28ce8ad2c@quicinc.com>
In-Reply-To: <a73def5c-46f6-4467-958d-20f28ce8ad2c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 31 Aug 2024 01:27:12 +0300
Message-ID: <CAA8EJppTqdCvaxBwretFVM6wV-NOLpxNGJCyxO8EXvvqZXF=sw@mail.gmail.com>
Subject: Re: [PATCH 14/21] drm/msm/dpu: Reserve resources for CWB
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Aug 2024 at 23:28, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> On 8/30/2024 10:25 AM, Dmitry Baryshkov wrote:
> > On Thu, Aug 29, 2024 at 01:48:35PM GMT, Jessica Zhang wrote:
> >> Reserve dedicated pingpong blocks for CWB
> >
> > Please explain design ideas. Having just a single phrase is usually not
> > enough.
> >
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 ++++++--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 65 +++++++++++++++++++++++++++++
> >>   3 files changed, 79 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 36b677cf9c7a..f1bd14d1f89e 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -2,7 +2,7 @@
> >>   /*
> >>    * Copyright (C) 2013 Red Hat
> >>    * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
> >> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>    *
> >>    * Author: Rob Clark <robdclark@gmail.com>
> >>    */
> >> @@ -1054,6 +1054,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>      struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> >>      struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> >>      int num_pp, num_dsc;
> >> +    bool is_cwb_encoder;
> >>      unsigned int dsc_mask = 0;
> >>      int i;
> >>
> >> @@ -1067,6 +1068,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>
> >>      priv = drm_enc->dev->dev_private;
> >>      dpu_kms = to_dpu_kms(priv->kms);
> >> +    is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
> >> +            dpu_enc->disp_info.intf_type == INTF_WB;
> >>
> >>      global_state = dpu_kms_get_existing_global_state(dpu_kms);
> >>      if (IS_ERR_OR_NULL(global_state)) {
> >> @@ -1077,9 +1080,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>      trace_dpu_enc_mode_set(DRMID(drm_enc));
> >>
> >>      /* Query resource that have been reserved in atomic check step. */
> >> -    num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >> -            drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> >> -            ARRAY_SIZE(hw_pp));
> >> +    if (is_cwb_encoder)
> >> +            num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >> +                    drm_enc->crtc, DPU_HW_BLK_DCWB_PINGPONG, hw_pp,
> >> +                    ARRAY_SIZE(hw_pp));
> >> +    else
> >> +            num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >> +                    drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> >> +                    ARRAY_SIZE(hw_pp));
> >
> > Why is this necessary? Can we still use DPU_HW_BLK_PINGPONG?
>
> Hi Dmitry,
>
> Since both regular non-cwb pingpongs and pingpongs dedicated for cwb
> both share the same pingpong_to_crtc_id map, I need a way to distinguish
> between the real-time and dedicated cwb pingpongs.
>
> If I don't do that, get_assigned_resources would populate the hw_pp
> array for both the real-time and WB encoders with *only* the real-time
> display pingpongs.

I see. It looks like PINGPONG blocks should be allocated / filled
per-encoder, not per-CRTC. Likewise CDM is encoder-specific, not
CRTC-specific.
Does that solve the issue?

>
> >
> >> +
> >>      dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>                      drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> index c43cb55fe1d2..c87790a1b940 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> @@ -77,6 +77,7 @@ enum dpu_hw_blk_type {
> >>      DPU_HW_BLK_LM,
> >>      DPU_HW_BLK_CTL,
> >>      DPU_HW_BLK_PINGPONG,
> >> +    DPU_HW_BLK_DCWB_PINGPONG,
> >>      DPU_HW_BLK_INTF,
> >>      DPU_HW_BLK_WB,
> >>      DPU_HW_BLK_DSPP,
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> index 13f84375e15d..afad26556cd5 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> @@ -236,6 +236,48 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
> >>      return -EINVAL;
> >>   }
> >>
> >> +static int _dpu_rm_reserve_cwb_pingpong(struct dpu_rm *rm,
> >> +            struct dpu_global_state *global_state, uint32_t crtc_id,
> >> +            struct msm_display_topology *topology)
> >> +{
> >> +    int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
> >> +    int cwb_pp_idx[MAX_BLOCKS];
> >> +
> >> +    /*
> >> +     * Reserve additional dedicated CWB pingpong blocks for each mixer
> >> +     *
> >> +     * TODO: add support for reserving non-dedicated CWB pingpong blocks
> >> +     */
> >> +    for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
> >> +                    cwb_pp_count < num_cwb_pp; i++) {
> >> +            for (int j = PINGPONG_CWB_0 - PINGPONG_0;
> >> +                            j < ARRAY_SIZE(rm->pingpong_blks); j++) {
> >
> > Alignment...
>
> Ack -- for future reference, should I always align the second line with
> the bracket of the previous line?
>
> I thought the general guideline was 2 tabs, but I might be misremembering.

I can't find the textual reference, however .clang-format in the root
dir has 'AlignAfterOpenBracket: Align'. I'm more or less ignorant for
the function argument alignment (especially if an old function is
being modified), but aligning the conditions and loops makes it easier
to read the code.

>
> Thanks,
>
> Jessica Zhang
>
> >
> >> +                    /*
> >> +                     * Odd LMs must be assigned to odd pingpongs and even
> >> +                     * LMs with even pingpongs
> >> +                     */
> >> +                    if (reserved_by_other(global_state->pingpong_to_crtc_id,
> >> +                                            j, crtc_id) ||
> >> +                                    i % 2 != j % 2)
> >> +                            continue;
> >> +
> >> +                    cwb_pp_idx[cwb_pp_count] = j;
> >> +                    cwb_pp_count++;
> >> +                    break;
> >> +            }
> >> +    }
> >> +
> >> +    if (cwb_pp_count != num_cwb_pp) {
> >> +            DPU_ERROR("Unable to reserve all cwb pingpongs\n");
> >> +            return -ENAVAIL;
> >> +    }
> >> +
> >> +    for (int i = 0; i < cwb_pp_count; i++)
> >> +            global_state->pingpong_to_crtc_id[cwb_pp_idx[i]] = crtc_id;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>   /**
> >>    * _dpu_rm_check_lm_and_get_connected_blks - check if proposed layer mixer meets
> >>    * proposed use case requirements, incl. hardwired dependent blocks like
> >> @@ -617,6 +659,14 @@ static int _dpu_rm_make_reservation(
> >>              return ret;
> >>      }
> >>
> >> +    if (topology->cwb_enabled) {
> >> +            ret = _dpu_rm_reserve_cwb_pingpong(rm, global_state,
> >> +                            crtc_id, topology);
> >> +            if (ret) {
> >> +                    DPU_ERROR("unable to find appropriate dcwb pingpongs\n");
> >> +                    return ret;
> >> +            }
> >> +    }
> >>
> >>      ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
> >>                      topology);
> >> @@ -706,6 +756,7 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >>
> >>      switch (type) {
> >>      case DPU_HW_BLK_PINGPONG:
> >> +    case DPU_HW_BLK_DCWB_PINGPONG:
> >>              hw_blks = rm->pingpong_blks;
> >>              hw_to_crtc_id = global_state->pingpong_to_crtc_id;
> >>              max_blks = ARRAY_SIZE(rm->pingpong_blks);
> >> @@ -745,6 +796,20 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >>              if (hw_to_crtc_id[i] != crtc_id)
> >>                      continue;
> >>
> >> +            if (type == DPU_HW_BLK_PINGPONG) {
> >> +                    struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> >> +
> >> +                    if (pp->idx >= PINGPONG_CWB_0)
> >> +                            continue;
> >> +            }
> >> +
> >> +            if (type == DPU_HW_BLK_DCWB_PINGPONG) {
> >> +                    struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> >> +
> >> +                    if (pp->idx < PINGPONG_CWB_0)
> >> +                            continue;
> >> +            }
> >> +
> >>              if (num_blks == blks_size) {
> >>                      DPU_ERROR("More than %d resources assigned to crtc %d\n",
> >>                                blks_size, crtc_id);
> >>
> >> --
> >> 2.34.1
> >>
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

On Fri, 30 Aug 2024 at 23:28, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 8/30/2024 10:25 AM, Dmitry Baryshkov wrote:
> > On Thu, Aug 29, 2024 at 01:48:35PM GMT, Jessica Zhang wrote:
> >> Reserve dedicated pingpong blocks for CWB
> >
> > Please explain design ideas. Having just a single phrase is usually not
> > enough.
> >
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 ++++++--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 65 +++++++++++++++++++++++++++++
> >>   3 files changed, 79 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 36b677cf9c7a..f1bd14d1f89e 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -2,7 +2,7 @@
> >>   /*
> >>    * Copyright (C) 2013 Red Hat
> >>    * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
> >> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>    *
> >>    * Author: Rob Clark <robdclark@gmail.com>
> >>    */
> >> @@ -1054,6 +1054,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>      struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> >>      struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> >>      int num_pp, num_dsc;
> >> +    bool is_cwb_encoder;
> >>      unsigned int dsc_mask = 0;
> >>      int i;
> >>
> >> @@ -1067,6 +1068,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>
> >>      priv = drm_enc->dev->dev_private;
> >>      dpu_kms = to_dpu_kms(priv->kms);
> >> +    is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
> >> +            dpu_enc->disp_info.intf_type == INTF_WB;
> >>
> >>      global_state = dpu_kms_get_existing_global_state(dpu_kms);
> >>      if (IS_ERR_OR_NULL(global_state)) {
> >> @@ -1077,9 +1080,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>      trace_dpu_enc_mode_set(DRMID(drm_enc));
> >>
> >>      /* Query resource that have been reserved in atomic check step. */
> >> -    num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >> -            drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> >> -            ARRAY_SIZE(hw_pp));
> >> +    if (is_cwb_encoder)
> >> +            num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >> +                    drm_enc->crtc, DPU_HW_BLK_DCWB_PINGPONG, hw_pp,
> >> +                    ARRAY_SIZE(hw_pp));
> >> +    else
> >> +            num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >> +                    drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> >> +                    ARRAY_SIZE(hw_pp));
> >
> > Why is this necessary? Can we still use DPU_HW_BLK_PINGPONG?
>
> Hi Dmitry,
>
> Since both regular non-cwb pingpongs and pingpongs dedicated for cwb
> both share the same pingpong_to_crtc_id map, I need a way to distinguish
> between the real-time and dedicated cwb pingpongs.
>
> If I don't do that, get_assigned_resources would populate the hw_pp
> array for both the real-time and WB encoders with *only* the real-time
> display pingpongs.
>
> >
> >> +
> >>      dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>                      drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> index c43cb55fe1d2..c87790a1b940 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> @@ -77,6 +77,7 @@ enum dpu_hw_blk_type {
> >>      DPU_HW_BLK_LM,
> >>      DPU_HW_BLK_CTL,
> >>      DPU_HW_BLK_PINGPONG,
> >> +    DPU_HW_BLK_DCWB_PINGPONG,
> >>      DPU_HW_BLK_INTF,
> >>      DPU_HW_BLK_WB,
> >>      DPU_HW_BLK_DSPP,
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> index 13f84375e15d..afad26556cd5 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> @@ -236,6 +236,48 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
> >>      return -EINVAL;
> >>   }
> >>
> >> +static int _dpu_rm_reserve_cwb_pingpong(struct dpu_rm *rm,
> >> +            struct dpu_global_state *global_state, uint32_t crtc_id,
> >> +            struct msm_display_topology *topology)
> >> +{
> >> +    int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
> >> +    int cwb_pp_idx[MAX_BLOCKS];
> >> +
> >> +    /*
> >> +     * Reserve additional dedicated CWB pingpong blocks for each mixer
> >> +     *
> >> +     * TODO: add support for reserving non-dedicated CWB pingpong blocks
> >> +     */
> >> +    for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
> >> +                    cwb_pp_count < num_cwb_pp; i++) {
> >> +            for (int j = PINGPONG_CWB_0 - PINGPONG_0;
> >> +                            j < ARRAY_SIZE(rm->pingpong_blks); j++) {
> >
> > Alignment...
>
> Ack -- for future reference, should I always align the second line with
> the bracket of the previous line?
>
> I thought the general guideline was 2 tabs, but I might be misremembering.
>
> Thanks,
>
> Jessica Zhang
>
> >
> >> +                    /*
> >> +                     * Odd LMs must be assigned to odd pingpongs and even
> >> +                     * LMs with even pingpongs
> >> +                     */
> >> +                    if (reserved_by_other(global_state->pingpong_to_crtc_id,
> >> +                                            j, crtc_id) ||
> >> +                                    i % 2 != j % 2)
> >> +                            continue;
> >> +
> >> +                    cwb_pp_idx[cwb_pp_count] = j;
> >> +                    cwb_pp_count++;
> >> +                    break;
> >> +            }
> >> +    }
> >> +
> >> +    if (cwb_pp_count != num_cwb_pp) {
> >> +            DPU_ERROR("Unable to reserve all cwb pingpongs\n");
> >> +            return -ENAVAIL;
> >> +    }
> >> +
> >> +    for (int i = 0; i < cwb_pp_count; i++)
> >> +            global_state->pingpong_to_crtc_id[cwb_pp_idx[i]] = crtc_id;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>   /**
> >>    * _dpu_rm_check_lm_and_get_connected_blks - check if proposed layer mixer meets
> >>    * proposed use case requirements, incl. hardwired dependent blocks like
> >> @@ -617,6 +659,14 @@ static int _dpu_rm_make_reservation(
> >>              return ret;
> >>      }
> >>
> >> +    if (topology->cwb_enabled) {
> >> +            ret = _dpu_rm_reserve_cwb_pingpong(rm, global_state,
> >> +                            crtc_id, topology);
> >> +            if (ret) {
> >> +                    DPU_ERROR("unable to find appropriate dcwb pingpongs\n");
> >> +                    return ret;
> >> +            }
> >> +    }
> >>
> >>      ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
> >>                      topology);
> >> @@ -706,6 +756,7 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >>
> >>      switch (type) {
> >>      case DPU_HW_BLK_PINGPONG:
> >> +    case DPU_HW_BLK_DCWB_PINGPONG:
> >>              hw_blks = rm->pingpong_blks;
> >>              hw_to_crtc_id = global_state->pingpong_to_crtc_id;
> >>              max_blks = ARRAY_SIZE(rm->pingpong_blks);
> >> @@ -745,6 +796,20 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >>              if (hw_to_crtc_id[i] != crtc_id)
> >>                      continue;
> >>
> >> +            if (type == DPU_HW_BLK_PINGPONG) {
> >> +                    struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> >> +
> >> +                    if (pp->idx >= PINGPONG_CWB_0)
> >> +                            continue;
> >> +            }
> >> +
> >> +            if (type == DPU_HW_BLK_DCWB_PINGPONG) {
> >> +                    struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> >> +
> >> +                    if (pp->idx < PINGPONG_CWB_0)
> >> +                            continue;
> >> +            }
> >> +
> >>              if (num_blks == blks_size) {
> >>                      DPU_ERROR("More than %d resources assigned to crtc %d\n",
> >>                                blks_size, crtc_id);
> >>
> >> --
> >> 2.34.1
> >>
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

