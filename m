Return-Path: <linux-arm-msm+bounces-23772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 053C3913BA9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 16:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77A86B20D51
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 14:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAF213D626;
	Sun, 23 Jun 2024 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hq/IuCXp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C287712EBC7;
	Sun, 23 Jun 2024 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719152056; cv=none; b=eh2sK3q55p4fJ/dtiGfYyeNJiyP3qyIH1svi+ny/zhI46iyPD4Wm3VvebCMQ1CpK5JbK4KOha8eWZtVOg4ciq05H7CfsR3nW+dlheXfT7uQrezSB+Lo5eX/X9YUdu8g4t7VrB54YG6ZTp/DMAptqS/bLnPYJV2ut0XPo1/iixS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719152056; c=relaxed/simple;
	bh=WJBNwHQvEUGQpwl3kDlWJ2d83DTNW3enLMCdUvVtsy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rn+1YFB0/xOvaHKsuOR11JATEs2CAl/yUQnFU0rbeF7OYYK1L7xbB1SN+iVvtjtTMgrH/7OWNgU6MGjJ7swaZ7hwkqcmfqZQVbefc3RC0UDl3HJ3D6RZeeZoBy+UE/srmY9m+hCS0xO8HM6SiusEWZh5MAogs4XKkFrsCiJXFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hq/IuCXp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C25C2BD10;
	Sun, 23 Jun 2024 14:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719152056;
	bh=WJBNwHQvEUGQpwl3kDlWJ2d83DTNW3enLMCdUvVtsy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hq/IuCXpW5wqZEJQpx//85tpCu+qsG96W0RCEcuRjzOI2nuXSki2VDBviMtQCHp89
	 wcYAoGJ4PJqEcvokjN8kmrXZnNx9Bplp885EGKELtLgLcxbgbdGzkEJvgGSiMzvx26
	 B5jYM84RNXEl6Ae0WiaJ8Du/bPUN8nZmZlt8HTko7XTA88CtzzzdggS2KGMM8E0cuH
	 aX058iIkzLR8uSf/BGWrqXkfPZRnE05qiy3WKGbt+0kzP5wIfeJtPcS5IhOLzXllMt
	 zPWTwAMbgkz/vxoOkZwGlUlUb6duXHLjoEGH0WpuQhVq4/wCZo3oNU30h1FJnou7sZ
	 3c1WVA/lPzu8w==
Date: Sun, 23 Jun 2024 15:14:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: display/msm/gpu: define reg-names in
 top-level
Message-ID: <20240623-flagship-pacifism-4fcc3c530617@spud>
References: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
 <20240623120026.44198-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6NMFsyziRLC3bhgw"
Content-Disposition: inline
In-Reply-To: <20240623120026.44198-2-krzysztof.kozlowski@linaro.org>


--6NMFsyziRLC3bhgw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 02:00:25PM +0200, Krzysztof Kozlowski wrote:
> All devices should (and actually do) have same order of entries, if
> possible.  That's the case for reg/reg-names, so define the reg-names in
> top-level to enforce that.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--6NMFsyziRLC3bhgw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZngtsgAKCRB4tDGHoIJi
0oB9AQC3CyqV6LDWFtHWKMhnFdgK2R1RztyQ5W6CooMH4EJ22AD/SRq7QsBl/kzK
4ZfJERst4+knhGKAUDRIAbGJXljzPwM=
=EHls
-----END PGP SIGNATURE-----

--6NMFsyziRLC3bhgw--

