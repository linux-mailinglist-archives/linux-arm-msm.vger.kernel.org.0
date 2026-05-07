Return-Path: <linux-arm-msm+bounces-106217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPYUAbrW+2mzFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 02:03:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F11444E1A4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 02:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BCD28300723F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 00:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBAA40DFA6;
	Thu,  7 May 2026 00:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ph3QBBok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489A9DF6C;
	Thu,  7 May 2026 00:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778112180; cv=none; b=WMswApptLKoWobsNFMQ8VG/7Y2q/A4k/4XyTv2UVhJ2KQsYMaZAPBykyq5WZSYhSo/bsUWzl6lL2ptBan7ia5Ey1jxF1bCnK34Eix2CS50bz0xicRKKek72Qr4iK542m9sM02M2ROizS3fvmWX3k1IdEOn6ST0znf82N34hFJxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778112180; c=relaxed/simple;
	bh=2QKygJs5Bc+od5SrnKqbgqEKFReI/NphVpSq50RT8iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJOIm381ByzWlYLPnigwtJvOjV6i/2EHxvCsCY58Duv+XYCiI4O5FmNwxKD98mg2YdDdEs1FleL5ypS+93V70NyImpeteggwJVMT8O+PEjHnV4LgNPCLB+LHTTFeULSlb9B1isnqu+CzPBSmY/HyUE2qj2VTFx75fDn+FEZhhMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ph3QBBok; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B99C2BCB2;
	Thu,  7 May 2026 00:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778112179;
	bh=2QKygJs5Bc+od5SrnKqbgqEKFReI/NphVpSq50RT8iI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ph3QBBokjvE8IhdL4GKVb0z7EI30y8c7A+X/0UCtg+/W4iP/bmg12FFTfySMuzKKT
	 /UB7clHMam98HhIk5HvauIF2r50B5xm9osZmNAUmkvIplYobBlpx4v4a8j3V/vpFRa
	 bKuf7VT6LCRE+0PAKeCMFOzApniHpWAjhkcMtN1xYtJDbPPqzWdJZP8fk4IKeNKXjO
	 /jttDRmfHYScg1hFM56rtAUGAH5xFxZq1E7MQIaq5JiCG0g2E/sAk7GIOEZ7iBKUW+
	 s5bdexMbm06exo79vIBlzGg7iL64ZVLG7q/Nml5TAHv/IHgf1Ed+pXxRRwFEVYWxin
	 EgOd3hc3NTV8w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2763E1AC587F; Thu, 07 May 2026 01:02:57 +0100 (BST)
Date: Thu, 7 May 2026 09:02:57 +0900
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
Message-ID: <afvWsfgIz9Q-_cjH@sirena.co.uk>
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HNMYbKs3xz29VMcr"
Content-Disposition: inline
In-Reply-To: <20260506204142.659778-2-val@packett.cool>
X-Cookie: Truckers welcome.
X-Rspamd-Queue-Id: F11444E1A4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106217-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,machinesoul.in,fairphone.com,proton.me,lists.sr.ht,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


--HNMYbKs3xz29VMcr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 06, 2026 at 05:33:02PM -0300, Val Packett wrote:
> The response sent by the firmware when requesting a clock vote (opcode
> AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST) does not actually have
> the same opcode + status payload as APR_BASIC_RSP_RESULT. Rather, it
> returns one single u32 which is the client_handle that must be used in
> future unvote requests for the same clock.

Please send cover letters for your serieses, it helps tooling.  Please
also supply inter version changelogs.

--HNMYbKs3xz29VMcr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn71rAACgkQJNaLcl1U
h9Anzgf9FNOOJE3kohhLSXALdDcFC+1Fx4LVrxUPlnTEy6hgIs+7+tjX4CnC7Q33
1WHxuGpzCwc14KIOANfZGOWAxZ1uumrkkoKBzp2HEIK70EP71xQjBSJH+ICh+0Hp
Tj9D+Q5rxP6Wedm+fHuusJZ897TgvXkInBkcG4uRjc6Nfzdotlx8SUjXkpjodyJe
4RtEv1qGxqI0Mt1GyLv4XldJuoyxufTy5xIMp5YQ8wTaPYDD1oXjYeUnz1gqrInn
nFT8rs9soUwLJvI3fhxpYGm+uG7CJvWj4ETVWVDiE9lLdK5Ilq+jFw/+7MX2c/8D
aThHNceQTsCWPf0JQxKdXSLXwMV0Pg==
=RlbE
-----END PGP SIGNATURE-----

--HNMYbKs3xz29VMcr--

