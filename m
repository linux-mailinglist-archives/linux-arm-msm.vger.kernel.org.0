Return-Path: <linux-arm-msm+bounces-45914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B27A1A00B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 09:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DE2F1886442
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 08:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D0420C024;
	Thu, 23 Jan 2025 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OotCA4IJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C341420C010
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737621609; cv=none; b=fXd7xDd0OKUohKlhmUn6OhevzcNLGR+H33nvbZJeSbA8gxVnnkRMUsUkbqlhHmEYkFdMmIEmIFm34wJoY7IgBnC6ODo6th7aJaC96gaHkrAaUqKqilX6xXAy9FzIc13N3HOHQexm2U0FdD+q+SXa5Q4d9jrnK7P+te5R6X5CZUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737621609; c=relaxed/simple;
	bh=QJdiWiv4nSIWdDx/A/BVxcAM834qatQE35Sldqfi95I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gJkzTF4jRTDqDoVEI6BgKEPKTE10/kXjgfVUlZYOWU9eQjeI0fI82RtHjqiYpza3VdM/sO00a1Nqt/g7pO5oHJvnhCR5CqZ+U1V7cxWgnxzIn38GFSCPL12XPS5eaODNF4/nkU4pIEP6KQXDV3EvFe6KsbiCb/GD5Vxj6PDUVWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OotCA4IJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737621607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2UVrjYVF1Hj7ct/lR3WK34rJGq50fF4xm9N2x7OTNc8=;
	b=OotCA4IJ3qt+/C8TCjrWSuyvLOGE3XHneKo0A3HwE0zei6KyWpTA9cIs/l/yuGLN+cUgYK
	gRxsb/XexaaEJISZh9akh9lgqPzeHU91Yr8axvHQNONKdPXS1vn5s2WIZqh2LS1lb/1KYN
	bZnssKbulDgaKEM81fcVlhZIK9vpn6k=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-Y0IRaq2bMU6RJwX_LH4GrQ-1; Thu, 23 Jan 2025 03:40:05 -0500
X-MC-Unique: Y0IRaq2bMU6RJwX_LH4GrQ-1
X-Mimecast-MFC-AGG-ID: Y0IRaq2bMU6RJwX_LH4GrQ
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2164fad3792so11579515ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 00:40:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737621604; x=1738226404;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2UVrjYVF1Hj7ct/lR3WK34rJGq50fF4xm9N2x7OTNc8=;
        b=ccAvNn8ixt0NcdZSdF2vGXKCXonoJ/Uit1u7he5cuI2x6MWSACWbS4Ta8NOnG+7qiI
         flrlUk13Bic3gTJEGt+isXwalSq3qstCLxvBi7ER3MxtMFis6yItWw+4Z+FWb5No86Oj
         +lJQEDDna23SNu8enA8hKgoV6gqgOfRfSkzc0rfiB5Trf625iKb2+UxK0DjcQmh1cwFh
         87cOFKiopVmWtNYn+AXRm6r7vCmXTGlBBYUWpc3p5AoflZ6p+1MybsKXsmoQGnMyTqRe
         rYwISsm3h8OhbkKNl3iqA6/EU4M9S1d3CM4Muq7i2tAJ35A/tKUNLSP9BLqjwcPcCQcM
         Akkg==
X-Forwarded-Encrypted: i=1; AJvYcCXp2h9u/mlVGNfVEEIJp9V3AHtVdrYaZLNPdBtLTicfjiKq1qmmHOoEo6xf5iUUOm4rxwaxk+QecCeUGPon@vger.kernel.org
X-Gm-Message-State: AOJu0YwkCxmF2UkKtaGVK/qh+3X4oYQTEOHDzo7rbxI46q0K3qe+qEA6
	qXoWo9xwz5zyV4GSZ00hfHr+SYfLtnGSsQ7xEGuDEGJu8UWt1jac6K9bAIfF2jpvS/r6aqhWi1A
	Ei1g+uv26e6o/x6ZvrLFr8Ds1KKQtfzUqgsQmGWTWxjr6YvQKYU4FWpGXL+2O+Jw=
