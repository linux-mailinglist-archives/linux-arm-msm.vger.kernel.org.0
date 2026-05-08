Return-Path: <linux-arm-msm+bounces-106693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNUMN4jq/WkPkgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 15:52:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D72F4F7634
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 15:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B27F3090756
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 13:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83273E51F3;
	Fri,  8 May 2026 13:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHm4ZnG6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939563E3177;
	Fri,  8 May 2026 13:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247853; cv=none; b=JyoPS9ujEOyQ+rNWj3UQo5PisaWNa9P4adcV6mjxAq0a/ogbVSvxhP4Fto6t/cvRsSSda8cl8TOtwP1tJIC+ZO8PtCmSq81A+zgzFhc3zcylYreQA3QvJQROriGkk2Iso5HhC2SbJqjntEg6BsZuBsQXsFfIipmIJt++o/xgpnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247853; c=relaxed/simple;
	bh=rC7HQLfgWuhJ3tSLf2UG4GIGH2fMZZU1dF+YCsP/4sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhiwRObwaV6l5UCpOTrQxsE4eMjMssqw0NlF1z7fiQrdv2M6J5+G5hEea8FNqppzesCFq9wx+uM/IuB5wpQ+4Jy3SEKZFjFiRI7gXbyyibWScfUis9zaRaOj+y44wHbicjQOZkU4vM1Vd3pj4V/ZikSmhmu3mlsMyu5M2GSIMls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHm4ZnG6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA88C2BCB0;
	Fri,  8 May 2026 13:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778247853;
	bh=rC7HQLfgWuhJ3tSLf2UG4GIGH2fMZZU1dF+YCsP/4sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WHm4ZnG6iJz/kDhKJl5Rmp/R1fLy1hCSquKtYdyiAmXF2pdqAjGisgPUd2/jaGeNd
	 sfh9+XmtGOKaw8fjax1gO+Xq6vPtZfp/EVzJChaOoOd4MflD0lGXFJnUouaqV7gA3e
	 WgDgeYq7N7bCelXESN36q4ovNXeR3N476ScS7YF+2Xr7ExuqIfJhwrPsoAQlxgRTMv
	 ewT3MvGg1jpBjem67Gp4XPIqpC4Kfp4FumVl/lTy0EqGChJaOi9Hhp+Oz2R4OMXIUL
	 SeINhR5LGB3geJviScn5JWmrrsZo/M6UB4NghYd+8pKu1+bn+RfnZlcm4VWA8kV2DO
	 wGpyXqu6bXRXA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 588CD1AC5896; Fri, 08 May 2026 14:44:09 +0100 (BST)
Date: Fri, 8 May 2026 22:44:09 +0900
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
Subject: Re: [PATCH RFC 3/4] Input: gpio-keys - add regulator to gpio_keys
Message-ID: <af3oqSshbXrUYMnz@sirena.co.uk>
References: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
 <20260508-gpiokeys-vdd-supply-v1-3-0bb32e8e6428@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9vVJySQTZKLGPR9V"
Content-Disposition: inline
In-Reply-To: <20260508-gpiokeys-vdd-supply-v1-3-0bb32e8e6428@fairphone.com>
X-Cookie: Truckers welcome.
X-Rspamd-Queue-Id: 8D72F4F7634
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,fairphone.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106693-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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


--9vVJySQTZKLGPR9V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 08, 2026 at 02:53:15PM +0200, Griffin Kroah-Hartman wrote:

> +		if (fwnode_property_present(child, "vdd-supply")) {
> +			button->regulator = devm_fwnode_regulator_get_optional(dev, child, "vdd");
> +			if (IS_ERR(button->regulator)) {

As well as the issue I mentioned on a prior thread with this assigning a
non-physical "vdd" name to the single supply that these components can
have (which has had issues in the past, AHCI being one of the more
painful) the fact that this is fwnode means that this opens up support
for using this with ACPI which is very problematic given that ACPI has a
strong model of how regulators should work which is that they should not
be OS visible at all.  That probably needs more addressing in the prior
regulator patch, that needs a bit more motivation and discussion about
the issues with trying to do a regulator interface firmware neutrally.

--9vVJySQTZKLGPR9V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn96KgACgkQJNaLcl1U
h9D9Iwf9FYBAm+xTXPtwQMfedE9HZNagJvNMdbBVmPXEACKwo35zvtwY+6mG4Qfj
I6JJYF/WgCUr25YpU+Mj4LtsfBxCMlgUTPmqvLpgdjNAmhcyz4PZthH63L1cKP19
C+SYU5LM0P90mf6TFR32epKJ7uZCdVc+2mP6zI4jy6m7Sd1HbEm54R2ienGmqEgX
45xZB7fkbNzTqKZyZU8FqP3B1ikaNKUWhBcE1wXJVxgmgXvhADZ7ZlzmdQe5tgO0
BqNaZ92RrePHg7jY4NWn4MS2ct/j7l6p4hPc4cdraRZTpWqVImo4Er4VaDv0NcRS
rz5LM8nHTb7mOaAoYm+B2P7dA9P5bw==
=Ogmp
-----END PGP SIGNATURE-----

--9vVJySQTZKLGPR9V--

