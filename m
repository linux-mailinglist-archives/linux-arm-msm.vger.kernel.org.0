Return-Path: <linux-arm-msm+bounces-30299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C494966899
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 20:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5658D1C2449D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 18:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF25B1BB688;
	Fri, 30 Aug 2024 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0ow5aR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6041BAEE3;
	Fri, 30 Aug 2024 18:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725040899; cv=none; b=BJI0TjbAH1ot3yM6Iv6VdEzMpfgZJN7OD4yzzZNCwhpiYX+xZnlTbYxUEBhkzXxJYBqL3cvdRQhV4wkMy2lYiQhiB0i6FyHERL8xyAixqqByX7gL31kQ0h9tuwP4H8K6fOs6q5NTrs1i0Sh7SwHeyYlZ97jvzNQAY0m6UEVRevI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725040899; c=relaxed/simple;
	bh=ZS7rAQHnKHVt9ULoDQ7CQ752YPOg47HODDvhgraxX1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OwwKBPTh19+nlHElvn6FzRtXDaEgMZ1keQiGBAhAddvFemwgcvj++X5/uXzKT9HMzoe67rQzjFIlnYE670MePXOTKLNj8AaOB+1sQs8qrmw2pTkNRC9PFfJv42R04w316548c/tS2aQr50S+rD2cu/oaxx76ezRcW1bmk8asgis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0ow5aR9; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-45693d58a19so3191571cf.1;
        Fri, 30 Aug 2024 11:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725040897; x=1725645697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLvYg5qPZOuBa2bLwjdlcUDAONbv8N/Y0QijdwRkes4=;
        b=N0ow5aR9aV9/WvouxeIs88GO9yxT5CDIUWW17pgldQD3B6fYCa/oGBI4/gWrrbZnKm
         bt+W+jCVM9rQYMaQD9WaaUs3ZxPlqSw1sekz8qPGnrxYvur/nSM+psUX8moxVy4F2FTy
         sa5PPqELSM0oYN5e7qpuDhOyAAToF2Lpv9T8EEATkrFAD49W9K9KD7VQdK3zWhhnnwif
         pThNPnNUkkcSXj7Zap0gBOKUrYETOijH3qKKqpY8ETXLMhlOV+xiwQZBD2kBRGK08iSm
         vqDvlGOHbwvsEdW2HtJbIV629+ZOH8XYT71C88Ukf0ZPhWk5MkSOUvgXss/VQsd7YmMH
         8efQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725040897; x=1725645697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLvYg5qPZOuBa2bLwjdlcUDAONbv8N/Y0QijdwRkes4=;
        b=MAn0gaZbD8AMEeYM4sT34DHN9QhLmvyyeJG/1pdMHQl1zQ0aZq7aDhBLP+mjduJXxx
         oFjSgoTB0EQL4MSujqtz6IJgWdLUFEDJ8uk+jsRdyF9rWZNtYAB5tgjP442Sm5sbPFAh
         J6ZaJ+cFZrjTA3WC2Jes4xcHcS7cILMeB9yEDboOxcBEoD6o1e+o0YM5Inx0im/ZDayR
         +DI0aRDGO1j4Lk/1oMln3+cQWeOCgGgQAZ3pvB1QRpbghP46P25Ve7eTgf5gu9aMho4L
         DXYKOrT1Fmq+IkWtpnV9ip2ESmwTWtooNLhApZGDWprBSg+QKF2/STlkAXVO/IS678+j
         /rTg==
X-Forwarded-Encrypted: i=1; AJvYcCVpVxZcZDx6ssgGvGiC2PggF5Mnd36wq4IDSy862P23hcKMEzeF+G3kCITfN4FSOY55Xwi3zXggQnKzwTdn@vger.kernel.org, AJvYcCXJ85lS+8I/z9iXxpYjEsD/NpXCKOb1smW4JsVJbVnJ1jfu+noLEHouDWwCZuKnM3qUHczOt1GKvoHfhMDp@vger.kernel.org
X-Gm-Message-State: AOJu0YxJN0N7eP7FwESI9YNvBCjHPCn0BQbxoMV/A9in524rfCQJxFaz
	DLMYW0HV3FMNiKgHU5UZpIO6Uk26q03Lm0vEk+mWbBC+mgkBa5hvV2BTTxTeO7RdHwDdS3leCma
	GLXv5Sq80SGUuCjgwdi6M473z+kY=
X-Google-Smtp-Source: AGHT+IFu///hBMmZWnVnZFXWWl3sgqFDNwBWJcs8tlCbuU7dA43zOW8J5u4FcLF2SJo5g8r7eT05NQ0pWhwY2DhDSV0=
X-Received: by 2002:a05:622a:2b4a:b0:44f:f11a:63de with SMTP id
 d75a77b69052e-4567f6fae93mr77951991cf.61.1725040896527; Fri, 30 Aug 2024
 11:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com> <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Aug 2024 11:01:23 -0700
Message-ID: <CAF6AEGtxCnoyrEHPknV7C9XO3OcTpSOmGq-j2K7UDKXF1j0ssA@mail.gmail.com>
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

> +
> +int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
> +               struct msm_gpu_submitqueue *queue)
> +{
> +       void *ptr;
> +
> +       /*
> +        * Create a per submitqueue buffer for the CP to save and restore=
 user
> +        * specific information such as the VPC streamout data.
> +        */
> +       ptr =3D msm_gem_kernel_new(gpu->dev, A6XX_PREEMPT_USER_RECORD_SIZ=
E,
> +                       MSM_BO_WC, gpu->aspace, &queue->bo, &queue->bo_io=
va);

Can this be MSM_BO_MAP_PRIV?  Otherwise it is visible (and writeable)
by other proceess's userspace generated cmdstream.

And a similar question for the scratch_bo..  I'd have to give some
thought to what sort of mischief could be had, but generall kernel
mappings that are not MAP_PRIV are a thing to be careful about.

BR,
-R