X-Gm-Gg: ASbGncv0qUP1uKSU2M12v8OpyMGXMo3cdEOY5sxPl93LyLoN6cpTK8c5aPHHljMUa1X
	Qw2ChVHZL71luxDXpHXdNGx3kAp/HYcWHwEfiyFmXqhwJrIztaKxIP9q41OPcbtKFSp9ZPYOAyt
	ThxKOPl6z8u6yqUIg96r/89ncBdRWkFAHPI7d35WYBdHXRaMU2UEYOB9P5rKVboRWFMU/tzBC/c
	M5kqYaGeaH+gGkjhaOxnGTmcw4/2jVeshA0+uFL9594SA4byoN06GCs+fdKCIogl+P5d9oiI0Os
	chOgTbDsnMs++x6j7MUr
X-Received: by 2002:a17:902:ecd0:b0:21a:8d4c:a9b5 with SMTP id d9443c01a7336-21c354074d5mr440970545ad.12.1737621603744;
        Thu, 23 Jan 2025 00:40:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjy5zeoBnE4MWUb8nS8W6PuTx5lRnMpBd96eiXkRiC93gkB/4V1moQBoGz9Tc4XIWiP/Uefw==
X-Received: by 2002:a17:902:ecd0:b0:21a:8d4c:a9b5 with SMTP id d9443c01a7336-21c354074d5mr440969935ad.12.1737621603306;
        Thu, 23 Jan 2025 00:40:03 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e907csm107632205ad.199.2025.01.23.00.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:40:02 -0800 (PST)
Message-ID: <55569c2edf754c0e751d272016630528a28e86c8.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
From: Philipp Stanner <pstanner@redhat.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>,  Christian Gmeiner
 <christian.gmeiner@gmail.com>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>,  Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>,  Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Boris
 Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>, Lucas De Marchi
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
Date: Thu, 23 Jan 2025 09:39:31 +0100
In-Reply-To: <9713798aa175aef2041e6d688ac4814006f789bc.camel@redhat.com>
References: <20250122140818.45172-3-phasta@kernel.org>
	 <24f1c52f-1768-47de-88e3-d4104969d0a9@igalia.com>
	 <9713798aa175aef2041e6d688ac4814006f789bc.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-01-23 at 09:10 +0100, Philipp Stanner wrote:
