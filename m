Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F3B36D524
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 11:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238680AbhD1J4O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 05:56:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:54254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238285AbhD1J4O (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 05:56:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA71B613E8;
        Wed, 28 Apr 2021 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619603729;
        bh=FUOG1GFp3PXPiB7KKWuN2ElWCqU3XTWRLgEUNNEWjyY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=mvY+hcxqgt9n+uxfqMKN/iqGvYSyaxuAY2H6cREnPpdMq8uMT2HSCYYfLZ9L07vOM
         2Qbu9xQaCL0HYu5LfwCfcVnBJEsfbZNuJTkrOGpDp1gA6Q1PbkFmIePCwEwMYO0Q24
         +A9mdkCUL4zxiHYhVY7eQhWG9K+Wpof6aXkLfXOQ/S4vCG/ol8QYqHkyBHC1lvpSJd
         aQN/09/NRP9tblWM43EySG8yTcJ95pKqZ14T0W5s6KUNxiUoqPI+y0Y8eErAvbBVON
         ug8WEbDzvCmgR6ruSmmHBPZeKFHuaUeAUjbLAzfX7f26bmtSzeVCNvVCGGIkWksQGS
         P/aNzYEr4jnVg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v7 1/5] usb: dwc3: host: Set PHY mode during suspend
In-Reply-To: <1619586716-8687-2-git-send-email-sanm@codeaurora.org>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
 <1619586716-8687-2-git-send-email-sanm@codeaurora.org>
Date:   Wed, 28 Apr 2021 12:55:21 +0300
Message-ID: <87tunqka2e.fsf@kernel.org>
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
>  drivers/usb/dwc3/core.h |  3 +++
>  drivers/usb/dwc3/host.c | 59 +++++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 62 insertions(+)
>
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index b1e875c..cecd278 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1123,6 +1123,9 @@ struct dwc3 {
>=20=20
>  	bool			phys_ready;
>=20=20
> +	unsigned int            hs_phy_mode;
> +	bool			phy_power_off;
> +
>  	struct ulpi		*ulpi;
>  	bool			ulpi_ready;
>=20=20
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index f29a264..527f04c 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -11,6 +11,14 @@
>  #include <linux/platform_device.h>
>=20=20
>  #include "core.h"
> +#include "../host/xhci.h"
> +#include "../host/xhci-plat.h"
> +
> +static int xhci_dwc3_suspend_quirk(struct usb_hcd *hcd);
> +
> +static const struct xhci_plat_priv xhci_plat_dwc3_xhci =3D {
> +	.suspend_quirk =3D xhci_dwc3_suspend_quirk,
> +};

we're passing data using device_properties, why do you want this here?

> @@ -115,6 +123,13 @@ int dwc3_host_init(struct dwc3 *dwc)
>  		}
>  	}
>=20=20
> +	ret =3D platform_device_add_data(xhci, &xhci_plat_dwc3_xhci,
> +			sizeof(struct xhci_plat_priv));
> +	if (ret) {
> +		dev_err(dwc->dev, "failed to add data to xHCI\n");
> +		goto err;
> +	}
> +
>  	ret =3D platform_device_add(xhci);
>  	if (ret) {
>  		dev_err(dwc->dev, "failed to register xHCI device\n");
> @@ -127,6 +142,50 @@ int dwc3_host_init(struct dwc3 *dwc)
>  	return ret;
>  }
>=20=20
> +static void dwc3_set_phy_mode(struct usb_hcd *hcd)
> +{
> +
> +	int i, num_ports;
> +	u32 reg;
> +	unsigned int ss_phy_mode =3D 0;
> +	struct dwc3 *dwc =3D dev_get_drvdata(hcd->self.controller->parent);
> +	struct xhci_hcd	*xhci_hcd =3D hcd_to_xhci(hcd);
> +
> +	dwc->hs_phy_mode =3D 0;
> +
> +	reg =3D readl(&xhci_hcd->cap_regs->hcs_params1);
> +	num_ports =3D HCS_MAX_PORTS(reg);

there's a big assumption here that xhci is still alive. Why isn't this
quirk implemented in xhci-plat itself?

> +int xhci_dwc3_suspend_quirk(struct usb_hcd *hcd)

who calls this?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCJMQkRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYufhAA29wjgeiUd9qTG8j+ZL50E+nZgAAEw2BW
Wh2tEwNVLQ7rKEYK9iUP5EgKcoIjM9R4e8FRODWuAldoUDaZr5v+HxmJxe+SVbg8
fhgROeZEJOqyWtB+swWTztMttG0waE873M/jtbj3BSUDpPcmxvxrcc92TiNbIl9l
qWoy/uKLGXYbeXLfKNavA5mqRAr26bGO1hg4eDgxB0p2aq18q+TpOEly93WkJa1z
ne0bTC2uVu2hoNJ0aVhNx8Hjxu1LknCf6cyjMruzYqGrC+7dJhf3przRE6Fe09Sp
hKP3c2BqVU7aqrVs8YETsb25JTrL0sGtLg8pZigR+xsd9PraavPVHbdeDBLeIpLv
brWLHGBKPgevNDW5vQ9rXXntHjLsEgj3OqDsqrqH7/ewUYZxf1j0cYLK33d5sOVE
t1d4j8W4A+TP3cTJgUY5mHVfcRrS8Oqz0OZ5tnrKou5kRTAkLThJGOa4EYziyflq
U4qVJXD4MGbrQf/oCjPxrWdRT/7XXdf30Ch1wNSgEs4uKietWiG4HWi61yMbvZI1
Y+9Uw1ikDfWUry6kbSlhbwUkGnhQXZVBdinn35yMH3f2nWLOqO2+mLsdl/ZIvaLF
H3PltgGtLHayIKcEML0V2sy2oILWOPy/eUWgC3NzUZOnl3RBjBl4xyPuxOQ3/R6o
cREYJI/3hTM=
=6bfD
-----END PGP SIGNATURE-----
--=-=-=--
