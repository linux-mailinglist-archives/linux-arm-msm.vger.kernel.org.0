Return-Path: <linux-arm-msm+bounces-90857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMntHiv2eGnYuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:30:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC09875C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C92313014126
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663D52F2604;
	Tue, 27 Jan 2026 17:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVU7uKg8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064652EC0AA;
	Tue, 27 Jan 2026 17:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534935; cv=none; b=BQs/BAKtzJfIF3KEGc/rDQx6xB4L+KfuWZbsF6nryvFszyqNu1/m733Dk0SwxakoNBQnkq4mPTG4nQLsoe60ZU0tNQFylENsbW25N203A4sLn6y2mo43lca5utQwwEM14HpXkaOX0TGbCoVagbSs842VL0py3+Z50T28c2/Ph3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534935; c=relaxed/simple;
	bh=pUhIeXNXO47D+yfxMFhlapJ4FP3FodrQm+zaLLKDIis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUbXGWHfpZYN0AR+bJHVznGkRbtvQjZbMTmFmH2hpws+imq3xx0OWhjhBDXj7VIj/vNo8vOiahYO+Mw8HmB0oMU72nbj7ZFGqKGxJlHPb5arhUiBZ/sEQtUOefPHF7fngPSmR9WDNr2qLMuLm4ICE8T8B8QtAhsGZpqnyBi7lFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVU7uKg8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574AFC116C6;
	Tue, 27 Jan 2026 17:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769534934;
	bh=pUhIeXNXO47D+yfxMFhlapJ4FP3FodrQm+zaLLKDIis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dVU7uKg8XZICzJnvLfzFFLXxOUVzBJGg+AdQFcKPWX7RO7Q9m79eFbg2InN3Ob9iF
	 maMH15yQPcWjgQJVdf6nbtA3j7CRL8BjkNFzzIQkEvLEGVieaYpbdZAtkm8CbFpkAl
	 /e4/xtWePjmsZZu4VQzIWO/UY5GGCRkj7iWwdYvY/gy1r9EWl4V+1i1lbha4LViAXJ
	 DGHthnGDVRfHymFFf1MbBUuwftkF6MDRFl/zSKXxkG4X3B+35wTrJMZFoZibCy8G9x
	 usdp37KkoxHAf35CmucBiO4q+os5krJk6FjHRnBE6hFE68MGzpa4VC7yKLo7lJhb3T
	 JBzIsdIwUAxTQ==
Date: Tue, 27 Jan 2026 17:28:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Saikiran <bjsaikiran@gmail.com>
Cc: lgirdwood@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom-rpmh: Add support for
 regulator-off-on-delay-us
Message-ID: <0e5babf1-b209-4c26-a528-bcfe2de84aed@sirena.org.uk>
References: <20260127172757.75221-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YaAvhQKtmSx64jMe"
Content-Disposition: inline
In-Reply-To: <20260127172757.75221-1-bjsaikiran@gmail.com>
X-Cookie: I brake for chezlogs!
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90857-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: D0FC09875C
X-Rspamd-Action: no action


--YaAvhQKtmSx64jMe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 10:57:56PM +0530, Saikiran wrote:
> This patch adds support for the generic `regulator-off-on-delay-us` prope=
rty
> to the Qualcomm RPMh regulator driver.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--YaAvhQKtmSx64jMe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml49dEACgkQJNaLcl1U
h9DX8gf/UUJpZ2bIQKvX0RFDF2y2UDCwK/Vtp94oQhw2tKLkAofQ+4+QVLqUXxYM
8WVTfKr1hE9vtI2fh2VtV/tIENgIaMyhAJ4A74YIZ+A0mbQJ/VI0bZub9zzIl616
M8w0InLVI9P/WhZST2b5T9DIfHYtFybsrY2Ai5V3LjFCs1cIg61sXJrSxuJYo7OE
Rh7s2IG6qRr3BzvNEu6oJaIKwgITISd+oZd+ldbquBQ8KtQ5yN1OFZItfJ2SadHS
0NYI3DoFgEXdky58K8+oVBCj/l3OjkB4JRdXtyko+6EymtQVq40GCGmrNljHPV/g
ph5WxDFMBD3Blu56tDO3YIdieYGSPQ==
=6iv2
-----END PGP SIGNATURE-----

--YaAvhQKtmSx64jMe--

