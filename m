Return-Path: <linux-arm-msm+bounces-46472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1F5A218A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 09:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A28721619B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 08:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD9019A28D;
	Wed, 29 Jan 2025 08:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrUOAPAv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857302F29;
	Wed, 29 Jan 2025 08:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738138167; cv=none; b=ONjjUYpNmcnOyY5Qx2OK3Y1P6xWGCkq/NMx0mXrBl1iPVb2FMMurk0BtmO/Hzd3uoHvPRzo07EdVd73AkLKFWqvjAgCEJzfvCv2ZFcRTQSaUUUt+RinWp0tIBh5xtSWnimWUT1KLOPr76b7/dI9bd25EIls/kT4hoxBvMKDVKQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738138167; c=relaxed/simple;
	bh=S+Qt8eFziu1bSo3XwsdBGdzJI+QLVguG9aumZqsL7Ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDZU9hEjBIsaCVA5LDxGMzUmrI3ka43tXDBqxdwe1ubVlqMHS7UJqpFK6DZO94srxPBRn0wKvB6Fto/IbUGeMLku4H+UNFuMxch585uF5xmN95saP+U+y3mwes4GNW3o8nJWL5PjcjfzdqCMtm9LI9DKWpkEtxEUFexRB/Nf4uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrUOAPAv; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ef28f07dbaso9117021a91.2;
        Wed, 29 Jan 2025 00:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738138165; x=1738742965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ye4JntaIkIF7a+w6DTbO0kIk9MLJPFfMjPP4/iHk7/A=;
        b=nrUOAPAvB6agyOhwK3sVMmUK0ian9HxPvyOq+9NnumkvhjRK+TLGhvaX3mOBO05bEC
         DqoEef7AIRJ0DPffJSYZwzl6lAAH4HBRu/R+nUnvyXBz+uWKVtTc1ZTir7/OE5YqLYbp
         OI7s4dbym/cjOcn4YMheIdqibS0zrpU5gY8mtpUJPYm6bwVm1id+0kcLkPs9Jq371322
         cT8nLlZECTh51Qo6L+2Pc7jesSLRrGd4NSDU5Z6oIB0/kgQi0WHSPIwp9Qti/x8aFBpW
         8Degp502Dk5YDosEvsUwUJDAvU7HvhTkHagIB0pMzUuvE4j63W5IK4AVX4UopZ/hQIYU
         vxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738138165; x=1738742965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ye4JntaIkIF7a+w6DTbO0kIk9MLJPFfMjPP4/iHk7/A=;
        b=UGcNgB1zE/Qt06jtqyvduowTNM13L2E2zhJgBdccrEeih67ZuUWlrYUjIRV4Ds0/yZ
         1eU/mNYwqy/h+KeGpAe/Y+Nb5iHv42R9+kGDhjzr7Lfo7h8eQ9UygaqQDUIIsTVVd8GF
         alnkGGGZ7HvauRLJ3uA6r6z5q22J/UVbQ+7MRuE2yUD8aj7hNsRPyJHdBCbAGAzbWNPl
         2nKtvZt8BaQkYq44IR4Axn37wea6yCIuFDg7Re2FIotqvdKE/Nzc9qOU8jboU3fzaoIE
         i9ky14SEnxvbb5BSfO+7kkFfbkA8leD8rF/bqOvv2sQ8Ab5Bqt/j9mPhiuTFQXG/XI+O
         V5XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcr0eQdITddbyVtEoOsddajH8ID2IXq6oVNo+PpJOO9f1Eds4RLjzwnFtQ5wMZIDMTYG8+87zWtCCnkrqE@vger.kernel.org, AJvYcCV+c/65GqldXg8nVzBwTJSWh+HfsSI3vlL70UPFzY0B7i3BN4Hdc2JE7quP0qxLlvc+TNQ6Yihy9695lnt2@vger.kernel.org
X-Gm-Message-State: AOJu0YxX2XDW1wnKtaPZE951+IFZI2qDX3+yrOOBBD+fCzgX3AXuqb3B
	iUtmK2VWycLaYnxU9VSbxGdr/tn7GZHcExWV3CnFUsJ1Dq6ivSmJx1Hqmq4lcAjc9sIg8ZQASDk
	TIMdv1u0JrfmwFwK324qR5T8TMcw=
X-Gm-Gg: ASbGncukvIJetOx9Uv/hBEERRtl/xeVvIyoX8wUfgMbD/QnXbW0YIZwQ5GYeIeqgNSQ
	y/EYEoQhy6ffcqSFiDF7/qUcLYv7yZeAH2oq9M7JjxKw1UqhLk8y4NsX/m3BHLhILb5K/hGQ=
X-Google-Smtp-Source: AGHT+IFL/+Ix8PJzhRPGezz0BS/aPmM+Mu6yVPfAQpJZPpemGpHRcd0USeaMTeXX7cwj2kNE9lfyVb+Qeot2NIY7ikQ=
X-Received: by 2002:a62:f20c:0:b0:72f:d7ce:5003 with SMTP id
 d2e1a72fcca58-72fd7ce50abmr734741b3a.22.1738138164688; Wed, 29 Jan 2025
 00:09:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128142927.103290-2-phasta@kernel.org>
In-Reply-To: <20250128142927.103290-2-phasta@kernel.org>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 29 Jan 2025 09:09:12 +0100
X-Gm-Features: AWEUYZk3uXItrn_mY6Y0468bmDyISJSZEOiGbSbsZd4jSdwj-_i30tdpr-sVXDQ
Message-ID: <CAH9NwWcokvvJSRQ_kbV+jiH+ag-SA+Y87n6Bw34s8GP3vop4og@mail.gmail.com>
Subject: Re: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
To: Philipp Stanner <phasta@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, 
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Matthew Brost <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>, 
	Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
	Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming in:
>
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in nouveau_sched=
_init()").
>
> Introduce a new struct for the scheduler init parameters and port all
> users.
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v2:
>   - Point out that the hang-limit is deprecated. (Christian)
>   - Initialize the structs to 0 at declaration. (Planet Earth)
>   - Don't set stuff explicitly to 0 / NULL. (Tvrtko)
>   - Make the structs const where possible. (Boris)
>   - v3d: Use just 1, universal, function for sched-init. (Ma=C3=ADra)
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++--
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    | 20 +++----
>  drivers/gpu/drm/imagination/pvr_queue.c    | 18 ++++--
>  drivers/gpu/drm/lima/lima_sched.c          | 16 +++--
>  drivers/gpu/drm/msm/msm_ringbuffer.c       | 17 +++---
>  drivers/gpu/drm/nouveau/nouveau_sched.c    | 15 +++--
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 20 ++++---
>  drivers/gpu/drm/panthor/panthor_mmu.c      | 16 +++--
>  drivers/gpu/drm/panthor/panthor_sched.c    | 29 +++++----
>  drivers/gpu/drm/scheduler/sched_main.c     | 50 ++++++----------
>  drivers/gpu/drm/v3d/v3d_sched.c            | 68 +++++++++-------------
>  drivers/gpu/drm/xe/xe_execlist.c           | 16 +++--
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c      | 17 +++++-
>  include/drm/gpu_scheduler.h                | 37 ++++++++++--
>  14 files changed, 206 insertions(+), 151 deletions(-)
>

etnaviv changes are

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy

