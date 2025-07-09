Return-Path: <linux-arm-msm+bounces-64172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 054ACAFE574
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34286561215
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76034289839;
	Wed,  9 Jul 2025 10:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WDgn0IoC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796F228AB02;
	Wed,  9 Jul 2025 10:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752056121; cv=none; b=pdKCmimNRUrOoRVBXHE9LOwphH7CN914UKCCjnQnCVyUacK4XLLZ1JcTcCLB5l14hxaRdILQtbwCvaTMjzzIIbOGTcmxRJ+wpc0+80lxMz9SL9lbqXRJavD038/mtINZL2kx3Pz19PsSDRIRvB3voGZpTL3nEIOb1sy6mqZTros=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752056121; c=relaxed/simple;
	bh=9H7yNQmBzjwZpKm0GK1vm7xC4bKzfAoZXLAa93if9tA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NhkNpaOvHSPHzpN8wejwrBicz9l7dV90RZTaPlAmKdh6XvCERb3h71S/Zl88zauwfreiQmqO6RKsHys7E+eFF5c9AqKJF9xpcGeqmTtf81Vy294267ovYcAgYEwSLmjRt8b/buP12RSSn9vtE0jMCD1KY50yu/x9yesGCpltl0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WDgn0IoC; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bcYkk5cDLz9sXg;
	Wed,  9 Jul 2025 12:15:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1752056110; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mFira+KRxdt8d2FwCbb09WeKAggOn2O87AQVoaADDDg=;
	b=WDgn0IoCwgiKpF286Do31Pin7PJ2guwZj4o9mUTgcnO0KxKRTMpqV1aW5zxiX3N5htkerQ
	kLhuJfncnmUQFLRQycp7T3gADDfsZpqselBwPENiHlokvruIwHszV22QpuL2+jmHRmt6SC
	2yWvgFkRY9erkLCMUhDcYQiYSuAD9QcIo7iKFxOvDGh2JLrZV6jU9u+yBUUarJcP9qa938
	xzxeTJYjxtsL2NhiXfY1Iu86YK4LH1w0II4PxVwZh64bszBzCJlB/lXJnIgWpIqwwXfUWN
	OnrrZ4LsSmNbTztfn1SQlVuOOhFrIzV65WwXMXNPPStL+o/Z9X9QGj9JNOiJlQ==
Message-ID: <acb81a4e86f4f683c4f83509afdc5f24ea01e64d.camel@mailbox.org>
Subject: Re: [PATCH v4] drm/sched: Use struct for drm_sched_init() params
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Min Ma <min.ma@amd.com>, Lizhi Hou
 <lizhi.hou@amd.com>,  Oded Gabbay <ogabbay@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu
 <yuq825@gmail.com>,  Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,  Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Matthew Brost <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>, 
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>,  Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li
 <Yunxiang.Li@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
	lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, Christian Gmeiner <cgmeiner@igalia.com>
Date: Wed, 09 Jul 2025 12:14:54 +0200
In-Reply-To: <b5d0921c-7cbf-4d55-aa47-c35cd7861c02@igalia.com>
References: <20250211111422.21235-2-phasta@kernel.org>
	 <b5d0921c-7cbf-4d55-aa47-c35cd7861c02@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 61cb9201dd4f5be0598
X-MBO-RS-META: ay4k4wqr33dnoj1dmtnedfghmj9cfjnj

On Tue, 2025-07-08 at 14:02 +0100, Tvrtko Ursulin wrote:
>=20
>=20
> On 11/02/2025 11:14, Philipp Stanner wrote:
> > drm_sched_init() has a great many parameters and upcoming new
> > functionality for the scheduler might add even more. Generally, the
> > great number of parameters reduces readability and has already
> > caused
> > one missnaming, addressed in:
> >=20
> > commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> > nouveau_sched_init()").
> >=20
> > Introduce a new struct for the scheduler init parameters and port
> > all
> > users.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> > Acked-by: Matthew Brost <matthew.brost@intel.com> # for Xe
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> # for
> > Panfrost and Panthor
> > Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com> # for Etnaviv
> > Reviewed-by: Frank Binns <frank.binns@imgtec.com> # for Imagination
> > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com> # for Sched
> > Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com> # for v3d
> > ---
> > Changes in v4:
> > =C2=A0=C2=A0 - Add forgotten driver accel/amdxdna. (Me)
> > =C2=A0=C2=A0 - Rephrase the "init to NULL" comments. (Tvrtko)
> > =C2=A0=C2=A0 - Apply RBs by Tvrtko and Maira.
> > =C2=A0=C2=A0 - Terminate the last struct members with a comma, so that =
future
> > =C2=A0=C2=A0=C2=A0=C2=A0 fields can be added with a minimal patch diff.=
 (Me)
