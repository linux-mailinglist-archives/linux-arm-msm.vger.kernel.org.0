Return-Path: <linux-arm-msm+bounces-26250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8A0931C52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 23:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCA5F1F22BDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 21:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A65D73462;
	Mon, 15 Jul 2024 21:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0xALRDM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78450C15B;
	Mon, 15 Jul 2024 21:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721077226; cv=none; b=Eh7cmOrQZqkGjAHQK/lUc/ySZGI7xPyKhWpR2EcBNUM8BkE+lQxSvCwk885wH4/dRqVaoxj8twSDGb4segmZEOHoKrRTa3eum28cO1tkCN0iHK4xdYXX+VMiBFeV7qxzXTMrzQCjV6eDAHSxAKhYsC4F36qW9WtciLLhEUFsfDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721077226; c=relaxed/simple;
	bh=AXs4n5DwZIYUmFhnZGwSKgSgTVqJW8zbrkX+BrFGJBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGXgyV7usGkuGkahVoPOIdTpo3kSuFYMld9ydUE0DGsiHuj2MLtOVm0aWnRr8pv60BPy65YOmNSKqqY5d5wKp1LyNoy15C19g+rqtzivS1sGQH2AqjTpqnWLgj8VKzqevKQLWG+qwHsxeGbycT5cTclB2HRN5vfJrNWL1loG5fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0xALRDM; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-58d24201934so1013130a12.0;
        Mon, 15 Jul 2024 14:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721077223; x=1721682023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENhBd/giIBmvRGbAMxmpkg4562kxij7xYuSKRQdtVwY=;
        b=Y0xALRDMRvHcVK7b4HPwdUHuYBaCj1X8fZKHm2RNsakkQy6Bzpbxkhp5kG63XV8/Ru
         cv/fkcpJM3KtJEOh5ThHKV+GW11dcE5inFq//ES1nd2R6r5ZYNUyyAEQo77Q3OxuJjXz
         X4zQzgFqRlIVWx1/Gr9HLmj7vP1R5vDSz9xiiNBmyVP9d9nhXbZXjstGIdlHPk9aaf+D
         zgq6So3XhtCDRk7hyOm+XVKy7SuuqLqOTJ5/UVjKG2BuBdQUkaUUFB8TL0oBB8fUdQKz
         eLMYV02gzzpnuGiMLoFCsp1qVYfI1P2H9gCngqCVVUUsrSoy8/3UdCFIRnviUcrfH1mb
         MHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721077223; x=1721682023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENhBd/giIBmvRGbAMxmpkg4562kxij7xYuSKRQdtVwY=;
        b=INPs8SK01VSbU63oEJDJL1aZloDMFqqAnHlFzvimUf7cUZl84Ah8Mybjjy1+plauhX
         V2XPltFCB6ZyisAw2YBJa71yTTjc97TTiUKwY002gZjO+g4VcJ+x39vHJqxX3fUecy5Y
         8Gv9hrvN94EvufYxV9RfO411aO8M5/rc6usMs2ZUF8KNo7vpu+AykNQFueRIiA8ebXQ0
         YKmVTc7JSGz2zgyyk9xVpUyL0XAYn/23UomuX4MSLhY9KmS1eCw+E8gcPioI9+9ysHZK
         xKkBAAp2kJHShlTo2+u0KgnNUJMHVaxmkt4mo1AEtjfud0rV7tmzfI4ieCCz8lj9ZGFK
         EPdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9b2RvPMiocac7HuvLO10EkACVZjoB0O+T4rsvg/bSaD8lcg/InweEsZFIw8KunCiwCErGmrvSKAl0LkjiUo6MkW7/GAzgV4tGGbp1n7eBGNkx4gkKspOydYIYwl7ZazuiZCCr18xmzfIpvw==
X-Gm-Message-State: AOJu0YyViM99UWFY2phvLb9KlBFO7FX2brlsOE68VNp24fVmfqxZuaBp
	7lYsbb38Z69gpvZTkDwdRuMf+KCq45XavpOLbdjj7vmBpkn/nBZPN/biemSQjZSo0+e+x/lvMnd
	4EJ9xj+XyTfBnbNrVsL3+yUxRCU4=
X-Google-Smtp-Source: AGHT+IELtIRuj2IFPS5Auby4HYA8C0n5FWUVbyyAlN9va4Y+v2PBAGvwaktfslNPDacTrYXKOEvXvFlTGlHsl4ysZ4c=
X-Received: by 2002:a50:a6c3:0:b0:58c:10fd:5082 with SMTP id
 4fb4d7f45d1cf-59eefbabcadmr72316a12.10.1721077222774; Mon, 15 Jul 2024
 14:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711100038.268803-1-vladimir.lypak@gmail.com> <20240711100038.268803-2-vladimir.lypak@gmail.com>
In-Reply-To: <20240711100038.268803-2-vladimir.lypak@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 15 Jul 2024 14:00:10 -0700
Message-ID: <CAF6AEGsyhQfsfyNwZQa99HSKxy6uXQvf=ikEijjLOBnkXJ=-2g@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/msm/a5xx: disable preemption in submits by default
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 3:02=E2=80=AFAM Vladimir Lypak <vladimir.lypak@gmai=
l.com> wrote:
>
> Fine grain preemption (switching from/to points within submits)
> requires extra handling in command stream of those submits, especially
> when rendering with tiling (using GMEM). However this handling is
> missing at this point in mesa (and always was). For this reason we get
> random GPU faults and hangs if more than one priority level is used
> because local preemption is enabled prior to executing command stream
> from submit.
> With that said it was ahead of time to enable local preemption by
> default considering the fact that even on downstream kernel it is only
> enabled if requested via UAPI.
>
> Fixes: a7a4c19c36de ("drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_=
LOCAL register")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index c0b5373e90d7..6c80d3003966 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -150,9 +150,13 @@ static void a5xx_submit(struct msm_gpu *gpu, struct =
msm_gem_submit *submit)
>         OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
>         OUT_RING(ring, 1);
>
> -       /* Enable local preemption for finegrain preemption */
> +       /*
> +        * Disable local preemption by default because it requires
> +        * user-space to be aware of it and provide additional handling
> +        * to restore rendering state or do various flushes on switch.
> +        */
>         OUT_PKT7(ring, CP_PREEMPT_ENABLE_LOCAL, 1);
> -       OUT_RING(ring, 0x1);
> +       OUT_RING(ring, 0x0);

From a quick look at the a530 pfp fw, it looks like
CP_PREEMPT_ENABLE_LOCAL is allowed in IB1/IB2 (ie. not restricted to
kernel RB).  So we should just disable it in the kernel, and let
userspace send a CP_PREEMPT_ENABLE_LOCAL to enable local preemption.

BR,
-R

>         /* Allow CP_CONTEXT_SWITCH_YIELD packets in the IB2 */
>         OUT_PKT7(ring, CP_YIELD_ENABLE, 1);
> --
> 2.45.2
>

