Return-Path: <linux-arm-msm+bounces-26202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 291BE9317A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 17:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C96751F2192A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 15:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EEB18785B;
	Mon, 15 Jul 2024 15:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6T85qz4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BB9F9EC;
	Mon, 15 Jul 2024 15:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721057516; cv=none; b=bOUL3hNX0SZlxY9F2GzZXoO4P7JONSvVFR4sgAgE3ZAWMwGRB5wz6mPbAP8wzXLMi6ix3QI15bmFwjmZOV6Sxq5OTN6fMj+hnJmGGv3ijfyyP4QUJW5jNEb3PorCjSwxQCRResrgCkHfa5bLrpN3tY5Y87+KudcFXAzRXqNQgzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721057516; c=relaxed/simple;
	bh=siv179GxtAnDGBBlaJJzeBtfyYpYJ/nI4Rg+Brcy6wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToA9/7UElSsrRQQgBo0I8yHHcFs6YclbOWr5d75+OoXxtwk/s3DvIKKJfKXXq0mgyqtMZX0BKBPPm2V+ZDPuHYLc25+XmtFDcRPb1TbiyuBVls7DynW3rzDocOth4kNsoWlY4JJhp1dywUvzQtQYcVKwj3M/YSOnlskeJPkghMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6T85qz4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C4CC32782;
	Mon, 15 Jul 2024 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721057516;
	bh=siv179GxtAnDGBBlaJJzeBtfyYpYJ/nI4Rg+Brcy6wM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V6T85qz4XFtXHUN4p1FTpcjzvJu+RdeIVt89kxB+SQbX9w9TGCmjSsI+RK/RJa5N/
	 ZRVvElOVnzk4co2EGVmbetO6JbU7T0lEM15kKhHJMTaHalOiYFo5vBbxOaDPOXtqiH
	 GNWeJTGHST++3Y2qTVVnuzhn3eLV17Dcmfyw3zmFileVaCg+bV0O6MCqeiCsF/P+Cp
	 UEzuVUWlRg1e6ok6UB86Ec7xyl+qm5f7Q0HGRgMaYu1zEEeYZWEwUEC0rzXY2Ob5vF
	 8tk5ch6NNVeuKwxXphTrs6ZT93FWlTMUdCdO3BphfXfhuQKEZaumetON/Mdt184Vvp
	 ZgCPc6YA7nTeg==
Date: Mon, 15 Jul 2024 16:31:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
Message-ID: <20240715-scorn-canning-a7f23b9e2039@spud>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PGPY0L/uV9VV1R85"
Content-Disposition: inline
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>


--PGPY0L/uV9VV1R85
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 02:15:37PM +0200, Stephan Gerhold wrote:
> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backlight
> control over the DP AUX channel. While it works almost correctly with the
> generic "edp-panel" compatible, the backlight needs special handling to
> work correctly. It is similar to the existing ATNA33XC20 panel, just with
> a larger resolution and size.
>=20
> Add a new "samsung,atna45af01" compatible to describe this panel in the D=
T.
> Use the existing "samsung,atna33xc20" as fallback compatible since existi=
ng
> drivers should work as-is, given that resolution and size are discoverable
> through the eDP link.
>=20
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--PGPY0L/uV9VV1R85
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpVA5wAKCRB4tDGHoIJi
0g1+AQC1TYeQhL78aVmae/bbIeS87fROp/400N/NvEFiEGltuwD+LfPcF+qGTN+D
tZeky3VyyMG7F0Xqx5tCLLcl7Dm2tgQ=
=dlyh
-----END PGP SIGNATURE-----

--PGPY0L/uV9VV1R85--

