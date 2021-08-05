Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1BB3E0F03
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 09:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbhHEHTU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 03:19:20 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:57539 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232009AbhHEHTH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 03:19:07 -0400
Received: (Authenticated sender: thomas.perrot@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6C36420000C;
        Thu,  5 Aug 2021 07:18:51 +0000 (UTC)
Message-ID: <8d913179b1ec02ec20f1eece830743f1f0ffc793.camel@bootlin.com>
Subject: Re: MHI driver issue with Sierra Wireless AirPrime EM919X
From:   Thomas Perrot <thomas.perrot@bootlin.com>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date:   Thu, 05 Aug 2021 09:18:50 +0200
In-Reply-To: <CAMZdPi_+j9jDhZH7CTHWV5Hzw0X+=OCwz9F7doZpF8VH1nSHtg@mail.gmail.com>
References: <1e288e5bee3f2a18e0ddb8b7a50158ecb793822d.camel@bootlin.com>
         <CAMZdPi-qydatnYYLPY9pZ_4XNZOKB+GBVw2M5rqD1WuVEQLwOg@mail.gmail.com>
         <4a9b0d64f1d7ead1f183b2ad0af32379e64d9b82.camel@bootlin.com>
         <CAMZdPi-22FjHwUqQ-K2huaHV_9zDrZShi74w7LCUiMjf-Ss_OQ@mail.gmail.com>
         <680ccb5730cc1724bbadb2b21638b696@codeaurora.org>
         <a7ff4a6e65d12b35719831bdf50ce1e9ae21027b.camel@bootlin.com>
         <CAMZdPi_+j9jDhZH7CTHWV5Hzw0X+=OCwz9F7doZpF8VH1nSHtg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-rGDkiFpFhcsT5Cq3BmJF"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--=-rGDkiFpFhcsT5Cq3BmJF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Loic,

On Tue, 2021-08-03 at 17:02 +0200, Loic Poulain wrote:
> Hi Thomas,
>=20
> > Thanks to both of you, to increase the timeout to 24000ms, in
> > addition
> > to disabling the power management seems to correct the issue.
>=20
> Would you be able to submit a fix patch for the timeout_ms (with CC
> stable)?
>=20

Yes, I will able to submit a fix patch for the timeout_ms.

Best regards,
Thomas

> I'm a bit worried about that PM issue, not sure why it does not work,
> could you please double check you have this change:
> "mhi: pci_generic: Fix inbound IPCR channel"
>=20
> Regards,
> Loic

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-rGDkiFpFhcsT5Cq3BmJF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmELkNoACgkQn8ALBXH+
Cu007gwAoC/VcYLTVibWZvJaW8fdN9dk3iRon5x+fyb3WvB9L5/CaK0f94RE8Mfp
+FJLpoSmscsFXnCfahMrsVFmCIzcPqXwKkp2Pkvt5QQGAOP0pa5S+lrF4hPYwnxs
iTC7M7yK5ryPoHOlXcUsX1b2I41/ODFXpNfH8bH6o3uDDKU831HBkUxR+A3spAmz
/BQ6bqwpU8GMHEIel7XDggICIGM/ARIcrFVcjVhCTajcXsH6JkJKNr46prwgED7Y
vrQZAKem4HfpAgAerpbh3nUw99OhooWw7LTABk7/7U64MjekgdkCgHc7NaO+qEUQ
qLnnLGqpBvyPZLA58v+gRlfx5ahBOCce8/knDYVrs2mrEtyAY7x26J7WsPUNlhwh
X1FGs3zwvP9Wwvcf0Ih5VBq4IuB3ZRvplLh6iihEFDhY+cSLG9jPl9wSf1OD+/XM
STzG/qmW3KzemaY0OpjBHgfgng2kzI8XoxoxD40kcVFFIohEH0V31QD6hfOG2jT1
+alhSsh6
=IN70
-----END PGP SIGNATURE-----

--=-rGDkiFpFhcsT5Cq3BmJF--

