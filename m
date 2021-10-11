Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 946CD429270
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 16:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240965AbhJKOrJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 10:47:09 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:60479 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238715AbhJKOrA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 10:47:00 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id A1E4FC406E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 14:44:58 +0000 (UTC)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 1FE85FF805;
        Mon, 11 Oct 2021 14:44:34 +0000 (UTC)
Message-ID: <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
From:   Thomas Perrot <thomas.perrot@bootlin.com>
To:     Aleksander Morgado <aleksander@aleksander.es>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, hemantk@codeaurora.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Date:   Mon, 11 Oct 2021 16:44:29 +0200
In-Reply-To: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-POuXhvLDVFTfRfkUSNIM"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--=-POuXhvLDVFTfRfkUSNIM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aleksander,

On Thu, 2021-10-07 at 15:04 +0200, Aleksander Morgado wrote:
> Hey all,
>=20
> I'm working on a setup using a RPi CM4 based board and a Sierra
> Wireless EM9191 module, running OpenWRT 21.02 and backported mhi+wwan
> drivers (from latest 5.15 rc). The kernel also has the
> mhi_pci_dev_info entry written by Thomas, as per
> https://forum.sierrawireless.com/t/sierra-wireless-airprime-em919x-pcie-s=
upport/24927
>=20
> The EM9191 is now running 02.08.01.00 (latest firmware from Sierra),
> upgraded in several steps back from the original 01.04.01.02 the
> module came with. The firmware upgrades were done with
> qmi-firmware-update and the module in USB mode=C2=A0 in a desktop PC.
>=20
> Most of the system boots end up with the mhi driver reporting that the
> module firmware crashed in different ways:
>=20
> [=C2=A0=C2=A0=C2=A0 7.060730] mhi-pci-generic 0000:01:00.0: MHI PCI devic=
e found:
> sierra-em919x
> [=C2=A0=C2=A0=C2=A0 7.067906] mhi-pci-generic 0000:01:00.0: BAR 0: assign=
ed [mem
> 0x600000000-0x600000fff 64bit]
> [=C2=A0=C2=A0=C2=A0 7.076455] mhi-pci-generic 0000:01:00.0: enabling devi=
ce (0000 ->
> 0002)
> [=C2=A0=C2=A0=C2=A0 7.083277] mhi-pci-generic 0000:01:00.0: using shared =
MSI
> [=C2=A0=C2=A0=C2=A0 7.089508] mhi mhi0: Requested to power ON
> [=C2=A0=C2=A0=C2=A0 7.094080] mhi mhi0: Attempting power on with EE: PASS=
 THROUGH,
> state: SYS ERROR
> [=C2=A0=C2=A0=C2=A0 7.180371] mhi mhi0: local ee: INVALID_EE state: RESET=
 device ee:
