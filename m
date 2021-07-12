Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C953C5A25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 13:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235761AbhGLJfx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 05:35:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:51302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356758AbhGLJe3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 05:34:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C8F26101E;
        Mon, 12 Jul 2021 09:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626082300;
        bh=SLyG9PB5xze2TXVay8AsDKn3rf1aPGEPwRhz6WO1OgY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Uk0tjRYmT5CgR9ClwEFtLlKeE+rPDwo3gzQttiGJj3W8VzQZ6ug0dUsPIHcD6Xw3u
         L+P5bfn2/HPe3ANlt1J9hBJAVo0aVY3m63UvhddAKtISpJwTsiUIA3STOqgKrsTXaR
         UuX5vU1Jyo2glF6NippVyx0EHLq2imlnahPgBfiH65gq0sVuSS61gPN2RATgP/Q52P
         3hXNfj5o7eGN9p10bwwaOHOd5YeF4vPhNoyYsFgP1YEPwhBwn3R4ZPY5XpX0dbnoqS
         W4TNcAi0aAz43eB5BMzYn8iw0ZYJWwg+wvcT1s4vF0l3LhrDPiPgO3Iy5Mf83CCXdW
         sN6ckYUmPWorw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v8 2/6] usb: host: xhci: plat: Add suspend quirk for
 dwc3 controller
In-Reply-To: <1624882097-23265-3-git-send-email-sanm@codeaurora.org>
References: <1624882097-23265-1-git-send-email-sanm@codeaurora.org>
 <1624882097-23265-3-git-send-email-sanm@codeaurora.org>
Date:   Mon, 12 Jul 2021 12:31:31 +0300
Message-ID: <87im1fzxn0.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Sandeep Maheswaram <sanm@codeaurora.org> writes:
> During suspend read the status of all port and make sure the PHYs
> are in the correct mode based on current speed.
> Phy interrupt masks are set based on this mode. Keep track of the mode
> of the HS PHY to be able to configure wakeup properly.
>
> Also check during suspend if any wakeup capable devices are
> connected to the controller (directly or through hubs), if there
> are none set a flag to indicate that the PHY should be powered
> down during suspend.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/host/xhci-plat.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index c1edcc9..ee87923 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -24,6 +24,7 @@
>  #include "xhci-plat.h"
>  #include "xhci-mvebu.h"
>  #include "xhci-rcar.h"
> +#include "../dwc3/core.h"
>=20=20
>  static struct hc_driver __read_mostly xhci_plat_hc_driver;
>=20=20
> @@ -430,6 +431,39 @@ static int xhci_plat_remove(struct platform_device *=
dev)
>=20=20
>  	return 0;
>  }
> +static void xhci_dwc3_suspend_quirk(struct usb_hcd *hcd)
> +{
> +	int i, num_ports;
> +	u32 reg;
> +	unsigned int ss_phy_mode =3D 0;
> +	struct dwc3 *dwc =3D dev_get_drvdata(hcd->self.controller->parent);
> +	struct xhci_hcd	*xhci_hcd =3D hcd_to_xhci(hcd);
> +
> +	dwc->hs_phy_mode =3D 0;

you're still bypassing the driver layering. First you had dwc access
xhci, now you want xhci to access dwc. Either way is wrong. You need to
rely on drivers core and device properties for this stuff. Don't access
data you don't own.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDsC/MRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUgX1QgAuLQkROuNiEzBb++memK/UL5PiEaYklbg
TwXM6yJ5KcvCvosUXw6wpY8uHPuq6wJspPyKZYr5vUjzg/+B8pDmO6JELDiqFnph
gXfUkimhDyRm+F/4tR/Ed7+H0AHS+g+2mDE1tjKcJOlcpLGr43AANRt3SEKYMqyT
Ji2zedr4BV87GDdCuiVdJHWOMW8/TW8G3bQ5yZUR2BneTpqjlkgt/y8AC4hOxMbk
xQAP0awJVaLU8QpVZdqxjLa5RwFTgERFnPGqpnOrnPs804sU/bq4Ygj/Rd7j4I+B
HhGVbknxE4tvTDpf93qoXy3qSwtv8MFobSGc2KeaI+MtiLvY/KLOLQ==
=6ret
-----END PGP SIGNATURE-----
--=-=-=--
