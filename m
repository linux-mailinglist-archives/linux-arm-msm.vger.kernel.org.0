Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89AA3431F44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 16:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbhJROSV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 10:18:21 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:38421 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233689AbhJROSP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 10:18:15 -0400
Received: (Authenticated sender: thomas.perrot@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0EF45100009;
        Mon, 18 Oct 2021 14:16:01 +0000 (UTC)
Message-ID: <99c6dd698ec93377476adf77c1770db9b94c5876.camel@bootlin.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
From:   Thomas Perrot <thomas.perrot@bootlin.com>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Aleksander Morgado <aleksander@aleksander.es>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Date:   Mon, 18 Oct 2021 16:16:01 +0200
In-Reply-To: <1f846b0be78560c1299fa26d351b66567be403e1.camel@bootlin.com>
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
         <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
         <CAAP7ucLu9JJjo+gN6fsSZVGKHX6VGoYkgBmsA0s9qsA-hdH6=A@mail.gmail.com>
         <2c34a05884cd68eb08e061e9d4d1aa572d78f03c.camel@bootlin.com>
         <CAAP7ucLVBn3Vk25jqL18Qxtsd=PmCpTiNY5j_pgai4BBbTOGWA@mail.gmail.com>
         <CAMZdPi8QXrjN6VYU1VrGeOBhvVSnxopioM7POEOcS5ywsSFDHQ@mail.gmail.com>
         <CAAP7ucKL+5oUmidVp1W-oOyfuuYR3F-11GuNdxLX9iYijaL6_A@mail.gmail.com>
         <CAAP7uc+5=GMGgz3MKfSWaAtes1WwCCx+6iYhb058ZUr0=A52cg@mail.gmail.com>
         <CAMZdPi9cbDVWVxvimg-uc_TRvskrxbjEQ4AxdLjA57Ewm2tSPA@mail.gmail.com>
         <bd875c3b9d19f8827362b129999d84cd04ad90ae.camel@bootlin.com>
         <CAMZdPi_J7ePh22v7J3WgqO9X3Y1KffTm__TfL9jGHj61H2x9QA@mail.gmail.com>
         <1f846b0be78560c1299fa26d351b66567be403e1.camel@bootlin.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-2Kb2Bk/oNe7Vq88EgNRU"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--=-2Kb2Bk/oNe7Vq88EgNRU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Loic,

Sorry, I forgot to answer your other questions.

On Mon, 2021-10-18 at 16:07 +0200, Thomas Perrot wrote:
> Hi,
>=20
> On Mon, 2021-10-18 at 14:46 +0200, Loic Poulain wrote:
> > On Mon, 18 Oct 2021 at 13:26, Thomas Perrot <
> > thomas.perrot@bootlin.com> wrote:
> > >=20
> > > Hi Loic,
> > >=20
> > > On Mon, 2021-10-18 at 11:59 +0200, Loic Poulain wrote:
> > > > Hi Aleksander,
> > > >=20
> > > > On Mon, 18 Oct 2021 at 11:14, Aleksander Morgado
> > > > <aleksander@aleksander.es> wrote:
> > > > >=20
> > > > > Hey all,
> > > > >=20
> > > > > > [=C2=A0=C2=A0=C2=A0 7.056113] mhi-pci-generic 0000:01:00.0: MHI=
 PCI device
> > > > > > found:
> > > > > > sierra-em919x
> > > > > > [=C2=A0=C2=A0=C2=A0 7.063298] mhi-pci-generic 0000:01:00.0: BAR=
 0: assigned
> > > > > > [mem
> > > > > > 0x600000000-0x600000fff 64bit]
> > > > > > [=C2=A0=C2=A0=C2=A0 7.071846] mhi-pci-generic 0000:01:00.0: ena=
bling device
> > > > > > (0000
> > > > > > -> 0002)
> > > > > > [=C2=A0=C2=A0=C2=A0 7.078671] mhi-pci-generic 0000:01:00.0: usi=
ng shared MSI
> > > > >=20
> > > > > In this specific setup we request 4 MSI vectors through
> > > > > pci_alloc_irq_vectors(), but only end up allocating a single
> > > > > one
> > > > > (i.e.
> > > > > mhi_cntrl->nr_irqs =3D 1). Could that be related to the problem
> > > > > somehow?
> > > >=20
> > > > It shouldn't, we have the 'shared IRQ' fallback which is used
> > > > when we
> > > > can not setup multiple MSI, and this works with other SDX55 based
> > > > modems.
> > > >=20
> > >=20
> > > Compared to other SDX55 based modems, EM919x uses the same event
> > > ring
> > > for the control, the data and the diag, and we use the macro
> > > MHI_EVENT_CONFIG_CTRL to configure it.
> > > - Perhaps this macro is not suitable in this case?
> >=20
> > Well it should work, but it's usually better to have a dedicated
> > event
> > ring for non-control stuff.
> > The number of event ring is normally driven by the host, is it a
> > limitation with EM919X?
>=20
> I asked the question to our Sierra distributor, because it isn't
> indicated in the technical documentation that I have, I'm still waiting
> for the answer.
>=20
> > What is done in the downstream driver?
>=20
> As we encountered issues with the generic event ring configuration, I
> tried with a configuration equivalent to that of the vendor driver,
> that uses the same ring for data, control and diag stuff.
>=20
> Best regards,
> Thomas
>=20
> >=20
> > > - Could this be explaining, what are we observing?
> >=20

We observing following things:
- Either the kernel spam in loop this error: =E2=80=9Cmhi_wwan_ctrl mhi0_QM=
I:
"Failed to queue buffer=E2=80=9D
- Either some command succeed, then timeout,
- Received unexpected response or the response to a previous command,
- All AT commands seem succeed,
- And the firmware is well updated.

> > Hmm, as I said device should follow what the host is configuring in
> > terms of event rings, but maybe in your case a specific
> > configuration
> > is expected, so it would be nice to double check with what is done
> > in
> > the downstream driver. As well, do you have any way to access the
> > serial/debug console of the EM919X?
> >=20
> > > Moreover, we have voluntarily reduced the number of shared MSI
> > > vectors
> > > to one, on a platform able to provide enough, then we observe the
> > > same
> > > kind of issues, as on i.MX6DL which end up allocating a single
> > > one.
> > > However, we carried out this test only with the vendor driver.
> >=20
> > You mean the same initialization issue?
> >=20

Yes, we are also seeing the same initialization issue.

Best regards,
Thomas

> > Regards,
> > Loic
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-2Kb2Bk/oNe7Vq88EgNRU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmFtgaEACgkQn8ALBXH+
Cu0c8gwAl1JqYuI6xIMNCHlIxpBFXulXijMcHN/KRoANm4CP3WxZ+C57P3vLR2Gm
QRbNPLhtJhygow9MoTlNZNnH4B7/WVaX2JKa1mgWLmDQTq0USi7hTm0Ecx8iS3lL
jbx+EYJPawbgndFCgLfERE974hqrxBFk8kTMl1RMHto5+Y7yCPnJsggzodtojpxJ
snrY5oIz1iHa3f/R5oshmsP88KEBaMxBoQ+aum21oQ47894M9Oqx67A8trVAg+bK
ByJfGlZYO+erR8qeEnn689LZQmri3Fp9hC7e0/DCAyxS0ucuJl/c9O7VY32JAaS4
IB+6fDx4sqTDaecOh4MU703tWSoJ+RZZLjcHEyoAGbtpEypZr448x+y13jXy69kN
aH/ZnRhCIhSbcj5m0qijcrOhUZJT4Mk7H1Q+80Br/Ox/JbdYN6aOZnCArDGzDHB6
UcmNu3sU3/Am6sMBHTRgG3ixjWH552RWa2xTXbrpsExpvGcxkw+L7oljZQ+NH6Lb
7/nDQ9qZ
=Ft4O
-----END PGP SIGNATURE-----

--=-2Kb2Bk/oNe7Vq88EgNRU--

