Return-Path: <linux-arm-msm+bounces-103988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFPBGEnp52nGCgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 23:16:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CA343FB31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 23:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7D213045276
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 21:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A0C37DE84;
	Tue, 21 Apr 2026 21:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdV+7tP7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B23362156;
	Tue, 21 Apr 2026 21:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776806212; cv=none; b=WRauJZtsNQkEz4AFCfwp/Qk7S22AOPgUeiz9V+UHvRjCOgNKXl8AT2e11P2CmAsuD9s22VST9msHir2pXmrcXYJMAtA1VKBhLyzOCX4ZXzhwQCbfY3Ct5IwOagriW/8NqJj2qWT3OfLNLEW04BQLM8bQ539kLKlP/v0yvhnoqVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776806212; c=relaxed/simple;
	bh=vRFrBCyS12ZK2We0LSqEz5+dlFxdZefS4a2zrdylNd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iws9maT0AafHO0j+b5QbSzEPsgrDILJJpuuEUJBRO3E+LVdfh7VcW37eW0W7Gtq1BHNwwt/+UbtQrRkRYz/1i6qr+01WKadG6ZGSYjYGajlLr5AQ6ALoi+hha8xmScYZUERm+n12WexMVOcG6bdt1T0nVcp1B8SpamRYtIsu+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdV+7tP7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0652BC2BCB0;
	Tue, 21 Apr 2026 21:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776806212;
	bh=vRFrBCyS12ZK2We0LSqEz5+dlFxdZefS4a2zrdylNd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdV+7tP7o8nV2r534L9CdkkP0XhX8sQgoeYzpd2q+/B6+8ioPXSNIOuZW7NpoPyQm
	 5Ro6g0EDRCvQOkci1SXMbPcCVf1nJyQ9azyZn4oEj2S6XL7dpPSp8Ae86/qWJe3Ymv
	 Zpeq4+/pUxVt8cTSFcYzkvol6lz8YO+Mx9dzmcNYtAYyjToZtqlMUpvwWD7fswjCm2
	 Pxx6nXXm0HiQbfi4ajZmMLC4vJCBTAoVk4NFzopbf1G4MsOVdxUxnMKpZ+Q8G55BmM
	 G4idO1q12OHudCae49t+waBJfUcIeSLhIi3HWqmhn7Mk7RDjQOHrcem5rG288+es2t
	 mfTBpF0mTzhFA==
Date: Tue, 21 Apr 2026 22:16:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <66f59c2f-f759-44b4-9639-d8845581ae9b@sirena.org.uk>
References: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
 <20260420-read-rpmh-v3-v4-3-70c152e6c958@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Iha+hpkMpV0+LM2D"
Content-Disposition: inline
In-Reply-To: <20260420-read-rpmh-v3-v4-3-70c152e6c958@oss.qualcomm.com>
X-Cookie: Jenkinson's Law:
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103988-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: D3CA343FB31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--Iha+hpkMpV0+LM2D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2026 at 09:13:40PM +0530, Kamal Wadhwa wrote:
> Currently, during regulator registration, regulator framework sends an
> unnecessary `min-microvolts` request for the rpmh-regulator device. This
> happens because in current design, we do not have a way to readback the
> voltage settings that was set during the bootloader stage.

> +static int _rpmh_regulator_vrm_get_voltage(struct regulator_dev *rdev, int *uV)
> +{
> +	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
> +	struct tcs_cmd cmd = {
> +		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_VOLTAGE,
> +	};
> +	int min_uV = rdev->constraints->min_uV;
> +	int max_uV = rdev->constraints->max_uV;
> +	int ret, _uV = 0;
> +
> +	ret = rpmh_regulator_read_data(vreg, &cmd);
> +	if (!ret)
> +		_uV = (cmd.data & RPMH_REGULATOR_VOLTAGE_MASK) * 1000;
> +	else
> +		dev_err(vreg->dev, "failed to read VOLTAGE ret = %d\n", ret);
> +
> +	if (!_uV || (_uV >= min_uV && _uV <= max_uV))
> +		*uV = _uV;
> +	else
> +		dev_err(vreg->dev, "read voltage %d is out-of-range[%d:%d]\n",
> +						_uV, min_uV, max_uV);
> +
> +	return ret;
> +}

Why are we constraining the reported voltage?  The hardware may have a
value that's outside of our constraints, we should report that if it's
the case.

--Iha+hpkMpV0+LM2D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnn6T8ACgkQJNaLcl1U
h9BI8Qf/U7uFbt9f43EOI9JRyr+uUtNFnsojBfeYyqctFDsOhYLoc+jCF+ByYuIW
4UZ/wW0Eqvl4DnyZHL7+7M+L6Kyu1eFbsh8kkV91RyLeGxz0sBLGzOVQRyXf2x1+
yc9vfaqdoqGlvSda+6WRiVxaOEn/7qBL4s7cAXGtkAr+UqXO5dDXDir0p3QazSnb
8pcxiQdbCub8Z2YG7VI+Hkb45KyE6LCZhySAGzigcucFTdFkwlqBpsZ8HBEDy1o2
8W7+PAilScuWq53QuxBS7hD8j2LaIU1Et7XDM8nrlsuJMABtcMiVnEi1bAA0GZ+7
+pN8yI1afdN5HSTq1XCNdGiAU1mpOw==
=p0yz
-----END PGP SIGNATURE-----

--Iha+hpkMpV0+LM2D--

