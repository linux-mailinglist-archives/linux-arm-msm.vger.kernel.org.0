Return-Path: <linux-arm-msm+bounces-106696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OFrMg/t/WlJkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 16:02:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBD04F7867
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 16:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96A01301624D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 14:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5453E5580;
	Fri,  8 May 2026 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnEdtCIM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4594A3D6473;
	Fri,  8 May 2026 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778248874; cv=none; b=u0wwsqitn8181PVavn9uTrU/U5H/oinSCNmvqXQxcnvZlCZlTnkzeqgnKV1aWrs8QShV7ixeaoJMPcDOQIb2l4oSqgblZPLeux1fG1FLofhMaMrmpd4O4frXYq3BYOXNUh1dWLlkX/rlUA+8ZHOHvde66bf2ikR/5kHfQDvmjGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778248874; c=relaxed/simple;
	bh=NlWpkJl28fCMdI7yre7mRiciRoVvpyRad/yUQyxDQHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHP+dvFw08XdGybp7zkKeT4he195COgFiQh2LqwBVZsL/jK1yebWIbDAB1FN7wcs+kbeMvBeS0mIs7mxc/rij46aRRD8O9vGLzKUsdf9LUFAm108s8LFIqgA/uTU/jM5mP/S9ihPEBzTNZFJ+PM1Z2cuX5XyW+ifuB5utVyA26U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnEdtCIM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE194C2BCB8;
	Fri,  8 May 2026 14:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778248873;
	bh=NlWpkJl28fCMdI7yre7mRiciRoVvpyRad/yUQyxDQHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hnEdtCIM/Wytg98NgoA1sM5eNln7Q+t6BMqaAdG0/RjgAD312/4ligBGkS14B6aze
	 TKS71bi3GUSqSMir4TypCxp2Q9tjOyRqF0fXbd0068xGrhC3xZ3SjlmGrArlKhY/fr
	 DijWlQ3PQ+b1D1i2d+pmD3erTefVKs3YWLKdLSAnHumCe5i8i7Lr4YaBgsgYsWV80w
	 xVTDim3ZYbuk/TYiDCORqqZgP5bv5z/OAPknMC/bUbOcjjwyP+iBdSbGZO87ZRrOa3
	 hPyzmlQXZc1ND/3cngfqAvguog4ptHoe7MEKgas1ed2DcWtyGHyFzuBPj7exz2WEQ6
	 uAWAB/hBCsU6w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 092D51AC5896; Fri, 08 May 2026 15:01:11 +0100 (BST)
Date: Fri, 8 May 2026 23:01:10 +0900
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
Message-ID: <af3spostNgoRU0Vv@sirena.co.uk>
References: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
 <20260506-add-tracepoints-for-qcom-geni-spi-v1-1-c957cfe712d1@oss.qualcomm.com>
 <afvkiT50ZUEXZ-YO@sirena.co.uk>
 <e4651363-7c1c-4ae0-a97b-b64841424c83@oss.qualcomm.com>
 <afxJmZ9MkP5eJkQC@sirena.co.uk>
 <59e36f20-891d-4a58-8cc4-6822d03daa23@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xo3uM2EQ4qGE2K/q"
Content-Disposition: inline
In-Reply-To: <59e36f20-891d-4a58-8cc4-6822d03daa23@oss.qualcomm.com>
X-Cookie: Truckers welcome.
X-Rspamd-Queue-Id: 3BBD04F7867
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
	TAGGED_FROM(0.00)[bounces-106696-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.co.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--Xo3uM2EQ4qGE2K/q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2026 at 11:03:39PM +0530, Praveen Talari wrote:
> On 07-05-2026 13:43, Mark Brown wrote:

> > By generic I mean this should not be driver specific at all.

> I hope these changes are fine. Please let me know if you have any concerns
> or feedback.

The data tracepoints look plausible but I would expect them to be
generated by the core, they'll be there for everything so I'd expect
them to work for everything.

--Xo3uM2EQ4qGE2K/q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn97KYACgkQJNaLcl1U
h9Drrwf/W6faToQE+TVwkiIzx7VRppTKLmiTz7jQ+oeqkwOe9pMmiO5H+GmaD/63
fJ7pxuw3Aeq8VfYivHDFRoBWM2LJ78wKHTfQaGCkz7Q8DXjZ66ciDpt1L22fc4DJ
a5broXuZjWQT7zIkFWN4jnQ+aNGqk6rPAfMMgJtcnCLVI/oqiqAECeyUVE+rHj+F
PZYKk34P1VoEIgh1ThYh8aedlNdVlIn5d8wep3B6agqxgxCVeYhp2ceIUgmfVlqi
BAy8RJqIhSWr+BIjnMBfLSghprXgyqRLcJXjiMamZuVL+/068ARJ4jpWOXsmJA5R
XVxoQCkHOLccStjGbJzHeACxptnYyw==
=98Fc
-----END PGP SIGNATURE-----

--Xo3uM2EQ4qGE2K/q--

