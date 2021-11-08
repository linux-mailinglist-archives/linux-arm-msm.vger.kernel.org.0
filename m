Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E198E4499E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 17:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238768AbhKHQek (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 11:34:40 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:54253 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbhKHQej (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 11:34:39 -0500
Received: (Authenticated sender: thomas.perrot@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3E641240009;
        Mon,  8 Nov 2021 16:31:53 +0000 (UTC)
Message-ID: <d787fb8d6588ba5e05232fc5809d4cbd80117ebf.camel@bootlin.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
From:   Thomas Perrot <thomas.perrot@bootlin.com>
To:     Aleksander Morgado <aleksander@aleksander.es>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Date:   Mon, 08 Nov 2021 17:31:51 +0100
In-Reply-To: <CAAP7ucJ6a+r6b6C4C51ov6O8sepYmut2uc7sXDqFOOdJruW6nQ@mail.gmail.com>
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
         <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
         <CAAP7ucJ6a+r6b6C4C51ov6O8sepYmut2uc7sXDqFOOdJruW6nQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-kCwyP7KUw2sJuhRQXZAE"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--=-kCwyP7KUw2sJuhRQXZAE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aleksander,

On Mon, 2021-11-08 at 16:11 +0100, Aleksander Morgado wrote:
> Hey Thomas,
>=20
> Reviving an old email :)
>=20
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
> Once all my boot reliability issues seem solved, I've also started to
> notice what you mean here. If I run a normal ModemManager build with
> both QMI and MBIM enabled, MM will try to probe both the QMI and MBIM
> ports. When that happens, I have no idea why, the modem gets in some
> weird state with commands timing out and what not. Maybe it's because
> we're using both ports at the same time, maybe it's because we run
> QMI
> on both the QMI and MBIM ports, no idea, the only thing I know is
> that
> if you choose to use either one or the other, the whole setup is
> fully
> stable.
>=20
> E.g. I'm right now testing my build after compiling ModemManager
> using
> --without-mbim (so QMI only), and I have absolutely no error.=C2=A0

That's very good news!

> Another
> option if you don't want to rebuild MM is to flag the MBIM or the QMI
> port as ID_MM_PORT_IGNORE with udev rules, which is very likely what
> I'll end up doing in upstream ModemManager to have a proper default.
>=20
> I was thinking in preparing and sending for review the EM91xx entry
> for drivers/bus/mhi/pci_generic.c, but it's mostly based on what you
> suggested in the Sierra Wireless forum, so not sure if you'd like to
> send it yourself here?=C2=A0

I can send it myself here, and I add you as developer if you'd like ?

Best regards,
Thomas

> The only changes I did w.r.t. what you
> suggested are setting sideband_wake to false, and listing the
> PCI_DEVICE_SUB() before the more generic PCI_DEVICE() one.
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-kCwyP7KUw2sJuhRQXZAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmGJUPcACgkQn8ALBXH+
Cu1CJQv9E6Q27xwT0xo4D1nUdL48AVcZ/oV5c6f+XKmON+GA/B85ITu28DR0eQ8+
MDbNYSWM5KR+WDGZcsTBBu3vxzrkElx6oCRfGceOVQgF8I3jzo0LR//SDFV/1zOO
nPlBkca5Rxs7h0Gws/GVNlNAJksnxv9MOCqxukghCurUOvXJ6D3rQh3i9un7v6XT
Xalc/9Vin5aTQxOzxNNSc+Tw3U4hMczPeEjpNGgc1yTt+MlypTrQ95PybwpeK/ob
m07OuRnwMJZnKYZ+b9zYuRiwpzWGVmhhwRz715xW42vttHXjU54IWM5chBB9lrTb
NFSTDdN5kQzxzbYD7r+1Y+IXaa1ZZgBbSf0rTGAiFDcx+YjOsN7DX+U1fN7hgmjW
RTz+bPmvxwGc/iyfRSILLdWfn3frJ+oND1vfqxbLOQIBI/FTkwnAOHeuZv+MUhCT
WZfotopQy+85Mrju1UHRdxR2Xo9/4M2MYCM/fihIsIsFCvvUfoKbSPWsuPzTVJ6O
hD81RRJ7
=Jlm2
-----END PGP SIGNATURE-----

--=-kCwyP7KUw2sJuhRQXZAE--

