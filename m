Return-Path: <linux-arm-msm+bounces-101532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIg6KkhSzmmjmgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:26:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 089AC38848B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 847E73025714
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 11:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA93D3D810A;
	Thu,  2 Apr 2026 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dB3xkxlT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34253845CA;
	Thu,  2 Apr 2026 11:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775128934; cv=none; b=rVbtnvhd8lAF4ePsoPnnfKhReznI0U4OmQKMPWOCNaNtGJsjF5i1qMtNOAGeVUEGodf+mddxAJHy7lf6DmNyJxS3PyrdmnYuzGGWIlouT00xf2swz4YQQenPgiRa6ALaVwsV5FnuoJGI4ZpJDdf3Ssx4173dRK4p12hz9dB9ti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775128934; c=relaxed/simple;
	bh=vOejG/o2vgTiL96r4KfF9lxCPFRYRio/B74Q+h9vJzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFmfr1lnfEuZd2cv1GQKIXXydXiVtPt6jgomIX8rPRvVHeWEdSuOFROXN6HW+g+OogyN3qx4sRM/BgsKnLo6LNjpXaS51168c5J0X7HTkBYjtuHe8v+QXy3YfhkZWUNu0cABwvxWV+iFYpS/kdVwA1A0d2S6w8jMMPAWDqoIVGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dB3xkxlT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEC3C116C6;
	Thu,  2 Apr 2026 11:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775128933;
	bh=vOejG/o2vgTiL96r4KfF9lxCPFRYRio/B74Q+h9vJzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dB3xkxlTYeSej9QDvRTtV98uCh7LC1p+TH8yFKHa5eyTyegAb81YraxS6B0qkjvQ3
	 j8yJpHXj1t5CUy8Ix49hMVEr5kVjV3gq8mcauAbUnSVGe4whJCmVJ/qIOjfPBo8hAI
	 e8UV0n5eLuuPRo/Hdupb60M6egpzaR6RSvw2yfN8Ilm9AZGEtm3m2ClGA37anYHsWe
	 gke6ZmZ63kP3xwfeloBOBP8FjYAqGVqI75FzbIbdzDA///ymtqXaMzO5zRDM35pVQf
	 JK69Dp3qgq4MMk+EFcWcPhgwHxJ+oNMk3jwKpX/QARKWdZfb9cdEC7vXWR69FVnMmd
	 5ktSKdPGcYatQ==
Date: Thu, 2 Apr 2026 12:22:02 +0100
From: Mark Brown <broonie@kernel.org>
To: "karthik.s" <karthik.s@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ASoC: codecs: wcd937x: Add conditional regulator
 control for wcd937x
Message-ID: <ec716d06-3c7b-496e-9605-761346d78ad9@sirena.org.uk>
References: <20260402070854.2804291-1-karthik.s@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5HPYIqv3H3hDBw+U"
Content-Disposition: inline
In-Reply-To: <20260402070854.2804291-1-karthik.s@oss.qualcomm.com>
X-Cookie: <doogie> dpkg has bugs?  no way!
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101532-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 089AC38848B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--5HPYIqv3H3hDBw+U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2026 at 12:38:54PM +0530, karthik.s wrote:
> Add has_always_on_supplies for managing regulators. Indicates that
> the codec supply regulators are always enabled by the system and
> must not be requested or enabled by the codec driver.

> +  qcom,always-on-supply:
> +    type: boolean
> +    description: Indicates that the codec supply regulators are always enabled
> +                 by the system and must not be requested or enabled by the codec
> +                 driver.
> +

Why would we want that?  The regulator core already has perfectly good
support for always on supplies.

--5HPYIqv3H3hDBw+U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOUVkACgkQJNaLcl1U
h9CgCQf/erCGtb0YkhIvIZ/85ly/3UxqDmicCet18Va8ENqtqI2xzUFvcEYcpb2m
Nr9ED3JUCQJSR0P71zf5rclE/t1b1bvHJ8X0KJP9x+2k/frLxIt6VbpKHsPIxsaF
Bmx4p9/RGfj/RRhv61M9nXInJF5kO1w5JdPLtpf2cqTdjpLJUHUolDgajPljnAEc
WqBi0bJ9aLQWeuSHmYtE2bdMv5bVVBcDRYKCMmJML4QuVTazIjKh5rXozw5Qo5ir
F3MkKDe1JRbA2+pfcWn4kEdAY9NmBg6tCrwYtB4EjYEx3i04G8OkfppNhwSk/ZsU
9hy00+z+bDzvV0hAF4xC2iDVSahonA==
=ulkT
-----END PGP SIGNATURE-----

--5HPYIqv3H3hDBw+U--

