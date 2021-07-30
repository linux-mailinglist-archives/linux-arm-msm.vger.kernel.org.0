Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B142D3DBDF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 19:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbhG3Rw2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 13:52:28 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:39205 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbhG3RwZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 13:52:25 -0400
Received: (Authenticated sender: thomas.perrot@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 77E456000B;
        Fri, 30 Jul 2021 17:52:19 +0000 (UTC)
Message-ID: <1e288e5bee3f2a18e0ddb8b7a50158ecb793822d.camel@bootlin.com>
Subject: MHI driver issue with Sierra Wireless AirPrime EM919X
From:   Thomas Perrot <thomas.perrot@bootlin.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     manivannan.sadhasivam@linaro.org, manivannan.sadhasivam@linaro.org,
        bbhatt@codeaurora.org
Date:   Fri, 30 Jul 2021 19:52:18 +0200
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-8DKB89IXFh3l8FSd1Y11"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--=-8DKB89IXFh3l8FSd1Y11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I=E2=80=99m trying to use the MHI driver with a Sierra Wireless AirPrime EM=
919X
connected to an NXP i.MX6DL through a PCIe gen2 bus, on 5.13.6, but the
device initialisation fails, as follows:

[    3.029401] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
0x01100000-0x01100fff 64bit]
[    3.041095] mhi-pci-generic 0000:01:00.0: enabling device (0140 ->
0142)
[    3.118299] mhi mhi0: Requested to power ON
[   11.370361] mhi mhi0: Power on setup success
[   11.372503] mhi mhi0: Wait for device to enter SBL or Mission mode
[   15.664068] mhi-pci-generic 0000:01:00.0: failed to suspend device:
-16
[   22.619948] mhi-pci-generic 0000:01:00.0: refused to change power
state from D3hot to D0
[   57.289998] mhi-pci-generic 0000:01:00.0: can't change power state
from D3hot to D0 (config space inaccessible)
[   73.769675] mhi-pci-generic 0000:01:00.0: can't change power state
from D3cold to D0 (config space inaccessible)
[   73.780188] mhi-pci-generic 0000:01:00.0: can't change power state
from D3hot to D0 (config space inaccessible)
[   73.836150] PC is at mhi_pci_read_reg+0xc/0x14
[   73.840642] LR is at mhi_get_mhi_state+0x2c/0x5c
[   74.121120] [<c05dcaf4>] (mhi_pci_read_reg) from [<c05d754c>]
(mhi_get_mhi_state+0x2c/0x5c)
[   74.129529] [<c05d754c>] (mhi_get_mhi_state) from [<c05da440>]
(mhi_pm_resume+0x38/0x298)
[   74.137754] [<c05da440>] (mhi_pm_resume) from [<c05dcbd0>]
(mhi_pci_runtime_resume+0x70/0xe0)
[   74.146326] [<c05dcbd0>] (mhi_pci_runtime_resume) from [<c0604da0>]
(pci_pm_runtime_resume+0x84/0xa0)

Do you have any idea where the issue might come from?

MHI seems to enter in READY state and waiting to enter in SBL or
Mission mode when the issue occurs, the host can start MHI
initialization by programming MMIO registers and sets the device into
MHI_M0 state.

Best regards,
Thomas

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-8DKB89IXFh3l8FSd1Y11
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmEEPFIACgkQn8ALBXH+
Cu2cKwwAiPgCtoYbh1Cj9fq42Dbjw4vQCG9wmqUXMOxNMeHDxQ4DVYJjMOgoaSdg
p+DPDyDnLqSq99e30dUbfQrgwWrQF+lfwvVNAZIGzFJf7nb9sSt3o7WSP1Mgc6c8
lg2M1dbVDrmRDMrQjQ3l0/CDyRPHWE41Hk0g62R9fF3/E9XswFF6u/it4rCtHABf
I1Wo8Lg9cajdRAz4ECEkdgFMvgoTC4xyO7hqkpAxMxKhfL7jwHMjxMPmAJnnG7wq
WPbUDcvULuQ0PcwooGwhtvf6+j/q+AYEOrha6fBpxs7NZWineeEEebgYlDydxL+r
NbeGu8Hl+w79nObfm4llTxH347OPsPBkqRdCdnfv14+Ci7/EYR/vbzKQ2ceDpGUM
rL9nFMr2wPYdSowqeC1D2r6Q2lNkTyW0u+j3oNJ/K9B5Wn6uhEpFuxO+Qxg4k3Wi
PNygqpWOSwmEhk4EecOugWPoWkPwp4DXU8uw34i/hjIOPI0zkvldiUT+7ypgcnnS
rToXBN2C
=YnHE
-----END PGP SIGNATURE-----

--=-8DKB89IXFh3l8FSd1Y11--

