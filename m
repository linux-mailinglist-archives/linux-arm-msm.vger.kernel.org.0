Return-Path: <linux-arm-msm+bounces-91037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHdEIN0YemlS2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:10:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B49AEA2865
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 179D330B4519
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95888238C29;
	Wed, 28 Jan 2026 14:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sOPbF4VN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8C421ADC7;
	Wed, 28 Jan 2026 14:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609056; cv=none; b=QipRjaVe85axLrVPKRF8CYg+DE6zbeRdfU//VyiPL9h8LDASJ6uuuf/5KqGfDsNZ4RwfV/EWnAkWJU+jzxjEcYfrFIGW3vn+VfmuGMjwAxoWxKGdgY7xJI2L4m5vAjvhWPl7u7tcYJpnEgAD3XhMJ1BcHwBKHwW4TDvJTkkXdgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609056; c=relaxed/simple;
	bh=ZfKYnvTRtjEaSYouGY88nwRB8MGD9bPCQyWiKtu1aMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d39fm4/34P7JwqaDlzffHdXes/TgipeR6oHfhQjz8eZ1QEaPId8uQJ2RBkTzP3wymmSZF53Q+NsVzHnY7jB6AAzU8roDUMS0pUpxBn8OASxpNwd7HggcZwMmrmOI0PVaUQO9aNIvDfcL4cLB/N+AQLlNm8wlsELO885FuDNGBc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sOPbF4VN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A34C16AAE;
	Wed, 28 Jan 2026 14:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769609055;
	bh=ZfKYnvTRtjEaSYouGY88nwRB8MGD9bPCQyWiKtu1aMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sOPbF4VNJR5XucUna2ULZAY6mnkZY4mK9oSFasZMPMHHWMkkytCIrIWRhubJdG6zw
	 TNXouUgHlg86o5We4sjIr+ITNkoCge9zyKnorK1uu7AeA6GM/QOl/g/pF/eT1soemr
	 BmdZ9W94RjvM94v9cUrvmcQPrvoVf3UaW0bvhFYhHp5VzOb5Q5hg8voEmrZ8vULSzW
	 DKcSKSuv/Tfoc2/Hm98DueOaqDL2w8g6YezzNYBqmajQcx7fWSUOsSsEXu8TJIk6w0
	 oC6sSwzaG+B28xznqyHYGLuqCS9DKcueWrH4Ex2TzjJr4M8KZcjz8Tp74e3VkljIFL
	 QFkTiA4GePeGA==
Date: Wed, 28 Jan 2026 14:04:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Saikiran B <bjsaikiran@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, lgirdwood@gmail.com,
	andersson@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] regulator: qcom-rpmh: Add support for
 regulator-off-on-delay-us
Message-ID: <62a844ac-c2b8-4791-bd3c-555993ccdcd7@sirena.org.uk>
References: <20260127173736.82976-1-bjsaikiran@gmail.com>
 <663cfee5-ea40-4990-9391-3b12d9279cea@oss.qualcomm.com>
 <CAAFDt1tuod0GUepTuKYN3xM1pGHTLt0tkpQpE1=ySGBsNsoiFA@mail.gmail.com>
 <93ea039d-c194-47e5-8a4e-975c144a1a25@sirena.org.uk>
 <CAAFDt1vPGS9EFqQHdwSWm9G1NUC-71+-EFuFG_diksJy0=87Zw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RyPhZAAtVwouQEmE"
Content-Disposition: inline
In-Reply-To: <CAAFDt1vPGS9EFqQHdwSWm9G1NUC-71+-EFuFG_diksJy0=87Zw@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-91037-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: B49AEA2865
X-Rspamd-Action: no action


--RyPhZAAtVwouQEmE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2026 at 07:29:34PM +0530, Saikiran B wrote:

> However, to address the root cause of the camera brownout once and for all,
> I am now investigating porting the Active Discharge logic (sending specific
> voltage/mode resource commands) from similar Qualcomm sister boards into
> `qcom-rpmh-regulator`.

> That would be the superior hardware solution, eliminating the need for
> arbitrary delays. Since that involves complex RPMh resource handling and
> reverse-engineering the specific commands for this PMIC, it will take some
> time to implement and validate.

> I will hold off on pursuing this delay patch further until I have exhausted
> the Active Discharge path.

Yes, active discharge would definitely be a better solution.

--RyPhZAAtVwouQEmE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6F1sACgkQJNaLcl1U
h9D0Swf/aEtMGUKlyIeMwChJev2/ruoZfJUecisVNCZyX+reDl+RE2SSbmEusvuT
cOBOzZ7fh5U5/7lAYA0qWsa3pFK/u59zICELOzjLnQlXZf0208nVscVIY1JSTHeJ
o2VTnEhroxW1FMHiHOSwwrCV7TaJO8qDYUTu67cGRGE4yTKvlBqhJNN44PC751Qr
WFyZjwHSn0f2f1a6R9uAuHaEhZ30OxKeKElu0wmFRiobZEJpWRig6EhH3p+ufXVr
J+b2TtomA/RZncs0hSZDW6dJjeE42qsyS0WRUkD21Eu0G2XjXaClGKeTGlBMbqJZ
OmEoNney65J+TfZoYB70iYEHbUWJZA==
=sUfr
-----END PGP SIGNATURE-----

--RyPhZAAtVwouQEmE--

