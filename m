Return-Path: <linux-arm-msm+bounces-102674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIBHIVnQ2GngiQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:26:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F6D3D5A89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA5AD302B82E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12B437C0FE;
	Fri, 10 Apr 2026 10:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCrOGua3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA207342CA7;
	Fri, 10 Apr 2026 10:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816745; cv=none; b=dSnuyg6Ic5GmGrwMebW+qcnjkEccaHhO7/IHyMVYEcN0yNDA6ZUvAZQrLMkkS20Vi6Wx/R/eS5dB9174e8NX98tbO6WPpBuovHTImCkCe/IIvKbTfux5c8JG75VDwcJcGxzEwAnU7yxzXXB8kweIcMC4+q3BI7pqpbgixIVPTHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816745; c=relaxed/simple;
	bh=t2nET9fPDGaJpyw3Vp3C8RpRsISRCVamh6ppDvw204A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cf0t61imhQ6jmX+b05u4BiZpOevFrBIJNomuEnktx4vkueHuy6vs8vKjYfkY3RPOCe8YBWy2Pbb1xOd9tZthgr3zCtLS4JS4Y2pbwYATBePeLKRSjL49Klvzln1SL/E6wBgTE7wM7rOPIDnSwO8Wh0SunTdKbyUQxUbj3l8QVpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCrOGua3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B89C19421;
	Fri, 10 Apr 2026 10:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775816745;
	bh=t2nET9fPDGaJpyw3Vp3C8RpRsISRCVamh6ppDvw204A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BCrOGua3k+NyL/VrHFX3rLHLc02293xMNUpiXL2RQ95Ot85YYQgRQ6n4cLVeeNBFJ
	 pbcO02LfjJN8noFdIFg0NkKNUNf0+jMYETuyLIA+j6Q6HiI1FkSBz422pNlMavo7vO
	 EJVHkegQGORJIPk7Iua21ygYCKdiOjxTlO9oXVOI5Gso41abqjxvbkwwbon/sLK+7I
	 GL4N38QaXfiLYAkbycW4yy65nSj977AGXMKj9gdJZXALq6gY3UOtYsYhgc5PSoy9JX
	 gKDpXtwvb4r0cwRYvxXg0ICMt5SbWy3x2NXXs1s5wIadS1cNdrQ+gcllwT/03hIYbT
	 Zh0ONTytxVugQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9D6171AC58AF; Fri, 10 Apr 2026 11:25:42 +0100 (BST)
Date: Fri, 10 Apr 2026 11:25:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Karthik S <karthik.s@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: codecs: wcd937x: Add conditional regulator
 control for wcd937x
Message-ID: <adjQJgMCGg0WlG5z@sirena.co.uk>
References: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
 <fea78031-e570-4348-a4b3-d113b5749fec@sirena.org.uk>
 <8d97669b-7bde-4a21-8131-0907554f534e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cyYqfUp1SGYbh6T5"
Content-Disposition: inline
In-Reply-To: <8d97669b-7bde-4a21-8131-0907554f534e@oss.qualcomm.com>
X-Cookie: You will be divorced within a year.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102674-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.co.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 02F6D3D5A89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--cyYqfUp1SGYbh6T5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 11:10:22AM +0530, Karthik S wrote:
> Hi @Mark ,

Please don't add random characters to my name.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

> On the indus mezz skew, The codec rails are distributed through fixed Vdd
> (3.3V supply). These rails are Board=E2=80=91controlled , not switched by=
 the codec
> and not power=E2=80=91cycled dynamically. There is no per=E2=80=91codec e=
nable/disable
> control exposed to software.The codec is wired to rails that are always
> powered when the board is powered. Hence this justifies it being handled =
as
> a board dt property.

This is a compltely normal situation for regulators, probably true for
the majority of current systems with regulators in use.  Why would this
board be different?

--cyYqfUp1SGYbh6T5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnY0CUACgkQJNaLcl1U
h9DvkQf8Cr6rrjoUGJrXeCvWME9tegSH8nwdbQUQh0DiYnpobYo0cyb4X3MlF251
o2yRdzSUHbWng/G7NKk84Azri3E8QAysq8MH7kQu8nHDj05NqfEp8o9WTlPvlacm
b4RknaEKdGKFIYNpttl8eYRrxqnc1jT0jvA/zBbbgr5O0Ag6Rq/VbC2j9+Uix1TS
cEvIwZMMIwffHuwKglWUfgCIToyGlfco/cAWedYvOpME7c4Vfd/O5k0RwMsqy7xT
28+kovaDjFItQQBQ3AOZCCiQnrIXW0f/wSUlDEFzUJj2hS4Ch3z5qvWpxTDjxD+/
2/6YjpWVDrI9bG7F/GcAXollPyXOng==
=09qk
-----END PGP SIGNATURE-----

--cyYqfUp1SGYbh6T5--

