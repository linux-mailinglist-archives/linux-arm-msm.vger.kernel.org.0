Return-Path: <linux-arm-msm+bounces-106229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JrTEPX1+2l9JQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 04:16:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A63654E234D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 04:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9BA3301EC59
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 02:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3E82475CB;
	Thu,  7 May 2026 02:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxL5CnUP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F891F37D3;
	Thu,  7 May 2026 02:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778120178; cv=none; b=WqjA44p0REfqTsYDQuQGLj1QNLeDIcJc6Ak+xCoFwen/Pn9JY+ajP4FUqT742Cy/yyGieC0bpx+rVlC7tGrFXEWx6CQkUSbrgTzWbnn9zWpONagww5XDuqoGJtbE4UtBV1SqlUVmrYAzVQhOwAucl6jl7YpIvA1t8g+jlTsd6KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778120178; c=relaxed/simple;
	bh=7P1lwiamsO+iUyiNAaImYGvcKkkANKf8++qbBqeG3YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpYNAVlzeQHBENwI6UmE6c1QThNVSBD5AfIcwt6n9rPwTvrbkbNoSFxxFaSMBTcCX+N2Tua1/BXsKlhJmZWSEKHOgL3jy9nLu2OpqXDjKoNAfMTPJIZc8jWsfrwFO1sgDT8Gj+VPMaxuukcP0jy+o9Qpvo81ic3oO5vMyly65MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxL5CnUP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657A9C2BCB8;
	Thu,  7 May 2026 02:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778120177;
	bh=7P1lwiamsO+iUyiNAaImYGvcKkkANKf8++qbBqeG3YA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GxL5CnUPafUPkfKCUxvXEBSSSZK+cWcw+7xlgT/kytIV5S7ag5S/MCY/QNMHxKISz
	 xCGDuPaR94yEbIoI69POzTH2cek/padIq1m1ssKvImuiybzTaN8KqrTdbOUlzOCyEC
	 2Gn4C9YwWriWOSPswkqA4EvAwazGyOIr1QAHtpltSgVlQqlRmUMtPogoaoTwxPHqe7
	 FPSpOqfmjnV2oHuwCPqtzeMgyjmFS7EjDeab3UdgLjxY+rSEhhtw3zgkOdRB9ohu8j
	 GLDSaEWIgPoA5dh2i8rWQcmh8egVRl97fCiDvhE64lBgA0Nx6MlVqq5ZKwZBGGeDTP
	 AV+RMMzCdnGQg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9E8B11AC5890; Thu, 07 May 2026 03:16:14 +0100 (BST)
Date: Thu, 7 May 2026 11:16:14 +0900
From: Mark Brown <broonie@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Antoine Bernard <zalnir@proton.me>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/6] ASoC: qcom: qdsp6: q6afe: fix clk vote response
 type mismatch
Message-ID: <afv17gUZnHdXgyF_@sirena.co.uk>
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-2-val@packett.cool>
 <afvWsfgIz9Q-_cjH@sirena.co.uk>
 <35b45fd0-fffb-455b-b19d-5c29cc955563@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3GHkyXaJiaCGYmj/"
Content-Disposition: inline
In-Reply-To: <35b45fd0-fffb-455b-b19d-5c29cc955563@packett.cool>
X-Cookie: Truckers welcome.
X-Rspamd-Queue-Id: A63654E234D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106229-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,machinesoul.in,fairphone.com,proton.me,lists.sr.ht,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.co.uk:mid]
X-Rspamd-Action: no action


--3GHkyXaJiaCGYmj/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 06, 2026 at 10:46:33PM -0300, Val Packett wrote:
> On 5/6/26 9:02 PM, Mark Brown wrote:

> > Please send cover letters for your serieses, it helps tooling.  Please
> > also supply inter version changelogs.

> ummm:

> https://lore.kernel.org/all/20260506204142.659778-1-val@packett.cool/

> I even Cc'd all(?) the lists, as usual.. Oh, sorry- not stable@ I guess.

Nor me, if the mail doesn't end up in my inbox then I'm going to have no
idea that it exists.  You need to not only write a cover letter, but
also send it to the relevant maintainers just like the patches.

--3GHkyXaJiaCGYmj/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn79eoACgkQJNaLcl1U
h9Cnfwf/USR02eDP4Dj3141fqXu2GuFUWjn0mvXMjOds4VHuWsiaSiWBCwVYoq86
Lb9U22ItPuiyAIOXbKjljYVq5pZXou7pz5ZXs7qrMI3C8Id25O3PeES+4bwEkrqa
OmAceuAgug8PW4LDZYMt3DpV61GO9t3F4/XfQ/x2XJurT2fBuDfLWsNMdaqLBhoc
+K8V4PwjiW1jkVotllElx6T5+RMlLex49bHBlhUAsDvOoCO6S9CmGqrYtjqDL8OP
5q194MuN5iYG11tktsZ3SC75woNyynixdl3ZRZNvSW8B4agKqejs4rJ2DN5DTzYa
lcJmEAGyVSoT2LfkCwR2ZChk+SGh9g==
=/ve+
-----END PGP SIGNATURE-----

--3GHkyXaJiaCGYmj/--

