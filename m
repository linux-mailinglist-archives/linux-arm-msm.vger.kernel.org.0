Return-Path: <linux-arm-msm+bounces-99719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPkHGX3dwmkqnAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 19:52:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0366831B1AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 19:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52DB13098096
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 18:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B693BBA07;
	Tue, 24 Mar 2026 18:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgN722UI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2348F1E5B88;
	Tue, 24 Mar 2026 18:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774378067; cv=none; b=qku4klu5wOAb4tJiW+PH2fMMbM8ymbiBT1te0nLopo6oQj/GuKNM37CPXSHwyYZTCWQ28dIeU2PuuS9woHlj580xXrws06iuMT4EKol2T03s+LJYpjqRaQE2pL1s/hD1QonaIUHdThj/OczSsBfpy9PQNKyDmPHYo+XqB76z2nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774378067; c=relaxed/simple;
	bh=nBHnkmFzslI9wlUUgqvcQSBheOytEYO5CJcEzEIMG04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5N4nk/RaDMv9NBYhhwcTCMnn0jVwtf2sDVJWxYXrwbnGqbxjpAxs6CrLS2TCQ0OPblyRVBqvumeL3/HP+QKWhBbIwMZsM1HmEkEfYQnTItzLNqdzvARqlbG9B8ZhaXpGj0lw9LMBhPCGzerBtjPVkjSCADwymg7/JpduKKD8PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgN722UI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B780C19424;
	Tue, 24 Mar 2026 18:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774378066;
	bh=nBHnkmFzslI9wlUUgqvcQSBheOytEYO5CJcEzEIMG04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgN722UIWoYJYApMW9idF588h5G/41eqywc1XUB/41iIGijTHop6sxccN19hTr2FF
	 q2WxqdAOxUd/AnpWY8RZsJoyxcOBbngCBLCJPKUlo1lgvIcA4EGay0m+gtmrtEc4rt
	 OghViVv9+2Meqgzm9JfpOpl3gKa/puyIpesBJsyBRJKvWScrp48VUcn0PgWw0NzbRe
	 h99sQwdUvKykE49s95rqEd8YHKwusnRijhNWpsBUciRCy2UU87Otf5QWnYc6cqlcdP
	 5ogkQGUL4VjBPVjgvLyi6X7ZGTlMz/R/T9XhBxmPSsvOyRgHPLndvJEdim9g3yGlMY
	 l5K9+SUDCebzQ==
Date: Tue, 24 Mar 2026 18:47:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	srini@kernel.org, val@packett.cool, mailingradian@gmail.com,
	Stable@vger.kernel.org
Subject: Re: [PATCH v7 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph
 opens
Message-ID: <0c9ccf4f-ac3d-4727-8e9c-d3e2acd94dd1@sirena.org.uk>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260323223845.2126142-5-srinivas.kandagatla@oss.qualcomm.com>
 <61596b66-4fef-4bdc-93f2-a8639da79d32@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TyyyX09h6sTYz6DP"
Content-Disposition: inline
In-Reply-To: <61596b66-4fef-4bdc-93f2-a8639da79d32@sirena.org.uk>
X-Cookie: The only perfect science is hind-sight.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99719-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0366831B1AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--TyyyX09h6sTYz6DP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 24, 2026 at 06:25:42PM +0000, Mark Brown wrote:
> On Mon, Mar 23, 2026 at 10:38:36PM +0000, Srinivas Kandagatla wrote:
> > As prepare can be called mulitple times, this can result in multiple
> > graph opens for playback path.

> >  	 */
> > -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> > +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {

> This is an array of APM_PORT_MAX elements but we have DAI IDs in the DT
> bindings over that and now we're using the DAI ID to index into the
> array (I didn't check for existing instances...).  This might be
> impossible due to system design though.

Ah, found an update later in the series so it's OK in the end.  A
potential bisection issue but hopefully not the end of the world.

--TyyyX09h6sTYz6DP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnC3EsACgkQJNaLcl1U
h9BHQAgAhH1pHZvw2ghavA2Fh1jddKT+BOjYfY8w8ofUhkVRDi6K3QiQOwUJ8hzK
3cOVehBKnMnMFv4Bysc5pEGG14Bw1RGKpIciDIgRrY0DB4yI3U6iF3E+s2Xg9or+
jL8VNZ+f2rL+7WJhaffVXRa6I0CfkyFhU6oFm2kvq3N94s3nPk8IbgL337kOB7D5
oBXSUNfi8IRWnvmgGzbykQ2kgisWF6hJxR7zbqk2oRXojII4u9kxFALtnjWsVAQd
T57gj6qk6ANWQ0rtQFTXMCvCwJKom06AO9DkuJ7pSOJtmoNfhODLDhddmyFc+7Vk
Y7xlwwdq7Zw/GaZUIvqxWBfAY3rb3g==
=RjhL
-----END PGP SIGNATURE-----

--TyyyX09h6sTYz6DP--

