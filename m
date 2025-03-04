Return-Path: <linux-arm-msm+bounces-50109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1932A4D301
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 06:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE72218912E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 05:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F0D133987;
	Tue,  4 Mar 2025 05:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3zvqSNu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB322905
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 05:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741066337; cv=none; b=Hsmb0rzzIq40T06pH4I/aCn1kfZ56rxiRHCHfpNNqVqXLFpTJI8Z1x+vlpq8Z4gatPrXCxEUI1xv5wMuwQgsOVW54hdGbabZs/wsrNWi9qWtl5tJG6Fd7nE/8BSniY30Td3NKiUVjqshDN3f5oNGK1weknz8e3KMnfeb13ECxvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741066337; c=relaxed/simple;
	bh=uwJfsOqafeYgVO0sftglEgEE8j+brYeugdGXjZpMmBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ULpbNsgbXVYH/HDC4pG6dq5qbnDiQNqVrddQ08ASt52+v7ctnINhzV1oZD+H1YeEkFi/un5Wh/VIRc6yQHT/Yu2NFzLMrxNl51LS42KFeU00yTGccmMT7B2FGccUEnWwPLeCKuds4SXIJP7ojr5Dx3OnGi/9W46+sf1oCtFFfkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F3zvqSNu; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so4452149276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 21:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741066334; x=1741671134; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CYu4MUZk18rAS2xPiF495RECniwJHYMBXDJmsgS/w88=;
        b=F3zvqSNu6zlZcdtAvDhZ8VlLsj3yuNJ4PRBbQnhoT0O07AXPc5tCYnjIeaYcXMtCAm
         NSve0wxLAFk2L7xemfgmzvYaNYEkzpmpsnf/QJx6VsEdlAIqE/SMLPuLBjAI2lhygOmU
         4pVDX4xn9FQ7nbO9XCMX+whUp2HXdv/2FUmYdsWjofm017MSwbxyVHgiyuMzJJVLm7YK
         Tr6GxeN9f8InRPhya4yhskKlZ/pUxWwASn9cJyjXfN5RjggZsXMed35ACZy0X9NgVB1c
         Jg8zac2fBrNctJKB6iF8/GL5jDIRCnIHyJI2obRcc6CMBrBUCbv2lmNaqCdb0Bz5q9Mm
         VFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741066334; x=1741671134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYu4MUZk18rAS2xPiF495RECniwJHYMBXDJmsgS/w88=;
        b=AAWsv/Us5FG4PWAwXBSkav4BUcZnkIfGYkoIvNPbHvgMzsMTP+j/pzz2kXukQq+yeS
         2mbmiF9QaWbJ39EtUQIQ3e/4n7t34IQGfBDcxHw6nzuZK5r/c6rhTkfoIP8+hNf0PJ5g
         IqlX9ZcQMvkmEG8QUSzd1t2rQiepxBzVK57ExsAkEXqhBsFh81ejlkjitQXNj4JZZNk6
         d4f+PzS5i5DJA201HljMu3OVmFxH54jrsj2vrhZcVbAVTRio73cQ2+5TVoi/G5ttdKAN
         iRiA2mpppXkKwT9crsVsOgYUmSSg4rgop747GYpoiO+qkrloclcXzUk/ul4YzWeznA4V
         TTjA==
X-Forwarded-Encrypted: i=1; AJvYcCVj6ZsIg//QZggkJ8uninaw2uKC0mXNYpjRkHG/Pb/20qhCyFU4Vw5ptdvJxmz/hogOeu2dFpqAUPalBHAC@vger.kernel.org
X-Gm-Message-State: AOJu0YxrGnqXOm5KYYU9gEKr4gsflwJuvWvlGwI9o8VOtIOnmDpRg1KF
	4+YsGwOxUB+jdizl81a/qf3kRqqJNGvoDIMv3jEEZxmL29vv8icA4YtSnTJbiEne2Umw51c3GmF
	Rrx50mSOfTuHzZ7w8DTI1fJwOOHJ5tgQxjycv/g==
