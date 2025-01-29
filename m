Return-Path: <linux-arm-msm+bounces-46471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ECEA21872
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 09:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F27D1886318
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 08:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5115192D63;
	Wed, 29 Jan 2025 07:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AWkLzdHh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FDE19AD8C;
	Wed, 29 Jan 2025 07:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738137598; cv=none; b=PwWkpUh+Cx1s3ogN51IMO+/Ifbb0f8jZhzRE80MXMV6k56SkQENvEojEXgn6uqVUIcLZ1htAiW825KORV2RQRb03av4FeTDIJQcr3ouSMNgRHajiUvfgRnis9Y94T83isxmENeWYDg9bsNkSIZg7IUkCnC1HDQWX++pJwkErre0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738137598; c=relaxed/simple;
	bh=nL0TTQtq4gD/ROKa9lhyxiBPOLnQoLFl6/akVgzIKJU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=neTcsCryICyLWyzQbm/qDd6oIUqtY7o0WvXfeFQkdmP58nk/T+3dIu+x6B4YG7trQVjNDV8JixK7SWoyZu0bQM1w2kUThJyyZmE3DJv0xuyuqr8q7OuVZqQE6tMYY0oRn+nGE1kWVoKnb8f3l3+ytI9WbB2uNoBqxTnp4pB51FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AWkLzdHh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738137594;
	bh=nL0TTQtq4gD/ROKa9lhyxiBPOLnQoLFl6/akVgzIKJU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AWkLzdHhcpG+P+emxJ33qjiIXsOdHkZjFZ5t8MlnATlGHZ1pxJ9JO2jJDuelpG7eK
	 GztXnDeB+r1xB7ReDJ45is59RCpk06uG2/wnCgtXk7LaS44Lv22L7QsBxIB+AxSZnw
	 HE6k9VGNUILnzdS3rMVmDGH+i0igR7NlMmIV4lDC+2Rb9rfwlwR3hMAsqx5C2Qa+2F
	 Xf88SwKOv8KLBDlxsM6J4RiftfvuUnf2m+ml1uj0wnp2h9ga7J5k5tbvg66hrAWfsh
	 1u75N87rA1MD03z9aMpYPIeTNMaeIaIxW96GaAWRcUqu582tRU8h3xdGnAZEPTMC57
	 QZkRFsHTTL2Eg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3DA8C17E0FCA;
	Wed, 29 Jan 2025 08:59:53 +0100 (CET)
Date: Wed, 29 Jan 2025 08:59:46 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu
 <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>, Melissa Wen
 <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li
 <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
Message-ID: <20250129085946.69e5ebf2@collabora.com>
In-Reply-To: <20250128142927.103290-2-phasta@kernel.org>
References: <20250128142927.103290-2-phasta@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Jan 2025 15:29:27 +0100
Philipp Stanner <phasta@kernel.org> wrote:

> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming in:
>=20
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in nouveau_sched=
_init()").
>=20
> Introduce a new struct for the scheduler init parameters and port all
> users.
>=20
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

Panfrost and panthor changes are

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>  drivers/gpu/drm/scheduler/sched_main.c     | 50 ++++++----------
>  drivers/gpu/drm/v3d/v3d_sched.c            | 68 +++++++++-------------
>  drivers/gpu/drm/xe/xe_execlist.c           | 16 +++--
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c      | 17 +++++-
>  include/drm/gpu_scheduler.h                | 37 ++++++++++--
>  14 files changed, 206 insertions(+), 151 deletions(-)

