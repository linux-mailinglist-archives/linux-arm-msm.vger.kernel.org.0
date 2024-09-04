Return-Path: <linux-arm-msm+bounces-30789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A280C96C697
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 20:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B2151F27AB7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 18:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBC01E4108;
	Wed,  4 Sep 2024 18:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BKQV+MTg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6CF1E4100
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 18:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725475296; cv=none; b=C3ByWO+4wfco+DwE0sRwpfj9vmR1d4tsLYUN/KgLyfd1dzlM4JBNFVMfwab7CSW2zkMN+KXxDmHeqg6o5FqyF3BQXwB9npiqGloO2wHQaW/qQ+1tOodzL3Lj4i+x8LMr/89knfSbIZ8wZmKTwF9J78BLeaHgITUwhDZBA4KP0OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725475296; c=relaxed/simple;
	bh=8qoQNCibop+PWRXlwU+sPRjnFU3RMyP2DbOvaibPqi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eIL+7SXvPhJbgrDQVmjRO7esQkdWX6vhUgeHypgHm8GS1l+s/vEl5wC9VL4VpWFvVNBKvNz46TFdN+PSb92DVVNjCL9/IUJS7FvJaiB8wHhr2HojMqHpedybR1aGukKlqli7BTEkRryFLXWfG9wpWb450iMRMAg4FFPRR/gocys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BKQV+MTg; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6d6891012d5so37369307b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 11:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725475294; x=1726080094; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1UsoRD5I9/OcwpVT0l8HcbEMWglcM4WiU2VwW1FbqqA=;
        b=BKQV+MTgRcfDEFAiBkX1r56BQWHYSr4YXjjdAFQ50RhdUPtgh1Ne3PYfwtjw9hHnHj
         VmzsCA9ua5Nt/qBy3vOE5oBVQ3fvCr11aTAZy9olzKmmwe4OM/XyLf4Ji8deyFe0s7V9
         mwaRWJHxfGOMWSs8ec8TikiBOT9FwG+s1LLH/bZVXd1T+u0UvyEvPetJCArPihl9F+Jq
         SRSSXLSkRDVSi37LR1G5jxh8WCESK+dTw7mHJiR9k1/rRAgy8CXc8DmqbI+kgIEjp65R
         US/BIFDyjJ5QEmbzCYYpaeM2aQFX9drCf+XteSpYbOVr/TiADZOYsnoWup8aeuTpzvZ+
         VSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475294; x=1726080094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UsoRD5I9/OcwpVT0l8HcbEMWglcM4WiU2VwW1FbqqA=;
        b=t00d3DLLk9t89wSVB7llUf6PR6SoqMoq/i8ztLl+hRiFpavMa7MOZgl2E55bxoLgR3
         N7JLH9t4lTC+qpTFL4v+JppjgFZB437XZiUvKCFJnJh29fhSMtORrftqNKMDohuMvBgM
         fv8kctIbQrTvLqaLYhbYvPOQVzansHWKBMuXRwcpC0todhEiB7RyyAl1l7WwAADrcJ9E
         vgO+xWYT8U0b/DS3EaMIuAGiRU8va5SR5YdIw+0WgxjwETb6gA1e27LBoa/A2+I7kC35
         M8tzAxYnjiyjd97W10GbYVljiRLCoTO/C0vMCH982HnKxOE0x/t5NmjP6tJeYDsNobrn
         aoyA==
X-Forwarded-Encrypted: i=1; AJvYcCXSR6DCeSrpw4Ay41Wuwnk5YeWwX1djOT5UfloYWr2ESJfRFDaVgUsM2rTZKv8U6fxDgXgH6LksIWWqBQ8E@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg28kV+MWlqcmQDSx756WPLswDrmvIyL4ieTHoe4pm1gpKf0Gz
	iQHO/pjqx40edx0qO3xEUZJ1rIe68pNsn80kx8m9ZV+SM8SSjHsj62M5GXe6lyUUWDrFaISAkso
	rTTVckyRrojudpLaJtwYq16xFqDgnvbSwQvfoBg==
