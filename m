Return-Path: <linux-arm-msm+bounces-106687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN8PH87n/WkPkgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 15:40:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDCC4F730B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 15:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CBDD30080B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 13:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456DA346A08;
	Fri,  8 May 2026 13:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQeKVyBq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60873E4C9A;
	Fri,  8 May 2026 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247088; cv=none; b=mf7OKWHDOPUUbVxrfR5O9lE1JXXBhiOTk9WCbk4udZeJX1hZDowrbBUsh8vwbJC7dMVzVWXnrYGZxjkJ6r6c7nocACJ/xaqXtjZSxdp2EUVMSnhs9MKwUudAj+WIbtTsrpvDppcUevYAnlr010GVSV53NwCnp92XBD2tlQtaI+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247088; c=relaxed/simple;
	bh=2F1QozlQG7T09kRSpbf+cVE38mgMF7pF8fSdN6iJDHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZvHuwesHonhCsIEY/DcmIIzkNymUBselSltdpE3QLKcnF1aWoaTNGD91R9lBeBN7GxY7IJD++HuOl1NG9M1SOnVEBpL27iW60tBNilV7iO5fkQynaANFrDCpzKTIXbcmIxOcaDiAzBIhMp9O77ArqV4qXrQa3vPl2RV+mi0fPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQeKVyBq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71663C2BCB0;
	Fri,  8 May 2026 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778247086;
	bh=2F1QozlQG7T09kRSpbf+cVE38mgMF7pF8fSdN6iJDHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQeKVyBqTs7KE2qNbk1uC4Rzcs/YG2OwSwWDS4g19ozR51U2JOUQqcWZx0DV0v6Px
	 W1jfdvA39ttzChD9WABRxO3XBPld2NHC6NtIkRvmOAcpBHEA1gzDJwZssJMvGrMbtk
	 5ihebRHR6IEeOMLr52VTmAp9haSSAZNZu6bXH74c0+OHJ9hU9JTOur8XtlU3kZQwdL
	 ECzKeAXP7jCuUuxXq0BWEVb4d3KRgFkZGaf9UXfjaY4WocQw3zDB/L/nu1CMmnLXFb
	 yyBJgFRLJolGWPGiG5otrLlyb9o3P4De9/1dy8GFDopl8dbP6H+F3yhEeex93pXlT/
	 qhRAvIVUZfAQQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 682A51AC5895; Fri, 08 May 2026 14:31:24 +0100 (BST)
Date: Fri, 8 May 2026 22:31:24 +0900
From: Mark Brown <broonie@kernel.org>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] regulator: add devm_fwnode family of functions
Message-ID: <af3lrPf3Mc7xf4A2@sirena.co.uk>
References: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
 <20260508-gpiokeys-vdd-supply-v1-1-0bb32e8e6428@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4buaXrfzRTzWsrHF"
Content-Disposition: inline
In-Reply-To: <20260508-gpiokeys-vdd-supply-v1-1-0bb32e8e6428@fairphone.com>
X-Cookie: Truckers welcome.
X-Rspamd-Queue-Id: 0FDCC4F730B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,fairphone.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106687-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


--4buaXrfzRTzWsrHF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2026 at 02:53:13PM +0200, Griffin Kroah-Hartman wrote:
> Add devm_fwnode_regulator_get and variants.
>=20
> These function wrappers allow regulators to be accessed from the fwnode
> struct without any casts.

Why?

--4buaXrfzRTzWsrHF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn95asACgkQJNaLcl1U
h9AKSgf8DQ01KnkkqxDIQTlrHuCkEn16D+Yr4k9m4rmRwL4e7A47S7WKsH9DjRRD
f4cRTZmvm5al8qv/3cWT6hZ+y6PwQ/NCY01JaPF+N3quqISkZoQvrHxt5Ms7dNQl
ndM1zQ09iyUlenJASTMv4d3qzkwU4++gnQiSauEFUGyxWmlE5SvASuUs/dv2GvgK
mC8LYWLlatTvP2Jr+avWDesJJlRQO2vxJEIK1fUH1BMJmINABotmY9OvG8arS06a
ZwSIDuawL5GLo5KgmFemxDGaewKBK+XWPLIZ3OmqKXY0assRepeQYzAobqNeYDjm
Mtvpn7Ei0chyE52y0f+hfx9DWmPHYQ==
=RGuJ
-----END PGP SIGNATURE-----

--4buaXrfzRTzWsrHF--