> PASS THROUGH state: SYS ERROR
> [=C2=A0=C2=A0=C2=A0 7.187146] mhi mhi0: Power on setup success
> [=C2=A0=C2=A0=C2=A0 7.187219] mhi mhi0: Handling state transition: PBL
> [=C2=A0=C2=A0=C2=A0 7.189165] mhi mhi0: System error detected
> [=C2=A0=C2=A0=C2=A0 7.189178] mhi mhi0: Device MHI is not in valid state
> [=C2=A0=C2=A0=C2=A0 7.189189] mhi-pci-generic 0000:01:00.0: firmware cras=
hed (7)
> [=C2=A0=C2=A0=C2=A0 7.213682] mhi mhi0: Handling state transition: SYS ER=
ROR
> [=C2=A0=C2=A0=C2=A0 7.219183] mhi mhi0: Transitioning from PM state: Link=
down or
> Error Fatal Detect to: SYS ERROR Process
> [=C2=A0=C2=A0=C2=A0 7.228590] mhi-pci-generic 0000:01:00.0: firmware cras=
hed (6)
> [=C2=A0=C2=A0=C2=A0 7.234429] mhi mhi0: Failed to transition from PM stat=
e: Linkdown
> or Error Fatal Detect to: SYS ERROR Process
> [=C2=A0=C2=A0=C2=A0 7.244433] mhi mhi0: Exiting with PM state: Linkdown o=
r Error
> Fatal Detect, MHI state: RESET
> [=C2=A0=C2=A0=C2=A0 7.252963] mhi mhi0: Handling state transition: DISABL=
E
> [=C2=A0=C2=A0=C2=A0 7.258278] mhi mhi0: Processing disable transition wit=
h PM state:
> Linkdown or Error Fatal Detect
> [=C2=A0=C2=A0=C2=A0 7.267155] mhi mhi0: Waiting for all pending event rin=
g processing
> to complete
> [=C2=A0=C2=A0=C2=A0 7.274480] mhi mhi0: Waiting for all pending threads t=
o complete
> [=C2=A0=C2=A0=C2=A0 7.280576] mhi mhi0: Reset all active channels and rem=
ove MHI
> devices
> [=C2=A0=C2=A0=C2=A0 7.287110] mhi mhi0: Resetting EV CTXT and CMD CTXT
> [=C2=A0=C2=A0=C2=A0 7.292077] mhi mhi0: Exiting with PM state: DISABLE, M=
HI state:
> RESET
> [=C2=A0=C2=A0=C2=A0 7.298683] mhi-pci-generic 0000:01:00.0: failed to pow=
er up MHI
> controller
> [=C2=A0=C2=A0=C2=A0 7.306184] mhi-pci-generic: probe of 0000:01:00.0 fail=
ed with error
> -110
>=20
> Some of the boots successfully finish and I can talk to both the QMI
> and MBIM ports exposed by the WWAN subsystem, but the success rate is
> extremely low.
>=20
> Thomas, are you seeing similar issues in your setup?

On our setup, using i.MX6DL based board and a PCIe Sierra Wireless
EM9190 module, running Yocto and Linux 5.13, we don't have much success
for the moment, qmi and mbim commands very often end in timeout.

Otherwise, when responses are received, we also can observe strange
things: unexpected messages, response to previous commands or queue
buffer issue.

Moreover, AT commands and the firmware update seem to work fine.

I updated the topic opened on the Sierra Wireless forum, with our
latest progress and as well as additional information.

In addition, we observed some strange behavior of the EM919x after warm
reboots.

Best regards,
Thomas

>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-POuXhvLDVFTfRfkUSNIM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmFkTc0ACgkQn8ALBXH+
Cu2ICgv+Oy/fgJXWaHWh+YP3EOK8IXvpZUmKnSf5Jwe4HsdUl3ZeXk3TpnLxyu8v
Kn+Ok4FzKL3iA5Bp66DtcOhrwlmO4BQtmj375d8swQp45ZCodpFzspCvBwNCZFDF
vEIYhkZujIkPQWI7k9useHJLoTgWVTHzvJhxKs3KRAWFn3lq64phu/d3DSc4cXAE
zOwOclAkmDScfxaIsfQXf1v8+hNtuPHJ2xGRCSUMk+cbZExQteieltc9+Z2ZtPVu
TCyrhuzJWOiDK/TjGDulPDAXCKiAdS10AmlQuckjXpvV2Jua5oqxE2QjhtGnkagO
azLAbrdFD/6DeKdCoj9LxlRLWTwip7Fc1JDZq5RXsI73QF2FDHW0CM+JiQ6vD1FE
aC7tPsEh78iqf5qbmBJl3oSdH2YIS0RvyvkTeV8mlgZ88jzgkDTNTVKf5Fy973rG
mSHAfCFAaMFTeyLz5c/WLFBUoKSliWJnxrbjpCRaYJMNcM0L9T2mQ1u9HerDZK6W
5kssQetC
=a7A5
-----END PGP SIGNATURE-----

--=-POuXhvLDVFTfRfkUSNIM--

