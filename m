Return-Path: <linux-arm-msm+bounces-45897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D45AA19F12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 08:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04C77188ECEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 07:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FBF20B7ED;
	Thu, 23 Jan 2025 07:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G/FEgSG7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF240179A7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 07:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737617707; cv=none; b=ly8uewGoRMq+4MWMFnKN50eiasIemxBLQc5yvm4MNn+7GUTtSDciCGXcxaHe4RvU+U8iowJLK0vPpTpi2ad+w+52vcy0mt/7V+mmWk2UsElyyVT7gCub1impcyfKgbKJPOeGOJX53F9kKgadnrUAXqtCDCM04vakYsyC9heGDPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737617707; c=relaxed/simple;
	bh=XRJEgUhI39WyPu4jsActKO6m4sxjxll1QrDE1bKZlUM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dEPg+W/2oMaanH5WhlQ8QZvIAoA22o6vgu7nKd/xVJUIpC9ajehPFFaTX1uA0iryW17gm/wpow1qC7D39W78k8JeObTVf9zS/bMwpv2FyxHfNADX6ggtgylXpSEvTt1M8cLE/2g8DAiWt70bX3RPjYQOXmypYC12nde74ISgJLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G/FEgSG7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737617704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W4BN572VUFCarYdnwN8cGa+EHCfnb6F5sly/f0mJXB8=;
	b=G/FEgSG7YyUsxdQXs44j5LYGOTiLZInqUzFgc2ulqoSVTlex3W6hEVRlX+vXhBzk9tlhED
	A5wRgCxw1LITY02dHVeIp61txkln39DDFuq55Z7gPy1nSAuBtjVglbCl+Law/6yCUYyr3y
	0Ite2ses/h+FTAbPrn0q7gBHir7KrkA=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-bLJvsyBhP2GTmVIduhTdSg-1; Thu, 23 Jan 2025 02:35:03 -0500
X-MC-Unique: bLJvsyBhP2GTmVIduhTdSg-1
X-Mimecast-MFC-AGG-ID: bLJvsyBhP2GTmVIduhTdSg
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2166f9f52fbso18853165ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 23:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737617702; x=1738222502;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W4BN572VUFCarYdnwN8cGa+EHCfnb6F5sly/f0mJXB8=;
        b=MGpNMplXm7zZ1IQQc52R/cndt7CwOKODMnmJu3YhWRQQ6b7a9DKxmX1bBMvmL1QN3p
         UnQTijYUv1qsSFF+lfJt36XJBE8BoKPmh/azOayA/wFmI6VVX5fEVo21O5etfW+c+pxS
         tYIJ5/H537+owUx7wpdar/FlENb8Rme9IgVRIzP5399t9KH7mGHLED+9MHSj7S3LZ3cM
         s/q5bFysRr4S70ko7S7b/SWlmR0mlwVQOJC+bz0lbO3tZu2NEA2ZsytAg3MDeg5VlOQt
         sK7JDTXNZkxL6jws2bkf1S1PNffS7hjvbYNRdctSk4LK1TQapzLBmQHrfBR6cAsPHqw/
         xhHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrLJQo12dlinudLaHrfsLMNOTz5Nfv0jZvRQTZk3lsL1tMhJOA6IwSTYylDGz5Yo8IQOCP0HkzZiSRoiWC@vger.kernel.org
X-Gm-Message-State: AOJu0YyoJh6vIUIMpzm0GdXv+YgOcm2/paQAwcXjqEa8FYmkRMqbuXdF
	3zqorW9SVLt2MJvg6NJeAdTEloC74oZ8vxuU1tFkmEWZYicNwB8UI6mDpK59EMzjbljJO6QEbWy
	qGhOtyj26oG2r7Q+xSUdvuf31iQXYrePmoln5oA8hets3KRunvUGjCUSAvO9frSY=
