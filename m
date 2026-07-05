Return-Path: <linux-arm-msm+bounces-116553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BDATIiCJSmrbEQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 18:41:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC46470A969
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 18:41:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=NN+S6nba;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116553-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116553-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C380A3017505
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 16:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCF82F9C37;
	Sun,  5 Jul 2026 16:40:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3A22F8EB5
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 16:40:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783269659; cv=none; b=eUuu3keCWVDoq1YhUm1WKT17JrwM2qQCbqeVgYpT6kS0PglrpbeMOQ4ft3XcG2nZID57xPSEOjh0gOKAyf68A+wGnfEwIXqoKzBtUCH7AoEB/EPUQOHsjZTPlLe1VOcu5QZ5xjiHqLjz0LtLh66p+XxkR94chT/61Jv9TneGKkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783269659; c=relaxed/simple;
	bh=d0jQ5UQ7pVAffeh9AMk0K/rauKiYjN4OlHj7yKZ/PEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGCSCFdjj6eRZK+ZIFvS5oQQeiNeXnAWtUPreBVw8JGnhjrYasJObVg569BhMdc6rYvkYyckTWYHX5AxHu80Kq86GXXmZW/I1AIZnAthiXTDHSPu8X5Wy8eRcegcKbxifcgqs8zbJlVOHk1V3u+JVdnPJ+LRJ+eVNq/qYugm0Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NN+S6nba; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=d0jQ
	5UQ7pVAffeh9AMk0K/rauKiYjN4OlHj7yKZ/PEs=; b=NN+S6nbaCWqRcijr/f1y
	Uqi3jTAiN+aIUpvzc45wnULUdCUvs2hW723IGhJogJTyejCx6UDfWUbnSPxSpT0y
	yDw4KX470zUM96mJKJEw3KD/JnZQsbi3IseGwhy5pQCQlsOydP8+eB4YXeY0G/c8
	qHa9W6zJouwudBtbnF74zEf0zPLE62s+sS5tk1fn+xT0tqeaOjouy3W1hgX9b/pF
	NKq0r7lG4aK2cyonVSN1G11drXLfgxIZexiEInKc/TLHtzG15KyspIuokNVdq7WO
	nTJrLEOEsVK8JSHiM6qlbCWrkNcCSklQBvY9xsE7wXLtZZbNxPbcZASBNSTXi7RC
	+w==
Received: (qmail 2288731 invoked from network); 5 Jul 2026 18:40:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jul 2026 18:40:55 +0200
X-UD-Smtp-Session: l3s3148p1@lxRS0t9Vf3dtKjFj
Date: Sun, 5 Jul 2026 18:40:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] i2c: qcom-slave: Add driver for Qualcomm I2C
 slave controller
Message-ID: <akqJFgL_NZorf9Qz@shikoro>
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
 <20260628-i2c-qcom-slave-v1-2-8b0a5c01f9f6@oss.qualcomm.com>
 <akp4_Sfjs4RrEXQR@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WffVVY5Ay9uyhsdF"
Content-Disposition: inline
In-Reply-To: <akp4_Sfjs4RrEXQR@baldur>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-116553-lists,linux-arm-msm=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:viken.dadhaniya@oss.qualcomm.com,m:mukesh.savaliya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sang-engineering.com:from_mime,sang-engineering.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC46470A969


--WffVVY5Ay9uyhsdF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I don't think you read Documentation/i2c/slave-interface.rst. To me this
> looks like a i2c "master", that is being abused to serve the role of a
> slave; which of course implies that you have a non-standard slave device
> implementation working with this.

True that. The driver does not use the core infrastructure for target
devices. Sorry, this is not upstreamable this way.


--WffVVY5Ay9uyhsdF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpKiRIACgkQFA3kzBSg
KbYL4hAAi937hhuBp81WCLEQe92D0lMDhIgtr3NJkcWMrfeHgzZDEEd2Xz8U1Y9b
Cviw2GAfS7VGY6QIbPCvSF+ExfztCyWbH6gcpKmxadWQcoOPY5KwP8lUL7kGrD7n
x8VFtZDPEkBoUR4jxX/uKK8LUY8zBCXciJgfuc2QV5zsXMEyB1Nx7m/yYJ6kD8yX
EwkCjVV5WeiIQB9ZBgQQSeYri1b7TGnru4wYGTs+2htP175jBXTPPnjQrvwNd6K0
WvLPSWE7DlmKK9taFIDF4quEWY4Vr4ePiHsxE+3zP1EUgxUjnSQmmuYtxF6wOtvl
pY6R58jcM7gEyptmIZ3lTC/DMIxb7F6mwIkctSse9ZZI/w2q/XMjBQrYCVDkHoqS
9NtgeailHPc4HExSVOTFeU9yiQ1i0sFI4zbBDQorcr5J3tir7AjWIaxT9S3DAKqu
5Q/FNCeBJK/22rUssfviJH9FCWAb0LIURjVUUezGb6EojuOHFAkJWmKRgX5OuJz1
ugYfQ4dQYGzRs5S+L2GZt5mDSSMCi7jWv8Tp3350ZSOqiNah288z9md3bhE9nbWm
AaaKVH8dgf06gFA6R9tYh52aFRGvm96l25byxakxgV5cMppfWWDYE7I0Yd99oRGV
ZSp/k/0j4RBXhtqD2ISo77AVB2iv5Ut4ASTlF9gJ8scGGjotZgQ=
=i3x0
-----END PGP SIGNATURE-----

--WffVVY5Ay9uyhsdF--

