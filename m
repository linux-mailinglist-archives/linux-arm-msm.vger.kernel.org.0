Return-Path: <linux-arm-msm+bounces-22849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB7890AD70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 13:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1344528321B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 11:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0C9194C9C;
	Mon, 17 Jun 2024 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNlghp6D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F5A194C7D;
	Mon, 17 Jun 2024 11:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718625362; cv=none; b=h6vrYSqdHGFushivJYh0pnx8wE2shKYeXNrvUrbyUWhs8KkW8lbfonSsE1dqZ5QCkxS/3vK1ZBsTAce5TF0v+etwuR9y6zn1uCXPBsIM6Fxz9c5uDE5kEJSv+471oNShjsytVF5htk+O31hWMnY7/i1fYXrlA2CEk4pqwyT5EgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718625362; c=relaxed/simple;
	bh=zcF/2nXoBUoTs0IfILCFfijm4oSftAfNtCrvpe11/JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGic4oUnsrT9kbmVtcj7sB6OM/ANb3IpITLyvJmEUBeRLRR+f64tx/3cmRglNjktfkVyTUMfxqGNbdKbYPxo8LIxD/y00JGuFKcML//xQsvaDshEMUnxiXYUQbQD8WAw0rnatQ0QIJeLm+a/l5PQmUwD0+dvp8o8/FkbcLWC1G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNlghp6D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D453FC4AF1D;
	Mon, 17 Jun 2024 11:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718625361;
	bh=zcF/2nXoBUoTs0IfILCFfijm4oSftAfNtCrvpe11/JU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MNlghp6DagZTuTPTqt7feyE/Pjb+tLZZgu0Kr3PsMIWSKE0VWP1UYsimkCgtLoE/C
	 wslQ3UHIOFq9Rsp8QOLEB3fGaD/EiPENVDmb4PCMG2frVOK6RHfxkXYGKig171GY57
	 jsu/Mw6n/v18YMASJ6qhRyFZNIYHqSDXHzI2zJfjESwb+4kGYW1RJUSymHK0DEZPtA
	 Q2C27waazGeMCrQy29psngYn2EKl/GCHgE/Tp8BrwNR9QRPRidZXT4ptJrCTRo3LFv
	 Puz0e6/XdVV3fQhv1ZsxgCmVrezG7nBcKVi2nI4oCZeBCzxwhef5lRUSO53mJZDvBU
	 px7qdOWQ0JHZg==
Date: Mon, 17 Jun 2024 12:55:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
	quic_pkumpatl@quicinc.com, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v6 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
Message-ID: <f741630e-f9e8-45e1-b3e2-4866f0baeac2@sirena.org.uk>
References: <20240611074557.604250-1-quic_mohs@quicinc.com>
 <20240611074557.604250-4-quic_mohs@quicinc.com>
 <2b92c0f9-2595-4b73-8015-1abb825a61a1@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IKXHfzXLDDZvI4f7"
Content-Disposition: inline
In-Reply-To: <2b92c0f9-2595-4b73-8015-1abb825a61a1@wanadoo.fr>
X-Cookie: Life is the urge to ecstasy.


--IKXHfzXLDDZvI4f7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 04:54:58PM +0200, Christophe JAILLET wrote:
> Le 11/06/2024 =E0 09:45, Mohammad Rafi Shaik a =E9crit=A0:

> > +static void wcd937x_soc_codec_remove(struct snd_soc_component *compone=
nt)
> > +{
> > +	struct wcd937x_priv *wcd937x =3D snd_soc_component_get_drvdata(compon=
ent);
> > +
> > +	wcd937x_mbhc_deinit(component);
> > +	free_irq(wcd937x->aux_pdm_wd_int, wcd937x);
> > +	free_irq(wcd937x->hphl_pdm_wd_int, wcd937x);
> > +	free_irq(wcd937x->hphr_pdm_wd_int, wcd937x);

> These irq have been requested wth devm_request_threaded_irq(), so either
> this free_irq should be removed, or devm_free_irq() should be used if the
> order is important.

Yes, this should be fixed.

--IKXHfzXLDDZvI4f7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwJEcACgkQJNaLcl1U
h9BiSgf/a6KPiaGF02vTC6372jxwFNBIm3cNPKZNeyNpRRu/hf1ru8zAJllwGy3w
jmCbCxYcnIzP5H5Hs/F7DLxQ9zaUbTRSp1irscvX4KGvbR6Jm17p7lrLp7tWz2LF
sZT5ha4eSzyRnB/1h5a8jtq8TxhSCSfzfKxXJiZPpr8q44lEHrIjurttAJ5jurph
ucJZ9kaS3oER2djdLu2IizER1e9LW2zCB+T4TwbYkPxfVuAE9EMpxmtUEegkEP1w
F8EtFjowt9U7IL8whvvAmbUW0hzJRDnKxAyLDsC1xWE9V2fsKGpcGEKig5e0m8kB
77V/5PeoWOVfqxadcYa00d+xcoFIyQ==
=kada
-----END PGP SIGNATURE-----

--IKXHfzXLDDZvI4f7--

