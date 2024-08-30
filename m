Return-Path: <linux-arm-msm+bounces-30310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BE1966A6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 22:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAB2C1C2223C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 20:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEBCEEC3;
	Fri, 30 Aug 2024 20:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNfe/ZnW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FFB13B297;
	Fri, 30 Aug 2024 20:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725049544; cv=none; b=Bkedx1Aqhe8ciRgrEUtZbkCglvWSOW99VO1Kby2omUDrPuAzavrfgEZNYtiEE94Zr8rSItTy/o34LEYZ/MS9JpPmZbJ3TPscDKeh7pDNBjXpTUPePK2sjoi3KtIEV9DAhtsnDtEltpoWvJajvC+sS2p246EJAotq9V8Enve6oK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725049544; c=relaxed/simple;
	bh=CbcEmKP5tP7qUth8pqx9aIYs5KcGozPf9xHgHVUVDBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/Hi432Yc7t30jGHsm1y0wYySrwukDo8b5bYIU1+KKGdA3fsglWQomFbjaXf4IKKBEqX+rO3KECoKgqD775pUzN3rv4KPc/LIpTWiDpj5ngSzBh3iZcjzzD94HMHVZFp5GjyunE0dKeV3SfI0WFXQODoYRrBrYr/u3vKF7RbmPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNfe/ZnW; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3df08d53820so1228221b6e.0;
        Fri, 30 Aug 2024 13:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725049542; x=1725654342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wmi/pTyUDK+aU0s8E9BEY8Nj85X7ZUgdfvMfSISCftU=;
        b=XNfe/ZnW+7d7HNhv2sOBrX0aG/rdC3mAmaoiT9Iw+DKtgwwhn3MLFnj4Qz907L2p+r
         yYGiDmFSoo+E1bWojKJXWTti2L2Id4ZXphonPRyCROwOJuLm2scuF4HmfsQVgalE4RYw
         QFf+mhNZkDlC4SuTyakdvu0e1fTsM4u/k3iKFHg8wU0pGO+nG08BNatE0zoUQIxQkGcR
         sQXEdc9m7bYXDCr5SYv9wI5xkB7Cuc7+CqEY/lhhgkiMtpDNHyW24zKA707tNU7z+jWh
         KSKILMXssv5yplmOuOVGiQDeUfh8cKri3d47u204lVo4uJdKsbF+uN06caUSPavyw9SC
         /30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725049542; x=1725654342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wmi/pTyUDK+aU0s8E9BEY8Nj85X7ZUgdfvMfSISCftU=;
        b=ob4vxkuRWixAiLiSpYfpL8WU6Xt22Kf8IDq3sC+SiEIlzDrQXtOpsJR+tjzgpbW1cp
         klqsZVzWyD6KhDFBmCm5hVafTsUaiPgq9fdti1g6NJ8SlwEqK6GRCwWOPPf5Lc5CPfBx
         Ri8sOc/F9O0TY3/BXihBL5xxoLHLXK8LWxXrFv+CfXHwoka5Egi8GQbHXmJvRu6Nxg62
         qWiHikRMR0hm2one7m6O2J1ht2wjMp+31vY23T8ceKX57KNMQYrz7A7c+WkyPwLvGSmB
         qYq1hm9rsUg0in9pNds8XER4gfa0RshAroCIMb9ZG97JGuewuKqbld7WABskWbTodX3w
         YFLA==
X-Forwarded-Encrypted: i=1; AJvYcCWkA1owDaRqJ3K/b9OYPMY5DycsGLAPkaCBjbUpOMOvHi5u4Chw3cpxLZqIJ1MgYm0mn0gdnklYz6jY3i3/@vger.kernel.org, AJvYcCWlhIP6L2hh80PivIqKZzEJgp+LU2gSCbbACBT/c82RCElgm7KKIzrSg+f3DjjfNKJsY/r70U7BK4/91+Bp@vger.kernel.org
X-Gm-Message-State: AOJu0YwTFVQvyj6Ff793UOW6NYyrN93XAV34QUAN8xUCmblHEOcBHf8g
	e663JQoBf+E0BC2RSxeq1ts4olUtyE6BsC+jPt5skor70grPQTNWfzB6TzQarMdCUEDmnp6G9gj
	orDClhJKuROVELqkk9OPlHYoFrIE=
X-Google-Smtp-Source: AGHT+IHaFeABA5Vn8ABw7yINmC+Tm9Vy/T6WIGe45B4kDw7kSZ+SHLVnOVzl36EETX7brTAbDLFvYuatHAuUDjNvzwA=
X-Received: by 2002:a05:6808:18a8:b0:3db:3303:834c with SMTP id
 5614622812f47-3df1c18dca3mr526467b6e.39.1725049541577; Fri, 30 Aug 2024
 13:25:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com> <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Aug 2024 13:25:27 -0700
Message-ID: <CAF6AEGuwtgzOZtDKPq+dna-mvv2M193Neow_7ZprxrLV+hf+FA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/msm/A6xx: Implement preemption for A7XX targets
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> This patch implements preemption feature for A6xx targets, this allows
> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
> hardware as such supports multiple levels of preemption granularities,
> ranging from coarse grained(ringbuffer level) to a more fine grained
> such as draw-call level or a bin boundary level preemption. This patch
> enables the basic preemption level, with more fine grained preemption
> support to follow.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> ---
>  drivers/gpu/drm/msm/Makefile              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 431 ++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
>  5 files changed, 921 insertions(+), 9 deletions(-)
>

[snip]

> @@ -784,6 +1062,16 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>                 msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
>         }
>
> +       a6xx_gpu->pwrup_reglist_ptr =3D msm_gem_kernel_new(gpu->dev, PAGE=
_SIZE,
> +                                                        MSM_BO_WC  | MSM=
_BO_MAP_PRIV,
> +                                                        gpu->aspace, &a6=
xx_gpu->pwrup_reglist_bo,
> +                                                        &a6xx_gpu->pwrup=
_reglist_iova);

I guess this could also be MSM_BO_GPU_READONLY?

BR,
-R

