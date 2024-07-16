Return-Path: <linux-arm-msm+bounces-26290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBC49322AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 11:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FE951F21806
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 09:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C71195B35;
	Tue, 16 Jul 2024 09:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSP+DQRb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276E519580A;
	Tue, 16 Jul 2024 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721121871; cv=none; b=aIDQmpPQaUxk053EjgZLzaxBifupdcp9m/yniA/puxARhhulfPuGsq+bfY7/yjS0U4WT5oSXzM5zr/EPEMaMNTbfKhCerLleshhuw7futa314ZKJJAmfY736wCOcYyl/oXrUgQQzZOSleSbHvAoNyiDHt+O68C5nTqlTlg5st7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721121871; c=relaxed/simple;
	bh=fXZ0Kgqf1pwfNcwvyCamvWWslne7zOiuIhH2bvEJfZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erHszj0ZAakGc46KGQN+le0tRYnlj66SUZEkQ+23vGZw7QiV5TNbIbSwxv2eywH8rFCU6o5n52ltRfPRfp2ndv6cLX+tUHXebjeXof9qEj2B9tgNsW0w/El2gOAHDbpPKpHTiCA0iNCuWs2tzEi/IB5yHh0Y7fA4vRKr95/OzLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSP+DQRb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45393C116B1;
	Tue, 16 Jul 2024 09:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721121870;
	bh=fXZ0Kgqf1pwfNcwvyCamvWWslne7zOiuIhH2bvEJfZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PSP+DQRbMdJdJSRGZsUjjJONS5RZahZ7I99w2s1CiKSDDPI6uxIUvFjtxHud5KnER
	 3DU2ELT24Wk+XhY/Gp44gr/+RgahP1FkPFo1AnK6snkuW8ruLLnY3nZIf3N43y+bde
	 TpQfBnqqLsYwu5Zznh2kBblZCKRIE8tPRoFd4FihwBLrsAC3/6SYAQ749G6/pwTRxU
	 Gh32YqJ7xTbeA13DiPc1CwV1BTXozw6J7WOc6Wh6fq6qR2mA2uDcUggAZWoigNDx9Q
	 DQ3Zne5kIltdtQUeFDf0ejBnNDUjPHVw8qrfmlE6OkHTg2zWhUUojMjRMFw0iWUTsR
	 pwIbcUkd5uSgA==
Date: Tue, 16 Jul 2024 11:24:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <20240716-exuberant-diligent-beagle-c43ffc@houat>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e7bbbe4e-7deb-46c3-9cce-1922f9b6b3a2@freebox.fr>
 <20240708-ethereal-romantic-piculet-d4ae66@houat>
 <pp3rc5zob3xeghlatw4vnpzplc4yjpjadkea465zmhft55dyl5@3cpoc2zovftv>
 <20240715-shiny-enigmatic-firefly-2a6dec@houat>
 <CAA8EJpoJ0132ZYGCO=8xQt8J4Z9w5jDON1H-VRCemFdyV-9nUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="i7lq7kbgwmmu4grx"
Content-Disposition: inline
In-Reply-To: <CAA8EJpoJ0132ZYGCO=8xQt8J4Z9w5jDON1H-VRCemFdyV-9nUw@mail.gmail.com>


