Return-Path: <linux-arm-msm+bounces-101023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAjPLg6gy2loJgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:21:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F5D367D32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C6B6321EFBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1410A3A6B93;
	Tue, 31 Mar 2026 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhzILfvJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9607C3DE421
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952036; cv=none; b=EwUJguBCKGfbul7Q/+QT7kmgdWpWElhfyKKUW38v+Dqig3BbWe09qnXHoOQrtf4x+gMCKsnRvchLUKivMJX9M0g1QIG8y5vl9fEzYOGMZNLpKozTdqrB+Qo242fRpUJulFjcw6joFOIDTxI7Hgel3AESIYox4BL4ByIrLNX+VJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952036; c=relaxed/simple;
	bh=WB4ZU2W0fnkqVa71Ajs9awDToKlAuxHcyX8HDRc2mck=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DYWaJIInusiq7DX+nFJ6hu0U0UfRDt2J1/l+ulPaePA4nRdmCbQujj5muC+s0jdeMpCMr9vpjSxsImjFsyDYl8vImQ0VhQz5oygt0KwDmx95Na8J0L00m47CYi9DVjz+rpoG72pwdA5s34wOGhf7rBx9pAJ4RcCNYjX2pi1XaS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhzILfvJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774952034; x=1806488034;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=WB4ZU2W0fnkqVa71Ajs9awDToKlAuxHcyX8HDRc2mck=;
  b=PhzILfvJx9h75++I4VXma+yveSGJFEXOrE+rjaCJihfXxyfpcyOGd6dJ
   PjpC0xQFRuXgXHLZiacHcx+/B6NoHBsatYzOBqJ5UYy9/z7p+EkDmXJHo
   eJQR0Suhd6LiRlFilAfXWwy8/ySBXgJXPU6vdDX100WuoCGyyMA6ndnkM
   qN852bR04j8C+QxMd+QaGgBSyBypknGtotv2hIL5rPTKitQZKMMWxi9C7
   iz0xvvAH6zRS26ZcNWf5uwla5xAMfAk0Xq0IY4F0wP6OO7Fb7BJNLsvsv
   6TJDH6A6xiMPjYz3i1AfqxRtEAxxDAXzSoJdaiEKWMo3brr0+Ao7QbdPY
   A==;
X-CSE-ConnectionGUID: PVj7OdvdStW1GyC7E+hQcw==
X-CSE-MsgGUID: 3dIOEjeARCiZy9zg+a6vow==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79820304"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="79820304"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:13:54 -0700
X-CSE-ConnectionGUID: zJWcel2GTNiOsEk9VQ05Pg==
X-CSE-MsgGUID: C7tPcceQSgWfVjjxlJsFiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226298354"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.244.28]) ([10.245.244.28])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:13:50 -0700
Message-ID: <e4855d379990345e47e1175ff4b20a757888ff42.camel@linux.intel.com>
Subject: Re: [PATCH 4/5] drm/exec, drm/xe: Avoid abusing the drm_exec retry
 pointer
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
Date: Tue, 31 Mar 2026 12:13:47 +0200
In-Reply-To: <916ac7fc-d699-453f-af60-5cb3b15c1156@amd.com>
References: <20260331092023.81616-1-thomas.hellstrom@linux.intel.com>
	 <20260331092023.81616-5-thomas.hellstrom@linux.intel.com>
	 <916ac7fc-d699-453f-af60-5cb3b15c1156@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,google.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-101023-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 24F5D367D32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-03-31 at 11:44 +0200, Christian K=C3=B6nig wrote:
> On 3/31/26 11:20, Thomas Hellstr=C3=B6m wrote:
> > The xe driver was using the drm_exec retry pointer directly to
> > restart the locking loop after out-of-memory errors. This is
> > relying on documented behaviour.
> >=20
> > Instead add a drm_exec_retry() macro that can be used in this
> > situation, and that also asserts that the struct drm_exec is
> > in a state that is compatible with retrying:
> > Either newly initialized or in a contended state with all locks
> > dropped.
> >=20
> > Use that macro in xe.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_validation.h |=C2=A0 2 +-
> > =C2=A0include/drm/drm_exec.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 +++++++++++++
> > =C2=A02 files changed, 14 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_validation.h
> > b/drivers/gpu/drm/xe/xe_validation.h
> > index a30e732c4d51..4cd955ce6cd2 100644
> > --- a/drivers/gpu/drm/xe/xe_validation.h
> > +++ b/drivers/gpu/drm/xe/xe_validation.h
> > @@ -146,7 +146,7 @@ bool xe_validation_should_retry(struct
> > xe_validation_ctx *ctx, int *ret);
> > =C2=A0#define xe_validation_retry_on_oom(_ctx,
> > _ret)				\
> > =C2=A0	do
> > {								\
> > =C2=A0		if (xe_validation_should_retry(_ctx,
> > _ret))		\
> > -			goto
> > *__drm_exec_retry_ptr;			\
> > +			drm_exec_retry((_ctx)-
> > >exec);			\
>=20
> Oh, that goto is extremely questionable to begin with.
>=20
> > =C2=A0	} while (0)
> > =C2=A0
> > =C2=A0/**
> > diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> > index fc95a979e253..5ed5be1f8244 100644
> > --- a/include/drm/drm_exec.h
> > +++ b/include/drm/drm_exec.h
> > @@ -138,6 +138,19 @@ static inline bool
> > drm_exec_is_contended(struct drm_exec *exec)
> > =C2=A0	return !!exec->contended;
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * drm_exec_retry() - Unconditionally restart the loop to grab all
> > locks.
> > + * @exec: drm_exec object
> > + *
> > + * Unconditionally retry the loop to lock all objects. For
> > consistency,
> > + * the exec object needs to be newly initialized or contended.
> > + */
> > +#define drm_exec_retry(_exec)				\
> > +	do {						\
> > +		WARN_ON(!drm_exec_is_contended(_exec)); \
>=20
> This warning would trigger!
>=20
> See the code in xe_bo_notifier_prepare_pinned() for example:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_exec=
_retry_on_contention(&exec);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D =
PTR_ERR(backup);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_valid=
ation_retry_on_oom(&ctx, &ret);
>=20
> Without contention we would just skip the loop and never lock
> anything.
>=20
> What XE does here just doesn't work as far as I can see.

So if the xe_validation_retry_on_oom() is actually retrying it
internally call drm_exec_fini() and drm_exec_init() first, which means
that the warning doesn't trigger, due to the dummy value of contended.

So the warning does its job, and xe is safe.

Thanks,
Thomas



>=20
> Regards,
> Christian.
>=20
> > +		goto *__drm_exec_retry_ptr;		\
> > +	} while (0)
> > +
> > =C2=A0void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr)=
;
> > =C2=A0void drm_exec_fini(struct drm_exec *exec);
> > =C2=A0bool drm_exec_cleanup(struct drm_exec *exec);

