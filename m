Return-Path: <linux-arm-msm+bounces-65267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D12A2B0782C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 16:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5235D586166
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8486214232;
	Wed, 16 Jul 2025 14:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHANWFFb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD345190472;
	Wed, 16 Jul 2025 14:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752676286; cv=none; b=XQ40BA6YuiRoiAu6AZcyKMTHR3HytVKDyF2Y0xifc56q8uK8PAC784FkwN6nT0LpN5KXIKQfDkTOqTgBVHZBjQuhNSu9ZCyHZAi6WODMypYk3b1WlkEC0B5dvrc3e8QBevpviP+fyo9mYOv174nNBW1NkU50SL2r32vwtkOSxv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752676286; c=relaxed/simple;
	bh=Gi7iclgTSx8VBkWylegD6kUMVmwIVSLNTicFoS/kPS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebTXuVMidS5tk8mOCZ/6pFI+fTsgeXuH5+DPxPQ3RqfVuamgbjaKI55Fwfvqq8I8VPfZ66hZHcOtNhhnkA/7jFZoup9QYRve3h1V/FcPnAbsn/g8deSuv38fLILoHKJlfp4ngQHAVimkKZMtUWxXiYIjBSuYzyTen/SVdTClXNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHANWFFb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDBEC4CEE7;
	Wed, 16 Jul 2025 14:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752676286;
	bh=Gi7iclgTSx8VBkWylegD6kUMVmwIVSLNTicFoS/kPS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHANWFFbncWphnBBtU4c9CXqFKZjuiQeXKGd48uLITgt8TY++tT6PlGpIWcYoWix0
	 Pmvg9w04YmqbQVB18BYPcugk9me6DJhtNgYpkLqkZXF9uInd9+QyL5Odyu6qXZkSuF
	 eMWAyn294XV00QdM+uRd0FAn28dtdMAVUg0SmWs2EwLbScdMpLr9jt5KIN7sOEY+F9
	 DznQXhGrVOEVEy0mY2Kk1zbtedpFW9+HxCuaAqfF+ZhWlZrTyso9Zu/puIJCbayQ7z
	 FH8IfZHrsaFS09kiXRQG4m9GDOn3HxMQBDKfk6FMu4FgMn15K7RHbkRxPqROCVg8jG
	 9wZJI0fTw7vpA==
Date: Wed, 16 Jul 2025 15:31:21 +0100
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, neil.armstrong@linaro.org,
	krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH 4/5] ASoC: codecs: wcd939x: move to using dev_get_regmap
Message-ID: <9f4c750a-9e23-45a0-a761-4c3fc2c7d8c9@sirena.org.uk>
References: <20250716123323.5831-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250716123323.5831-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UIV+24GVrtr99UM+"
Content-Disposition: inline
In-Reply-To: <20250716123323.5831-5-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: osteopornosis:


--UIV+24GVrtr99UM+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 16, 2025 at 01:33:22PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:

> Ffor some reason we ended up with a boiler plate for dev_get_regmap in
> wcd939x codec and started exporting a symbol for this. Remove this
> redundant wrapper and direclty use dev_get_regmap from device pointer..

> -struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd)
> -{
> -	if (wcd->regmap)
> -		return wcd->regmap;
> -
> -	return ERR_PTR(-EINVAL);
> -}
> -EXPORT_SYMBOL_GPL(wcd939x_swr_get_regmap);


>  	/* Get regmap from TX SoundWire device */
> -	wcd939x->regmap = wcd939x_swr_get_regmap(wcd939x->sdw_priv[AIF1_CAP]);
> -	if (IS_ERR(wcd939x->regmap)) {
> +	wcd939x->regmap = dev_get_regmap(wcd939x->txdev, NULL);
> +	if (!wcd939x->regmap) {

The existing code should be more efficient than dev_get_regmap(), the
latter does a devres_find() to look up the regmap while the above is
just a pointer dereference.  It's probably a marginal difference in the
context of probe() but there is a reason to do something more direct if
you can, dev_get_regmap() is mainly intended for generic APIs that get
passed a struct device.

--UIV+24GVrtr99UM+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmh3t7gACgkQJNaLcl1U
h9Dwegf7BbrHla0QlvAqjPSmldXF6rvwd9JJ7pKCrtptoXBhKv7wUdhBPVUi0u1a
kneuifn6mi+8q6EOfWQy0gn9f3SQgcQPu3Pjes63DAXw7YE9cPWz2xIYGvqGjctV
mOM2bXEXwpvcLOg784j4seYNuMeUHfd52b/LDa94xsA84VX+PjP2tX7uplCq4iNz
qoWdsjo8WvGz2lRjHPjgD4IcMQ0f3ILB0EiizHI0M+ozVHURiIAysvyxmhggQ95z
KmqrOyywOmG2RBT72vS3eX2jT2wKkfFdD+2A72dtdGGO3q7c1YlA2Y8mnblv4Sfc
UyQxHW2i4OOjBASL0IKYee8HgGai0w==
=rrcz
-----END PGP SIGNATURE-----

--UIV+24GVrtr99UM+--

