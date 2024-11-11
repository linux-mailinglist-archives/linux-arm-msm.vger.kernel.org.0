Return-Path: <linux-arm-msm+bounces-37479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A2C9C418C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 16:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 019FDB233D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 15:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30A345016;
	Mon, 11 Nov 2024 15:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kt8v90Qo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1221BC58;
	Mon, 11 Nov 2024 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731337723; cv=none; b=tLELwmZidw6wHjhNM70BkY7dweNoOki4aOmV6L7Bld1ybsbUApdk0z3XPJjqSNsxgczifs+vjKW3/cEACtQQPlhfDD4XLGVB7bfM99v1QOf2L3aPU28fvKl0rfxb539LiTnPRPHj4DaQfLKVrclNSK+nUy3Z+eLZL+DZlhH9zX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731337723; c=relaxed/simple;
	bh=jbTdKOoq0RfDWqSZxOikCxvNlJa2f2WxDBd7h7Ay/B8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bAZxwf4BnlfC+gIIEU0zc/uwthkOlTGM+oeyVdHnYKgcX3RMcZO8mRQCarU/jUPx/1MVfTgGKkyM2VhJdinineJvtpQnumAow0EwAQwFM3idSbzTEBOATcSXnFooIy/1eqD/zyrgDGy/nOWkl+F7iOpXjgcgYo7pAqkVH0Tzy6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kt8v90Qo; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a3b4663e40so17556255ab.2;
        Mon, 11 Nov 2024 07:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731337721; x=1731942521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqDjKD0MpVgCKxlaiJrPGJcWbnb48b/VsDJVF/AEcyY=;
        b=Kt8v90QoFl93dJft9T+eFZoGpAMahlTK2m2FfBwUfz5DZx5AGBwhQ9HXlOJHAik/b0
         aeVKwi1LjRDEWMF0qvNb0maLFSPP3xu6F38Niu9VJ01zFiQfl/FM60upRId55DhOl/jK
         TYD2k+RVMMwWcgRPzDSZve1sHhGBUBUXOXu1TjkaqSOuInnBrocQA1MrCxrvhU8hxi/S
         eXWuaRH/cK5U5GKiigrDsfvpoUv8GOXE/OrfGprImfvDVjWjI5uzT1KCuxfbqbqMSkKF
         q9/gDDleaCcgU6fqd8m2g3urQlp/jZ6Tuhf3eSdoFwYlUnIp//zYndYA290bAnXsSTSh
         s2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731337721; x=1731942521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqDjKD0MpVgCKxlaiJrPGJcWbnb48b/VsDJVF/AEcyY=;
        b=bQIgwcNAfDvJLIplONm64sCroAYFfQujfncLqyS0eOt5ur4Tnz1S+HbUVdrukUk5IR
         KS9RrchoEXifx2oz3aWwxFJznAD2OmrQE6fGRJWwxpWtAOLkfEG+QKMB03A576GKVrzW
         ooZSJx/mkmh4BH3bKrz6ydu0UVcK3uZBQOSH9eXAtiXfqsU1bRBmh9ZPwAaI4Z8pQ0sd
         CtQ6BWF3vhqyVM8r/d20rHl9RQX8h8l/VzYt8cFIWAFlPlN7ALSCwL1waF+2DE2tu1tH
         bDJxwYhWjO89mYtmQt0O12gAi+ZL1bGTaY1qJCMmGOrZ+RCqsaCgh8nJipmmOboXHx7O
         DmCw==
X-Forwarded-Encrypted: i=1; AJvYcCW3Yc4yGF5BlWKWXwra2Fl4roSP7OtpQllmObXIR8SK92MXI5av1n706rUjGWXC7o95KI9cQBtHWd5Qxlkq@vger.kernel.org, AJvYcCXPGscPYvTghfCshp40BTY8Q2s2x+NlbBXg2FaQK0zYEZ/hWVJHK7kLKh0dfifpbWCSqStzxgsQUUJFMvis@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs562fW+2+A8x/tl2sEKUpJDK/fGn6pwX/KFSGePCUAwVUjSel
	hQzQq6nZwnG17hg9wdl2qHfC6NA9uq6o6ag/E54ZIdC4fFvizfkBM6YTcByVEDJ8xwacg1Kb0v/
	XTefz0MD1MCeQRassw5ttHXy+0lQ=
X-Google-Smtp-Source: AGHT+IH2DqHNH1lAaBPMKHfZf8DIZICij4huNrVtkaYHzbXzeXmfugxejRRHAtF2NyamwSTWbJkMJPmJyjEc/FaMe+0=
X-Received: by 2002:a05:6e02:160b:b0:3a3:4164:eec9 with SMTP id
 e9e14a558f8ab-3a6f1a15cb8mr141413625ab.14.1731337721225; Mon, 11 Nov 2024
 07:08:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com> <20241110-adreno-smmu-aparture-v2-2-9b1fb2ee41d4@oss.qualcomm.com>
In-Reply-To: <20241110-adreno-smmu-aparture-v2-2-9b1fb2ee41d4@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 11 Nov 2024 07:08:29 -0800
Message-ID: <CAF6AEGvD95RyUXDBjgmoefgO6QyeRw3tpa7EG1MLFKdxcoZ-4g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/adreno: Setup SMMU aparture for
 per-process page table
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 10, 2024 at 9:31=E2=80=AFAM Bjorn Andersson
<bjorn.andersson@oss.qualcomm.com> wrote:
>
> Support for per-process page tables requires the SMMU aparture to be
> setup such that the GPU can make updates with the SMMU. On some targets
> this is done statically in firmware, on others it's expected to be
> requested in runtime by the driver, through a SCM call.
>
> One place where configuration is expected to be done dynamically is the
> QCS6490 rb3gen2.
>
> The downstream driver does this unconditioanlly on any A6xx and newer,

nit, s/unconditioanlly/unconditionally/

> so follow suite and make the call.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>


> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 076be0473eb5..75f5367e73ca 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -572,8 +572,19 @@ struct drm_gem_object *adreno_fw_create_bo(struct ms=
m_gpu *gpu,
>
>  int adreno_hw_init(struct msm_gpu *gpu)
>  {
> +       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +       int ret;
> +
>         VERB("%s", gpu->name);
>
> +       if (adreno_gpu->info->family >=3D ADRENO_6XX_GEN1 &&
> +           qcom_scm_set_gpu_smmu_aperture_is_available()) {
> +               /* We currently always use context bank 0, so hard code t=
his */
> +               ret =3D qcom_scm_set_gpu_smmu_aperture(0);
> +               if (ret)
> +                       DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU =
aperture: %d\n", ret);
> +       }
> +
>         for (int i =3D 0; i < gpu->nr_rings; i++) {
>                 struct msm_ringbuffer *ring =3D gpu->rb[i];
>
>
> --
> 2.45.2
>

