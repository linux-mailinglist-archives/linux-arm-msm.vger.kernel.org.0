Return-Path: <linux-arm-msm+bounces-30300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A19649668DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 20:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6030228584B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 18:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C1B1BB6A3;
	Fri, 30 Aug 2024 18:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9BLLBFh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2001531C5;
	Fri, 30 Aug 2024 18:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725042255; cv=none; b=ViejbmdQe9G894BF0RUsQJaXZ0h8dz+6wsFx8gqE3HwmntHCmv4+m1p0UZmKHx0koqvr5pCONJNfiSE41Tvk1C+w3DsaY2oFLu+eBkIJgcaTW6hFDj2EAEici6dwKbfmziDb9+nqt8/YUtIZUrWhpqAtm66eJZIX6LaMlLsqBrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725042255; c=relaxed/simple;
	bh=+8Mi16jcy/tUa5JXPRMxxFyk9a2VflT+oEtctzkrnT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D91/56YkpGNnRtupetMJrLTNwGlvcSi9C5ogk4A/5Ua5p0Aed39JubOeC7Rn/oqy4A48FTFH4A4naurioDBmgoDzIAAn63HlzJadyTtVfJCA029S76WiWEVVJhu+iPOT2X9DWo8DNMMkn4ruyak+gEBkiw3rwW4EZceEL4jpKuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9BLLBFh; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-45680233930so12296891cf.3;
        Fri, 30 Aug 2024 11:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725042253; x=1725647053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPZxBSRso5pE3AEFn4SdS9B50SQjBiwX3ZtiCsZD6C0=;
        b=m9BLLBFhBEAMrLLN7HLt2aVORmOzBqyw553oT85mJWGEMM9BFz+LPzyQqXM8K13lqW
         OYR8g0Vrnfz6TTie2Q0hECccqkLLDT07jkyYODJuaBI/F6LKGJuHT4EX9PSqUPfwX74I
         Qj246KwhKeMzRj2ZRtQVrV88CyHcX/AsKcyWYMySrGEOfB5Im5tR0W1SiwkKAXLRmVNl
         wmqbBAbJ+G/AOsi/fYhEnZ057X6JBNdkuwGGdVQgJ3k0c3PqY8DcZrDlv1wP8bwFePfu
         kqDyEkgsasrH9CVfCQk1Kqeo22OgZhDXbISpc8hev0lz1MAUF0yDOVZFWeVCErb0aAQX
         F7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725042253; x=1725647053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPZxBSRso5pE3AEFn4SdS9B50SQjBiwX3ZtiCsZD6C0=;
        b=DQ5WAUhFprvfilug/ryBUsGb4Sase/zCQSZiSCEm50lpCsrDW8srSuys2fJxt8c0ZZ
         nQqg1E9ccA9ADm3gJ19vxkc+rx6nOmiwsiUE41TxwmPP9qXBBJ+FyZxShTlXsc5NEjGX
         xDsJBccPEhCTBh6GugGJK9oNClsmYeD9wp1YSdFuf24ICqqDpLY7w3SmbryjEMhXbm6S
         CLSutWPyY+VaMKx1DxaNAQmph59aZeTu6QN0fXA4EnoUFAM8JhS30mOJ9dy0hj2zfnTB
         nnLqU4/ABRq4sFqImDQs5rlsQEyDxPBGSRGSsyNsrr9NfhV910isHCoSrtWv3imzl7CC
         3icw==
X-Forwarded-Encrypted: i=1; AJvYcCU/SlT/SsTfOzDmq+IBvGTUUeP/jS3XRph8oulO1NJFY995ZQLkzgj8hq2u7eDDRJsZDXRlYmZJy1uC8nm5@vger.kernel.org, AJvYcCVRVUVwdzcGzmrUD+zMIxK2vKJRR8lkbSch6Ka3V3AKAPnXx6GGPuN+v/Paw/3S4pYgh/uoXr0PXr6NQTc2@vger.kernel.org
X-Gm-Message-State: AOJu0YyHaDZe4qpSrm0OSoMpuLJ1+gR8Z+ntm2MvBCqlXQ3MVS3SjvH6
	jppHwjtF+ug7Pj887eLk2vrXLmwIQHMphQdKSGsw+Hnbip8sAS7juDmLpW909q7hndIbY2FQrp7
	KMdlMs86F6wBzPpjcMR7VHTf+rmw=
X-Google-Smtp-Source: AGHT+IFfAZ5Dc/UAH0FAehnAcx0CC4YDuotMeeFeOIHs8OXYW9H+4ZEFhxkx/keeE+cv8gefPgcsT/Uchh3WnYFsJzo=
X-Received: by 2002:a05:622a:2590:b0:456:941c:f995 with SMTP id
 d75a77b69052e-456941cfb3dmr17682961cf.56.1725042252988; Fri, 30 Aug 2024
 11:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com> <20240830-preemption-a750-t-v2-9-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-9-86aeead2cd80@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Aug 2024 11:23:58 -0700
Message-ID: <CAF6AEGui3bFqTqwhSCcx38=WzbaHKmnttjXiff-=GT0HHQyapw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] drm/msm/A6xx: Enable preemption for A750
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> Initialize with 4 rings to enable preemption.
>
> For now only on A750 as other targets require testing.
>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index a2853309288b..ea518209c03d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2609,7 +2609,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *de=
v)
>                 return ERR_PTR(ret);
>         }
>
> -       if (is_a7xx)
> +       if (adreno_is_a750(adreno_gpu))
> +               ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7x=
x, 4);

perhaps it would be useful (to enable others to more easily test), to
allow this to be overridden with a modparam.. something like

       if ((enable_preemption =3D=3D 1) || (enable_preemption =3D=3D -1 &&
(config->info->quirks & ADRENO_QUIRK_PREEMPTION))

That would allow overriding enable_preemption to 1 or 0 on cmdline to
force enable/disable preemption.

That plus some instructions about how to test preemption (ie. what
deqp tests to run, or similar) would make it easier to "crowd source"
the testing (assuming you don't have every a7xx device there is)

BR,
-R

> +       else if (is_a7xx)
>                 ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7x=
x, 1);
>         else if (adreno_has_gmu_wrapper(adreno_gpu))
>                 ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmu=
wrapper, 1);
>
> --
> 2.46.0
>

