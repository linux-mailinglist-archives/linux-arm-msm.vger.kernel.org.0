Return-Path: <linux-arm-msm+bounces-45817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB1DA1945A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 15:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B2FA1886FDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 14:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BA61F91C9;
	Wed, 22 Jan 2025 14:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RKHWNM4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC05777111
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737557345; cv=none; b=N3uFMnqaPvMuv8ILtQAmpnwyK7SZTx/UosW5+WH9XoMZbWnRaamSwENsCXL8pOXQXX0ce6/MxJTeYzC2CkyplKnConzFLnPgU+SRcTnN1IUfU0rmS3eW/J+t8U8JyUF5gdWRE35iIe5j6uEXxqX7hKIdZbTZJdSBFW22j1B9ZaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737557345; c=relaxed/simple;
	bh=x0XXo/lYJr+XpxWIKiATALppLrEDE7Dx/rsEzhI+mac=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I3diTL4mnVpSWXouAKyc8Lz07rmHSEY1jCVOF4VzHPF3IuKKxRLnlxXRQ3ujmn5n1jV/z8HEz5iLYhSxXvfcha6OVfb8xZEf8qUPOCqRWcuGxN12R0Bqz07srAuNIAK9NOe/W53J692PwrGwatWp7hvesi9eLMEmWMfSIkZcRhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RKHWNM4W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737557341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ffQZzI2GeKbdRCx1c3zKoYl9TBN9X9Sx0MSZr2ZMjHw=;
	b=RKHWNM4WNqh9Nv8yQhPzOWvj5IJr94Z4W9PemA9VcjAPJa1vBLDEQdOBHA0EL9d3q0BDYV
	bjUlH3HQmXulH4z8OFFAS2Mk6pT9QL4IIyM4gNLo9JYX66R1RGBlGDyuZ9gWDya6F9/jAe
	p2dONOPNZtgq/cRx1swWtoOoy6Ds9o0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-sSMXx0CHO6Sgwb-yAk_U8w-1; Wed, 22 Jan 2025 09:49:00 -0500
X-MC-Unique: sSMXx0CHO6Sgwb-yAk_U8w-1
X-Mimecast-MFC-AGG-ID: sSMXx0CHO6Sgwb-yAk_U8w
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43673af80a6so53313395e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 06:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737557339; x=1738162139;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ffQZzI2GeKbdRCx1c3zKoYl9TBN9X9Sx0MSZr2ZMjHw=;
        b=cFjai6Aqnp425pFdwHv38GiK9fsrKiJsAeACp7VHR2w8esuU1+AOCqafDzBdIYMqGE
         XFp34FxTab2DmF6qyp4MQmO5wE7WsdN5SMZ6npuIoAyPTLteq8zpSw4NX9M8hkP9OkhO
         mMOvjTi1kkQYtXQQhWBZDiZjmdUKOn89U9zPAbvEorOlZJOESMw9RfqhfdAvUqJtNpvN
         yvb0vojZFIbTADpxsrbXseS3+DlTwOmRPMgsdA/fINic8Wt1OOJ06GN029LRiEWJ3q82
         NOV+Yi44Qy6fUwj74DkdJEQ6LNu6S3zjCdxgZm4ZclVso0iVl/Qm1DEwnZ0Tw2Up4vIf
         Dh0A==
X-Forwarded-Encrypted: i=1; AJvYcCWxCelRBH6KEB2FAUCl0+3L3ZRwpc6KCkP+MLjoRReyXP1xid9P3bsPz6+OcBDeAVa8ghA9Wa9Zt3whpi0v@vger.kernel.org
X-Gm-Message-State: AOJu0YzpNHr+prXzUJz67rACL4zNtb8tg5s0AEITpjPrfIv45Myyi8zU
	ka5yXJVxAk4dKiQUv9mMAT8D3fauiTX05q7QpxpvVRbwWoZkOeutdRFkR73LDBnlOhVVVh+9tmn
	0Dp/ZaylPNsG5JSnK1A8kAXGqNLuhGr15ZI+KB+Ws8KtklwNSI2918QLeu+4oX+Q=
X-Gm-Gg: ASbGnct4zFYkKNZx9HLnKIWuvjzQ49Qy/9Q6hl5QDBAa1iHoMzRwRqMYmJzBATDvWvh
	3Nd1ifCHjzXDoPjvclgcFOtK55XD51MxY21qc/oYnytA5yhAhKNwFRfc/KsZyfxFH6OfjPAvQjz
	P6Ab3Ysbowwf79TaLnPLqQLFW1lWPYwIQmo6gWtIxKef0P8blbnApsyEqDNtWvrUJBgib2Rb2+z
	HxFRIp/no3feWqlNrUWAaabrSsB1W7lAtkWigVnaKUhLr+h1ySuZBImwI2cq7nII0XOuNwV5ICa
	HUWg4AJgTjbQwqvteOS0
X-Received: by 2002:a05:600c:1f8e:b0:435:d22:9c9e with SMTP id 5b1f17b1804b1-4389141c352mr169490065e9.19.1737557338437;
        Wed, 22 Jan 2025 06:48:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMWFKWBRExA8O4Zr3kYeHT/dLy5B6fLPNBx04niYQty7L4FTKE49zaATrkZkvvgtuZ2WwHLg==
X-Received: by 2002:a05:600c:1f8e:b0:435:d22:9c9e with SMTP id 5b1f17b1804b1-4389141c352mr169489565e9.19.1737557337737;
        Wed, 22 Jan 2025 06:48:57 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31c8764sm26761145e9.38.2025.01.22.06.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 06:48:57 -0800 (PST)
