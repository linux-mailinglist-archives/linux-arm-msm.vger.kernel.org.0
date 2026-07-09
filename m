Return-Path: <linux-arm-msm+bounces-118069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wWs+EdjXT2pIpAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 19:18:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6E0733C8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 19:18:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hrWVg5Nd;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118069-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118069-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 11562301E81D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 17:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02D13655F1;
	Thu,  9 Jul 2026 17:17:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C883723EA8A;
	Thu,  9 Jul 2026 17:17:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617464; cv=none; b=FB+FWWtNQSOda5Evq2YUcr+F4Sbyxdw7p9/fD2NHp8Atl9ljgNEc+etHfRgoogNIUA1t1sO660kzI20SR1WA6F8TpvKE7J4Stw3Sv/TWeY9ad9z6Rt28vsg+UPbj5bX17Q6KzpCytbtdeL91vRFyfXpDHW4resKwoENv5o/07YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617464; c=relaxed/simple;
	bh=aeXoARSWbQHaBeo0zPuFlRQn9RNcBwMWekmXAT53GCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxL0EkIzWGGNugd5awJx/UIB+/OhWJAwP5S1vxcQFdRVtnP97xg/UD+Sl4/1nCXKOm/RCWAPzUCnnLB72b4Ut1LCt5a8P23gAoIRQqmS7Al8EuMRxcu6vxkJTyWeyW+0DBW/qJxa7hIbZKTOzz3d1CQ4hHok8asK/dOocKcZsB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrWVg5Nd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E220E1F000E9;
	Thu,  9 Jul 2026 17:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617463;
	bh=hu7RJDXVjMt/MUj7Dde25d8+nHf2eRwwqw8qorwPda0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hrWVg5NdnRkfv23bl3dStmf6K1bZbQqAsdmgNROeNtC6upsn+egi3YbvnFMxKnQDm
	 EFkTAuE/iRyWUBEKW1ukVsYOfLnX+BqFIj3gErTfolCNBgw2Dmf/ZC7qgiE5zHXbST
	 Z9XcuXXBW9BiUexjO5oA+SFpupSCIbb/LJ5cNe86ys1GEJSUEMuSgdJRvBF0T0rovi
	 1z/CReHMtCa2sijCoZaGkO1kxt36d9H90Dkf8uFQWITEHFDDT+4nbXxgVIexzRHv3X
	 csaAfEMHXaIILJJ1gPuWgBkLbP+4592aFblDIGNdWGLG2dXCG10YsYgyxoOCn4/uUU
	 gaicFrvskiLRQ==
Date: Thu, 9 Jul 2026 18:17:34 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com, Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/27] ASoC: codecs: Use guard() for mutex & spin
 locks - part 2
Message-ID: <c74c52c5-91b3-4764-a7a1-26fc940bf735@sirena.org.uk>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="61d5AFFcly1gk4TJ"
Content-Disposition: inline
In-Reply-To: <20260709045902.498848-1-phucduc.bui@gmail.com>
X-Cookie: MS-DOS must die!
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:tiwai@suse.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:support.opensource@diasemi.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:srini@kernel.org,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:linusw@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:u.kleine-koenig@baylibre.com,m:zhangyi@everest-semi.com,m:marco.crivellari@suse.com,m:kees@kernel.org,m:sammiee5311@gmail.com,m:arnd@arndb.de,m:rongqianfeng@vivo.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:phucducbui@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118069-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[suse.com,foursemi.com,bootlin.com,diasemi.com,gmail.com,perex.cz,kernel.org,opensource.cirrus.com,collabora.com,ti.com,realtek.com,renesas.com,baylibre.com,everest-semi.com,arndb.de,vivo.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A6E0733C8C


--61d5AFFcly1gk4TJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2026 at 11:58:35AM +0700, phucduc.bui@gmail.com wrote:

> bui duc phuc (27):
>   ASoC: codecs: da7213: Use guard() for mutex locks
>   ASoC: codecs: da7219: Use guard() for mutex locks

Only the first two of these seem to have come through which has rather
confused things?

--61d5AFFcly1gk4TJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpP164ACgkQJNaLcl1U
h9CXVwf9Hi+8k/grZJpWPryXkF9eQnmQKdVD9kTokae7G8oJR/aQEzZjTiF475Tk
pc+ahjdUoUcnZYBQLiaqQTJTnWvQW62QrUAGVXOzPv8KWas47Wd3Jd0LmWpgDpYv
MfzehjZyymLLmCVN8oImAvE97g7oUmbILYWnfkjfSMANhkSjbEHi/+VXT+tmxCzs
ihiM5Chu+C65wTbVjLw2c6ql/7p2aE61fnYsr2RCrFaV/1Xwbf+rO9AQIAdomo9w
nLP/cAg+fau0Wo6W44Pd1p8wWL0Bt6CR6QSgCRhv258l5YZWxS/uK5HNypSPnA9e
gNdNfKpYEndx7XQWxZrIeV7iSdzNNg==
=rheX
-----END PGP SIGNATURE-----

--61d5AFFcly1gk4TJ--

