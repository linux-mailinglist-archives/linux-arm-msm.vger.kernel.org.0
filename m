Return-Path: <linux-arm-msm+bounces-114845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ehDTOCQQQmqDzgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:26:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEBB6D6541
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:26:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="JZ/OjDQL";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114845-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114845-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D169300679B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331CF3939D0;
	Mon, 29 Jun 2026 06:26:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941F43911BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:26:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782714402; cv=none; b=PZVHSQIRxBzQWHj99DF2nz1L+Jqt5JUGPmVwuEjq2/71zFo8qm6URb2xfAt3ZpaXzMdj+7xTu4RSquZBJWGrbQX5VHLGQNf1yD3zjpaXuBPEml+ixU1qlMdd6I3M+TA4xwbRe53V3AC/7yXe6Mcao2oB1Xf/dMf1asS0c/WyhMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782714402; c=relaxed/simple;
	bh=CMw8IrJ8TdmR6qZMYCm3a5dWEAdS58OSC6i7cS07jjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/HvKR/rYzi5W/nGGZ0G8wHbLNWA9C1mT64Ezy2/W+2A6+qshNOWox+TTqSvTE5SwbJaYqdavj24nqN6m1YJB+7+p6ahG7FymR2sPjs2wmtz3CUJS9BGSKBz3C5SbQJp1B5T3iqUoPJBnzQec10x5yNTW3thONTKonOOw5C+Qew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JZ/OjDQL; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0uAk
	ejhgCuaMoZrshp+jK8Z0ZGAtpRWMSbgtnJiT1+o=; b=JZ/OjDQLQTXGYDrenyOz
	4nOtaMLXCnhVkGYGM6BPN8hcdL9/edD1d+SrXyG8Tnd0LB4q/fEAuyYynkyq85ie
	LZ4HVIu04bnhOcWLS/UZybbPnQWAG580NH/YP2X00LHTovRcW5yyKMFW+hN3GUaz
	/hzNRjT7NlAeCQ+m3cfgmxknOAfMOuNtIoDO/Cg9VsRJuw/lVvm/njhH93aYjLX3
	JFjtFvhZxJsw16n8fpr3++kYXmzeD2Pi9bNQigNib0PhKWGmHmss6DrgJrk5PYPp
	Qr4lWgsHaagkapbbSp3DoT1nP5kJhwzykjorNsi1JGEEweTvpx8U4VJQ/yRKGCwE
	0w==
Received: (qmail 256473 invoked from network); 29 Jun 2026 08:26:30 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2026 08:26:30 +0200
X-UD-Smtp-Session: l3s3148p1@qX3wiV5VGL0ujntC
Date: Mon, 29 Jun 2026 08:26:28 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: i2c: Add Qualcomm I2C slave
 controller
Message-ID: <akIQFAX8LcZae29l@ninjato>
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
 <20260628-i2c-qcom-slave-v1-1-8b0a5c01f9f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r+ZUegNvxI2DW21t"
Content-Disposition: inline
In-Reply-To: <20260628-i2c-qcom-slave-v1-1-8b0a5c01f9f6@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:viken.dadhaniya@oss.qualcomm.com,m:mukesh.savaliya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DMARC_NA(0.00)[sang-engineering.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114845-lists,linux-arm-msm=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:from_mime,ninjato:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CEBB6D6541


--r+ZUegNvxI2DW21t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jun 28, 2026 at 08:09:04PM +0530, Viken Dadhaniya wrote:
> Add a binding for the Qualcomm I2C slave controller found on QDU1000. The
> block operates only as an I2C slave and supports FIFO/PIO transfers, so it
> needs a binding separate from Qualcomm I2C master controllers.

The official naming in I2C is now 'target' instead of 'slave'. Do you
think you can rename that? I know the Linux I2C core has still the old
wording in a lot of places and needs to be converted. However, if
possible, it would be nice if not more of the old terms would be added
which need to be converted at some point anyhow.

> Document the MMIO region, interrupt, XO and AHB clocks, interconnect path,
> and the 7-bit slave address needed to describe the controller in device
> tree.
>=20
> Use the 'qcom,slave-addr' property for the slave address because 'reg'
> describes the controller MMIO range, and this slave-only controller has no
> child node where an I2C address can be encoded.

This should not be needed because the backend defines which address is
going to be used? Can you share how you tested this?

Happy hacking,

   Wolfram


--r+ZUegNvxI2DW21t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpCEBAACgkQFA3kzBSg
KbYpJw/+Jy6U95MRFmB6J1Zy6lGHpyDpSphYyFIl7y72sswAbF11zLbJJYfP8VZM
1+y2qXv7VR+OGvSm72L7qCp22/ECva6pk6yVg1JFuBogRE8EskzW4qDcPYPcAkA3
UrSPPXpfMkTkARRCL9mPheiihHxWmGq7QTDejHKw+mpFxBfF844Ch4zaoifxUpVr
S78jmNX4kbGd36s1rqBg2V7jHKzAi6jTrtm94bp5LHLXc8Ch5clX4ZY8Ae8SV9c4
ALbEIHZFCwy22shWoVeHyK2cJGEenzHjrPwI1Z8md1AGD21b9fwoFxoKU3s34x3E
1jh5lAZranhaQZlv7D7R4Vij6bajyQDVcD4/nsN0qE48Bwe2ytJ3mfevI/c3zYJX
Zqc82bBv8slMuyj3m5L3mab4DeU/lYinLqe/ABaCQnsSlFLwZNuAysiE0he8Wrxn
y/p+rEyDyBd0/YEoYX4pW2W2xkZdQOA8Y8ft2RTa9jS77VZRGj+2H9ss8wX8mB56
cwgNApPk04cICgu3ZC1gadxa9W8MvsD0iX1+BXLmalplGxJDp/uB58fsVlWKJgDQ
q6kL3VMwLpiuh38VUBaolaQgILvpOuqpRotST3ihczTj/U1uYvc6sEVE7FNyQwkx
/+UM39mRcw4KlBGLbh3TNKdaJ6h440EgQ8sdY1/176FilPUY8HU=
=/xuL
-----END PGP SIGNATURE-----

--r+ZUegNvxI2DW21t--

