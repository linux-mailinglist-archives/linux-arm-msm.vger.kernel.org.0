Return-Path: <linux-arm-msm+bounces-111181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ytIqHiFeIWq0FAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 13:14:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D27B063F550
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 13:14:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CEe2sWZW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111181-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111181-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8090130F11FF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 11:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A4440913A;
	Thu,  4 Jun 2026 11:07:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479A4406275;
	Thu,  4 Jun 2026 11:07:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571261; cv=none; b=lWEidlkHtJlaO4KYNZ5OvLJ61qnmt3BpfAtrthIadeSpIE/DXeJcfq1JyP1q0NWwWi2ruOfwypcIv9CN9yV2GIKkX56ww2GE6kzIlRWe9HRc4ICkIRzTKQFhfx+BeDVUMMrWTy4gV3rARXxCK4WLGF7eIrl1qp21fJPPZoubsMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571261; c=relaxed/simple;
	bh=Z/jhLIh+up/yJ/cHVdOEM82mvkXPs5Ep8q9pLRq5Kms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqckyyZJw121i2oD74Nf0uZed3m/GLu5zgp3ZT8ivx7j95wjGTQaL1dPXIEAgSlHbkvY7q+ut+Lnp6UlVeMyF/TFvQIECipCAoQdmjk3ukcW6RzPRBvHgmx1u8YmtTipywrCUu6jkp9hRMU5Ch60ZnuvfA7uXd+TWQ+WoBwxpbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEe2sWZW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC131F00893;
	Thu,  4 Jun 2026 11:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780571260;
	bh=bbem+Ou0gK1OWtoYE6OUhzw9yw8p5mmQHZjgO3Wq97E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CEe2sWZWTaMaHf6PlrVNHAdLE/QeoC3aQszxZsXMGHZ1xsKM1oLg1gqbvvFqJXUEn
	 FLOEIzlPWcgMSVT3yxG5AnU9tJEUA3YaXnZp7FCO1cDC5jx4W2guaBpbszC8vEbViK
	 BtZo7o2qZcYAvHrP5YssYF1Jccc5xwWpABDAsWKihYDadpDs1iR7ZeKQ0PXrMYQk8/
	 2nFkU6vM6By+SPb0yDszg0wdCnFzY2wpROzBvGV05m2MR+JVqSdGUfsbM0IiMKcWyo
	 6nxsMJP5mN8RHu3aYcDg9r+gXmI7/p+DTDnXydIGzJIOYAI0HIdR/uifuWF2SdEdO2
	 77vYbdz9iTTYw==
Date: Thu, 4 Jun 2026 12:07:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, lee@kernel.org, lgirdwood@gmail.com,
	pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
	peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com,
	jack.yu@realtek.com, shumingf@realtek.com, srini@kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 03/10] mfd: cs42l43: Use new SoundWire enumeration helper
Message-ID: <a5db0868-c76b-4f58-aaae-2e7642967bde@sirena.org.uk>
References: <20260603144443.593230-1-ckeepax@opensource.cirrus.com>
 <20260603144443.593230-4-ckeepax@opensource.cirrus.com>
 <2b73cb79-ad88-4069-b77b-0f681d450030@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GwV7WMaBml6BgW/N"
Content-Disposition: inline
In-Reply-To: <2b73cb79-ad88-4069-b77b-0f681d450030@sirena.org.uk>
X-Cookie: Q:	Are we not men?
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111181-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ckeepax@opensource.cirrus.com,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.dev,linux.intel.com,realtek.com,vger.kernel.org,opensource.cirrus.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[15];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D27B063F550


--GwV7WMaBml6BgW/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2026 at 12:04:22PM +0100, Mark Brown wrote:
> On Wed, Jun 03, 2026 at 03:44:36PM +0100, Charles Keepax wrote:
> > Now the new wait for SoundWire enumeration helper no longer depends on
> > unattach_request it is safe to use from probe time. Update the driver
> > to use the new core helper.
>=20
> > +	if (cs42l43->sdw) {
> > +		ret =3D sdw_slave_wait_for_init(cs42l43->sdw,
> > +					      CS42L43_SDW_ATTACH_TIMEOUT_MS);
> > +		if (ret)
> > +			return ret;

> This is in the bus independent code and the SOUNDWIRE dependency is only
> on MFD_CS42L43_SDW so this will be a build break for !SOUNDWIRE builds.

Sorry, there is actually a stub for this.

--GwV7WMaBml6BgW/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmohXHUACgkQJNaLcl1U
h9BJEwf+OKtKFI+RRWZkpbeRdfcZXB1EeQeUCX5jLc9ShvYHMA+2R/Hrkrd5Wn/t
pnYrVwI2HptQrk83m+pGRd4nV4r9wJElB5pvcyT39WjgCFJD0oHiigUaigyp/lTf
z1fKsOnBaQ4kRn1Wej67/Dp5Zv99kZuR+McpSUnj4maB0L56/B2xSygl9AkckXWM
pup6qD2QqKsCnYiY9WEEpX1tuvPAkpvUGqWKIheJpxdN7MUJuIlyBFMG50X5aPku
5TWYF9zUl8L14DotibY7ARQkX6eZf+9qMlsQysv+Vk+ocEWDM5xn65O/a04tvw/R
3NLMsf1wmR7m2YKnx8GLvP5nNx6g9w==
=orXA
-----END PGP SIGNATURE-----

--GwV7WMaBml6BgW/N--

