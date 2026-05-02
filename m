Return-Path: <linux-arm-msm+bounces-105579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBBJAxuJ9mkUWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 01:30:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5354B3A67
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 01:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3B633002FB5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2026 23:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D0A3115AE;
	Sat,  2 May 2026 23:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqUe9wmo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AFE29BDBF;
	Sat,  2 May 2026 23:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777764537; cv=none; b=JM2f6wCteeIEskUakpXoVbeyC9PPuRgBaMU8tnNE9fiiVV3kAYuGq65seJXhmWCb4YG1QzzowIcwBi3NQ7pFI/+JKPuJnV9p2ZkvKluDYloAywfMrvE7vgCEKjQv2Er5V+Nzq+H53JLLUd1pwQauZ4WPPEKJoMmTI6QHZ3sfAkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777764537; c=relaxed/simple;
	bh=Lw9jBOvvJjT4+4Jivn2cnbDip5QLiTDpLvRZx+ZQYJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NW+Yq1Fs+urcZncl9BGwe/vAFcNFYfH690wOE7viV2bAyQwp15kMXXRJzqB8tkPcfKGfvrZjmkPmVOFsc2ktbqFXR9UXdY6OM6xv+zJEKUbaOkzoMKwtxkgT4kG8pODnh8ysxDDIx1Ua9mf+ROm4MXYHKuzyjwtdNZg+V9Q1esw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqUe9wmo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5140FC19425;
	Sat,  2 May 2026 23:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777764536;
	bh=Lw9jBOvvJjT4+4Jivn2cnbDip5QLiTDpLvRZx+ZQYJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqUe9wmosAe2fwai+2Udb81wJW1nyket5qcrfupCVzkLAfVuEYehO9gK8/8+/HFoL
	 9uX24NrGHpEmaAJsQ8cl+iA0tLjYq6vfypzT1Z6GH5z2725XXK1exOlbdlCzbQjM+/
	 lYSE3WcXipBljMfblr5D0IBPhDYphWUSdutCSTBEHCOSGpEyTVQax9Pf7bMK3yu/iV
	 m6SNQ1iDAKa/ALF/KtrDzBfvkyn3Uw/ZIeY/V4UgRSu/bldWOe73IUfY46NWMM3bfU
	 2xrjFy+5hUfIeguSNiJxASXyJyJaOGwwJLz5+QdyPQrtNmwfqxvBXDxxaAqoTofuc9
	 jjAh+yHurmE6g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A0A141AC5863; Sun, 03 May 2026 00:28:53 +0100 (BST)
Date: Sun, 3 May 2026 08:28:53 +0900
From: Mark Brown <broonie@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s
 support
Message-ID: <afaItZPyanmoWraa@sirena.co.uk>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-9-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QptKJDS25bihgyZY"
Content-Disposition: inline
In-Reply-To: <20260501153128.8152-9-mailingradian@gmail.com>
X-Cookie: 667:
X-Rspamd-Queue-Id: 5F5354B3A67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105579-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org,mainlining.org,quicinc.com,linuxfoundation.org,opensource.cirrus.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


--QptKJDS25bihgyZY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 01, 2026 at 11:31:21AM -0400, Richard Acayan wrote:
> Add the internal MI2S ports found on the SDM660 internal sound card.

> +	SND_SOC_DAPM_AIF_IN("INT0_MI2S_RX", "NULL",
> +		0, SND_SOC_NOPM, 0, 0),

Why are we using the string "NULL" rather than a NULL pointer here?

--QptKJDS25bihgyZY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn2iLQACgkQJNaLcl1U
h9CacQf7BJ+OXeV0F/HUONNiI6qJ9Rfx4EuyUKXePmMeyD3Y85OUjCUsdbJGDLsI
ZiDHv16WxKCH5CFjkgsNfpxncz5Bd6OpRf+ZpMVewXB5Yx8kmGT7YZlY6gjV5m9+
d6Ge3mZUuRLjCWNH43RDTboRu0/UuT6TnJW/P4Sa5eZfaVHS2ygUUZm6JDQ+Cjv8
P9ChYSrLEspda58wDRlL4Zdkl851TLXnwh7nqG4goOLPLiJHBd5XWPJ/jnkPz2y9
ctw1BtCwUh6lUMKeEm4Oe2L50oKdBlNdf7auO64JPbhoT68egrjKH2SbVgtd7IcB
PYGC1H9WK7isPM0WCJFN6Ub/scZ2lA==
=T+yC
-----END PGP SIGNATURE-----

--QptKJDS25bihgyZY--