Message-ID: <5fe5160c06d3648d9bcff7bdc52a0167d05271d7.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>, Russell
 King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>, Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,  Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>,  Danilo Krummrich <dakr@kernel.org>, Boris
 Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>, 
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>,  Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
 Yunxiang Li <Yunxiang.Li@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org, 
	lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 15:48:54 +0100
In-Reply-To: <f149ca5c-b30a-4a24-82dd-c0b5e99a34e5@amd.com>
References: <20250122140818.45172-3-phasta@kernel.org>
	 <f149ca5c-b30a-4a24-82dd-c0b5e99a34e5@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-01-22 at 15:34 +0100, Christian K=C3=B6nig wrote:
> Am 22.01.25 um 15:08 schrieb Philipp Stanner:
> > drm_sched_init() has a great many parameters and upcoming new
> > functionality for the scheduler might add even more. Generally, the
> > great number of parameters reduces readability and has already
> > caused
> > one missnaming in:
> >=20
> > commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> > nouveau_sched_init()").
> >=20
> > Introduce a new struct for the scheduler init parameters and port
> > all
> > users.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > Howdy,
> >=20
> > I have a patch-series in the pipe that will add a `flags` argument
> > to
> > drm_sched_init(). I thought it would be wise to first rework the
> > API as
> > detailed in this patch. It's really a lot of parameters by now, and
> > I
> > would expect that it might get more and more over the years for
> > special
> > use cases etc.
> >=20
> > Regards,
> > P.
> > ---
> > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |=C2=A0 21 +++-
> > =C2=A0 drivers/gpu/drm/etnaviv/etnaviv_sched.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 20 ++-
> > =C2=A0 drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 21 +++-
> > =C2=A0 drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 21 +++-
> > =C2=A0 drivers/gpu/drm/msm/msm_ringbuffer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 22 ++--
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 20 ++-
> > =C2=A0 drivers/gpu/drm/panfrost/panfrost_job.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 22 ++--
> > =C2=A0 drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 18 ++-
> > =C2=A0 drivers/gpu/drm/panthor/panthor_sched.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 23 ++--
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 53 +++-----
> > =C2=A0 drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 135 +++++++++++++++-
> > -----
> > =C2=A0 drivers/gpu/drm/xe/xe_execlist.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 20 ++-
> > =C2=A0 drivers/gpu/drm/xe/xe_gpu_scheduler.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 19 ++-
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 35 +++++-
> > =C2=A0 14 files changed, 311 insertions(+), 139 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index cd4fac120834..c1f03eb5f5ea 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2821,6 +2821,9 @@ static int
> > amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> > =C2=A0 {
> > =C2=A0=C2=A0	long timeout;
> > =C2=A0=C2=A0	int r, i;
> > +	struct drm_sched_init_params params;
>=20
> Please keep the reverse xmas tree ordering for variable declaration.=20
> E.g. long lines first and variables like "i" and "r" last.

Okay dokay

>=20
> Apart from that looks like a good idea to me.
>=20
>=20
> > +
> > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > =C2=A0=20
> > =C2=A0=C2=A0	for (i =3D 0; i < AMDGPU_MAX_RINGS; ++i) {
> > =C2=A0=C2=A0		struct amdgpu_ring *ring =3D adev->rings[i];
> > @@ -2844,12 +2847,18 @@ static int
> > amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> > =C2=A0=C2=A0			break;
> > =C2=A0=C2=A0		}
> > =C2=A0=20
> > -		r =3D drm_sched_init(&ring->sched,
> > &amdgpu_sched_ops, NULL,
> > -				=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -				=C2=A0=C2=A0 ring->num_hw_submission, 0,
> > -				=C2=A0=C2=A0 timeout, adev->reset_domain-
> > >wq,
> > -				=C2=A0=C2=A0 ring->sched_score, ring->name,
> > -				=C2=A0=C2=A0 adev->dev);
> > +		params.ops =3D &amdgpu_sched_ops;
> > +		params.submit_wq =3D NULL; /* Use the system_wq. */
> > +		params.num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > +		params.credit_limit =3D ring->num_hw_submission;
> > +		params.hang_limit =3D 0;
>=20
> Could we please remove the hang limit as first step to get this awful
> feature deprecated?

Remove it? From the struct you mean?

We can mark it as deprecated in the docstring of the new struct. That's
what you mean, don't you?

P.

>=20
> Thanks,
> Christian.
>=20
> > +		params.timeout =3D timeout;
> > +		params.timeout_wq =3D adev->reset_domain->wq;
> > +		params.score =3D ring->sched_score;
> > +		params.name =3D ring->name;
> > +		params.dev =3D adev->dev;
> > +
> > +		r =3D drm_sched_init(&ring->sched, &params);
> > =C2=A0=C2=A0		if (r) {
> > =C2=A0=C2=A0			DRM_ERROR("Failed to create scheduler on
> > ring %s.\n",
> > =C2=A0=C2=A0				=C2=A0 ring->name);
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > index 5b67eda122db..7d8517f1963e 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -145,12 +145,22 @@ int etnaviv_sched_push_job(struct
> > etnaviv_gem_submit *submit)
> > =C2=A0 int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> > =C2=A0 {
> > =C2=A0=C2=A0	int ret;
> > +	struct drm_sched_init_params params;
> > =C2=A0=20
> > -	ret =3D drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> > NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 etnaviv_hw_jobs_limit,
> > etnaviv_job_hang_limit,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(500), NULL, NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(gpu->dev), gpu->dev);
> > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > +
> > +	params.ops =3D &etnaviv_sched_ops;
> > +	params.submit_wq =3D NULL; /* Use the system_wq. */
> > +	params.num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > +	params.credit_limit =3D etnaviv_hw_jobs_limit;
> > +	params.hang_limit =3D etnaviv_job_hang_limit;
> > +	params.timeout =3D msecs_to_jiffies(500);
> > +	params.timeout_wq =3D NULL; /* Use the system_wq. */
> > +	params.score =3D NULL;
> > +	params.name =3D dev_name(gpu->dev);
> > +	params.dev =3D gpu->dev;
> > +
> > +	ret =3D drm_sched_init(&gpu->sched, &params);
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		return ret;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/imagination/pvr_queue.c
> > b/drivers/gpu/drm/imagination/pvr_queue.c
> > index c4f08432882b..03a2ce1a88e7 100644
> > --- a/drivers/gpu/drm/imagination/pvr_queue.c
> > +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> > @@ -1211,10 +1211,13 @@ struct pvr_queue *pvr_queue_create(struct
> > pvr_context *ctx,
> > =C2=A0=C2=A0	};
> > =C2=A0=C2=A0	struct pvr_device *pvr_dev =3D ctx->pvr_dev;
> > =C2=A0=C2=A0	struct drm_gpu_scheduler *sched;
> > +	struct drm_sched_init_params sched_params;
> > =C2=A0=C2=A0	struct pvr_queue *queue;
> > =C2=A0=C2=A0	int ctx_state_size, err;
> > =C2=A0=C2=A0	void *cpu_map;
> > =C2=A0=20
> > +	memset(&sched_params, 0, sizeof(struct
> > drm_sched_init_params));
> > +
> > =C2=A0=C2=A0	if (WARN_ON(type >=3D sizeof(props)))
> > =C2=A0=C2=A0		return ERR_PTR(-EINVAL);
> > =C2=A0=20
> > @@ -1282,12 +1285,18 @@ struct pvr_queue *pvr_queue_create(struct
> > pvr_context *ctx,
> > =C2=A0=20
> > =C2=A0=C2=A0	queue->timeline_ufo.value =3D cpu_map;
> > =C2=A0=20
> > -	err =3D drm_sched_init(&queue->scheduler,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 &pvr_queue_sched_ops,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 pvr_dev->sched_wq, 1, 64 * 1024, 1,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(500),
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 pvr_dev->sched_wq, NULL, "pvr-queue",
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 pvr_dev->base.dev);
> > +	sched_params.ops =3D &pvr_queue_sched_ops;
> > +	sched_params.submit_wq =3D pvr_dev->sched_wq;
> > +	sched_params.num_rqs =3D 1;
> > +	sched_params.credit_limit =3D 64 * 1024;
> > +	sched_params.hang_limit =3D 1;
> > +	sched_params.timeout =3D msecs_to_jiffies(500);
> > +	sched_params.timeout_wq =3D pvr_dev->sched_wq;
> > +	sched_params.score =3D NULL;
> > +	sched_params.name =3D "pvr-queue";
> > +	sched_params.dev =3D pvr_dev->base.dev;
> > +
> > +	err =3D drm_sched_init(&queue->scheduler, &sched_params);
> > =C2=A0=C2=A0	if (err)
> > =C2=A0=C2=A0		goto err_release_ufo;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c
> > b/drivers/gpu/drm/lima/lima_sched.c
> > index b40c90e97d7e..a64c50fb6d1e 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -513,20 +513,29 @@ static void lima_sched_recover_work(struct
> > work_struct *work)
> > =C2=A0=20
> > =C2=A0 int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const cha=
r
> > *name)
> > =C2=A0 {
> > +	struct drm_sched_init_params params;
> > =C2=A0=C2=A0	unsigned int timeout =3D lima_sched_timeout_ms > 0 ?
> > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lima_sched_timeout_=
ms : 10000;
> > =C2=A0=20
> > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > +
> > =C2=A0=C2=A0	pipe->fence_context =3D dma_fence_context_alloc(1);
> > =C2=A0=C2=A0	spin_lock_init(&pipe->fence_lock);
> > =C2=A0=20
> > =C2=A0=C2=A0	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
> > =C2=A0=20
> > -	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lima_job_hang_limit,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(timeout), NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, name, pipe->ldev->dev);
> > +	params.ops =3D &lima_sched_ops;
> > +	params.submit_wq =3D NULL; /* Use the system_wq. */
> > +	params.num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > +	params.credit_limit =3D 1;
> > +	params.hang_limit =3D lima_job_hang_limit;
> > +	params.timeout =3D msecs_to_jiffies(timeout);
> > +	params.timeout_wq =3D NULL; /* Use the system_wq. */
> > +	params.score =3D NULL;
> > +	params.name =3D name;
> > +	params.dev =3D pipe->ldev->dev;
> > +
> > +	return drm_sched_init(&pipe->base, &params);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > index c803556a8f64..49a2c7422dc6 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -59,11 +59,13 @@ static const struct drm_sched_backend_ops
> > msm_sched_ops =3D {
> > =C2=A0 struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu,
> > int id,
> > =C2=A0=C2=A0		void *memptrs, uint64_t memptrs_iova)
> > =C2=A0 {
> > +	struct drm_sched_init_params params;
> > =C2=A0=C2=A0	struct msm_ringbuffer *ring;
> > -	long sched_timeout;
> > =C2=A0=C2=A0	char name[32];
> > =C2=A0=C2=A0	int ret;
> > =C2=A0=20
> > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > +
> > =C2=A0=C2=A0	/* We assume everywhere that MSM_GPU_RINGBUFFER_SZ is a
> > power of 2 */
> > =C2=A0=C2=A0	BUILD_BUG_ON(!is_power_of_2(MSM_GPU_RINGBUFFER_SZ));
> > =C2=A0=20
> > @@ -95,13 +97,19 @@ struct msm_ringbuffer
> > *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> > =C2=A0=C2=A0	ring->memptrs =3D memptrs;
> > =C2=A0=C2=A0	ring->memptrs_iova =3D memptrs_iova;
> > =C2=A0=20
> > -	 /* currently managing hangcheck ourselves: */
> > -	sched_timeout =3D MAX_SCHEDULE_TIMEOUT;
> > +	params.ops =3D &msm_sched_ops;
> > +	params.submit_wq =3D NULL; /* Use the system_wq. */
> > +	params.num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > +	params.credit_limit =3D num_hw_submissions;
> > +	params.hang_limit =3D 0;
> > +	/* currently managing hangcheck ourselves: */
> > +	params.timeout =3D MAX_SCHEDULE_TIMEOUT;
> > +	params.timeout_wq =3D NULL; /* Use the system_wq. */
> > +	params.score =3D NULL;
> > +	params.name =3D to_msm_bo(ring->bo)->name;
> > +	params.dev =3D gpu->dev->dev;
> > =C2=A0=20
> > -	ret =3D drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 num_hw_submissions, 0, sched_timeout,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, to_msm_bo(ring->bo)-
> > >name, gpu->dev->dev);
> > +	ret =3D drm_sched_init(&ring->sched, &params);
> > =C2=A0=C2=A0	if (ret) {
> > =C2=A0=C2=A0		goto fail;
> > =C2=A0=C2=A0	}
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > index 4412f2711fb5..f20c2e612750 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > @@ -404,9 +404,11 @@ nouveau_sched_init(struct nouveau_sched
> > *sched, struct nouveau_drm *drm,
> > =C2=A0 {
> > =C2=A0=C2=A0	struct drm_gpu_scheduler *drm_sched =3D &sched->base;
> > =C2=A0=C2=A0	struct drm_sched_entity *entity =3D &sched->entity;
> > -	const long timeout =3D
> > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> > +	struct drm_sched_init_params params;
> > =C2=A0=C2=A0	int ret;
> > =C2=A0=20
> > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > +
> > =C2=A0=C2=A0	if (!wq) {
> > =C2=A0=C2=A0		wq =3D alloc_workqueue("nouveau_sched_wq_%d", 0,
> > WQ_MAX_ACTIVE,
> > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 current->pid);
> > @@ -416,10 +418,18 @@ nouveau_sched_init(struct nouveau_sched
> > *sched, struct nouveau_drm *drm,
> > =C2=A0=C2=A0		sched->wq =3D wq;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	ret =3D drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NOUVEAU_SCHED_PRIORITY_COUNT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 credit_limit, 0, timeout,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, "nouveau_sched", drm-
> > >dev->dev);
> > +	params.ops =3D &nouveau_sched_ops;
> > +	params.submit_wq =3D wq;
> > +	params.num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > +	params.credit_limit =3D credit_limit;
> > +	params.hang_limit =3D 0;
> > +	params.timeout =3D
> > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> > +	params.timeout_wq =3D NULL; /* Use the system_wq. */
> > +	params.score =3D NULL;
> > +	params.name =3D "nouveau_sched";
> > +	params.dev =3D drm->dev->dev;
> > +
> > +	ret =3D drm_sched_init(drm_sched, &params);
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		goto fail_wq;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
> > b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 9b8e82fb8bc4..6b509ff446b5 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -836,10 +836,13 @@ static irqreturn_t
> > panfrost_job_irq_handler(int irq, void *data)
> > =C2=A0=20
> > =C2=A0 int panfrost_job_init(struct panfrost_device *pfdev)
> > =C2=A0 {
> > +	struct drm_sched_init_params params;
> > =C2=A0=C2=A0	struct panfrost_job_slot *js;
> > =C2=A0=C2=A0	unsigned int nentries =3D 2;
> > =C2=A0=C2=A0	int ret, j;
> > =C2=A0=20
> > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > +
> > =C2=A0=C2=A0	/* All GPUs have two entries per queue, but without
> > jobchain
> > =C2=A0=C2=A0	 * disambiguation stopping the right job in the close path
> > is tricky,
> > =C2=A0=C2=A0	 * so let's just advertise one entry in that case.
> > @@ -872,16 +875,21 @@ int panfrost_job_init(struct panfrost_device
> > *pfdev)
> > =C2=A0=C2=A0	if (!pfdev->reset.wq)
> > =C2=A0=C2=A0		return -ENOMEM;
> > =C2=A0=20
> > +	params.ops =3D &panfrost_sched_ops;
> > +	params.submit_wq =3D NULL; /* Use the system_wq. */
> > +	params.num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > +	params.credit_limit =3D nentries;
> > +	params.hang_limit =3D 0;
> > +	params.timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS);
> > +	params.timeout_wq =3D pfdev->reset.wq;
> > +	params.score =3D NULL;
> > +	params.name =3D "pan_js";
> > +	params.dev =3D pfdev->dev;
> > +
> > =C2=A0=C2=A0	for (j =3D 0; j < NUM_JOB_SLOTS; j++) {
> > =C2=A0=C2=A0		js->queue[j].fence_context =3D
> > dma_fence_context_alloc(1);
> > =C2=A0=20
> > -		ret =3D drm_sched_init(&js->queue[j].sched,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 &panfrost_sched_ops, NULL,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 nentries, 0,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0
> > msecs_to_jiffies(JOB_TIMEOUT_MS),
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 pfdev->reset.wq,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "pan_js", pfdev->dev);
> > +		ret =3D drm_sched_init(&js->queue[j].sched,
> > &params);
> > =C2=A0=C2=A0		if (ret) {
> > =C2=A0=C2=A0			dev_err(pfdev->dev, "Failed to create
> > scheduler: %d.", ret);
> > =C2=A0=C2=A0			goto err_sched;
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
> > b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index a49132f3778b..4362442cbfd8 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -2268,6 +2268,7 @@ panthor_vm_create(struct panthor_device
> > *ptdev, bool for_mcu,
> > =C2=A0=C2=A0	u64 full_va_range =3D 1ull << va_bits;
> > =C2=A0=C2=A0	struct drm_gem_object *dummy_gem;
> > =C2=A0=C2=A0	struct drm_gpu_scheduler *sched;
> > +	struct drm_sched_init_params sched_params;
> > =C2=A0=C2=A0	struct io_pgtable_cfg pgtbl_cfg;
> > =C2=A0=C2=A0	u64 mair, min_va, va_range;
> > =C2=A0=C2=A0	struct panthor_vm *vm;
> > @@ -2284,6 +2285,8 @@ panthor_vm_create(struct panthor_device
> > *ptdev, bool for_mcu,
> > =C2=A0=C2=A0		goto err_free_vm;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > +	memset(&sched_params, 0, sizeof(struct
> > drm_sched_init_params));
> > +
> > =C2=A0=C2=A0	mutex_init(&vm->heaps.lock);
> > =C2=A0=C2=A0	vm->for_mcu =3D for_mcu;
> > =C2=A0=C2=A0	vm->ptdev =3D ptdev;
> > @@ -2325,11 +2328,18 @@ panthor_vm_create(struct panthor_device
> > *ptdev, bool for_mcu,
> > =C2=A0=C2=A0		goto err_mm_takedown;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > +	sched_params.ops =3D &panthor_vm_bind_ops;
> > +	sched_params.submit_wq =3D ptdev->mmu->vm.wq;
> > +	sched_params.num_rqs =3D 1;
> > +	sched_params.credit_limit =3D 1;
> > +	sched_params.hang_limit =3D 0;
> > =C2=A0=C2=A0	/* Bind operations are synchronous for now, no timeout
> > needed. */
> > -	ret =3D drm_sched_init(&vm->sched, &panthor_vm_bind_ops,
> > ptdev->mmu->vm.wq,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 1, 1, 0,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 MAX_SCHEDULE_TIMEOUT, NULL, NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 "panthor-vm-bind", ptdev->base.dev);
> > +	sched_params.timeout =3D MAX_SCHEDULE_TIMEOUT;
> > +	sched_params.timeout_wq =3D NULL; /* Use the system_wq. */
> > +	sched_params.score =3D NULL;
> > +	sched_params.name =3D "panthor-vm-bind";
> > +	sched_params.dev =3D ptdev->base.dev;
> > +	ret =3D drm_sched_init(&vm->sched, &sched_params);
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		goto err_free_io_pgtable;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c
> > b/drivers/gpu/drm/panthor/panthor_sched.c
> > index ef4bec7ff9c7..a324346d302f 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -3272,6 +3272,7 @@ group_create_queue(struct panthor_group
> > *group,
> > =C2=A0=C2=A0		=C2=A0=C2=A0 const struct drm_panthor_queue_create *args)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct drm_gpu_scheduler *drm_sched;
> > +	struct drm_sched_init_params sched_params;
> > =C2=A0=C2=A0	struct panthor_queue *queue;
> > =C2=A0=C2=A0	int ret;
> > =C2=A0=20
> > @@ -3289,6 +3290,8 @@ group_create_queue(struct panthor_group
> > *group,
> > =C2=A0=C2=A0	if (!queue)
> > =C2=A0=C2=A0		return ERR_PTR(-ENOMEM);
> > =C2=A0=20
> > +	memset(&sched_params, 0, sizeof(struct
> > drm_sched_init_params));
> > +
> > =C2=A0=C2=A0	queue->fence_ctx.id =3D dma_fence_context_alloc(1);
> > =C2=A0=C2=A0	spin_lock_init(&queue->fence_ctx.lock);
> > =C2=A0=C2=A0	INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
> > @@ -3341,17 +3344,23 @@ group_create_queue(struct panthor_group
> > *group,
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		goto err_free_queue;
> > =C2=A0=20
> > +	sched_params.ops =3D &panthor_queue_sched_ops;
> > +	sched_params.submit_wq =3D group->ptdev->scheduler->wq;
> > +	sched_params.num_rqs =3D 1;
> > =C2=A0=C2=A0	/*
> > -	 * Credit limit argument tells us the total number of
> > instructions
> > +	 * The credit limit argument tells us the total number of
> > instructions
> > =C2=A0=C2=A0	 * across all CS slots in the ringbuffer, with some jobs
> > requiring
> > =C2=A0=C2=A0	 * twice as many as others, depending on their profiling
> > status.
> > =C2=A0=C2=A0	 */
> > -	ret =3D drm_sched_init(&queue->scheduler,
> > &panthor_queue_sched_ops,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->scheduler->wq, 1,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 args->ringbuf_size / sizeof(u64),
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->reset.wq,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "panthor-queue", group->ptdev-
> > >base.dev);
> > +	sched_params.credit_limit =3D args->ringbuf_size /
> > sizeof(u64);
> > +	sched_params.hang_limit =3D 0;
> > +	sched_params.timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS);
> > +	sched_params.timeout_wq =3D group->ptdev->reset.wq;
> > +	sched_params.score =3D NULL;
> > +	sched_params.name =3D "panthor-queue";
> > +	sched_params.dev =3D group->ptdev->base.dev;
> > +
> > +	ret =3D drm_sched_init(&queue->scheduler, &sched_params);
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		goto err_free_queue;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 57da84908752..27db748a5269 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1240,40 +1240,25 @@ static void drm_sched_run_job_work(struct
> > work_struct *w)
> > =C2=A0=C2=A0 * drm_sched_init - Init a gpu scheduler instance
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * @sched: scheduler instance
> > - * @ops: backend operations for this scheduler
> > - * @submit_wq: workqueue to use for submission. If NULL, an
> > ordered wq is
> > - *	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allocated and used
> > - * @num_rqs: number of runqueues, one for each priority, up to
> > DRM_SCHED_PRIORITY_COUNT
> > - * @credit_limit: the number of credits this scheduler can hold
> > from all jobs
> > - * @hang_limit: number of times to allow a job to hang before
> > dropping it
> > - * @timeout: timeout value in jiffies for the scheduler
> > - * @timeout_wq: workqueue to use for timeout work. If NULL, the
> > system_wq is
> > - *		used
> > - * @score: optional score atomic shared with other schedulers
> > - * @name: name used for debugging
> > - * @dev: target &struct device
> > + * @params: scheduler initialization parameters
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Return 0 on success, otherwise error code.
> > =C2=A0=C2=A0 */
> > =C2=A0 int drm_sched_init(struct drm_gpu_scheduler *sched,
> > -		=C2=A0=C2=A0 const struct drm_sched_backend_ops *ops,
> > -		=C2=A0=C2=A0 struct workqueue_struct *submit_wq,
> > -		=C2=A0=C2=A0 u32 num_rqs, u32 credit_limit, unsigned int
> > hang_limit,
> > -		=C2=A0=C2=A0 long timeout, struct workqueue_struct
> > *timeout_wq,
> > -		=C2=A0=C2=A0 atomic_t *score, const char *name, struct
> > device *dev)
> > +		const struct drm_sched_init_params *params)
> > =C2=A0 {
> > =C2=A0=C2=A0	int i;
> > =C2=A0=20
> > -	sched->ops =3D ops;
> > -	sched->credit_limit =3D credit_limit;
> > -	sched->name =3D name;
> > -	sched->timeout =3D timeout;
> > -	sched->timeout_wq =3D timeout_wq ? : system_wq;
> > -	sched->hang_limit =3D hang_limit;
> > -	sched->score =3D score ? score : &sched->_score;
> > -	sched->dev =3D dev;
> > +	sched->ops =3D params->ops;
> > +	sched->credit_limit =3D params->credit_limit;
> > +	sched->name =3D params->name;
> > +	sched->timeout =3D params->timeout;
> > +	sched->timeout_wq =3D params->timeout_wq ? : system_wq;
> > +	sched->hang_limit =3D params->hang_limit;
> > +	sched->score =3D params->score ? params->score : &sched-
> > >_score;
> > +	sched->dev =3D params->dev;
> > =C2=A0=20
> > -	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> > +	if (params->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> > =C2=A0=C2=A0		/* This is a gross violation--tell drivers what
> > the=C2=A0 problem is.
> > =C2=A0=C2=A0		 */
> > =C2=A0=C2=A0		drm_err(sched, "%s: num_rqs cannot be greater than
> > DRM_SCHED_PRIORITY_COUNT\n",
> > @@ -1288,16 +1273,16 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched,
> > =C2=A0=C2=A0		return 0;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	if (submit_wq) {
> > -		sched->submit_wq =3D submit_wq;
> > +	if (params->submit_wq) {
> > +		sched->submit_wq =3D params->submit_wq;
> > =C2=A0=C2=A0		sched->own_submit_wq =3D false;
> > =C2=A0=C2=A0	} else {
> > =C2=A0 #ifdef CONFIG_LOCKDEP
> > -		sched->submit_wq =3D
> > alloc_ordered_workqueue_lockdep_map(name,
> > -
> > 								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WQ_MEM_RECLAIM,
> > -
> > 								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm_sched_lockdep_map);
> > +		sched->submit_wq =3D
> > alloc_ordered_workqueue_lockdep_map(
> > +					params->name,
> > WQ_MEM_RECLAIM,
> > +					&drm_sched_lockdep_map);
> > =C2=A0 #else
> > -		sched->submit_wq =3D alloc_ordered_workqueue(name,
> > WQ_MEM_RECLAIM);
> > +		sched->submit_wq =3D alloc_ordered_workqueue(params-
> > >name, WQ_MEM_RECLAIM);
> > =C2=A0 #endif
> > =C2=A0=C2=A0		if (!sched->submit_wq)
> > =C2=A0=C2=A0			return -ENOMEM;
> > @@ -1305,11 +1290,11 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched,
> > =C2=A0=C2=A0		sched->own_submit_wq =3D true;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	sched->sched_rq =3D kmalloc_array(num_rqs, sizeof(*sched-
> > >sched_rq),
> > +	sched->sched_rq =3D kmalloc_array(params->num_rqs,
> > sizeof(*sched->sched_rq),
> > =C2=A0=C2=A0					GFP_KERNEL | __GFP_ZERO);
> > =C2=A0=C2=A0	if (!sched->sched_rq)
> > =C2=A0=C2=A0		goto Out_check_own;
> > -	sched->num_rqs =3D num_rqs;
> > +	sched->num_rqs =3D params->num_rqs;
> > =C2=A0=C2=A0	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs;
> > i++) {
> > =C2=A0=C2=A0		sched->sched_rq[i] =3D kzalloc(sizeof(*sched-
> > >sched_rq[i]), GFP_KERNEL);
> > =C2=A0=C2=A0		if (!sched->sched_rq[i])
> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> > b/drivers/gpu/drm/v3d/v3d_sched.c
> > index 99ac4995b5a1..716e6d074d87 100644
> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > @@ -814,67 +814,124 @@ static const struct drm_sched_backend_ops
> > v3d_cpu_sched_ops =3D {
> > =C2=A0=C2=A0	.free_job =3D v3d_cpu_job_free
> > =C2=A0 };
> > =C2=A0=20
> > +/*
> > + * v3d's scheduler instances are all identical, except for ops and
> > name.
> > + */
> > +static void
> > +v3d_common_sched_init(struct drm_sched_init_params *params, struct
> > device *dev)
> > +{
> > +	memset(params, 0, sizeof(struct drm_sched_init_params));
> > +
> > +	params->submit_wq =3D NULL; /* Use the system_wq. */
> > +	params->num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > +	params->credit_limit =3D 1;
> > +	params->hang_limit =3D 0;
> > +	params->timeout =3D msecs_to_jiffies(500);
> > +	params->timeout_wq =3D NULL; /* Use the system_wq. */
> > +	params->score =3D NULL;
> > +	params->dev =3D dev;
> > +}
> > +
> > +static int
> > +v3d_bin_sched_init(struct v3d_dev *v3d)
> > +{
> > +	struct drm_sched_init_params params;
> > +
> > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > +	params.ops =3D &v3d_bin_sched_ops;
> > +	params.name =3D "v3d_bin";
> > +
> > +	return drm_sched_init(&v3d->queue[V3D_BIN].sched,
> > &params);
> > +}
> > +
> > +static int
> > +v3d_render_sched_init(struct v3d_dev *v3d)
> > +{
> > +	struct drm_sched_init_params params;
> > +
> > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > +	params.ops =3D &v3d_render_sched_ops;
> > +	params.name =3D "v3d_render";
> > +
> > +	return drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> > &params);
> > +}
> > +
> > +static int
> > +v3d_tfu_sched_init(struct v3d_dev *v3d)
> > +{
> > +	struct drm_sched_init_params params;
> > +
> > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > +	params.ops =3D &v3d_tfu_sched_ops;
> > +	params.name =3D "v3d_tfu";
> > +
> > +	return drm_sched_init(&v3d->queue[V3D_TFU].sched,
> > &params);
> > +}
> > +
> > +static int
> > +v3d_csd_sched_init(struct v3d_dev *v3d)
> > +{
> > +	struct drm_sched_init_params params;
> > +
> > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > +	params.ops =3D &v3d_csd_sched_ops;
> > +	params.name =3D "v3d_csd";
> > +
> > +	return drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > &params);
> > +}
> > +
> > +static int
> > +v3d_cache_sched_init(struct v3d_dev *v3d)
> > +{
> > +	struct drm_sched_init_params params;
> > +
> > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > +	params.ops =3D &v3d_cache_clean_sched_ops;
> > +	params.name =3D "v3d_cache_clean";
> > +
> > +	return drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
> > &params);
> > +}
> > +
> > +static int
> > +v3d_cpu_sched_init(struct v3d_dev *v3d)
> > +{
> > +	struct drm_sched_init_params params;
> > +
> > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > +	params.ops =3D &v3d_cpu_sched_ops;
> > +	params.name =3D "v3d_cpu";
> > +
> > +	return drm_sched_init(&v3d->queue[V3D_CPU].sched,
> > &params);
> > +}
> > +
> > =C2=A0 int
> > =C2=A0 v3d_sched_init(struct v3d_dev *v3d)
> > =C2=A0 {
> > -	int hw_jobs_limit =3D 1;
> > -	int job_hang_limit =3D 0;
> > -	int hang_limit_ms =3D 500;
> > =C2=A0=C2=A0	int ret;
> > =C2=A0=20
> > -	ret =3D drm_sched_init(&v3d->queue[V3D_BIN].sched,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_bin_sched_ops, NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_bin", v3d->drm.dev);
> > +	ret =3D v3d_bin_sched_init(v3d);
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		return ret;
> > =C2=A0=20
> > -	ret =3D drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_render_sched_ops, NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_render", v3d->drm.dev);
> > +	ret =3D v3d_render_sched_init(v3d);
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		goto fail;
> > =C2=A0=20
> > -	ret =3D drm_sched_init(&v3d->queue[V3D_TFU].sched,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_tfu_sched_ops, NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_tfu", v3d->drm.dev);
> > +	ret =3D v3d_tfu_sched_init(v3d);
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		goto fail;
> > =C2=A0=20
> > =C2=A0=C2=A0	if (v3d_has_csd(v3d)) {
> > -		ret =3D drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_csd_sched_ops, NULL,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit,
> > job_hang_limit,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0
> > msecs_to_jiffies(hang_limit_ms), NULL,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_csd", v3d-
> > >drm.dev);
> > +		ret =3D v3d_csd_sched_init(v3d);
> > =C2=A0=C2=A0		if (ret)
> > =C2=A0=C2=A0			goto fail;
> > =C2=A0=20
> > -		ret =3D drm_sched_init(&v3d-
> > >queue[V3D_CACHE_CLEAN].sched,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_cache_clean_sched_ops,
> > NULL,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit,
> > job_hang_limit,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0
> > msecs_to_jiffies(hang_limit_ms), NULL,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_cache_clean", v3d-
> > >drm.dev);
> > +		ret =3D v3d_cache_sched_init(v3d);
> > =C2=A0=C2=A0		if (ret)
> > =C2=A0=C2=A0			goto fail;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	ret =3D drm_sched_init(&v3d->queue[V3D_CPU].sched,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_cpu_sched_ops, NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 1, job_hang_limit,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_cpu", v3d->drm.dev);
> > +	ret =3D v3d_cpu_sched_init(v3d);
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		goto fail;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> > b/drivers/gpu/drm/xe/xe_execlist.c
> > index a8c416a48812..7f29b7f04af4 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -332,10 +332,13 @@ static const struct drm_sched_backend_ops
> > drm_sched_ops =3D {
> > =C2=A0 static int execlist_exec_queue_init(struct xe_exec_queue *q)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct drm_gpu_scheduler *sched;
> > +	struct drm_sched_init_params params;
> > =C2=A0=C2=A0	struct xe_execlist_exec_queue *exl;
> > =C2=A0=C2=A0	struct xe_device *xe =3D gt_to_xe(q->gt);
> > =C2=A0=C2=A0	int err;
> > =C2=A0=20
> > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > +
> > =C2=A0=C2=A0	xe_assert(xe, !xe_device_uc_enabled(xe));
> > =C2=A0=20
> > =C2=A0=C2=A0	drm_info(&xe->drm, "Enabling execlist submission (GuC
> > submission disabled)\n");
> > @@ -346,11 +349,18 @@ static int execlist_exec_queue_init(struct
> > xe_exec_queue *q)
> > =C2=A0=20
> > =C2=A0=C2=A0	exl->q =3D q;
> > =C2=A0=20
> > -	err =3D drm_sched_init(&exl->sched, &drm_sched_ops, NULL, 1,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 q->lrc[0]->ring.size /
> > MAX_JOB_SIZE_BYTES,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 XE_SCHED_HANG_LIMIT,
> > XE_SCHED_JOB_TIMEOUT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, q->hwe->name,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 gt_to_xe(q->gt)->drm.dev);
> > +	params.ops =3D &drm_sched_ops;
> > +	params.submit_wq =3D NULL; /* Use the system_wq. */
> > +	params.num_rqs =3D 1;
> > +	params.credit_limit =3D q->lrc[0]->ring.size /
> > MAX_JOB_SIZE_BYTES;
> > +	params.hang_limit =3D XE_SCHED_HANG_LIMIT;
> > +	params.timeout =3D XE_SCHED_JOB_TIMEOUT;
> > +	params.timeout_wq =3D NULL; /* Use the system_wq. */
> > +	params.score =3D NULL;
> > +	params.name =3D q->hwe->name;
> > +	params.dev =3D gt_to_xe(q->gt)->drm.dev;
> > +
> > +	err =3D drm_sched_init(&exl->sched, &params);
> > =C2=A0=C2=A0	if (err)
> > =C2=A0=C2=A0		goto err_free;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > index 50361b4638f9..2129fee83f25 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > @@ -63,13 +63,26 @@ int xe_sched_init(struct xe_gpu_scheduler
> > *sched,
> > =C2=A0=C2=A0		=C2=A0 atomic_t *score, const char *name,
> > =C2=A0=C2=A0		=C2=A0 struct device *dev)
> > =C2=A0 {
> > +	struct drm_sched_init_params params;
> > +
> > =C2=A0=C2=A0	sched->ops =3D xe_ops;
> > =C2=A0=C2=A0	INIT_LIST_HEAD(&sched->msgs);
> > =C2=A0=C2=A0	INIT_WORK(&sched->work_process_msg,
> > xe_sched_process_msg_work);
> > =C2=A0=20
> > -	return drm_sched_init(&sched->base, ops, submit_wq, 1,
> > hw_submission,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hang_limit, timeout, timeout_wq,
> > score, name,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev);
> > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > +
> > +	params.ops =3D ops;
> > +	params.submit_wq =3D submit_wq;
> > +	params.num_rqs =3D 1;
> > +	params.credit_limit =3D hw_submission;
> > +	params.hang_limit =3D hang_limit;
> > +	params.timeout =3D timeout;
> > +	params.timeout_wq =3D timeout_wq;
> > +	params.score =3D score;
> > +	params.name =3D name;
> > +	params.dev =3D dev;
> > +
> > +	return drm_sched_init(&sched->base, &params);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 void xe_sched_fini(struct xe_gpu_scheduler *sched)
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index 95e17504e46a..1a834ef43862 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -553,12 +553,37 @@ struct drm_gpu_scheduler {
> > =C2=A0=C2=A0	struct device			*dev;
> > =C2=A0 };
> > =C2=A0=20
> > +/**
> > + * struct drm_sched_init_params - parameters for initializing a
> > DRM GPU scheduler
> > + *
> > + * @ops: backend operations provided by the driver
> > + * @submit_wq: workqueue to use for submission. If NULL, an
> > ordered wq is
> > + *	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allocated and used
> > + * @num_rqs: Number of run-queues. This is at most
> > DRM_SCHED_PRIORITY_COUNT,
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as ther=
e's usually one run-queue per priority, but
> > could be less.
> > + * @credit_limit: the number of credits this scheduler can hold
> > from all jobs
> > + * @hang_limit: number of times to allow a job to hang before
> > dropping it
> > + * @timeout: timeout value in jiffies for the scheduler
> > + * @timeout_wq: workqueue to use for timeout work. If NULL, the
> > system_wq is
> > + *		used
> > + * @score: optional score atomic shared with other schedulers
> > + * @name: name used for debugging
> > + * @dev: associated device. Used for debugging
> > + */
> > +struct drm_sched_init_params {
> > +	const struct drm_sched_backend_ops *ops;
> > +	struct workqueue_struct *submit_wq;
> > +	struct workqueue_struct *timeout_wq;
> > +	u32 num_rqs, credit_limit;
> > +	unsigned int hang_limit;
> > +	long timeout;
> > +	atomic_t *score;
> > +	const char *name;
> > +	struct device *dev;
> > +};
> > +
> > =C2=A0 int drm_sched_init(struct drm_gpu_scheduler *sched,
> > -		=C2=A0=C2=A0 const struct drm_sched_backend_ops *ops,
> > -		=C2=A0=C2=A0 struct workqueue_struct *submit_wq,
> > -		=C2=A0=C2=A0 u32 num_rqs, u32 credit_limit, unsigned int
> > hang_limit,
> > -		=C2=A0=C2=A0 long timeout, struct workqueue_struct
> > *timeout_wq,
> > -		=C2=A0=C2=A0 atomic_t *score, const char *name, struct
> > device *dev);
> > +		const struct drm_sched_init_params *params);
> > =C2=A0=20
> > =C2=A0 void drm_sched_fini(struct drm_gpu_scheduler *sched);
> > =C2=A0 int drm_sched_job_init(struct drm_sched_job *job,
>=20


