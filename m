Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53DE42D66E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 11:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhJNJyF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 05:54:05 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:37059 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhJNJyF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 05:54:05 -0400
Received: (Authenticated sender: thomas.perrot@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B0306E0009;
        Thu, 14 Oct 2021 09:51:58 +0000 (UTC)
Message-ID: <2c34a05884cd68eb08e061e9d4d1aa572d78f03c.camel@bootlin.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
From:   Thomas Perrot <thomas.perrot@bootlin.com>
To:     Aleksander Morgado <aleksander@aleksander.es>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, hemantk@codeaurora.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Date:   Thu, 14 Oct 2021 11:51:56 +0200
In-Reply-To: <CAAP7ucLu9JJjo+gN6fsSZVGKHX6VGoYkgBmsA0s9qsA-hdH6=A@mail.gmail.com>
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
         <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
         <CAAP7ucLu9JJjo+gN6fsSZVGKHX6VGoYkgBmsA0s9qsA-hdH6=A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-5/VfkVZfWHAJYhODjI+1"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--=-5/VfkVZfWHAJYhODjI+1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Aleksander,

On Tue, 2021-10-12 at 21:44 +0200, Aleksander Morgado wrote:
> > > I'm working on a setup using a RPi CM4 based board and a Sierra
> > > Wireless EM9191 module, running OpenWRT 21.02 and backported
> > > mhi+wwan
> > > drivers (from latest 5.15 rc). The kernel also has the
> > > mhi_pci_dev_info entry written by Thomas, as per
> > > https://forum.sierrawireless.com/t/sierra-wireless-airprime-em919x-pc=
ie-support/24927
> > >=20
> > > The EM9191 is now running 02.08.01.00 (latest firmware from
> > > Sierra),
> > > upgraded in several steps back from the original 01.04.01.02 the
> > > module came with. The firmware upgrades were done with
> > > qmi-firmware-update and the module in USB mode=C2=A0 in a desktop PC.
> > >=20
> > > Most of the system boots end up with the mhi driver reporting
> > > that the
> > > module firmware crashed in different ways:
> > >=20
> > > [=C2=A0=C2=A0=C2=A0 7.060730] mhi-pci-generic 0000:01:00.0: MHI PCI d=
evice
> > > found:
> > > sierra-em919x
> > > [=C2=A0=C2=A0=C2=A0 7.067906] mhi-pci-generic 0000:01:00.0: BAR 0: as=
signed [mem
> > > 0x600000000-0x600000fff 64bit]
> > > [=C2=A0=C2=A0=C2=A0 7.076455] mhi-pci-generic 0000:01:00.0: enabling =
device
> > > (0000 ->
> > > 0002)
> > > [=C2=A0=C2=A0=C2=A0 7.083277] mhi-pci-generic 0000:01:00.0: using sha=
red MSI
> > > [=C2=A0=C2=A0=C2=A0 7.089508] mhi mhi0: Requested to power ON
> > > [=C2=A0=C2=A0=C2=A0 7.094080] mhi mhi0: Attempting power on with EE: =
PASS
> > > THROUGH,
> > > state: SYS ERROR
> > > [=C2=A0=C2=A0=C2=A0 7.180371] mhi mhi0: local ee: INVALID_EE state: R=
ESET device
> > > ee:
> > > PASS THROUGH state: SYS ERROR
> > > [=C2=A0=C2=A0=C2=A0 7.187146] mhi mhi0: Power on setup success
> > > [=C2=A0=C2=A0=C2=A0 7.187219] mhi mhi0: Handling state transition: PB=
L
> > > [=C2=A0=C2=A0=C2=A0 7.189165] mhi mhi0: System error detected
> > > [=C2=A0=C2=A0=C2=A0 7.189178] mhi mhi0: Device MHI is not in valid st=
ate
> > > [=C2=A0=C2=A0=C2=A0 7.189189] mhi-pci-generic 0000:01:00.0: firmware =
crashed (7)
> > > [=C2=A0=C2=A0=C2=A0 7.213682] mhi mhi0: Handling state transition: SY=
S ERROR
> > > [=C2=A0=C2=A0=C2=A0 7.219183] mhi mhi0: Transitioning from PM state: =
Linkdown or
> > > Error Fatal Detect to: SYS ERROR Process
> > > [=C2=A0=C2=A0=C2=A0 7.228590] mhi-pci-generic 0000:01:00.0: firmware =
crashed (6)
> > > [=C2=A0=C2=A0=C2=A0 7.234429] mhi mhi0: Failed to transition from PM =
state:
> > > Linkdown
> > > or Error Fatal Detect to: SYS ERROR Process
> > > [=C2=A0=C2=A0=C2=A0 7.244433] mhi mhi0: Exiting with PM state: Linkdo=
wn or Error
> > > Fatal Detect, MHI state: RESET
> > > [=C2=A0=C2=A0=C2=A0 7.252963] mhi mhi0: Handling state transition: DI=
SABLE
> > > [=C2=A0=C2=A0=C2=A0 7.258278] mhi mhi0: Processing disable transition=
 with PM
> > > state:
> > > Linkdown or Error Fatal Detect
> > > [=C2=A0=C2=A0=C2=A0 7.267155] mhi mhi0: Waiting for all pending event=
 ring
> > > processing
> > > to complete
> > > [=C2=A0=C2=A0=C2=A0 7.274480] mhi mhi0: Waiting for all pending threa=
ds to
> > > complete
> > > [=C2=A0=C2=A0=C2=A0 7.280576] mhi mhi0: Reset all active channels and=
 remove MHI
> > > devices
> > > [=C2=A0=C2=A0=C2=A0 7.287110] mhi mhi0: Resetting EV CTXT and CMD CTX=
T
> > > [=C2=A0=C2=A0=C2=A0 7.292077] mhi mhi0: Exiting with PM state: DISABL=
E, MHI
> > > state:
> > > RESET
> > > [=C2=A0=C2=A0=C2=A0 7.298683] mhi-pci-generic 0000:01:00.0: failed to=
 power up
> > > MHI
> > > controller
> > > [=C2=A0=C2=A0=C2=A0 7.306184] mhi-pci-generic: probe of 0000:01:00.0 =
failed with
> > > error
> > > -110
> > >=20
> > > Some of the boots successfully finish and I can talk to both the
> > > QMI
> > > and MBIM ports exposed by the WWAN subsystem, but the success
> > > rate is
> > > extremely low.
> > >=20
> > > Thomas, are you seeing similar issues in your setup?
> >=20
> > On our setup, using i.MX6DL based board and a PCIe Sierra Wireless
> > EM9190 module, running Yocto and Linux 5.13, we don't have much
> > success
> > for the moment, qmi and mbim commands very often end in timeout.
> >=20
> > Otherwise, when responses are received, we also can observe strange
> > things: unexpected messages, response to previous commands or queue
> > buffer issue.
> >=20
>=20
> Are you testing this with qmicli + mbimcli + ModemManager? And if so,
> are you running the qmicli/mbimcli commands with the "-p" option in
> order to always use the intermediate qmi-proxy/mbim-proxy? I'd
> suggest
> to always do that to avoid having multiple processes talking to the
> ports at the same time.
>=20

In first, I'm testing with qmicli/mbimcli commands with the "-p" option
in order to always use the intermediate qmi-proxy/mbim-proxy that that
I run in debug mode beforehand.

>=20
> > I updated the topic opened on the Sierra Wireless forum, with our
> > latest progress and as well as additional information.
> >=20
> > In addition, we observed some strange behavior of the EM919x after
> > warm
> > reboots.
> >=20
>=20
> Is the log after the warm reboots similar to the one I showed in my
> first email, i.e. with the 2 reported "firmware crashes"? Or does it
> look totally different?

After warm reboots, we observe no explain message indicating an error,
but we use an old firmware version.

> And, do you always see the module booting properly on cold boots? Or
> do you see failed boots like the one i showed in my first email?

The module doesn't always booting properly, you see failed boots like
the one you showed.

Best regards,
Thomas

>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-5/VfkVZfWHAJYhODjI+1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmFn/bwACgkQn8ALBXH+
Cu04xgv/dcliQvdArxKT/CwwLG6rIolfwOCyobGaMyu9jhkRTUYMxjqKYnJWFZNp
lF2c7KyrO1kfkbUVK1QlvgTyRc9IsWs9PnaZEiW/aqsHng8/87Sgs7Yl8TvJOrGs
hXPYYOkZ5rPl7idkcLElnulM3HVKAyni8ObAEaeTWUGYu590NtpKXKrtW8L746Qg
jZRl4vDmeApG6097UI32eWtUioJBBpWAJRMQ68mpmsodbquh8pFXHsuWaMxivcTo
eFaO/T/2InXrHdoR0ALODoks9WWz+KZxRCHB7Lre3eXp8R0UHm8CDWRSouKbqyKP
ioPQKZFQ3ysc9KDXWiOZ3d5+LnnkaPhxZR697yaU6EKju9Y7joWsd5cCo8JeZvet
+CVW0FJSKybeuQqkXGFZargL4qKro6Qs9MpWyOJ8fULFUOs5k/NbAS5GFumXSkgR
vWPUtUzkL0rriZPrishZXpFn1yfg7FDhbQ6G/x+4FywSHBuhgjtIm/TunLMExgM3
0ooaGDPY
=pjSa
-----END PGP SIGNATURE-----

--=-5/VfkVZfWHAJYhODjI+1--