X-Gm-Gg: ASbGncsmm8mILdjIxqx53xj+xv/34g53Mi1rsZREdUKXgCr6yW2zzDDiCmmbYqMwW6u
	xre7LCRJ6ipKR4A8iogq6nrKoj+dQb96JqD+eJ2cSHZgeKwBU1UT9wTW2Jpwd69usGSzqbWs9n4
	lkK2+DIp+ZfkaCMmsqc3m0aKvJlPPlx0/vQWbx1C4yZ4i9orRzy5SVJmQRuJc=
X-Google-Smtp-Source: AGHT+IGubsERPILfSO+nWvHRpqWIhp8+Tnzqu8k5LKZYyilLC8HQ+8Yx1dArhOQDYGCOO2RveNiySFtfYy72NF/mQEQ=
X-Received: by 2002:a05:6902:2743:b0:e5e:700:92f5 with SMTP id
 3f1490d57ef6-e60b2e8e4f7mr19425932276.2.1741066333741; Mon, 03 Mar 2025
 21:32:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-force-modeset-hw-ctl-v1-1-9cbf6d4fbf8e@quicinc.com>
 <flc3cyky4wxfin7dlxhukwmhonze3napmuyhl2s6jbsgepco7a@q4l2ndh23lus> <4bb1d4a7-dd0b-4565-8d5d-ff8fd4cda20a@quicinc.com>
In-Reply-To: <4bb1d4a7-dd0b-4565-8d5d-ff8fd4cda20a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Mar 2025 06:32:00 +0100
X-Gm-Features: AQ5f1JqQetJ9iRwf0aLX0aThJ-eqZfritAKkEN_CXCT36mxXKb-PEqdphLh_J5I
Message-ID: <CAA8EJppMV7uj6w1_qr2AMVT7KYJiVqPRWBibqXtf3adLpRKcrw@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/msm/dpu: Force modeset if new CTLs have been reserved
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Mar 2025 at 03:44, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 3/3/2025 3:49 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 03, 2025 at 10:28:00AM -0800, Jessica Zhang wrote:
> >> If new CTLs are reserved by CRTC but atomic_enable() is skipped, the
> >> encoders will configure the stale CTL instead of the newly reserved one.
> >
> > The CTLs are propagates in .atomic_mode_set(), not in .atomic_enable().
>
> Hi Dmitry,
>
> Yes, sorry mixed up the two function ops here and in my reply in the CWB
> thread.
>
> >
> >>
> >> Avoid this by setting mode_changed to true if new CTLs have been
> >> reserved by CRTC.
> >
> > This looks very strange. First we reserve new CTLs when there is a
> > modeset requested. Then on one of the next commits we detect that
> > encoder has stale CTLs and try to upgrade the commit to full modeset
> > (while the user might not have .allow_modeset set to true for whatever
> > reason, e.g. because only ACTIVE is changed).
>
> Ah I see what you mean. I think this is an issue with how/when we're
> calling dpu_rm_reserve(). Since RM reservation is tied to
> atomic_check(), we aren't able to force a modeset based on HW block
> reservation. The only reason we were able to avoid this issue with
> needs_cdm is because needs_cdm didn't depend on the CDM HW block index.
>
> I think there's not really a good way to avoid this other than flipping
> the order of the msm_atomic_check to drm_helper_atomic_check ->
> dpu_kms.check_mode_changed -> drm_atomic_helper_check_modeset().

No-no-no. This would require a full drm_atomic_helper_check() call
again, after the check_mode_changed() callback. But again, this should
not be required at all. The whole point of .check_mode_changed() is to
be called before performing full atomic_check() chains.

>
> What do you think? It seems to be valid given the examples in the DRM
> docs [1]
>
> [1]
> https://elixir.bootlin.com/linux/v6.13.5/source/drivers/gpu/drm/drm_atomic_helper.c#L610
>
> >
> > Could you please check if the following change fixes the issue: in
> > crtc_set_mode() replace the raw !new_crtc_state->mode_changed check with
> > the drm_atomic_crtc_needs_modeset() call?
>
> This also fixes the DPMS failures. IIRC Abhinav had suggested a similar
> change to fix a different issue [2] and you gave some feedback on
> avoiding mode_set() for enable/disable calls which don't have mode_changed.

