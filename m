Return-Path: <linux-arm-msm+bounces-37685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 605B69C5F80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 18:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25025285272
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 17:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA182141DC;
	Tue, 12 Nov 2024 17:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c33DwffK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4937C213EFC;
	Tue, 12 Nov 2024 17:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731434001; cv=none; b=AeFTFM3gNx5Ktm5itX4NLLf4eeN6FOp46q3Ya/9SNsBgQ21I/+P9EJoaZvxO9XO7AXpwnGVhH8SZ3rQodb5/HDkTBlaefZWRNq4YUuowoWl5Or4s3tCKHnew6DU7WiQBxD6oin1ANIwP4WsQcSzxKkrBcdbMlnuu4X84xr9yqV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731434001; c=relaxed/simple;
	bh=CdNwh4TngMkwAITvnYjnGJi43aRzrH2WAmIdAF6r2Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTeojCEFDTFio0PGnieibzwlm/bltB+dPOVA/ja5kuJvkCa7ZgRCyVyfiUTriHJrvSsv2Dwk4XRNjrtoViSvpmYLndeN+11aF/63eE+UBhDcj1YvEmWGYjoU49HVLU20F9DGTT2kQ93qMhB6MiPQ+pLYRtJ11Xsm/MM8XeMfWSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c33DwffK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A28C4CECD;
	Tue, 12 Nov 2024 17:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731434000;
	bh=CdNwh4TngMkwAITvnYjnGJi43aRzrH2WAmIdAF6r2Dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c33DwffK4W91A1K6v2sh8AoMP06Tnu6dfrknLd0+J4QkGUyXjZQHYhRW1tRln+1X4
	 DRe+T0NHBsOtHkpyMEHJ5UD9f78QqPJ26ttMalzIZAn9Vm3LeVAPRNcNjWx1WJg26e
	 wySH0Sul5B3fyUr9Tvt9pRpUFyGlIDR4/YhbQ0IQC7zdp5ugQ7NHGzg48QK6gjl1j6
	 UxO40FAHMGRCpN9Xa32bvUV+Kn1cK1gqjK6fayAHaEus0tzgNV43DMztJSuUMIbXTr
	 n3cKHyOZ+CG/3nM/caaimGBd4Tl96xQL1xts1Xk+cfDmCaxb+hfsTlxLkTK+Gqr1ON
	 NHGA5RH5GuNHQ==
Date: Tue, 12 Nov 2024 17:53:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
	andersson@kernel.org, konradybcio@kernel.org,
	dmitry.baryshkov@linaro.org, mantas@8devices.com,
	quic_rohiagar@quicinc.com, johan+linaro@kernel.org,
	quic_kriskura@quicinc.com, abel.vesa@linaro.org,
	quic_kbajaj@quicinc.com, quic_wcheng@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 3/6] dt-bindings: phy: qcom,qmp-usb: Add IPQ5424 USB3
 PHY
Message-ID: <20241112-salvation-dad-3a0577bcb9ce@spud>
References: <20241112091355.2028018-1-quic_varada@quicinc.com>
 <20241112091355.2028018-4-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uEd4HNO5pLge7WAs"
Content-Disposition: inline
In-Reply-To: <20241112091355.2028018-4-quic_varada@quicinc.com>


--uEd4HNO5pLge7WAs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 02:43:52PM +0530, Varadarajan Narayanan wrote:
> Add dt-bindings for USB3 PHY found on Qualcomm IPQ5424
>=20

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--uEd4HNO5pLge7WAs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzOWCgAKCRB4tDGHoIJi
0r5DAP40niOs5uZ96CY9WXnzZbHEwAwoHSs3p/xuq3PQvb7fxwEA8iX6Sj5WwHTP
gO1xpITVwnGMUTH2usuOvbTBbT6rnws=
=JwNr
-----END PGP SIGNATURE-----

--uEd4HNO5pLge7WAs--

