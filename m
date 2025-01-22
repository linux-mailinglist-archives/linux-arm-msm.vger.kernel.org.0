Return-Path: <linux-arm-msm+bounces-45847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FFBA19751
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 18:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 420C43A218F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 17:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8422116FF;
	Wed, 22 Jan 2025 17:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oxgVDToL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B3A185B62;
	Wed, 22 Jan 2025 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737566192; cv=none; b=c9FXINxtMMugB4bkeKVLgeyOaDTr8YcCdQigi597BsluVoUKMmHDbDNV3w5cvUhQ3liBKmQJI5P+x5HkY6Oynkq9gaifNjLC8IgglZkZFIshkjKPBSIYcEMdQJyae7f3oCE7FARl1TCZvtCG6dIWXFHjay0M8oIorCUUXu10+08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737566192; c=relaxed/simple;
	bh=YNtjcguK0wCURTWlmQowDkiy3xCvFy7cbhtTMdPaj1M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KFeNfs6FTPWXX54orLguYVdKz+l4wNv1JOgS2m9iRBUgMjngzNxhNPetmf4bPyBNla7/4aJIN3D1JvAfXecgiQja76zhawqSB/eMb8NsB/tV+mRrzhLqs+sG/rKE9yIB8KtoHatm6PBlWnZsPXVPadnmq1ydWtdb5/9e29ULRTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oxgVDToL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737566188;
	bh=YNtjcguK0wCURTWlmQowDkiy3xCvFy7cbhtTMdPaj1M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oxgVDToL1IQinKzt4L5O0jZXaSfpPMDVd85aDvg8x8OPOphX87uVveYbRFfXWN5m5
	 SQbwHeS5HYMwUTII+W0ToiQStgr1C2c2oWPmWx0vr7sQO2kg4hS7yaS0hVMoJQD6mf
	 Zl+z4MGUkY2JFYTWrBPtMb0FWNTiXt0IksvRmSbzo+e6xu3Rcyn9+LvAKR0wADos2r
	 F6p0JupMQQT22cl5wejdv1pPeGFEIEHBdrqLHFRwHPS4Cel/A7QRdnvk/Mq48kSWO7
	 U6i9zp3vTn0vTYZMjQKmAOh3+P35OaL5fiXirdMZXMKvQoOTczkGCanjyKTrxVjDpO
	 Cyt4z0p8TLILg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2288E17E014F;
	Wed, 22 Jan 2025 18:16:27 +0100 (CET)
Date: Wed, 22 Jan 2025 18:16:19 +0100
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
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Philipp Stanner <pstanner@redhat.com>, Melissa
 Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2?=
 =?UTF-8?B?bQ==?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar
 <lijo.lazar@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, Ma Jun
 <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
Message-ID: <20250122181227.491b7881@collabora.com>
In-Reply-To: <20250122140818.45172-3-phasta@kernel.org>
References: <20250122140818.45172-3-phasta@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Jan 2025 15:08:20 +0100
Philipp Stanner <phasta@kernel.org> wrote:

>  int drm_sched_init(struct drm_gpu_scheduler *sched,
> -		   const struct drm_sched_backend_ops *ops,
> -		   struct workqueue_struct *submit_wq,
> -		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
> -		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev);
> +		const struct drm_sched_init_params *params);


Another nit: indenting is messed up here.

