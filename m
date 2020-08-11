Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6172418B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 11:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgHKJMb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 05:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728355AbgHKJMa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 05:12:30 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD18C06174A;
        Tue, 11 Aug 2020 02:12:28 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id g6so12652738ljn.11;
        Tue, 11 Aug 2020 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Eqc+3NbaxwoojpJ4wCmnVzMHGK5tFF910hokAKhwEAQ=;
        b=QGaJh62swSOyNJSej4GYVVg1+IdjpM91enN86WzVB5D+VT3gJ4F2gVyA67n+QbKlwi
         vOTvwRtaSkKpVxiRAM6wu07GI0JFfpOm8/6lScOdsMeg9mVzJW0sJjUcEG8LePKK5UzG
         vOmRdtSMMmGeXonsMVc+4kuQntv6eIFkgFRChGKD0yE7iLNJhb781Qegs1T/6rjUmYSY
         yHHMHg6aSyFt7wH61PFJNXIJLwCtHc/CnVtcnIvwMNol9qgLVN0L4hoiwDdWAnXfpp6d
         7C3oBFWGT6N6Sq5YOV1MyyY5dEVm//TnIWGtn5HxSJ2+FFCMhhYhgY3tXa85AwwGEY5K
         kO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=Eqc+3NbaxwoojpJ4wCmnVzMHGK5tFF910hokAKhwEAQ=;
        b=BUGSmkK2CbeLYf1+o60B+F3yS99E892Zdt71hMaH1zwRrYjTs6hq8zJJMzCcEDpsU+
         J1TkAGtLqa74N+ExkqpGGABUj9r4oPHWQrrwRjUWEmEFLvOs2UxM8P9Rv2LdK/W67Dbl
         gNokHJcd3AD42Dt+LiV29LDDt+PHHinmMQxrU4Tcrn4DXGpzZ6G6x5pZOGx0itHpTAT/
         v5Z2JByJA2y06GuKZPt6DtzeKMwZ65YcBVzEJK3KUbFZbTRZP8hA3YczwXLgMGWXytcy
         mP/EoHQnlGz5gslXISTCao3tICIXshl3/3m4kijnop4pZsSTv1y5TFEDgjIVwLCoCjGe
         9qvg==
X-Gm-Message-State: AOAM533fHwVsdqVrVtchwmqorfIKe8D7ybF1KYB94Bk4Fnal+yUx/Nem
        Ko6n2nn4mSxSSp/ilAObqFA=
X-Google-Smtp-Source: ABdhPJyywIbiOv+zXy+wOQ3SXRh/6kavcG9IMhbtAn8xZQHQnrTcXEUm0BS+Ph7ZWqu7cv6m9U017Q==
X-Received: by 2002:a2e:3c10:: with SMTP id j16mr2740226lja.324.1597137147094;
        Tue, 11 Aug 2020 02:12:27 -0700 (PDT)
Received: from saruman ([194.34.132.58])
        by smtp.gmail.com with ESMTPSA id d20sm11416961lfn.85.2020.08.11.02.12.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Aug 2020 02:12:26 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH 2/2] usb: dwc3: Host wake up support from system suspend
In-Reply-To: <1591885683-29514-3-git-send-email-sanm@codeaurora.org>
References: <1591885683-29514-1-git-send-email-sanm@codeaurora.org> <1591885683-29514-3-git-send-email-sanm@codeaurora.org>
Date:   Tue, 11 Aug 2020 12:12:20 +0300
Message-ID: <874kp9pmvf.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Sandeep Maheswaram <sanm@codeaurora.org> writes:

> Avoiding phy powerdown in host mode so that it can be wake up by devices.
> Set usb controller wakeup capable when wakeup capable devices are
> connected to the host.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/core.c      | 47 ++++++++++++++++++++++++++-----
>  drivers/usb/dwc3/core.h      |  1 +
>  drivers/usb/dwc3/dwc3-qcom.c | 66 +++++++++++++++++++++++++++++++++-----=
------
>  3 files changed, 91 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 25c686a7..8370350 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -31,15 +31,19 @@
>  #include <linux/usb/gadget.h>
>  #include <linux/usb/of.h>
>  #include <linux/usb/otg.h>
> +#include <linux/usb/hcd.h>
>=20=20
>  #include "core.h"
>  #include "gadget.h"
>  #include "io.h"
>=20=20
>  #include "debug.h"
> +#include "../host/xhci.h"

nope

>  #define DWC3_DEFAULT_AUTOSUSPEND_DELAY	5000 /* ms */
>=20=20
> +bool need_phy_for_wakeup;

nope

