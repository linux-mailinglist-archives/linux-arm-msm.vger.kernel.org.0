Return-Path: <linux-arm-msm+bounces-26194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ACD9316F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 16:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A04F1F21EB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7297118EA71;
	Mon, 15 Jul 2024 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Byhrv2ZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4900313D531;
	Mon, 15 Jul 2024 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721054431; cv=none; b=nSDla0dfzSEKGzgRmJFEE9tPvgdblIXUDBAywP7PYWJqhipMq6JPyCq51DIH1otGO/FAHqu5olUhTm5tZqgmgbiZcMS8Ni08hS+LOKMSeUTXp+0ShR0AN0j4Y/kjcsv882+Vlq19/qzyDzzak/Bd9sbgZMvxafWueh8o/6KzLRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721054431; c=relaxed/simple;
	bh=7Qms0es8/wpmNAJDyGPB/BG2izJHXxI+19GbbNywqSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDauWsOiWghWEuPzMIth2tGrxAjXRWuL2k/PNnml1Fns+6W6HTXsyiMoFwSTAsTfpE9EwFtOVQxxoVTWLCEqVryBIrvTY8x0fXTZMGqcYnGQqXN4vEbunUEFu8RW//DeynHs2MZv90nHG+4hSr/eQYdZLR6+yGN4vSYLYQgwOWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Byhrv2ZW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5537EC32782;
	Mon, 15 Jul 2024 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721054430;
	bh=7Qms0es8/wpmNAJDyGPB/BG2izJHXxI+19GbbNywqSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Byhrv2ZWmCl70GbXWN2BUbQU1Bh8a2CsMChUVlqUKoXTG4PuJY5NS9u7gkcifu/o+
	 9l9/FEk/QLYu9UYkVFHM6FtjjaScIjguu9JWTijwTocJg9iQqtvlVubvpuozb4NSk+
	 Xp/ZfBGqJfyE5ZUKCAOymDuWTScJFYwIKCouamw+LixBykuS+vSsghzBh1yNR/A7Y9
	 saR1ZeXoPg40Z5ZEh45q4DkiwTezCE3iK7XXb7G3WLH1sUptRUWmaWpXLkG73NfDUC
	 LDigeFzwRKzj0ygTf3kYm0ZJobSM1sMtptdBI9IHsA1hOmMfCnyChncf/lmfRdHXHD
	 NC4g8tcW9r6uA==
Date: Mon, 15 Jul 2024 16:40:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <20240715-stirring-purple-toad-7de58c@houat>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e55d0f0e-a104-4790-b832-120dbddd93ad@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="4m3qhydxrqaxpkry"
Content-Disposition: inline
In-Reply-To: <e55d0f0e-a104-4790-b832-120dbddd93ad@freebox.fr>


--4m3qhydxrqaxpkry
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 07:04:41PM GMT, Marc Gonzalez wrote:
> On 01/07/2024 15:50, Maxime Ripard wrote:
>=20
> > The i2c register access (and the whole behaviour of the device) is
> > constrained on the I2C_EN pin status, and you can't read it from the
> > device, so it's also something we need to have in the DT.
>=20
> I think the purpose of the I2C_EN pin might have been misunderstood.
>=20
> I2C_EN is not meant to be toggled, ever, by anyone from this planet.

Toggled, probably not. Connected to a GPIO and the kernel has to assert
a level at boot, I've seen worse hardware design already.

> I2C_EN is a layout-time setting, decided by a board manufacturer:
>=20
> - If the TDP158 is fully configured once-and-for-all at layout-time,
> then no I2C bus is required, and I2C_EN is pulled down forever.
>=20
> - If the board manufacturer wants to keep open the possibility
> to adjust some parameters at run-time, then they must connect
> the device to an I2C bus, and I2C_EN is pulled up forever.

How do you express both cases in your current binding?

Maxime

--4m3qhydxrqaxpkry
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZpU02wAKCRAnX84Zoj2+
dr6VAYC9M5eBCxusXRIijUkanq6xtlhkC6yWl2OTjIcDlUSVcbebs2bh+BhrDSoa
s/TKenYBfA0TzhgGz76rxwe5TmG2MX7eqDw1UhEK4s514MWUphSxxPexnKdUNpWk
4mk5xdPA6g==
=tNiI
-----END PGP SIGNATURE-----

--4m3qhydxrqaxpkry--

