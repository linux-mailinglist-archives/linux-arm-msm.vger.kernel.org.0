Return-Path: <linux-arm-msm+bounces-105091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CWhM5M/8WmhfAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 01:15:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5FF48CEB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 01:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D7F1301074F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 23:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7703A280A56;
	Tue, 28 Apr 2026 23:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCUlifMw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E2C175A9F;
	Tue, 28 Apr 2026 23:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777418124; cv=none; b=Dt7+q6CEDgzIP6hMl6SQPCG+MRrkZzXbMOiB3Atg2tHFXhQjI7gqfzBuhFq7w3jbMuBVGZXgvqv12T7A+bPFavVu29bDWVS/4tq16c75yP4ciyiBb4w6VYCo2EzhC2AHH8KBRSSlX6IXdoOTv/lKFFdAmvunQaRNRgBwfLyiCWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777418124; c=relaxed/simple;
	bh=UlYcsucEzjx+Eqrd9MZtYe9uj9lik5EBIhbGUNQbSv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mH9eE0oHuao5+/stInOaaRR+p2y/Co/MvRIL29luARYaRljeDT5bFiPwLI6uaGGra2qgGH5G3NqI62WKKXbHwbQAiVN6krSll8vJvrIurV8Gu3UFeLxcRXKAxi1EYgMSeQqy50JTDea5sgf9+uBEd3vl7qAYjSpIM7iKI8WgFv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCUlifMw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1A8C2BCAF;
	Tue, 28 Apr 2026 23:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777418124;
	bh=UlYcsucEzjx+Eqrd9MZtYe9uj9lik5EBIhbGUNQbSv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nCUlifMw8PmCjUreG+4npAtShT5wYKFzV3YLQRd2+NP9INDbJ77N+X9YbZZVNgtnm
	 D1iRnR8dVorte0F8d34dmQtq4Rf3xXiLYVSuTxnaX3PnA9+lY33q3UGZQKAZ4Cao+F
	 2tZWOI+WxFEx0Of73W6urhHwit8IFtq5d0o/Nq2Vh3Zmzw8ZjKT0dGUVCrJ/z/tSw7
	 Ir3DIVyOKgWh17sq119NNkIrIAwdaqtzsqRb93qyUCHIohxU6ma49NWm3ULdJ6T2r9
	 ZKcW4Bno6O1WNjXt8zwh5cLdCsfAVe4mIJSqjKhYQFypJL7KUF6+0uO39tS5RElVjl
	 jOWHiezaS01eg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5EDC41AC5842; Wed, 29 Apr 2026 00:15:20 +0100 (BST)
Date: Wed, 29 Apr 2026 08:15:20 +0900
From: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <afE_iAU9xdIzHA9x@sirena.co.uk>
References: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
 <20260420-read-rpmh-v3-v4-3-70c152e6c958@oss.qualcomm.com>
 <66f59c2f-f759-44b4-9639-d8845581ae9b@sirena.org.uk>
 <20260428213331.mwnybqlnognnrpfw@hu-kamalw-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p7fA9OI/lNe5FJN/"
Content-Disposition: inline
In-Reply-To: <20260428213331.mwnybqlnognnrpfw@hu-kamalw-hyd.qualcomm.com>
X-Cookie: Victory uber allies!
X-Rspamd-Queue-Id: DB5FF48CEB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105091-lists,linux-arm-msm=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sirena.co.uk:mid]


--p7fA9OI/lNe5FJN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2026 at 03:03:31AM +0530, Kamal Wadhwa wrote:

> To elaborate, till now for all chipsets using RPMH regulator driver, the boot
> time voltage setting would always be overwritten by `min-microvolts` by the
> framework. However, i found during the development of this patch that on some
> chipsets like SM8550, SM8660 etc for one or two rails there exists some
> misalignments between the bootloader voltage setting and the APPS side min/max
> voltage limits(subset of RPMH firmware min/max) where the voltage value is
> set lower or higher from the bootloader side compared to the DT min/max, which
> caused the regulator registeration failure and all the sibling regulators under
> the same pmic will also fail to register, even though issue was with only one
> regulator.

Why would this cause registration failures?  Bringing the voltage in
line with the constraints is a perfectly normal and fairly widely used
operation.

--p7fA9OI/lNe5FJN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnxP4cACgkQJNaLcl1U
h9BsWgf/a/4KnkdZmv8yMQ3LLHFwKIzB61Ku6/r1WZUxnQ7VjlR/zNmqYiuTZd7X
XJ7jZAGY5fW0C+9JluR3cHrsIV7MuooA9n1CJdhtbO4ebFY1VhxvY8E5bJLxN67/
+8RWZ1i7PzRM5B0hMm2mFuIS3NYTTvP5k1o+hv4LGm4YmcaJQm7+TPXzcjzSmvey
tIrByHWtuqn2rbJg7/8IoYCw8soPAy4dbSqQYiRRzap8yyBZkAkSvZTjzoJoQMla
t2EpeYALCO/Nv/RMcXzNGSzv7SBLpDjnM3obFPHlkEbAOrqCbPMIehMYyNxOxEmC
I4lXnlIj6sqI+KU6/UC56Mqzp4ECbA==
=2YhC
-----END PGP SIGNATURE-----

--p7fA9OI/lNe5FJN/--