> +
>  /**
>   * dwc3_get_dr_mode - Validates and sets dr_mode
>   * @dwc: pointer to our context structure
> @@ -1627,10 +1631,36 @@ static int dwc3_core_init_for_resume(struct dwc3 =
*dwc)
>  	return ret;
>  }
>=20=20
> +static void dwc3_set_phy_speed_flags(struct dwc3 *dwc)
> +{
> +
> +	int i, num_ports;
> +	u32 reg;
> +	struct usb_hcd	*hcd =3D platform_get_drvdata(dwc->xhci);
> +	struct xhci_hcd	*xhci_hcd =3D hcd_to_xhci(hcd);
> +
> +	dwc->hs_phy_flags &=3D ~(PHY_MODE_USB_HOST_HS | PHY_MODE_USB_HOST_LS);
> +
> +	reg =3D readl(&xhci_hcd->cap_regs->hcs_params1);
> +
> +	num_ports =3D HCS_MAX_PORTS(reg);
> +	for (i =3D 0; i < num_ports; i++) {
> +		reg =3D readl(&xhci_hcd->op_regs->port_status_base + i*0x10);
> +		if (reg & PORT_PE) {
> +			if (DEV_HIGHSPEED(reg) || DEV_FULLSPEED(reg))
> +				dwc->hs_phy_flags |=3D PHY_MODE_USB_HOST_HS;
> +			else if (DEV_LOWSPEED(reg))
> +				dwc->hs_phy_flags |=3D PHY_MODE_USB_HOST_LS;
> +		}
> +	}
> +	phy_set_mode(dwc->usb2_generic_phy, dwc->hs_phy_flags);

XHCI already supports PHY framework, no?

>  static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  {
>  	unsigned long	flags;
>  	u32 reg;
> +	struct usb_hcd  *hcd =3D platform_get_drvdata(dwc->xhci);
>=20=20
>  	switch (dwc->current_dr_role) {
>  	case DWC3_GCTL_PRTCAP_DEVICE:
> @@ -1643,9 +1673,10 @@ static int dwc3_suspend_common(struct dwc3 *dwc, p=
m_message_t msg)
>  		dwc3_core_exit(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> +		dwc3_set_phy_speed_flags(dwc);
>  		if (!PMSG_IS_AUTO(msg)) {
> -			dwc3_core_exit(dwc);
> -			break;
> +			if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
> +				need_phy_for_wakeup =3D true;

should be done in xhci-plat

> @@ -1705,11 +1736,13 @@ static int dwc3_resume_common(struct dwc3 *dwc, p=
m_message_t msg)
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
>  		if (!PMSG_IS_AUTO(msg)) {
> -			ret =3D dwc3_core_init_for_resume(dwc);
> -			if (ret)
> -				return ret;
> -			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
> -			break;
> +			if (!need_phy_for_wakeup) {
> +				ret =3D dwc3_core_init_for_resume(dwc);
> +				if (ret)
> +					return ret;
> +				dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
> +				break;

why?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8yYPQACgkQzL64meEa
mQYzpQ//RlvBlJqDn5YjtLQDgcPnIwSd+Toup6FmId0ZU9y6UA08aKYTxxtjupUq
kx4XvOOrPY0xggUoWDd1od1LIXfwbRci1os+5J4yEyKT9tANjTZucJZLaYH7j5ki
mCB1Pf8g5LJ1ol5j/fh7UElA+CJ6ZYFXj3Mky9Knd5T++ve02jLzAhqga1cz3fiL
NHXkCPt2MqILB8H7NYE8Pytp9DHTElr//+lrVBSkxyqTT8buM/pZ2kfo04nJvO6+
v2yiq6Edksa+Ky8H5NxOM/Up5Y/anuh6AqLiwvirWl1Ugf1gBV3LxCPunezeIg2I
hXGJ2xnGX+pJkcFhFT5mac6gQVd2qxPOtaQLWRbuswewykyOhtp7e6yOqma5SjuZ
7VnYVLZ8By/oRH4/dBAtRSrJyagY2+RWOJFOzF3G6zgx0PrDITwWn9qaYzD5f3FD
Iy1Ybz1U1O8a+TcB9R7DhfSTLTmWswHT8xniuaqdqXOuJKiTwjBZuBkt9WIzvBAS
Gnnd2jYpu0DMvS037Wv3mnAcps78rPuG7YeepUEzs3irck0HNvI+DajEh/TVzRpe
NmzFnb9SsfkoLc+cnFvU/GAW4mlyadxZrqydDVI4zawmqxF+eNqxgP6r21waq8Nq
KchxxSssP4X7sECoErPZRI6O5zPLk1VaXHg7IyjBvCILWcEskLE=
=3o7M
-----END PGP SIGNATURE-----
--=-=-=--
