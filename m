Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92914459D73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 09:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234696AbhKWII6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 03:08:58 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:55399 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234735AbhKWII5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 03:08:57 -0500
Received: (Authenticated sender: thomas.perrot@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1E9B0240016;
        Tue, 23 Nov 2021 08:05:45 +0000 (UTC)
Message-ID: <163e5d068983030d1e879ce3321766aeb38aeed7.camel@bootlin.com>
Subject: Re: [PATCH] bus: mhi: pci_generic: Introduce Sierra EM919X support
From:   Thomas Perrot <thomas.perrot@bootlin.com>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        aleksander@aleksander.es
Date:   Tue, 23 Nov 2021 09:05:44 +0100
In-Reply-To: <20211122153922.GB83834@thinkpad>
References: <20211122111135.3272126-1-thomas.perrot@bootlin.com>
         <20211122153922.GB83834@thinkpad>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-3CXByB+nauxOmIt+VRhS"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--=-3CXByB+nauxOmIt+VRhS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mani,

On Mon, 2021-11-22 at 21:09 +0530, Manivannan Sadhasivam wrote:
> On Mon, Nov 22, 2021 at 12:11:35PM +0100, Thomas Perrot wrote:
> > Add support for EM919X modems, this modem series is based on SDX55
> > qcom chip.
> >=20
> > Tested-by: Aleksander Morgado <aleksander@aleksander.es>
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> > =C2=A0drivers/bus/mhi/pci_generic.c | 43
> > +++++++++++++++++++++++++++++++++++
> > =C2=A01 file changed, 43 insertions(+)
> >=20
> > diff --git a/drivers/bus/mhi/pci_generic.c
> > b/drivers/bus/mhi/pci_generic.c
> > index 59a4896a8030..076a951fd587 100644
> > --- a/drivers/bus/mhi/pci_generic.c
> > +++ b/drivers/bus/mhi/pci_generic.c
> > @@ -403,7 +403,50 @@ static const struct mhi_pci_dev_info
> > mhi_mv31_info =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dma_data_width =3D 32,
> > =C2=A0};
> > =C2=A0
> > +static const struct mhi_channel_config
> > mhi_sierra_em919x_channels[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MHI_CHANNEL_CONFIG_UL_SBL(2,=
 "SAHARA", 32, 0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MHI_CHANNEL_CONFIG_DL_SBL(3,=
 "SAHARA", 256, 0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MHI_CHANNEL_CONFIG_UL(4, "DI=
AG", 32, 0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MHI_CHANNEL_CONFIG_DL(5, "DI=
AG", 32, 0),
>=20
> DIAG generally uses a dedicated event ring.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MHI_CHANNEL_CONFIG_UL(12, "M=
BIM", 128, 0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MHI_CHANNEL_CONFIG_DL(13, "M=
BIM", 128, 0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MHI_CHANNEL_CONFIG_UL(14, "Q=
MI", 32, 0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MHI_CHANNEL_CONFIG_DL(15, "Q=
MI", 32, 0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MHI_CHANNEL_CONFIG_UL(32, "D=
UN", 32, 0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MHI_CHANNEL_CONFIG_DL(33, "D=
UN", 32, 0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MHI_CHANNEL_CONFIG_HW_UL(100=
, "IP_HW0", 512, 1),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MHI_CHANNEL_CONFIG_HW_DL(101=
, "IP_HW0", 512, 2),
> > +};
> > +
> > +static struct mhi_event_config modem_sierra_em919x_mhi_events[] =3D
> > {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* first ring is control+dat=
a and DIAG ring */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MHI_EVENT_CONFIG_CTRL(0, 204=
8),
>=20
> I think you can just split control+data and diag events as like other
> modems.
> If there is a requirement, please mention in commit description.
>=20

Thank you, I will submit a v2 that notify, in commit description, that
is a requirement.

Best regards,
Thomas

> Rest LGTM.
>=20
> Thanks,
> Mani

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-3CXByB+nauxOmIt+VRhS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmGcoNgACgkQn8ALBXH+
Cu3t6Av9FT9mFTyy/3NrsSSAslfN1LmbxcJqOqeOaaXmJqGBSdRPPXuSXufzANNw
HV61lJ00Ag4s1hbTQyrf1Y2C/C62iLLoWUJG6+aTxMgGn/0U3F16N1y8jr4S4tQW
OmRUaFsK6l8Ut5PD3g6y3xcRQez3c1liagXPMZcX/lauAiJ3aV1obGh6vMavA5z8
a/XuE9yb9XJ2jHxDp1eYZSZd3WQ5gfrGxP0FCwCBJTDVOOXLw0DLUonNuKuEfpwj
W5+gEKsqeCb4O0Oiy1QuEVJxhy/dbCdw8KuGHdQNLqEwZIy9bQ3UaSRcwOZWkpvd
x6Qn7xlFK3hrqPHidnMO9npcDJQ6G6ZOV5jpkniUL6ySNvIS+abXVk2STmmW4L0P
BPYjozuUOpuSdhbybJDuKRNIRfW0f1+7CCD+L7VohBwR2xxxryB94fTyztZRz1DO
0+UtJhPDTekzi8drfD4aJjJZliuAjxfc32Gy668srOdDhEz1dwgA3NvIcVlZFFAs
uhDPR6b/
=3Q8z
-----END PGP SIGNATURE-----

--=-3CXByB+nauxOmIt+VRhS--

