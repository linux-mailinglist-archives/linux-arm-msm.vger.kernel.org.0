Return-Path: <linux-arm-msm+bounces-47773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4E7A32A37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 16:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04FB2188268D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 15:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EFB211719;
	Wed, 12 Feb 2025 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuUSBtcW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBEF1D5143;
	Wed, 12 Feb 2025 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739374658; cv=none; b=CL23Zt1UTXm4yfKSEnLas+DEcd19phdFlKp0nieojVpJNQu2ycRbg5xqEJbkCbpMVQEZO2PHcfDlPkPeqgsEcs06QOBjbwXqMb5M6wxBL+2J3UEjntfazmU+T/9HsexhH2sQDkl4uh0ZWK6HPnCBXlXwsydP8weneubS6WXfkeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739374658; c=relaxed/simple;
	bh=Mp+loeJy8C1CnnHReTgguyOeqprVhRCyg7cNVb54OJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlekI3X7HWiP795eEwW11xgNJ2Djh0KjgzmqFEO+3Umgq60WaKwFTaCQTWVQwDZZrSueXRrclRFY6mwF3YMhoM0aHaHKrtjiZenFwc/H8q1TM7kPpsTMpDFGnUC3PEitjS79pwfxRT6QP4kqhGNPzp4vx8fS7WpT94Pt51WlG0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuUSBtcW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DA7C4CEDF;
	Wed, 12 Feb 2025 15:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739374657;
	bh=Mp+loeJy8C1CnnHReTgguyOeqprVhRCyg7cNVb54OJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nuUSBtcWan08Ot2EVIJqpfzceK+OrFqWJrGP2mnNWbz9JfIhaBkpQBY+zVneMySpv
	 hl7zNpF6rsE7y9GGybMBH0XID5vajFEi0HlVjhvvs0jPMmOWsvDBDR8Zk9Rwn5HLRx
	 X4BYM++zBp74PgLp0sttEPNYYvwWEUhJgUBhLNuxNbb+PcVk42UQSz8ujIASJz2Rnz
	 uObo6cesU5ph9ucnktYWRs3y2qcKojl9pCRFABy09ZFrfgQ2V9VOL1NZN/yIpWb4Q7
	 czHdqZmWKSZ439JXV2B/Wrh1tehfbpdgUvUyXHFcAAPokuuf+YEnQ3XyP5j4trz9BD
	 F8oJ+qMl9m+Qg==
Date: Wed, 12 Feb 2025 15:37:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: "James A. MacInnes" <james.a.macinnes@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, quic_wcheng@quicinc.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com
Subject: Re: [PATCH 2/3] regulator: qcom_usb_vbus: Add support for PMI8998
 VBUS
Message-ID: <8ec05fd8-1623-457f-a3b5-1095acd62cf7@sirena.org.uk>
References: <20250212010744.2554574-1-james.a.macinnes@gmail.com>
 <20250212010744.2554574-3-james.a.macinnes@gmail.com>
 <fcf907a5-9fb7-4988-a30a-a555740ca817@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0XPpq4pkgaUzCvXA"
Content-Disposition: inline
In-Reply-To: <fcf907a5-9fb7-4988-a30a-a555740ca817@linaro.org>
X-Cookie: Reality does not exist -- yet.


--0XPpq4pkgaUzCvXA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2025 at 03:29:54PM +0000, Caleb Connolly wrote:

> I would suggest implementing a proper .is_enabled op to poll the status
> register for OTG_STATE_ENABLED and configuring

No, that would be buggy.  Implement a get_status() operation if the
device can report status.  is_enabled() should report what the driver
asked for.

--0XPpq4pkgaUzCvXA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeswDsACgkQJNaLcl1U
h9BhVAf/bhFhL8VjKvzAMnJo5PZeLVWff0AklNVTkKqFF+JN/kHGYztVXu+uHegG
LDtZdKVSwVwQKfQeerHIj/MVUpWBRm1S2IHgOmXBR8egGcOyP2D6bstKbRGalC8C
45aNZuRG4KSdQ4ocUdUhWqaxDS4CJjeGdCqo5+XJ6sjc1TSw3Ud+JFwVRGOzXh+Q
CBYPecKeW9WKJHAB8CO63CVH0pIfk8ztMy27p7Mepo37BzXznKMfHzzAxeZ9MNSZ
jfUsUWHabW0FSnSqjj/4+9r8Oub3qm1CxePiqI1DZipQGe+hTDIGpOThmIOGdfs1
X0HhDo0cjx0WjGSGfIRtgj9m5/xYxw==
=lsjb
-----END PGP SIGNATURE-----

--0XPpq4pkgaUzCvXA--

