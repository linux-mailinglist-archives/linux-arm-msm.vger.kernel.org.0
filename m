Return-Path: <linux-arm-msm+bounces-45928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3A6A1A145
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C9313AB3A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 09:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A8420D50E;
	Thu, 23 Jan 2025 09:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YI/JEIN7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3794120D4EF;
	Thu, 23 Jan 2025 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737626151; cv=none; b=eQa27xH4Hl9W5lktMjm8wQtPLaydSNBJxcSIR0PGPsSmcEHd1Du3JwpcHtrsM3qrEwIAqtROKEfYS0QCyRXbhVzt+90ef6JaucRO7MeTDLiVOAQGgU7U85ZwgLkhIT+EyN2uQpkYBKe3gFrApg7izE5MKMuOvOnG5b5VfQwfIwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737626151; c=relaxed/simple;
	bh=fCBgjAiXPvIMnAE+G9eNYZEqtr8lYIiMx3+glMitzKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z49X31m/wW8LRIjx1wp+esqqGzTkaLhhOu5OdjRlVfb0JjCthGR8s4FgTI/mDzqpLtPRKU7dlSg7i6Z4H/4lVwVc4bnFJgv1CEVEyQ37YYOBOkvLtVA+i1lWjiA9WIyioFJZ3v4hqBvGwPEW9yATAxL1K1BnZMoxrxHt94fTMRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YI/JEIN7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECE8C4CED3;
	Thu, 23 Jan 2025 09:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737626150;
	bh=fCBgjAiXPvIMnAE+G9eNYZEqtr8lYIiMx3+glMitzKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YI/JEIN7KcYJlyCV+0OVbVMp7Raodqhl8Pl73KqpfBuOgs0je9AkcNUohLPyD+SD7
	 l4FC6uuke19gJ9IaoRu2Ml55X860zsst+H4TlYZEfpwI0xOqS5EOR6cExXfTphY/IM
	 H155FrSH/XxFMb6uZDdgoW6vkUy8Zucj6Phfq8dqMunLKEUuw9On7NrKGsPl3sr8UL
	 fN/tUi5h+gEmeadA20vV52ugpfs3TH4IV5a6eW7J3IEiBbV3Whj5V4nf2u1xhMXjB/
	 duHJdRW4GFEr3rSnuyBFS/sl4T772q3mOk/ku+vjdCPuAYeDSzIaJCUm6EAkHhvhuK
	 Gbv5wRiW/BXPw==
Date: Thu, 23 Jan 2025 10:55:38 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: phasta@kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Luben Tuikov <ltuikov89@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
	lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
Message-ID: <Z5ISGlkBeSHaAqVm@pollux.localdomain>
References: <20250122140818.45172-3-phasta@kernel.org>
 <20250122181227.491b7881@collabora.com>
 <af5aac800f7d2153aa3c315584f70c55378c1b2b.camel@mailbox.org>
 <Z5IL9Ok7f16S9ZoD@pollux.localdomain>
 <4ef6430c01f31659c327f688965800285b8172ac.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ef6430c01f31659c327f688965800285b8172ac.camel@mailbox.org>

On Thu, Jan 23, 2025 at 10:35:43AM +0100, Philipp Stanner wrote:
> On Thu, 2025-01-23 at 10:29 +0100, Danilo Krummrich wrote:
> > On Thu, Jan 23, 2025 at 08:33:01AM +0100, Philipp Stanner wrote:
> > > On Wed, 2025-01-22 at 18:16 +0100, Boris Brezillon wrote:
> > > > On Wed, 22 Jan 2025 15:08:20 +0100
> > > > Philipp Stanner <phasta@kernel.org> wrote:
> > > > 
> > > > >  int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > > > -    const struct drm_sched_backend_ops *ops,
> > > > > -    struct workqueue_struct *submit_wq,
> > > > > -    u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
> > > > > -    long timeout, struct workqueue_struct *timeout_wq,
> > > > > -    atomic_t *score, const char *name, struct device *dev);
> > > > > + const struct drm_sched_init_params *params);
> > > > 
> > > > 
> > > > Another nit: indenting is messed up here.
> > > 
> > > That was done on purpose.
> > 
> > Let's not change this convention, it's used all over the kernel tree,
> > including
> > the GPU scheduler. People are used to read code that is formatted
> > this way, plus
> > the attempt of changing it will make code formatting inconsistent.
> 
> Both the tree and this file are already inconsistent in regards to
> this.

That's not really a good argument to make it more inconsistent, is it?

> 
> Anyways, what is your proposed solution to ridiculous nonsense like
> this?
> 
> https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/gpu/drm/scheduler/sched_main.c#L1296

I don't think this one needs a solution.

The kernel picked a convention long ago, which also has downsides. If it gets
too bad, we can deviate from conventions at any point of time; for the thing
that otherwise would be bad, but we shouldn't do it in general.

