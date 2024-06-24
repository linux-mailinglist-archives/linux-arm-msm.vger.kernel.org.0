Return-Path: <linux-arm-msm+bounces-24011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1231915406
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 18:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 368AAB21106
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC6819DF84;
	Mon, 24 Jun 2024 16:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmZGrZJb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EED819AA7E;
	Mon, 24 Jun 2024 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246968; cv=none; b=Tf6JWu40COn3ByE/Qr8bPlY2ooJVpXcjLN6pp41qE+mKFDtECamhBLFHMTtRwjFBwwqlrkBHUx+EF9l+bsLl+Z4f1N6fT9OGlQagpKiPU9l3316/scnUuFgTvOnPPRg4vUZCePY6I+hjFdE81/qZ/AIaZK0jRMy3Ovjwu7DRu88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246968; c=relaxed/simple;
	bh=rhi43mYbivbiigRrfEe9LZYb8Yg0etF+y/Zt+jX/zCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGnNQd5MvAkLeKvzlqnfZxF+/usG6rf0BOMWVxnIScCGEGIoUzd9d21fC5dEnFsr1dN7Hb1Kyv1aeixboaZf2FHuLYgZBL3ZTPVCH6qfJk36L+EfP3o6GpOTKhGYZ3dP7sQDJsgVzKP7NFNzh21iky16i5WRFVWIvFiuJBWYXkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmZGrZJb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1789C32782;
	Mon, 24 Jun 2024 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719246967;
	bh=rhi43mYbivbiigRrfEe9LZYb8Yg0etF+y/Zt+jX/zCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kmZGrZJbheRYZVKt8pm2qJdAF3cyw+uSfuV40ByqGyiylQPh+JMusaZYNhYfZvyI8
	 Q6x/tarop3KG27sB5On6OXDrjvPwPP0cCL+qRMQVXWSXpYU9ZbOR4z3AiVpp7hxAlG
	 KH3GfMgdifHV7mdkZxyqfxPJjIlzpS3vqZXeJVL8l/YxPvGso/0xDgNcqISBuTod+3
	 fKPELePlaHVMMYNpQQ29zmgQGo9om8zKNv4J+EyGyuEk8YUY6oWDfFtwQUeeA7Jbvs
	 NEnZ9ePHKCmeh9B4iz5dtxtkiRg6S8lnrI0Z1+J9U2BgIGdExgx7IbPy5yV9UPphyK
	 LMa1tBxNHTImQ==
Date: Mon, 24 Jun 2024 17:36:01 +0100
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 0/4] dt-bindings: display/msm/gpu: few cleanups
Message-ID: <20240624-cascade-ankle-ffad3144087d@spud>
References: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rejIecYv53akMJ/5"
Content-Disposition: inline
In-Reply-To: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>


--rejIecYv53akMJ/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 23, 2024 at 10:02:59PM +0200, Krzysztof Kozlowski wrote:
> Changes since v1:
> 1. Add tags
> 2. New patches #3 and #4
> 3. Drop previous patch "dt-bindings: display/msm/gpu: constrain
>    reg/reg-names per variant", because I need to investigate more.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--rejIecYv53akMJ/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnmgcQAKCRB4tDGHoIJi
0tz/AQDFaPE1XkeikIQQErs5cvjtBoK0NNnaH1YeYd7w33Xf3gEA58wLtShSI/lr
84cUhMIjkzkgx1ykaLo2wkCRR7OtCA8=
=MpfR
-----END PGP SIGNATURE-----

--rejIecYv53akMJ/5--