> >=20
> > Changes in v3:
> > =C2=A0=C2=A0 - Various formatting requirements.
> >=20
> > Changes in v2:
> > =C2=A0=C2=A0 - Point out that the hang-limit is deprecated. (Christian)
> > =C2=A0=C2=A0 - Initialize the structs to 0 at declaration. (Planet Eart=
h)
> > =C2=A0=C2=A0 - Don't set stuff explicitly to 0 / NULL. (Tvrtko)
> > =C2=A0=C2=A0 - Make the structs const where possible. (Boris)
> > =C2=A0=C2=A0 - v3d: Use just 1, universal, function for sched-init. (Ma=
=C3=ADra)
> > ---
>=20
> 8><
>=20
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
> > b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 9b8e82fb8bc4..5657106c2f7d 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -836,8 +836,16 @@ static irqreturn_t
> > panfrost_job_irq_handler(int irq, void *data)
> > =C2=A0=20
> > =C2=A0 int panfrost_job_init(struct panfrost_device *pfdev)
> > =C2=A0 {
> > +	struct drm_sched_init_args args =3D {
> > +		.ops =3D &panfrost_sched_ops,
> > +		.num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> > +		.credit_limit =3D 2,
> > +		.timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS),
> > +		.timeout_wq =3D pfdev->reset.wq,
>=20
> ^^^
>=20
> > +		.name =3D "pan_js",
> > +		.dev =3D pfdev->dev,
> > +	};
> > =C2=A0=C2=A0	struct panfrost_job_slot *js;
> > -	unsigned int nentries =3D 2;
> > =C2=A0=C2=A0	int ret, j;
> > =C2=A0=20
> > =C2=A0=C2=A0	/* All GPUs have two entries per queue, but without
> > jobchain
> > @@ -845,7 +853,7 @@ int panfrost_job_init(struct panfrost_device
> > *pfdev)
> > =C2=A0=C2=A0	 * so let's just advertise one entry in that case.
> > =C2=A0=C2=A0	 */
> > =C2=A0=C2=A0	if (!panfrost_has_hw_feature(pfdev,
> > HW_FEATURE_JOBCHAIN_DISAMBIGUATION))
> > -		nentries =3D 1;
> > +		args.credit_limit =3D 1;
> > =C2=A0=20
> > =C2=A0=C2=A0	pfdev->js =3D js =3D devm_kzalloc(pfdev->dev, sizeof(*js),
> > GFP_KERNEL);
> > =C2=A0=C2=A0	if (!js)
>=20
> Stumbled on this while looking at drm_sched_init() workqueue usage.
>=20
> I think this patch might need a fixup. Because somewhere around here
> in=20
> the code there is this:
>=20
> 	pfdev->reset.wq =3D alloc_ordered_workqueue("panfrost-reset",
> 0);
> 	if (!pfdev->reset.wq)
> 		return -ENOMEM;
>=20
> Which means that after the patch panfrost is using system_wq for the=20
> timeout handler instead the one it creates.

Ouch yes, that's definitely a very subtle bug. AFAICS it comes to be by
pfdev being initialized to 0.

Let me provide a fix..

P.

>=20
> > @@ -875,13 +883,7 @@ int panfrost_job_init(struct panfrost_device
> > *pfdev)
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
> > +		ret =3D drm_sched_init(&js->queue[j].sched, &args);
>=20
> ^^^
>=20
> > =C2=A0=C2=A0		if (ret) {
> > =C2=A0=C2=A0			dev_err(pfdev->dev, "Failed to create
> > scheduler: %d.", ret);
> > =C2=A0=C2=A0			goto err_sched;
>=20
> Regards,
>=20
> Tvrtko
>=20


