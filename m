Return-Path: <linux-arm-msm+bounces-109015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNptGn7aDmrmCgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:12:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D9D5A3073
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10E3A309BFEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7C4380FC6;
	Thu, 21 May 2026 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okq0EC+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA0937FF43;
	Thu, 21 May 2026 10:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358210; cv=none; b=kHbbkwOEFEFHIzzBs00V01N5GDpr0MfdbY6fwWxyxq79jhqm3yFVFjqAxbzyGWdztTdW83t5djSABS3cxIGgpCh5Euse8PhAyr7TQw33+L6a2/1Iub9IczHKl7ET7njCXFxK40o5/j2j/EwsrDGopV6bMxJr3q79+na+tF6LfZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358210; c=relaxed/simple;
	bh=4zJMOmYPrPkZPfbycVIOw3mkRfSp8H1UbAhRW9NXmXs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKe/gOfeHPzJV1FvUWVlbwUlhRXcyEO8pPPTn9RCLL2emmoBbD+RyCmtckFluCnyMMP2tfwcKLwSMrUT0nZe7FJnik4igGyVg261uC70fMTHSZrAB7vVe75yVfVFIVt+wqHHDZ2xABa1odS50MvchfHXVOmtDrWBAZr/rA8wpz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okq0EC+E; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE341F000E9;
	Thu, 21 May 2026 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779358209;
	bh=ZeXhl0TRrGYSsEZfs+4x0l3uj5e6YbKaAiSvSza6FxY=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=okq0EC+EJjMhNoSfVdE1iCsiL6EFtXZpjy2usMT+6gxjcqsdNkiMyigjtrCGorbs5
	 ipsXm38tXHr1j8rX3IbV/X1XTdwtVKcatCSrB5jD2HQXeDWoaS4pDf6pD9rH7ZRzlU
	 MkgJPe7+X3jGLkY54PquqVM27yTfKV+Qk3SH872bvWNVB+Kl5olkpliF0tjS/EbNkE
	 bVyvSdU68++0tcVcbuVXp/Sl06MOgC8IOOgm6qyJ2LvkHq742M+TpS3L1UM3XJcCE0
	 YV5lDZqvF39BBl0eR4lNVK+1pDOOsAs1bbj/FCW5UQyoTqjvsHMqqkP12I2s1k4K4s
	 HUz9ABIdtst1w==
Date: Thu, 21 May 2026 11:10:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH v4] drm/gem: Make the GEM LRU lock part of drm_device
Message-ID: <d7764149-e710-4133-894c-67471e0b5b3c@sirena.org.uk>
Mail-Followup-To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
References: <20260518-panthor-shrinker-fixes-v4-1-1920234470d5@collabora.com>
 <20260518165225.145175b1@fedora>
 <a1920a93-ac61-4246-a57c-b10bada3d70c@sirena.org.uk>
 <20260519135153.42c3f4a0@fedora>
 <ag7LVI2mia92Oa8L@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="297fsb/DOnRjNva8"
Content-Disposition: inline
In-Reply-To: <ag7LVI2mia92Oa8L@phenom.ffwll.local>
X-Cookie: No shirt, no shoes, no service.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109015-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C9D9D5A3073
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--297fsb/DOnRjNva8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 11:07:32AM +0200, Simona Vetter wrote:

> The assumption is that committers will ask maintainers for help if they're
> trying to push a patch that results in tons of conflicts when applying
> (since development should happen on top of linux-next or drm-tip). Could
> probably improve that a bit. But also, often it's only clear after
> applying that a fixup is needed, and then it's pushed already. And with
> committers there's no undoing pushed patches. So it's just part of the
> deal with having lots of committers imo that history is a bit more a mess
> at times.

What I see frequently in -next is people just cherry picking the fixes
into the development branch instead of doing a merge, this leads to
pointless conflicts as soon as someone adds new code on top of the fix.
I gather the stable people also aren't terribly enthusiastic about this
workflow.  There also seem to be repeated situations where people mail
me saying they're going to introduce a bunch of conflicts that are
sufficiently non-obvious they're sending me fixups in whatever random
form, even where people seem to think it's a big problem themselves
there seems to be a helplessness about actually doing the merge.

--297fsb/DOnRjNva8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoO2fkACgkQJNaLcl1U
h9Cu5Qf/WnjWw7DjKwglXy52V//1/IpDdLuFDCPJ0FnN7pa0uy+3CM1jmKYjNGh2
2/zrv+0yw4wjddi48ikA5Hbx6jDe/Z2aqyuSovglKmPYToyp4BQgaiFxjM9mFLAM
60VZHPzOGUdB+ANu1nc3J59tCJkaJA1YYrRdIKbjgZdvZ1axUxRFUWeB9AD6/75e
ulR+T245pWRI+WTipd0Ce8lJxb75/nG2+Pl8HreR1zWORI6wXuQrRPs6YqU3irO8
03M1bxVCOU4AnY8OHoyhOa34FQ86Ak9Cp6Jk9cu/y13bzbkJ4mUkx+RVHQdADyDp
lvHBOrK9io2gFUL6feDQ1+23MzOXDA==
=/K87
-----END PGP SIGNATURE-----

--297fsb/DOnRjNva8--

