Return-Path: <linux-arm-msm+bounces-90998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCYoFmv5eWkE1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:56:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C84FDA0EAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ED3B3037895
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181D72BD5A8;
	Wed, 28 Jan 2026 11:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QU+JdHPH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B3A2D780C;
	Wed, 28 Jan 2026 11:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769601350; cv=none; b=UEFChVNW4gGvYivf+Wbd9CtGr5zAHyHSRwOg39AZfH2YBXG7UUAj96cAdcNI31kbENsmP6jDa47fAAkkDogmF4LDSgpCXbydnI+HD9FTi8YW7j/8FOFuIl5PuM5eXCrWjOcm0arvbX/T83LE+zhQ0iADbxbuEcCHRulsHB4CI6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769601350; c=relaxed/simple;
	bh=34aZamIF83OowIw1938+q3M3QygsN9fGADEEQ+pENY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNqEy/M7WJpF+wY/bWfAhgDRQryZfATXuCcDRihXTJLZWEeeG3vuRm5SsiswhGsrXE/xiqushWyMfKnrqm6TAwnoeSNs7r95zAPttMnZhhRSv9gfZ5IAuyCC5aaMN6tK8OtBxKmN88u35OovUK8lu8Pdtp5I/ZdZntJfQHxdPlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QU+JdHPH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDB3C4CEF1;
	Wed, 28 Jan 2026 11:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769601349;
	bh=34aZamIF83OowIw1938+q3M3QygsN9fGADEEQ+pENY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QU+JdHPHulKjyhyJuLmfwNR4u0cCnLsdP3/0QasLaauM89tjcFTjuPm3mx0cSQRoj
	 55KGNRVwf6soGUOjIKKJ2GPxBK0An0UcqJADDWZZOSNrxfrTPPT5wla/GdARVVZYXq
	 SaC2cp2YTHkD1sWfflinoYTTsaDHDcXXwfKksfMbPBTur7YzWagS4oLT+qJdP+Ip7W
	 vUid8PSD92ViZ4w/Bjz8xYX0TMEUw4m4rPqMnKh2byIGbgQ1+PoagXvVS2ce+IfZ94
	 V3wQ0I9G5N4wuJC9DGdBFECf9ZSf12ZER+v70RleCHTZdY2zrlUDacohbS30T0/ZfV
	 6wx/WslxKtWwA==
Date: Wed, 28 Jan 2026 11:55:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Saikiran B <bjsaikiran@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, lgirdwood@gmail.com,
	andersson@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] regulator: qcom-rpmh: Add support for
 regulator-off-on-delay-us
Message-ID: <93ea039d-c194-47e5-8a4e-975c144a1a25@sirena.org.uk>
References: <20260127173736.82976-1-bjsaikiran@gmail.com>
 <663cfee5-ea40-4990-9391-3b12d9279cea@oss.qualcomm.com>
 <CAAFDt1tuod0GUepTuKYN3xM1pGHTLt0tkpQpE1=ySGBsNsoiFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EvnU0qWarBDjai2s"
Content-Disposition: inline
In-Reply-To: <CAAFDt1tuod0GUepTuKYN3xM1pGHTLt0tkpQpE1=ySGBsNsoiFA@mail.gmail.com>
X-Cookie: I brake for chezlogs!
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-90998-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,10.30.226.201:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C84FDA0EAA
X-Rspamd-Action: no action


--EvnU0qWarBDjai2s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2026 at 05:04:36PM +0530, Saikiran B wrote:

> The `off_on_delay` field resides in `struct regulator_desc`. For most
> regulator drivers, this structure is `static const` (immutable) as it describes
> fixed silicon characteristics. Generic parsing code in `of_regulator.c`
> cannot blindly write to `desc->off_on_delay` without risking a write to
> read-only memory.

Your reading there is right, generally the expectation was that this
should be a property of the regulator rather than the system.  This case
seems pretty unusual thus far but perhaps we'll see more such cases in
future and should move the property but for now having it enabled per
driver seems safer.

> The `qcom-rpmh-regulator` driver is unique in that it allocates
> `vreg->rdesc` dynamically at runtime, which allows us to safely populate
> this field from DT.

> To support this generically in `of_regulator.c`, we would likely need to
> introduce `off_on_delay` into `struct regulator_constraints` instead,
> and then update the core regulator handling to check both sources.

Yes, indeed - if we were supporting the property completely generically
we'd just not have the driver fill in in the information and store the
actual value used separately with the DT property overriding the driver
value (possibly only if it was larger).

--EvnU0qWarBDjai2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml5+UEACgkQJNaLcl1U
h9C1Bgf9GsmelQul9Oft/EASpQxDYrATYTNEWkg18S9aHN4Km2ymGi8ypIiL5aHg
kP5msBrE1Bw+gYqQfY1tkJrQtO4yVbyHzr+MoKnZwX0nFrhYxS0rsdmiMLUBudmR
kRFExKhTaWunv89lxjZIUM/QMStvPwFJjKx665D3oYkekaiQwsykYc5PRkiI3bvs
UBPAgCO248MU2/v/moTowJth4sRe28KDI1+5KZvajuO6Wi38mLkUxA0FJsAe2Hys
Id55R2vu7akjuuJd3m9eHMBtIbFD19iWhkbgFQQ3AbeHIk/Q5b0RIxeK+6Txlnqc
iNfbToz2nquyMcyxroIXS4Di72s8Hw==
=bTDv
-----END PGP SIGNATURE-----

--EvnU0qWarBDjai2s--

