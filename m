Return-Path: <linux-arm-msm+bounces-99864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MgSIO/Pw2nuuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:07:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F81432471C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 985F0309DB16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E63E3CF675;
	Wed, 25 Mar 2026 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnlOwSqb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1583BE644;
	Wed, 25 Mar 2026 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439778; cv=none; b=jsA1xksZrx91yd640or+bknKgAMW4TXjNNpuw3lASkb74OHS4Q8frbyo5RAXESu4P+rM2HCco0LnV2BySKoZwgq3kTMAuMtPM3eHEmMTlxMRc7NEQhLQXd/f/rIO558goWa77cY1Xf/0ofdnM3oAb55MK2e1w9JtHjGO2JU7GFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439778; c=relaxed/simple;
	bh=y5eicVOgre3NViIeaiEUviFFzj5lWVajoM5bukR7g8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a53PgVqCTc201hAu6UsJ3iE1whV1LyR/lO09//ySBuLV98AvDusf/noRoRctEv4MUWvwa5E0s9vsk6Xo6hAZna+4UJA5EwXJEpQqCdcxxQTYv+yBMeSkJwQJVcPtntbWcRn/AA/CXr8ksOfRRjiRGiRCDjimHgquI06EgVmgqUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnlOwSqb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3AFAC2BCB0;
	Wed, 25 Mar 2026 11:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774439778;
	bh=y5eicVOgre3NViIeaiEUviFFzj5lWVajoM5bukR7g8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WnlOwSqbd5z6vbnv65t2kBFVk7MHWdjVvVY278mEQNIRoAXjwCfYqb90KQJ+qHRd4
	 TdmcCIwkY1Huq400bmMfaCVOTud3PwPIE8LWGQUGMRxSaXu+nCkVUh8k6cu9JzjzTK
	 necjyM5IBHT9qkXZrcOStRybX5whYZO7m6fb9s2mOX7o9TqU9TJge+8JYjzzqdiTyB
	 W0RVJU6xKQzelk/VGKhEz/D+labRJPrsUSrzHrHOSsrzreH2WG2uV8m3Ma06Rur/YG
	 WaA9j9vmlW3HoKajCP5tPA02bEvciUg3auAEq1nrR4O+DMPjoOX0Arv//1K2dsa282
	 R/L4H0QUOn4gA==
Date: Wed, 25 Mar 2026 11:56:12 +0000
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
Message-ID: <54e3e041-0995-403b-a6c3-c7007bffc6a2@sirena.org.uk>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260323223845.2126142-5-srinivas.kandagatla@oss.qualcomm.com>
 <61596b66-4fef-4bdc-93f2-a8639da79d32@sirena.org.uk>
 <e03b2cf2-08a0-49c8-8ae6-1651de301a08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VFBmEYn++veHZhxu"
Content-Disposition: inline
In-Reply-To: <e03b2cf2-08a0-49c8-8ae6-1651de301a08@oss.qualcomm.com>
X-Cookie: -- I have seen the FUN --
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99864-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1F81432471C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--VFBmEYn++veHZhxu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 25, 2026 at 11:33:45AM +0000, Srinivas Kandagatla wrote:
> On 3/24/26 6:25 PM, Mark Brown wrote:
> > On Mon, Mar 23, 2026 at 10:38:36PM +0000, Srinivas Kandagatla wrote:

> >> -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> >> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {

> > This is an array of APM_PORT_MAX elements but we have DAI IDs in the DT
> > bindings over that and now we're using the DAI ID to index into the

> The driver has dai->id indexing the array in most places, and that is
> how it has been for a while. This is one of the problem which last patch
> is trying to address doing a check on the range. At somepoint we need to
> move to dynamic allocation tbh.

Yeah, I saw it was a bit shaky all over.  I think having the array size
bumps earlier might help at least make it clearer things are OK, but
dynamic structures of some kind would indeed be ideal.

--VFBmEYn++veHZhxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnDzVsACgkQJNaLcl1U
h9Coywf/WkiSE1/dEBYd/LGwvS28AJza6T4NhDfhu7UYyjUL+P6ADa9kAE2+vfKF
oOr017m+7xPiWx30EwjASxMqO2o+Kx7s776j8XeSimJrn8I3Ibyi8luB6GHZU+fT
pm1R/fSb+flQkwCcAwbFu/QvbtsH1tNpl2/Nu2x744PjVXG/oEuDPSNt3Jioi+vN
IP4TPNzfobUJ9oyV+vZ6MnPdtaTpQ2S2PJjgjkg8kp31X0F1FqOOo7d26yYpHq6D
mpOwELT9yuVEzT4Gvq/oCOnkQ1ATbbZLsfen2V2YHdzX/s996rHc+osDF2cO6RC3
a0mxm0f+q6fuq9cAEuFNsEb1DtxQ5w==
=/qLu
-----END PGP SIGNATURE-----

--VFBmEYn++veHZhxu--