X-Gm-Gg: ASbGncuKm5SGg5Qx8agWOH+wMUw/LFpoHokeBVdLjwp/EFg/wGgceqwJ/SkTxrGTEA2
	6wCR+msPVzwXCS2wCHrZXaLxYzzrqQXCuREgmGM0v4Nc+td4foaLnh8jWYt5YxEALAqhszNvisZ
	lBw5/EtemcWn6X1vWfAgSyOLrPCxkWBUoU9D4LG7jnQSJgSmjz1p3Zh3O+LJh8duK2TvCHqUhqu
	DPBt4WY747+ps1KmHsnblf1bvL7jSF5yeqJdkhp4euq3CmW3DxtBj0uj5W6rcikaVj3nOpaH44L
	eYkf6uKVvbVLuF+7ffji
X-Received: by 2002:a05:6a20:7b07:b0:1e1:ae83:ad04 with SMTP id adf61e73a8af0-1eb215902cbmr29852232637.27.1737617702193;
        Wed, 22 Jan 2025 23:35:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh77DDXX36dyhexySOTFKoaJSg/tDd255UJXbhLAfDvHlHC7l2xvqlFBRPYqoRrLU70wpG+g==
X-Received: by 2002:a05:6a20:7b07:b0:1e1:ae83:ad04 with SMTP id adf61e73a8af0-1eb215902cbmr29852184637.27.1737617701798;
        Wed, 22 Jan 2025 23:35:01 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9c9462sm12612476b3a.100.2025.01.22.23.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 23:35:01 -0800 (PST)
Message-ID: <e6aea551ec14bcece31c3cbb861afee361547f84.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, Boris Brezillon
	 <boris.brezillon@collabora.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>,  Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,  Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>,  Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>,  Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>,  Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Luben Tuikov <ltuikov89@gmail.com>, Melissa Wen
 <mwen@igalia.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>,  Sunil Khatri <sunil.khatri@amd.com>, Lijo
 Lazar <lijo.lazar@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,  etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org,  linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,  nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 08:34:30 +0100
In-Reply-To: <Z5HHjnTzhNX9j05U@lstrano-desk.jf.intel.com>
References: <20250122140818.45172-3-phasta@kernel.org>
	 <20250122165104.536c4143@collabora.com>
	 <ce6bd1f3-8d7c-4b3c-af07-b8c9e0912f51@ursulin.net>
	 <20250122180353.7ef8fbc1@collabora.com>
	 <Z5HHjnTzhNX9j05U@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-01-22 at 20:37 -0800, Matthew Brost wrote:
> On Wed, Jan 22, 2025 at 06:04:58PM +0100, Boris Brezillon wrote:
> > On Wed, 22 Jan 2025 16:14:59 +0000
> > Tvrtko Ursulin <tursulin@ursulin.net> wrote:
> >=20
> > > On 22/01/2025 15:51, Boris Brezillon wrote:
> > > > On Wed, 22 Jan 2025 15:08:20 +0100
> > > > Philipp Stanner <phasta@kernel.org> wrote:
> > > > =C2=A0=20
> > > > > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > > > > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > > > > @@ -3272,6 +3272,7 @@ group_create_queue(struct panthor_group
> > > > > *group,
> > > > > =C2=A0=C2=A0		=C2=A0=C2=A0 const struct drm_panthor_queue_create
> > > > > *args)
> > > > > =C2=A0 {
> > > > > =C2=A0=C2=A0	struct drm_gpu_scheduler *drm_sched;
> > > > > +	struct drm_sched_init_params sched_params;=C2=A0=20
> > > >=20
> > > > nit: Could we use a struct initializer instead of a
> > > > memset(0)+field-assignment?
> > > >=20
> > > > 	struct drm_sched_init_params sched_params =3D {
> >=20
> > Actually, you can even make it const if it's not modified after the
> > declaration.
> >=20
> > > > 		.ops =3D &panthor_queue_sched_ops,
> > > > 		.submit_wq =3D group->ptdev->scheduler->wq,
> > > > 		.num_rqs =3D 1,
> > > > 		.credit_limit =3D args->ringbuf_size /
> > > > sizeof(u64),
> > > > 		.hang_limit =3D 0,
> > > > 		.timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS),
> > > > 		.timeout_wq =3D group->ptdev->reset.wq,
> > > > 		.name =3D "panthor-queue",
> > > > 		.dev =3D group->ptdev->base.dev,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };=C2=A0=20
> > >=20
>=20
> +2

