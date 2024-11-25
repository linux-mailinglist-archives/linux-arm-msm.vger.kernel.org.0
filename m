Return-Path: <linux-arm-msm+bounces-39134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B77729D8C7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 19:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D539FB228CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 18:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0941B87FA;
	Mon, 25 Nov 2024 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="utwzIvjI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD251B87ED;
	Mon, 25 Nov 2024 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732560609; cv=none; b=nU1w7dvALtbQfhtkK14qo2TK1xudyMkaZ430t/NMhisCD5QquOPN93enPeerFvQG2fDiKocwrxFc38PDOUGfaEeQXxgQNrjuDaOSh7kbMl+L7hY/6VM/0kk8FVpmSzlMUama1wQpaadi52sJTPNTZQ7lny8pAQCu+Vd8v1oyOlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732560609; c=relaxed/simple;
	bh=hy3kAK8dBc/P3+3R55Y4KPBRh40qNF5lRW24dklHEck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ol/wjQwS2fZAU/vzqKduYx6BVAUNJOJrOwrSxyz90KLyYPiFUcQGeSi/uyPdrg67ddK9VAWuasyl0JW8USmHO+ZrtDRtqirFzrXUZ6SDmwzYPOIklrTt0b7h3XygYknOe/oT99IL8x78Tk6nmbWQ+YPRyxb+quAObJha9bunsFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=utwzIvjI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89A1C4CECE;
	Mon, 25 Nov 2024 18:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732560609;
	bh=hy3kAK8dBc/P3+3R55Y4KPBRh40qNF5lRW24dklHEck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=utwzIvjIoQOdm92rT9kk+/2iCQSk50Y8rkF7YdlCMdiwTPh43CZuCPmAWXTmFzpqw
	 fo3h3ctWTbUyO824tEwrbqjlTvuDVFhCbjsH5iHKoZzhDzdMTFDzrYoPYWWWFx7O9j
	 Nn8dzi2tX1JUyz3pzWwbjlOmzID+WLM71Mt9+i1V5JdpgoC4xi6wPYJmXA065Czd6f
	 LFxDJDEmyl9kgrj8Gg+gcXIWyX3DXFL5cJQVA1fSYDo+1/1l75Q5E6Yfb53M7DNof2
	 TlFaU5gDtK4YFtL0M26ZLzODmGb7FGXUOxUGjVIMMBsBx8okouvlMzMBdbB7/EZBgK
	 ujT8i2hECHunw==
Date: Mon, 25 Nov 2024 18:50:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add SM8750 MPSS and CDSP
Message-ID: <20241125-culinary-twig-29b2b67af221@spud>
References: <20241122085623.19988-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XBqM4UBW3vx0FdUJ"
Content-Disposition: inline
In-Reply-To: <20241122085623.19988-1-krzysztof.kozlowski@linaro.org>


--XBqM4UBW3vx0FdUJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 09:56:22AM +0100, Krzysztof Kozlowski wrote:
> Add remote processor PAS loaders for SM8750 MPSS (modem) and CDSP
> processors.  Both are compatible with earlier SM8650 with minor
> differences:
> 1. SM8750 CDSP has one more sixth shutdown interrupt.
> 2. SM8750 MPSS lacks fifth memory region for Qlink Logging, according to
>    downstream sources.  There might be other differences, because the
>    modem currently crashes after starting.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--XBqM4UBW3vx0FdUJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0TG3AAKCRB4tDGHoIJi
0hjJAP910O0tTk+WuQEq+rvPO367XFc11RrVOfesMzbRZNwk3gD/XUcqjAfrbcaR
71l/bVl0yE5gGqlBFOtACKDsJuxIqg8=
=Jps6
-----END PGP SIGNATURE-----

--XBqM4UBW3vx0FdUJ--