> On Wed, 2025-01-22 at 19:07 -0300, Ma=C3=ADra Canal wrote:
> > Hi Philipp,
> >=20
> > On 22/01/25 11:08, Philipp Stanner wrote:
> > > drm_sched_init() has a great many parameters and upcoming new
> > > functionality for the scheduler might add even more. Generally,
> > > the
> > > great number of parameters reduces readability and has already
> > > caused
> > > one missnaming in:
> > >=20
> > > commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> > > nouveau_sched_init()").
> > >=20
> > > Introduce a new struct for the scheduler init parameters and port
> > > all
> > > users.
> > >=20
> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > ---
> > > Howdy,
> > >=20
> > > I have a patch-series in the pipe that will add a `flags`
> > > argument
> > > to
> > > drm_sched_init(). I thought it would be wise to first rework the
> > > API as
> > > detailed in this patch. It's really a lot of parameters by now,
> > > and
> > > I
> > > would expect that it might get more and more over the years for
> > > special
> > > use cases etc.
> > >=20
> > > Regards,
> > > P.
> > > ---
> > > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |=C2=A0 21 +++-
> > > =C2=A0 drivers/gpu/drm/etnaviv/etnaviv_sched.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 20 ++-
> > > =C2=A0 drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 21 +++-
> > > =C2=A0 drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 21 +++-
> > > =C2=A0 drivers/gpu/drm/msm/msm_ringbuffer.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 22 ++--
> > > =C2=A0 drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 20 ++-
> > > =C2=A0 drivers/gpu/drm/panfrost/panfrost_job.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 22 ++--
> > > =C2=A0 drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 18 ++-
> > > =C2=A0 drivers/gpu/drm/panthor/panthor_sched.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 23 ++--
> > > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 53 +++-----
> > > =C2=A0 drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 135
> > > +++++++++++++++-
> > > -----
> > > =C2=A0 drivers/gpu/drm/xe/xe_execlist.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 20 ++-
> > > =C2=A0 drivers/gpu/drm/xe/xe_gpu_scheduler.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 19 ++-
> > > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 35 +++++-
> > > =C2=A0 14 files changed, 311 insertions(+), 139 deletions(-)
> > >=20
> >=20
> > [...]
> >=20
> > > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> > > b/drivers/gpu/drm/v3d/v3d_sched.c
> > > index 99ac4995b5a1..716e6d074d87 100644
> > > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > > @@ -814,67 +814,124 @@ static const struct drm_sched_backend_ops
> > > v3d_cpu_sched_ops =3D {
> > > =C2=A0=C2=A0	.free_job =3D v3d_cpu_job_free
> > > =C2=A0 };
> > > =C2=A0=20
> > > +/*
> > > + * v3d's scheduler instances are all identical, except for ops
> > > and
> > > name.
> > > + */
> > > +static void
> > > +v3d_common_sched_init(struct drm_sched_init_params *params,
> > > struct
> > > device *dev)
> > > +{
> > > +	memset(params, 0, sizeof(struct drm_sched_init_params));
> > > +
> > > +	params->submit_wq =3D NULL; /* Use the system_wq. */
> > > +	params->num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > > +	params->credit_limit =3D 1;
> > > +	params->hang_limit =3D 0;
> > > +	params->timeout =3D msecs_to_jiffies(500);
> > > +	params->timeout_wq =3D NULL; /* Use the system_wq. */
> > > +	params->score =3D NULL;
> > > +	params->dev =3D dev;
> > > +}
> >=20
> > Could we use only one function that takes struct v3d_dev *v3d, enum
> > v3d_queue, and sched_ops as arguments (instead of one function per
> > queue)? You can get the name of the scheduler by concatenating
> > "v3d_"
> > to
> > the return of v3d_queue_to_string().
> >=20
> > I believe it would make the code much simpler.
>=20
> Hello,
>=20
> so just to get that right:
> You'd like to have one universal function that switch-cases over an
> enum, sets the ops and creates the name with string concatenation?

Oh, and here's another issue:
The @name string has life time issues to take into account. It must
live as long as the scheduler instance.

In your mind, where should the memory for the strings your
concatenating be and how should their life time be managed?

Currently they're in the TEXT segment, which is fine

P.


