Return-Path: <linux-arm-msm+bounces-109322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB32EXNcEGqDWgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:38:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8865B54F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E35A1303251A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B847E3B19B2;
	Fri, 22 May 2026 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ox3nWW0C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E147E3B19B9;
	Fri, 22 May 2026 13:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456285; cv=none; b=rNWXIJ0oKAeKYANo2GrflhptvHHatoVMXvmWJJXI9mnSt3a3dhoBPMdy6f0Bf+HCT4sYeeakb7riLznZ9hKkNBi7hWEME218kIX5CWHRVUJKjkLu+GO+giuPsQEdzEzZfiwOWmQlbbNXCGwYQVWpPNp85Si7LmPiyppPnCc8VmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456285; c=relaxed/simple;
	bh=NViGqmMehOu4Fdx2T+mDqdKwN1eY4uewYXT43w4woek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUEzB/0je8a5vXvZw64kmhrDD+vQsc4VR4aIRenLPBKBTxAX1oWTzOkk4f68Uydm+xxMZZPHpoii3HIjx/aLABgmZnzVhyv2r44r1LhFoHkCLgj+TQy5z05gWCqb1+1UBD6yQSa6vHL36RPQqCHbmyyikrHSuZS/hge1efH+5Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ox3nWW0C; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99A81F00A3F;
	Fri, 22 May 2026 13:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779456283;
	bh=NViGqmMehOu4Fdx2T+mDqdKwN1eY4uewYXT43w4woek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ox3nWW0CQhEaHLQweVaRpnw+nUlPnV2PczMabby5nzcJxZ6jZcYiuZHfAj+PzfkAf
	 jHDA6K3ect8E3N1ztebsT/BB+R2UOhjLvim9xOYhJcrMXAYng0SH0hLyIjYCOYIi+s
	 vBfbvk0E2qXmMlVHl7atlsB4HJFEgKlWSryGgO0TZm4up5EYlBn11PVO80kisWewm5
	 zJQPodVDv7kTYcz+L4OhD/tNwoGkEK9nqjCTKeYMegVFiJsw+cPknmD5ZT4uLP6K91
	 WSGVHffX6WMFxqYs9arrjz11ETP+5hKOTIHAB5x3H5w5eKpRL/3O/Qfl12+ZRxfMgb
	 5duns4869JHsA==
Date: Fri, 22 May 2026 14:24:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH v5 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM
 clock framework
Message-ID: <de8a82f6-d044-4d84-9266-c44a9288ad9e@sirena.org.uk>
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hKnDXr9miPmVzypq"
Content-Disposition: inline
In-Reply-To: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
X-Cookie: Celebrity voices impersonated.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109322-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1D8865B54F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--hKnDXr9miPmVzypq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 22, 2026 at 06:34:39PM +0530, Ajay Kumar Nandam wrote:
> This series converts LPASS WSA and VA macro codec drivers to the PM
> clock framework for runtime PM clock handling.

This doesn't apply against current code, please check and resend.

--hKnDXr9miPmVzypq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQWRYACgkQJNaLcl1U
h9AYTQf/WLMqT2y5fq1zlLzi5XD5IBFLGRU/34otSPNOhx8KZxdq9uPLis1AMw7g
/2LXvrLGfN0TmjklrqrBcaDj7qRvb6XkrdCANhaaHHyEZgQdisYbOXlt3ygXe8TX
qdNAeZDe/V2qTrU26DpQkPRUEYCB5xGX/o/USiVwd4PvPp7twTR3I1R0JLzqxaf2
xvgQeLo48hDUcGaGzpLMxRTagU10QXyx4olzCdNcyAmFGmtNVyPEr6Fct8Mcre3Y
m2pZ5wqbitQ/rH95ceXtgjhljV3bK0GRpDbHOH5o76rm0x+Fx7gw0SGBCE4AfmKI
4t04gHdAnoBDXTC8Nl7m0izk4narOA==
=LK5G
-----END PGP SIGNATURE-----

--hKnDXr9miPmVzypq--

