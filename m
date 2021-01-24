Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7E8301ED6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 22:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbhAXVCF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 16:02:05 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:40398 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbhAXVCF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 16:02:05 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 083D91C0B78; Sun, 24 Jan 2021 22:01:22 +0100 (CET)
Date:   Sun, 24 Jan 2021 22:01:19 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Jonathan Albrieux <jonathan.albrieux@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, stephan@gerhold.net,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] Add initial support for BQ Aquaris X5
Message-ID: <20210124210119.GA27676@amd>
References: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Aquaris X5 (Longcheer L8910) is a smartphone released by BQ in 2015.
>=20
> As part of msm8916-mainline project, this series aims to bring initial
> mainline support for it.

Good to see another phone being supported. Can I ask you to cc:
phone-devel@vger.kernel.org with phone stuff?

> Features added:
>  - SDHCI (internal and external storage)
>  - USB Device Mode
>  - UART
>  - Regulators
>  - WiFi/BT
>  - Volume buttons
>  - Vibrator
>  - Touchkeys backlight
>  - Accelerometer and gyroscope sensor
>  - Magnetometer sensor

How close are you to having useful phone calls?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmAN4B8ACgkQMOfwapXb+vIurwCeOfoclWc/hFFQWSYk07t8rR/u
ayUAn0XmgWYPge4Wvj+GmsM5cvHfLXtC
=XoDv
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
