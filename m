Return-Path: <linux-arm-msm+bounces-52954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEEFA778A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 12:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98E1F7A37DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 10:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CBF1F03C0;
	Tue,  1 Apr 2025 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMC7PnFM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24C4131E2D;
	Tue,  1 Apr 2025 10:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502591; cv=none; b=macsnsy4QxwjflbgukYomOKYmFjmJbbVv5Q73tYOP9lfc0IfbNpyb0XsDFA+do+1Mm7wYaS9xZHJ8jcIHzTQSbeq7ySA8KGbsSLOvrS2OpkwGDN+V2PC9PODj0QVUnnl1IKx8DLmTC9M5mxjm3Wnng7CvplWOrjUO2337SA5wEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502591; c=relaxed/simple;
	bh=HxstgKJPs+f+8y4xUmnaqd2Vu0mJQKjK0JF3G6RhKco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSEX5NxXjdyQqiTRKz1wbCAZNCwfvI/NW8MqRwT5aXWcwH8hsvtOi9jUxf8JOPHoK4vXp+sdpbd/WOSZcIhq7SGJ9h2ns2DNVjpPIjde2VpcQf9FTQM4Y553QKFGGGFhPRXbzKBW/gpHpxD3OVoLXL/83nSyDt4MxwNsFO9H/yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMC7PnFM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8FFC4CEE4;
	Tue,  1 Apr 2025 10:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743502591;
	bh=HxstgKJPs+f+8y4xUmnaqd2Vu0mJQKjK0JF3G6RhKco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VMC7PnFM+tEZgGEODwSX8g/jCsBpdBCXc5XWCOdoo4tQaHd6AC0MeTQROQQwT8sx0
	 yOj5Zdpqh+Djngar6GbsDro6oqk40eMffaYeSP444Co4qGSTzsx98F4ZnI8XOi7iSa
	 1xrBgxg/yz3wsSqOwBYDORzFggfYv2thuBUXOhNlTP+rlTpSdiNgH/NSAO15Y3g9Eb
	 BWbkq5Qll7MEa9F4d7YDyD9xsqpQW362JH+AuHzpAWpd3QM7PAzwcFGxzTtTTe2Vp9
	 zD2R2q5rw2/3D0REC5LN56adQUL8/pNAFBF1wv24+610xbpv0Nwhc1nxmSvY2ZkfBg
	 DxEClkgzISrPw==
Date: Tue, 1 Apr 2025 11:16:24 +0100
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: peda@axentia.se, andersson@kernel.org, krzk+dt@kernel.org,
	ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn, paulha@opensource.cirrus.com,
	lgirdwood@gmail.com, robh@kernel.org, conor+dt@kernel.org,
	konradybcio@kernel.org, perex@perex.cz, tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: Re: [PATCH v6 2/6] mux: gpio: add optional regulator support
Message-ID: <e8bf5dca-16b1-4bcf-b3ab-3367f29264db@sirena.org.uk>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-3-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z3JX3JJC6tol6oU5"
Content-Disposition: inline
In-Reply-To: <20250327100633.11530-3-srinivas.kandagatla@linaro.org>
X-Cookie: 15% gratuity added for parties over 8.


--Z3JX3JJC6tol6oU5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 10:06:29AM +0000, srinivas.kandagatla@linaro.org wr=
ote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>=20
> Some of the external muxes needs powering up using a regulator.
> This is the case with Lenovo T14s laptop which has a external audio mux
> to handle US/EURO headsets.

The ASoC bits of this series look fine, what's the plan with the mux
bits?  It looks like the two parts can just get merged independently.

--Z3JX3JJC6tol6oU5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfrvPcACgkQJNaLcl1U
h9A2kQf+MEpTDlvOXIamMqjHWM+55J4GvuREUR04WcZMTSShV00EN4m9TbaLQ3OA
BTU/d+XS5kyH+QKDbG5tk+dsw+moVyJdSHzTBbXJYi3FE0HYzPy6nxPeWczfzXXv
Jja2lKHGmQQN//A59zpt204ccQrNo+I43n+6lUUEp+CRyeBaGy+j8G8RsO9vDtjW
cjK4XQ5nMxTQGDWD+GwU++JAC2Iy+CYyCnxdRSCe4Ku7jB45g2HmwcOwBBpuZMQT
Qgbw1sQLUDVHW13zNtUNh/g1zlbHUW10sgmYaAKScs8XERHadrChUx46dRdt9WQY
N3ZNFAvid2ERgVtNh4EZFkEgYU3GMg==
=6zZk
-----END PGP SIGNATURE-----

--Z3JX3JJC6tol6oU5--

