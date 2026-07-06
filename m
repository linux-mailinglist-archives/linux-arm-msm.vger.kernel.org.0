Return-Path: <linux-arm-msm+bounces-116803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9+I4FpehS2pwXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:37:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D886C7109DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:37:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="HS/ms58m";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116803-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116803-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4EBC130090A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4963FE35F;
	Mon,  6 Jul 2026 12:37:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0882E42CAE6;
	Mon,  6 Jul 2026 12:37:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341461; cv=none; b=SnWkYi88A1nshm6DzZb0nFj0H0dd0+bv7wWZuWnx2Z975S10P8IrzITOuCvoW+xtVNHAyZuvI84t3XfGpC0r/Ef/vhaN42N1kqUES7aSaAaZTvzBtoCMC6gukrzMNrQ1wAUmlPQvMG2hvq1i89ayBEbuMpFFfxtvF9vtk1Zyr9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341461; c=relaxed/simple;
	bh=UHpL9yRmv5uOSMqNyqiPvaZgLUE/oapZhx6L6eBjM4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dm6Q0j82eQzax9xGLKGHFBJw3ct1OAvFoJ5b2N1Getb0cQTfxkZCQ4pCkxa0oSADIlAeBn5yXo+EZwM2LRG3+BJJNzT8pzM6U10xqgUn9cPJ14O53MwBBdw9kAex8q/2OOEQqa1vB4Us71S2hI1ytGNGWTASIaXTF2nE6BK82Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HS/ms58m; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67551F000E9;
	Mon,  6 Jul 2026 12:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783341456;
	bh=3iu7ygyZNH+mrrf0SfE0vo4XASafThvcKVXrv31yLXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HS/ms58mCeq/1uDEVxznpO4OLMATWBj4hQd0zM1CglhaInAaYQ+WMLshQv4vUfr3s
	 RIJlAZjUyq5/xY1ePmKM/P0YYgJr1vLkQbK8htQRUcwoj3HTzY6Wi1mU9loL2jhBQa
	 VlOUQ+7dqCxR2fKA3swF+ykgok+7e1KTdcOWPhBKsJb2idWx4u+ilQfAaacm2hwmW9
	 iuhMIxulc6/S9O4TiVw2d0zpFfhYR3up+y/QgiYVy8spCREa5ud4554A1siKOG2bqD
	 WLgyDOIPmzzIXKQvYGQnCiFbv++V4EGaEpx875fDcyfln4dTgwyHC97y4EW7alEOLf
	 t38ahnukKbFhA==
Date: Mon, 6 Jul 2026 13:37:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Oder Chiou <oder_chiou@realtek.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	patches@opensource.cirrus.com,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sharique Mohammad <sharq0406@gmail.com>
Subject: Re: [PATCH 14/19] ASoC: codecs: wm8962: Propagate regcache_sync()
 errors
Message-ID: <564cfb98-fc71-43d9-9fe0-ce9f82539f4c@sirena.org.uk>
References: <20260704034845.14291-1-pengpeng@iscas.ac.cn>
 <20260704040220.12045-1-pengpeng@iscas.ac.cn>
 <e0c106fd-4ebe-4ddc-b83b-190e17e49d29@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/vN93qA8opLCP9hD"
Content-Disposition: inline
In-Reply-To: <e0c106fd-4ebe-4ddc-b83b-190e17e49d29@opensource.cirrus.com>
X-Cookie: Did I do an INCORRECT THING??
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116803-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rf@opensource.cirrus.com,m:pengpeng@iscas.ac.cn,m:lgirdwood@gmail.com,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:oder_chiou@realtek.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:david.rhodes@cirrus.com,m:patches@opensource.cirrus.com,m:brgl@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:ckeepax@opensource.cirrus.com,m:sebastian.krzyszkowiak@puri.sm,m:shengjiu.wang@nxp.com,m:sharq0406@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[iscas.ac.cn,gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,realtek.com,ti.com,cirrus.com,opensource.cirrus.com,renesas.com,puri.sm,nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D886C7109DE


--/vN93qA8opLCP9hD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 06, 2026 at 10:11:35AM +0100, Richard Fitzgerald wrote:
> On 04/07/2026 5:02 am, Pengpeng Hou wrote:

> > @@ -3955,6 +3957,11 @@ static int wm8962_runtime_resume(struct device *dev)
> >   	return 0;
> > +cache_sync_err:

> Should this error path revert the three regmap writes that were done
> before the regcache_sync() ?

Possibly, OTOH if the sync is failing we probably have I/O issues and
it's questionable if the revert will work.  We also don't know how much
of the sync actually happened so that's a thing too.  I suggest not
worrying too much about it until we've got an actual use case where
sensible recovery is plausible.

--/vN93qA8opLCP9hD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpLoYkACgkQJNaLcl1U
h9DnKwf7BUP6rtTGIfUGmOPRdTJF9RGLp8JVZsSy54AgAjX8jOcX9BLUXx+iPJy3
m8DVzrbmn5qpFyzcrdlF3x/bz4VAO4ozPOOuUO6IuF1hzdTjeAOG0MO4s8kQW/V1
lSqVfbHMqzTka5BNUXDTEc3bviGocFqU4CbnPIM8Bh6d0uS7A+U8m5Yhwn25sJN9
HQ3SF5a/lhXl3WCfXFjNZNTaV95SoxcOcMXu85ZS3rXmIQ49Ov+lWeufkoEoPreE
lZVFc8wwd+YlLcXr2dqHPWbGTV/iokTGenfUvN5rlh4K4mrvXejSPO4jgxhPFejK
YnRteANHGnElNbJ5ebcIsoVfVO2dnw==
=qQ0c
-----END PGP SIGNATURE-----

--/vN93qA8opLCP9hD--

