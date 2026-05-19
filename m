Return-Path: <linux-arm-msm+bounces-108486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCRQJFVMDGrjdQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:41:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F245757DD62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5168B30AB81D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1CC3A383A;
	Tue, 19 May 2026 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZpRctH9z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AF5370AF9;
	Tue, 19 May 2026 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190643; cv=none; b=uz46V5dlc9shzD+ts4P8J2C6jz5j7ehoB93TOHEC7mRz6wNU0fxF+ItP88wuI9bmdVqEVHlZmFcCS+NM//ViJbRhG7zae0Y41Qf7eTgfnX0vodneZwGkYYBJxfzvD6EjOMamxu3Z4XNRmggpfTd9gggbIc7sG8UE5YitmDB8x24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190643; c=relaxed/simple;
	bh=OJBSjd637ql62zBgLjB/YJLsQQEAm3qjj8G1mI1PLXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpUaMz+H08POQuU1UAjdAVJGaglYAR7keIoEpxEOASUQc1Pt+35aRqFYWKF1HVqwkADQVBSiwRc7w04BlcTba7r4K/13UXVfZeqmF8ib9f9fcIMdfVEkmv1jek7hD/3JxfAXyFktwVpFMrwnVcdKyxAYMKB954NnhG6K1kCl9ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZpRctH9z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032E5C2BCB8;
	Tue, 19 May 2026 11:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779190643;
	bh=OJBSjd637ql62zBgLjB/YJLsQQEAm3qjj8G1mI1PLXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZpRctH9zxDPSCKxi+g15b9wfB7AYYizVKqhmd2fIRUnUSmDPKv2OTjUIoMmzjda2j
	 ILRZIjN7kpSFrcmKD5dB5Mx6q689w5ytMvcJkidhF4aqZ1/HZcyoYn0KauhSzmYtgc
	 Sxx4rS0DmnGaA29BqRYkKwOg/t8SH4fWgjevAT7tM+36H7gcj+8/HAe9P26mqsYJAU
	 y16eFaO8CGbfrLIJ2zDYRWnCQFDYGQ2r4ueJc5PGYX77bTijbYFgEvJ0G2whpTFUXr
	 ntZ28FzbhgQRcB4RvTNsBcgMlxh3Zu8ZiwFgD9A0kDVQqKvfPD8IbwltJTZ5w/JQ1u
	 dGFPS8p2nRoiA==
Date: Tue, 19 May 2026 12:37:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
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
Message-ID: <a1920a93-ac61-4246-a57c-b10bada3d70c@sirena.org.uk>
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
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DC4QcwTjvNAADHMt"
Content-Disposition: inline
In-Reply-To: <20260518165225.145175b1@fedora>
X-Cookie: Huh?
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108486-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F245757DD62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--DC4QcwTjvNAADHMt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 04:52:25PM +0200, Boris Brezillon wrote:
> +Mark for the silent conflict resolution needed to reconcile
> drm-misc-fixes and drm-next/drm-misc-next.

This doesn't appear to be a drm-misc thing, I was seeing issues on the
DRM tree.  The patch does seem to ahve resolved things though.  Please
consider topic branches!

--DC4QcwTjvNAADHMt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMS2sACgkQJNaLcl1U
h9BZaAf/fOh8rbQA70JLxdT/rc15Ihlk/YbtBsQ4087/9mw6gogTRhqFYtgy67ln
n/8aYFIUjhmkO0ca8rMeW65Ydj3YNT4MAWbdOYPzvzoPc02Q5X1jXLy/slMeKax4
YhPAtL5gd4923nCR1BDg6wTcMaiGaeJUQXzR+8aK0TSw+L+Y7DZjVROHL35UgYgd
mvu2kgEsLldWXfpikUvUZy8VTlz4zhtNd0J/VPALth3pa7YgH5lJVOgRDgCFpzc+
mBVbl52XgzPyiWkA0/KY+thiyjk/T0nYRR5CYPPiItbsghO3W3DB5Q76jo8f3XIB
NcGlupeD91GdKqezozeKjbhf9s0caw==
=zKZw
-----END PGP SIGNATURE-----

--DC4QcwTjvNAADHMt--

