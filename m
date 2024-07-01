Return-Path: <linux-arm-msm+bounces-24802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5130391E139
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 15:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03F9A1F242F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 13:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850FC15ECD6;
	Mon,  1 Jul 2024 13:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpRAI4Hi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA9515B542;
	Mon,  1 Jul 2024 13:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719841819; cv=none; b=B2kBxqIIm0s6wguMjR+7D1oOUaQNmgbzAxjQ8dCqBd/whL8raIyJHXXWM6U8J1E5bO0RaSqqfmC04PiT9gfz0wCmZEP/FvMh216aTEo7elNINGJWNXd4MPaeuz/eYoBB4iNVWNipZQ8DqtszFNYrs4z6EBeYc1VsV3kbkVtQo14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719841819; c=relaxed/simple;
	bh=AI7XCMBHlAs+uHRLozdpytNX6tSgpWifdmWB2XL1pAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzJiGVvopSA3DjRp1U88XMWkvEJiy1fAYUhN6XO5/b/M0xT/OXZTwTxBNZc2uO3qCScyEjNVunDVejKxH737YBPZKRiuiOfUvpMZ/gORNXuhNJOuZgkIVnPVK0XCsmYwFL1tvYfqcyR2lPjO51gMqFVuPpd12Wt8Q2S+xgN1Rqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpRAI4Hi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085A4C116B1;
	Mon,  1 Jul 2024 13:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719841818;
	bh=AI7XCMBHlAs+uHRLozdpytNX6tSgpWifdmWB2XL1pAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fpRAI4HiyBs+3fWrGSovWnRMEEPFxscml8os9TLHv/K41wCzBjPrziWjr8SitAJRm
	 WhC7nqyvfaNSivXKyaSSdYNjEcGSQyDA3ro/m1avt86SPLgtQj9opHTmpWOtxzVzhU
	 Z9ashPmLUspz/YFjslefZ6HxgoUo6mdL9WPYNZ52XaMoSQ4Y95zoZONl5iUApEQ7j1
	 LtkpX/spX5K0SITT6jjFiJNeVWeCClD8O52YtyIYuvRt1WnVMLrU8n1kGsR2PCtbJp
	 PufAaSwwhTOHCkKe6sGAzOhEROqDn5AGiLasj3/mv6JpZ72Ow8bnt3JU3+o3/U4dn3
	 +bd6s2BktjkgA==
Date: Mon, 1 Jul 2024 15:50:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <20240701-bug-of-great-honeydew-cfb6ef@houat>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lhkfrzu56kvv4h74"
Content-Disposition: inline
In-Reply-To: <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>


--lhkfrzu56kvv4h74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> It supports 4 TMDS channels, HPD, and a DDC interface.
> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> for power reduction. Several methods of power management are
> implemented to reduce overall power consumption.
> It supports fixed receiver EQ gain using I2C or pin strap to
> compensate for different lengths input cable or board traces.
>=20
> Features
>=20
> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> data rate, compatible with HDMI 2.0b electrical parameters
> - DisplayPort dual-mode standard version 1.1
> - Programmable fixed receiver equalizer up to 15.5dB
> - Global or independent high speed lane control, pre-emphasis
> and transmit swing, and slew rate control
> - I2C or pin strap programmable
> - Configurable as a DisplayPort redriver through I2C
> - Full lane swap on main lanes
> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
>=20
> https://www.ti.com/lit/ds/symlink/tdp158.pdf
>=20
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.y=
aml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> new file mode 100644
> index 0000000000000..21c8585c3bb2d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI TDP158 HDMI to TMDS Redriver
> +
> +maintainers:
> +  - Arnaud Vrac <avrac@freebox.fr>
> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
> +
> +properties:
> +  compatible:
> +    const: ti,tdp158
> +
> +  reg:
> +    description: I2C address of the device
> +
> +  enable-gpios:
> +    description: GPIO controlling bridge enable
> +
> +  vcc-supply:
> +    description: Power supply 3.3V
> +
> +  vdd-supply:
> +    description: Power supply 1.1V
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Bridge input
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Bridge output
> +
> +    required:
> +      - port@0
> +      - port@1

The device supports DVI, HDMI or DP input, with various requirements and
capabilities depending on the input. Your binding doesn't address that.

Similarly, it can do lane-swapping, so we should probably have a
property to describe what mapping we want to use.

The i2c register access (and the whole behaviour of the device) is
constrained on the I2C_EN pin status, and you can't read it from the
device, so it's also something we need to have in the DT.

Maxime

--lhkfrzu56kvv4h74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZoK0FwAKCRDj7w1vZxhR
xb5SAQC7C1i3V14Bm9Ek2IIKLRXmtEYsKcUrZ4FlRIjZRzvKtAEAy0aBt+rbc0v4
otC/OGrbBAmUt8Dp4qXiky4om9DL8ws=
=RIJA
-----END PGP SIGNATURE-----

--lhkfrzu56kvv4h74--

