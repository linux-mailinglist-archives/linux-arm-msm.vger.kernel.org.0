Return-Path: <linux-arm-msm+bounces-45911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C349A19F9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 09:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1929B188E61D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 08:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE0620C003;
	Thu, 23 Jan 2025 08:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T5eLXgAx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD3920B817
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 08:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737619864; cv=none; b=dB+78rWEldTKmI4aXDdwX/Qy4MRWFojvVliwatCR5zMToEWJAue4JTSmceplOCt7NEM7l2laaUIUtaM//4WLKFFKVBom0hV9MSBB2uVqKq/kByfGUhM4ElJPDOFSJsrcvs0sMxUSQS8PkOXPWBuPZempx212DfqTXfMOmPjdHUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737619864; c=relaxed/simple;
	bh=6zyWtjSXOFF/dI58ZsFxdcivwfL8mhY//HqPx9F3Pho=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iKVxd68waV8aMXmGAR0bxiDItd13rj0RJIATpdDZt+LKOkuNivXO2fksJwNUdEeHLou4EfvWOOz5Y0tISFfzWKm93e+mtFDbhQmN6S2cNq4Aic0QNNwe1K5h3E2M2/+PWB4HEQi8k2xs031vnIhtf1It0FpNqClOa9Sh0fzdliI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T5eLXgAx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737619861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDEdIsdcqGWdcyBaLw2Kh9VKml8ZAgVTT2SKLvAoRWM=;
	b=T5eLXgAxiTyeL0v1qpEvxRLWrn/GKAzKJV8Z6t7WQ/UrDdTpctAOByXwp1T3YzDnlP5bhs
	LIQcXHxcSPq9gbaDlV/ibYjYkSutcEaBvyJEe5aRVgcBZNH3ztts+7Q/+W/XaYk7k0x/hH
	HrsMOZ+2RrHXJnVM9SwCHPHIj9XyDrs=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-nU_g1ieAO9mOKNG0Ay-GMg-1; Thu, 23 Jan 2025 03:10:59 -0500
X-MC-Unique: nU_g1ieAO9mOKNG0Ay-GMg-1
X-Mimecast-MFC-AGG-ID: nU_g1ieAO9mOKNG0Ay-GMg
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21661949f23so19101125ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 00:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737619858; x=1738224658;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LDEdIsdcqGWdcyBaLw2Kh9VKml8ZAgVTT2SKLvAoRWM=;
        b=ONLJbb0Oq6D9VoHlbUmfYaLoLJkQnI/+UGayR1HT7b8XxrKlmnw3C6Jo1yfo/QQzBN
         DU5eZ6XXmHetzT1Pq/mjl0hxZjKqV6hBqj33FpeezGMiKUuYyAm0pgPrxcN0lEePzgf3
         DnG5DMgBiRZY8XSRAV/FnakphQNsrVjizqyUAp8oIQAIQa6wOtbmojFZfoubTYgbYMZF
         IPm2yn+EulQ/9kL/eAAk9h0/Nb7GslRkYca5mznBCRaXr/0G+Kc0nabU5nk/a0/xfPwJ
         69b51cPieGwAlqu9gvRES0Ibvv3wHHKDm/3hy9uJGH54Sjmdy0REaa/D7v9lWSImuL8K
         qQ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLrI60FdufKqKofHW7ylGjF8uOmB5+4nc0pKJKVIoqDbQ06qOWJAsqfctvVbXSwlCh8A3agypd0b2YRl6g@vger.kernel.org
X-Gm-Message-State: AOJu0YxxhCMVVCsMgcQiTJ+9rVNBNkTpqcl/o8hG8ykRp7sMDNby95/V
	S4th+4k0vt96u1iuNfMWIyqd0HDkgb5DpKgaPsmRKIXVmAKrtE2NxTIky2u6UxR2ZW3JfR1nHgL
	SDKT++qvEHpzmV8eYJ/+buaDL61dsSvfofv3ucNVUNGuuWjeYgLqycalXJ6GaRsE=
X-Gm-Gg: ASbGncvFFrp1WYTpnNW8Xpiesy+5gIj9klYeHBdbfE+Swlcd0R9AKqd3FbkZ5OaKWdv
	IlLMm8o2KCJcBMR5pb2kqHDoIVS1cs4A9rLXBi9jFEf1scZSzmP1hO9NOW6x/pt3Kolnfohc1SC
	UxnzDK1vID9A8fDjtiGNQcTpMTtGb5JER2Cs6an7oWXygZ6grtfVztdqr/TEjVRH0KbIwdc5S4A
	OFWLA37i4yfZHIHIjY4bdZkldlG+y/wz2Emm4NOhSVlqKxtRra4fD+RAGWw3Fnv2e5ai/3rbNy0
	B+uoTBY5vbwArBcHO+5u
X-Received: by 2002:a05:6a21:999e:b0:1db:e0d7:675c with SMTP id adf61e73a8af0-1eb2148cc78mr41049423637.13.1737619858120;
        Thu, 23 Jan 2025 00:10:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+36dB3XE2+vMLbg7FcqxiNuXmVO5+XixmEOWE9lkbQuRZwM0dXXk81m7Fw5CzxcBMx0XwwA==
X-Received: by 2002:a05:6a21:999e:b0:1db:e0d7:675c with SMTP id adf61e73a8af0-1eb2148cc78mr41049361637.13.1737619857677;
        Thu, 23 Jan 2025 00:10:57 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9c8de3sm12422995b3a.89.2025.01.23.00.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:10:57 -0800 (PST)
Message-ID: <9713798aa175aef2041e6d688ac4814006f789bc.camel@redhat.com>
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
Date: Thu, 23 Jan 2025 09:10:24 +0100
In-Reply-To: <24f1c52f-1768-47de-88e3-d4104969d0a9@igalia.com>
References: <20250122140818.45172-3-phasta@kernel.org>
	 <24f1c52f-1768-47de-88e3-d4104969d0a9@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-01-22 at 19:07 -0300, Ma=C3=ADra Canal wrote:
> Hi Philipp,
>=20
> On 22/01/25 11:08, Philipp Stanner wrote:
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
>=20
> [...]
>=20
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
>=20
> Could we use only one function that takes struct v3d_dev *v3d, enum
> v3d_queue, and sched_ops as arguments (instead of one function per
> queue)? You can get the name of the scheduler by concatenating "v3d_"
> to
> the return of v3d_queue_to_string().
>=20
> I believe it would make the code much simpler.

Hello,

so just to get that right:
You'd like to have one universal function that switch-cases over an
enum, sets the ops and creates the name with string concatenation?

I'm not convinced that this is simpler than a few small functions, but
it's not my component, so=E2=80=A6

Whatever we'll do will be simpler than the existing code, though. Right
now no reader can see at first glance whether all those schedulers are
identically parametrized or not.

P.


>=20
> Best Regards,
> - Ma=C3=ADra
>=20
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
>=20


