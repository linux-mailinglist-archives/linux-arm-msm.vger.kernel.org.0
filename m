Return-Path: <linux-arm-msm+bounces-12252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C65860546
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 22:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4644D1C2428E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 21:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995C514B815;
	Thu, 22 Feb 2024 21:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nz1yzJeF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30A812D1F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 21:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708639072; cv=none; b=BY+wIiutnR97SPEPgMC+8cNLbuD6lbRnFwdqXoji3TVyR1TymK3dNWKlbxlI+5hBdHycqZcLT1v8xC99fBbBYCRdnaKYEi0a2dmiJLS/BUCjP6GhMIrL/aWp0dl9h5674CisuYuaSrsFeV+no/hxw0pIiPaBk66P88jJuHP5iwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708639072; c=relaxed/simple;
	bh=ULBN7qGM8ll7Mf7Jw7jx7iOpo1oKcdTj+Wx7EWQJj7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmPFqe4aRJYUOWpsLtgpoEmXjXdMjKtY72teFHQiM5JxWkKpHSsWHXCqimfNGnV2y5cEaHMktDbnvMfYuGEw0KBGuyYNEpP+OYgfaI2gVZ867g5J8eaVoZ/rr5m87JI3SVuAq4QUdAajfU9hwxmlEVct0BlpQ7sMjApHPpcwtHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nz1yzJeF; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so250471276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 13:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708639069; x=1709243869; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4XHmaR9j8yfoG0uE39iuFTe1DexLU+BkdLhrhgZ69f8=;
        b=Nz1yzJeFC484xajQc691qX9YPbFayM75xmrIHj6GpO7Hf1Sdspt/DPJsS0NQlIhTqV
         63DggsV2Iq+NfAthmUe8bx2TRf+6OjGHergNYffHNgxFsy5ty5AVvNb3roN1KH2LGL0O
         T3sVclTYIBe22TgxSC9/eE8lOpchbCxF7tAXzpLp/+fu4kktnPcLLdlJhXcdG8cf7Y4d
         94UgeZl7ueGVrszuyu4C4M5H/8ZzuWXFhUL9+kxzDfo7Cvemdo5jFsR0HnFLYn1SSGlP
         vaEM8gSsMrHtS26f6T1QL1QX7gQnPIvaDVPrOH/2Ftt/u4q5FJh0+mmU5+/dUHq7N3lB
         VjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708639069; x=1709243869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XHmaR9j8yfoG0uE39iuFTe1DexLU+BkdLhrhgZ69f8=;
        b=DNZT4JZ7nJu2xcf64nxgXN3fU0YZEbG9HatAuDLGqA/soPvpmCLIUi1GQySqYrvCOv
         BoEkx0vE4pDK0ytUlSliAsO10u6WpeiURsbfU+QhWsknMn/5bqgjaa2WT5vEYR/lTTqs
         5HvwbjBCm26wD1f0Bov99A76X2U8CW4DjSYomU5ZNMcunVmbOCoTu15Mo7umNes/Gw0F
         fozWhUUwfEqABFdS4AJmiwRQUd9xLAoYPWG6ctxAtyIz3RaLok3xWu3D001p941T6D56
         AWnr1MxepL2Vq1ylVOk8bAmrmDEN2KRyRJbnYTGTqjc6l0NjCFB/rVr2A1/dUWha2SKZ
         9/Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWM+USBv28IwMnrF7f1HLGXlfgZ7zD1FNL3+jbxIx4DRC33vkeHCrekE+ulDJT9ib6XA1v4wCOhhfXiBGJN8EU2sTSBhMXrqTLrFQWXuw==
X-Gm-Message-State: AOJu0YzFM6LirS1zgvO02+tD0HQoM+0f9eeFOBfgVDt3mfKQu4OeJEqD
	hI0vMPteAH4Tq3levWsjLEx5QtaL7i0s+yAMgOQop5lDX4Yvf7jIPRNFPTx92YKkeqt1mJYIZGk
	SmAu50UJmVlkbtWMMNrzoN9mcY1bZ/MYRvOmHuw==
