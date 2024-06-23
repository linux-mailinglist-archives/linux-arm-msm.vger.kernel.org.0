Return-Path: <linux-arm-msm+bounces-23773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FA1913BAB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 16:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C7491F2139E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 14:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B714F148303;
	Sun, 23 Jun 2024 14:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uuXadO7V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CC4145FE1;
	Sun, 23 Jun 2024 14:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719152071; cv=none; b=JduOd9FDaQmQMfmBhx2uefxP3PDy3WjL7O2/HaYn1QbIKg5nAf5GlFmSu80MxOpdafo6k678kAHU6yUgePrkMj/5XXU1MizAgjb1BsGeYOG3P4ncdHcSawU8NnCovmD7IG6fXe0T2KRalSUdngomJ+22XalPoZQF5WSd+tpSFjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719152071; c=relaxed/simple;
	bh=xjdka5JZvEFGgzarOm9cAQZioJh64tIoUo72je+5ot4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prJto1GbCIqRygqcHIZrym0fGEv1YzzY/KNnkOXp7byPj163BIc314W1CHIzQmk1+WF86KrU6Jbtt3fN7TlIApgp/W6qYjqdQqiLDarRHbMLyfCU5CBex9qZpETsLX0kfZL9+FLJ5LakXvz3UNeb6pmpc8kTjV1mKi3h2YtnGmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uuXadO7V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64689C2BD10;
	Sun, 23 Jun 2024 14:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719152071;
	bh=xjdka5JZvEFGgzarOm9cAQZioJh64tIoUo72je+5ot4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uuXadO7VVLHCeIENQsM2AbK2+yTyF7axfkAhTw1lyaoBlyC2FL76eniJbuEo6xphC
	 8cqnzR1x0dscspwAkeM+ZZ+VLDE50Z/+FCpzPYLvAghs5I/+ZtWBOvkUO/wM2Us2mq
	 vvx+fPkfBKbg97yA2fTTwzJa7ZlWSjSeelDCzDVKGMMlnFT4YyFt+5EI7YY1JeIvNm
	 g0780otXw7mA73ObVdxGISLI2APamFIH+FqP4cBDw1L+RB5/2o0fpX995azaPuILh+
	 J58lgvTAVSqRGfiEGHFEccv8Brn1HPlB639mE4ZegYTIzWD6h/hzUIBaNm+vH39D3R
	 Cj8gmmHE4AaRw==
Date: Sun, 23 Jun 2024 15:14:25 +0100
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
Subject: Re: [PATCH 1/3] dt-bindings: display/msm/gpu: constrain clocks in
 top-level
Message-ID: <20240623-visa-alkaline-7f851211c89e@spud>
References: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W+Y0q6x2brSSN8+B"
Content-Disposition: inline
In-Reply-To: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>


--W+Y0q6x2brSSN8+B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 02:00:24PM +0200, Krzysztof Kozlowski wrote:
> We expect each schema with variable number of clocks, to have the widest
> constrains in top-level "properties:".  This is more readable and also
> makes binding stricter, if there is no "if:then:" block for given
> variant.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--W+Y0q6x2brSSN8+B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZngtwQAKCRB4tDGHoIJi
0lh+AQD/zfWFp+H2OLeAtvkMdmdDHaYkkqAlbOU1YQsaYrQrRwEA4JhzzfmNtS8K
YeeeStRvNCLzuHfiWReqGTxHtxI85QA=
=5T/Z
-----END PGP SIGNATURE-----

--W+Y0q6x2brSSN8+B--

