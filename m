Return-Path: <linux-arm-msm+bounces-25501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E5492A546
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 16:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D29628282C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 14:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC07142E88;
	Mon,  8 Jul 2024 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZdvM0Iu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BE61420C9;
	Mon,  8 Jul 2024 14:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720450766; cv=none; b=srQ7wEYL1wNh2WaidHG+WrWtGca4ogXRe6pIJQhivl/R0CRdh3r0YYgBS68VbQG+Uq91da2njtIcoSJlPltdra6wXr2zUn8urHcmN1o4wk1hnRvcbIwl0/K1RGF8hTgNg4RpofiBnfBgU18ki3ajHiTnwPC0jtKMBVQr7f1yNog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720450766; c=relaxed/simple;
	bh=oLZHFnJFNi8m8krEoLGQPvZmgohhon3PIubl9n/KAV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJOa/ACZe3kQI8otI3pjfkXnYdOwqzpxFdip3ieolsXJheao5lzp58h3CWK2wV0yLyEx9FMx8riPlSq26fi7i/pWotQpbWvoCbqnOODjZx+7xVu09G1WSbzM/5NdJrFtKJiYOQJ6/Hj+F6m9D53RBUdctHZ0XnH+wmNGDNgoQeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZdvM0Iu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568C6C4AF0A;
	Mon,  8 Jul 2024 14:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720450765;
	bh=oLZHFnJFNi8m8krEoLGQPvZmgohhon3PIubl9n/KAV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pZdvM0Iu0OAPSpNVJKkpK9Vv6BQAv/6gpvZLKeQtspun5Rxp50KwfkVTUFdSLbjI7
	 eAsCveae79U87T998w3/3UZaUHRqIlMW+xnXJQRzH5LA4a3JmmBhUFGAgGeRSZiBoG
	 OWxiUxzLSaUZ2IS9b4ONFIiXx+3/nxpL281+IU4BboUJbGLBzXEAX9Tl48hWErU7aq
	 8gHJnqn9zE1d2yR6kA6tcSLqlxWAOBGcgq+oZMn+unZuTgBujNOS0TmXgoQ/VTZJA7
	 iJ2RGI3vXm8juu7HyUwWCdRWvwomvFdRdD7TQwnD6p/9X7v8TIG4/f+5jqNuwBlq2E
	 GLurkwq23lFCA==
Date: Mon, 8 Jul 2024 16:59:23 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <20240708-ethereal-romantic-piculet-d4ae66@houat>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e7bbbe4e-7deb-46c3-9cce-1922f9b6b3a2@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="kopfx6abx7uf4ddg"
Content-Disposition: inline
In-Reply-To: <e7bbbe4e-7deb-46c3-9cce-1922f9b6b3a2@freebox.fr>


--kopfx6abx7uf4ddg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 05:36:18PM GMT, Marc Gonzalez wrote:
> On 01/07/2024 15:50, Maxime Ripard wrote:
>=20
> > On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
> >
> >> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> >> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> >> It supports 4 TMDS channels, HPD, and a DDC interface.
> >> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> >> for power reduction. Several methods of power management are
> >> implemented to reduce overall power consumption.
> >> It supports fixed receiver EQ gain using I2C or pin strap to
> >> compensate for different lengths input cable or board traces.
> >>
> >> Features
> >>
> >> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> >> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> >> data rate, compatible with HDMI 2.0b electrical parameters
> >> - DisplayPort dual-mode standard version 1.1
> >> - Programmable fixed receiver equalizer up to 15.5dB
> >> - Global or independent high speed lane control, pre-emphasis
> >> and transmit swing, and slew rate control
> >> - I2C or pin strap programmable
> >> - Configurable as a DisplayPort redriver through I2C
> >> - Full lane swap on main lanes
> >> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
> >>
> >> https://www.ti.com/lit/ds/symlink/tdp158.pdf
> >>
> >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> >> ---
> >>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 +++++++++++++=
+++++++++
> >>  1 file changed, 51 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp15=
8.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> >> new file mode 100644
> >> index 0000000000000..21c8585c3bb2d
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> >> @@ -0,0 +1,51 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: TI TDP158 HDMI to TMDS Redriver
> >> +
> >> +maintainers:
> >> +  - Arnaud Vrac <avrac@freebox.fr>
> >> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: ti,tdp158
> >> +
> >> +  reg:
> >> +    description: I2C address of the device
> >> +
> >> +  enable-gpios:
> >> +    description: GPIO controlling bridge enable
> >> +
> >> +  vcc-supply:
> >> +    description: Power supply 3.3V
> >> +
> >> +  vdd-supply:
> >> +    description: Power supply 1.1V
> >> +
> >> +  ports:
> >> +    $ref: /schemas/graph.yaml#/properties/ports
> >> +
> >> +    properties:
> >> +      port@0:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +        description: Bridge input
> >> +
> >> +      port@1:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +        description: Bridge output
> >> +
> >> +    required:
> >> +      - port@0
> >> +      - port@1
> >=20
> > The device supports DVI, HDMI or DP input, with various requirements and
> > capabilities depending on the input. Your binding doesn't address that.
> >=20
> > Similarly, it can do lane-swapping, so we should probably have a
> > property to describe what mapping we want to use.
> >=20
> > The i2c register access (and the whole behaviour of the device) is
> > constrained on the I2C_EN pin status, and you can't read it from the
> > device, so it's also something we need to have in the DT.
>=20
> We are using the device in its default configuration.
> (Power on via OE, then it works as expected)

I know, but that doesn't really matter for a binding.

> Can we leave any additional properties to be defined by whomever needs
> them in the future?

If you can guarantee that doing so would be backward compatible, sure.
But that means being able to answer those questions with a reasonable
plan.

Maxime

--kopfx6abx7uf4ddg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZov+ygAKCRAnX84Zoj2+
dv/EAYDdyYxojHqIYebCO337L4bW6W074cgkpmwvgnbWAVxCRWViDUMdUTpKAXxf
odUWQ6IBgJrGQ3od02hFC2F34PHn8/vUxZk9Lb2LuSmabRyII/7jnymhYesMtmfF
2INbhUBK+A==
=HW4H
-----END PGP SIGNATURE-----

--kopfx6abx7uf4ddg--

