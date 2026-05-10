Return-Path: <linux-arm-msm+bounces-106822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D5nEYp8AGrJJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:39:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05743503FF4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1EF7B300A7F1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 12:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49504371D13;
	Sun, 10 May 2026 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixRwwxCy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247CA263F44;
	Sun, 10 May 2026 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416645; cv=none; b=VPGjwVLbIPDcnWg1izEgkc/O5tccZA7PkWu4XIUM7/P0HfpzaEIcQ7kI/jRTqNzI1D5Bt2c0NKxSWF53MGA0VSlm8N+po3rF748Fv3hKykMFuu8+zo+9JpPa1oEkLpuE0hCY6krcDhtcwfZBK2falLsbT7ZABMEuVH3WbB0Xg3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416645; c=relaxed/simple;
	bh=vu3Y5hebGHlbs8Wwwwd0v6O6dDNlPkMvQPdXO/9L2Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXFguTeaFnQdQ/jPUXfiki1gAcX3JtUKsusRtt4xvh2MBlPA6vL2/2vSiBLdYLnpeJcR8goyR1hxt0FoXOFBO23+vNsIa/yGpHPg0A0xPqunghBMYQz8PxPv8smhn0RvBLLg0tLJ76yaQ48Dqbrn8UAEbCeGmVfgf8U3eR3UScQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixRwwxCy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95607C2BCB8;
	Sun, 10 May 2026 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416644;
	bh=vu3Y5hebGHlbs8Wwwwd0v6O6dDNlPkMvQPdXO/9L2Jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixRwwxCympUFtP7RHFxl/EOSwCmlcpAzxybNlwYSM2R3Wb6h7BlnhndIvPe5W9zfp
	 tmwo6vR1lFg0A5sbhBlbe/Ju8LnwHC1DGtZpRWqFuFTXQFTW3ZBsed5pDLPJOfyXpU
	 4VqoKR3EYIJ1YJgp9eF78/tvE0dPndpwN14ecJdyryXJxpBicbbTjadLh20iDwRuTk
	 K7nqToyp0k6mOMr2SF0FqNI/oveLpTizprnvCjUeE2weHyCrepfUFUcpXBqQN1MpG0
	 4RP7CqwZK9+TUG5jQ1ut+xSg9zYCp4Wqu740QLqduvOXKvedueCnYjQDLA+Kg4lAPD
	 5mXeLfqt0L15w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5F9D61AC5898; Sun, 10 May 2026 13:37:22 +0100 (BST)
Date: Sun, 10 May 2026 21:37:22 +0900
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
Subject: Re: [PATCH v1 1/2] spi: qcom-geni: trace: Add trace events for
 Qualcomm GENI SPI
Message-ID: <agB8AgF3qVqDw60Z@sirena.co.uk>
References: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
 <20260506-add-tracepoints-for-qcom-geni-spi-v1-1-c957cfe712d1@oss.qualcomm.com>
 <afvkiT50ZUEXZ-YO@sirena.co.uk>
 <e4651363-7c1c-4ae0-a97b-b64841424c83@oss.qualcomm.com>
 <afxJmZ9MkP5eJkQC@sirena.co.uk>
 <59e36f20-891d-4a58-8cc4-6822d03daa23@oss.qualcomm.com>
 <af3spostNgoRU0Vv@sirena.co.uk>
 <4d90b061-95ab-40d4-83d2-13425e992d4d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FoKVK1Ec5vCNkjz/"
Content-Disposition: inline
In-Reply-To: <4d90b061-95ab-40d4-83d2-13425e992d4d@oss.qualcomm.com>
X-Cookie: Truckers welcome.
X-Rspamd-Queue-Id: 05743503FF4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106822-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sirena.co.uk:mid]
X-Rspamd-Action: no action


--FoKVK1Ec5vCNkjz/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 09, 2026 at 07:37:26AM +0530, Praveen Talari wrote:

> Could you also please review the changes made in spi.c ?
> I would appreciate any feedback or suggestions you may have.

Please just sumbmit normal patches instead of sending partial patches in
reply to another thread unless something is really unclear.

> @@ -1658,6 +1658,11 @@ static int spi_transfer_one_message(struct
> spi_controller *ctlr,
>=20
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 trace_spi_transfer_stop(msg, xfer);
>=20
> +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (spi_valid_txbuf(msg, xfer))
> +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0trace_spi_tx_data(msg->sp=
i, xfer->tx_buf,
> xfer->len);
> +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (spi_valid_rxbuf(msg, xfer))
> +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0trace_spi_rx_data(msg->sp=
i, xfer->rx_buf,
> xfer->len);

It feels like it'd be more helpful to log the transmit data before we do
the send.

--FoKVK1Ec5vCNkjz/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoAfAEACgkQJNaLcl1U
h9BTLgf+LemCv9sfC+554JjNQ/7vHm63lfC60glScUyFOhUKHr/MFtzddYoZ5hmH
bOgBlNZ/wFXCKh24+CkI/2o92t59d6JFk+JVy2VcoHC/UA32rFkEkN+F4otq/wpk
veDDZRtbTkgMdg5hJXjUvab1gX895fTjizvlj9XUcfLlfI2UgI2ffiv0OJ0CS6Lm
TFjYwKhkfu2eQ+wawV4iPCUp0jfYUQH1k0tAdji9dRwDRzhtrceWfbOzIH4yWSjA
fVC+4NyoCXQSGh8RIGNOcmEwBZxC2JPqmmACfzKOWhN1LqFTIbo6kt8v9XBZpluH
5+kKCG4TYV1kdieuqerU4iCMs+EinA==
=+Ysd
-----END PGP SIGNATURE-----

--FoKVK1Ec5vCNkjz/--

