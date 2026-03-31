Return-Path: <linux-arm-msm+bounces-101036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOW1IvCpy2kpKAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:03:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF043368762
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39EE73006113
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4486539A05F;
	Tue, 31 Mar 2026 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLwA+w5O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D755135B63B
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954989; cv=none; b=Ptkii6Nze/25Xor+35FrTi5faBNorQBtH0cKNCfEKQzTJH13RuFZrnH+Xvp0PdeTKaSWCElHh+09S5Qu2DGD/FGKiN9dwVcGEkMLpm27MzloZ6FwN6qtBh+CShEA2lTJYMPFwgrMz2wIdDdHm02myswrSv+1xX32qH75xWeJBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954989; c=relaxed/simple;
	bh=CXKoAy7O5Rpwmv3YWsWhSdf1a0F4IU82daIfMAP2+1w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lZ2gak+dzhwqbGO8oiRh1/1hfAt7F2Hmbf2yT6RfFOz5TIQjyESzgBfKDiyoTmJLgxVV9eW4WiPVg76bsou0O/qh9rifbb39P1qYjyzXcuMw21KiUQeCT2OpvAi3oW627rLOxEHF5b+WdNCvZS0KvmJwSErgx76AmzzKSS6NsMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLwA+w5O; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774954988; x=1806490988;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=CXKoAy7O5Rpwmv3YWsWhSdf1a0F4IU82daIfMAP2+1w=;
  b=CLwA+w5Oc9XgYPrHxT4/bUR0TUfXALwIgEsPE73LrHf/77AVgXhiBCVq
   XNf+K2G1QGClLFEeVH9figLPKid9Ms2sK0dvo0Tfc/uJTeDSGwrRXfBK2
   cJ6BZBDMq1m3HgMoILeIpP9K+tLhPfcTB+x3cW3gcIi6D9hv5ptIO66xI
   CRKfxiuQNfeTntNpYIb37MGxLN4ViCkbTq06X94e3H2aUoIFc7Pf4rpd4
   dU6BZ57NfhBaOK3NdhzfML3QrQi2eJQeF88YaxiW2/cA81PJH+Q1Ha8PA
   mx/NCTtwNzv+vut6cmS+/0Eyx0Xer1bXniAi+gLTQr0mJCm/jk/Fw7lCk
   g==;
X-CSE-ConnectionGUID: 4d39jDJ/TlCQf8jBMiazhQ==
X-CSE-MsgGUID: JEMZP6KeQZiO7MUCpbY9tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="87040447"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="87040447"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 04:03:08 -0700
X-CSE-ConnectionGUID: z9/dny+NQpCVQjTWng+qnA==
X-CSE-MsgGUID: tkbCaRf9SKW72Bb5vOGUQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="219688900"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.244.28]) ([10.245.244.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 04:03:03 -0700
Message-ID: <30209daf9db82c0c96e64989b3ade704904c5bc9.camel@linux.intel.com>
Subject: Re: [PATCH 3/5] drm/exec: Make the drm_exec_until_all_locked()
 macro more readable
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
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Date: Tue, 31 Mar 2026 13:03:00 +0200
In-Reply-To: <dc8f24ed-be2a-470e-a092-f461503cde71@amd.com>
References: <20260331092023.81616-1-thomas.hellstrom@linux.intel.com>
	 <20260331092023.81616-4-thomas.hellstrom@linux.intel.com>
	 <dc8f24ed-be2a-470e-a092-f461503cde71@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,google.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-101036-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: CF043368762
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-03-31 at 11:39 +0200, Christian K=C3=B6nig wrote:
>=20
>=20
> On 3/31/26 11:20, Thomas Hellstr=C3=B6m wrote:
> > Use __UNIQUE_ID as done elsewhere in the kernel rather than a
> > hand-rolled __PASTE to craft a unique id.
> >=20
> > Also use __maybe_unused rather than (void) to signify that a
> > variable, althrough written to, may not actually be used.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0include/drm/drm_exec.h | 23 ++++++++++++++---------
> > =C2=A01 file changed, 14 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> > index 25db52dd2af0..fc95a979e253 100644
> > --- a/include/drm/drm_exec.h
> > +++ b/include/drm/drm_exec.h
> > @@ -89,6 +89,19 @@ drm_exec_obj(struct drm_exec *exec, unsigned
> > long index)
> > =C2=A0	for (unsigned long _index =3D (exec)->num_objects -
> > 1;				\
> > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 ((obj) =3D drm_exec_obj(exec, _index));=
 --_index)
> > =C2=A0
> > +/*
> > + * Helper to drm_exec_until_all_locked(). Don't use directly.
> > + *
> > + * Since labels can't be defined local to the loop's body we use a
> > jump pointer
> > + * to make sure that the retry is only used from within the loop's
> > body.
> > + */
> > +#define __drm_exec_until_all_locked(exec,
> > _label)			\
> > +_label:						=09
> > 		\
> > +	for (void * __maybe_unused __drm_exec_retry_ptr;
> > ({		\
> > +		__drm_exec_retry_ptr =3D
> > &&_label;			\
>=20
> I think when using __maybe_unused we could also move assigning the
> variable to the deceleration and drop the extra ({}).

Sure. Looks even better.

Thanks,
Thomas



>=20
> Apart from that looks good to me.
>=20
> Regards,
> Christian.
>=20
> > +		drm_exec_cleanup(exec);		=09
> > 		\
> > +	});)
> > +
> > =C2=A0/**
> > =C2=A0 * drm_exec_until_all_locked - loop until all GEM objects are
> > locked
> > =C2=A0 * @exec: drm_exec object
> > @@ -96,17 +109,9 @@ drm_exec_obj(struct drm_exec *exec, unsigned
> > long index)
> > =C2=A0 * Core functionality of the drm_exec object. Loops until all GEM
> > objects are
> > =C2=A0 * locked and no more contention exists. At the beginning of the
> > loop it is
> > =C2=A0 * guaranteed that no GEM object is locked.
> > - *
> > - * Since labels can't be defined local to the loops body we use a
> > jump pointer
> > - * to make sure that the retry is only used from within the loops
> > body.
> > =C2=A0 */
> > =C2=A0#define
> > drm_exec_until_all_locked(exec)					\
> > -__PASTE(__drm_exec_,
> > __LINE__):						\
> > -	for (void *__drm_exec_retry_ptr;
> > ({				\
> > -		__drm_exec_retry_ptr =3D &&__PASTE(__drm_exec_,
> > __LINE__);\
> > -
> > 		(void)__drm_exec_retry_ptr;				\
> > -
> > 		drm_exec_cleanup(exec);					\
> > -	});)
> > +	__drm_exec_until_all_locked(exec, __UNIQUE_ID(drm_exec))
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * drm_exec_retry_on_contention - restart the loop to grap all
> > locks

