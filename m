Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5909E2BC127
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Nov 2020 18:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgKURoq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Nov 2020 12:44:46 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:57494 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbgKURop (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Nov 2020 12:44:45 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 86DE91C0B7C; Sat, 21 Nov 2020 18:44:42 +0100 (CET)
Date:   Sat, 21 Nov 2020 18:44:42 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: sdm845: add oneplus 6/t devices
Message-ID: <20201121174442.GA12057@duo.ucw.cz>
References: <20201112161920.2671430-1-caleb@connolly.tech>
 <20201112161920.2671430-4-caleb@connolly.tech>
 <20201116220153.GA1003@bug>
 <a20145ef-31a1-a72d-2d60-87a5282ace87@connolly.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <a20145ef-31a1-a72d-2d60-87a5282ace87@connolly.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-11-16 23:49:32, Caleb Connolly wrote:
> On 2020-11-16 22:01, Pavel Machek wrote:
> > Hi!
> >
> >> Add initial support for the OnePlus 6 (enchilada) and 6T (fajita) based
> >> on the sdm845-mtp DT. Support includes:
> >>
> >> * Display panels and Adreno 630
> >> * Touch screen support with synaptics rmi4
> >> * All remoteprocs start correctly
> >> * WLAN / Bluetooth
> >> * Volume / power buttons and OnePlus Tri-State switch are functional
> >>      The tri-state switch is a 3 state mute slider on the side of the =
phone * USB
> >> support, currently forced to peripheral as type C detection isn't func=
tional.
> > I have similar switches on my joystick... but I don't believe modelling=
 it as 3 separate
> > keys with "macro" keysym is the right way to go.
>=20
> Hi! I agree that this is a bit of a weird way to model the switch, do=20
> you have any ideas for a better solution?

You should ask on the input mailing list, I guess.

Best regards,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX7lSCgAKCRAw5/Bqldv6
8jxNAKC4o5ygVLVd+at56gz7xUlBzH8xVACdFWV2UYjfFsDiF/QZkq9jDna2iSU=
=SfAe
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
