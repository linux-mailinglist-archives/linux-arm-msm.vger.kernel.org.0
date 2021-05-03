Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07798371419
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 13:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhECLRi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 07:17:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:41568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229811AbhECLRi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 07:17:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB99861175;
        Mon,  3 May 2021 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620040605;
        bh=WtRNI/HtHndJvNU0bk3gx7XrZy0SCWWxUix7KU0CCT8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VluLM+nkItf/MvMrgc06+e9GiCmhGm1yY5A4bDJk+KJpieqqXDHPS7x14/Lsl/m5x
         HwqiYafVMz44set+IL7xO2UN3cenLOZUk+Ie4ITzLuUoyrXFWEViEQGnabXicKR4hr
         lbh7brIhUr5RAllXP2LQSotJZUe7e8lfGJlC1AAE20PkbZYCpr8aWOT5ecSo7pi6OA
         pS1MJS2wcQS0QI83juKb7z6bFrWUlf58i1nGmQMhU4utChEqwPQyq1OFGW90hTwnfG
         4or+OXFsAd7i+sa/qgJEnvjRhc8hldNGkJj4pxiSNTvTaAZdIfGs488qQrhhVHkbre
         6fqnYk4Dn9dKg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v7 1/5] usb: dwc3: host: Set PHY mode during suspend
In-Reply-To: <fd927828-a414-cd42-1e4a-b9e9b0744a3a@codeaurora.org>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
 <1619586716-8687-2-git-send-email-sanm@codeaurora.org>
 <87tunqka2e.fsf@kernel.org>
 <fd927828-a414-cd42-1e4a-b9e9b0744a3a@codeaurora.org>
Date:   Mon, 03 May 2021 14:16:34 +0300
Message-ID: <87k0oghxt9.fsf@kernel.org>
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
>>> @@ -11,6 +11,14 @@
>>>   #include <linux/platform_device.h>
>>>=20=20=20
>>>   #include "core.h"
>>> +#include "../host/xhci.h"
>>> +#include "../host/xhci-plat.h"
>>> +
>>> +static int xhci_dwc3_suspend_quirk(struct usb_hcd *hcd);
>>> +
>>> +static const struct xhci_plat_priv xhci_plat_dwc3_xhci =3D {
>>> +	.suspend_quirk =3D xhci_dwc3_suspend_quirk,
>>> +};
>> we're passing data using device_properties, why do you want this here?
> Similar implemenation was done in=20
> drivers/usb/cdns3/host.c<https://git.kernel.org/pub/scm/linux/kernel/git/=
next/linux-next.git/tree/drivers/usb/cdns3/host.c?h=3Dnext-20210503>=20

then it seems we have two places to correct :-)

>>> @@ -127,6 +142,50 @@ int dwc3_host_init(struct dwc3 *dwc)
>>>   	return ret;
>>>   }
>>>=20=20=20
>>> +static void dwc3_set_phy_mode(struct usb_hcd *hcd)
>>> +{
>>> +
>>> +	int i, num_ports;
>>> +	u32 reg;
>>> +	unsigned int ss_phy_mode =3D 0;
>>> +	struct dwc3 *dwc =3D dev_get_drvdata(hcd->self.controller->parent);
>>> +	struct xhci_hcd	*xhci_hcd =3D hcd_to_xhci(hcd);
>>> +
>>> +	dwc->hs_phy_mode =3D 0;
>>> +
>>> +	reg =3D readl(&xhci_hcd->cap_regs->hcs_params1);
>>> +	num_ports =3D HCS_MAX_PORTS(reg);
>> there's a big assumption here that xhci is still alive. Why isn't this
>> quirk implemented in xhci-plat itself?
>>
>>> +int xhci_dwc3_suspend_quirk(struct usb_hcd *hcd)
>> who calls this?
> This will be called from=20
> xhci_plat_suspend->xhci_priv_suspend_quirk->xhci_dwc3_suspend_quirk

So xhci.ko calls a function from dwc3.ko? That sounds odd, doesn't it?
It really looks like we're just finding ways to bypass the driver
layering, rather than working with it.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCP25IRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUg8cQgAgcA1k7PlPRRhtSjXfbru+EOxg/E+uu1U
NwLMJ9rbbmh/BvV0HU/z+5dKAYX9lo20ftf4iRUPqsduA0UpmCEw68SNOYH9IMQj
JVAfYOYcelrGXtem7womqEBERSJylQLThCUyI4AFYqLXSjFjcf+VvtAGuDB38s0X
9FY5k/KHDfDGlkJlFzfsrRfAMZugBEIOYLcsZOMQnUy/nZ2Q+DYillN0nMB0TZt1
D7+3ZzHQm2JeeiCG2VGDFUubyo31Ax6qP5sWgquRZrVjzXxp8oYdrYUbun11H9FD
Y12JFzQ2UzLO3m2ZX9eB9+7317WxtyL/kWDjTY8kkkD8KNe4GZ46EA==
=FazS
-----END PGP SIGNATURE-----
--=-=-=--
