Return-Path: <linux-arm-msm+bounces-103984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD8ILBTb52kBBwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 22:16:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F16143F56D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 22:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D25BD30038C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 20:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D00E3DDDBA;
	Tue, 21 Apr 2026 20:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0E/xsNn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F333DD52E;
	Tue, 21 Apr 2026 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802459; cv=none; b=WRwg0q4dNjXoP1gfC9rmpNo/Cm5I5M7tP3A958IQQm7q2eBluc7BdbjgYo7va9xjKfyt7gcKfp/D08DPgTseTon93NUdWHsCAlsdN+pPAh/PjoOjr1arjt7DFCM8KT/jgw+SzmhDJquwYsTs8ldg4G/n0XpR1e9Uf/zoM3ksXQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802459; c=relaxed/simple;
	bh=QdWIrXfFTOLvb+UpFIWcvUtiW/YTISh7wxAc2S4hSPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RyVJvf/cXiQjKdiNaPES8jIWh8spkqfFxdbVo5Jj5ZMAmnFRx2t4ibeKxkM7gFJJIiR/W/6lKiJTbuKyTBrxrwa0KVcWUbh4mr0ijhpD61MuRWQT4cVZJE0GKa3Sqw6U89eLoVljN8zj3xA9l4pYjkfCGPqQikXIfxkPXzQNSb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0E/xsNn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E318C2BCB0;
	Tue, 21 Apr 2026 20:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776802459;
	bh=QdWIrXfFTOLvb+UpFIWcvUtiW/YTISh7wxAc2S4hSPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i0E/xsNn056qquscs6BQBWY5U8802vw8a/xCpil7ivu4O7gsT+Q2bc4V1EpmB0tSJ
	 IlyvUR1VhVmlocLi764/sPNN2WvC/lh1me0/9lYud4bokQu4iLL4Xngapjfu5CLoYE
	 Kb2tyvSPxmVVbcXjPQe7x8X4v5GXO6KoXv0su8RhfF1r5pfWW3GLZI02Yzq1WlZP7r
	 ea9XUPQaK0P9AtIWnfuA8CSibpBIzi1qlr5PvfXRR55GjVOrqAtUTd2GudKGGkxdW+
	 rPErIiGrJ8LRZDHdFKM3gQMd0riqi56ukIKbb71pEDbXiJ0iFhlbedLTDG4o8jWTuR
	 Q5LHusgX6E1lg==
Date: Tue, 21 Apr 2026 21:14:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] ASoC: qcom: x1e80100: limit speaker volumes
Message-ID: <bfcf51e2-2b5f-407d-9d7f-06ea72165fb5@sirena.org.uk>
References: <20260421-x1e80100-audio-limit-v1-1-98bac8cee2ee@canonical.com>
 <abcab457-a8e3-47e2-b5b8-f073bb741c1d@sirena.org.uk>
 <CAARv3RQjL1JGnUnC4oBkGKNi+C0G5_Pr0anDCrwm24Pdj-E6iQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LQBy+HrW8vXcVQlw"
Content-Disposition: inline
In-Reply-To: <CAARv3RQjL1JGnUnC4oBkGKNi+C0G5_Pr0anDCrwm24Pdj-E6iQ@mail.gmail.com>
X-Cookie: Jenkinson's Law:
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103984-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F16143F56D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--LQBy+HrW8vXcVQlw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 10:07:25PM +0200, Tobias Heider wrote:
> On Tue, Apr 21, 2026 at 6:27=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> > On Tue, Apr 21, 2026 at 02:07:58PM +0200, Tobias Heider wrote:

> > > +             snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81=
);
> > > +             snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81=
);

> > Do these actually match?  The hamoa WSA devices look like they've got
> > sound-name-prefix specified so the actual controls will have WSA and

> I think you might be right but I am not too experienced with alsa so I co=
uld use
> some help to figure out if what I'm doing makes sense.

> I ran `amixer -c0 controls` and that actually shows the prefixed names
> as you said.
> `amixer -c0 cget name=3D"WSA WSA_RX0 Digital Volume"` also confirms that =
they are
> still listing max=3D124, so it looks like it indeed didn't work.

Right.

> From what I understand the correct fix would be listing all four as in:
> snd_soc_limit_volume(card, "WSA WSA_RX0 Digital", 81);
> snd_soc_limit_volume(card, "WSA WSA_RX1 Digital", 81);
> snd_soc_limit_volume(card, "WSA2 WSA_RX0 Digital", 81);
> snd_soc_limit_volume(card, "WSA2 WSA_RX1 Digital", 81);

> Does that sound correct?

Yes, I think so.

> I'll run a few tests and send a fixed version once I have verified
> that works and amixer
> prints the correct max limit.

I sent a patch earlier this evening which adds an error message if the
control isn't matched, hopefully that's helpful.

--LQBy+HrW8vXcVQlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnn2pUACgkQJNaLcl1U
h9D8AAf7BA9mQkrK9JoCQDMTHcgB/XZBaOkr8uVedHdVqwJdMwMDVlZORC4OgUMu
W+5GfgsMpkv24892yxm+ew95DTq1uzSDlp/I3TGt7Ubu0PI/pgBON5zZQL7qg1Ak
79oYhOlVg9AtX/p0R6K9gygDioiXmLpDwz3m4gHvsTpvnK7PwHTJQhA0M50Ww0C4
iHQWUCwXaMHa12MTDXNXa7BFdOeSLirC3EuaLFpkQbaa+nsUSLhtsaDDLRtoPOBs
dsUQxorQmU7SBSI6WNvqh4AjgSP7Ymh3t4sq/T1+xxNKUa8frcLPFWsjiaLACruh
jqGZpnLTSJl7l6OmBasozwbyMm8KVg==
=QtJD
-----END PGP SIGNATURE-----

--LQBy+HrW8vXcVQlw--

