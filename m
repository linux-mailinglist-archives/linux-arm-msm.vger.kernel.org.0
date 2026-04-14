Return-Path: <linux-arm-msm+bounces-103135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLOhLVUu3mnxogkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:08:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B35F3F9CD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91ABF305F3F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE023E5ECB;
	Tue, 14 Apr 2026 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhevKREP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DF2346ACE;
	Tue, 14 Apr 2026 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776168149; cv=none; b=GmDLHoTasdv2DuamS49KqcE1wUQcWnaLvkPAPoVaifFh/TNo06ynpc8HEfKZ+mrEkTtV0RbcuLx8UUjt9+cmp1I8lrNlPp4ES/vDqVWNlU3NuftVkIzWSiddVdtWK0JY+D5Yd7Fp4MyH5JUY3ywOzEJu21dxiN2Mh5+Awsn79uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776168149; c=relaxed/simple;
	bh=SfcjDYeeXoyYYji47Z//FYorFu+vBmbxMKw+b8k3cII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfLYskM1iEwQQKJaLxyUwE9O4nFTkCJDcxQk2UT/2z6+TcJqTCRIYpELuMk7n4PAd0DpRBxf9IeC/xa5yXW8Vgwx/50fwx2hSncwQDvJ83bKSDTIi23tbaF9oIUx8QD6X+8TtC6eXNxnHN0LBrj9lQSaM97zQ7uRLOOOOZgdRiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhevKREP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7F1C19425;
	Tue, 14 Apr 2026 12:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776168149;
	bh=SfcjDYeeXoyYYji47Z//FYorFu+vBmbxMKw+b8k3cII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NhevKREPWNWs//X4pYThP92dDmIsDvdX31jdjWTwzfh3YITxGurDYAq1A+73xchxh
	 LHcREe/pmjrjcymdkNrIAfboi0CHtp8qJJwhDON394zbDGEZW0XHMmE2PR1rmi0UdX
	 5YUUo21bVFdiPcC0ZFN47y7mbtp4AGo7szxe6fnozUjkXJ+M+GYar/HKqZwugfHMEP
	 W0XElRN+h7GEFgOAF+Zwgu9OOt2S8vgLBhuNCcm4DlOUir+6wMt83UZldduYIt/uaB
	 O+HKgimhIEBlUwePDoiq8V9W3866f4kxvBRoK6ObhvsfbuxiO6dMKSJo+mnUwNQUK7
	 urloUBP84XnDg==
Date: Tue, 14 Apr 2026 13:02:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: Re: [PATCH v1 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
Message-ID: <05ec7d33-1dd5-4e67-9c88-03e39e02c39a@sirena.org.uk>
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
 <20260413121824.375473-2-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F9AoMBOK5HGw6XGu"
Content-Disposition: inline
In-Reply-To: <20260413121824.375473-2-ajay.nandam@oss.qualcomm.com>
X-Cookie: Academicians care, that's who.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103135-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
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
X-Rspamd-Queue-Id: 1B35F3F9CD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--F9AoMBOK5HGw6XGu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 05:48:22PM +0530, Ajay Kumar Nandam wrote:

> @@ -2868,34 +2846,12 @@ static int wsa_macro_runtime_resume(struct device=
 *dev)

> +	ret =3D pm_clk_resume(dev);
> +	if (ret)
> +		return ret;
> =20
> -	return ret;
> +	return regcache_sync(wsa->regmap);
>  }

This doesn't unwind the clock resume of the regcache sync fails.

--F9AoMBOK5HGw6XGu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmneLM8ACgkQJNaLcl1U
h9CJ0gf+MuiZlx+vtY+TJNl98wQ8IAV3lxxKabGen2G2TL2O4661cbvhRKTq/ZIf
Ima8mZ55UfPhXAEEVJIaSdpmrzDXT41A7OQ+zcdzl0NhbupfHKqThvX7lDsFxWEI
+qln6H0R5cmbnG/82e5d/iBhWVSpVoRfXrsP8rjNdai4PyjnagEbliqv8VybjwC3
jJ0KoUlyzdCJDS8VTC0sxg4Lvgi7Fs/JMmibRKVJxRRG9PXhcgF2q3UjlyonH2DR
ffz3Uv8mS8dbdHTuXdBeS3mow8q4U/Um9hllka1pU/CTM5a0YGFDibi+4QLAwqRv
a6FfL223uolvnmyo8pCVbnGGq4pdKg==
=CT/K
-----END PGP SIGNATURE-----

--F9AoMBOK5HGw6XGu--

