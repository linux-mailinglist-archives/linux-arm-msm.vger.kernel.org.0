Return-Path: <linux-arm-msm+bounces-12490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38829862CF3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 21:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3785E1C20B06
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 20:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9619A17BC2;
	Sun, 25 Feb 2024 20:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZarA5qr1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFBA1C02
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 20:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708894692; cv=none; b=bexhtzt5r2WxJdojQXKVbhSrKJikNGkceEOMjHZaKr/P5ORGrDSZqH6pGYbZUKuyCUn5GbuQNwH8O7xToWtMKbewfxFRjBhnuqObVZt3J9lkMUW75byO4Blc0oud9KJlenifkvsrxXapiViuHG7+cqqzn5/UfytiQDK5WL9L/Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708894692; c=relaxed/simple;
	bh=G+uzBfc0oWDDkEEUN4eppnhyRsmAuktqvDC/SDyC9Zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y00c2jfFM9sC7fJPJA65n6n9LxFBjR27Xw/5oyxvq4GTsFB+w989nwsZCzasgKzCewPldHL8PpDbhBcAP1ADnQlP07OooBD4DHYOKQIVwzUQeIzEo73hesZT+d9verkRAp3HLqtii2XX6f/iOq5ntEX0Nutx+ZyV+dlgQ5MXQ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZarA5qr1; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3c1a1e1e539so321728b6e.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 12:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708894690; x=1709499490; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qysAaItgkYAq3SwTLN3VU8RMWCs5RzMALqFImfrNUHc=;
        b=ZarA5qr1BcJEZ66LeYGbNSR4LavrNBD/R/gArih58MqLw9v1LAL6MLB2Z40fAj+CbR
         5pCtvDAJfQ3jphlpCeS0oGM1EHBPCDYd97SaWKG8YPVemzkPuVhSpLoy19e3xHfzxHMw
         7IYkdeiiwOLgZlsn0m6d7paAemF2PFyQ9r3khJ4UdjoQMBS4mx4SKHgOlk8VPpr3/iad
         /rBk/qivgxHPbKqsYR4FsoK0nv0n24AQChEWJj1YAUNkQHGlen8L9400kb88R9bv8qtT
         r+LWXeTETvCp+CPKgU2po7i3RnjySI6RnBAhEL32V7dQ9S8UyJsumb1vjCXs0I+goGap
         TqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708894690; x=1709499490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qysAaItgkYAq3SwTLN3VU8RMWCs5RzMALqFImfrNUHc=;
        b=YMAKOkTnhSOvnKhwoQhL//9XfVbzdcOZ1fUZpicHvHne8lqZidI5+vleOLAKuLBkzP
         hF0HAZZIaexH1XkwrWaiYf/z+H2kBfSIKfM0VcFSOEPFq0pXv1U6dHeGA+fCuRpoWfPO
         /d08SxYPA+IA5PJi9W+9wPfzqMaSRulbRQfMKZpXkH04H+r6hqMTc4tujLeQNzDPocoR
         BrbrZqslH0jxCfV4aRXckR9M6dxcMyf6WjtAyAtLLx4TNcWuqNLPwy6NjFutPKrbYN3L
         jFj2EOTgC7UK/P4qvmwaLMYMuC0ZYc7y6QhovDD4XfkEsLOvkOil/cdDs6X3msPOXsBf
         aF5A==
X-Forwarded-Encrypted: i=1; AJvYcCW0DZH8tFr0UsYHYW0pFuAwO+oaSoIWP6K79sS9usyvU3OrZXnssE95pT7E/GyxVmjCGkYu/VguvrnX30FKyh27WuXLxka0wP+8InioWg==
X-Gm-Message-State: AOJu0YyXR9QfS5Ti2ZCs2DMGosRHc899Obrm7aidK2QQlrrztAAy+IH8
	gIqFbPsTxmeEMOYM11LqRxekOsnNDngUWna5QqXwgII4jRRuN9UE/vX1eScb4Pt4Z65dH1ONH73
	UulYdLkmUQ0xMtIke4MuoB95WwlGALHixh2qoCA==
X-Google-Smtp-Source: AGHT+IGLGLisc5bGf0HFG5iW6DFVysNuOika0kCxYs9Y52QBjZwPvU+tzTIDfoHJBRVgLI2wQUZxeL5lNMXPdzykdcM=
X-Received: by 2002:a05:6808:394a:b0:3c1:862d:7e2e with SMTP id
 en10-20020a056808394a00b003c1862d7e2emr6525742oib.50.1708894690053; Sun, 25
 Feb 2024 12:58:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
 <20240225-fd-dpu-debug-timeout-v3-1-252f2b21cdcc@linaro.org> <4e6b41f4-27a6-4c65-dc03-67437a9716ed@quicinc.com>
In-Reply-To: <4e6b41f4-27a6-4c65-dc03-67437a9716ed@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 22:57:58 +0200
Message-ID: <CAA8EJppNfdDsrMQA3cUR18b2so2qaw1fcFNMz0fW9rMSzFrysg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/msm/dpu: make "vblank timeout" more useful
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Feb 2024 at 21:44, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/25/2024 6:12 AM, Dmitry Baryshkov wrote:
> > We have several reports of vblank timeout messages. However after some
> > debugging it was found that there might be different causes to that.
> > To allow us to identify the DPU block that gets stuck, include the
> > actual CTL_FLUSH value into the timeout message.
> >
>
> the flush register shall also be part of the coredump in patch 3. so why
> is this needed?

I'd prefer to keep it. The devcoredump captures all registers, while
CTL_FLUSH points to the actual bit without the need to analyze the
coredump. At the very least, it allows us to analyze whether the issue
is the same or not (compare SSPP_DMA2 on c630 vs LM_1 on sdm660)
without looking into the dump.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > index 2aa72b578764..6058706f03e4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > @@ -480,7 +480,7 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
> >               (hw_ctl->ops.get_flush_register(hw_ctl) == 0),
> >               msecs_to_jiffies(50));
> >       if (ret <= 0) {
> > -             DPU_ERROR("vblank timeout\n");
> > +             DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
> >               return -ETIMEDOUT;
> >       }
> >
> >



-- 
With best wishes
Dmitry

