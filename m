Return-Path: <linux-arm-msm+bounces-26067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C2293024F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 01:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56F721F22B4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 23:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A933A8C0;
	Fri, 12 Jul 2024 23:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SIFDKbvY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4161F1BC3C
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 23:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720825898; cv=none; b=U7AXfl6S8IlxoxOCouxTB5AThKXnoOVG30Gu+rBCOnu3KgkVCPOBrOpaegKxYinYBHR/sEracdNrnIvtFJsmtwL3AiNRkGbRNjvA/ANuzz6z73Nnmp4I68jYE14aJXhCBHGlEMdlcw08eVVLfP3Bofep3rJ1KiViR2hGiOY1Y88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720825898; c=relaxed/simple;
	bh=ZpuckyPlNSs/6M4JuYjQziy/tNXojT2YbzXVr60P7+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRRUO48xSn9T+zME3ZsE0rBb5B8ZlcFH7AqUBCdPJHaa+yjuwewhG2Zm47FpgKlI1l9lure5/Qhi0WqrtaBbh9iK0RSACgyIg1ZiEOpZEKUqtnJQ/FGMJ9mEzW6UVepd3zMMM9MoeXR4YxjmVYGPboefyu5JQqYA1HR5QpK6ZCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SIFDKbvY; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6512866fa87so27106487b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 16:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720825896; x=1721430696; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6nIWauyc2Pyvv09dQTByut0YHfXkae1P+Bg8WYz5fXo=;
        b=SIFDKbvYcH0OH1s+bZmLz1jvR9LFxaNCFAaDQF7GfntWiRxmmE/wIHXQTVHhXG3ElE
         TYRZeUIw0RqdnUWXNIcylgeWMDrFoI9sKlDdYmbwLTWoetD1SARrGn++m0xwBJKXq/wz
         pbg0ZWJZd3GT6sDx97unYQqyRsOenWJHdAv9FBNdOS8NWqcypkKA3pqWsalB6wJaK5iJ
         B4OLQdfey0wR+Vf57JPePjaXV18dGDZKVDYQrBqMZOkiXmNMVdgtAG8pgvJlrq349OzN
         KDCFpYjHkOnKvCnUqPEqQFefY+KcnLWTfkOwdyV9rOEXtRy9gWtgpQdsD7oxVH89BzFy
         cPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720825896; x=1721430696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nIWauyc2Pyvv09dQTByut0YHfXkae1P+Bg8WYz5fXo=;
        b=YX0bOkabRQpuyxgtqY8StIxAVdHK3S6QAekr+12smodEpphaXU7iUNkYjDebc9T9D+
         0n6GMsOFbDnpYK5WRq4wunJJX4PpbQU0iIxgtylerkE/wsXzGwGnfx/TeSmdCA4LFT8p
         oQmYX3LnU30eoV+zBnNdaLiEWGkTxV/AB94k4NbX61DRpknaT24alas+VWCsoRSCKHXS
         OqnCvGy3eZd1wKxAXm4PkReeMNV1EoK16172IBZ2Nih8BOXXU4YABCWOR4gXZg6XvdOx
         Rfi2SEw7mkdMF5AQy5eMrEPcH7K0zZtnK27a+GYTO1VgylaeP4tljrCGFUJ/LXGZhJbA
         Cqzw==
X-Forwarded-Encrypted: i=1; AJvYcCU5Gi8S8KttYQT5VvMBixUUfQds1Aw+65ZBjD+VaioQm1qrLZ1gBfWrMVL7G7m1lfR17pP5VBZ+72qD4ohAT5pATUtXRNHj+7LwCqy8Fw==
X-Gm-Message-State: AOJu0Ywbuh4TSZxf2CzfvUaJtg4zNXdyoE7V639hvKQPuZ8EA4fN9nNN
	58hmwdBswh/+h+kpovXaqiDotL1cWAuAtKqEXTUeKBydZq8wbujF4hXFbHEu4kHKUkZ8IGyNDto
	lU9hjRO7mEqCGvlOh1STCutSm9VHqxa27ib9WsQ==
X-Google-Smtp-Source: AGHT+IE9KewbbtZ33pRFXKbNTTrznOJsyNetwGPb0x8rJ7HSyLluQ2O/SNwbXNQutrGuY8h078Oh1Z1VgqhfFvsdfh0=
X-Received: by 2002:a0d:f981:0:b0:64a:f40d:5fd2 with SMTP id
 00721157ae682-658eed5debcmr137636897b3.12.1720825896057; Fri, 12 Jul 2024
 16:11:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-2-501d984d634f@linaro.org> <637fbd36-d6cd-4bb7-af83-8849c0fee8f2@quicinc.com>
In-Reply-To: <637fbd36-d6cd-4bb7-af83-8849c0fee8f2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jul 2024 02:11:24 +0300
Message-ID: <CAA8EJppxyUrEWYQvMGtw14UVobkQdaPZuwHPeMcONRYrgPp2jw@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] drm/msm/dpu: fix error condition in dpu_encoder_virt_atomic_mode_set
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jul 2024 at 22:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> > The commit b954fa6baaca ("drm/msm/dpu: Refactor rm iterator") removed
> > zero-init of the hw_ctl array, but didn't change the error condition,
> > that checked for hw_ctl[i] being NULL. Use indices check instead.
> >
> > Fixes: b954fa6baaca ("drm/msm/dpu: Refactor rm iterator")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 5d205e09cf45..7613005fbfea 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -1186,7 +1186,7 @@ static void :tag(struct drm_encoder *drm_enc,
> >                       return;
> >               }
> >
> > -             if (!hw_ctl[i]) {
> > +             if (i >= num_ctl) {
>
> This is not very clear to me.
>
> How will we hit this condition? I dont see i going beyond 1 in this loop
> and neither should num_ctl

Why? the driver doesn't support flushing through a single CTL, so
num_ctl = num_intf.

>
> Will it be just easier to bring back the NULL assignment at the top?
>
> struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC] = { NULL };
>
> I also see the same issue for other blocks such as hw_dsc, hw_lm

Other blocks loop properly up to the num_resource. I'd prefer to drop
the NULL init from the DSPP init and use num_dspp instead.

>
> >                       DPU_ERROR_ENC(dpu_enc,
> >                               "no ctl block assigned at idx: %d\n", i);
> >                       return;
> >



-- 
With best wishes
Dmitry