>=20
> I'm not convinced that this is simpler than a few small functions,
> but
> it's not my component, so=E2=80=A6
>=20
> Whatever we'll do will be simpler than the existing code, though.
> Right
> now no reader can see at first glance whether all those schedulers
> are
> identically parametrized or not.
>=20
> P.
>=20
>=20
> >=20
> > Best Regards,
> > - Ma=C3=ADra
> >=20
> > > +
> > > +static int
> > > +v3d_bin_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +	struct drm_sched_init_params params;
> > > +
> > > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > > +	params.ops =3D &v3d_bin_sched_ops;
> > > +	params.name =3D "v3d_bin";
> > > +
> > > +	return drm_sched_init(&v3d->queue[V3D_BIN].sched,
> > > &params);
> > > +}
> > > +
> > > +static int
> > > +v3d_render_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +	struct drm_sched_init_params params;
> > > +
> > > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > > +	params.ops =3D &v3d_render_sched_ops;
> > > +	params.name =3D "v3d_render";
> > > +
> > > +	return drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> > > &params);
> > > +}
> > > +
> > > +static int
> > > +v3d_tfu_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +	struct drm_sched_init_params params;
> > > +
> > > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > > +	params.ops =3D &v3d_tfu_sched_ops;
> > > +	params.name =3D "v3d_tfu";
> > > +
> > > +	return drm_sched_init(&v3d->queue[V3D_TFU].sched,
> > > &params);
> > > +}
> > > +
> > > +static int
> > > +v3d_csd_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +	struct drm_sched_init_params params;
> > > +
> > > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > > +	params.ops =3D &v3d_csd_sched_ops;
> > > +	params.name =3D "v3d_csd";
> > > +
> > > +	return drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > > &params);
> > > +}
> > > +
> > > +static int
> > > +v3d_cache_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +	struct drm_sched_init_params params;
> > > +
> > > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > > +	params.ops =3D &v3d_cache_clean_sched_ops;
> > > +	params.name =3D "v3d_cache_clean";
> > > +
> > > +	return drm_sched_init(&v3d-
> > > >queue[V3D_CACHE_CLEAN].sched,
> > > &params);
> > > +}
> > > +
> > > +static int
> > > +v3d_cpu_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +	struct drm_sched_init_params params;
> > > +
> > > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > > +	params.ops =3D &v3d_cpu_sched_ops;
> > > +	params.name =3D "v3d_cpu";
> > > +
> > > +	return drm_sched_init(&v3d->queue[V3D_CPU].sched,
> > > &params);
> > > +}
> > > +
> > > =C2=A0 int
> > > =C2=A0 v3d_sched_init(struct v3d_dev *v3d)
> > > =C2=A0 {
> > > -	int hw_jobs_limit =3D 1;
> > > -	int job_hang_limit =3D 0;
> > > -	int hang_limit_ms =3D 500;
> > > =C2=A0=C2=A0	int ret;
> > > =C2=A0=20
> > > -	ret =3D drm_sched_init(&v3d->queue[V3D_BIN].sched,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_bin_sched_ops, NULL,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > > NULL,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_bin", v3d->drm.dev);
> > > +	ret =3D v3d_bin_sched_init(v3d);
> > > =C2=A0=C2=A0	if (ret)
> > > =C2=A0=C2=A0		return ret;
> > > =C2=A0=20
> > > -	ret =3D drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_render_sched_ops, NULL,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > > NULL,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_render", v3d->drm.dev);
> > > +	ret =3D v3d_render_sched_init(v3d);
> > > =C2=A0=C2=A0	if (ret)
> > > =C2=A0=C2=A0		goto fail;
> > > =C2=A0=20
> > > -	ret =3D drm_sched_init(&v3d->queue[V3D_TFU].sched,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_tfu_sched_ops, NULL,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > > NULL,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_tfu", v3d->drm.dev);
> > > +	ret =3D v3d_tfu_sched_init(v3d);
> > > =C2=A0=C2=A0	if (ret)
> > > =C2=A0=C2=A0		goto fail;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	if (v3d_has_csd(v3d)) {
> > > -		ret =3D drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_csd_sched_ops, NULL,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit,
> > > job_hang_limit,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0
> > > msecs_to_jiffies(hang_limit_ms), NULL,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_csd", v3d-
> > > > drm.dev);
> > > +		ret =3D v3d_csd_sched_init(v3d);
> > > =C2=A0=C2=A0		if (ret)
> > > =C2=A0=C2=A0			goto fail;
> > > =C2=A0=20
> > > -		ret =3D drm_sched_init(&v3d-
> > > > queue[V3D_CACHE_CLEAN].sched,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_cache_clean_sched_ops,
> > > NULL,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit,
> > > job_hang_limit,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0
> > > msecs_to_jiffies(hang_limit_ms), NULL,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_cache_clean",
> > > v3d-
> > > > drm.dev);
> > > +		ret =3D v3d_cache_sched_init(v3d);
> > > =C2=A0=C2=A0		if (ret)
> > > =C2=A0=C2=A0			goto fail;
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -	ret =3D drm_sched_init(&v3d->queue[V3D_CPU].sched,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_cpu_sched_ops, NULL,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 1, job_hang_limit,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > > NULL,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_cpu", v3d->drm.dev);
> > > +	ret =3D v3d_cpu_sched_init(v3d);
> > > =C2=A0=C2=A0	if (ret)
> > > =C2=A0=C2=A0		goto fail;
> > > =C2=A0=20
> >=20
>=20


