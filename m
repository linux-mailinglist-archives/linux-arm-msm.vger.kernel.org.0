Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03F0F37F91E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 15:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234171AbhEMNum (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 09:50:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:56546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230508AbhEMNum (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 09:50:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 405F5613D3;
        Thu, 13 May 2021 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620913772;
        bh=phBFwesI6LoPB/FzWyu6jtVbaIjj25q55QDNPJoXfVU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=dWkKpQiuHXjyiVEUOBmkp2lNVNXuq/t/dO1M40CsbH+LVDzZhjJYejlpy/Pz1NPXs
         MyrzaF79RRM7PJjs2U/hfZRoNQILumq/lfkuU9WtPLqDC5QJFvDNVX8DyGDzuX0pWW
         FXLirCs6Er7OjWOALgg14PCYOQUBrvAd+oJAUfB0exG+UqGF8nNRXR6coJ04wMxBZz
         AA524aHHICj6S6N4f04YDm2C8OoJf/Rug2BAp0kbHMVwnTeRrD+jmNQuH0S/kwWraZ
         ju/PhrmhvxvIKwhrWd2bV358HVfWx3lKArYU5a0wO5XNi+/mrhuwlZ3dtivZr2NE4p
         n3U6a14cZ2oUQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v7 5/5] usb: dwc3: qcom: Keep power domain on to support
 wakeup
In-Reply-To: <YJxxbe9L3+VBEqno@google.com>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
 <1619586716-8687-6-git-send-email-sanm@codeaurora.org>
 <87lf92k9ms.fsf@kernel.org> <YJxxbe9L3+VBEqno@google.com>
Date:   Thu, 13 May 2021 16:49:19 +0300
Message-ID: <87tun67nhc.fsf@kernel.org>
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

Matthias Kaehlcke <mka@chromium.org> writes:
>> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>> > If wakeup capable devices are connected to the controller (directly
>> > or through hubs) at suspend time keep the power domain on in order
>> > to support wakeup from these devices.
>> >
>> > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>> > ---
>> >  drivers/usb/dwc3/dwc3-qcom.c | 17 +++++++++++++++++
>> >  1 file changed, 17 insertions(+)
>> >
>> > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom=
.c
>> > index 82125bc..1e220af 100644
>> > --- a/drivers/usb/dwc3/dwc3-qcom.c
>> > +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> > @@ -17,9 +17,11 @@
>> >  #include <linux/of_platform.h>
>> >  #include <linux/platform_device.h>
>> >  #include <linux/phy/phy.h>
>> > +#include <linux/pm_domain.h>
>> >  #include <linux/usb/of.h>
>> >  #include <linux/reset.h>
>> >  #include <linux/iopoll.h>
>> > +#include <linux/usb/hcd.h>
>> >=20=20
>> >  #include "core.h"
>> >=20=20
>> > @@ -354,10 +356,19 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *q=
com)
>> >  {
>> >  	u32 val;
>> >  	int i, ret;
>> > +	struct dwc3 *dwc =3D platform_get_drvdata(qcom->dwc3);
>> > +	struct usb_hcd  *hcd;
>> > +	struct generic_pm_domain *genpd =3D pd_to_genpd(qcom->dev->pm_domain=
);
>> >=20=20
>> >  	if (qcom->is_suspended)
>> >  		return 0;
>> >=20=20
>> > +	if (dwc->xhci) {
>> > +		hcd =3D platform_get_drvdata(dwc->xhci);
>> > +		if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
>> > +			genpd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;
>> > +	}
>>=20
>> wow, you really need to find a way to do these things generically
>> instead of bypassing a bunch of layers and access stuff $this doesn't
>> directly own.
>>
>> I'm gonna say 'no' to this, sorry. It looks like xhci should, directly,
>> learn about much of this instead of hiding it 3-layers deep into the
>> dwc3 glue layer for your specific SoC.
>
> Maybe this could be addressed with a pair of wakeup quirks, one for suspe=
nd,
> another for resume. An optional genpd field could be added to struct
> xhci_plat_priv. The wakeup quirks would set/clear GENPD_FLAG_ACTIVE_WAKEUP
> of the genpd.
>
> Does the above sound more palatable?

I don't get why you need quirk flags. All you're doing here is:

	if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
        	genpd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;

If you move this test to xhci_suspend(), you shouldn't need all the
magic, right?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCdLl8RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUj2tQf+K+dP5MpCwBqSYUdMgtA1zQSdmvkXLPGS
Wax1dNP9TJpEuCn5YKhnIvVrfFoEqjtZyiuPFC2T47XZzxNitOELldM8VcU9GSX6
9p+mdAGImL431lmjyn71VoRuTSQZyusSYodnsVMS5C4G0JYufRTnb7MJ3LQ8ICdv
pKSAY3M/59Iey6xKPtajgoYa15GmyuqnFpc2eyW1i9K4fcRgZXyPcZgacARElYT6
dCrYk5HHD3qdHtYF0D2pk0vGGedc+FN80mCZ8l9+WZ581ExQ/CaiDCrfNY16OuMS
ct/49vVMplt8JFrZODjrYBLffl0IunPFr21jrLB9JmunRDpqS8MSZw==
=Wl3O
-----END PGP SIGNATURE-----
--=-=-=--
