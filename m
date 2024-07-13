Return-Path: <linux-arm-msm+bounces-26072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A029304C5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 11:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63C7B282A64
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 09:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74EE1C280;
	Sat, 13 Jul 2024 09:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PvG37iDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D7C14A8B
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jul 2024 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720864164; cv=none; b=pCru9RJkmknKgKKTip98ubRCOyu2YOTnxjLWP/GzIYgRnGKxxv0DHdY6BjVoZldiHTtx7kzfLDsGK0PXfvH0PVAZuVCCQImAF5t1yA/TLRvM1L0wbUiHbh085uM2Q8vqH2vGDB9iNNpq3dUEwDAjCP0ZQ0TR//bRf5SONIAOyRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720864164; c=relaxed/simple;
	bh=Gc5YtBBqtpRAeexWtTHZa3LxGwwdFAEDU8zMshB9n6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d7ChnAJrxJ6dVzhpcedfRRHVUm2kiaqtcTZ1IbCB2vedQdV1tYeVyxbLukBYwGI4MhNoVSs0aShswLpdVuUDeaOm725+nlEao8jOOoy9kOiOVGhT1H4G9ki6553szvmjKFqxPygLEwVQgv2fJYE9md1l2fcnz6lUt9qg0nTmn7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PvG37iDY; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-65f880c56b1so4031617b3.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jul 2024 02:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720864162; x=1721468962; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gUfwJ/Q8PMM5kCwlle/T/cSvHYKyhxEdVJ2Fqw5c4Rc=;
        b=PvG37iDYRdIem+f4LargiZwDe81rM1RzjVFuWLeUiBNgx4qLsx8X12XHt93QYg7+ol
         DdSqgNekjTQgGK6rPZa5IcycBe+tgqwD+AxMazEA0Ai833cbzGOkvJSyJ5RGA/2hxoi+
         iXjBIQ0YYK72Rm0Vdqpkkn8xisXdWtukCNDkgQ0LjZzCrMP6hjj6VJz943f8yayy6FRo
         nAgJuh/NmozAE+Ey+bkpMnplQTbkc2oOV7XjiQMab9KEiMcVMLLhNL0zaijMszBX/IrB
         CvgzKt7pb66LNdco8BMmpNCpf2tpYr94uH4slm690Kh+mCEXXenLUvcH7Qox7YNPzpRi
         qnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720864162; x=1721468962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUfwJ/Q8PMM5kCwlle/T/cSvHYKyhxEdVJ2Fqw5c4Rc=;
        b=s4cluJ79flWX6eO2PsTWHwFFjROphMhyBUtfXFyB1asta8AWJt6ZgWcP3oEHFKTxDB
         OkITf9v6C1V4GgpXhLe0SSSuMx/uEnG7FjEFDJg66rnt3UUdj2jSqo5wJ2cpSMXFwuSQ
         8TcSf3Bh7MhJghhx/OfWRLizDt3jBBBX26MRUwpcTVkVyXPvMoOYJqy9O0c89cabEF7a
         pIw+9i/ZTbCxod0osq1hvAJYwNCCtbxGy7z0E2Om5KLtEo8BShAUZrWxEUktanv8AL1k
         /aI/Sp0bkpiIMDBdUx8M6gWXFZ2EyRZitHxpBv4Y70Qe2XQN0oMfbsx6cHZ+U+tohA1F
         gJrw==
X-Forwarded-Encrypted: i=1; AJvYcCWhGetKpwdQTlTGokC3wwVO4XZL7FTNvx+Vv+jOWtbE+kPYddD+7YB91Q5847uZphIX/0wte6UxeMbcnJrKt2xyjwWOodsu9Mqh9oRi0w==
X-Gm-Message-State: AOJu0YzgukgtaHP92r9KsjOIxRV6zn9LHeTBthHoBXdSRa5jcd77ho1O
	ZsLcesUpUy9CavAOTkqdcewaQbEwLYRcZRezbNcD2q/YkENlxfLGvUr5advHCx2a1oaxbd8dQBU
	hl/xy73NKpmy8zuA8qeA0Az6IW6qHiSADUYBVPw==
