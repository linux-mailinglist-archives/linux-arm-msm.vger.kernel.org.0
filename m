Return-Path: <linux-arm-msm+bounces-91498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDMGFVeWgGnL/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 13:19:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E383CC489
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 13:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 472AA3003EA5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 12:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF7B2D2488;
	Mon,  2 Feb 2026 12:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAC++Wds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C58125A9;
	Mon,  2 Feb 2026 12:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770034772; cv=none; b=ua/Fjs7oYHk9UfOdIME3Ty/Z6cGp/2E3b3531Rh3NlkfCzqhjOtdtWlCYDWlV1/RBQ9r3t29nCeMZLvLx0RJCqjoBrqGSiV0Kpc0sASrjvD8Pu1bUhCGsivoR3zm61kcq+1bZYWiNlfRakZZ+6O4Qu5QZJLwtpBt4uGZsCCzR1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770034772; c=relaxed/simple;
	bh=/hmv34PWXh9ty0t21+ufUJZxokTcGfGI0S3tTCHPhbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPxBpeTjo9XJeOCUzOIDhsW5ZWKZUub93FY6xZKl9lC1NPaw5QS0URRCiSFxZlZmhNOXpNqTH14d4ZP0gliS5nbRiSkz1H5eIaM25BesOl9uWpPAYu0lY3wtIa63dRDwgADqZzA0PwxVcoqJdvVHaeRsjI5/gY2ivPyTdox8ruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAC++Wds; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E99BC116C6;
	Mon,  2 Feb 2026 12:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770034772;
	bh=/hmv34PWXh9ty0t21+ufUJZxokTcGfGI0S3tTCHPhbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nAC++Wds6MRJ3x6vYXYIx5jOPJxGSTP3BTbmZkOY94TSDojSNJGuDeceifxhPsKq5
	 ruYGR5cZp2DYW+4v66LJMc7RwQoxs/F4FDC1GKknprg8GdyWVRpa7TRibuunLKnZA/
	 /myg4H10LPIxinQdfoZbgv4XUSFw3Mdm/2z/sBFikNeGqDQQ1ripEezk/KM/HTCrxB
	 P2boRDzmDHuKI131G+uf+D5f+O7G6bNPFBcRXIcpCo7g92hlIWm6uwlPfmjCruRmi9
	 HlajUKgRAzsd/asZTwaQ/4dn8qD0VONJVTk1ktAhGtFr+W1yLl8WeLpAVtTlzgRZCn
	 yP3XwrNB3T5bg==
Date: Mon, 2 Feb 2026 12:19:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] sound: wcd-mbhc-v2: remove unnecessary module_init/exit
 functions
Message-ID: <424e565e-d789-4da1-addb-e6b12df0e67d@sirena.org.uk>
References: <20260131020111.46108-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w8ZW8sU4UQK/lEhm"
Content-Disposition: inline
In-Reply-To: <20260131020111.46108-1-enelsonmoore@gmail.com>
X-Cookie: Bedfellows make strange politicians.
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,perex.cz,suse.com];
	TAGGED_FROM(0.00)[bounces-91498-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E383CC489
X-Rspamd-Action: no action


--w8ZW8sU4UQK/lEhm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 30, 2026 at 06:01:10PM -0800, Ethan Nelson-Moore wrote:
> The wcd-mbhc-v2 driver has unnecessary empty module_init and
> module_exit functions. Remove them. Note that if a module_init function
> exists, a module_exit function must also exist; otherwise, the module
> cannot be unloaded.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--w8ZW8sU4UQK/lEhm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAlk8ACgkQJNaLcl1U
h9AIyAf+Phlqw6pW+O52YGjk23DkllewJ1tj2QryvbZSV2WL5EE30eTiisSzS8RU
TC/g7WoF8siU1r2mM5P2nRctCzGnpcXR0yZcr5iqZ0iuD6MmNruH1m/0Op6NqH1C
QzBYhcF4xUSXBc+7dxOsB8A6VDpK3/Hnv8soDkaDI4T6gRt/LpvppAhyYWKfOEXV
1eFjkqzjaCzWQQ6208oP8Tm1WEjqRPRQcP/q0DzN2pYY6wHKN3XyP1/Co/b3Ak4d
aaDhy860dlfwBfu/Degnn3V35jwRNtlqtK0K+OEHuJ5kxKSLCmQi9LBl4/iayBVU
W+Dgz4WhE3K3Zi3UJdupjZ176q7QoQ==
=JItj
-----END PGP SIGNATURE-----

--w8ZW8sU4UQK/lEhm--

