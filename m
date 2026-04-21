Return-Path: <linux-arm-msm+bounces-103974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O3kIFSn52lQ+wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 18:35:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1970043D74E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 18:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B2AD300D877
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 16:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62672377555;
	Tue, 21 Apr 2026 16:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWRoAJmr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED3536E478;
	Tue, 21 Apr 2026 16:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788830; cv=none; b=O36y6688AEsnFULn5K+eDHD/he94Fv65WyouQtt68DpKTgpx6iy/aA2gXLG+SiEkvg/L+5QaypusTmStT34vJsRJUzm9l2rEkH+BFKGmZoneYtRFbdCSCGY4+RDqjnCI3fjuS01HYItimPt7J+af/P5Lc9rYsv/9d+5k99uPgxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788830; c=relaxed/simple;
	bh=B69zmWQHIepMwQSqG2SX4A7XjLJZOD2Oua8tmHLVQn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AP7pWwy42e2c7vX0c6bD2T7D5f8/1+l1nMYahgWA8pANZYyij2w0T36DVyjSUq4SRMquW7d4/r5sbCD6hVh66+J389gA79QYEf6PUgRnDjkEKmkeQneU+/zsScpGeJFnm9o0f4g9GjFvLKkG/b57ywL4GsnZ7vK6Q7Nlb+ob84M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWRoAJmr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A43AC2BCB0;
	Tue, 21 Apr 2026 16:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776788830;
	bh=B69zmWQHIepMwQSqG2SX4A7XjLJZOD2Oua8tmHLVQn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWRoAJmr3DwTCdJGdXnv/m7Dgck1R4doPhvKlzze81WLpWX5gVz4ATqTbREEs6wRN
	 L8Fs7TVWS/n768yWN1kX2tt/LB4/7fOl3YHKxQ6vNqiLmbqsDvjNuIYkrrE27O6hFw
	 6KR+hTOM1dAfiHmcEG6+j9a+tcNuUMpaZwiBHpaKJVCU/O/npHlZqqjEi766eBrJBB
	 EWbk7vkQpX68MYMx9KWjxVCeQpi5E7TEfDyISPoleBR9XFLjYsjfQzItbD54MhWxDA
	 rchI3j3M3Fji/HsaeoszjWvWCqDRvbp6u8EmtMIpXEU19SMlLbT5e2vroYJffFQu/z
	 h7/DAp970a0Vw==
Date: Tue, 21 Apr 2026 17:27:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] ASoC: qcom: x1e80100: limit speaker volumes
Message-ID: <abcab457-a8e3-47e2-b5b8-f073bb741c1d@sirena.org.uk>
References: <20260421-x1e80100-audio-limit-v1-1-98bac8cee2ee@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BYr1yepwL98j6uqS"
Content-Disposition: inline
In-Reply-To: <20260421-x1e80100-audio-limit-v1-1-98bac8cee2ee@canonical.com>
X-Cookie: Jenkinson's Law:
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103974-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 1970043D74E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--BYr1yepwL98j6uqS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2026 at 02:07:58PM +0200, Tobias Heider wrote:
> Limit the digital gain and PA volumes to a combined -3 dB in the machine
> driver to reduce the risk of speaker damage until we have active speaker
> protection in place (or higher safe levels have been established).

> +		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81);
> +		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81);

Do these actually match?  The hamoa WSA devices look like they've got
sound-name-prefix specified so the actual controls will have WSA and
WSA2 prefixes but snd_soc_limit_volume() uses snd_soc_card_get_kcontrol()
which just does a snd_ctl_find_id_mixer(), that doesn't understand
prefixes.

Probably something in that chain of operations should log an error since
typos really aren't going to be discoverable here...

--BYr1yepwL98j6uqS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnnpVgACgkQJNaLcl1U
h9BZ0gf/Rhc8NzkpFdex8iSUOrT7Sl5FV/BU970FnrpSyaqgONyzd3HqxtSonvRy
/zZlDAkJRWGFNNcKORUkXVzRw3ueNfwg7LBMzGDeYoN6tIKnP44QsVdTJJoPZ3Lj
gTfu9fTBOVVlUOVbtsaJw03SrQ2pdmQpbuucoWu+P9a9eZV0HVYkNHozE/r3ahup
MdJvTSKJG4QIHnB8qnshdd2iaVn6RLIBEiEdcS73fPYXP21twCUm4PsUYPUIadPM
0i9du0lEek+8HrK9s5w0KLw7Iiugm0sw9Z2TqdA+n/eeRX7B7mD+jHb8ukxptGoR
F30VWpl3bbnnw1B8tChqBVzDctiDcg==
=qylC
-----END PGP SIGNATURE-----

--BYr1yepwL98j6uqS--