X-Google-Smtp-Source: AGHT+IEooe9B8N6cL2q2BcKTYJut84BKs61FZ74FRMTKD+cxJmhoC80CFQcsBQiqtKzpqIhdxxvGsZVHWhiuA15XmGA=
X-Received: by 2002:a25:a243:0:b0:dcf:2908:485c with SMTP id
 b61-20020a25a243000000b00dcf2908485cmr2027103ybi.3.1708639069649; Thu, 22 Feb
 2024 13:57:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222-fd-rm-state-v5-1-4a6c81e87f63@linaro.org> <318495d1-3366-1ca8-72a2-8927cb1b4835@quicinc.com>
In-Reply-To: <318495d1-3366-1ca8-72a2-8927cb1b4835@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:57:38 +0200
Message-ID: <CAA8EJppf+Vt4tGP9YFMmhh4wdm+U=_Fq5D8J1YpZjzEBS=Td3Q@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dpu: add current resource allocation to dumped state
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Feb 2024 at 23:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/22/2024 1:47 PM, Dmitry Baryshkov wrote:
> > Provide atomic_print_state callback to the DPU's private object. This
> > way the debugfs/dri/0/state will also include RM's internal state.
> >
> > Example output (RB5 board, HDMI and writeback encoder enabled)
> >
> > resource mapping:
> >       pingpong=31 36 # # # # - - - - -
> >       mixer=31 36 # # # # -
> >       ctl=# # 31 36 # #
> >       dspp=# # # #
> >       dsc=# # # # - -
> >       cdm=#
> >
>
> Thanks, this LGTM now, one nit below.
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v5:
> > - Extracted the common helper for printing RM state
> > - Changed the code to print '#' for unused/unmapped blocks (Abhinav)
> > - Link to v4: https://lore.kernel.org/r/20240219-fd-rm-state-v4-1-b47f14ef27c2@linaro.org
> >
> > Changes in v4:
> > - Split the patch from the virual wide planes series
> > - Reworked the output format
> > - Added the CDM block into the dump
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 12 +++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 56 +++++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  8 +++++
> >   4 files changed, 78 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 723cc1d82143..9f3697e1eacb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -353,9 +353,18 @@ static void dpu_kms_global_destroy_state(struct drm_private_obj *obj,
> >       kfree(dpu_state);
> >   }
> >
> > +static void dpu_kms_global_print_state(struct drm_printer *p,
> > +                                    const struct drm_private_state *state)
> > +{
> > +     const struct dpu_global_state *global_state = to_dpu_global_state(state);
> > +
> > +     dpu_rm_print_state(p, global_state);
> > +}
> > +
> >   static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
> >       .atomic_duplicate_state = dpu_kms_global_duplicate_state,
> >       .atomic_destroy_state = dpu_kms_global_destroy_state,
> > +     .atomic_print_state = dpu_kms_global_print_state,
> >   };
> >
> >   static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
> > @@ -371,6 +380,9 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
> >       drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
> >                                   &state->base,
> >                                   &dpu_kms_global_state_funcs);
> > +
> > +     state->rm = &dpu_kms->rm;
> > +
> >       return 0;
> >   }
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > index d1207f4ec3ae..2512c9bd08df 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > @@ -131,6 +131,8 @@ struct vsync_info {
> >   struct dpu_global_state {
> >       struct drm_private_state base;
> >
> > +     struct dpu_rm *rm;
> > +
> >       uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> >       uint32_t mixer_to_enc_id[LM_MAX - LM_0];
> >       uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index 724537ab776d..1a56ddca536d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -634,3 +634,59 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >
> >       return num_blks;
> >   }
> > +
> > +static void dpu_rm_print_state_helper(struct drm_printer *p,
> > +                                         struct dpu_hw_blk *blk,
> > +                                         uint32_t mapping)
>
> Not sure if its the mail client, but is this aligned with the opening brace?

No, it is shifted to the right. Will fix while applying.

>
> Please double check once. Rest LGTM.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry

