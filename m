Return-Path: <linux-arm-msm+bounces-45921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 474ECA1A0EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C47E3AA08C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 09:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137B920C481;
	Thu, 23 Jan 2025 09:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AI8M5Qr0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF7920C484;
	Thu, 23 Jan 2025 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737624965; cv=none; b=SR/qVm64rMSsESQkWyxoUdK5BfsJbnajnuRaGSk8Es8Yt8YRby188qVydHDQE+8B3vclLWxTSfMzW3tsoJcnuWpAdzsa2utXMy3Ikx99rEWoLSSnugAsE3lsqxWmufOkaoIoUYkRamJ1ErrbCfJpHuSKESYgcSmsL7sGWWU4bXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737624965; c=relaxed/simple;
	bh=BA21ZdFmf9AgvaHm9Y/mSCvgkAFKKd488Nm7JfR7y80=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=flixjYmLvi4hUBA8Vm5azA9LhkPwq4JK0cJANyqMnRniRtkIS5vopbkGVuNkaQGBaAW1ON3Fzfmzr332U/aujdJ/WMp59xBCs0bX8jY9+gyfoll9WZAKJfkhyDbE2nbA/1KSlOIWrsqQcL2qyz8fR6eJJdkBmhVrO2U2wS7Ecss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AI8M5Qr0; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YdwmY48K5z9sst;
	Thu, 23 Jan 2025 10:35:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737624957; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BA21ZdFmf9AgvaHm9Y/mSCvgkAFKKd488Nm7JfR7y80=;
	b=AI8M5Qr0n+UrVl84JV0jLmmaPU1I8UG2L59++38mtN9RvjsDVUZ4NeluXnppr33VC5TXR+
	7g2U/c7hkJlnNIqL07aoUVZ0EvdpYVlVEREJELozJ480nJ/5XveHQ6GVnWjSA4fYJIyxF+
	OTzFTPyJPPsGmaHEmsXHyaWc4eI0dichd+FmBf6OgECfoQmezRCivB9jGmijomm8Bc7ix3
	AiMmq2sTxSkXvietx2YWVpATLzbRjaogj+GVXMGm5XVN+C2FCBiKc5/1ibcrIeWtXVqAvi
	W/FaLMq8S1cc6wy+D9rFhUuWV4IALs+9FSHpGAPACwjrAYrQGlxh4MkWrmgyCQ==
Message-ID: <4ef6430c01f31659c327f688965800285b8172ac.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Danilo Krummrich <dakr@kernel.org>, phasta@kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Alex Deucher
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
 Paul <lyude@redhat.com>, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>, Melissa Wen
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
Date: Thu, 23 Jan 2025 10:35:43 +0100
In-Reply-To: <Z5IL9Ok7f16S9ZoD@pollux.localdomain>
References: <20250122140818.45172-3-phasta@kernel.org>
	 <20250122181227.491b7881@collabora.com>
	 <af5aac800f7d2153aa3c315584f70c55378c1b2b.camel@mailbox.org>
	 <Z5IL9Ok7f16S9ZoD@pollux.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 164d94837fa13444ce2
X-MBO-RS-META: f5i44jte5azn1qwoc836a5u9i8n7kbs1

On Thu, 2025-01-23 at 10:29 +0100, Danilo Krummrich wrote:
> On Thu, Jan 23, 2025 at 08:33:01AM +0100, Philipp Stanner wrote:
> > On Wed, 2025-01-22 at 18:16 +0100, Boris Brezillon wrote:
> > > On Wed, 22 Jan 2025 15:08:20 +0100
> > > Philipp Stanner <phasta@kernel.org> wrote:
> > >=20
> > > > =C2=A0int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > > - =C2=A0=C2=A0 const struct drm_sched_backend_ops *ops,
> > > > - =C2=A0=C2=A0 struct workqueue_struct *submit_wq,
> > > > - =C2=A0=C2=A0 u32 num_rqs, u32 credit_limit, unsigned int hang_lim=
it,
> > > > - =C2=A0=C2=A0 long timeout, struct workqueue_struct *timeout_wq,
> > > > - =C2=A0=C2=A0 atomic_t *score, const char *name, struct device *de=
v);
> > > > + const struct drm_sched_init_params *params);
> > >=20
> > >=20
> > > Another nit: indenting is messed up here.
> >=20
> > That was done on purpose.
>=20
> Let's not change this convention, it's used all over the kernel tree,
> including
> the GPU scheduler. People are used to read code that is formatted
> this way, plus
> the attempt of changing it will make code formatting inconsistent.

Both the tree and this file are already inconsistent in regards to
this.

Anyways, what is your proposed solution to ridiculous nonsense like
this?

https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/gpu/drm/scheduler=
/sched_main.c#L1296

