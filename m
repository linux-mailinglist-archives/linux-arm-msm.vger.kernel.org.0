Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1CE43177B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 13:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhJRLhj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 07:37:39 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:36315 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhJRLhi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 07:37:38 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id C2FDDC5DCA
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 11:27:06 +0000 (UTC)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B62B3FF80C;
        Mon, 18 Oct 2021 11:26:44 +0000 (UTC)
Message-ID: <bd875c3b9d19f8827362b129999d84cd04ad90ae.camel@bootlin.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
From:   Thomas Perrot <thomas.perrot@bootlin.com>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Aleksander Morgado <aleksander@aleksander.es>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Date:   Mon, 18 Oct 2021 13:26:43 +0200
In-Reply-To: <CAMZdPi9cbDVWVxvimg-uc_TRvskrxbjEQ4AxdLjA57Ewm2tSPA@mail.gmail.com>
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
         <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
         <CAAP7ucLu9JJjo+gN6fsSZVGKHX6VGoYkgBmsA0s9qsA-hdH6=A@mail.gmail.com>
         <2c34a05884cd68eb08e061e9d4d1aa572d78f03c.camel@bootlin.com>
         <CAAP7ucLVBn3Vk25jqL18Qxtsd=PmCpTiNY5j_pgai4BBbTOGWA@mail.gmail.com>
         <CAMZdPi8QXrjN6VYU1VrGeOBhvVSnxopioM7POEOcS5ywsSFDHQ@mail.gmail.com>
         <CAAP7ucKL+5oUmidVp1W-oOyfuuYR3F-11GuNdxLX9iYijaL6_A@mail.gmail.com>
         <CAAP7uc+5=GMGgz3MKfSWaAtes1WwCCx+6iYhb058ZUr0=A52cg@mail.gmail.com>
         <CAMZdPi9cbDVWVxvimg-uc_TRvskrxbjEQ4AxdLjA57Ewm2tSPA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-1955kVyh34kh2EyDKv2j"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--=-1955kVyh34kh2EyDKv2j
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Loic,

On Mon, 2021-10-18 at 11:59 +0200, Loic Poulain wrote:
> Hi Aleksander,
>=20
> On Mon, 18 Oct 2021 at 11:14, Aleksander Morgado
> <aleksander@aleksander.es> wrote:
> >=20
> > Hey all,
> >=20
> > > [=C2=A0=C2=A0=C2=A0 7.056113] mhi-pci-generic 0000:01:00.0: MHI PCI d=
evice found:
> > > sierra-em919x
> > > [=C2=A0=C2=A0=C2=A0 7.063298] mhi-pci-generic 0000:01:00.0: BAR 0: as=
signed [mem
> > > 0x600000000-0x600000fff 64bit]
> > > [=C2=A0=C2=A0=C2=A0 7.071846] mhi-pci-generic 0000:01:00.0: enabling =
device (0000
> > > -> 0002)
> > > [=C2=A0=C2=A0=C2=A0 7.078671] mhi-pci-generic 0000:01:00.0: using sha=
red MSI
> >=20
> > In this specific setup we request 4 MSI vectors through
> > pci_alloc_irq_vectors(), but only end up allocating a single one
> > (i.e.
> > mhi_cntrl->nr_irqs =3D 1). Could that be related to the problem
> > somehow?
>=20
> It shouldn't, we have the 'shared IRQ' fallback which is used when we
> can not setup multiple MSI, and this works with other SDX55 based
> modems.
>=20

Compared to other SDX55 based modems, EM919x uses the same event ring
for the control, the data and the diag, and we use the macro
MHI_EVENT_CONFIG_CTRL to configure it.
- Perhaps this macro is not suitable in this case?
- Could this be explaining, what are we observing?

Moreover, we have voluntarily reduced the number of shared MSI vectors
to one, on a platform able to provide enough, then we observe the same
kind of issues, as on i.MX6DL which end up allocating a single one.
However, we carried out this test only with the vendor driver.

Best regards,
Thomas

> Regards,
> Loic

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-1955kVyh34kh2EyDKv2j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmFtWfMACgkQn8ALBXH+
Cu1VOwwAq2SRydt2FQKMk1zoPhjmQRY2DtD39tpnaYNW/Cpo4fsEnMaeJXJz6OsO
Pqqb0eopEJE8gJg2QD2Ber7kNLyj0Lq/Ux3haepIiFc7C/K+F/chNyWLkkuFDqjm
BSmvQrm4vdKHYkzKou9C2qWLjvNH6UU/rjz0pVcCYfLn/hAfkEJvzAXLk8gfRpwl
B9ys+EPn4T3QWsd0LNybwo5VFImWD4r7ZzTfnYFMmVp9MsOJqsyeEoIQN28hYSQs
oUDXZpIXGjri/9Wnb5AP6NBHrifEzFvBTKaUl5Q9VTuun9R9YXd6j/Uf6ID287+w
ADl1scu4E01+W43Nm9qRlfDPl3FD0dzbS4rRWHDAsCxm0Z6BB4v3JJgALVpJvaYh
2N4wUaXMpJbvra6cF3tvmdia9tbE/N+PRc/d+zr/wheZsLiwW6yvRRHsOb2/ZxOr
ELfvWW7aiMRGDaTFfyCUN/GxLBUle6fRHeO/g2WliI/E+4cWb6eXwx8dxVLLwaBv
G3bdV019
=FK7w
-----END PGP SIGNATURE-----

--=-1955kVyh34kh2EyDKv2j--