X-Google-Smtp-Source: AGHT+IFFhjze0e2IlmLKCdcI5HTMCQ7/JyyIk0Q8Vs81z2ulfIgAdlZFZUZim+vMQAkmh4r7JJ8EzxInoDKgQXWAZoU=
X-Received: by 2002:a05:690c:6308:b0:64b:a57:8441 with SMTP id
 00721157ae682-6593e4791femr152355357b3.19.1720864161684; Sat, 13 Jul 2024
 02:49:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-2-501d984d634f@linaro.org>
 <637fbd36-d6cd-4bb7-af83-8849c0fee8f2@quicinc.com> <CAA8EJppxyUrEWYQvMGtw14UVobkQdaPZuwHPeMcONRYrgPp2jw@mail.gmail.com>
 <cf1ed8b1-1c70-47f8-8c34-ef62129d44a8@quicinc.com>
In-Reply-To: <cf1ed8b1-1c70-47f8-8c34-ef62129d44a8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jul 2024 12:49:10 +0300
Message-ID: <CAA8EJpqXv2cfN2CC1+FMgwXnwMh3BeocY5ae1sOZazdy0_FCNw@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] drm/msm/dpu: fix error condition in dpu_encoder_virt_atomic_mode_set
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 13 Jul 2024 at 03:25, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/12/2024 4:11 PM, Dmitry Baryshkov wrote:
> > On Fri, 12 Jul 2024 at 22:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >> On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> >>> The commit b954fa6baaca ("drm/msm/dpu: Refactor rm iterator") removed
> >>> zero-init of the hw_ctl array, but didn't change the error condition,
> >>> that checked for hw_ctl[i] being NULL. Use indices check instead.
> >>>
> >>> Fixes: b954fa6baaca ("drm/msm/dpu: Refactor rm iterator")
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> index 5d205e09cf45..7613005fbfea 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> @@ -1186,7 +1186,7 @@ static void :tag(struct drm_encoder *drm_enc,
> >>>                        return;
> >>>                }
> >>>
> >>> -             if (!hw_ctl[i]) {
> >>> +             if (i >= num_ctl) {
> >>
> >> This is not very clear to me.
> >>
> >> How will we hit this condition? I dont see i going beyond 1 in this loop
> >> and neither should num_ctl
> >
> > Why? the driver doesn't support flushing through a single CTL, so
> > num_ctl = num_intf.
> >
>
> num_ctl will be = num_intf, but what I was trying to understand here is
> that , previously this condition was making sure that we have a ctl
> assigned for each physical encoder which is actually a requirement for
> the display pipeline. If we assigned a hw_ctl for one phys encoder and
> not the other, its an error.
>
> But on closer look, I think even your check will catch that.
>
>
> >>
> >> Will it be just easier to bring back the NULL assignment at the top?
> >>
> >> struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC] = { NULL };
> >>
> >> I also see the same issue for other blocks such as hw_dsc, hw_lm
> >
> > Other blocks loop properly up to the num_resource. I'd prefer to drop
> > the NULL init from the DSPP init and use num_dspp instead.
> >
>
> Overall, I think the purpose of NULL init was to make sure that before
> we call to_dpu_hw_***() macros, we have a valid hw_*.
>
> We could use either num_* or the hw_* as both are returned by RM.
>
> One side-note here is with a proper NULL hw_ctl is that the consumers of
> hw_ctl should also be able to check for NULL correctly.

The problem of the NULL checks is that it's too tempting to perform a
NULL check after to_dpu_hw_ctl conversion. However it's not safe to
pass NULL pointer to such functions: there is no guarantee that
conversion will return NULL if it gets passed the NULL pointer.

> So for example dpu_encoder_phys layers use if (!phys->hw_ctl) checks but
> today we do not set phys->hw_ctl to NULL correctly.
>
> Do you think that instead of the return statements, we should do
> something like
>
> dpu_enc->hw_ctl = i < num_ctl ?
>         to_dpu_hw_ctl(hw_ctl[i]) : NULL;

Yeah, why not.

Generally, I think we should stop storing the state-related data in
the non-state structures. Hopefully I'll have time for that at some
point later on.

>
>
> But this will need the NULL init back.

It doesn't, as you have the comparison.

>
> >>
> >>>                        DPU_ERROR_ENC(dpu_enc,
> >>>                                "no ctl block assigned at idx: %d\n", i);
> >>>                        return;
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