Yup, getting rid of memset() similar to Danilo's suggestion is surely a
good idea.

I personally don't like mixing initialization and declaration when
possible (readability), but having it const is probably a good
argument.

P.

>=20
> Matt
>=20
> > > +1 on this as a general approach for the whole series. And I'd
> > > drop the=20
> > > explicit zeros and NULLs. Memsets could then go too.
> > >=20
> > > Regards,
> > >=20
> > > Tvrtko
> > >=20
> > > >=20
> > > > The same comment applies the panfrost changes BTW.
> > > > =C2=A0=20
> > > > > =C2=A0=C2=A0	struct panthor_queue *queue;
> > > > > =C2=A0=C2=A0	int ret;
> > > > > =C2=A0=20
> > > > > @@ -3289,6 +3290,8 @@ group_create_queue(struct panthor_group
> > > > > *group,
> > > > > =C2=A0=C2=A0	if (!queue)
> > > > > =C2=A0=C2=A0		return ERR_PTR(-ENOMEM);
> > > > > =C2=A0=20
> > > > > +	memset(&sched_params, 0, sizeof(struct
> > > > > drm_sched_init_params));
> > > > > +
> > > > > =C2=A0=C2=A0	queue->fence_ctx.id =3D dma_fence_context_alloc(1);
> > > > > =C2=A0=C2=A0	spin_lock_init(&queue->fence_ctx.lock);
> > > > > =C2=A0=C2=A0	INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
> > > > > @@ -3341,17 +3344,23 @@ group_create_queue(struct
> > > > > panthor_group *group,
> > > > > =C2=A0=C2=A0	if (ret)
> > > > > =C2=A0=C2=A0		goto err_free_queue;
> > > > > =C2=A0=20
> > > > > +	sched_params.ops =3D &panthor_queue_sched_ops;
> > > > > +	sched_params.submit_wq =3D group->ptdev->scheduler-
> > > > > >wq;
> > > > > +	sched_params.num_rqs =3D 1;
> > > > > =C2=A0=C2=A0	/*
> > > > > -	 * Credit limit argument tells us the total number
> > > > > of instructions
> > > > > +	 * The credit limit argument tells us the total
> > > > > number of instructions
> > > > > =C2=A0=C2=A0	 * across all CS slots in the ringbuffer, with some
> > > > > jobs requiring
> > > > > =C2=A0=C2=A0	 * twice as many as others, depending on their
> > > > > profiling status.
> > > > > =C2=A0=C2=A0	 */
> > > > > -	ret =3D drm_sched_init(&queue->scheduler,
> > > > > &panthor_queue_sched_ops,
> > > > > -			=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->scheduler->wq, 1,
> > > > > -			=C2=A0=C2=A0=C2=A0=C2=A0 args->ringbuf_size /
> > > > > sizeof(u64),
> > > > > -			=C2=A0=C2=A0=C2=A0=C2=A0 0,
> > > > > msecs_to_jiffies(JOB_TIMEOUT_MS),
> > > > > -			=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->reset.wq,
> > > > > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "panthor-queue", group-
> > > > > >ptdev->base.dev);
> > > > > +	sched_params.credit_limit =3D args->ringbuf_size /
> > > > > sizeof(u64);
> > > > > +	sched_params.hang_limit =3D 0;
> > > > > +	sched_params.timeout =3D
> > > > > msecs_to_jiffies(JOB_TIMEOUT_MS);
> > > > > +	sched_params.timeout_wq =3D group->ptdev->reset.wq;
> > > > > +	sched_params.score =3D NULL;
> > > > > +	sched_params.name =3D "panthor-queue";
> > > > > +	sched_params.dev =3D group->ptdev->base.dev;
> > > > > +
> > > > > +	ret =3D drm_sched_init(&queue->scheduler,
> > > > > &sched_params);
> > > > > =C2=A0=C2=A0	if (ret)
> > > > > =C2=A0=C2=A0		goto err_free_queue;=C2=A0=20
> >=20


