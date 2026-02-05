Return-Path: <linux-arm-msm+bounces-91963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEsIB5jXhGlo5gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:47:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB594F624C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E95FC3005E96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 17:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FC22FFFBE;
	Thu,  5 Feb 2026 17:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tviH4W/X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3792FD694;
	Thu,  5 Feb 2026 17:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770313599; cv=none; b=AjNELhYkQD6aB15Q02eUgaeLyOGsby6Ol65oTquMrQpPO28+ETs7g6rNQFp9MOiy4TAU5wE5FogGfv7F2Q1uG5gZLtxEXb7Tef3FqNdZ8el0B59lL0UgKZjB62a0Lkwt4n1038tGQFL1lTQtflnwTC9r7bMQomSsFUNnv04u1WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770313599; c=relaxed/simple;
	bh=7aSaaOD1wAyXzpiKz5g41lBowXvkYDhSHVoGvS6fwi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HimwUBGv8vCoFc3jMBcAKK8mCdGApxcOAbROgTcC5XIGG0z3GwCfad6HptlQLkkpBqnFEG9vMp9xinq9VZTiz/K8V/G8LX/e4epKPKuTcnTAKcCm2VM52fX2tvBmSzKFCvfE9iuffdP7lFJtPjRWGEQiwWTUUP9aHTAXBN4zS9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tviH4W/X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC66C4CEF7;
	Thu,  5 Feb 2026 17:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770313598;
	bh=7aSaaOD1wAyXzpiKz5g41lBowXvkYDhSHVoGvS6fwi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tviH4W/XnR2jjICYwA1lADtCmaHEIMH67SSdc84JAJuewl5zJcDBmoONOAIMQjlSF
	 v/M/moWb69dmJE2tFaIs2tx4NVOlRAeqyLE+BQp0glLFUrEHU6Ah44/YVlO9lW8eOC
	 20VTHoxdGqu5+2+wzF2JOZDZ3nNWd36fw038i2NuyMN4CLrhCRgNEyInZbyBNsdNP2
	 ovQTW+gRIFCpFG1077Cdn2p+fNRcTze4RIkzukeqzRAk5NW/9IyjE4aNEIqzqRUweH
	 TXCiBps/SK5nUtDr4RoqTnsXMjlfq3Kwqy342LcBQtXdIdy/25a4Z99zI7eIKg50ix
	 JNvYUo6FsU7Ew==
Date: Thu, 5 Feb 2026 17:46:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, srini@kernel.org, perex@perex.cz,
	tiwai@suse.com, alexey.klimov@linaro.org,
	mohammad.rafi.shaik@oss.qualcomm.com, quic_wcheng@quicinc.com,
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Stable@vger.kernel.org
Subject: Re: [PATCH 01/10] ASoC: qcom: q6apm: fix array out of bounds on
 lpass ports
Message-ID: <a8706da6-20fb-456e-a428-4c7b2c5bc26b@sirena.org.uk>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JjPNQsqvp/h1upzL"
Content-Disposition: inline
In-Reply-To: <20260205171411.34908-2-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Non-sequiturs make me eat lampshades.
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91963-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: DB594F624C
X-Rspamd-Action: no action


--JjPNQsqvp/h1upzL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 05, 2026 at 12:14:02PM -0500, Srinivas Kandagatla wrote:
> lpass ports numbers have been added but the apm driver never got updated
> with new max port value that it uses to store dai specific data.
>=20
> This will result in array out of bounds and weird driver behaviour.
> Fix this by adding a new LPASS_MAX_PORT which is can be used by driver
> instead of using number and any new port additional can only be done in
> one place, which should avoid these type of mistakes in future.

It would probably be good to improve the valdiation in the driver when
it starts using port numbers.

--JjPNQsqvp/h1upzL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmE13cACgkQJNaLcl1U
h9ATEQf/UngOgVnrXCDhmOJZtvNHZOS7HDTpZxoMsAtt3rPrvHjc4RKJDTXBZO8l
iP8KUwPvKjfI12cQykbMAhBBNsbsQbKCdsZUD+1XnjJqlVg2tQdn0IqGSNGsUuBU
SckANvagdMprhVxYw7l4iu7ubZSjI/zrBc4TP2vqsdnvVeKXE+hFP1q3PSeszhoj
9SbR7+jMH8vks6UHMNoBb9BIhD0/8nSrxu+z+iIzwwSBYpq1LbZW+lW8PjwI9dTk
IgUu371hrv4nAQ1ynToK2KnGbLX47smvexDLUjXLCGRry8NMZluIq9vVfyIbAvxg
Nwat89cmz6f9FprXSKdzhmFqIY7uoA==
=oxM2
-----END PGP SIGNATURE-----

--JjPNQsqvp/h1upzL--

