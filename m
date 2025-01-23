Return-Path: <linux-arm-msm+bounces-45912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF9DA19FD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 09:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8C2E1883E3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 08:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2A620C022;
	Thu, 23 Jan 2025 08:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mVh7Ask+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406E120C016;
	Thu, 23 Jan 2025 08:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737620634; cv=none; b=tjTt1GRzPWWkqAVUpDm3pG6bajIXUgQSa6yQ7MjLaB20Z4wo6L391hRIK2B8I0zg+xnUg0Ae19G4i5jO+p8Ae0jdTiGWiB63dGGUS3JymQXPbTs3mkmAqXDr3870wpkJTWPdI+g+VmEEOX37FjmLgFu2wGj/4fmO/O0eZRk5/qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737620634; c=relaxed/simple;
	bh=iGapPRqeW9iytt4zWZgelyigNEmJBdm6omiCHg2ZP1A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WnoS3B9s6V0PeDXfRlS4Uk7NeUrXA1vwxPt49ijxcmYiVGRclfLbGtm5odAm9Qcg5pg3svThmXC/ADlQstJ+/pdagQAmvCAUQL5Oyk4v2bWbsfuhkyanudq3BhjyhsNwySlzCvf0Jh14yTOsxVClD3r9FTKCTDRhJ1f1qq5Kz/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mVh7Ask+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737620630;
	bh=iGapPRqeW9iytt4zWZgelyigNEmJBdm6omiCHg2ZP1A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mVh7Ask+1N4gj26x77vJDnBb/CRcjQQST7WjyiL9lpQae4ceo73pdXGTPT5F6A/ak
	 SARsaQtedT/vNbJaKkHKyQgWZgLQFSMiaN4ev+VMP9soz813yc8snAY3XWIUuRGUAD
	 /CWPoexi7i0Ek3xUO2oWWsAMfpGL647bwniAYUzsLJpSn/boxHJkX8t3+alT6zkF6x
	 h5Px+Tmzy3B0ykrvcefV8osisg7jmvfkNVzLcUTji3sHINES4+cI1ibgiI8biQv6hk
	 RasyaG15bB8u/tgNdQ6ozkl1/CkTk1ZE4xMYD8kwBvyfJQ2ajQcvSAPJoVDHHFkgPw
	 8HvLt4fITM3vA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 506C817E0E57;
	Thu, 23 Jan 2025 09:23:48 +0100 (CET)
Date: Thu, 23 Jan 2025 09:23:41 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>, Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>, =?UTF-8?B?TWE=?=
 =?UTF-8?B?w61yYQ==?= Canal <mcanal@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, Yunxiang
 Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
Message-ID: <20250123092341.579f7b72@collabora.com>
In-Reply-To: <af5aac800f7d2153aa3c315584f70c55378c1b2b.camel@mailbox.org>
References: <20250122140818.45172-3-phasta@kernel.org>
	<20250122181227.491b7881@collabora.com>
	<af5aac800f7d2153aa3c315584f70c55378c1b2b.camel@mailbox.org>
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

On Thu, 23 Jan 2025 08:33:01 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> On Wed, 2025-01-22 at 18:16 +0100, Boris Brezillon wrote:
> > On Wed, 22 Jan 2025 15:08:20 +0100
> > Philipp Stanner <phasta@kernel.org> wrote:
> >  =20
> > > =C2=A0int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > - =C2=A0=C2=A0 const struct drm_sched_backend_ops *ops,
> > > - =C2=A0=C2=A0 struct workqueue_struct *submit_wq,
> > > - =C2=A0=C2=A0 u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
> > > - =C2=A0=C2=A0 long timeout, struct workqueue_struct *timeout_wq,
> > > - =C2=A0=C2=A0 atomic_t *score, const char *name, struct device *dev);
> > > + const struct drm_sched_init_params *params); =20
> >=20
> >=20
> > Another nit: indenting is messed up here. =20
>=20
> That was done on purpose.
>=20
> I never got why so many like to intend to the opening brackets,
> because:
>    1. The kernel coding guide line does not demand it
>    2. It mixes tabs with spaces
>    3. It doesn't create an identical level of intendation
>    4. It wastes huge amount of space and does not solve the problem of
>       long names, but might even make it worse:
>       https://elixir.bootlin.com/linux/v6.13-
>       rc3/source/drivers/gpu/drm/scheduler/sched_main.c#L1296

It's mostly a matter of keeping things consistent in a code base. I
don't really have strong opinions when it comes to coding style, but I
always try to follow the rules in place in the file/subsystem/project
I'm contributing to, and clearly the pattern in this file is to align
the extra lines of arguments on the first argument...

