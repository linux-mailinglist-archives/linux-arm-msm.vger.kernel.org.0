Return-Path: <linux-arm-msm+bounces-109033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sB5VMSfyDmqmDQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:53:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BD15A447E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 550F1303AF19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA043C5544;
	Thu, 21 May 2026 11:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iS1QQwPB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54D3346E74
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363957; cv=none; b=tAxaJzygHGsMk6oeh8xmgNyttbq0Fp+8W/jk8+iZT6po/u5RB1OlO91HIuI6RjPvjknfZMEoPMvz70vvMa9q9Sw8vpWgVLayyJ2smefPoRfP35x53VBLY2FFZCKE+XqkKRwembAzvz2Js2p+RL993CtarpH2EaHGAFLPuM2Gly8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363957; c=relaxed/simple;
	bh=NQFPplxomD0x/n8n9y9LQN4H3w76sftdXd7q8RgP6wo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EhXqpxxaiIM06FEfxKv3B20/LGakyrSIaShPdp3oMrKhcFj2S/iHfC+6KzLUXVH0RnchPSUVYNscjtsoh8NqzihiISL4DzZpHs9PYj/ttR5dzwC80TsXW4OwjyOUrEaUxrLDWfNc1t+ghVvpMjxKwDWrWIqffadf90v2gHu2Qiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iS1QQwPB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779363956; x=1810899956;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=NQFPplxomD0x/n8n9y9LQN4H3w76sftdXd7q8RgP6wo=;
  b=iS1QQwPBEuLq1ZWk+Mba3CQmxRAIhpyykGt2G6Juyl69Z/AlElLsc8VX
   aXCwniQadbgYvramlvRPTFzXDvWvlZ8xRjDgBmn/o7lMFRqXn9C1uNczE
   iFyucKm4toBsHb5Af4mw+lUPSrwBTgmVgG0L5RoMqDiYW4nnEoBgQpJF5
   OUuHMCK7uLP5hEqe3p4XJPC150fonwoc3aau18gLcp6bgQEBZYPaCinsL
   aVZw72d9aS/oL8A5A/IzSDmJb25OVNJVjZOc3UvK3TyX252Yh+AatUWFp
   nw4LybXQVUU+SZ0GZ2LosJ8puC82gtYZVR1OjKobhtv+JuuNGkz+3x48+
   w==;
X-CSE-ConnectionGUID: jR6HIhvTTVexVd6jW6qi9Q==
X-CSE-MsgGUID: Wh5uOMv7R2WgTudFLHPgbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91670937"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="91670937"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:45:55 -0700
X-CSE-ConnectionGUID: efRim4avTweoDSsfFU1U7g==
X-CSE-MsgGUID: S9fI+i6jSiWPJtQNsUY7BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="240533509"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.105]) ([10.245.244.105])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:45:49 -0700
Message-ID: <9266d1f9615d942c2472f5b9846247a71ab62dc7.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/4] drm/exec: drm_exec polishing
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	intel-xe@lists.freedesktop.org
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher	
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter	 <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Danilo Krummrich
 <dakr@kernel.org>,  Matthew Brost <matthew.brost@intel.com>, Alice Ryhl
 <aliceryhl@google.com>, Rob Clark	 <robin.clark@oss.qualcomm.com>, Dmitry
 Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul	 <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Natalie
 Vock	 <natalie.vock@gmx.de>
