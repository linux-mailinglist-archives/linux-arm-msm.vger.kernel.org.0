Return-Path: <linux-arm-msm+bounces-111179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8q9zHmhdIWqSFAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 13:11:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3A063F513
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 13:11:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AoNPZ4A3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111179-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111179-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03FB03043445
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 11:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CD9402433;
	Thu,  4 Jun 2026 11:04:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3437E314B6A;
	Thu,  4 Jun 2026 11:04:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571063; cv=none; b=jWONLkF8ACJ9XMdyvPLBADzR5O6OUEWB8MtgMSvQbbrK4Bc3QdV7CyRUpjI9SnNNxAhEifKnJBIn//RlWPdxEjMsO8x9Qf0hWA8yBos/+BI813if0UkU5dOdRDFEacJDJ7xNovsPtvxrbOiEONnwSLRoOL+hHUx/AXmkeJTja5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571063; c=relaxed/simple;
	bh=FOBCcrzNOpeEW57kqOZVyDXMG35LvOwWWaPOjBKehZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gie4gBRSkISSUF4Iym+X1gfJnEbM0Qs/obqY+SIN2xOtJsDv2kBdn113SQcOKGnrIC/ptfVSGFgFGDqnRoVNwlzzZvIxX8CF8DhGRqV8zky6WrO6JAA8CoYvWoge5ToJ+U0jAU7YnyjgH0Oa/A3TNU7mNfP7O337zpTLe2sAF+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoNPZ4A3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19DB1F00893;
	Thu,  4 Jun 2026 11:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780571062;
	bh=bkmJ2vQLrGuA5hB/ExSBAU2T6hOLh31C5HzjpnfkAWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AoNPZ4A3MX/PJLj5kHTbkTRc0+QGnImYvfC2VjINfmjR74Qee+8jxjwN1ZKXhb2+9
	 Hu8o+tPN3jwg2USL0u4si6GBFEoTy7GLFwBv1qKWieLXs6gX/aix2KSisMIL+N1ryZ
	 fD+quuZz7/7lweObpjv2/k4stJQyqR5rvkgdXGd49IlS6wsoLBW0JAHfm/3rcHClcO
	 XHOBjaU6T4WmD6B9ph1c7PCjd0LHaUfPEsSq6a9EQfPcU+RDWv7VwLWbGlEB+H7wHf
	 Bcqz59nMyUJLxCbgTsLvglrhehxfwrEj9HVxG8AfrZn0sVyqF1v5yNTHsaPQFKEWKQ
	 J1MGhYuDr3lrQ==
Date: Thu, 4 Jun 2026 12:04:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, lee@kernel.org, lgirdwood@gmail.com,
	pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
	peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com,
	jack.yu@realtek.com, shumingf@realtek.com, srini@kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 03/10] mfd: cs42l43: Use new SoundWire enumeration helper
Message-ID: <2b73cb79-ad88-4069-b77b-0f681d450030@sirena.org.uk>
References: <20260603144443.593230-1-ckeepax@opensource.cirrus.com>
 <20260603144443.593230-4-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sAyN7RjcxwlzqBBY"
Content-Disposition: inline
In-Reply-To: <20260603144443.593230-4-ckeepax@opensource.cirrus.com>
X-Cookie: Q:	Are we not men?
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111179-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB3A063F513


--sAyN7RjcxwlzqBBY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 03, 2026 at 03:44:36PM +0100, Charles Keepax wrote:
> Now the new wait for SoundWire enumeration helper no longer depends on
> unattach_request it is safe to use from probe time. Update the driver
> to use the new core helper.

> --- a/drivers/mfd/cs42l43.c
> +++ b/drivers/mfd/cs42l43.c
> @@ -586,15 +586,13 @@ static int cs42l43_soft_reset(struct cs42l43 *cs42l43)

> -	if (!cs42l43->attached) {
> -		unsigned long timeout = msecs_to_jiffies(CS42L43_SDW_ATTACH_TIMEOUT_MS);
> -		unsigned long time;

Are there any other users of attached left?

> +	if (cs42l43->sdw) {
> +		ret = sdw_slave_wait_for_init(cs42l43->sdw,
> +					      CS42L43_SDW_ATTACH_TIMEOUT_MS);
> +		if (ret)
> +			return ret;

This is in the bus independent code and the SOUNDWIRE dependency is only
on MFD_CS42L43_SDW so this will be a build break for !SOUNDWIRE builds.

--sAyN7RjcxwlzqBBY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmohW68ACgkQJNaLcl1U
h9C6UQf+ITc9xWv2WtxoaGzitO3Rkf3YEwZ3UONG+J3fr8v4lxC0S9nIs/WW1RIQ
/0vxyekc65xQ1kTqLW7EijmHpZHZ2mmHHbosZieTP3EQaqi8CTZxcAwNWXYMUDYJ
ZL+wgmHwmZtncRjEaXo3TSfAygMu3ACq9pm2IZJ2f0P2zNMj3BEQaYNvxOW9ZfAe
M516SrhwZLH8VT8E0Ry1sSHQMTdbhKdTdASv2He9qBTQzM9neb5bBy5to6xSp5AV
5GkLkKaG2H2UVkQdy4Jcm11kEsRnVt/uwqTnNgg/myfxpj8kctRGW6NUng7EK8G0
FmGBQd1LWYsOOfMayxq5OJCF4zsSHQ==
=lham
-----END PGP SIGNATURE-----

--sAyN7RjcxwlzqBBY--

