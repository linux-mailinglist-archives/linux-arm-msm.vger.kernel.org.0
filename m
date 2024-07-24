Return-Path: <linux-arm-msm+bounces-26961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F55F93B236
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 16:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CE831F21D8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 14:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038B9157A58;
	Wed, 24 Jul 2024 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkAUAM8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE73A2D030;
	Wed, 24 Jul 2024 14:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721829830; cv=none; b=fAPh3uL5dPJubDKrtPw1hdPL2QUOpNan8rnY3I+hJ57oBj8+CdemTtLJ2SXGIMjTSvaesmHJQtg3BxPqEnCcQK9iA68RTWGROU2/0q9ks4PPSPxQB8J+VWPhl8GkO0dUgIIye1rS11O/pPgHHreFCPzv2jCX5jtZv3dbNJwRFbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721829830; c=relaxed/simple;
	bh=O/+y/UtVZ2bDaLCFltamLCHQHJh35aLRK+efdWipark=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNSUTKskfQFk5QxuJeyoJ+Xi4f8k0PHJJhdC0/KqdR5llzijAN10FQmjyv/B0CqRyMuLdLXzICXaVSE3qkiuQuq6iul8CNSVeBDCgAjr4C0mknuHh5kn8i0p6vLVllqeKkTi3t8nLNoCSk+AQSolZrp8TSQ3CvqB0b1lGrrUNIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkAUAM8P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE92CC32781;
	Wed, 24 Jul 2024 14:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721829830;
	bh=O/+y/UtVZ2bDaLCFltamLCHQHJh35aLRK+efdWipark=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkAUAM8P+xRwZ1NeEGewbzcM9Uo8Maepvr4aeF4J/nlCLmZP4N3ZeZXYjmB8jbbc9
	 +9mk5yBaRvPdVpTzpOsKssq3KR+Ts4KGGt+wN7c5bJEkGwaO3mZLyotrAgCZrjZY5s
	 QYdT7njfXcx4AB3mzgAdOyJg04p36v28cv29OWUel8SGNHIMA7+qlg8kiVvubC2uNg
	 a1UPkYxIVU3OCvhEQpqNWdmKgHox5nAhxw+EdIqJyDyiVLxX0haWS7p87GTWb2wPIJ
	 ok9FXatrtRZSzb6ywItrgkqXRTNPOkhl0dZu+1birhG/QtCh/av8Q5OEFKTVyZegJr
	 DO1SGoPRzrOvA==
Date: Wed, 24 Jul 2024 16:03:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <20240724-mysterious-resilient-muskrat-7aff25@houat>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240627-display-quantum-48c2fa48ed1a@spud>
 <e9d53545-80fc-46d2-83a1-79842a729688@freebox.fr>
 <20240723-bounce-pliable-f81d8ea0cff8@spud>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="upkro6rw6xcihwyi"
Content-Disposition: inline
In-Reply-To: <20240723-bounce-pliable-f81d8ea0cff8@spud>


--upkro6rw6xcihwyi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 08:57:03PM GMT, Conor Dooley wrote:
> On Tue, Jul 23, 2024 at 05:17:12PM +0200, Marc Gonzalez wrote:
> > On 27/06/2024 18:25, Conor Dooley wrote:
> >=20
> > > On Thu, Jun 27, 2024 at 01:13:03PM +0200, Marc Gonzalez wrote:
> > >
> > >> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> > >> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> > >> It supports 4 TMDS channels, HPD, and a DDC interface.
> > >> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> > >> for power reduction. Several methods of power management are
> > >> implemented to reduce overall power consumption.
> > >> It supports fixed receiver EQ gain using I2C or pin strap to
> > >> compensate for different lengths input cable or board traces.
> > >>
> > >> Features
> > >>
> > >> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> > >> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> > >> data rate, compatible with HDMI 2.0b electrical parameters
> > >> - DisplayPort dual-mode standard version 1.1
> > >> - Programmable fixed receiver equalizer up to 15.5dB
> > >> - Global or independent high speed lane control, pre-emphasis
> > >> and transmit swing, and slew rate control
> > >> - I2C or pin strap programmable
> > >> - Configurable as a DisplayPort redriver through I2C
> > >> - Full lane swap on main lanes
> > >> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
> > >>
> > >> https://www.ti.com/lit/ds/symlink/tdp158.pdf
> > >>
> > >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > >> ---
> > >>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 +++++++++++=
+++++++++++
> > >>  1 file changed, 51 insertions(+)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp=
158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > >> new file mode 100644
> > >> index 0000000000000..21c8585c3bb2d
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > >> @@ -0,0 +1,51 @@
> > >> +# SPDX-License-Identifier: GPL-2.0-only
> > >> +%YAML 1.2
> > >> +---
> > >> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
> > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >> +
> > >> +title: TI TDP158 HDMI to TMDS Redriver
> > >> +
> > >> +maintainers:
> > >> +  - Arnaud Vrac <avrac@freebox.fr>
> > >> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    const: ti,tdp158
> > >> +
> > >> +  reg:
> > >> +    description: I2C address of the device
> > >=20
> > > Is reg not required? How do you communicate with the device if the i2c
> > > bus is not connected? Is the enable GPIO enough to operate it in some
> > > situations?
> > >=20
> > > Otherwise this looks good to me, but given Maxime commented about the
> > > complexity of the device, I'm probably out of my depth!
> >=20
> > Hello Conor,
> >=20
> > A cycle has been detected:
> > Above, you defer to Maxime.
> > Yet later, he wrote:
> > "DT maintainers have required that reg is always present"
>=20
> I think he was actually talking about Krzysztof.

I was.

> > I propose we NOT mark the "reg" property as required.
> > (Thus, keep the binding as proposed in v3.)
> >=20
> > Rationale:
> >=20
> > - The device can be statically configured by pin straps,
> > in which case it is NOT connected to an I2C bus.
>=20
> I'm inclined to say that, because connecting the i2c bus is not required
> at all for the device to be usable in some circumstances that we should
> not require reg. Someone could, in theory, use the device with a SoC
> without an i2c controller, right?
>=20
> > - Even if the device IS connected to an I2C bus,
> > no I2C accesses are required if the default configuration
> > meets the ODM's needs.
>=20
> In this case, I think a reg property is required actually, because it is
> on the bus, and devices on an i2c bus must have a reg property. That
> aside, even if the ODM doesn't want to change the defaults, the owner
> might.
>=20
> > Is that OK with you? Can I get your Amen?
>=20
> Sure.

We still have an entire sub-thread to this conversation that has been
completely ignored by Marc. Upstreaming is process where both sides need
to be involved, and I'm not seeing that so far.

So, yeah, until that other sub-thread is somewhat resolved, I don't see
how we can vet those bindings.

Maxime

--upkro6rw6xcihwyi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZqEJvgAKCRAnX84Zoj2+
dgmpAYDbRLtTGUTmlXDJIswJQAGw38HYIIWOc0s3wtlMM8zet3yeTgobIjlrnHlL
uZ8gDLwBgKAltB+vtFO7j/F8k5IKFDTm5y2BSfV0kq7bW4yI3CakTXu8KVTmngYn
wDLSylBHZw==
=3p8e
-----END PGP SIGNATURE-----

--upkro6rw6xcihwyi--