Date: Thu, 21 May 2026 13:45:35 +0200
In-Reply-To: <da49f6c2-5b6e-4bd6-8940-84206b5913f8@amd.com>
References: <20260520101616.41284-1-thomas.hellstrom@linux.intel.com>
	 <da49f6c2-5b6e-4bd6-8940-84206b5913f8@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,google.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org,gmx.de];
	TAGGED_FROM(0.00)[bounces-109033-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gitlab.freedesktop.org:url,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: 02BD15A447E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, 2026-05-20 at 13:34 +0200, Christian K=C3=B6nig wrote:
> On 5/20/26 12:16, Thomas Hellstr=C3=B6m wrote:
> > During the work towards enabling exhaustive eviction using full
> > ww locking in TTM, Christian indicated that the path for the
> > drm_exec moving forward was to be a full drm_exec helper with
> > things like userptr validation rather than a WW transaction
> > abstraction. The idea was then briefly discussed to craft a
> > WW transaction helper and then subclass that with drm_exec
> > with the idea that the WW transaction helper could be used in
> > TTM for eviction and for other uses that didn't mandate a full
> > exec sequence.
>=20
> BTW Natalie is now trying to polish my TTM patches for doing that
> because some test case for the SteamDeck is running
>  into issues with pinning buffers for display.

Thanks for the review, Christian.

FWIW I did a POC implementation moving drm_exec as a transaction helper
to the dma-buf layer, and then re-implemented drm_exec on top as a
wrapper here:

https://gitlab.freedesktop.org/thomash/xe-vibe/-/commits/ww_transaction?ref=
_type=3Dheads

Since this would work on any object with a refererence count and a
dma_resv, and even mixing them, it would solve a couple of issues:

1) Decouple the ttm object refcount issue from the TTM exhaustive
eviction (Not saying we shouldn't get rid of the ttm object refcount
anyway).

2) Implement any eviction locking modes (like snapshotting, object
release after slow-lock and similar) separate from drm_exec, and keep
exec as a pure exec-buf helper.

3) Facilitate ww locking in dma_buf_map().

4) Directly lock VMs instead of vm objects.

I haven't posted the patches yet since I wanted to get some feedback
first of whether this is a reasonable direction.

Thanks,
Thomas

>=20
> > Regardless whether that actually happens or not, this series
> > aims to clean up abuses of drm_exec internals in drivers
> > so that future development of drm_exec isn't blocked by
> > such driver usage.
>=20
> Yeah completely agree, going to review those patches now.
>=20
> Regards,
> Christian.
>=20
> >=20
> > Except for patch 2 which is a small cleanup only.
> >=20
> > v2:
> > - An drm/msm patch was already merged.
> > - Use a unique id for the loop variable (patch 1) (Christian)
> > - Move assignment to declaration (patch 2) (Christian)
> > - Declare the retry pointer as void *const. (patch 2)
> > - Only allow if the drm_exec context is newly initialized. (patch
> > 3)
> > =C2=A0 (Christian)
> > - Fix amdgpu compile error (patch 4) (Intel CI)
> > - Update the commit message (patch 4)
> >=20
> > Thomas Hellstr=C3=B6m (4):
> > =C2=A0 drm/exec: Remove the index parameter from
> > =C2=A0=C2=A0=C2=A0 drm_exec_for_each_locked_obj[_reverse]
> > =C2=A0 drm/exec: Make the drm_exec_until_all_locked() macro more
> > readable
> > =C2=A0 drm/exec, drm/xe: Avoid abusing the drm_exec retry pointer
> > =C2=A0 drm/exec, drm/xe, drm/amdgpu: Add an accessor for struct
> > =C2=A0=C2=A0=C2=A0 drm_exec::ticket
> >=20
> > =C2=A0.../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c=C2=A0 |=C2=A0 4 +-
> > =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 15 ++--
> > =C2=A0.../drm/amd/amdgpu/amdgpu_eviction_fence.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 +-
> > =C2=A0drivers/gpu/drm/drm_exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 9 +--
> > =C2=A0drivers/gpu/drm/drm_gpuvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 3 +-
> > =C2=A0drivers/gpu/drm/xe/xe_validation.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> > =C2=A0drivers/gpu/drm/xe/xe_validation.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 3 +-
> > =C2=A0include/drm/drm_exec.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 71 ++++++++++++++-
> > ----
> > =C2=A09 files changed, 70 insertions(+), 44 deletions(-)
> >=20

