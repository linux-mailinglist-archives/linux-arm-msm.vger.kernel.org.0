Return-Path: <linux-arm-msm+bounces-42397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0439F3D05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 22:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B03CA16CB12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 21:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35B91D54FE;
	Mon, 16 Dec 2024 21:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mllLAmIu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17171D47AC;
	Mon, 16 Dec 2024 21:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734385745; cv=none; b=WT7bXqimBwI+rpOmD1PX8pcSXJeHuQV1JWRqVpGZYq2ngJsxbb8gAaiZujr8lHBdYQul+YGJMh0YhS4TAEKoTIqYLXXNJX6evIwdXZU8RKlm5Cm0j4ZQE9m4uX8qgXYILjrXsIoTK8M6Y2fU2+hf+QvJBL46IWk4kdq6Ekudsnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734385745; c=relaxed/simple;
	bh=ZIoQPyeoC0d8HE8S51eRA47tNK9PF0M3hI/o0xDvkuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJR6A+Sn3TeCe3HmfLnmV/EJ5I+QGowXjdS7bpu6rdD2aU6+ROffs7Fm1X2Lc//1lQDAp78R+rY8xvRGWx0LRAvfN30I4U1N07eDZrdfqCDcJaDGLM/o68ngRD4ghAS67v5vRQP7u7BwTcyXAmkLs+t7EkQQ1oQIC0weVx3Q9Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mllLAmIu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E36FC4CED0;
	Mon, 16 Dec 2024 21:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734385745;
	bh=ZIoQPyeoC0d8HE8S51eRA47tNK9PF0M3hI/o0xDvkuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mllLAmIuLztFviM/jMF1PGcbVVYcOhEbiOdziXUdlTU49nzlucu967paitTJX4jJL
	 YU/qPyopTd46zDqAhhK3iSCI49CEFEDPH01AZBXCt3E4fgOXwH93yplxML0Q9396+w
	 xHqmEeA6IcUW5RdYDPlf81650bFRVQ33o4HZkVAGuBMkROkcaQEyIbfuzaSB1+66VT
	 3y1JhxN8hxBHKcsTMHUN98525WKbqN/5iyTlbMCGa+jIUTALUvorzzNYjeZRYDOqXw
	 +orAVBro8R7ze7Dy8Rnw2v5E+fVRX1m5EDShKX4hjqHcNLo0s81/q6U3iM2eW/NDui
	 N0q7iLje3EtwA==
Date: Mon, 16 Dec 2024 21:48:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: konradybcio@kernel.org, andersson@kernel.org,
	srinivas.kandagatla@linaro.org, tiwai@suse.com, lgirdwood@gmail.com,
	perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] ASoC: qcom: common: set codecless link to be a
 backend
Message-ID: <4a85f858-5350-403f-a862-9966f542d3b6@sirena.org.uk>
References: <20241205023344.2232529-1-alexey.klimov@linaro.org>
 <20241205023344.2232529-2-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JzRM4fzI72YszvM/"
Content-Disposition: inline
In-Reply-To: <20241205023344.2232529-2-alexey.klimov@linaro.org>
X-Cookie: Be different: conform.


--JzRM4fzI72YszvM/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2024 at 02:33:42AM +0000, Alexey Klimov wrote:
> When codec subnode is missing in DAI link description in DT
> the DAI link codec will be set to a dummy codec and link will be
> recognised as front end. Any playback attempt will fail since it
> will not be able to install hardware parameters. Fix this by
> setting codecless link to be a back end.

This is intentional, the sound card should be properly described in the
DT - if there's an expansion board used the description for that should
say what sort of CODEC is there.

--JzRM4fzI72YszvM/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdgoEoACgkQJNaLcl1U
h9AXjgf+O24bBTPBqVTzzxYzWAYsuB9RcvwV1ZXSTC19I4g1/hPH/DeXUCQnXQJ4
UoEaW4w6Xyxhjy0jcXeS/N05zmtfe4oVptsHreQiOlUvsKeCMlIPxw6mgzF+6ds7
TYAoAUwxVEToGVEva5RXsCvnKPz4toKMLvkxSONvl1mQjgcEdijpC9ZwSf5nH4eI
iqFB6K1h5WNFloJ+iR5V8L9D6ik23tEEQDQMJtzCPCQaf5NSIuYHdU0a/Cesbgf/
1ZcURE8ezvzrpUBczRlQzVOdoipiigQY0UkO0Xx6cgOMy4jBOCgHY6hjB/RnO3JR
5Gur2GfOq8jQ75JsEIHcSlCM0LN3aA==
=0ibu
-----END PGP SIGNATURE-----

--JzRM4fzI72YszvM/--

