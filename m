Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C260306754
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 00:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbhA0W4N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 17:56:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbhA0W4I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 17:56:08 -0500
X-Greylist: delayed 474 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 27 Jan 2021 14:32:47 PST
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [IPv6:2a00:da80:fff0:2::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BA43C06174A;
        Wed, 27 Jan 2021 14:32:47 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 708311C0B8E; Wed, 27 Jan 2021 23:24:08 +0100 (CET)
Date:   Wed, 27 Jan 2021 23:24:07 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add initial support for BQ Aquaris X5
Message-ID: <20210127222407.GD24799@amd>
References: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
 <20210124210119.GA27676@amd>
 <YA3rTAx2vfOXPCMq@gerhold.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BI5RvnYi6R4T2M87"
Content-Disposition: inline
In-Reply-To: <YA3rTAx2vfOXPCMq@gerhold.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--BI5RvnYi6R4T2M87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Aquaris X5 (Longcheer L8910) is a smartphone released by BQ in 2015.
> > >=20
> > > As part of msm8916-mainline project, this series aims to bring initial
> > > mainline support for it.
> >=20
> > Good to see another phone being supported. Can I ask you to cc:
> > phone-devel@vger.kernel.org with phone stuff?
> >=20
> > > Features added:
> > >  - SDHCI (internal and external storage)
> > >  - USB Device Mode
> > >  - UART
> > >  - Regulators
> > >  - WiFi/BT
> > >  - Volume buttons
> > >  - Vibrator
> > >  - Touchkeys backlight
> > >  - Accelerometer and gyroscope sensor
> > >  - Magnetometer sensor
> >=20
> > How close are you to having useful phone calls?
>=20
> You can do phone calls (with audio) and you can use mobile data, if you
> have the patches for that. :) I'm trying to find time to finish up the
> drivers needed for that, but I've been a bit short on time lately.

:-).=20

> Actually we have come pretty far with MSM8916-based smartphones.
> Most functionality is (somewhat) working at this point, the primary
> open task is optimizing suspend/power consumption. Battery/charging
> and camera is also tricky but works somewhat on some of the devices.

Yes, power consumption is a lot of fun :-(.

> Most of the functionality is packaged in postmarketOS [1] and you can
> find a list of the devices in the postmarketOS wiki [2]. Especially
> the ones in the "community" category are quite similar in terms of
> working functionality.

I know about postmarketOS (I even contributed a bit some time ago),
and watch it from time to time. Currently I'm using old Nokia 6151 for
phone calls, but would not mind switching. Work is ongoing in Droid 4
land -- phone calls are also "almost there". But the almost seems to
be a lot of work :-(.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--BI5RvnYi6R4T2M87
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmAR6AcACgkQMOfwapXb+vJIwwCcDASqiP104rhpm8QJgQ160Qda
GUgAn3bYBt4Yh25JM6rh0GIsEKcoCrH9
=trfK
-----END PGP SIGNATURE-----

--BI5RvnYi6R4T2M87--