X-Google-Smtp-Source: AGHT+IFuskZq0UGQgmP4DjibP7i7FiVBXXGXy1UOcoBhtUO9qeXXooabJvPQYAhjWsZh98zkVqcHlTvpZ2+ncq2R+jo=
X-Received: by 2002:a05:690c:f0a:b0:6ae:1e27:c993 with SMTP id
 00721157ae682-6d652cc6539mr149253317b3.7.1725475293727; Wed, 04 Sep 2024
 11:41:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-7-502b16ae2ebb@quicinc.com> <uqtlpynjdszqyyikj64uxwuqnk3lmzma7kd2vwxipnj4fg2eje@7toj5kww7vk7>
 <9f95704d-0699-4b11-b8cb-40f1a57eeebd@quicinc.com>
In-Reply-To: <9f95704d-0699-4b11-b8cb-40f1a57eeebd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 4 Sep 2024 21:41:23 +0300
Message-ID: <CAA8EJpqM0QBxLFCx22UuVmYAE258im_Up2-3fu6qez1GrOhOQg@mail.gmail.com>
Subject: Re: [PATCH 07/21] drm/msm/dpu: Check CRTC encoders are valid clones
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

On Wed, 4 Sept 2024 at 01:18, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 8/30/2024 10:00 AM, Dmitry Baryshkov wrote:
> > On Thu, Aug 29, 2024 at 01:48:28PM GMT, Jessica Zhang wrote:
> >> Check that each encoder in the CRTC state's encoder_mask is marked as a
> >> possible clone for all other encoders in the encoder_mask and that only
> >> one CRTC is in clone mode at a time
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 36 +++++++++++++++++++++++++++++++-
> >>   1 file changed, 35 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> index 5ec1b5a38922..bebae365c036 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> @@ -1,6 +1,6 @@
> >>   // SPDX-License-Identifier: GPL-2.0-only
> >>   /*
> >> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>    * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
> >>    * Copyright (C) 2013 Red Hat
> >>    * Author: Rob Clark <robdclark@gmail.com>
> >> @@ -1204,6 +1204,36 @@ static struct msm_display_topology dpu_crtc_get_topology(
> >>      return topology;
> >>   }
> >>
> >> +static bool dpu_crtc_has_valid_clones(struct drm_crtc *crtc,
> >> +            struct drm_crtc_state *crtc_state)
> >> +{
> >> +    struct drm_encoder *drm_enc;
> >> +    struct drm_crtc *temp_crtc;
> >> +    int num_cwb_sessions = 0;
> >> +
> >> +    drm_for_each_crtc(temp_crtc, crtc->dev)
> >> +            if (drm_crtc_in_clone_mode(temp_crtc->state))
> >
> > No, get the state from drm_atomic_state. temp_crtc->state might be
> > irrelevant.
>
> Hi Dmitry,
>
> Ack.
>
> >
> >> +                    num_cwb_sessions++;
> >
> > Even simpler:
> > if (temp_crtc != crtc && drm_crtc_in_clone_mode(...))
> >       return false;
>
> Ack.
>
> >
> >> +
> >> +    /*
> >> +     * Only support a single concurrent writeback session running
> >> +     * at a time
> >
> > If it is not a hardware limitation, please add:
> > FIXME: support more than one session
>
> This is a hardware limitation.
>
> >
> >> +     */
> >> +    if (num_cwb_sessions > 1)
> >> +            return false;
> >> +
> >> +    drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> >> +            if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=
> >> +                            crtc_state->encoder_mask) {
> >
> > Align to opening bracket, please. Granted that other drivers don't
> > perform this check, is it really necessary? Doesn't
> > validate_encoder_possible_clones() ensure the same, but during the
> > encoder registration?
>
> The difference here is that validate_encoder_possible_clones() is only
> called when the drm device is initially registered.
>
> The check here is to make sure that the encoders userspace is proposing
> to be cloned are actually possible clones of each other. This might not
> be necessary for drivers where all encoders are all possible clones of
> each other. But for MSM (and CWB), real-time display encoders can only
> be clones of writeback (and vice versa).

I had the feeling that encoder_mask should already take care of that,
but it seems I was wrong.
Please extract this piece as a generic helper. I think it should be
called from the generic atomic_check() codepath.




--
With best wishes
Dmitry

