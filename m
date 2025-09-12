Return-Path: <linux-arm-msm+bounces-73395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E87D7B558AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 23:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17B9C3BD391
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 21:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC0C2D238A;
	Fri, 12 Sep 2025 21:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CPwJDOaH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B66266560
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 21:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757714221; cv=none; b=QqG7ZaS/auF5MgtxYRPSADBtfbsEfa1UHmsX8hI6bzA0G4PkbSBrLpBPZgdXzt+zsLq76gdh1MSmrvslhRxsp/SevOsrHpBfFHPJ/WSCCC2kWkJUvQgQwzV2Q5CB3bxkFwro9rA+eqbCGjw7J/xgibsSQIluH7KJKXbHd/dgKmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757714221; c=relaxed/simple;
	bh=vgUHLh2WDG6vmvZXtQuwei+9BmWgXyLrwR8bmVuIg+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmKStT6z1+Cv5Y4j/pvPljXNCfW8LTAo77YMnvFdIjArJH3YILLkJFYBKVgnnhv3Kjz2RUomJ0Ayk2O8/CP57YF67Rmpm+6aTx4vfe7+ZtyRlNxaMfC7EIjOsoOkGzmdt1G37efR6bmIDMkdfVYCEpIWgDznbc/1xqxSQIhQUN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CPwJDOaH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vgUH
	Lh2WDG6vmvZXtQuwei+9BmWgXyLrwR8bmVuIg+s=; b=CPwJDOaHBZNRm0ncDf1h
	uffUWnSyt44H5Zv9qXPhkMcholFTYYBf3hF4QAIsf+F78e456kFSogVEIBe7a2zI
	32UX8wUBslW5lHEpJghixhl94/rDhq4MUxQJaodxrXsh3XbH0pFy+ie2pZr8dd/S
	xGkw8glIONU/ZrgISp0B77IDFzrCqb6gc0pi54qgLGNLcutBkeO47BMD2dglrIYx
	zUKoTzKpnNP4xt2aFQKR7ygF6Kcxp5xS+pIDxuBojCBeAkkGwh5vy/Wf/IEmofhY
	1k5YD/fpn9dVLAURbrWV+quAfNmYQ3FLhM2Cm4L7+mmmgUNKGRUNBJrxpP2mO+oF
	PA==
Received: (qmail 1497381 invoked from network); 12 Sep 2025 23:56:56 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Sep 2025 23:56:56 +0200
X-UD-Smtp-Session: l3s3148p1@rvd5u6E+eJkgAQnoAHJ8AC93OVDMgFWg
Date: Fri, 12 Sep 2025 23:56:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v5 1/2] dt-bindings: i2c: qcom-cci: Document
 QCM2290 compatible
Message-ID: <aMSXKBO2lJkV1YC8@shikoro>
References: <20250911212102.470886-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TwqxwFyp512nx4Nw"
Content-Disposition: inline
In-Reply-To: <20250911212102.470886-1-loic.poulain@oss.qualcomm.com>


--TwqxwFyp512nx4Nw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 11:21:01PM +0200, Loic Poulain wrote:
> The CCI on QCM2290 is the interface for controlling camera sensor over I2=
C.
> It requires only two clocks.
>=20
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Applied to for-next, thanks!


--TwqxwFyp512nx4Nw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjElycACgkQFA3kzBSg
Kbb52hAAh84yHSLR1P+kekpFCx+Lc6xyWCddGRbFA7rNbRc5jU+zpfwCnV4/rPYS
aPc5XKDJMyL5I2q7Tfy6ZwKQktIEDUhNIW5PX1OlifgG8CnMnuls1NTAi5cfBU1N
gcmHFxNo+gXyahQCIo8ISwusT25b/IoYF+kocfGWJPZGbVUliQABTozDLJLfzv9D
VOrdFuA5N6jNkkcHX/bUkJ93jpH2LWkJ1DrDUUfZoCLblBhVgDs35RB2QjZSOOV8
aUnduyJi2ql0KyxX1r6Ko+tGcwMNqy5POJUg0D/CywS9Er7vZBm9ODAims8n5RDo
+GQEi9HIWzrJKNq72RxHkoDL/RmtR5QcKeNepfATXtVBY4XN7HxQQlaITgHqursI
CvYsjp87h0MEST8Z+37lOopfE3MfjY0RL9m2Olgavm6+l5WCPIeg7BClPDHYDLiJ
kjj6Tdwp1JG7ybSG91MsxgXFzfa0CwMsmxOlauzqjpksv08Rzw9lUrWq4GKqbdPO
xcR0mon33FezjBMVgP9aYF038oZiODYPX64Mlu3/7It0tdPIWIEWqMrLc5e8Ba/B
RC/wQCqgXdBHXEfdrF8/xnxMq9KC14jjz/PZucUPazMY0Nll5OkRIpcHZAK3Hc1A
U5AaBUOBIN71F4cP/Wj6gvVlCxA3bAXrT/zn8qSgPiXxzC9LtNs=
=ZGzr
-----END PGP SIGNATURE-----

--TwqxwFyp512nx4Nw--

