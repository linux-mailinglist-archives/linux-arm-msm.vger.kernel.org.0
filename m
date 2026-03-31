Return-Path: <linux-arm-msm+bounces-101157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMisIykmzGnHPgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:53:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D841A370E19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E42983061CE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C34E3A63E3;
	Tue, 31 Mar 2026 19:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfmVuYM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A549410D2C
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986773; cv=none; b=JLbxEHws+t3kzh9kqwjfOECaFvHZDNNiNcyV1cDs1iEWIHrsqSDmb4w8XZ4qgz6w7yrHiWee5ul1coaeICyC3iVQfEksCV7mZCGb3x7PmYup3baJ96zvVbv5Y5N+8sN07Qts6xZY6AiXC/Jb2JWFUGsWQmVT5KTKYP+j5UZiZ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986773; c=relaxed/simple;
	bh=nbUNWnhxtD9uSl+kq+z3SJo1UKV3e6wBk/X6kxEHQeI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lze4TE5DVKamCCAtKCU19DCywvl3VVHg2auYwLjxflDpAv7M+l8sPcZeXpw05yTkV9S6L89Osmqx6Gpnb1hZGd/GuS19m7G78XBtj0VnvoCqrx0OLWzVkhtL7mRcJIimP8JuFI5aiKzsz1Zr2KepnTioAahtOr+PJxqHWP5gvQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfmVuYM1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774986772; x=1806522772;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=nbUNWnhxtD9uSl+kq+z3SJo1UKV3e6wBk/X6kxEHQeI=;
  b=TfmVuYM18EvuNzBtDRmUJtJHNY9/JYifzFG/GL6g+kipVv9JDVfIuCgV
   Yh/RfSXkWlL0OBH6QqZXysMmHPtVVBjnQf/mXbZw4ro7cj69EQasVZFQh
   YWa5zRSulmiIJOuNaR8w6aI7E3dB3IwOXr+KLYhxvy6uOMB7V1nU737iq
   zAoI73vM++bMM4xhwDGrC6+DK8p/ks5KFGVzZKLJ3ejfOhcrwvxyF0h9j
   qBtZKv2ROkKOqkBSrBz05pYhGLKWkwmz1uAvNGTT+3gg26JWCR/TJaGCK
   6WME/7M3Uva2imbRv04HaCjiW8JohjTgU43vbczK40Tp/yte4DIJAKqkh
   Q==;
X-CSE-ConnectionGUID: Lk4Nd3GxQLW6dvNWIb9n4w==
X-CSE-MsgGUID: OCrzpagfTf+usp8r94iFoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86627326"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="86627326"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 12:52:51 -0700
X-CSE-ConnectionGUID: 4wP6lwCxTUSbpUETu8DyVg==
X-CSE-MsgGUID: /K6c4WzVTHGmpaA0jZ9tfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="225461106"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.244.28]) ([10.245.244.28])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 12:52:46 -0700
Message-ID: <bd45632be1a5bcd2ce34834b45a35254e23f7679.camel@linux.intel.com>
Subject: Re: [PATCH 2/5] drm/msm: Remove abuse of drm_exec internals
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: rob.clark@oss.qualcomm.com
Cc: intel-xe@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
  Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,  Alice Ryhl
 <aliceryhl@google.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar	
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean
 Paul	 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Date: Tue, 31 Mar 2026 21:52:43 +0200
In-Reply-To: <CACSVV03FFvi0c4XMEShmH5ou4OKKZcvvni2j=0DBoYnuT55ecQ@mail.gmail.com>
References: <20260331092023.81616-1-thomas.hellstrom@linux.intel.com>
	 <20260331092023.81616-3-thomas.hellstrom@linux.intel.com>
	 <CACSVV03FFvi0c4XMEShmH5ou4OKKZcvvni2j=0DBoYnuT55ecQ@mail.gmail.com>
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
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,google.com,linux.dev,poorly.run,somainline.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-101157-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,qualcomm.com:email,linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D841A370E19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-03-31 at 12:08 -0700, Rob Clark wrote:
> On Tue, Mar 31, 2026 at 2:21=E2=80=AFAM Thomas Hellstr=C3=B6m
> <thomas.hellstrom@linux.intel.com> wrote:
> >=20
> > The code was reading drm_exec internal state to determine whether
> > the drm_exec structure had been initialized or not, and therefore
> > needed cleaning up, relying on undocumented behaviour.
> >=20
> > Instead add a bool to struct msm_gem_submit to indicate whether
> > drm_exec cleaning up is needed.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>
>=20
> This is pretty stand-alone, so I can pick it up for v7.1.=C2=A0 Or ack fo=
r
> landing it via drm-misc with the rest of the series if that is easier
> for you.=C2=A0 It shouldn't conflict with anything in flight.

Thanks Rob. Please pick it up and I'll exclude it from the next
iteration of the series.

Thanks,
Thomas

>=20
> BR,
> -R
>=20
> > ---
> > =C2=A0drivers/gpu/drm/msm/msm_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1 +
> > =C2=A0drivers/gpu/drm/msm/msm_gem_submit.c | 4 +++-
> > =C2=A02 files changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h
> > b/drivers/gpu/drm/msm/msm_gem.h
> > index cb32093fda47..762e546d25ef 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -452,6 +452,7 @@ struct msm_gem_submit {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool bos_pinned : 1;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool fault_dumped:1;/* Limit=
 devcoredump dumping to one per
> > submit */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool in_rb : 1;=C2=A0=C2=A0=
=C2=A0=C2=A0 /* "sudo" mode, copy cmds into RB */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_exec : 1;=C2=A0 /* @exec=
 is initialized. */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct msm_ringbuffer *ring;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int nr_cmds;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int nr_bos;
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c
> > b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index 75d9f3574370..26ea8a28be47 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -278,6 +278,7 @@ static int submit_lock_objects_vmbind(struct
> > msm_gem_submit *submit)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D 0;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_exec_init(&submit->exec,=
 flags, submit->nr_bos);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 submit->has_exec =3D true;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_exec_until_all_locked (&=
submit->exec) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_gpuvm_prepare_vm(submit->vm, exec, 1);
> > @@ -304,6 +305,7 @@ static int submit_lock_objects(struct
> > msm_gem_submit *submit)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return submit_lock_objects_vmbind(submit);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_exec_init(&submit->exec,=
 flags, submit->nr_bos);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 submit->has_exec =3D true;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_exec_until_all_locked (&=
submit->exec) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_exec_lock_obj(&submit->exec,
> > @@ -523,7 +525,7 @@ static void submit_cleanup(struct
> > msm_gem_submit *submit, bool error)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (error)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 submit_unpin_objects(submit);
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (submit->exec.objects)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (submit->has_exec)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 drm_exec_fini(&submit->exec);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* if job wasn't enqueued to=
 scheduler, early retirement:
> > */
> > --
> > 2.53.0
> >=20