After reading the documentation for
drm_encoder_helper_funcs.atomic_mode_set() and looking around, I think
the issue is in the handling of the DPMS functions. I might have a fix
for the issue.

> Also, while this may fix the CWB CI failures, wouldn't the issue still
> remain regarding how to force modeset for changes in HW block reservation?

I think it is the other way around: HW block reservation is only
changed if there is a modeset. I'm currently testing my theory :-) We
were performing HW reassignment if drm_atomic_crtc_needs_modeset() was
true. However this function returns true in one of the cases, where
there is no actual modeset happening (and it's even documented this
way) - when only DPMS call has happened (in other words, when
.active_changed = true, but two other bits are false). It is required
not to reassign HW resources in such a case. So, I think, a correct
fix is to change the condition in dpu_crtc_atomic_check().

>
> [2] https://gitlab.freedesktop.org/drm/msm/-/issues/59
>
> Thanks,
>
> Jessica Zhang
>
> >
> >>
> >> Note: This patch only adds tracking for the CTL reservation, but eventually
> >> all HW blocks used by encoders (i.e. DSC, PINGPONG, CWB) should have a
> >> similar check to avoid the same issue.
> >>
> >> Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> Closes: https://lists.freedesktop.org/archives/freedreno/2025-February/036719.html
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 +++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  1 +
> >>   3 files changed, 26 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> index 4073d821158c0..a1a8be8f5ab9f 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> @@ -1406,19 +1406,32 @@ int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
> >>      struct drm_crtc *crtc = new_crtc_state->crtc;
> >>      bool clone_mode_enabled = drm_crtc_in_clone_mode(old_crtc_state);
> >>      bool clone_mode_requested = drm_crtc_in_clone_mode(new_crtc_state);
> >> +    struct dpu_crtc_state *cstate = to_dpu_crtc_state(new_crtc_state);
> >> +    uint32_t enc_ctl_mask = 0;
> >> +    uint32_t crtc_ctl_mask = 0;
> >> +    struct dpu_crtc_mixer *m;
> >>
> >>      DRM_DEBUG_ATOMIC("%d\n", crtc->base.id);
> >>
> >> +    for (int i = 0; i < cstate->num_mixers; i++) {
> >> +            m = &cstate->mixers[i];
> >> +            crtc_ctl_mask |= BIT(m->lm_ctl->idx - CTL_0);
> >> +    }
> >> +
> >>      /* there might be cases where encoder needs a modeset too */
> >>      drm_for_each_encoder_mask(drm_enc, crtc->dev, new_crtc_state->encoder_mask) {
> >>              if (dpu_encoder_needs_modeset(drm_enc, new_crtc_state->state))
> >>                      new_crtc_state->mode_changed = true;
> >> +            enc_ctl_mask |= dpu_encoder_get_ctls(drm_enc);
> >>      }
> >>
> >>      if ((clone_mode_requested && !clone_mode_enabled) ||
> >>          (!clone_mode_requested && clone_mode_enabled))
> >>              new_crtc_state->mode_changed = true;
> >>
> >> +    if (crtc_ctl_mask != enc_ctl_mask)
> >> +            new_crtc_state->mode_changed = true;
> >> +
> >>      return 0;
> >>   }
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index a61598710acda..2f3101caeba91 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -188,6 +188,7 @@ struct dpu_encoder_virt {
> >>
> >>      unsigned int dsc_mask;
> >>      unsigned int cwb_mask;
> >> +    unsigned int ctl_mask;
> >>
> >>      bool intfs_swapped;
> >>
> >> @@ -707,6 +708,13 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
> >>      }
> >>   }
> >>
> >> +uint32_t dpu_encoder_get_ctls(struct drm_encoder *drm_enc)
> >> +{
> >> +    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> >> +
> >> +    return dpu_enc->ctl_mask;
> >> +}
> >> +
> >>   bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
> >>   {
> >>      struct drm_connector *connector;
> >> @@ -1155,6 +1163,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>      bool is_cwb_encoder;
> >>      unsigned int dsc_mask = 0;
> >>      unsigned int cwb_mask = 0;
> >> +    unsigned int ctl_mask = 0;
> >>      int i;
> >>
> >>      if (!drm_enc) {
> >> @@ -1245,11 +1254,14 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>                              "no ctl block assigned at idx: %d\n", i);
> >>                      return;
> >>              }
> >> +            ctl_mask |= BIT(phys->hw_ctl->idx - CTL_0);
> >>
> >>              phys->cached_mode = crtc_state->adjusted_mode;
> >>              if (phys->ops.atomic_mode_set)
> >>                      phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
> >>      }
> >> +
> >> +    dpu_enc->ctl_mask = ctl_mask;
> >>   }
> >>
> >>   static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> index ca1ca2e51d7ea..70b03743dc346 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> @@ -91,6 +91,7 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_st
> >>
> >>   void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
> >>              struct drm_writeback_job *job);
> >> +uint32_t dpu_encoder_get_ctls(struct drm_encoder *drm_enc);
> >>
> >>   void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
> >>              struct drm_writeback_job *job);
> >>
> >> ---
> >> base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
> >> change-id: 20250228-force-modeset-hw-ctl-d02b80a2bb4c
> >> prerequisite-change-id: 20241222-drm-dirty-modeset-88079bd27ae6:v2
> >> prerequisite-patch-id: 0c61aabfcd13651203f476985380cbf4d3c299e6
> >> prerequisite-patch-id: c6026f08011c288fd301676e9fa6f46d0cc1dab7
> >> prerequisite-patch-id: b0cb06d5c88791d6e4755d879ced0d5050aa3cbf
> >> prerequisite-patch-id: fd72ddde9dba0df053113bc505c213961a9760da
> >> prerequisite-change-id: 20250209-dpu-c3fac78fc617:v2
> >> prerequisite-patch-id: c84d2b4b06be06384968429085d1e8ebae23a583
> >> prerequisite-patch-id: fb8ea7b9e7c85fabd27589c6551108382a235002
> >> prerequisite-change-id: 20250211-dither-disable-b77b1e31977f:v1
> >> prerequisite-patch-id: 079e04296212b4b83d51394b5a9b5eea6870d98a
> >> prerequisite-change-id: 20240618-concurrent-wb-97d62387f952:v6
> >> prerequisite-patch-id: b52034179741dc182aea9411fd446e270fdc69d1
> >> prerequisite-patch-id: bc472765a7d5214691f3d92696cc8b0119f3252e
> >> prerequisite-patch-id: c959bc480e96b04297ebaf30fea3a68bbac69da6
> >> prerequisite-patch-id: f7db8449b241a41faac357d9257f8c7cb16503ec
> >> prerequisite-patch-id: 7beb73131d0ab100f266fcd3c1f67c818a3263f4
> >> prerequisite-patch-id: c08cbb5cf4e67e308afd61fdad6684b89429d3b6
> >> prerequisite-patch-id: a4e343143b8fbe98ae4aa068cc459c750105eb9d
> >> prerequisite-patch-id: 1d09edcf12ef7e7ab43547eefacae5b604b698e9
> >> prerequisite-patch-id: 0008f9802bfd3c5877267666cceb7608203e5830
> >> prerequisite-patch-id: 49402eb767c97915faf2378c5f5d05ced2dcfdac
> >> prerequisite-patch-id: 522be2a6b5fe4e3a2d609526bb1539f9bc6f828f
> >> prerequisite-patch-id: 031da00d0fffd522f74d682a551362f3ecda0c71
> >> prerequisite-patch-id: 9454cec22231a8f3f01c33d52a5df3e26dd88287
> >> prerequisite-patch-id: 7edbeaace3549332e581bee3183a76b0e4d18163
> >>
> >> Best regards,
> >> --
> >> Jessica Zhang <quic_jesszhan@quicinc.com>
> >>
> >
> > --
> > With best wishes
> > Dmitry
>


-- 
With best wishes
Dmitry

