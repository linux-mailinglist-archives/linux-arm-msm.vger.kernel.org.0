Return-Path: <linux-arm-msm+bounces-118064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mezaG6bOT2qCogIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 18:39:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA6E7338A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 18:39:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h1l6aSUf;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118064-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118064-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B3F0301A1D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 16:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A74F395ADA;
	Thu,  9 Jul 2026 16:35:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A08F390CB0;
	Thu,  9 Jul 2026 16:35:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783614940; cv=none; b=rqPtiNhsN6t3q2Yb+2bKAbMAq87vPWGLSXoxFMh3R4hABaKbraM/nvPgbNJzJOtv/08DHBUoqMiFl/+Zu5/FUQMcbXYQsAS7t3dYrAn/Dn4qOUZ9Lqdk9+ANuqKBfZIMtkrEV7JBPr2aQHtxg/CAmtmpFrlOuh0ILvlaj5GcneE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783614940; c=relaxed/simple;
	bh=iahyZO8yt7inHDJOZwiAuyni0ivzQOcObgx8Hy+Ip5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dODhO8hY4EFrzqeK32arcLRxjIFiKcQB/YGFGw7vrZCrA4DfFfbZfFLDq5Id4RJy/mJZX4xIrgrJyb3PAO0+p+bmMWYCWf2mb0nRiRjntH+5TENU3Gd84vegScS7UHYYL9pdHAH3SHs7wDD5HUP/11glG54tg+adGms/ZTUX/lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1l6aSUf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A961F000E9;
	Thu,  9 Jul 2026 16:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783614938;
	bh=wp0SjaGsdvnfDHiH8f5lQXW/07dC1qRizb535kWTjkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h1l6aSUfvjXwNYq4IRMTWRuIv14MB7aVXWzrpPtOr/TQe9v3Urd3nXoVrbUS95who
	 /WuL59v9qW9UJDZVkSw6nGQ85IuNdIf1gwbq0zSFsw24y8T/+DFQo/buuaFAjbxhXq
	 BqbOeACuVkCy8ty5f0edcSQcHQB6IudDy+6jqHrur6qoQX0aaEuXBiXHxn4qJa+Ehe
	 IJz4qkahnJ7n2MW51x9w6DL42xDZ3Qg5yJZMbrym3O6KSs0ORPU8Ua+qy+P75Zo+Ed
	 +I/1HohdCAxogibCjafDr1qFGAKMitQWUlA/YFDiysym06YzhMndNlNet/IhF3udnS
	 lSXyUIiHSjhtQ==
Date: Thu, 9 Jul 2026 17:35:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Dilip Kota <dkota@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
	Girish Mahadevan <girishm@codeaurora.org>,
	Alok Chauhan <alokc@codeaurora.org>,
	bjorn.andersson@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Douglas Anderson <dianders@chromium.org>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com,
	jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v3 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
Message-ID: <ae915278-2f21-4bd0-8651-d2e02ac04aae@sirena.org.uk>
References: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
 <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-1-92feb5a7b926@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uYrCtBKQ/dx3Ks3K"
Content-Disposition: inline
In-Reply-To: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-1-92feb5a7b926@oss.qualcomm.com>
X-Cookie: MS-DOS must die!
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-118064-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
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
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BAA6E7338A5


--uYrCtBKQ/dx3Ks3K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2026 at 02:23:09PM +0530, Praveen Talari wrote:
> When a runtime resume callback returns an error, rpm_callback() sets
> power.runtime_error on the device.  This causes all subsequent calls to
> rpm_resume() to return -EINVAL immediately at the top of the function
> without invoking the callback again, making the failure permanent until
> runtime PM is explicitly re-initialized.
>=20
> Unlike suspend failures, resume failures should be retryable.  If a
> device's resume callback fails, there is no reason to permanently block
> future resume attempts on that device and all of its consumers.

runtime_pm.rst still says

  * If the resume callback returns an error code, the PM core regards this =
as a
    fatal error and will refuse to run the helper functions described in Se=
ction
    4 for the device, until its status is directly set to either 'active', =
or
    'suspended' (by means of special helper functions provided by the PM co=
re
    for this purpose).

which needs an update now?

--uYrCtBKQ/dx3Ks3K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPzdMACgkQJNaLcl1U
h9AMFAf+NGU1P4cl8Y33FJqK69wy7JIowKhjqW1nYtD+czOFwyZVz8FuRcjty0Pq
kJG36hB9PBNlOMjLcEH59jrZiwf+49gVbD//Yb668oaYdJD220ct2l8bMEXwS+qD
1AAwzpSoy9OBbNGXsoHgEggY7r+NFPbCmCoCueUwuGnz8cLq4MtgRze8UW5jE/5+
w/gwKqYYenYJH7Y+n4YtoIQ57XLbxORswZJZdtgyzLlck0hLVaDxuiN8b05D2CwT
SQ/z+zZxYm/K6+SOu940Myk0gEyNNgHsUJSAAWwEV4GQTcYIHCvhS1w+JgoWaOAZ
OoUNLjahcXA8nfm/5n/27jXCCo7s7A==
=p7xW
-----END PGP SIGNATURE-----

--uYrCtBKQ/dx3Ks3K--

