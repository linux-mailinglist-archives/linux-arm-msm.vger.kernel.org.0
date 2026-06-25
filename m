Return-Path: <linux-arm-msm+bounces-114534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kqmoAOYsPWrpyQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:28:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4930D6C6206
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:28:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=k4kb0CgU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114534-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114534-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19885301225E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB233264E0;
	Thu, 25 Jun 2026 13:28:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A6B2FFDCC;
	Thu, 25 Jun 2026 13:28:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782394083; cv=none; b=b6KI5vBwmHXfAte5yHTj7icP+r/uIEA0UhUgkb2vSSqZVZPI5Pi/a4gsWRPe6sthApoJlA8TAo1N4FU4TOLcw3/EHER/8UEln7Fe9jsEMKNRJLjEL9F44vJLRSBoFlsrPj8kd/tz0ys2cJozvOjXBlL6DhtWdWIEX37pEYaGeQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782394083; c=relaxed/simple;
	bh=SaDlP2VHegb/IsanO1RUz+e6T35leC0u3LVNunAc73Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTMj53cunHGlIBZheDFKpyk5LfUr9BYaCexhNUidVFDROIfdDc3i4SatXH7lkLA/CvujHwowHhAeGZDq6ldpGNsyMAsYEiQqXK/ZyjdLs1FNMgtTzUN6ObYG9T0ccDEmAcn3pibrl2GyJzPFoadTi8SrGtC6xXPnjOHl6yF7QGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4kb0CgU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3647B1F000E9;
	Thu, 25 Jun 2026 13:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782394082;
	bh=t9vHASY7QO1T4f2l8fWOR2WD+PXZj12I5Tw/LMiqpvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k4kb0CgU55txgXCY4NWT4e24yxE3cAzqHt4DwKG5a4CyVcffXnw7lLei+JumGH81d
	 VmQG31Bir/DnM5zEUsXibUsVEr4RhtAxhTEgc4REFQWVqmCaZ7RWLEzURTx+x4G/qT
	 WjOIhjVuYPAvGXz5mWekswA0pL9VRlMV5oOYg7xJwtsAx7lL4ubiWC7FEoVokEKP8u
	 TGM4ygqp89vxUL7mkYEH4feP3d8QL2RP4koZze7SebGL40iX1CxBTLR24m0PIYC30n
	 ZCGLkR0ZD5GvcoxhLCxGJUwY6wrLu+gWv+S7VLkdWnlbHkB8qriy506blyRZiSdNzy
	 MjmnpNf7W6ePQ==
Date: Thu, 25 Jun 2026 14:27:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: bjorn.andersson@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH] spi: core: Abort active target transfer on controller
 suspend
Message-ID: <730c2055-b29f-419d-99f2-bc4df3b6a2f7@sirena.org.uk>
References: <20260625-abort_active_transfer_duirng_s2r-v1-1-7439e3585ad7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dbSswnoY/YRi6AhX"
Content-Disposition: inline
In-Reply-To: <20260625-abort_active_transfer_duirng_s2r-v1-1-7439e3585ad7@oss.qualcomm.com>
X-Cookie: If in doubt, mumble.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114534-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4930D6C6206


--dbSswnoY/YRi6AhX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 11:09:35AM +0530, Praveen Talari wrote:
> When an SPI controller operating in target mode has a transfer in
> progress at the time of system suspend, the suspend path proceeds
> without aborting the ongoing transfer. This can leave the hardware in
> an inconsistent state, potentially causing the system to hang or fail
> to resume cleanly.
>=20
> Fix this by invoking the controller's target_abort callback from
> spi_controller_suspend() when the controller is in target mode and the
> callback is registered. This ensures any active target transfer is
> cleanly terminated before the controller is suspended.

> =20
> +	if (spi_controller_is_target(ctlr) && ctlr->target_abort)
> +		ctlr->target_abort(ctlr);
> +

We need to check for an active message here, drivers are going to
assume there's an in progress operation to cancel - for example the
pxa2xx driver unconditionally sets cur_msg->status during abort which is
going to go badly without a cur_msg.

--dbSswnoY/YRi6AhX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo9LNwACgkQJNaLcl1U
h9B7dQf+NzC9VqVAwCCnWRBahL34W5QqTwVrgd4Ea6vhWwMOIpBt4cFUmzRTZOG/
hYdzTLUw33WExaibb5PSSLnMcDals0h0oSQ/4wIIlGFF9EadGHB9QYiwqDWO3icC
ownzqTY6svPyQbUHv6agpRvo7g6HA2pgZ84zj34NT+SRboKnq2FcFhKaOBhOGDA8
GXAYi24lrggSNCkrrNfxC1adAgiPY/PFY5o8ioXDdMxpBs5vVeAorn9J5wD+nq99
ex3fVmasqvUYbkbae07Ok3XDi/6WCMYalnkr1V1rJtjTI6SQEh2nmRuhJqhac4dK
LrM/fmkq2QgWsxlMYFzXD4XnhggAJQ==
=4SrT
-----END PGP SIGNATURE-----

--dbSswnoY/YRi6AhX--

