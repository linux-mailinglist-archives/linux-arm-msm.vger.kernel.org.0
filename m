Return-Path: <linux-arm-msm+bounces-27393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E460940DB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 11:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42E7F286375
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 09:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A716F199235;
	Tue, 30 Jul 2024 09:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWdOQ9q9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB4E199230;
	Tue, 30 Jul 2024 09:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722331804; cv=none; b=PSerMmM76alXJodcl+tGLAVABw7BHDHgyEuAAs/lps/F3/uHV2Zo/ZgaX8VpU6lweMZ9TERSgdaZZix27LzvBqU15Y8gJCCFS2e1qzN27IHs+5xjRE/Y0crQsviOSvkxdxQnbecM2kaXTAs0S8PBpfcFid7Gshf26xo2cS3mA/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722331804; c=relaxed/simple;
	bh=866TXeg6/lVMOOh1VA2DnyXNgGcIYgYvjmmK4pTqemk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6Ff0cBjFKHKwly4Uc+gGe6BdWKihIDx7WVWfX/G6s0JCpLpqvux5mpd6bt+fSfclzrV3BJ3PFSp2uxo6x3Chy5l+uM2UcUz7L6ncuRGm+UDhS6//WSy48GMs3+m3uXyWYMHKaH4XdMH9hngngp6xxq+561OzyZ7CPXfuuZUZ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWdOQ9q9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12F2C4AF09;
	Tue, 30 Jul 2024 09:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722331804;
	bh=866TXeg6/lVMOOh1VA2DnyXNgGcIYgYvjmmK4pTqemk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sWdOQ9q9w+P0DlcZJJtBlBYFMzhGxrnABqu/l+k8KN0HGhMBKQQraHJtf4//0nzHG
	 08CosLGFIWhEIdzamsuxedJaiVmsnlhvkf6Ij8NuJk6zlxVth2cce+l5prFFOJsR9t
	 gWmEyq6OGzsT5R+j+Z6xL0yc875fvqNW+OYvF+mm2pYrJ4f5PPvZijHCMGuBuSNUfQ
	 H38xJHFrXiTBFa3x6oay9ODeThosfdSZOwcwWXTUodI+ZsIMdBdGfoRt4Je1ItkT51
	 Fn5YIMNMlsaRkGrOqXw7OLxV1v3grbb1ONsXkB0Uyr+ZF07OIohb8IS0ZsGaqfAlkp
	 rJR/inc6Zh5kA==
Date: Tue, 30 Jul 2024 11:30:01 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <20240730-miniature-wonderful-okapi-01aa0f@houat>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e55d0f0e-a104-4790-b832-120dbddd93ad@freebox.fr>
 <20240715-stirring-purple-toad-7de58c@houat>
 <c302bc47-6492-44af-86a1-3ff6a815e314@freebox.fr>
 <20240730-eminent-venomous-condor-8ef421@houat>
 <CAA8EJprQJJ2AuB99RFU+d074PV+NHMPwjFWn_auju7HYQQ8R7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="exkfzcorvtdik2dz"
Content-Disposition: inline
In-Reply-To: <CAA8EJprQJJ2AuB99RFU+d074PV+NHMPwjFWn_auju7HYQQ8R7w@mail.gmail.com>


--exkfzcorvtdik2dz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 11:46:24AM GMT, Dmitry Baryshkov wrote:
> On Tue, 30 Jul 2024 at 11:27, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Wed, Jul 24, 2024 at 07:59:21PM GMT, Marc Gonzalez wrote:
> > > On 15/07/2024 16:40, Maxime Ripard wrote:
> > > > On Thu, Jul 04, 2024 at 07:04:41PM GMT, Marc Gonzalez wrote:
> > > >> On 01/07/2024 15:50, Maxime Ripard wrote:
> > > >>
> > > >>> The i2c register access (and the whole behaviour of the device) is
> > > >>> constrained on the I2C_EN pin status, and you can't read it from =
the
> > > >>> device, so it's also something we need to have in the DT.
> > > >>
> > > >> I think the purpose of the I2C_EN pin might have been misunderstoo=
d.
> > > >>
> > > >> I2C_EN is not meant to be toggled, ever, by anyone from this plane=
t.
> > > >
> > > > Toggled, probably not. Connected to a GPIO and the kernel has to as=
sert
> > > > a level at boot, I've seen worse hardware design already.
> > > >
> > > >> I2C_EN is a layout-time setting, decided by a board manufacturer:
> > > >>
> > > >> - If the TDP158 is fully configured once-and-for-all at layout-tim=
e,
> > > >> then no I2C bus is required, and I2C_EN is pulled down forever.
> > > >>
> > > >> - If the board manufacturer wants to keep open the possibility
> > > >> to adjust some parameters at run-time, then they must connect
> > > >> the device to an I2C bus, and I2C_EN is pulled up forever.
> > > >
> > > > How do you express both cases in your current binding?
> > >
> > > It's not that I'm ignoring your question.
> > >
> > > It's that I don't understand what you're asking.
> >
> > And that's fine, you just need to say so.
> >
> > Generally speaking, you're focusing on the driver. The driver is not the
> > issue here. You can do whatever you want in the driver for all I care,
> > we can change that later on as we wish.
> >
> > The binding however cannot change, so it *has* to ideally cover all
> > possible situations the hardware can be used in, or at a minimum leave
> > the door open to support those without a compatibility breakage.
> >
> > That's why I've been asking those questions, because so far the only
> > thing you've claimed is that "I can't test the driver for anything
> > else", but, again, whether there's a driver or not, or if it's
> > functional, is completely missing the point.
> >
> > > SITUATION 1
> > > tdp158 is pin strapped.
> > > Device node is child of root node.
> > > Properties in proposed binding are valid (regulators and power-on pin)
> > > Can be supported via module_platform_driver.
> > >
> > > SITUATION 2
> > > tdp158 is sitting on I2C bus.
> > > Device node is child of i2c bus node.
> > > (robh said missing reg prop would be flagged by the compiler)
> > > Properties in proposed binding are valid (regulators and power-on pin)
> > > Supported via module_i2c_driver.
> > >
> > > If some settings-specific properties are added later, like skew,
> > > they would only be valid for the I2C programmable mode, obviously.
> >
> > I think there's a couple more combinations:
> >
> >   - The device is connected on an I2C bus, but I2C_EN is tied low
>=20
> No, this is not possible. I2C pins are repurposed if I2C_EN is low.
> You can not call that an i2c bus anymore.
>=20
> >   - The device is connected on an I2C bus, but I2C_EN is connected to a
> >     GPIO and the kernel needs to assert its state at boot.
>=20
> This is a pretty strange configuration.  The I2C_EN pin isn't supposed
> to be toggled dynamically. Anyway, if that happens, I'd use pinctrl /
> hog to control the pin.

ACK. I still believe it would be valuable, but I don't really want to be
part of that conversation anymore. Marc, do whatever you want.

Maxime

--exkfzcorvtdik2dz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZqiymQAKCRAnX84Zoj2+
dpLrAYCn7ehRdWalGs3BdyjJYr34mRqQNXl+CduUr3TyIXyMY01G0nFV/hY+BD6r
rth2hhgBfj4zR+rJxeTlKl05Q6dUyF8U/7w3wNXowxIGhVgck1+vWJLQFbtkKVG0
/75NfvqltA==
=CNZu
-----END PGP SIGNATURE-----

--exkfzcorvtdik2dz--