--i7lq7kbgwmmu4grx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 15, 2024 at 07:38:34PM GMT, Dmitry Baryshkov wrote:
> On Mon, 15 Jul 2024 at 17:42, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Mon, Jul 08, 2024 at 11:29:46PM GMT, Dmitry Baryshkov wrote:
> > > On Mon, Jul 08, 2024 at 04:59:23PM GMT, Maxime Ripard wrote:
> > > > On Mon, Jul 01, 2024 at 05:36:18PM GMT, Marc Gonzalez wrote:
> > > > > On 01/07/2024 15:50, Maxime Ripard wrote:
> > > > >
> > > > > > On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
> > > > > >
> > > > > >> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redr=
iver.
> > > > > >> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> > > > > >> It supports 4 TMDS channels, HPD, and a DDC interface.
> > > > > >> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> > > > > >> for power reduction. Several methods of power management are
> > > > > >> implemented to reduce overall power consumption.
> > > > > >> It supports fixed receiver EQ gain using I2C or pin strap to
> > > > > >> compensate for different lengths input cable or board traces.
> > > > > >>
> > > > > >> Features
> > > > > >>
> > > > > >> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> > > > > >> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> > > > > >> data rate, compatible with HDMI 2.0b electrical parameters
> > > > > >> - DisplayPort dual-mode standard version 1.1
> > > > > >> - Programmable fixed receiver equalizer up to 15.5dB
> > > > > >> - Global or independent high speed lane control, pre-emphasis
> > > > > >> and transmit swing, and slew rate control
> > > > > >> - I2C or pin strap programmable
> > > > > >> - Configurable as a DisplayPort redriver through I2C
> > > > > >> - Full lane swap on main lanes
> > > > > >> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
> > > > > >>
> > > > > >> https://www.ti.com/lit/ds/symlink/tdp158.pdf
> > > > > >>
> > > > > >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > > > > >> ---
> > > > > >>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 +++++=
+++++++++++++++++
> > > > > >>  1 file changed, 51 insertions(+)
> > > > > >>
> > > > > >> diff --git a/Documentation/devicetree/bindings/display/bridge/=
ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158=
=2Eyaml
> > > > > >> new file mode 100644
> > > > > >> index 0000000000000..21c8585c3bb2d
> > > > > >> --- /dev/null
> > > > > >> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp1=
58.yaml
> > > > > >> @@ -0,0 +1,51 @@
> > > > > >> +# SPDX-License-Identifier: GPL-2.0-only
> > > > > >> +%YAML 1.2
> > > > > >> +---
> > > > > >> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.y=
aml#
> > > > > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > >> +
> > > > > >> +title: TI TDP158 HDMI to TMDS Redriver
> > > > > >> +
> > > > > >> +maintainers:
> > > > > >> +  - Arnaud Vrac <avrac@freebox.fr>
> > > > > >> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
> > > > > >> +
> > > > > >> +properties:
> > > > > >> +  compatible:
> > > > > >> +    const: ti,tdp158
> > > > > >> +
> > > > > >> +  reg:
> > > > > >> +    description: I2C address of the device
> > > > > >> +
> > > > > >> +  enable-gpios:
> > > > > >> +    description: GPIO controlling bridge enable
> > > > > >> +
> > > > > >> +  vcc-supply:
> > > > > >> +    description: Power supply 3.3V
> > > > > >> +
> > > > > >> +  vdd-supply:
> > > > > >> +    description: Power supply 1.1V
> > > > > >> +
> > > > > >> +  ports:
> > > > > >> +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > >> +
> > > > > >> +    properties:
> > > > > >> +      port@0:
> > > > > >> +        $ref: /schemas/graph.yaml#/properties/port
> > > > > >> +        description: Bridge input
> > > > > >> +
> > > > > >> +      port@1:
> > > > > >> +        $ref: /schemas/graph.yaml#/properties/port
> > > > > >> +        description: Bridge output
> > > > > >> +
> > > > > >> +    required:
> > > > > >> +      - port@0
> > > > > >> +      - port@1
> > > > > >
> > > > > > The device supports DVI, HDMI or DP input, with various require=
ments and
> > > > > > capabilities depending on the input. Your binding doesn't addre=
ss that.
> > > > > >
> > > > > > Similarly, it can do lane-swapping, so we should probably have a
> > > > > > property to describe what mapping we want to use.
> > > > > >
> > > > > > The i2c register access (and the whole behaviour of the device)=
 is
> > > > > > constrained on the I2C_EN pin status, and you can't read it fro=
m the
> > > > > > device, so it's also something we need to have in the DT.
> > > > >
> > > > > We are using the device in its default configuration.
> > > > > (Power on via OE, then it works as expected)
> > > >
> > > > I know, but that doesn't really matter for a binding.
> > > >
> > > > > Can we leave any additional properties to be defined by whomever =
needs
> > > > > them in the future?
> > > >
> > > > If you can guarantee that doing so would be backward compatible, su=
re.
> > > > But that means being able to answer those questions with a reasonab=
le
> > > > plan.
> > >
> > > I think proposed bindings are generic enough to cover other possible
> > > usecases in future.
> >
> > I don't think it is. The current binding is for a I2C device that
> > shouldn't be accessed through I2C.
> >
> > It's working for now because the driver doesn't do any access, so it's
> > all great, but as soon as we add support for the other case, then we'll
> > have to add a property that states that while it's an i2c device, it
> > shouldn't be accessed.
> >
> > And adding such a property is a compatibility-breaking change.
>=20
> Please correct me if I'm wrong. We have following usecases.
>=20
> 1. I2C_EN pulled low. TI158 is in the pin strap mode, it is not
> connected to the I2C bus. A0, A1, SDA and SCL pins are used for
> strapping the settings.
>     board DT file should describe the bridge as a platform device
> sitting directly under the root node.

DT maintainers have required that reg is always present in the other
sub-thread.

> 2. I2C_EN pulled high. TI158 is in the I2C mode. It is connected to
> the I2C bus, A0/A1 pins set the I2C bus address. The device is
> controlled over the I2C bus
>=20
> 2.a. The same as 2, but the device is not controlled at all, default
> settings are fine.
>=20
> The driver covers usecase 2.a. The bindings allow extending the driver
> to the usecase 2 (e.g. via optional properties which specify
> bord-specific settings)
>=20
> The usecase 1 is a completely separate topic, it requires a different
> schema file, specifying no i2c address, only voltages supplies and
> enable-gpios.

I could have mis-unnderstood, but my understanding was that they were
running it with I2C_EN tied low.

Of course, that's one of the thing that is completely missing from the
commit log, so who knows.

Maxime

--i7lq7kbgwmmu4grx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZpY8SwAKCRAnX84Zoj2+
drtIAX4oy5ccxGuFNdq4snZYFczlTpLNPQWUUIqFlLKR7nzMr8Y5It/g4VYglaX+
tqBgbqoBfidQiZpmj4Y/CqLHJhBeMyLcBqRhqQcbEvKAyr3KACTK4SGYe9/sR37+
O4ydWST1wQ==
=Lonf
-----END PGP SIGNATURE-----

--i7lq7kbgwmmu4grx--

