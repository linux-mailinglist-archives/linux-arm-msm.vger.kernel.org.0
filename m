Return-Path: <linux-arm-msm+bounces-106219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FD53J7zl+2mNHgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 03:07:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 042614E1D02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 03:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B0FE301159C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 01:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7531F91E3;
	Thu,  7 May 2026 01:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IO2OLgQn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0C01A3172;
	Thu,  7 May 2026 01:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778116024; cv=none; b=Ashbw0pn0djGkb6Eho4IHXHl2a2VOahsvqti6o75hL+dmWYyrDmPHjaCGk1XpYMEWmgmS0DIXIrYGPBEXSrzqdkQjkgcbM5TbfM0TAwTgjnU+vHMZLw2c9w/Ox5HLfRI1wrJGPLw1Z+h6UdhsjJZ5Dh3Pd5kmXxq6kLgK5AtsAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778116024; c=relaxed/simple;
	bh=ZKX/D9zQmeru+Huodbh+JH3SBzBKUgpTWReRJ4E3UTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6bP5jsguuxLnJhcdtBq/wXg3/hqIrAUNvu6RM+Jf7cB5ZaGs9gbsQsqJzWkbz1V/HbM5eRUnOv44BlUzUpqBlacPkXal5E2x0aEuSAXkc2TIB0BdIu2Cruc1bV07J6nYm+8n6RY/r1UX/t+hfE+IF22UBSf6g+R7P9KxVaILqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IO2OLgQn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29022C2BCB2;
	Thu,  7 May 2026 01:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778116023;
	bh=ZKX/D9zQmeru+Huodbh+JH3SBzBKUgpTWReRJ4E3UTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IO2OLgQnworEChZaex5cnXRDKnURRbNnLtrGlkbVqAn4XLpkwQuCwmI+/qCKiHkbU
	 nVC6srkNSL6kIPcf7Fx7bacrpVrX5SR3PNxvBBFqHmXJpa6g3p6vDjc23St/1tYfFS
	 L9bJUZW3ue9e7wBiL2VJPg7JOfDC9exjNdP2s+reoZZw7tFBAB4+q/x+lOD2sdIcW9
	 W38qkaPyAyv7X3mzXgjtFLAJnoO8KiPS5d+vv+J89KTxO5N9W4/oq558HPAi36kq2T
	 Y9eaLGKxCVNAj7lm0ondgcvm2S9pjtNIhe54WHTFlfzRfD46DshupqjZsAG1HSmFUj
	 qipex1InBt7dA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id DD5741AC588F; Thu, 07 May 2026 02:07:00 +0100 (BST)
Date: Thu, 7 May 2026 10:07:00 +0900
From: Mark Brown <broonie@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
	MukeshKumarSavaliyamukesh.savaliya@oss.qualcomm.com,
	AniketRandiveaniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com,
	jyothi.seerapu@oss.qualcomm.com
Subject: Re: [PATCH v1 2/2] spi: qcom-geni: Add trace events for Qualcomm
 GENI SPI driver
Message-ID: <afvltFJzKLaO9weP@sirena.co.uk>
References: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
 <20260506-add-tracepoints-for-qcom-geni-spi-v1-2-c957cfe712d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t1mwQTkrypJu9WtS"
Content-Disposition: inline
In-Reply-To: <20260506-add-tracepoints-for-qcom-geni-spi-v1-2-c957cfe712d1@oss.qualcomm.com>
X-Cookie: Truckers welcome.
X-Rspamd-Queue-Id: 042614E1D02
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
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106219-lists,linux-arm-msm=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


--t1mwQTkrypJu9WtS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2026 at 10:59:43PM +0530, Praveen Talari wrote:

> @@ -717,6 +726,7 @@ static bool geni_spi_handle_tx(struct spi_geni_master=
 *mas)
>  		max_bytes =3D mas->tx_rem_bytes;
> =20
>  	tx_buf =3D mas->cur_xfer->tx_buf + mas->cur_xfer->len - mas->tx_rem_byt=
es;
> +
>  	while (i < max_bytes) {
>  		unsigned int j;
>  		unsigned int bytes_to_write;

Unrelated whitespace change.

--t1mwQTkrypJu9WtS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn75bMACgkQJNaLcl1U
h9CLKwf7BDdQED7owq4YZXcm+ix61hp5aMPV6hUNEf6moiRWDvmCDjUSSAvoCR5B
rbbSbaNr09B+oP3xp1r+BQu3f4YX4Z/+C+CgAkPRurh5MPsFt41S5JU3P9t2Nosi
rbjRsa0+9ri8+dnS+8L3xpKlb2RkoZpr+xvo16E8cOcSxp0cYUnwk/QiPI2+pWc3
HjCztBS5VqUy30p8aIEVovMBTbVML5jXdVurCJA1qUrDo1GOW//HogkqgOe1A/9y
0WroGfpL3ZOiHfhe6mynITWvS6JidXtoDVrCu/1ZVbg+prQv8bwoXFdop7JoHc/7
v6QitFNhe860INKjEcHZmDgc451vxg==
=hUXa
-----END PGP SIGNATURE-----

--t1mwQTkrypJu9WtS--

