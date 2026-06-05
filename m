Return-Path: <linux-arm-msm+bounces-111408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3YmsKzPCImo2dQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 14:33:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AB364831C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 14:33:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mr9yd6Ip;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111408-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111408-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7DEDF3085038
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 12:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD854389460;
	Fri,  5 Jun 2026 12:21:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC8A2FE071;
	Fri,  5 Jun 2026 12:21:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662096; cv=none; b=g2xcE0PlE7evzID5ewjnaAx4FXXQ51k8dVCk6lEMVjXkRrw2ig1KBXuyaZtee6hTM1IA/sLlZnh66ZXGnjNcBDkdEiE5vROvZLtg/klJ4aC7fS33EnHxiWIPWt0Y6Mla76LLfE864slGr1u/DCp6h8KYl4rvPnlAsXXDbyTK/+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662096; c=relaxed/simple;
	bh=xXdkTBV9HDdzF0ewqu0ljfh0o8Pcp/rrzIA7EgiDN48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPzffdMw84IvsjC+KA65w8e4Y4cz7toJB1afvlMOui/la+swhsAcucV2FTgeJHOGr1OSrdIQDJ7WL8fhQLx1SMOG+8NJZcluip9prOOlbDoSwYeh75ujy7RPbR+5MgY+LJ6KVrhSUTncMebQBXeuPqwHwcVQtAJgExcIgN5lIPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mr9yd6Ip; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12B41F00893;
	Fri,  5 Jun 2026 12:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780662095;
	bh=BkF106EVeoshRrfrhwHdkyaJZrw4V9a00ZaPgutuZGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mr9yd6IpKH4vQyvGuMzOocT3U1BOwqdND+rhv9RV0PEkH0oqckEEujXBjnXXwB3tG
	 UYljrtjeE+EEbIi7r/G50Jgr192cA15fDld56xpOsQR46b4rJ51ofzCG7fEhrv50wX
	 +LfMFw8JXxoUqYDJUnIG+K6hPuJe48i2EvBIAXyqctMPgblbPEgMJWAgknIyrlJ7RB
	 8/Plqn3V3nWqxUBvqa6UEuoF+i1/9mCoaOO7eMibhM9EhjMGTFLWfnOnDj6xjCmFap
	 VGRhbcd7qla5u3k82O7kpbHnFgfezO2YwVp3f5Y7cPq1eaLl6fZJPKYXnurfQWtIpb
	 2eUdQc7Hb0Qfw==
Date: Fri, 5 Jun 2026 13:21:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: qcom: lpass-cpu: Use
 asoc_qcom_of_xlate_dai_name helper
Message-ID: <1011c7bf-14f7-444f-af7d-3973a2e6bfb5@sirena.org.uk>
References: <20260605092812.3495852-1-harendra.gautam@oss.qualcomm.com>
 <20260605092812.3495852-3-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b1X1md/ZN8ejJPYF"
Content-Disposition: inline
In-Reply-To: <20260605092812.3495852-3-harendra.gautam@oss.qualcomm.com>
X-Cookie: Error in operator: add beer
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111408-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sirena.org.uk:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99AB364831C


--b1X1md/ZN8ejJPYF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2026 at 02:58:12PM +0530, Harendra Gautam wrote:
> Replace the private static asoc_qcom_of_xlate_dai_name() implementation
> in lpass-cpu.c with a thin wrapper that calls the new shared helper
> from common.c. This removes the duplicate implementation.
>=20
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>  sound/soc/qcom/lpass-cpu.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
>=20
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 242bc16da36d..35c2c8030024 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -18,6 +18,7 @@
>  #include <sound/soc-dai.h>
>  #include "lpass-lpaif-reg.h"
>  #include "lpass.h"
> +#include "common.h"

Did you double check that all users of LPASS select SND_SOC_QCOM_COMMON?

--b1X1md/ZN8ejJPYF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoiv0oACgkQJNaLcl1U
h9BG+Af/YWgAsr6+qjj9BjlZdwk0ihFG9UPb1RXBNLZETwsuMGaRiJV2h0inI288
2Qc1wcsUQ9YpfRPY7DWXBpzA85RqDwkGNVcHhX/CRfKJPKCBKc96E2XIY1NT0v6m
ennFkFS0cdrvDngy628LqRmPD2KZZVH8kEI6sHN9D2eESS8oMaAYK3jg2hTtvsI3
KogEUnGdKLHODr/V0y9Eye1P81IKmMdgpG4Q/V0T8/Ap2jSbKVIWerTP+6sxIEiB
T41DI1u8Re3KqrVa9e44A8tnJd7Q1ndNFQomE3M+tGRMIiAqIwuRWAfFk0momMez
qiJ+pOnX6j7nGSwEAtvWreocaRPMZQ==
=bhhY
-----END PGP SIGNATURE-----

--b1X1md/ZN8ejJPYF--

